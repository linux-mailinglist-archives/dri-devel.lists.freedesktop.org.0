Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A210765878
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A6B10E5C6;
	Thu, 27 Jul 2023 16:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E74110E5C0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:21:09 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51de9c2bc77so1458507a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690474867; x=1691079667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ff7pcNWnC+mCuZW5Iqk7Mr4Q5RnrHyj1/dSEByNgwvE=;
 b=F7pTPmX05AChk1JmSOZtUfjAyYV+Q2cFNbhOlOCcypcVPx+lBq5wHlzB5rvZCDdrTr
 ggAZcQ3p9w9XVkVkzwCaJk8iyHjEjh74/xUs5MlBz2xtByIImX0q1tOdDmoJ84XotkXz
 2ZowCpOR05X0F5YL625Y2QFaxccIbeZ+BPjm8JDzm+Ala7MKIP0OZFrruhwh7mZoVSsW
 lq3R25/UZsLptTYgrgNPViPntqdd6Mxc5vxhlLHpuTZ7EgkNApJ/xCjPOVutSQ6SZ8pM
 xJRkT2VweOVWB4hX2uAosPDL33Fb5rX8SyiYATmrixO9lvMUgVWzOVTL+RKD3KBfQUv2
 rmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690474867; x=1691079667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ff7pcNWnC+mCuZW5Iqk7Mr4Q5RnrHyj1/dSEByNgwvE=;
 b=SMvWcadQHV/7Mf260KsQG4Aj6t/qcplhZahnzJgn8QQImAkfSzCEN8kILGM6Nskkdg
 b1I4/Zym8pjnxvNJLkWS7P58aMH5SZNSLWV2RIBdsP42khE9O/83FpWIXZLDUF9Dl5t5
 /mwkg3DNicGK/gAArCljRKTzWR77dHo4FGrlrbLO+Fgm7kiqI5gvd11wTxvumikvcH/v
 eUFDMk36fwandlkpz0zdiM+yyrzJTnoIHB3vFtNaXk2/zD4Q3wRBsMiCX4itbdTK2jmr
 SuVLWjX0R66G56qU5nNEDhyXKDz5sgUZdnmuTbEWNVg0bmCWhw7zSw1HZJZkKh29yA9v
 NEqQ==
X-Gm-Message-State: ABy/qLaJalS/Vqvalng9q7fM2VmLmFmDTsI6Td1SSHT0CARRX2H+WEnN
 mHuiCfmW6Re+psmam/BmsTH+zw==
X-Google-Smtp-Source: APBJJlHUnevxUVtsFnPoIsbTNstCQExHnpMiK/GlYKJcitznW/AdxALaLgtqVPtPPWeDNk6ZiSqicg==
X-Received: by 2002:a05:6402:785:b0:522:1f09:dde3 with SMTP id
 d5-20020a056402078500b005221f09dde3mr2395007edy.3.1690474867464; 
 Thu, 27 Jul 2023 09:21:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:21:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE operations only when
 supported by HW
Date: Thu, 27 Jul 2023 19:20:58 +0300
Message-Id: <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
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

The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
Rather than checking for the flag, check for the presense of the
corresponding interrupt line.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 9298c166b213..912a3bdf8ad4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 	c->idx = cfg->id;
 	c->caps = cfg;
 
-	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
+	if (cfg->intr_rdptr) {
 		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
 		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
-- 
2.39.2

