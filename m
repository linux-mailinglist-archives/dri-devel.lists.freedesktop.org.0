Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C50174A612C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 17:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C29610E2C2;
	Tue,  1 Feb 2022 16:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF16010E6D3;
 Tue,  1 Feb 2022 16:16:14 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id y17so15757658plg.7;
 Tue, 01 Feb 2022 08:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MnkWsxsvgV6jYlqjrCgNZZOUCGjYTcXq/86qZc0VO9M=;
 b=UBrDJDmLtPc0Wui/p8WtSn0X0DOXGqERJ0OBiM9RZY1a+CpAeLYVN+wktPLEfLGGIT
 GEHmrum1IBw5vL3uNkt4nIqnfC/W9sJBERsdJ2RYeBc4Hc2Kn1li78SZ8KhFAF7Ef/4P
 rdqUwnXElWHXRj+BdbP+LvlkjMtvBH8eSYWZx9OMEMl8hjcXyRUruJ1jLh0gQzpkvet6
 B319MiDnddh+0Ei1tHGQlX1YrT3WdKjyMi4A6CQHAeFN77ANF8Sy4khE+Zft9yfJUnQJ
 nobm1jDazoW3xqCiqfycvOE0BPyWJgvBdPE2IDFCBI7QOWgGjsxbdKpOCkABvYgep68h
 +7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MnkWsxsvgV6jYlqjrCgNZZOUCGjYTcXq/86qZc0VO9M=;
 b=qiOaxnIiiPJRTiTE+AKA5VBfrvdAPK5WwTuJlba24S2EIvM6Y8tCfwGIVr9a8xzaan
 DJ9TLJ5MrpaWE+HhSIOk7DtZNIPLluA1dz09DcGhcqnWyWijmd5c/bUdkviOG39hyys1
 QeYjEtnRn2jFf1tUfhGA9ADkPlskwHT1euru2BSwV0PsEu4DGZphDKTehb3UpTgm+S32
 32LTfBpprcl3N6fHSS/M0DOxzYcKUWyFYok7qIJ0y4MTWmqOWbLyZN/TFslP97NdHi/W
 6QWX7GfI6Ys/2H8jn5uSCYasBilsYhlAg/I9dYooIqsMsRlud2ao6dnp72f5+Ty5Un3Y
 mQqQ==
X-Gm-Message-State: AOAM533NgTGFS/GcrVoM/FoF8cvXj3nLKifAQY/naWO8zkGE5t8mGp/i
 3HnTq1JxvFBYeOLjnNYuoEl1D4cV/jA=
X-Google-Smtp-Source: ABdhPJzas4QP0D3ikc29XHmeyrMd+rn5viftGv/vHPmDifvADb4DEq1nXoSG2jHN2PdGQ3XPGpIIlQ==
X-Received: by 2002:a17:902:c40d:: with SMTP id
 k13mr25884655plk.151.1643732173932; 
 Tue, 01 Feb 2022 08:16:13 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 207sm16403918pgh.32.2022.02.01.08.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 08:16:12 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm/gpu: Add ctx to get_param()
Date: Tue,  1 Feb 2022 08:16:11 -0800
Message-Id: <20220201161618.778455-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201161618.778455-1-robdclark@gmail.com>
References: <20220201161618.778455-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yiwei Zhang <zzyiwei@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
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

