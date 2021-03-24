Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE33347B45
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA576EA24;
	Wed, 24 Mar 2021 15:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69796EA24
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:31 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b4so8495781lfi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V5a0SElwgMSR05OnVZxlFyzafRcs18clf2FpnQ1Pirw=;
 b=FXluN6BbG0HZTXJyP6TVendzyux+n4NQNsn62YDIl3r/Qny5xdJHvNxbxGhpTrCQ7W
 gIGKyE8tqlpcLOmjhNAa8wLoN0pp+5LDqnlf9sYGsTRyR39zxWWJPEc9S9c8FMPOV30w
 ftto/Aga4NhiyCJHnsTQYOvI/mGU5s5lSrk5WT0HYFY6HKoc7WjYfQrbpN28Kd8uQnpa
 dP3k6QNk/efsrfLBbVqgQhcahr74CzaVBPh3USS9P/HjhgDUg7WrwpRISyLcKiuTOyFF
 YZA4XfiII9nut4F8PLNh2vFUPekIPM+OhNk+fLGZGWElNWcqwYcQaCR+WhvNTOdSi1lF
 HNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V5a0SElwgMSR05OnVZxlFyzafRcs18clf2FpnQ1Pirw=;
 b=dK2SP2w6aE7N8Ub3BJffi3QvGVL0I21PZxYhn7DECqYnuorGnWctQLT52eiOhKaEIM
 M4N185dus3Smx9QiHTgsR25z7zErA4dT6pJi+5x5Quxmzx16zw6ZS7MybTDah4piJcxv
 upX7C90Z8bE5ipR/8PGD0qxYG3LxryZAxsA9gyyvB8w52qW3ooVC9YZrIveX56PqTrvk
 wUzLT6zO83/oiLGjuG049mzw0ifsBn8SkAHrPyxX4uGqARmuCv0AXmlCcvYG+Zdyu+1f
 WGM2r6tMbO0QwP+c4Dr48fvgIvLmFTnt5nn2UpAAtrLrNkVPWLZSSTDFw9H05169mGs3
 1DRw==
X-Gm-Message-State: AOAM532kvDP1CDtzAOUhkQUAv6pzWy5RPdwDvPPiMf0jBdDbVgxYnGeU
 RRjlACz3bFUUGJ/ABQ9eOO63hQ==
X-Google-Smtp-Source: ABdhPJw6w16Zus9bj6ywWeRfCOVFk45iSfhf9EZexnbh1wiTTH2GJmAbiUgKI4AgiZpogPcSPoTmFQ==
X-Received: by 2002:ac2:414c:: with SMTP id c12mr2185512lfi.538.1616598030092; 
 Wed, 24 Mar 2021 08:00:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 01/21] drm/msm/dpu: enable DPU_SSPP_QOS_8LVL for SM8250
Date: Wed, 24 Mar 2021 18:00:04 +0300
Message-Id: <20210324150024.2768215-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SM8250 platform has a 8-Levels VIG QoS setting. This setting was missed
due to bad interaction with b8dab65b5ac3 ("drm/msm/dpu: Move
DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks"), which was applied in
parallel.

Fixes: d21fc5dfc3df ("drm/msm/dpu1: add support for qseed3lite used on sm8250")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 189f3533525c..e4444452759c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -22,7 +22,7 @@
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
