Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23AA9B8595
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 22:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737B010E939;
	Thu, 31 Oct 2024 21:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ndEO95SY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8517F10E93A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 21:44:16 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539f72c913aso2254965e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730411055; x=1731015855; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OqNSFMIgIgV5OpXdR/7l7nRGQJoQyaD3983y+et4GC4=;
 b=ndEO95SYCPZx7yZjiktIc2RsV3Ue+J2KFQucOBMYRVaIc3dfPhUfyjlBIoUZXf6D/F
 wDBLrsgbM80EtIPXCMlJgqdh+Y8fJ95teSaAA+ZB7vHeC55TPDFJjBpYVXbGwE9RV8YR
 3WGhnl1G9adh0yiee1IeiJn1vxW1GeWzmU19+CVerTV6em5qAHsqp78iwn45G8QSvpxy
 gXpQETyvhdXPsblUqT/lJbdhKfMWNYoXrUmIcOP2jbChn3NfiPbQ5bJCrMT/w5E6ULhI
 J+NLEn58Gj5l+X9DIVhvZStct1cTygk8xwOOUZRMK109TdEGnQafMy9iFfNj1QmohQBn
 /dKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730411055; x=1731015855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqNSFMIgIgV5OpXdR/7l7nRGQJoQyaD3983y+et4GC4=;
 b=IFulgKMKYYjiSSAsn58SXu6TeRYTzT15PLn0uUiidST6OqIuwBm1ZxUGWrxhzBcWjk
 Im1RVuIf3RPItClf2YmM8Gp1BhLW28HdqlXk8X98EXUeh8hFej2VVywJtxzxumt95cOv
 2KNT264ykbqSm8pJdQCqWtKAQyb6JKJxky/nR6ZgLEm09BhoKPwfV+NkMFmvxLyKxvKQ
 P5dahB/nv9o+CpIp5NbMn7rX+4GNfrSgokaoNOj8hc5areIw+5OOzFsxKNtcNwK3RTQg
 8bWZBUAku2TyxNkFw13DK5qqMCrcXCtoh7z+fEGFAJtzZB0xhkj9N8j3YFLj3u2ut1gx
 +Qbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW18/dUKuNhwbRhy/yZaqjNPOzeAm+D97tvFyp/Erx4WYrJQURvw5iXrZo3HNPNYMJFmBa/NSYBscI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM8/63R/wcOnnUNu7AS+0btrLLgOyVRlkTzRL6B35cTyPvd2lt
 scBn+jp+Ct7DbNawDks9sNkrDiYlG6u+05XNZCgLFJZgGNw3HOzCdXJnML0zBLlj3vQD9uS1VGA
 r
X-Google-Smtp-Source: AGHT+IHwHI39pMLKJYKB/wJbzqMugbwMOcaMVOgXGw6qMYzh2l8oGIsERY8Roc/3xeyAXemPUVpnHw==
X-Received: by 2002:a05:6512:3b1e:b0:539:f37f:bed9 with SMTP id
 2adb3069b0e04-53b348c38d4mr10744771e87.8.1730411054650; 
 Thu, 31 Oct 2024 14:44:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9c162sm339567e87.96.2024.10.31.14.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 14:44:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 23:44:06 +0200
Subject: [PATCH 1/3] drm/msm: move msm_display_topology to the DPU driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-dpu-move-topology-v1-1-8ffa8122d3b6@linaro.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
In-Reply-To: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2272;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3gmgqvAjzCSSavAjV5jJg0GKqDw6X9/s8Cl9bedoQdA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnI/opyJCRQfXjqH5VCLGGgyhtrc2f1DqM69JuU
 HJU3VI5uniJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyP6KQAKCRCLPIo+Aiko
 1f+jCACrvoUEvzZiGZj7CBTSY3ijv0NmWwvH4XePIES1czqYUu6Z+pxY1CCBpm1SLUQZd1qDCC3
 dDcLfo7lktlCYzwkNA/N0fiycFu8tzXvBKIiKQ/MBlbdOdcUok+NkoeP3KsvEctlWeBei9QB2U4
 r+zSJD2mRsj81j3kxzDwgoG0GvsOtfOJ4Ph+TKn4a/steVHjOijVUMJNJit7mo9sjIt6hZ81jp4
 xy763WiGofpM9ofjrzNQMo9ut3d43pWs00jd7RknOTmg9pujEGu1TsmU/W6pPcbIQyqpk1Dii+9
 jWLamaVNSz59rGQUbw0kwUzjftva87JP8IS6i/jZBqNf1rtc
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The struct msm_display_topology is only used by the DPU driver. Remove
it from the global header and move it to DPU-specific header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h | 16 ++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h          | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index e63db8ace6b9..14220ba04a78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -37,6 +37,22 @@ struct dpu_rm {
 	struct dpu_hw_blk *cdm_blk;
 };
 
+/**
+ * struct msm_display_topology - defines a display topology pipeline
+ * @num_lm:       number of layer mixers used
+ * @num_intf:     number of interfaces the panel is mounted on
+ * @num_dspp:     number of dspp blocks used
+ * @num_dsc:      number of Display Stream Compression (DSC) blocks used
+ * @needs_cdm:    indicates whether cdm block is needed for this display topology
+ */
+struct msm_display_topology {
+	u32 num_lm;
+	u32 num_intf;
+	u32 num_dspp;
+	u32 num_dsc;
+	bool needs_cdm;
+};
+
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 133e47bea7d5..ae3adb0f68a8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -73,22 +73,6 @@ enum msm_dsi_controller {
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
-/**
- * struct msm_display_topology - defines a display topology pipeline
- * @num_lm:       number of layer mixers used
- * @num_intf:     number of interfaces the panel is mounted on
- * @num_dspp:     number of dspp blocks used
- * @num_dsc:      number of Display Stream Compression (DSC) blocks used
- * @needs_cdm:    indicates whether cdm block is needed for this display topology
- */
-struct msm_display_topology {
-	u32 num_lm;
-	u32 num_intf;
-	u32 num_dspp;
-	u32 num_dsc;
-	bool needs_cdm;
-};
-
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;

-- 
2.39.5

