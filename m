Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D479EB42DF3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 02:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC5910E337;
	Thu,  4 Sep 2025 00:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="froM0MCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90DA10E220
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 00:11:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756944685; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=N2bQZzz13q3iMscvkin2kI7Uq11GmE9beV5PgjAcUN1cJ7gb39eFIsNgNCbA0fZqN9Gh1XESoS9lLXIG0HDT4WDTYqvbDJkqb3vLbme9Kt1uZCRcy7MpZuo60m8Vv0CTHb4mnVkZqgypYHrvRt9gwVL5xk+K19Mfjpn5ubMBLIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756944685;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=otWiVgtc18RY1UJfOMiuxGdZjobASfgryTIT49krwdQ=; 
 b=IhULJFIQC2nJMcfqbj5j+dC933SA9iiCr0NaAYfa71SLKtjdogmLZfOO9i5XEi6y8KjKg4CDkGG+A/Joh9Gva0VDDszO45l8kLpeg3ke46KLTvW/SVhG1z5nC+29vD2R5nfn3Cy1apmpADryJgfQd3luLReraCAnaiOHzgAxrwA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756944685; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=otWiVgtc18RY1UJfOMiuxGdZjobASfgryTIT49krwdQ=;
 b=froM0MCtfE4Q8CB486zEC7JwFNhKHsUjzh0fsHvz0rp0V/GNRGtlHB2bYxGtQg2c
 uhI0NCFQJDUrjSAfLcaZJL0TwYzRcpIBZvzTtuIRKAYjRq9BQK6HYy9mR/WGTNDMIs/
 EzUOl3o5xA37c9QpRZUmes6KBsJOU6xurbFqnv0E=
Received: by mx.zohomail.com with SMTPS id 17569446843332.1747246224515493;
 Wed, 3 Sep 2025 17:11:24 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 3/4] drm/panfrost: Expose JM context IOCTLs to UM
Date: Thu,  4 Sep 2025 01:08:01 +0100
Message-ID: <20250904001054.147465-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904001054.147465-1-adrian.larumbe@collabora.com>
References: <20250904001054.147465-1-adrian.larumbe@collabora.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

Minor revision of the driver must be bumped because this expands the
uAPI. On top of that, let user know the available priorities so that
they can create contexts with legal priority values.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 35 +++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 398c067457d9..02f704ec4961 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <drm/panfrost_drm.h>
+#include <drm/drm_auth.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
@@ -109,6 +110,15 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 #endif
 		break;
 
+	case DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES:
+		param->value = BIT(PANFROST_JM_CTX_PRIORITY_LOW) |
+			       BIT(PANFROST_JM_CTX_PRIORITY_MEDIUM);
+
+		/* High prio require CAP_SYS_NICE or DRM_MASTER */
+		if (capable(CAP_SYS_NICE) || drm_is_current_master(file))
+			param->value |= BIT(PANFROST_JM_CTX_PRIORITY_HIGH);
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -295,8 +305,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 			return -ENODEV;
 	}
 
-	/* TODO: Use the default JM context until ctx management IOCTLs are exposed */
-	jm_ctx = panfrost_jm_ctx_from_handle(file, 0);
+	jm_ctx = panfrost_jm_ctx_from_handle(file, args->jm_ctx_handle);
 	if (!jm_ctx) {
 		ret = -EINVAL;
 		goto out_put_syncout;
@@ -547,6 +556,24 @@ static int panfrost_ioctl_set_label_bo(struct drm_device *ddev, void *data,
 	return ret;
 }
 
+static int panfrost_ioctl_jm_ctx_create(struct drm_device *dev, void *data,
+					struct drm_file *file)
+{
+	return panfrost_jm_ctx_create(file, data);
+}
+
+static int panfrost_ioctl_jm_ctx_destroy(struct drm_device *dev, void *data,
+					 struct drm_file *file)
+{
+	const struct drm_panfrost_jm_ctx_destroy *args = data;
+
+	/* We can't destroy the default context created when the file is opened. */
+	if (!args->handle)
+		return -EINVAL;
+
+	return panfrost_jm_ctx_destroy(file, args->handle);
+}
+
 int panfrost_unstable_ioctl_check(void)
 {
 	if (!unstable_ioctls)
@@ -614,6 +641,8 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(JM_CTX_CREATE,	jm_ctx_create,	DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(JM_CTX_DESTROY,	jm_ctx_destroy,	DRM_RENDER_ALLOW),
 };
 
 static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
@@ -710,6 +739,8 @@ static void panfrost_debugfs_init(struct drm_minor *minor)
  * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
  *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries
  * - 1.4 - adds SET_LABEL_BO
+ * - 1.5 - adds JM_CTX_{CREATE,DESTROY} ioctls and extend SUBMIT to allow
+ *	   context creation with configurable priorities/affinity
  */
 static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
-- 
2.50.0

