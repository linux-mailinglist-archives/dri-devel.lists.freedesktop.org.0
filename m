Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A053BB4E9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA56B89C6A;
	Mon,  5 Jul 2021 01:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF74B89BF1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:19 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id u25so22343267ljj.11
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=snkgCap2/o+t1vAhQA7ejk+jLYgLsqxsKE9XwxD0MqU=;
 b=IvgCxZnnqkj6jpVv26mUCMCyj0Ppp/tYAeYIJV6jII6VZLGVnD6K678YUW2Jc0pf/T
 vVJGreFEZswIdOSgc586nMF69YnubrSI+pjdXRLcK2gYaE/nihcNmhVOWOz/Lp81aq+5
 MlbSwVie1A9EvjUPQhICUhS+DjcH8HxIvUUymM8rjalSBZCjvnmmYEOWom0ORkiQodHy
 xzo54MfJKG2eu9kQ5iRPoDs9ejgdANFVXagBRzYNouffpU2HAsLkRPH8ZrL6UIE1v62f
 xq3Z5ZXc8y9ExWHtDwv9zCJJ/KVaiLcBv/fdcp+WscBkunleIgJXCWElwdnR9RkAZzoT
 wSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=snkgCap2/o+t1vAhQA7ejk+jLYgLsqxsKE9XwxD0MqU=;
 b=NzC9UqvDVWNzTyiuXmj2yF8eFVdAd3tOult3b4dD2u2LqhZNH1+dXpmZB9YT3T4Y8q
 esoN0W2DQ+RH8HIfShxGD3H5paP1sEyPHcPqwnX1sFQOY1IsT/vYc2nRS9xf0YQMczd6
 iBLl2zTfhLBm1YxZP0Y9Hw714nFn69Ucv7qtDpN8/riKDgMAKP9LBsMW6yHCvFEt2bqS
 L8id0dsOF9nt9a8B7QecMZsePqo2qlnqsawPZiRR1B6k0cexS0PxbBlrz89dMSwlKtZN
 5T5q05keKMQuanUfxeJsCDhu77TtmhrNMZhVUF4kIOBjyEjvknHVb7JewezaI3pK8txQ
 o2ag==
X-Gm-Message-State: AOAM530SeW8ABTOEnXmsTctunVjTD1EavYcxktN3iOh5lEeoA9wqA/Kl
 SBmhmS8W/q0QcnjzWjBHSZop3Q==
X-Google-Smtp-Source: ABdhPJzqSbuQXY8AuNYnpl2n5dnz/hQsn3pC3iPnUQC9x7lbHbSjxCdLD7wa6cS/YHAbYNLUEZ8q1Q==
X-Received: by 2002:a2e:6e0b:: with SMTP id j11mr9134456ljc.464.1625448318432; 
 Sun, 04 Jul 2021 18:25:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 15/22] drm/msm/dpu: simplify DPU_SSPP features checks
Date: Mon,  5 Jul 2021 04:21:08 +0300
Message-Id: <20210705012115.4179824-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DPU_SSPP_CSC_ANY denoting any CSC block. As we are at it, rewrite
DPU_SSPP_SCALER (any scaler) to use BIT(x) instead of hand-coded
bitshifts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 16 +++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  3 +--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 264a9d0d5fca..00098e33391e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -25,11 +25,17 @@ struct dpu_hw_pipe;
 /**
  * Define all scaler feature bits in catalog
  */
-#define DPU_SSPP_SCALER ((1UL << DPU_SSPP_SCALER_RGB) | \
-	(1UL << DPU_SSPP_SCALER_QSEED2) | \
-	 (1UL << DPU_SSPP_SCALER_QSEED3) | \
-	 (1UL << DPU_SSPP_SCALER_QSEED3LITE) | \
-	  (1UL << DPU_SSPP_SCALER_QSEED4))
+#define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
+			 BIT(DPU_SSPP_SCALER_QSEED2) | \
+			 BIT(DPU_SSPP_SCALER_QSEED3) | \
+			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
+			 BIT(DPU_SSPP_SCALER_QSEED4))
+
+/*
+ * Define all CSC feature bits in catalog
+ */
+#define DPU_SSPP_CSC_ANY (BIT(DPU_SSPP_CSC) | \
+			  BIT(DPU_SSPP_CSC_10BIT))
 
 /**
  * Component indices
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 34ecd971cbbb..8ed7b8f0db69 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -983,8 +983,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
 		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
-		 | BIT(DPU_SSPP_CSC_10BIT))))) {
+		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
-- 
2.30.2

