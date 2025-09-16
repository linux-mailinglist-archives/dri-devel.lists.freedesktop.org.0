Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7409B5A1D6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 22:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075D910E781;
	Tue, 16 Sep 2025 20:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VPv5jw5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8CC10E781
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 20:07:56 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b54a8c2eb5cso4681152a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 13:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758053276; x=1758658076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=JVy9IJbUt8NSG5ndvXlAVaLeRJY3F9ksUD0wGwN4LFQ=;
 b=VPv5jw5l8Pb/4IsxtRXzOV2EYM/BGq/1NJ3/V/ehYK4tsnP1Ra6q6u0vjYqUmlvjkb
 wW44ulOuAobC8rPVe2tGBU7lH+tpeGjT7meieRR0paRVkOPqtALRQSVsrNcQ/hCl4ltv
 aE6xvWHaVzcvz5fTaH+I6UGhloKRprxwqjpRVkejgF+X3B1cW//1EnnDvB9L+k8etTh8
 0fAXAyzzpmncWD96I5dLTnzb0wRdrOHEkP2qzqiisMkbwVSRHg6mi1fs8lMey+vRFDia
 EQXc23AKKuSHZizHRKSYxO7nGBZI8KZqraBMYjSsfyWpAQAwAyoBUAIKG+uz+3ijWIMD
 Io+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758053276; x=1758658076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVy9IJbUt8NSG5ndvXlAVaLeRJY3F9ksUD0wGwN4LFQ=;
 b=u51Yjw2TUuUDfhoGx6/oN4tlhse2Yr0is3UeDSzseVoqIvdUv4wiwOwmCJOMAhkgTK
 Tqth1sjd/HrWq9zaPZ0fu37CM9x8upgyitVcfpfNMe8F2BDaXfhxBDXRVcUfDi21zS6o
 y3NgCqnh/YRy/9TVpG7DnhrpfV+asA1GYcnfEitQu9wbcSLlAFz2QCFEhFtZpMtGcr3f
 XQCg1IFVsYOZUv0IP2faRDm/A6pOOa+JhpCaifwvQGdMDalh4nR1QpN144gAtBnKY3rm
 RjRoODAaieqmpHP+UMDT0Ts2qRDeYmG48bcoIC4b8gWxXKMAvG+dTO0NSVWMdGdnTPC9
 g1xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv4zl/VbuULT5E4HzqiBgGLkB4AinQKJgGZNOmSkVnJPG6cqApyES6YSgu7336HBpV0b6EfJnOM10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGYLQU8mXJYohWu2xG5pclDPhd87M8D/dw5zVbzInNlB0RNIDe
 fJJn+mLzFbPIjN9aiF79QivvNlQiWhsuKYS8G8Um6cxfbzX4o9+D6i7IAHGAdT7V
X-Gm-Gg: ASbGncsfJG8PWhLUiWsMxCg8NnxYqyI34rysyIodGpYERCVXuYGjAcZuEjGBi5Nxpkl
 7JDnV/E7sBnYbCFGIQd8dFWJKnaqwVB6qF0AkN7b5QOEZthZ43e3U2zn5p0qcKAW99H1JQDpYki
 PqY/4+jGIUE5SWJcXET+oOjQoM3/60y3AojL3GOevs4/yqvVnCXBAd6N8c7oMSNrDPl5fIgv0pZ
 b/LunmVodvmbSdx7aKuwQU2iGIcMv71qWknoJm/FkWAsxYhWnmh0L/U3dPiLIo5xD5o+2zu65Sj
 dbbLERIFeCqRegnXEaVEn6l4JQljBdDgEoXbALHWply/e64zDB3bAEBONx74m+Z1T3uBr+wI8Sf
 OX61b5aUVfQ7VuTvAAKVbK0ikUVDbgS61mI5+e+ZkrKylUxAssvIMA7RqQcvupybvFZ76C4GKdZ
 NRFT1ZWupt5g==
X-Google-Smtp-Source: AGHT+IGhe7iEA8JDYWw15YUB8w09Fjtdaq1h4k0rGkJNG0xT/1Yl/OuAgfJg8eLoRX64JJKJCO9vzg==
X-Received: by 2002:a17:902:ea10:b0:24e:bdfa:112b with SMTP id
 d9443c01a7336-25d289e9988mr189662935ad.61.1758053275706; 
 Tue, 16 Sep 2025 13:07:55 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-25d9c3feca6sm137518715ad.95.2025.09.16.13.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:07:55 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: add query for calibrated timstamp info
Date: Tue, 16 Sep 2025 13:07:51 -0700
Message-ID: <20250916200751.3999354-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
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

DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO provides a way to query
and calibrate CPU and GPU timestamps.

This is needed because CPU and GPU timestamps are captured separately.
The implementation makes an effort to minimize the capture duration,
which is crucial for calibration and not exactly feasible from
userspace.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

---
The query is inspired by xe's DRM_XE_DEVICE_QUERY_ENGINE_CYCLES and the
naming is inspired by VK_KHR_calibrated_timestamps. The userspace change
is https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37424.
---
 drivers/gpu/drm/panthor/panthor_drv.c | 88 ++++++++++++++++++++++++++-
 include/uapi/drm/panthor_drm.h        | 31 ++++++++++
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index fdbe89ef7f43c..06da6dcf016ef 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -13,6 +13,7 @@
 #include <linux/pagemap.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/sched/clock.h>
 #include <linux/time64.h>
 
 #include <drm/drm_auth.h>
@@ -172,6 +173,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_timestamp_info, current_timestamp), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_group_priorities_info, pad), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_calibrated_timestamp_info, gpu_timestamp), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
@@ -779,6 +781,74 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
 	return 0;
 }
 
+static int panthor_query_calibrated_timestamp_info(
+	struct panthor_device *ptdev, const struct drm_panthor_calibrated_timestamp_info __user *in,
+	u32 in_size, struct drm_panthor_calibrated_timestamp_info *out)
+{
+	/* cpu_clockid and pad take up the first 8 bytes */
+	const u32 min_size = 8;
+	u64 (*cpu_timestamp)(void);
+	int ret;
+
+	if (in_size < min_size)
+		return -EINVAL;
+	if (!access_ok(in, min_size))
+		return -EFAULT;
+	ret = __get_user(out->cpu_clockid, &in->cpu_clockid);
+	if (ret)
+		return ret;
+	ret = __get_user(out->pad, &in->pad);
+	if (ret)
+		return ret;
+
+	switch (out->cpu_clockid) {
+	case CLOCK_MONOTONIC:
+		cpu_timestamp = ktime_get_ns;
+		break;
+	case CLOCK_MONOTONIC_RAW:
+		cpu_timestamp = ktime_get_raw_ns;
+		break;
+	case CLOCK_REALTIME:
+		cpu_timestamp = ktime_get_real_ns;
+		break;
+	case CLOCK_BOOTTIME:
+		cpu_timestamp = ktime_get_boottime_ns;
+		break;
+	case CLOCK_TAI:
+		cpu_timestamp = ktime_get_clocktai_ns;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (out->pad)
+		return -EINVAL;
+
+	ret = panthor_device_resume_and_get(ptdev);
+	if (ret)
+		return ret;
+
+	do {
+		const u32 hi = gpu_read(ptdev, GPU_TIMESTAMP + 4);
+
+		/* keep duration minimal */
+		preempt_disable();
+		out->duration = local_clock();
+		out->cpu_timestamp = cpu_timestamp();
+		out->gpu_timestamp = gpu_read(ptdev, GPU_TIMESTAMP);
+		out->duration = local_clock() - out->duration;
+		preempt_enable();
+
+		if (likely(hi == gpu_read(ptdev, GPU_TIMESTAMP + 4))) {
+			out->gpu_timestamp |= (u64)hi << 32;
+			break;
+		}
+	} while (true);
+
+	pm_runtime_put(ptdev->base.dev);
+	return 0;
+}
+
 static int group_priority_permit(struct drm_file *file,
 				 u8 priority)
 {
@@ -815,6 +885,7 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 	struct drm_panthor_dev_query *args = data;
 	struct drm_panthor_timestamp_info timestamp_info;
 	struct drm_panthor_group_priorities_info priorities_info;
+	struct drm_panthor_calibrated_timestamp_info calibrated_timestamp_info;
 	int ret;
 
 	if (!args->pointer) {
@@ -835,6 +906,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 			args->size = sizeof(priorities_info);
 			return 0;
 
+		case DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO:
+			args->size = sizeof(calibrated_timestamp_info);
+			return 0;
+
 		default:
 			return -EINVAL;
 		}
@@ -859,6 +934,16 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 		panthor_query_group_priorities_info(file, &priorities_info);
 		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
 
+	case DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO: {
+		ret = panthor_query_calibrated_timestamp_info(ptdev, u64_to_user_ptr(args->pointer),
+							      args->size,
+							      &calibrated_timestamp_info);
+		if (ret)
+			return ret;
+
+		return PANTHOR_UOBJ_SET(args->pointer, args->size, calibrated_timestamp_info);
+	}
+
 	default:
 		return -EINVAL;
 	}
@@ -1601,6 +1686,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
  * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
+ * - 1.6 - adds DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO query
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1614,7 +1700,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 5,
+	.minor = 6,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 467d365ed7ba7..7f3ff43f17952 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -243,6 +243,11 @@ enum drm_panthor_dev_query_type {
 	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
 	 */
 	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
+
+	/** @DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO: Query calibrated
+	 * timestamp information.
+	 */
+	DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO,
 };
 
 /**
@@ -402,6 +407,32 @@ struct drm_panthor_group_priorities_info {
 	__u8 pad[3];
 };
 
+/**
+ * struct drm_panthor_calibrated_timestamp_info - Calibrated timestamp information
+ *
+ * Structure grouping all queryable information relating to the calibrated timestamp.
+ */
+struct drm_panthor_calibrated_timestamp_info {
+	/** @clockid: The CPU clock id.
+	 *
+	 * Must be one of CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW,
+	 * CLOCK_REALTIME, CLOCK_BOOTTIME, or CLOCK_TAI.
+	 */
+	__s32 cpu_clockid;
+
+	/** @pad: MBZ. */
+	__u32 pad;
+
+	/** @duration: Duration for querying all timestamps in nanoseconds. */
+	__u64 duration;
+
+	/** @cpu_timestamp: The current CPU timestamp in nanoseconds. */
+	__u64 cpu_timestamp;
+
+	/** @gpu_timestamp: The current GPU timestamp in cycles. */
+	__u64 gpu_timestamp;
+};
+
 /**
  * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
  */
-- 
2.51.0.384.g4c02a37b29-goog

