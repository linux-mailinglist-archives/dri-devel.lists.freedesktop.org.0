Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9445F7677BC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 23:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B21710E791;
	Fri, 28 Jul 2023 21:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2288310E6BB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 21:33:34 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe10f0f4d1so4438900e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690580012; x=1691184812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tx2RpKD/I01eO5CT35reZoOMEgApWpiIpC+vQpwHVcI=;
 b=oZe9MPO63fYpQrpSVlsXK/PHCxZdnNgrTy/v7nCfQHVl/uY+Xy95+UvGXJzVGBwkXh
 dX8o/1GX8EOECZcTYOlWHl/plCPxt3yQgrhvi823KNm2BEwyFpIrI8l9ihlIrpnw/FLP
 05gTkXKIvcUTEaKx+UPc/3jSmoNtRqU9rfELH4gqJHDYMPlk0LGtTHVjGNyOZTvo2C4e
 LhMLjBrbapwrknBfMAe+apa1rO9SBv1GrJxJquw3gcUJBhkc7bbT3+/2WMl414H84A8W
 kFVRLC50W1pbFz34O9rzA3GSCmLu9FcPfbTbFVSGieCHbGQelqZfU2GGjtFH8o9HsDCl
 KO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690580012; x=1691184812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tx2RpKD/I01eO5CT35reZoOMEgApWpiIpC+vQpwHVcI=;
 b=SuZu54onxlELHDln564W44i2QwXUSxonkoVIyIiIUGe+/CcFfywxGIZXZLmrNxXAnb
 oaqLDooBYDy4IIBkUd+3cyPpYFO6416g30FmmpTJJn1he8PRHHb2pGsDZQrHNkUr+kBs
 g35ChpvuiudTWypYrC2/pySz/7kKowMBEE1V+d+UwW+IfprVQOvn1FoaLt5RXVG+EgwY
 pbYQY+QD5FsU38wUHDHZf1EhEQg+T1B+UcCSJhcWa7V3LTIyGWKOQpu6k6oxCvlKiiMC
 e7Ck7o20dvKk3qjALhsErG3xbWk6mwqTxyfOpdhUyhiJJYy7VCF6yzI78YlBeZPbxEne
 7BGw==
X-Gm-Message-State: ABy/qLZD0go1CALZK5/p5WWakSlBxikYgmYJBCbnxRqeTCovEvePBKOO
 nzW+cxoZmtStZYyDxKyiRFslig==
X-Google-Smtp-Source: APBJJlFrDnMF7MUYSEK8kqgYUshR7olGt7XfXwiuljMDEEHN5nPcBN4uOwFbFKUhecTRWEShytcJIQ==
X-Received: by 2002:a19:9158:0:b0:4fe:599:5684 with SMTP id
 y24-20020a199158000000b004fe05995684mr2347479lfj.34.1690580012329; 
 Fri, 28 Jul 2023 14:33:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 14:33:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 7/7] drm/msm/dpu: drop BWC features from DPU_MDP_foo
 namespace
Date: Sat, 29 Jul 2023 00:33:20 +0300
Message-Id: <20230728213320.97309-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
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

The feature bits DPU_MDP_BWC, DPU_MDP_UBWC_1_0, and DPU_MDP_UBWC_1_5 are
not used by the driver, drop them completely as a followup cleanup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5c21782b2231..a5389e7759f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -32,10 +32,6 @@
  * MDP TOP BLOCK features
  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_BWC,           MDSS HW supports Bandwidth compression.
- * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
- *                         compression initial revision
- * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
  * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
  *			   in a failure
  * @DPU_MDP_VSYNC_SEL      Enables vsync source selection via MDP_VSYNC_SEL register
@@ -46,9 +42,6 @@
 enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_BWC,
-	DPU_MDP_UBWC_1_0,
-	DPU_MDP_UBWC_1_5,
 	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_VSYNC_SEL,
-- 
2.39.2

