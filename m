Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C9097ECE4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 16:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA9010E3FD;
	Mon, 23 Sep 2024 14:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="auYP99y+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E2510E3FD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 14:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0yWXomFm4lnRcDdVbeZIXRlTcn6hLV+l4NUVjdGyg/s=; b=auYP99y+dih0vT8+VC+WNXmhrr
 /JKLlO3Ckmi50qoq77aVLA2dSq66FIZ0agIyqqycwE6kN5ggWZbGsJWXCpL6wF0FF1avYuENNTE0b
 EhlMpR38cMfhiFng2r1jgOqSxnOvJvT+pxr4quoiUMYrQG9K4XBmXU7iUOuJNofV+sWZarRLN3POq
 BPhnbm18fMJhGBUSrMfT+PBMbHKRSlbB1UxEPkPR445I4vUgHCvYao+qhRy5hYkjnbw6jOF/4bB3R
 fu62ldumN/hWYTzn9MMzvOyj8g1P6vCPE6TBzxAS2Eegy2hE59vVbKwdjCrsJ3GtdVfGwRDOCEU7P
 JBmd98Gw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ssjq8-00HYyM-Ey; Mon, 23 Sep 2024 16:15:01 +0200
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
Subject: [PATCH v6 10/11] drm/v3d: Add modparam for turning off Big/Super Pages
Date: Mon, 23 Sep 2024 10:55:14 -0300
Message-ID: <20240923141348.2422499-11-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923141348.2422499-1-mcanal@igalia.com>
References: <20240923141348.2422499-1-mcanal@igalia.com>
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

