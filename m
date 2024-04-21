Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570798AC14F
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 23:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6FD112585;
	Sun, 21 Apr 2024 21:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="s3W0xWYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B92112584
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9vox/2l58IcxASSd09IlHXviPXoo98abDsDOC4qoO/E=; b=s3W0xWYqaURReY9iFQOMHI0R32
 VW/uldaI+cnQjfMe0c1RRf0X5Fzvx2r/mgGrf3KbZSIg/8WwLjEdXzTDfo/5ehGLp9hrMgPytBGtN
 jdeyOnqj9Gn31mu84RqhW6DhCi1c2TUBCsAuSthynSIwW/Y9+egYh1CPJhR/PGAfkLlRod9+PlxiF
 nI25A0DJMyZGIvi3R3AyaxpNHRycuLso/EJJckk0M8sISMi3oVVYCpZVLONSmgfExmoRVX3rer4xI
 uAaDhncoOL2Qyx3isdDGHVIVnqhJvFsHZO1T51sDGMg7MrGaRvTfRN0zaELFw3UmncRdkSJO5pxk0
 H2HsH/2A==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ryf8J-0072SJ-Ol; Sun, 21 Apr 2024 23:54:00 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 8/8] drm/v3d: Add modparam for turning off Big/Super Pages
Date: Sun, 21 Apr 2024 18:44:26 -0300
Message-ID: <20240421215309.660018-9-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240421215309.660018-1-mcanal@igalia.com>
References: <20240421215309.660018-1-mcanal@igalia.com>
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
 drivers/gpu/drm/v3d/v3d_drv.c   | 8 ++++++++
 drivers/gpu/drm/v3d/v3d_gemfs.c | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 3debf37e7d9b..bc8c8905112a 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -36,6 +36,14 @@
 #define DRIVER_MINOR 0
 #define DRIVER_PATCHLEVEL 0
 
+bool super_pages = true;
+
+/* Only expose the `super_pages` modparam if THP is enabled. */
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+module_param_named(super_pages, super_pages, bool, 0400);
+MODULE_PARM_DESC(super_pages, "Enable/Disable Super Pages support.");
+#endif
+
 static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file_priv)
 {
diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
index 31cf5bd11e39..5fa08263cff2 100644
--- a/drivers/gpu/drm/v3d/v3d_gemfs.c
+++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
@@ -11,6 +11,11 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
 	char huge_opt[] = "huge=within_size";
 	struct file_system_type *type;
 	struct vfsmount *gemfs;
+	extern bool super_pages;
+
+	/* The user doesn't want to enable Super Pages */
+	if (!super_pages)
+		goto err;
 
 	/*
 	 * By creating our own shmemfs mountpoint, we can pass in
-- 
2.44.0

