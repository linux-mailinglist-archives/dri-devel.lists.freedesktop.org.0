Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E482E7A7A60
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF4410E48C;
	Wed, 20 Sep 2023 11:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6FD10E484
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:25:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D727F1FF9C;
 Wed, 20 Sep 2023 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695209111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FklN7FgOieAM+RqRuqakrVoRnco73GVSVrqzoaYlB/M=;
 b=CHB1S3b4dTM+M/k8CG0jKmp/P7LWgy9PjGliIAz8YxAMLaL/O9HgdkHFET0JwltZrmTAQk
 XDnPxK1JkaUKueiCRjRjeVAprVo0np38d3pOhMAcwMpmile2QZsstpFxgcqCrKn9I1wk82
 tghORPbGETDximwG2BhZ9Q7WF+LTE9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695209111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FklN7FgOieAM+RqRuqakrVoRnco73GVSVrqzoaYlB/M=;
 b=XH7S9WRNoYuVx7UJ76uYswE4XRuCeIoqouxr4Em8UqueGPBQNpSXfjn73Uu8lEauwZYb3U
 a/ygvuxcGflSpKDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A12601333E;
 Wed, 20 Sep 2023 11:25:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gM9mJpfWCmX3NwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 11:25:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH 6/8] drm/ofdrm: Preallocate xfrm buffer in plane's atomic_check
Date: Wed, 20 Sep 2023 13:10:18 +0200
Message-ID: <20230920112508.11770-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920112508.11770-1-tzimmermann@suse.de>
References: <20230920112508.11770-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Preallocate the xfrm buffer's storage in the plane's atomic_check
function if a format conversion will be necessary. Allows the update
to fail if no memory is available. Avoids the same allocation within
atomic_update, which may not fail.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/ofdrm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 08e4b04e0590e..d81b986f5cbc6 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -759,6 +759,8 @@ static const uint64_t ofdrm_primary_plane_format_modifiers[] = {
 static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						   struct drm_atomic_state *new_state)
 {
+	struct drm_device *dev = plane->dev;
+	struct ofdrm_device *odev = ofdrm_device_of_dev(dev);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
 	struct drm_framebuffer *new_fb = new_plane_state->fb;
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
@@ -778,6 +780,15 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (!new_plane_state->visible)
 		return 0;
 
+	if (new_fb->format != odev->format) {
+		void *buf;
+
+		/* format conversion necessary; reserve buffer */
+		buf = drm_xfrm_buf_reserve(&odev->xfrm, odev->pitch, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+
 	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
 
 	new_ofdrm_crtc_state = to_ofdrm_crtc_state(new_crtc_state);
-- 
2.42.0

