Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1438D4DCBBB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A080B10E03C;
	Thu, 17 Mar 2022 16:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2FF10E03C;
 Thu, 17 Mar 2022 16:51:14 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so6019661pjb.1; 
 Thu, 17 Mar 2022 09:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vW5Zdse1i3pRk6JU03o69YBRQdnNrRsS1PGNiisfl5M=;
 b=VlfKEeP+lPdePeKU8PdVRkkgvOHIozbxDklQW5RKq5pXFemsT6Cf3M2cwZjeBUvhyC
 K7tWVuNdcwDpFRS8aMY8jQC0KTzr/RC5B2HURb4adYQ2bgH/GRhu04Pr7/RQsV46xKgE
 3iDvnjFkbtLbvSXCFdV/a5t4dCkxGbRQwH1Gf3YSWMQuHa2JXQpew0i5PoyvnlQfE2+Z
 lS4V7ZmrFJf0gz8+bA+qYBTpHuNhwpphB+DRWw/C1KCGTzksJHYS5wNyXFJ7cXyjwxGW
 sxoFZYEn7YPEcQs4LxHHUfsh52BaDWZMvbI5nIF7uH4nldWToIRBu2yTw6Zjqf2SEdBJ
 pF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vW5Zdse1i3pRk6JU03o69YBRQdnNrRsS1PGNiisfl5M=;
 b=wdkjlsXZ9+HRZwDoHKvQfT7+PksusCBncMW5tfSOGYS46DuCI0igkgiLjo2CxdLubA
 Dc7ocMxYznNWU3x3bIsKtpaNYGLGddFbRe5sVBdNqGzOcIKKDS2+jyBFobqI6DDG+X6S
 nC78UA28S157N08jBu2w22JtwPn+C6vyyFWwQpdP2okgYVYGBzPG0xnELmnsZhlBZzeQ
 1khaNT6QzZtumjOiDYzEIQuQ4Jria92PEGAJz//ihI/m6oAFEkcmBAmuH5kT/6Ck8hTm
 WFbNnJM7xi6N9Xmq7+lHvcqGx5bMG5ZKHuVFuduGoBPotROqTovH3DPIEViVhcMqrAaI
 3BMQ==
X-Gm-Message-State: AOAM5313DRixgxytvTdFQLscKww78mcdcBIho09zatI5I6AZ+dLZaO5i
 ujBO8kq1k8HpWt2v7Sz4DQTxyP0gIAI=
X-Google-Smtp-Source: ABdhPJwzfNHMhilqewg28u1p/XeMTqVQpkFPp+iX2u9jn4UWu6MQ4JepFS2j8iTvJWI0Fz6NCN2M3w==
X-Received: by 2002:a17:902:8644:b0:153:9f01:2090 with SMTP id
 y4-20020a170902864400b001539f012090mr6003326plt.101.1647535872996; 
 Thu, 17 Mar 2022 09:51:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm7324243pfu.150.2022.03.17.09.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 09:51:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm: Add support for pointer params
Date: Thu, 17 Mar 2022 09:51:38 -0700
Message-Id: <20220317165144.222101-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317165144.222101-1-robdclark@gmail.com>
References: <20220317165144.222101-1-robdclark@gmail.com>
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

