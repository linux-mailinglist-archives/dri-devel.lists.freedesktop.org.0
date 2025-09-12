Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FE9B54F4A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 15:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CD610EC3E;
	Fri, 12 Sep 2025 13:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="eWiGdfQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB9310EC41
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 13:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757683250; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hgSLmHC1mngmlTgnMVeds9Xh9XfXEN4PCU65111xK+Ab60I4NV3EydDaGFV/PjtVJ8c0ouVDkTmt8LZ1geiNQHAMbjEj2AAiSM0wcdidWw1XAPkkc8gtgAf0Tjdcmcmr/H2QY3HIrF/mSfOojOFYaucx3kGkndzizsXBRL4inNo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757683250;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wqI1aYTufIjQg92YSjrqQHTVALdsVlBfXTMyPMo2ZqY=; 
 b=Q3tN5fvlw4y0JDM0DH9VauAonQCgmfmq4WHm6qSR1hu9bpkLRHV5W8bZtj0dg8xmJXS5z9uuCadN+Nz+2V5lgYfi8Ld5BQJgGcpF3V1WLa2Oi7wi6LFtGr9McFtI1+CNtf1aHSz+VpsbeT/VavQUjsI0NlvSnfVpCv1W0UmGhhw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757683250; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=wqI1aYTufIjQg92YSjrqQHTVALdsVlBfXTMyPMo2ZqY=;
 b=eWiGdfQ+JFQVMrySuz82RHpW8IMj0YFgtJe+qNUpz5rYLdOFv2MzkmQU1jIJY4AS
 8vkWgZjSHEAjjudik0or5TP2/4H68Zj4QP5fGWCFZtiRr8ImNCCwY5Q8ROF7rLGSZQ0
 Ntm5YBwuFApdgmr8JIkGfbHOPfDGljQGe3dkIoG0=
Received: by mx.zohomail.com with SMTPS id 1757683248816245.66024872275716;
 Fri, 12 Sep 2025 06:20:48 -0700 (PDT)
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
Subject: [PATCH v3 3/4] drm/panfrost: Expose JM context IOCTLs to UM
Date: Fri, 12 Sep 2025 14:19:14 +0100
Message-ID: <20250912132002.304187-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912132002.304187-1-adrian.larumbe@collabora.com>
References: <20250912132002.304187-1-adrian.larumbe@collabora.com>
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
uAPI. On top of that, let UM know about the available priorities so that
they can create contexts with legal priority values.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 36 ++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index be384b18e8fd..69e72a800cd1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -109,6 +109,14 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 #endif
 		break;
 
+	case DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES:
+		param->value = BIT(PANFROST_JM_CTX_PRIORITY_LOW) |
+			       BIT(PANFROST_JM_CTX_PRIORITY_MEDIUM);
+
+		if (panfrost_high_prio_allowed(file))
+			param->value |= BIT(PANFROST_JM_CTX_PRIORITY_HIGH);
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -286,9 +294,6 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->jm_ctx_handle)
-		return -EINVAL;
-
 	if (!args->jc)
 		return -EINVAL;
 
@@ -552,6 +557,27 @@ static int panfrost_ioctl_set_label_bo(struct drm_device *ddev, void *data,
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
+	if (args->pad)
+		return -EINVAL;
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
@@ -619,6 +645,8 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(JM_CTX_CREATE,	jm_ctx_create,	DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(JM_CTX_DESTROY,	jm_ctx_destroy,	DRM_RENDER_ALLOW),
 };
 
 static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
@@ -715,6 +743,8 @@ static void panfrost_debugfs_init(struct drm_minor *minor)
  * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
  *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries
  * - 1.4 - adds SET_LABEL_BO
+ * - 1.5 - adds JM_CTX_{CREATE,DESTROY} ioctls and extend SUBMIT to allow
+ *	   context creation with configurable priorities/affinity
  */
 static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
-- 
2.51.0

