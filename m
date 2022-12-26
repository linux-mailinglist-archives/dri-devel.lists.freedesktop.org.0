Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802FC6563E9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 16:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA1F10E13A;
	Mon, 26 Dec 2022 15:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243C610E13A;
 Mon, 26 Dec 2022 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S+8GLqhBxZmxLiHQRo6IYE0Qn7cawY8cH2s3+D0vP1w=; b=AeQ9maYObSMNrqxbsUYpICEL3M
 1IAvesfrGmAWCzL6BSe7hz1hfw6lqLpCsNQd8pYLatMAK/vQJRDXeBHdswoI4wrVqPx6hPfxTk+8H
 42T+lS6Aa+1ohtn6PkjBseHHudZDOfA8P7srIjwdL560FXFCgVTXlqz2iS4o2kNLkpEJwZhbIQ7ZU
 H0o1CPw27gvwqN8NE5dYtqf0Vhvx/H5SVi+19Usy1MAYBt4Qw5YKRaebC86wtL1Gvmv9eCX1VIig9
 La4QzRektNpMMlwLGkUHKlKIdbazn4303RhCun0Oi1e/fkVrlh99VICi5ZEmm31UalI4atMgMEKXG
 p+ip06Iw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p9pls-00AXBr-Ho; Mon, 26 Dec 2022 16:52:13 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] drm/pl111: use new debugfs device-centered functions
Date: Mon, 26 Dec 2022 12:50:24 -0300
Message-Id: <20221226155029.244355-5-mcanal@igalia.com>
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
debugfs_init hook and add the debugfs files directly on pl111_amba_probe(),
before drm_dev_register().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/pl111/pl111_debugfs.c | 15 ++++-----------
 drivers/gpu/drm/pl111/pl111_drm.h     |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c     |  6 ++----
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_debugfs.c b/drivers/gpu/drm/pl111/pl111_debugfs.c
index 6744fa16f464..458f69e5435e 100644
--- a/drivers/gpu/drm/pl111/pl111_debugfs.c
+++ b/drivers/gpu/drm/pl111/pl111_debugfs.c
@@ -32,8 +32,8 @@ static const struct {
 
 static int pl111_debugfs_regs(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct pl111_drm_dev_private *priv = dev->dev_private;
 	int i;
 
@@ -46,14 +46,7 @@ static int pl111_debugfs_regs(struct seq_file *m, void *unused)
 	return 0;
 }
 
-static const struct drm_info_list pl111_debugfs_list[] = {
-	{"regs", pl111_debugfs_regs, 0},
-};
-
-void
-pl111_debugfs_init(struct drm_minor *minor)
+void pl111_debugfs_init(struct drm_device *drm)
 {
-	drm_debugfs_create_files(pl111_debugfs_list,
-				 ARRAY_SIZE(pl111_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_file(drm, "regs", pl111_debugfs_regs, NULL);
 }
diff --git a/drivers/gpu/drm/pl111/pl111_drm.h b/drivers/gpu/drm/pl111/pl111_drm.h
index 2a46b5bd8576..7fe74be917f1 100644
--- a/drivers/gpu/drm/pl111/pl111_drm.h
+++ b/drivers/gpu/drm/pl111/pl111_drm.h
@@ -157,6 +157,6 @@ struct pl111_drm_dev_private {
 
 int pl111_display_init(struct drm_device *dev);
 irqreturn_t pl111_irq(int irq, void *data);
-void pl111_debugfs_init(struct drm_minor *minor);
+void pl111_debugfs_init(struct drm_device *drm);
 
 #endif /* _PL111_DRM_H_ */
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 00deba0b7271..c031eb4abc0d 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -228,10 +228,6 @@ static const struct drm_driver pl111_drm_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = pl111_gem_import_sg_table,
 	.gem_prime_mmap = drm_gem_prime_mmap,
-
-#if defined(CONFIG_DEBUG_FS)
-	.debugfs_init = pl111_debugfs_init,
-#endif
 };
 
 static int pl111_amba_probe(struct amba_device *amba_dev,
@@ -304,6 +300,8 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	if (ret != 0)
 		goto dev_put;
 
+	pl111_debugfs_init(drm);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret < 0)
 		goto dev_put;
-- 
2.38.1

