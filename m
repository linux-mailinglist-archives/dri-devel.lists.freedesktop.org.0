Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B31C968565
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 12:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECCD10E28A;
	Mon,  2 Sep 2024 10:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7EC10E284
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 10:55:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BCD7E1FBA6;
 Mon,  2 Sep 2024 10:55:49 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84F4613A7C;
 Mon,  2 Sep 2024 10:55:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WGM0H7WZ1WZQcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Sep 2024 10:55:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/10] drm/bochs: Pass bochs device to various functions
Date: Mon,  2 Sep 2024 12:53:42 +0200
Message-ID: <20240902105546.792625-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902105546.792625-1-tzimmermann@suse.de>
References: <20240902105546.792625-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BCD7E1FBA6
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Avoid upcasting from struct drm_device by passing the bochs device
directly to functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/tiny/bochs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 5d09b4cb28ed..acb2652577d4 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -204,9 +204,9 @@ static const struct drm_edid *bochs_hw_read_edid(struct drm_connector *connector
 	return drm_edid_read_custom(connector, bochs_get_edid_block, bochs);
 }
 
-static int bochs_hw_init(struct drm_device *dev)
+static int bochs_hw_init(struct bochs_device *bochs)
 {
-	struct bochs_device *bochs = dev->dev_private;
+	struct drm_device *dev = bochs->dev;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned long addr, size, mem, ioaddr, iosize;
 	u16 id;
@@ -481,9 +481,9 @@ static const struct drm_connector_funcs bochs_connector_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static void bochs_connector_init(struct drm_device *dev)
+static void bochs_connector_init(struct bochs_device *bochs)
 {
-	struct bochs_device *bochs = dev->dev_private;
+	struct drm_device *dev = bochs->dev;
 	struct drm_connector *connector = &bochs->connector;
 
 	drm_connector_init(dev, connector, &bochs_connector_connector_funcs,
@@ -516,7 +516,7 @@ static int bochs_kms_init(struct bochs_device *bochs)
 
 	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
 
-	bochs_connector_init(bochs->dev);
+	bochs_connector_init(bochs);
 	drm_simple_display_pipe_init(bochs->dev,
 				     &bochs->pipe,
 				     &bochs_pipe_funcs,
@@ -544,7 +544,7 @@ static int bochs_load(struct drm_device *dev)
 	dev->dev_private = bochs;
 	bochs->dev = dev;
 
-	ret = bochs_hw_init(dev);
+	ret = bochs_hw_init(bochs);
 	if (ret)
 		return ret;
 
-- 
2.46.0

