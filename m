Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4930D6F2AAD
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 22:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EB510E086;
	Sun, 30 Apr 2023 20:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C727110E083
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 20:36:00 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ab25e8a4a7so17623171fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 13:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682886959; x=1685478959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5J+iFxf1ulALPVvSRXTgTvfbQT2He6CPNoNs7jBvyPc=;
 b=VBBHhsEGzJGwH7b+7+6WwqX45vTlQIaZmZKB8iwGFrpnihADVMv9NV95MaqONthA+V
 Kvzak/8iFyJzNrWbeppaFfaJRRH/Fl3CIcN8W/ZWkIW7L1gAGHQlIeL2ngLpVBAcykU6
 XRq6XqqPQ675r+OS1+hn4CCTR1EBg1qPIvRRdNo97q6F91BOychzA68Ysc+bRQ0vs154
 Tw15JB4jcO1MCw+MqgTtsEU+wA1bBQ38r679ebDfG0+p1koAn5q47Xc8wH3Laeq93Dqf
 VXaNiVwhL7rI6wlfzsPfZeDYRE8yu3W9wBlrI8VXcjk2zKoLFMIWfbQoZjZxiBwUaZB4
 ldhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682886959; x=1685478959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5J+iFxf1ulALPVvSRXTgTvfbQT2He6CPNoNs7jBvyPc=;
 b=LvEG2xhlVvZn5TDASyIfYX8U5zSRegWm3+VG4iWi8x/KgORMusOWEEZMzZv1y2vy4H
 3pJtjmDkoyJO7NTXjYtAo7xt8IOBl+HQhlXcI5eanusHimfJYkOGDrXRbCd5HdaW5Sic
 6HR/lPeOZ4iP8SDPb7oBagWv7cTJnDRH7NeHrTFxjoWUS0a8R/bn9K4MzT4+aj4kkt9F
 w6ZbM6pYs6DwywpQcRVc0ZZIbbPQPWif9ZYTOAh+bQkonZdB9fmKqUoBZQLoPgJjZeoM
 CyD+xuA9Kej3r7W3yHGv6tIZb4gg7eTvgDffDQ+QkHwJEkF/EvZa2Xb8NQu+dB4oelwN
 G/Ew==
X-Gm-Message-State: AC+VfDzHelmZ4mTw2TE1BZVyXhSZcqIKuP1FMqZMbiesLLxBSHtxLjkO
 6eQVNia7X0iOX70/4pRfit20xA==
X-Google-Smtp-Source: ACHHUZ6hAAXso5vr870a9YPhqsjmLnZ4zsuXWtqlIk3M9l9AMNkHKknxJGOg9J9duRdBLxw2von2Tw==
X-Received: by 2002:a2e:8608:0:b0:2a9:f9d2:7b44 with SMTP id
 a8-20020a2e8608000000b002a9f9d27b44mr3183297lji.40.1682886958885; 
 Sun, 30 Apr 2023 13:35:58 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b24-20020ac247f8000000b004edd4d1e55dsm4324634lfp.284.2023.04.30.13.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:35:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/4] drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during
 DSC init
Date: Sun, 30 Apr 2023 23:35:53 +0300
Message-Id: <20230430203556.3184252-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_dsc_init() can not return NULL.
Replace all dpu_rm_init()'s IS_ERR_OR_NULL() calls with IS_ERR().

This follows the commit 740828c73a36 ("drm/msm/dpu: fix error handling
in dpu_rm_init"), which removed IS_ERR_OR_NULL() from RM init code, but
then the commit f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in
RM") added it back for DSC init.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f0fc70422e56..dffd3dd0a877 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -247,7 +247,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
 		hw = dpu_hw_dsc_init(dsc, mmio);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dsc object creation: err %d\n", rc);
 			goto fail;
-- 
2.39.2

