Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2988C001C
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 16:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03DE112DD6;
	Wed,  8 May 2024 14:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="muSRXLbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE911112D42
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PlQP6DTVfjWH4jfAsH+nfNGdL6XE6fPuvp6m++y6kS4=; b=muSRXLbPEyIwfP41MgTuWrJNMZ
 38WOMXu1qFaLGJIX/A3EElk52WV2u3oEWbQ4rZ9m7r+vi4l+gQKflWdS+719Lg4khWHVUTOWgUeoT
 1smv1CoMXbbLKGtXbExcNkZqZKuq/IWX3Y5Dey4YpvqXH/Qm4VRzlGkPRTqM6bwqb2sTV1b6SIlje
 bEd2mKmx4YsXvL8+sPiRKVm/3LbSjkP44988i9Bib4Sla3sMAVe0WjKPEu/ZaBTge1CNpd6J03J5L
 Wv4QYp6NCTkBWku1y1SG62EY0NozVIPOJsOgrmUZ3o2FEsS/tET8imhlItpkczM4g9QOyxH87jsFz
 E8cf/Vgg==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4iNy-002ogv-Uz; Wed, 08 May 2024 16:35:11 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 =?UTF-8?q?Juan=20A=20=2E=20Su=C3=A1rez?= <jasuarez@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 4/6] drm/v3d: Create new IOCTL to expose performance counters
 information
Date: Wed,  8 May 2024 11:30:46 -0300
Message-ID: <20240508143306.2435304-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508143306.2435304-2-mcanal@igalia.com>
References: <20240508143306.2435304-2-mcanal@igalia.com>
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

Userspace usually needs some information about the performance counters
available. Although we could replicate this information in the kernel
and user-space, let's use the kernel as the "single source of truth" to
avoid issues in the future (e.g. list of performance counters is updated
in user-space, but not in the kernel, generating invalid requests).

Therefore, create a new IOCTL to expose the performance counters
information, that is name, category, and description.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c     |  1 +
 drivers/gpu/drm/v3d/v3d_drv.h     |  2 ++
 drivers/gpu/drm/v3d/v3d_perfmon.c | 33 +++++++++++++++++++++++++++
 include/uapi/drm/v3d_drm.h        | 37 +++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index d2c1d5053132..f7477488b1cc 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -211,6 +211,7 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_DESTROY, v3d_perfmon_destroy_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_VALUES, v3d_perfmon_get_values_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(V3D_SUBMIT_CPU, v3d_submit_cpu_ioctl, DRM_RENDER_ALLOW | DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_COUNTER, v3d_perfmon_get_counter_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver v3d_drm_driver = {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index bd1e38f7d10a..44cfddedebde 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -582,6 +582,8 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file_priv);
 int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv);
+int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
+				  struct drm_file *file_priv);
 
 /* v3d_sysfs.c */
 int v3d_sysfs_init(struct device *dev);
diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index f268d9466c0f..73e2bb8bdb7f 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -217,3 +217,36 @@ int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 
 	return ret;
 }
+
+int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
+				  struct drm_file *file_priv)
+{
+	struct drm_v3d_perfmon_get_counter *req = data;
+	struct v3d_dev *v3d = to_v3d_dev(dev);
+	const struct v3d_perf_counter_desc *counter;
+
+	for (int i = 0; i < ARRAY_SIZE(req->reserved); i++) {
+		if (req->reserved[i] != 0)
+			return -EINVAL;
+	}
+
+	/* Make sure that the counter ID is valid */
+	if (req->counter >= v3d->max_counters)
+		return -EINVAL;
+
+	if (v3d->ver >= 71) {
+		WARN_ON(v3d->max_counters != ARRAY_SIZE(v3d_v71_performance_counters));
+		counter = &v3d_v71_performance_counters[req->counter];
+	} else if (v3d->ver >= 42) {
+		WARN_ON(v3d->max_counters != ARRAY_SIZE(v3d_v42_performance_counters));
+		counter = &v3d_v42_performance_counters[req->counter];
+	} else {
+		return -EOPNOTSUPP;
+	}
+
+	strscpy(req->name, counter->name, sizeof(req->name));
+	strscpy(req->category, counter->category, sizeof(req->category));
+	strscpy(req->description, counter->description, sizeof(req->description));
+
+	return 0;
+}
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 215b01bb69c3..0860ddb3d0b6 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -42,6 +42,7 @@ extern "C" {
 #define DRM_V3D_PERFMON_DESTROY                   0x09
 #define DRM_V3D_PERFMON_GET_VALUES                0x0a
 #define DRM_V3D_SUBMIT_CPU                        0x0b
+#define DRM_V3D_PERFMON_GET_COUNTER               0x0c
 
 #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
 #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_WAIT_BO, struct drm_v3d_wait_bo)
@@ -58,6 +59,8 @@ extern "C" {
 #define DRM_IOCTL_V3D_PERFMON_GET_VALUES  DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_GET_VALUES, \
 						   struct drm_v3d_perfmon_get_values)
 #define DRM_IOCTL_V3D_SUBMIT_CPU          DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CPU, struct drm_v3d_submit_cpu)
+#define DRM_IOCTL_V3D_PERFMON_GET_COUNTER DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_GET_COUNTER, \
+						   struct drm_v3d_perfmon_get_counter)
 
 #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
 #define DRM_V3D_SUBMIT_EXTENSION		  0x02
@@ -718,6 +721,40 @@ struct drm_v3d_perfmon_get_values {
 	__u64 values_ptr;
 };
 
+#define DRM_V3D_PERFCNT_MAX_NAME 64
+#define DRM_V3D_PERFCNT_MAX_CATEGORY 32
+#define DRM_V3D_PERFCNT_MAX_DESCRIPTION 256
+
+/**
+ * struct drm_v3d_perfmon_get_counter - ioctl to get the description of a
+ * performance counter
+ *
+ * As userspace needs to retrieve information about the performance counters
+ * available, this IOCTL allows users to get information about a performance
+ * counter (name, category and description).
+ */
+struct drm_v3d_perfmon_get_counter {
+	/*
+	 * Counter ID
+	 *
+	 * Must be smaller than the maximum number of performance counters, which
+	 * can be retrieve through DRM_V3D_PARAM_MAX_PERF_COUNTERS.
+	 */
+	__u8 counter;
+
+	/* Name of the counter */
+	__u8 name[DRM_V3D_PERFCNT_MAX_NAME];
+
+	/* Category of the counter */
+	__u8 category[DRM_V3D_PERFCNT_MAX_CATEGORY];
+
+	/* Description of the counter */
+	__u8 description[DRM_V3D_PERFCNT_MAX_DESCRIPTION];
+
+	/* mbz */
+	__u8 reserved[7];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.44.0

