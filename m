Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F9B95CCAA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 14:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBF310E588;
	Fri, 23 Aug 2024 12:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEBA10E586
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 12:44:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E4AEE20313;
 Fri, 23 Aug 2024 12:44:25 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC9C01333E;
 Fri, 23 Aug 2024 12:44:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aJb2KCmEyGbKVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Aug 2024 12:44:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/10] drm/bochs: Allocate DRM device in struct bochs_device
Date: Fri, 23 Aug 2024 14:28:49 +0200
Message-ID: <20240823124422.286989-7-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: E4AEE20313
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

Allocate an instance of struct drm_device in struct bochs_device. Also
remove all uses of dev_private from bochs and upcast from the embedded
instance if necessary.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/bochs.c | 52 +++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 61b2b7aa03cb..5679f1b090af 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -71,6 +71,8 @@ enum bochs_types {
 };
 
 struct bochs_device {
+	struct drm_device dev;
+
 	/* hw */
 	void __iomem   *mmio;
 	int            ioports;
@@ -87,14 +89,13 @@ struct bochs_device {
 	u32 bpp;
 
 	/* drm */
-	struct drm_device *dev;
 	struct drm_simple_display_pipe pipe;
 	struct drm_connector connector;
 };
 
 static struct bochs_device *to_bochs_device(const struct drm_device *dev)
 {
-	return (struct bochs_device *)dev->dev_private;
+	return container_of(dev, struct bochs_device, dev);
 }
 
 /* ---------------------------------------------------------------------- */
@@ -211,7 +212,7 @@ static const struct drm_edid *bochs_hw_read_edid(struct drm_connector *connector
 
 static int bochs_hw_init(struct bochs_device *bochs)
 {
-	struct drm_device *dev = bochs->dev;
+	struct drm_device *dev = &bochs->dev;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned long addr, size, mem, ioaddr, iosize;
 	u16 id;
@@ -306,7 +307,7 @@ static void bochs_hw_setmode(struct bochs_device *bochs, struct drm_display_mode
 {
 	int idx;
 
-	if (!drm_dev_enter(bochs->dev, &idx))
+	if (!drm_dev_enter(&bochs->dev, &idx))
 		return;
 
 	bochs->xres = mode->hdisplay;
@@ -342,7 +343,7 @@ static void bochs_hw_setformat(struct bochs_device *bochs, const struct drm_form
 {
 	int idx;
 
-	if (!drm_dev_enter(bochs->dev, &idx))
+	if (!drm_dev_enter(&bochs->dev, &idx))
 		return;
 
 	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
@@ -373,7 +374,7 @@ static void bochs_hw_setbase(struct bochs_device *bochs, int x, int y, int strid
 	unsigned long offset;
 	unsigned int vx, vy, vwidth, idx;
 
-	if (!drm_dev_enter(bochs->dev, &idx))
+	if (!drm_dev_enter(&bochs->dev, &idx))
 		return;
 
 	bochs->stride = stride;
@@ -488,7 +489,7 @@ static const struct drm_connector_funcs bochs_connector_connector_funcs = {
 
 static void bochs_connector_init(struct bochs_device *bochs)
 {
-	struct drm_device *dev = bochs->dev;
+	struct drm_device *dev = &bochs->dev;
 	struct drm_connector *connector = &bochs->connector;
 
 	drm_connector_init(dev, connector, &bochs_connector_connector_funcs,
@@ -506,23 +507,24 @@ static const struct drm_mode_config_funcs bochs_mode_funcs = {
 
 static int bochs_kms_init(struct bochs_device *bochs)
 {
+	struct drm_device *dev = &bochs->dev;
 	int ret;
 
-	ret = drmm_mode_config_init(bochs->dev);
+	ret = drmm_mode_config_init(dev);
 	if (ret)
 		return ret;
 
-	bochs->dev->mode_config.max_width = 8192;
-	bochs->dev->mode_config.max_height = 8192;
+	dev->mode_config.max_width = 8192;
+	dev->mode_config.max_height = 8192;
 
-	bochs->dev->mode_config.preferred_depth = 24;
-	bochs->dev->mode_config.prefer_shadow = 0;
-	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
+	dev->mode_config.preferred_depth = 24;
+	dev->mode_config.prefer_shadow = 0;
+	dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 
-	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
+	dev->mode_config.funcs = &bochs_mode_funcs;
 
 	bochs_connector_init(bochs);
-	drm_simple_display_pipe_init(bochs->dev,
+	drm_simple_display_pipe_init(dev,
 				     &bochs->pipe,
 				     &bochs_pipe_funcs,
 				     bochs_formats,
@@ -530,7 +532,7 @@ static int bochs_kms_init(struct bochs_device *bochs)
 				     NULL,
 				     &bochs->connector);
 
-	drm_mode_config_reset(bochs->dev);
+	drm_mode_config_reset(dev);
 
 	return 0;
 }
@@ -538,17 +540,11 @@ static int bochs_kms_init(struct bochs_device *bochs)
 /* ---------------------------------------------------------------------- */
 /* drm interface                                                          */
 
-static int bochs_load(struct drm_device *dev)
+static int bochs_load(struct bochs_device *bochs)
 {
-	struct bochs_device *bochs;
+	struct drm_device *dev = &bochs->dev;
 	int ret;
 
-	bochs = drmm_kzalloc(dev, sizeof(*bochs), GFP_KERNEL);
-	if (bochs == NULL)
-		return -ENOMEM;
-	dev->dev_private = bochs;
-	bochs->dev = dev;
-
 	ret = bochs_hw_init(bochs);
 	if (ret)
 		return ret;
@@ -606,6 +602,7 @@ static const struct dev_pm_ops bochs_pm_ops = {
 
 static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
+	struct bochs_device *bochs;
 	struct drm_device *dev;
 	unsigned long fbsize;
 	int ret;
@@ -620,9 +617,10 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&bochs_driver, &pdev->dev);
-	if (IS_ERR(dev))
+	bochs = devm_drm_dev_alloc(&pdev->dev, &bochs_driver, struct bochs_device, dev);
+	if (IS_ERR(bochs))
 		return PTR_ERR(dev);
+	dev = &bochs->dev;
 
 	ret = pcim_enable_device(pdev);
 	if (ret)
@@ -630,7 +628,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 
 	pci_set_drvdata(pdev, dev);
 
-	ret = bochs_load(dev);
+	ret = bochs_load(bochs);
 	if (ret)
 		goto err_free_dev;
 
-- 
2.46.0

