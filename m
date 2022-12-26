Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9986563E5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 16:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CBC10E036;
	Mon, 26 Dec 2022 15:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4933010E08D;
 Mon, 26 Dec 2022 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ovYu3O6J/03o6FRSeZBXYjTQnhI8+HeH3STrFxD4fqo=; b=q6Y2ynNG9Hqvk3GBR5TbozENdA
 tokY4kYGNRQTgj3V4qFoAAM0Ppk2hHnlSKALYuQ5z2Iro6G1Duy9yge28CQGvKOvrZeQaZ12v8THZ
 xgTLVC/7xEzYa1qJezouE+D1i0Z6FDi87WtRTBBf0q+ef7lMMm+VjnJ9vtMitt71c0uGaKo4fbfR9
 7Cuuf+4vVqWjG1fcrS5Z0aCkpTyU1tHyeOvcy8kPJv1VPbz/STlgu1hNzAsiEWv+u/ZDxuP3JB9uC
 O7ZYeg72Q5ERXtbg+++geXfml80M+qLb0Z7O3dy0IqWet2W0WUyJzc7qzuX7zeH21QueeNP+5CmCH
 scFpab5g==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p9plN-00AXBr-Hs; Mon, 26 Dec 2022 16:51:42 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] drm/etnaviv: use new debugfs device-centered functions
Date: Mon, 26 Dec 2022 12:50:21 -0300
Message-Id: <20221226155029.244355-2-mcanal@igalia.com>
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
debugfs_init hook and add the debugfs files directly on etnaviv_bind(),
before drm_dev_register().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 29 +++++++++++----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 1d2b4fb4bcf8..2b265460672e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -191,22 +191,22 @@ static int etnaviv_ring_show(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 static int show_unlocked(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	int (*show)(struct drm_device *dev, struct seq_file *m) =
-			node->info_ent->data;
+			entry->file.data;
 
 	return show(dev, m);
 }
 
 static int show_each_gpu(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct etnaviv_drm_private *priv = dev->dev_private;
 	struct etnaviv_gpu *gpu;
 	int (*show)(struct etnaviv_gpu *gpu, struct seq_file *m) =
-			node->info_ent->data;
+			entry->file.data;
 	unsigned int i;
 	int ret = 0;
 
@@ -223,20 +223,13 @@ static int show_each_gpu(struct seq_file *m, void *arg)
 	return ret;
 }
 
-static struct drm_info_list etnaviv_debugfs_list[] = {
+static struct drm_debugfs_info etnaviv_debugfs_list[] = {
 		{"gpu", show_each_gpu, 0, etnaviv_gpu_debugfs},
 		{"gem", show_unlocked, 0, etnaviv_gem_show},
 		{ "mm", show_unlocked, 0, etnaviv_mm_show },
 		{"mmu", show_each_gpu, 0, etnaviv_mmu_show},
 		{"ring", show_each_gpu, 0, etnaviv_ring_show},
 };
-
-static void etnaviv_debugfs_init(struct drm_minor *minor)
-{
-	drm_debugfs_create_files(etnaviv_debugfs_list,
-				 ARRAY_SIZE(etnaviv_debugfs_list),
-				 minor->debugfs_root, minor);
-}
 #endif
 
 /*
@@ -478,9 +471,6 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
 	.gem_prime_mmap     = drm_gem_prime_mmap,
-#ifdef CONFIG_DEBUG_FS
-	.debugfs_init       = etnaviv_debugfs_init,
-#endif
 	.ioctls             = etnaviv_ioctls,
 	.num_ioctls         = DRM_ETNAVIV_NUM_IOCTLS,
 	.fops               = &fops,
@@ -534,6 +524,11 @@ static int etnaviv_bind(struct device *dev)
 
 	load_gpu(drm);
 
+#ifdef CONFIG_DEBUG_FS
+	drm_debugfs_add_files(drm, etnaviv_debugfs_list,
+			      ARRAY_SIZE(etnaviv_debugfs_list));
+#endif
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto out_unbind;
-- 
2.38.1

