Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD809645EA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 15:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F38410E67B;
	Thu, 29 Aug 2024 13:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="N1MPPvjv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AD810E67C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 13:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0yWXomFm4lnRcDdVbeZIXRlTcn6hLV+l4NUVjdGyg/s=; b=N1MPPvjvNNMtWqjrTjuNVS44cN
 ejNbESYh7ChHnePXttBM/i84ZmmNyDz1tGpmTnzGurnP6O51gPs/woea10ln4bCMTQzU/YR1fCMED
 EE42Tajeup/c+YM6TnJGnde9bu9hpGDlCZTxIpn5j7cQk++wyljX1rgDPXuWVcq6R/fl0+ukQ50EZ
 XglX5qzCV6XjSmoh9J0K3nPgVt5cUgBf1pxsQyxfVr0hOHt+INqbP7x5jnZe8Ski1jkk6p1Kuw9Ct
 rdTqjFca3GeHdXkoP8JIherF5Bh1Hv/NawaVjJybxfecoFJbHY7xgAc26XkzDjXYI6f4xVdKC5iXl
 5PUPInZA==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sjevn-006jlG-2c; Thu, 29 Aug 2024 15:11:19 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v5 10/10] drm/v3d: Add modparam for turning off Big/Super Pages
Date: Thu, 29 Aug 2024 10:05:18 -0300
Message-ID: <20240829130954.2439316-11-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829130954.2439316-1-mcanal@igalia.com>
References: <20240829130954.2439316-1-mcanal@igalia.com>
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
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 7 +++++++
 drivers/gpu/drm/v3d/v3d_drv.h   | 1 +
 drivers/gpu/drm/v3d/v3d_gemfs.c | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index d7ff1f5fa481..8be8c6dd9b35 100644
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
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index a98543290fa8..de73eefff9ac 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -539,6 +539,7 @@ void v3d_invalidate_caches(struct v3d_dev *v3d);
 void v3d_clean_caches(struct v3d_dev *v3d);
 
 /* v3d_gemfs.c */
+extern bool super_pages;
 void v3d_gemfs_init(struct v3d_dev *v3d);
 void v3d_gemfs_fini(struct v3d_dev *v3d);
 
diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
index 31cf5bd11e39..4c5e18590a5c 100644
--- a/drivers/gpu/drm/v3d/v3d_gemfs.c
+++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
@@ -20,6 +20,10 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
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
2.46.0

