Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C3A8B4BD4
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 14:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B41C10FE8D;
	Sun, 28 Apr 2024 12:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cC+8WftQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329B410FF5B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 12:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZRDcXdv+0cKx3QrJ89xEGoEn4zBktGRbKD8M2+ZvA8A=; b=cC+8WftQ1SwZRapmVq0gSwsv61
 s0v5TwHmWyc7K7o0l45vXaP3fIGkuXvtJAUMemPb7eEjJJPENpZEBdJPjGSFbAWtiHVIzefEOZe/K
 D/UG17gwpSJZ/QvNQ0tmJj00wXIMDl2vBbhAEVc9GEFpT/JtLDn4akfEoCpzC4uXgaeFwvU2P4xd/
 xJbG3juialvHNw2A59FVkIoE5MNZWrC1kG3q3DCrnS/tYCm9UOSPsRB5OVjWNhYgxxlkUqooA0a/i
 o3A0O26PzovwvvULIUiVvOAToFC8anFxcCNPOw8vx9/P6XlZszZ1ZsQvnoOdcrf1W7uEexJpotvYl
 1d5wpJFA==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s13uG-000rbP-7N; Sun, 28 Apr 2024 14:45:24 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 8/8] drm/v3d: Add modparam for turning off Big/Super Pages
Date: Sun, 28 Apr 2024 09:40:13 -0300
Message-ID: <20240428124426.309096-9-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240428124426.309096-1-mcanal@igalia.com>
References: <20240428124426.309096-1-mcanal@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a modparam for turning off Big/Super Pages to make sure that if an
user doesn't want Big/Super Pages enabled, it can disabled it by setting
the modparam to false.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 7 +++++++
 drivers/gpu/drm/v3d/v3d_gemfs.c | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 28b7ddce7747..1a6e01235df6 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -36,6 +36,13 @@
 #define DRIVER_MINOR 0
 #define DRIVER_PATCHLEVEL 0
 
+/* Only expose the `super_pages` modparam if THP is enabled. */
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+bool super_pages = true;
+module_param_named(super_pages, super_pages, bool, 0400);
+MODULE_PARM_DESC(super_pages, "Enable/Disable Super Pages support.");
+#endif
+
 static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file_priv)
 {
diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
index 31cf5bd11e39..0ade02bb7209 100644
--- a/drivers/gpu/drm/v3d/v3d_gemfs.c
+++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
@@ -11,6 +11,7 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
 	char huge_opt[] = "huge=within_size";
 	struct file_system_type *type;
 	struct vfsmount *gemfs;
+	extern bool super_pages;
 
 	/*
 	 * By creating our own shmemfs mountpoint, we can pass in
@@ -20,6 +21,10 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
 	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
 		goto err;
 
+	/* The user doesn't want to enable Super Pages */
+	if (!super_pages)
+		goto err;
+
 	type = get_fs_type("tmpfs");
 	if (!type)
 		goto err;
-- 
2.44.0

