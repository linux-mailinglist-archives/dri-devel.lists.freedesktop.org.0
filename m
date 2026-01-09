Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B81D0A382
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 14:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080BA10E8B5;
	Fri,  9 Jan 2026 13:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Hcyb3BER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6A910E28A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 13:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767964095;
 bh=Ie+GWOXmocDEBiX/FxTUZqCUnfmhXKxoZgzrVZZakAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hcyb3BERlO40cRXCRlJkZ6YrsaxH+H4jHSMnhbkaW6MRDs55c1BUiM3v7JikDwJ4r
 6H+7TJORWvQmKLIR9YgDIKRmNwJLR65Jx830r/ljC6dAU4WJHzMb0th+EMG2TiPpcf
 q4bFOmP2PWImPlTl3sZUbpAaLj2wj1Td8jTa6ZtD5oAzl+wmvttcD6Zw2Kd1FAVViB
 ZN4X8cRM4is2CRsbN7qBSykvqn0KLXkqc1M4+Jx4sQW9o8DHXhpe7fzAYMBfooHTYc
 JYAuLW8xlVgr7nW7T6LDLfruVOqARe7zX+u19/4imsek6gk+x5TqsNO9/jyo0qG7Rp
 EP5tqEeygLntg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6670217E1520;
 Fri,  9 Jan 2026 14:08:14 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: [PATCH v1 3/9] drm/panthor: Move panthor_gems_debugfs_init() to
 panthor_gem.c
Date: Fri,  9 Jan 2026 14:07:55 +0100
Message-ID: <20260109130801.1239558-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109130801.1239558-1-boris.brezillon@collabora.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no reason for panthor_drv to know about panthor_gem.c internals,
so let's move the GEM debugfs init logic to panthor_gem.c.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 26 +-----------------------
 drivers/gpu/drm/panthor/panthor_gem.c | 29 +++++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_gem.h |  3 +--
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 165dddfde6ca..52c27a60c84a 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1635,34 +1635,10 @@ static const struct file_operations panthor_drm_driver_fops = {
 };
 
 #ifdef CONFIG_DEBUG_FS
-static int panthor_gems_show(struct seq_file *m, void *data)
-{
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
-
-	panthor_gem_debugfs_print_bos(ptdev, m);
-
-	return 0;
-}
-
-static struct drm_info_list panthor_debugfs_list[] = {
-	{"gems", panthor_gems_show, 0, NULL},
-};
-
-static int panthor_gems_debugfs_init(struct drm_minor *minor)
-{
-	drm_debugfs_create_files(panthor_debugfs_list,
-				 ARRAY_SIZE(panthor_debugfs_list),
-				 minor->debugfs_root, minor);
-
-	return 0;
-}
-
 static void panthor_debugfs_init(struct drm_minor *minor)
 {
 	panthor_mmu_debugfs_init(minor);
-	panthor_gems_debugfs_init(minor);
+	panthor_gem_debugfs_init(minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index b61908fd508a..13e9dd3764fa 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -9,6 +9,8 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
 #include <drm/drm_print.h>
 #include <drm/panthor_drm.h>
 
@@ -683,8 +685,8 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 		totals->reclaimable += resident_size;
 }
 
-void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
-				   struct seq_file *m)
+static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
+					  struct seq_file *m)
 {
 	struct gem_size_totals totals = {0};
 	struct panthor_gem_object *bo;
@@ -704,4 +706,27 @@ void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
 	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
 		   totals.size, totals.resident, totals.reclaimable);
 }
+
+static int panthor_gem_show_bos(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct panthor_device *ptdev =
+		container_of(dev, struct panthor_device, base);
+
+	panthor_gem_debugfs_print_bos(ptdev, m);
+
+	return 0;
+}
+
+static struct drm_info_list panthor_gem_debugfs_list[] = {
+	{ "gems", panthor_gem_show_bos, 0, NULL },
+};
+
+void panthor_gem_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(panthor_gem_debugfs_list,
+				 ARRAY_SIZE(panthor_gem_debugfs_list),
+				 minor->debugfs_root, minor);
+}
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 22519c570b5a..94b2d17cf032 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -203,8 +203,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
 #ifdef CONFIG_DEBUG_FS
-void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
-				   struct seq_file *m);
+void panthor_gem_debugfs_init(struct drm_minor *minor);
 #endif
 
 #endif /* __PANTHOR_GEM_H__ */
-- 
2.52.0

