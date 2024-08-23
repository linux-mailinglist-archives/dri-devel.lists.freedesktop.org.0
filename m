Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD3E95CCA6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 14:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAE110E586;
	Fri, 23 Aug 2024 12:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2169910E57A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 12:44:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ABA9220317;
 Fri, 23 Aug 2024 12:44:26 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75ADE13A61;
 Fri, 23 Aug 2024 12:44:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GKaPGyqEyGbKVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Aug 2024 12:44:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/10] drm/bochs: Validate display modes against available
 video memory
Date: Fri, 23 Aug 2024 14:28:52 +0200
Message-ID: <20240823124422.286989-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823124422.286989-1-tzimmermann@suse.de>
References: <20240823124422.286989-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: ABA9220317
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For each mode, test the required memory against the available video
memory. Filters out modes that do not fit into display memory.

Also remove the old test against the 4 MiB limit. It is now obsolete
and did not necessarily produce correct results.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/bochs.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index bde70a6075ec..b09c6c76923b 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -558,8 +558,28 @@ static const struct drm_connector_funcs bochs_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static enum drm_mode_status bochs_mode_config_mode_valid(struct drm_device *dev,
+							 const struct drm_display_mode *mode)
+{
+	struct bochs_device *bochs = to_bochs_device(dev);
+	const struct drm_format_info *format = drm_format_info(DRM_FORMAT_XRGB8888);
+	uint64_t pitch;
+
+	if (drm_WARN_ON(dev, !format))
+		return MODE_ERROR;
+
+	pitch = drm_format_info_min_pitch(format, 0, mode->vdisplay);
+	if (!pitch)
+		return MODE_BAD_WIDTH;
+	if (bochs->fb_size / pitch < mode->hdisplay)
+		return MODE_MEM;
+
+	return MODE_OK;
+}
+
 static const struct drm_mode_config_funcs bochs_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create_with_dirty,
+	.mode_valid = bochs_mode_config_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
@@ -687,15 +707,8 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 {
 	struct bochs_device *bochs;
 	struct drm_device *dev;
-	unsigned long fbsize;
 	int ret;
 
-	fbsize = pci_resource_len(pdev, 0);
-	if (fbsize < 4 * 1024 * 1024) {
-		DRM_ERROR("less than 4 MB video memory, ignoring device\n");
-		return -ENOMEM;
-	}
-
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &bochs_driver);
 	if (ret)
 		return ret;
-- 
2.46.0

