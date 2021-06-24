Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998FF3B3213
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A5F6EC2C;
	Thu, 24 Jun 2021 14:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80F86EC28
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:49 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id u13so10832663lfk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96wZKbVAZc0QZ8GAGuoZzdhN1om+iu8T/MIvGHo2HXM=;
 b=HMBIcdCwiXMI824k6NBLU5oyVzXqtHS6oMwtm74emcbOkZsjNFVX+oNkpcemXQsYTy
 mHTBn+9XVDwJFHySUAJLjgwaOQrn+53h0O+BqC5sudvn/thi/k6OVx3Tpzzy3n/1szZv
 bTjmWSTS7D46QhPPAHqiZZj+zpUC18KAgiTcTjDwH950nA8OojAgC7/kVz6FHSA2VErg
 lkn6YvaNvQrfNIPnHfUx0S0fWx1irgb3ytHsVlmnFIY+J/f6Oh01njccuDK08K6YvbL1
 BmjirTc+oLIGHAjIHS7Zp6i/+BhWldFe3E4L7VcpAZAlhZi5b8CWRWJkZy54C/3cPpGv
 8ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96wZKbVAZc0QZ8GAGuoZzdhN1om+iu8T/MIvGHo2HXM=;
 b=NGinvhXfXy6jk/GtynnE41izDNdCePlev0BQ7if05PIW5A8CskgjRFaN7wnKQSBoz/
 zipcCJbXxcmHvHwHli0wMJiMWP4npMZH1Kb3BbaM4VdqXce7hDub87zR17PXiFPRvS8V
 W0XTSSHOsPORcu+Lk3NYJ5C3CE/TW/GtTEFKvXhcQwLypoprQP9NF5d25DFBPVcXlZSb
 fRSzW9ZMSAsw1GjHO7yEVb+nFMonYUKXciaHTFZerSq1YonjawG7JWQxdp/Cip4Kc8VT
 QvVI5O39x5y4T+KpajHwBcFC2fB3qQMxH92A+Z8P6oinaWXHdsWbNxjbwRA6PueNNEoq
 POQg==
X-Gm-Message-State: AOAM530u3XRG06km33vDOLLQYJMiDrquA7RlG/J9qstela5E2abDiARJ
 TWDmQlkIgza+E3ATGLDyQp4T0g==
X-Google-Smtp-Source: ABdhPJwsYYxTNAkrO0fW9LP2Q1a+Kr3Jh3hmX3SxnKeb0IQ+bz/LTiihnGXd+y4COYzuBnfRzs6XaQ==
X-Received: by 2002:a05:6512:3ca2:: with SMTP id
 h34mr1974898lfv.26.1624546668126; 
 Thu, 24 Jun 2021 07:57:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 13/17] drm/msm/dpu: simplify DPU_SSPP features checks
Date: Thu, 24 Jun 2021 17:57:29 +0300
Message-Id: <20210624145733.2561992-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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
index e8939d7387cb..fcf131f77df2 100644
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
index c4a76dd6dbd5..4658410eedfb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -970,8 +970,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
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

