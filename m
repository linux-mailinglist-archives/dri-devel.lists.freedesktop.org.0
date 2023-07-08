Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E9574BADF
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA74C10E64A;
	Sat,  8 Jul 2023 01:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F42E10E63E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:22 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b703c900e3so38802791fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778260; x=1691370260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhEI1lIm+DUmqN/L6yAKAjA1YNlc6k+Vw25GanFRW4I=;
 b=IdgwmdV77LIS3Qf9wLgiOehF2o0nKe1wJx48roRXr4lUKi3GeD+XvlVheVShTEEFuX
 eOB4xmRHS7bBSFgn/2C8JvSlcPWWJEe4qkkYBaTwusl8U/ZODND3RSQkOgG20TNopc4w
 vkGcK73EdEOdQ0rAfPIbG/J+Sy6axeIMT4fso+31CFYdS8flu3O0cBztRy7gx3gGqRmr
 uD+/uyelnPHzKEOWZ/Pvr5kg8Jjb/7AdwzQ0eVatptxge+LLgCTd4Y6OdtCpouEDVCEF
 N5TUGH1PyeebiV8+F0V+zVArdhz93JkVwXUbZN5rh/CsGLfeVlsHoA+kjd75VsS0BkYj
 BbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778260; x=1691370260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhEI1lIm+DUmqN/L6yAKAjA1YNlc6k+Vw25GanFRW4I=;
 b=TeZehSxtV+dqipZfYhwQTY+Qa1EA0C/64hnpvmiDtg3Rf7bs7Qq2rRIPNQcn5PzO2e
 vVvktX7X45TpUioMbWt35t94wHdReqxMCOW+SrzkF5dnp3X7UQ8at52l1F/mEWbz9+TY
 bEcLIYBTRhxRuB+QegOWffLXahy0uUH1ZrKqadIOlGFttjx9YumaWVkXAChdU0Jq1Uk4
 RgucEQrcNTVZ4Lwq/lRC7qddB4NsOMc85WAdq8qLULjD7RzacAL9EeTHhitbs7m+eILm
 p4oafXwqcRcVQ+HQ2ltucT2OkTlh4ZRHCO1rTPAcARktTryMwMmplxd9g43RKL+yFsGc
 fapA==
X-Gm-Message-State: ABy/qLb0NcAhaeEuCYnQshPsgS1Wj/0lTH3VMSbJRWc1FsxebMUbC1Ix
 e0pGwfQvXG1KVIHRBsCYSvPlww==
X-Google-Smtp-Source: APBJJlGI1MnjiDn7TijmPyIOnYvBL3ptuIpFuRuga4F2nq1AVmD3c0RdD3GmqNDv3xebTxq2pTvshQ==
X-Received: by 2002:a2e:8546:0:b0:2b5:9778:7ce2 with SMTP id
 u6-20020a2e8546000000b002b597787ce2mr4719432ljj.15.1688778260413; 
 Fri, 07 Jul 2023 18:04:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 17/17] drm/msm: drop mdp_get_formats()
Date: Sat,  8 Jul 2023 04:04:07 +0300
Message-Id: <20230708010407.3871346-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the function mdp_get_formats(), which became unused after
converting both MDP4 and MDP5 planes to use static formats arrays.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 24 ------------------------
 drivers/gpu/drm/msm/disp/mdp_kms.h    |  1 -
 2 files changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index ba9abe8b3acc..0fe430af9523 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -183,30 +183,6 @@ const uint32_t mdp_rgb_yuv_formats[] = {
 
 size_t mdp_rgb_yuv_num_formats = ARRAY_SIZE(mdp_rgb_yuv_formats);
 
-/*
- * Note:
- * @rgb_only must be set to true, when requesting
- * supported formats for RGB pipes.
- */
-uint32_t mdp_get_formats(uint32_t *pixel_formats, uint32_t max_formats,
-		bool rgb_only)
-{
-	uint32_t i;
-	for (i = 0; i < ARRAY_SIZE(formats); i++) {
-		const struct mdp_format *f = &formats[i];
-
-		if (i == max_formats)
-			break;
-
-		if (rgb_only && MDP_FORMAT_IS_YUV(f))
-			break;
-
-		pixel_formats[i] = f->base.pixel_format;
-	}
-
-	return i;
-}
-
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 		uint64_t modifier)
 {
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index 11402a859574..1b2ccf7e7de6 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -91,7 +91,6 @@ struct mdp_format {
 #define to_mdp_format(x) container_of(x, struct mdp_format, base)
 #define MDP_FORMAT_IS_YUV(mdp_format) ((mdp_format)->is_yuv)
 
-uint32_t mdp_get_formats(uint32_t *formats, uint32_t max_formats, bool rgb_only);
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
 
 extern const uint32_t mdp_rgb_formats[];
-- 
2.39.2

