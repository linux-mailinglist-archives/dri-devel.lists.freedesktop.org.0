Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FA06624D5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E408410E3F4;
	Mon,  9 Jan 2023 11:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04D910E3F4;
 Mon,  9 Jan 2023 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7dSte2z1Mtl2v4PoQpzRSMquyCqk8sCGcS1bqRC+NmM=; b=IArct7bkaTCqF1aanZh1iKAr9D
 o0Ejbs1vdOEqIDGiqkPEXvKfiHOUkCrNhM4X2UjsHYwgEZx4Kgz4NzSIjbNZs6928IOQ87ZEk1ZtA
 qNjFhQkqIJ2HlbDqXQCdLspVbx9i3ufw3VxaOFhEZCwcAtZ/NLA/Boi2DWg/S2PpXzQtAjCCrMLF5
 saSkbJvq03ieB+J/LWJdHIPyGUuBPvafT+NGZIABPJgY+JovVGUSC6Ndvuxu1Y3JPP7G6QKNjNiDU
 gw7rXVVbT9fMnsS82Z6T2vCbrpGikAElb6eq7vZTbnCnVAbr/kry7Gm1ljhApFD3Qs47Z7l2IhMy/
 WsQgSXBw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEqlj-003LkJ-Bk; Mon, 09 Jan 2023 12:56:47 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Emma Anholt <emma@anholt.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v2 3/7] drm/arc: use new debugfs device-centered functions
Date: Mon,  9 Jan 2023 08:55:17 -0300
Message-Id: <20230109115520.40088-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109115520.40088-1-mcanal@igalia.com>
References: <20230109115520.40088-1-mcanal@igalia.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_file() function, which centers the debugfs files
management on the drm_device instead of drm_minor. Moreover, remove the
debugfs_init hook and add the debugfs files directly on arcpgu_probe(),
before drm_dev_register().

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 611bbee15071..88ceaf8c869c 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -335,11 +335,10 @@ static int arcpgu_unload(struct drm_device *drm)
 	return 0;
 }
 
-#ifdef CONFIG_DEBUG_FS
-static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
+static int __maybe_unused arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *drm = entry->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
 	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
@@ -349,18 +348,6 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	return 0;
 }
 
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
-#endif
-
 static const struct drm_driver arcpgu_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.name = "arcpgu",
@@ -371,9 +358,6 @@ static const struct drm_driver arcpgu_drm_driver = {
 	.patchlevel = 0,
 	.fops = &arcpgu_drm_ops,
 	DRM_GEM_DMA_DRIVER_OPS,
-#ifdef CONFIG_DEBUG_FS
-	.debugfs_init = arcpgu_debugfs_init,
-#endif
 };
 
 static int arcpgu_probe(struct platform_device *pdev)
@@ -390,6 +374,8 @@ static int arcpgu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	drm_debugfs_add_file(&arcpgu->drm, "clocks", arcpgu_show_pxlclock, NULL);
+
 	ret = drm_dev_register(&arcpgu->drm, 0);
 	if (ret)
 		goto err_unload;
-- 
2.39.0

