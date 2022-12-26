Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BBB6563EC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 16:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D2D10E19F;
	Mon, 26 Dec 2022 15:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FCE10E1C2;
 Mon, 26 Dec 2022 15:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/kZMLPqQnBN8PK+NTipJKTw+jAOXbJ78l4KtMYdcI1I=; b=bmtntYHbu51SuuWqOk02JYIKIh
 EeAVKEi4LQN8uLcUR088djajJp8Kyuju5ZKB1gFveA/G1gGI8mcQ0GMCT1dm4qZ1PVqAX3+H01O/p
 NPWjOysfQfFZVbeiahMiF0rHAhlafzgmb6QPPi70+QMu5+6CNjg7gFU/IFSiKLJValEtgmSKTKaAc
 SQE214nyfah6VLadxcVJ5p9g6zH4yL8qIq/WsWNQmhM2eEbjs3tRuiidbNetubTLOhvb/gpxWpOjG
 gnf/iiP3fenG/XGvZ/sddxv/KNQV9Z3NBywwf+/A345XuM0YXmttdkZ0ckP0Ix17aWSDgZdZEzWka
 NuHaO+jA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p9pm2-00AXBr-Iu; Mon, 26 Dec 2022 16:52:23 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] drm/arc: use new debugfs device-centered functions
Date: Mon, 26 Dec 2022 12:50:25 -0300
Message-Id: <20221226155029.244355-6-mcanal@igalia.com>
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
drm_debugfs_add_file() function, which center the debugfs files
management on the drm_device instead of drm_minor. Moreover, remove the
debugfs_init hook and add the debugfs files directly on arcpgu_probe(),
before drm_dev_register().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 611bbee15071..b074a0b4c7b3 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -338,8 +338,8 @@ static int arcpgu_unload(struct drm_device *drm)
 #ifdef CONFIG_DEBUG_FS
 static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *drm = entry->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
 	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
@@ -348,17 +348,6 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	seq_printf(m, "mode: %lu\n", mode_clock);
 	return 0;
 }
-
-static struct drm_info_list arcpgu_debugfs_list[] = {
-	{ "clocks", arcpgu_show_pxlclock, 0 },
-};
-
-static void arcpgu_debugfs_init(struct drm_minor *minor)
-{
-	drm_debugfs_create_files(arcpgu_debugfs_list,
-				 ARRAY_SIZE(arcpgu_debugfs_list),
-				 minor->debugfs_root, minor);
-}
 #endif
 
 static const struct drm_driver arcpgu_drm_driver = {
@@ -371,9 +360,6 @@ static const struct drm_driver arcpgu_drm_driver = {
 	.patchlevel = 0,
 	.fops = &arcpgu_drm_ops,
 	DRM_GEM_DMA_DRIVER_OPS,
-#ifdef CONFIG_DEBUG_FS
-	.debugfs_init = arcpgu_debugfs_init,
-#endif
 };
 
 static int arcpgu_probe(struct platform_device *pdev)
@@ -390,6 +376,10 @@ static int arcpgu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+#ifdef CONFIG_DEBUG_FS
+	drm_debugfs_add_file(&arcpgu->drm, "clocks", arcpgu_show_pxlclock, NULL);
+#endif
+
 	ret = drm_dev_register(&arcpgu->drm, 0);
 	if (ret)
 		goto err_unload;
-- 
2.38.1

