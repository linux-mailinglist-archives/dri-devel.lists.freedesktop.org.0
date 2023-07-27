Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB97765DEC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C77F10E60A;
	Thu, 27 Jul 2023 21:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8012710E60A;
 Thu, 27 Jul 2023 21:22:53 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-666e97fcc60so1127054b3a.3; 
 Thu, 27 Jul 2023 14:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690492972; x=1691097772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTfxzWPz0oIejc4GI49W1CM+2sznYMyqDyFO/bZuk14=;
 b=S4S1oRowZPze+VKp3aAVEUW/0uBqu0oARIRRoLtRvDjQOmDRYCfkaHGI8YmyLRBNuD
 YdCVNgVQHDqfQns91xaqnwPu+cwdrkJrLsRWSjMl5lEIuLajgASUBjXvsZVJcZ9w4w9/
 YLbBVYKlMT4dYUOOThzJt0S9V6Xy+1iely4k6OmDCU+NCYa03PYWdSBK5WmI1WwbUBes
 Y/b9blDDeajZxejC6/7a4ZcNf/CHJ3jywQnBVYIjEgRkw5omWHCJ05zbGVEaGQQXkK8n
 RsyhZS5lKLoalSUQGGuWV685kMbnHIsyK2vOeeuq8rWkE04vCXWx45LVcRabAjiuaoR3
 WmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690492972; x=1691097772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTfxzWPz0oIejc4GI49W1CM+2sznYMyqDyFO/bZuk14=;
 b=FlqZBN5loVZQvllcbwQ8Ur4IayFC595o2hB64fpsMYaN5Tm+GH0kotwLAUBC8H88ZD
 SvxrprFCM4iIUp95bzkjfkA6CKd9I6aHtrFeRxGe580a+ICP+t1D2sUHAxPi0waxZdJn
 QW2I6dpkwFoRwkPZ+MWGRHncenrGGnFFLoqCIB8EBerbhXBQXvpJcbRPU224gQWtXmAj
 dLnhaa9jVN4mtU2LAcXipK8QYugMdUa2cD/hlLXISaPXiCAd3z/OcPwUE6HteDZuMhRg
 sM+Gk2gTj06Kp/IOOX/WktZeLObaA9h/apspsvHWAMCPnfTvirjH7L8ibC4A9vidcoOf
 PaKg==
X-Gm-Message-State: ABy/qLbTi86ARnWij0lotEF0ZkKG7+3/DSHisivqxResJN5m2D4vBwrU
 JuTbSM5xXdv1GfemjehZwoM3HAIAseM=
X-Google-Smtp-Source: APBJJlGLGztclPUX1zvG4bUzIh0z4oiQg2MTXB2Ej0dESnC4VfPQBhl9poFxY8SL/Kemx5qFVjWy4Q==
X-Received: by 2002:a05:6a00:2d97:b0:65a:710a:7855 with SMTP id
 fb23-20020a056a002d9700b0065a710a7855mr312751pfb.26.1690492972423; 
 Thu, 27 Jul 2023 14:22:52 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
 by smtp.gmail.com with ESMTPSA id
 a1-20020aa78641000000b00682d79199e7sm1885545pfo.200.2023.07.27.14.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 14:22:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/13] drm/msm/adreno: Remove redundant revn param
Date: Thu, 27 Jul 2023 14:20:08 -0700
Message-ID: <20230727212208.102501-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212208.102501-1-robdclark@gmail.com>
References: <20230727212208.102501-1-robdclark@gmail.com>
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
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This just duplicates what is in adreno_info, and can cause confusion if
used before it is set.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  1 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 22 +++++++++-------------
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index edbade75020f..5ba8b5aca502 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2484,8 +2484,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(-EINVAL);
 
 	/* Assign these early so that we can use the is_aXYZ helpers */
-	/* Numeric revision IDs (e.g. 630) */
-	adreno_gpu->revn = info->revn;
 	/* New-style ADRENO_REV()-only */
 	adreno_gpu->rev = info->rev;
 	/* Quirk data */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ef98d51d237f..f4d45534dd7f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1099,7 +1099,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
-	adreno_gpu->revn = adreno_gpu->info->revn;
 	adreno_gpu->rev = *rev;
 
 	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index aaf09c642dc6..d31e2d37c61b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,7 +77,6 @@ struct adreno_gpu {
 	struct msm_gpu base;
 	struct adreno_rev rev;
 	const struct adreno_info *info;
-	uint32_t revn;  /* numeric revision name */
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
@@ -147,10 +146,9 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
 
 static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
 {
-	/* revn can be zero, but if not is set at same time as info */
-	WARN_ON_ONCE(!gpu->info);
-
-	return gpu->revn == revn;
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return gpu->info->revn == revn;
 }
 
 static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
@@ -160,18 +158,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
 
 static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
 {
-	/* revn can be zero, but if not is set at same time as info */
-	WARN_ON_ONCE(!gpu->info);
-
-	return (gpu->revn < 300);
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return (gpu->info->revn < 300);
 }
 
 static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
 {
-	/* revn can be zero, but if not is set at same time as info */
-	WARN_ON_ONCE(!gpu->info);
-
-	return (gpu->revn < 210);
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return (gpu->info->revn < 210);
 }
 
 static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
-- 
2.41.0

