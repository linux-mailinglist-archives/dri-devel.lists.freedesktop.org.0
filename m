Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069C956520
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD55610E1E4;
	Mon, 19 Aug 2024 08:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="El8OcJ7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE9710E1E4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:02:55 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724054564; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d7dXlTJLid7xsC+QZFjdix6aydqyKVJhIXfvW+OVcBKK0X61EEA6xxJm2n1sa1FEMHsbaLGKBRFfgcj/RYu9ET7JmQVFyHdyGBRdSVsi0litOE4vIyJzmpzK/GLf9wzUJ6fFDHoIeALiF7Tvvov6UZMphSEKP5RhP1eyYIBpd4g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724054564;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FMGdiUWlsSaMtAviONF1MB/nVlk0jItnN0mLRSQtc5w=; 
 b=aSTcXedORF9U9M4F3hMqqyKOqedGnVgwZu5MU/8a0g0MWwSGjXadUIA64Rz1EmaE39/NEbKeJhVcXJMCHKsJST7RenivSOv2FOxKkl4HsOkpfLAOcJfonjh9xZOATrReQdraaIRBOP5atxhP6Y41BlCIintIZU79yeQJwvuiOlI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724054564; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=FMGdiUWlsSaMtAviONF1MB/nVlk0jItnN0mLRSQtc5w=;
 b=El8OcJ7tk8OnL2YW98r6HBraCrzS9F/j9/V6+51uXBMa/XpRrO6yz5WeZUSNRBJT
 xspE/I83XnN1AyK2AsLt/PNuP8jDgl6L/cMqn7lFjsfXP6UKrq/UTuaGZ9CFd1zfsJd
 z8+7grBPxxElc2KE1+LIOfmVLOsn4njbCyh2nQmo=
Received: by mx.zohomail.com with SMTPS id 1724054563190586.4427888975266;
 Mon, 19 Aug 2024 01:02:43 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/2] drm/panfrost: Add SYSTEM_TIMESTAMP and
 SYSTEM_TIMESTAMP_FREQUENCY parameters
Date: Mon, 19 Aug 2024 10:02:22 +0200
Message-ID: <20240819080224.24914-2-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819080224.24914-1-mary.guillemard@collabora.com>
References: <20240819080224.24914-1-mary.guillemard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Expose system timestamp and frequency supported by the GPU.

Mali uses an external timer as GPU system time. On ARM, this is wired to
the generic arch timer so we wire cntfrq_el0 as device frequency.

This new uAPI will be used in Mesa to implement timestamp queries and
VK_KHR_calibrated_timestamps.

v2:
- Rewrote to use GPU timestamp register
- Add missing include for arch_timer_get_cntfrq
- Rework commit message

v3:
- Move panfrost_cycle_counter_get and panfrost_cycle_counter_put to
  panfrost_ioctl_query_timestamp
- Handle possible overflow in panfrost_timestamp_read

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c  | 37 ++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c  | 12 ++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h  |  1 +
 drivers/gpu/drm/panfrost/panfrost_regs.h |  2 ++
 include/uapi/drm/panfrost_drm.h          |  2 ++
 5 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 671eed4ad890..790c4ad31143 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -3,6 +3,10 @@
 /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
 /* Copyright 2019 Collabora ltd. */
 
+#ifdef CONFIG_ARM_ARCH_TIMER
+#include <asm/arch_timer.h>
+#endif
+
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pagemap.h>
@@ -24,10 +28,28 @@
 static bool unstable_ioctls;
 module_param_unsafe(unstable_ioctls, bool, 0600);
 
+static int panfrost_ioctl_query_timestamp(struct panfrost_device *pfdev,
+					  u64 *arg)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(pfdev->dev);
+	if (ret)
+		return ret;
+
+	panfrost_cycle_counter_get(pfdev);
+	*arg = panfrost_timestamp_read(pfdev);
+	panfrost_cycle_counter_put(pfdev);
+
+	pm_runtime_put(pfdev->dev);
+	return 0;
+}
+
 static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct drm_file *file)
 {
 	struct drm_panfrost_get_param *param = data;
 	struct panfrost_device *pfdev = ddev->dev_private;
+	int ret;
 
 	if (param->pad != 0)
 		return -EINVAL;
@@ -69,6 +91,21 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 		PANFROST_FEATURE_ARRAY(JS_FEATURES, js_features, 15);
 		PANFROST_FEATURE(NR_CORE_GROUPS, nr_core_groups);
 		PANFROST_FEATURE(THREAD_TLS_ALLOC, thread_tls_alloc);
+
+	case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP:
+		ret = panfrost_ioctl_query_timestamp(pfdev, &param->value);
+		if (ret)
+			return ret;
+		break;
+
+	case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY:
+#ifdef CONFIG_ARM_ARCH_TIMER
+		param->value = arch_timer_get_cntfrq();
+#else
+		param->value = 0;
+#endif
+		break;
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index fd8e44992184..f19f918e2330 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -380,6 +380,18 @@ unsigned long long panfrost_cycle_counter_read(struct panfrost_device *pfdev)
 	return ((u64)hi << 32) | lo;
 }
 
+unsigned long long panfrost_timestamp_read(struct panfrost_device *pfdev)
+{
+	u32 hi, lo;
+
+	do {
+		hi = gpu_read(pfdev, GPU_TIMESTAMP_HI);
+		lo = gpu_read(pfdev, GPU_TIMESTAMP_LO);
+	} while (hi != gpu_read(pfdev, GPU_TIMESTAMP_HI));
+
+	return ((u64)hi << 32) | lo;
+}
+
 static u64 panfrost_get_core_mask(struct panfrost_device *pfdev)
 {
 	u64 core_mask;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index d841b86504ea..b4fef11211d5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -20,6 +20,7 @@ void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev);
 void panfrost_cycle_counter_get(struct panfrost_device *pfdev);
 void panfrost_cycle_counter_put(struct panfrost_device *pfdev);
 unsigned long long panfrost_cycle_counter_read(struct panfrost_device *pfdev);
+unsigned long long panfrost_timestamp_read(struct panfrost_device *pfdev);
 
 void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index c25743b05c55..c7bba476ab3f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -78,6 +78,8 @@
 
 #define GPU_CYCLE_COUNT_LO		0x90
 #define GPU_CYCLE_COUNT_HI		0x94
+#define GPU_TIMESTAMP_LO		0x98
+#define GPU_TIMESTAMP_HI		0x9C
 
 #define GPU_THREAD_MAX_THREADS		0x0A0	/* (RO) Maximum number of threads per core */
 #define GPU_THREAD_MAX_WORKGROUP_SIZE	0x0A4	/* (RO) Maximum workgroup size */
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 9f231d40a146..52b050e2b660 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -172,6 +172,8 @@ enum drm_panfrost_param {
 	DRM_PANFROST_PARAM_NR_CORE_GROUPS,
 	DRM_PANFROST_PARAM_THREAD_TLS_ALLOC,
 	DRM_PANFROST_PARAM_AFBC_FEATURES,
+	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP,
+	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY,
 };
 
 struct drm_panfrost_get_param {
-- 
2.46.0

