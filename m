Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E1549E87B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 18:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF6E10E1B7;
	Thu, 27 Jan 2022 17:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E80D10E1AB;
 Thu, 27 Jan 2022 17:10:47 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id i186so738042pfe.0;
 Thu, 27 Jan 2022 09:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MnkWsxsvgV6jYlqjrCgNZZOUCGjYTcXq/86qZc0VO9M=;
 b=QjgTddvU6ODliyMvekz30Fb7iTygrNiyCsneQ+ZBqDNobURN4YkPLSuH0kNPdHSeKI
 lwVsg9J5FRcQaq3j6R4oSGDFCDwR+3qJqa4z73NmGVKpL61h/StCbDCDUIYGTAPfGBEN
 E8SuPPHHN1ul6EPHtZ5Nwj1FSuL9UjsSjLryujfo2EgW8VfgBRQhpToqhRWirjx7bWst
 ntbuo0kI6wFLLqsCz/J8fOMUO3/yJJmSrObvGI7zNxlYa6wXK1Hhiq4cA+enpcPPpYfJ
 Ye2eaoxH61B7uwcDwHQehF3E3u+YgjPPJyVZ1uTvhyQX/gjGUBj02J8SzxlfSZziU7Le
 jxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MnkWsxsvgV6jYlqjrCgNZZOUCGjYTcXq/86qZc0VO9M=;
 b=t2uIzk1eAZgkhJU+w8nK6c9HwHyYv0/hEX0UFt2SdjYOBHxI/kpssrG/bxeLbb2Tuf
 Pgs/gAjFjNGPq+iomq3hlYmwo4hSzUdcammmqyRwOK1hJFVx3SBfR59OzFTSs+9y184S
 hGpavwHDFsBvUL+hNTx9+m2o5Z9ognXXh3DWgYaHZbc4kZL2FZeHEviKg7iaTUEkwcmu
 7wWmJOIg7NR59+fddNb47IEOPh7RHsJhaNkjkP2+EcTKDxGHh9ATiLLqX9DoIlNgXltP
 gLQhTeP3ENIo3lF9pZdCBJRA2owmUtEvNt9wnJh7rtx0MaG0TIH07FG1tOoCJ1HbnXaf
 4yJA==
X-Gm-Message-State: AOAM531ZAj8B3okmtcwaQ0ZBqGxEk3r74iEPEiyp8p6C5VAKCFVa3Bid
 idPyVuCZxFv4TxlRHBRmea1m8gle+DU=
X-Google-Smtp-Source: ABdhPJwG3RhFhwBKzDloSl5ecpOLF3zct0uNovpp6ztCNdta9z0PSlrCMRY0R23ICasXcGy1Njfd5g==
X-Received: by 2002:a63:594c:: with SMTP id j12mr3304800pgm.523.1643303446247; 
 Thu, 27 Jan 2022 09:10:46 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 lr8sm7511912pjb.11.2022.01.27.09.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:10:45 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/gpu: Add ctx to get_param()
Date: Thu, 27 Jan 2022 09:10:38 -0800
Message-Id: <20220127171045.541341-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127171045.541341-1-robdclark@gmail.com>
References: <20220127171045.541341-1-robdclark@gmail.com>
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Prep work for next patch.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 3 ++-
 drivers/gpu/drm/msm/msm_drv.c           | 3 ++-
 drivers/gpu/drm/msm/msm_gpu.h           | 3 ++-
 drivers/gpu/drm/msm/msm_rd.c            | 6 ++++--
 5 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f33cfa4ef1c8..caa9076197de 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -227,7 +227,8 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	return aspace;
 }
 
-int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
+int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+		     uint32_t param, uint64_t *value)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cffabe7d33c1..432590036b31 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -279,7 +279,8 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 	       adreno_is_a660_family(gpu);
 }
 
-int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
+int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+		     uint32_t param, uint64_t *value);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
 struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 555666e3f960..72060247e43c 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -763,7 +763,8 @@ static int msm_ioctl_get_param(struct drm_device *dev, void *data,
 	if (!gpu)
 		return -ENXIO;
 
-	return gpu->funcs->get_param(gpu, args->param, &args->value);
+	return gpu->funcs->get_param(gpu, file->driver_priv,
+				     args->param, &args->value);
 }
 
 static int msm_ioctl_gem_new(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 92aa1e9196c6..ba8407231340 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -42,7 +42,8 @@ struct msm_gpu_config {
  *    + z180_gpu
  */
 struct msm_gpu_funcs {
-	int (*get_param)(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
+	int (*get_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
+			 uint32_t param, uint64_t *value);
 	int (*hw_init)(struct msm_gpu *gpu);
 	int (*pm_suspend)(struct msm_gpu *gpu);
 	int (*pm_resume)(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 7e4d6460719e..dd3605b46264 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -197,13 +197,15 @@ static int rd_open(struct inode *inode, struct file *file)
 
 	/* the parsing tools need to know gpu-id to know which
 	 * register database to load.
+	 *
+	 * Note: These particular param does not require a context
 	 */
-	gpu->funcs->get_param(gpu, MSM_PARAM_GPU_ID, &val);
+	gpu->funcs->get_param(gpu, NULL, MSM_PARAM_GPU_ID, &val);
 	gpu_id = val;
 
 	rd_write_section(rd, RD_GPU_ID, &gpu_id, sizeof(gpu_id));
 
-	gpu->funcs->get_param(gpu, MSM_PARAM_CHIP_ID, &val);
+	gpu->funcs->get_param(gpu, NULL, MSM_PARAM_CHIP_ID, &val);
 	rd_write_section(rd, RD_CHIP_ID, &val, sizeof(val));
 
 out:
-- 
2.34.1

