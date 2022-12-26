Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030466563E8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 16:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221F710E13F;
	Mon, 26 Dec 2022 15:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E8210E13F;
 Mon, 26 Dec 2022 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0LSeLroT+4iYVUyGWLQGxKN0jHFcT9Gxb+4qzoP5J+A=; b=s7CSeUDHOhaOAF/3BILTnVdW+m
 5VIVUpOdRfJNr19KiBV8XBKoSK7ptAgrKBOiTe8F1Ad0+uKKOylZM/Cw/XXQTCo781/2jIupDaKcI
 3VseF4uL2Qofcly4fWKTpm4MbvTfzEaem/jn/dHXRFscprDDKJBIxBKTf0MsWCU4tFkyH3PbpkCuQ
 W4C4yM01NXLoeQ9xukczSYOga3kY0eB67kpwqCjfn5lNxMZpt6mQqNpz1lDT9EbKR8Z1poFrC3JpT
 Anwqldl4kTYagiP1i20MoT0x+e5EXb6o5zAGnVJY9mKFSTShI2Mb6ZZJu7hF3B4cQhD+6ePt3TefM
 FaMcbR0Q==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p9plg-00AXBr-Ae; Mon, 26 Dec 2022 16:52:01 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] drm/arm/hdlcd: use new debugfs device-centered functions
Date: Mon, 26 Dec 2022 12:50:23 -0300
Message-Id: <20221226155029.244355-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221226155029.244355-1-mcanal@igalia.com>
References: <20221226155029.244355-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Liviu Dudau <liviu.dudau@arm.com>, etnaviv@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 noralf@tronnes.org, Gerd Hoffmann <kraxel@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which center the debugfs files
management on the drm_device instead of drm_minor. Moreover, remove the
debugfs_init hook and add the debugfs files directly on hdlcd_drm_bind(),
before drm_dev_register().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 7043d1c9ed8f..e3507dd6f82a 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -195,8 +195,8 @@ static int hdlcd_setup_mode_config(struct drm_device *drm)
 #ifdef CONFIG_DEBUG_FS
 static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *drm = entry->dev;
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 
 	seq_printf(m, "underrun : %d\n", atomic_read(&hdlcd->buffer_underrun_count));
@@ -208,8 +208,8 @@ static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
 
 static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *drm = entry->dev;
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 	unsigned long clkrate = clk_get_rate(hdlcd->clk);
 	unsigned long mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
@@ -219,17 +219,10 @@ static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
 	return 0;
 }
 
-static struct drm_info_list hdlcd_debugfs_list[] = {
+static struct drm_debugfs_info hdlcd_debugfs_list[] = {
 	{ "interrupt_count", hdlcd_show_underrun_count, 0 },
 	{ "clocks", hdlcd_show_pxlclock, 0 },
 };
-
-static void hdlcd_debugfs_init(struct drm_minor *minor)
-{
-	drm_debugfs_create_files(hdlcd_debugfs_list,
-				 ARRAY_SIZE(hdlcd_debugfs_list),
-				 minor->debugfs_root, minor);
-}
 #endif
 
 DEFINE_DRM_GEM_DMA_FOPS(fops);
@@ -237,9 +230,6 @@ DEFINE_DRM_GEM_DMA_FOPS(fops);
 static const struct drm_driver hdlcd_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	DRM_GEM_DMA_DRIVER_OPS,
-#ifdef CONFIG_DEBUG_FS
-	.debugfs_init = hdlcd_debugfs_init,
-#endif
 	.fops = &fops,
 	.name = "hdlcd",
 	.desc = "ARM HDLCD Controller DRM",
@@ -303,6 +293,10 @@ static int hdlcd_drm_bind(struct device *dev)
 	drm_mode_config_reset(drm);
 	drm_kms_helper_poll_init(drm);
 
+#ifdef CONFIG_DEBUG_FS
+	drm_debugfs_add_files(drm, hdlcd_debugfs_list, ARRAY_SIZE(hdlcd_debugfs_list));
+#endif
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_register;
-- 
2.38.1

