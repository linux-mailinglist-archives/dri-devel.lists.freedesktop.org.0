Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F8AF8316
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBCA10E900;
	Thu,  3 Jul 2025 22:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=aaront.org header.i=@aaront.org header.b="dqoXjpFe";
	dkim=pass (2048-bit key; secure) header.d=aaront.org header.i=@aaront.org header.b="v/BVgkC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Thu, 03 Jul 2025 21:27:29 UTC
Received: from smtp-out0.aaront.org (smtp-out0.aaront.org [52.10.12.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E35710E8F5;
 Thu,  3 Jul 2025 21:27:29 +0000 (UTC)
Received: from smtp-send0.aaront.org (localhost [IPv6:::1])
 by smtp-out0.aaront.org (Postfix) with ESMTP id 4bY8mq5CtwzMY;
 Thu,  3 Jul 2025 21:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; d=aaront.org;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=3r7feyyp; bh=/kZmNYWZNOTJQa4opCPhE
 9MeAHI82FTFippa+nVrA1o=; b=dqoXjpFePZxdEULpDnRSc1iIU4UTydj/TLfKH
 HPMBaqlkHTLVMC3dGVYex9NVU6iBEYzQmXt8W7LxEMeYThhAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aaront.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=4x7dsrm2; bh=/kZmNYWZNOTJQa4opCPhE
 9MeAHI82FTFippa+nVrA1o=; b=v/BVgkC3yRTStqMBR2f8EZeF/HuMKVSqzUfqb
 HxVf5nKI7XyG5CgmhaI4PA6+MoQIVykqJYaxMC4e9JYhTBMI8Oh9/3O1B3vQAJzA
 yT2qo3NmNXZx/dWD34nULC8n6maD5SQR/xGNsh5iNgOJIrUxOV2McxS++VvkUKhq
 dUDyj0q+yqm1NV4nNraI9k9HuU/OO/G1hgnJsho3gpx3WQRKYpNqNhP26Cf+J6UW
 ZACEQtJm0eJV4qEn5NmRynCJAFU8SnrjpamGAqpqgz6HEktS8gABBh8nvkeNHtqe
 icIBqKWKHm0g67l8+0EPGXIG9g2CgVUc+/O3lNR0i3LQ2J98w==
Received: by smtp-send0.aaront.org (Postfix) id 4bY8mq323rzJm;
 Thu,  3 Jul 2025 21:20:11 +0000 (UTC)
From: Aaron Thompson <dev@aaront.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Aaron Thompson <dev@aaront.org>,
 stable@vger.kernel.org
Subject: [PATCH] drm/nouveau: Do not fail module init on debugfs errors
Date: Thu,  3 Jul 2025 21:19:49 +0000
Message-Id: <20250703211949.9916-1-dev@aaront.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Jul 2025 22:02:11 +0000
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

From: Aaron Thompson <dev@aaront.org>

If CONFIG_DEBUG_FS is enabled, nouveau_drm_init() returns an error if it
fails to create the "nouveau" directory in debugfs. One case where that
will happen is when debugfs access is restricted by
CONFIG_DEBUG_FS_ALLOW_NONE or by the boot parameter debugfs=off, which
cause the debugfs APIs to return -EPERM.

So just ignore errors from debugfs. Note that nouveau_debugfs_root may
be an error now, but that is a standard pattern for debugfs. From
include/linux/debugfs.h:

"NOTE: it's expected that most callers should _ignore_ the errors
returned by this function. Other debugfs functions handle the fact that
the "dentry" passed to them could be an error and they don't crash in
that case. Drivers should generally work fine even if debugfs fails to
init anyway."

Fixes: 97118a1816d2 ("drm/nouveau: create module debugfs root")
Cc: stable@vger.kernel.org
Signed-off-by: Aaron Thompson <dev@aaront.org>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 6 +-----
 drivers/gpu/drm/nouveau/nouveau_debugfs.h | 5 ++---
 drivers/gpu/drm/nouveau/nouveau_drm.c     | 4 +---
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 200e65a7cefc..c7869a639bef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -314,14 +314,10 @@ nouveau_debugfs_fini(struct nouveau_drm *drm)
 	drm->debugfs = NULL;
 }
 
-int
+void
 nouveau_module_debugfs_init(void)
 {
 	nouveau_debugfs_root = debugfs_create_dir("nouveau", NULL);
-	if (IS_ERR(nouveau_debugfs_root))
-		return PTR_ERR(nouveau_debugfs_root);
-
-	return 0;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.h b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
index b7617b344ee2..d05ed0e641c4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.h
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
@@ -24,7 +24,7 @@ extern void nouveau_debugfs_fini(struct nouveau_drm *);
 
 extern struct dentry *nouveau_debugfs_root;
 
-int  nouveau_module_debugfs_init(void);
+void nouveau_module_debugfs_init(void);
 void nouveau_module_debugfs_fini(void);
 #else
 static inline void
@@ -42,10 +42,9 @@ nouveau_debugfs_fini(struct nouveau_drm *drm)
 {
 }
 
-static inline int
+static inline void
 nouveau_module_debugfs_init(void)
 {
-	return 0;
 }
 
 static inline void
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 0c82a63cd49d..1527b801f013 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1461,9 +1461,7 @@ nouveau_drm_init(void)
 	if (!nouveau_modeset)
 		return 0;
 
-	ret = nouveau_module_debugfs_init();
-	if (ret)
-		return ret;
+	nouveau_module_debugfs_init();
 
 #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
 	platform_driver_register(&nouveau_platform_driver);

base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
-- 
2.39.5

