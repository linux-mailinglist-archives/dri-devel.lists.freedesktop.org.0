Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4C4CC67B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 20:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BACF10E344;
	Thu,  3 Mar 2022 19:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EDC10E344;
 Thu,  3 Mar 2022 19:49:23 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id c9so5730718pll.0;
 Thu, 03 Mar 2022 11:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ytOUMOh2Tl97mA0t3dQsH3Iaw7ED9UKYQDbSghK/IvU=;
 b=NJZYLV2vvJLHzxTWZHNaE060FnQtc/2W9wabGcxV3RjrFDLlXhWpWo2J9Lk/wQfh7N
 EA73b7E1/qyaVMp0BYnGZ5d2gP/VaWYjOR54f3CezWMlAJo9W8tXoPLzkl13L1q8wXjU
 tVnXhUzTtf4euu9LvDlo9Y9eYwBbdjcXVTh6N59cei9T5an9SH/G60lxTuNzLSQ8sTkZ
 k9axZWrlMpa/k6jWrW3Hk4rJWsoeV28f4TFGYqrGStXcWh6zE3CSoh39ZIkVgJbK40Fm
 du6AwZHGlbybqQGTCkfDCugqS3EEtUIaJCvTTLhuQHjAgP2rYzFcME1AIyFVr/V6csrU
 cq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ytOUMOh2Tl97mA0t3dQsH3Iaw7ED9UKYQDbSghK/IvU=;
 b=mzqPALbHpCTzWNI/xSiJss0yg+kOs1n8E1EQ9t6llUYK6ocd8KrGXI7dPOkTZdmmN6
 01JgadxpewqYUMfp5UF1OehITwn1l6zGh4/0Fb2MGt3JQrWgwkw5oMpIUoD/NNkHQvNA
 AcqKNIxJ4fy35Pzb15o+W/WqYUE5kV8L5TGPaW6OB2ScM9xzlFnMwZCrJ7CsTmZFHlvl
 Sk7mLW57zwceI9TKdSTCT9e+1/IuJVWVBOd+6/dKj2yvROT1VoYJme3AJwN+X35y4n2w
 G8nKXxxYLV5oDqqzP4Xf3LTfzxpJOkM63qdxoYfSOJCOkagib1ArBWEF3GXFqUxOI5Qn
 wKXA==
X-Gm-Message-State: AOAM533/hEwmlN9w3eql0tR9UChowqowKXVhbrZuR3GHSHZFnY1UzYUI
 zS8Ilw9kJPQPqU74r16P57ZFLndBoWw=
X-Google-Smtp-Source: ABdhPJxoDQGzHOki6UYKG+E5zR7fiLFGkwIB7AV/egyZc+Wd/4yM3MLQMnpYSrQ1JsYg6q53fMDOKg==
X-Received: by 2002:a17:902:b692:b0:14c:935b:2b03 with SMTP id
 c18-20020a170902b69200b0014c935b2b03mr38131809pls.81.1646336962452; 
 Thu, 03 Mar 2022 11:49:22 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 on18-20020a17090b1d1200b001b9cfbfbf00sm2780984pjb.40.2022.03.03.11.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:49:21 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/msm: Add SET_PARAM ioctl
Date: Thu,  3 Mar 2022 11:46:46 -0800
Message-Id: <20220303194758.710358-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303194758.710358-1-robdclark@gmail.com>
References: <20220303194758.710358-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It was always expected to have a use for this some day, so we left a
placeholder.  Now we do.  (And I expect another use in the not too
distant future when we start allowing userspace to allocate GPU iova.)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   |  1 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |  1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 drivers/gpu/drm/msm/msm_drv.c           | 20 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  2 ++
 include/uapi/drm/msm_drm.h              | 27 ++++++++++++++-----------
 10 files changed, 54 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 22e8295a5e2b..6c9a747eb4ad 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -471,6 +471,7 @@ static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
 		.hw_init = a2xx_hw_init,
 		.pm_suspend = msm_gpu_pm_suspend,
 		.pm_resume = msm_gpu_pm_resume,
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 2e481e2692ba..0ab0e1dd8bbb 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -486,6 +486,7 @@ static u32 a3xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
 		.hw_init = a3xx_hw_init,
 		.pm_suspend = msm_gpu_pm_suspend,
 		.pm_resume = msm_gpu_pm_resume,
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index c5524d6e8705..0c6b2a6d0b4c 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -621,6 +621,7 @@ static u32 a4xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
 		.hw_init = a4xx_hw_init,
 		.pm_suspend = a4xx_pm_suspend,
 		.pm_resume = a4xx_pm_resume,
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 3d28fcf841a6..407f50a15faa 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1700,6 +1700,7 @@ static uint32_t a5xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
 		.hw_init = a5xx_hw_init,
 		.pm_suspend = a5xx_pm_suspend,
 		.pm_resume = a5xx_pm_resume,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7d23c741db4a..237c2e7a7baa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1800,6 +1800,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
 		.hw_init = a6xx_hw_init,
 		.pm_suspend = a6xx_pm_suspend,
 		.pm_resume = a6xx_pm_resume,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 15c8997b7251..6a37d409653b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -283,6 +283,16 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	}
 }
 
+int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+		     uint32_t param, uint64_t value)
+{
+	switch (param) {
+	default:
+		DBG("%s: invalid param: %u", gpu->name, param);
+		return -EINVAL;
+	}
+}
+
 const struct firmware *
 adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
 {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b1ee453d627d..0490c5fbb780 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -282,6 +282,8 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t *value);
+int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+		     uint32_t param, uint64_t value);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
 struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index fdf401e6f09e..ca9a8a866292 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -614,6 +614,25 @@ static int msm_ioctl_get_param(struct drm_device *dev, void *data,
 				     args->param, &args->value);
 }
 
+static int msm_ioctl_set_param(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_param *args = data;
+	struct msm_gpu *gpu;
+
+	if (args->pipe != MSM_PIPE_3D0)
+		return -EINVAL;
+
+	gpu = priv->gpu;
+
+	if (!gpu)
+		return -ENXIO;
+
+	return gpu->funcs->set_param(gpu, file->driver_priv,
+				     args->param, args->value);
+}
+
 static int msm_ioctl_gem_new(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -899,6 +918,7 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
 
 static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_SET_PARAM,    msm_ioctl_set_param,    DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ad4fe05dee03..fde9a29f884e 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -45,6 +45,8 @@ struct msm_gpu_config {
 struct msm_gpu_funcs {
 	int (*get_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
 			 uint32_t param, uint64_t *value);
+	int (*set_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
+			 uint32_t param, uint64_t value);
 	int (*hw_init)(struct msm_gpu *gpu);
 	int (*pm_suspend)(struct msm_gpu *gpu);
 	int (*pm_resume)(struct msm_gpu *gpu);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 6cd45a7f6947..a1bb2a17a8b9 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -67,16 +67,20 @@ struct drm_msm_timespec {
 	__s64 tv_nsec;         /* nanoseconds */
 };
 
-#define MSM_PARAM_GPU_ID     0x01
-#define MSM_PARAM_GMEM_SIZE  0x02
-#define MSM_PARAM_CHIP_ID    0x03
-#define MSM_PARAM_MAX_FREQ   0x04
-#define MSM_PARAM_TIMESTAMP  0x05
-#define MSM_PARAM_GMEM_BASE  0x06
-#define MSM_PARAM_PRIORITIES 0x07  /* The # of priority levels */
-#define MSM_PARAM_PP_PGTABLE 0x08  /* => 1 for per-process pagetables, else 0 */
-#define MSM_PARAM_FAULTS     0x09
-#define MSM_PARAM_SUSPENDS   0x0a
+/* Below "RO" indicates a read-only param, "WO" indicates write-only, and
+ * "RW" indicates a param that can be both read (GET_PARAM) and written
+ * (SET_PARAM)
+ */
+#define MSM_PARAM_GPU_ID     0x01  /* RO */
+#define MSM_PARAM_GMEM_SIZE  0x02  /* RO */
+#define MSM_PARAM_CHIP_ID    0x03  /* RO */
+#define MSM_PARAM_MAX_FREQ   0x04  /* RO */
+#define MSM_PARAM_TIMESTAMP  0x05  /* RO */
+#define MSM_PARAM_GMEM_BASE  0x06  /* RO */
+#define MSM_PARAM_PRIORITIES 0x07  /* RO: The # of priority levels */
+#define MSM_PARAM_PP_PGTABLE 0x08  /* RO: Deprecated, always returns zero */
+#define MSM_PARAM_FAULTS     0x09  /* RO */
+#define MSM_PARAM_SUSPENDS   0x0a  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
@@ -335,9 +339,7 @@ struct drm_msm_submitqueue_query {
 };
 
 #define DRM_MSM_GET_PARAM              0x00
-/* placeholder:
 #define DRM_MSM_SET_PARAM              0x01
- */
 #define DRM_MSM_GEM_NEW                0x02
 #define DRM_MSM_GEM_INFO               0x03
 #define DRM_MSM_GEM_CPU_PREP           0x04
@@ -353,6 +355,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
+#define DRM_IOCTL_MSM_SET_PARAM        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
 #define DRM_IOCTL_MSM_GEM_INFO         DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_INFO, struct drm_msm_gem_info)
 #define DRM_IOCTL_MSM_GEM_CPU_PREP     DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_GEM_CPU_PREP, struct drm_msm_gem_cpu_prep)
-- 
2.35.1

