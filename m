Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C117C4DBBBE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9970A10EAC6;
	Thu, 17 Mar 2022 00:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0A710EAC4;
 Thu, 17 Mar 2022 00:29:10 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id z3so3139986plg.8;
 Wed, 16 Mar 2022 17:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vW5Zdse1i3pRk6JU03o69YBRQdnNrRsS1PGNiisfl5M=;
 b=Y+HYlj7Fx0m7n4FOWBBg1veZk4VCP5CBjgmxzIk7wQZLk55Fe4mwds3/DJkYQ6GHu4
 jcQkWPLQFw9S5QPHA+1bB3a/lFbkUXgMU2U41M8rSCFjaBAcU7WhrvoJnFiWjZiI18Rj
 F/P4VuEKV+e2BqfZmK6BP1cKQleXvDzr7uVckbBnPpoyC5CQNeHU3L1V5cimAZhdaJ+G
 AWumgUfRpEO5f6joaOHEAKzNttNU9P8VVVzxayP2CpZ/JA/9pTm3VdwcoUKfsqHwdyXa
 n8IEf7QbArRd4gWVSpMISp6CVNwzJlNU0oY5llc8JeCGSEHKHZoET/9lSOble9PFqwB7
 q4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vW5Zdse1i3pRk6JU03o69YBRQdnNrRsS1PGNiisfl5M=;
 b=v6JHw1fbTNIE7JaCqoJ0lPSlly9MjvYUMmLL6S/7uqKXo1K1sgDH0Zrhxj/6XBU//f
 8sCNtO1+L+zPcHHa1PA0JtztPMn8OLupPrXTyGVPMnr6qLBGSM/3dgJ4GZEbUMrIaHPl
 RewR7kKPMzLIpNweG0zcrwhEpnrXfhE8ot4wAm0A9VbHY/dsNyY8yZ5DcHyzm5xstJHv
 2hXdwwFH4NdDF/fGfIEBgbmgGbzH5ZUY9f/g6XswE87tecne1sNuUdQRO85VWHXIkteN
 XnXJZPQzsC3QzhYPrFQh1vyBbPycrWIybP2h3VHUfRjuMhOXc9MzoCuEQ8nY3pzYtS9M
 /ZEw==
X-Gm-Message-State: AOAM532mcLRJLASAgeNBnUTtMn8o+ZqYFtWd4mtllpKbYBQ1hs1YZA87
 8At7suqjt2tcoMbI9nbdian/jjPfWg4=
X-Google-Smtp-Source: ABdhPJyU1b6okhTFvq76TTO0crrILtMYBEA3bBgrFoxaGiqUSzOMMlyHdhzl+32t6hORIQZ04pajtg==
X-Received: by 2002:a17:902:f54f:b0:152:7e6:c32d with SMTP id
 h15-20020a170902f54f00b0015207e6c32dmr2373188plf.125.1647476949217; 
 Wed, 16 Mar 2022 17:29:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b001bcb7bad374sm7232549pjq.17.2022.03.16.17.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 17:29:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm: Add support for pointer params
Date: Wed, 16 Mar 2022 17:29:43 -0700
Message-Id: <20220317002950.193449-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317002950.193449-1-robdclark@gmail.com>
References: <20220317002950.193449-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The 64b value field is already suffient to hold a pointer instead of
immediate, but we also need a length field.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 ++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 ++--
 drivers/gpu/drm/msm/msm_drv.c           |  8 ++++----
 drivers/gpu/drm/msm/msm_gpu.h           |  4 ++--
 drivers/gpu/drm/msm/msm_rd.c            |  5 +++--
 include/uapi/drm/msm_drm.h              |  2 ++
 6 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 9efc84929be0..3d307b34854d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -229,10 +229,14 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 }
 
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
-		     uint32_t param, uint64_t *value)
+		     uint32_t param, uint64_t *value, uint32_t *len)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 
+	/* No pointer params yet */
+	if (*len != 0)
+		return -EINVAL;
+
 	switch (param) {
 	case MSM_PARAM_GPU_ID:
 		*value = adreno_gpu->info->revn;
@@ -284,8 +288,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 }
 
 int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
-		     uint32_t param, uint64_t value)
+		     uint32_t param, uint64_t value, uint32_t len)
 {
+	/* No pointer params yet */
+	if (len != 0)
+		return -EINVAL;
+
 	switch (param) {
 	case MSM_PARAM_SYSPROF:
 		if (!capable(CAP_SYS_ADMIN))
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 0490c5fbb780..ab3b5ef80332 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -281,9 +281,9 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 }
 
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
-		     uint32_t param, uint64_t *value);
+		     uint32_t param, uint64_t *value, uint32_t *len);
 int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
-		     uint32_t param, uint64_t value);
+		     uint32_t param, uint64_t value, uint32_t len);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
 struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 780f9748aaaf..a5eed5738ac8 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -610,7 +610,7 @@ static int msm_ioctl_get_param(struct drm_device *dev, void *data,
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
-	if (args->pipe != MSM_PIPE_3D0)
+	if ((args->pipe != MSM_PIPE_3D0) || (args->pad != 0))
 		return -EINVAL;
 
 	gpu = priv->gpu;
@@ -619,7 +619,7 @@ static int msm_ioctl_get_param(struct drm_device *dev, void *data,
 		return -ENXIO;
 
 	return gpu->funcs->get_param(gpu, file->driver_priv,
-				     args->param, &args->value);
+				     args->param, &args->value, &args->len);
 }
 
 static int msm_ioctl_set_param(struct drm_device *dev, void *data,
@@ -629,7 +629,7 @@ static int msm_ioctl_set_param(struct drm_device *dev, void *data,
 	struct drm_msm_param *args = data;
 	struct msm_gpu *gpu;
 
-	if (args->pipe != MSM_PIPE_3D0)
+	if ((args->pipe != MSM_PIPE_3D0) || (args->pad != 0))
 		return -EINVAL;
 
 	gpu = priv->gpu;
@@ -638,7 +638,7 @@ static int msm_ioctl_set_param(struct drm_device *dev, void *data,
 		return -ENXIO;
 
 	return gpu->funcs->set_param(gpu, file->driver_priv,
-				     args->param, args->value);
+				     args->param, args->value, args->len);
 }
 
 static int msm_ioctl_gem_new(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a84140055920..c28c2ad9f52e 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -44,9 +44,9 @@ struct msm_gpu_config {
  */
 struct msm_gpu_funcs {
 	int (*get_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
-			 uint32_t param, uint64_t *value);
+			 uint32_t param, uint64_t *value, uint32_t *len);
 	int (*set_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
-			 uint32_t param, uint64_t value);
+			 uint32_t param, uint64_t value, uint32_t len);
 	int (*hw_init)(struct msm_gpu *gpu);
 	int (*pm_suspend)(struct msm_gpu *gpu);
 	int (*pm_resume)(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 9d835331f214..a92ffde53f0b 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -180,6 +180,7 @@ static int rd_open(struct inode *inode, struct file *file)
 	struct msm_gpu *gpu = priv->gpu;
 	uint64_t val;
 	uint32_t gpu_id;
+	uint32_t zero = 0;
 	int ret = 0;
 
 	if (!gpu)
@@ -200,12 +201,12 @@ static int rd_open(struct inode *inode, struct file *file)
 	 *
 	 * Note: These particular params do not require a context
 	 */
-	gpu->funcs->get_param(gpu, NULL, MSM_PARAM_GPU_ID, &val);
+	gpu->funcs->get_param(gpu, NULL, MSM_PARAM_GPU_ID, &val, &zero);
 	gpu_id = val;
 
 	rd_write_section(rd, RD_GPU_ID, &gpu_id, sizeof(gpu_id));
 
-	gpu->funcs->get_param(gpu, NULL, MSM_PARAM_CHIP_ID, &val);
+	gpu->funcs->get_param(gpu, NULL, MSM_PARAM_CHIP_ID, &val, &zero);
 	rd_write_section(rd, RD_CHIP_ID, &val, sizeof(val));
 
 out:
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 07efc8033492..0aa1a8cb4e0d 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -95,6 +95,8 @@ struct drm_msm_param {
 	__u32 pipe;           /* in, MSM_PIPE_x */
 	__u32 param;          /* in, MSM_PARAM_x */
 	__u64 value;          /* out (get_param) or in (set_param) */
+	__u32 len;            /* zero for non-pointer params */
+	__u32 pad;            /* must be zero */
 };
 
 /*
-- 
2.35.1

