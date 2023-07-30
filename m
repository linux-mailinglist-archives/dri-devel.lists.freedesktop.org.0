Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB13E7682D5
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 02:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D46710E1DE;
	Sun, 30 Jul 2023 00:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C36A10E12F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:22 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so5344520e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677320; x=1691282120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B08+U/XiL1/l6dGTvcLD4HwsDFsKFx3gFQfwyphkLoE=;
 b=IhlpL+2CV3gPonbpS6zYM3Zx6w8mkhwAh4iiUCLpWCYRS3JL13M4/ZNaeyb+Lzdr2h
 CLG/qSR6ujhVH3BJROEX6QbQ7kDHbrEXSfn2abI+sW2jFN9TwwGo/yOk+mDJDpWKiZ01
 4MmoSTELmeG9h/Ahnqtv3iTor3sO0FGyE+QopGxR1/oF87D4D+LMapZs4SOs5lDqGmPH
 t/GeLH1IoFc/IhcMJ1Qj8LZTfTNJsnFcUeIueQHJCVgMpRWU/d6bHLsnNeOU2JtI1To0
 RZaZHpvZ4nz+Jfq8Fetld1r+pbrI81qLCpPGUy6kcw5SLbwTrTlS54Wrj6tVAJxpy3e1
 ecoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677320; x=1691282120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B08+U/XiL1/l6dGTvcLD4HwsDFsKFx3gFQfwyphkLoE=;
 b=NdbtWJhLv84KojfVJLqODregDxiaYCMLCNm3zt4bv3c4amEtIFf7lxsnK8tcTU6Sn1
 5FsMEx3tEsQ6BgqFjNsLhH7N33fimM/OqAq+eaTmW3xFD+kvuV7HlnHqwYQdw9SFAVyl
 jnxxhinkN52gSMuQ6LUUjKzpF6kktVHiGMpV/5SRn+ua3TfJ0NDWjU5JhLnI0xySVYiL
 5YkdBCnVofK+uUJxg4YyabjHdbKijciD54qUb1viv4oKRnsFTseMvHEqqbGqBQCLeEO+
 u4ROjsEdqhltagpkvrBxPV89uodaDjIG33SPL950inwh2lQO9RC+NylLik4glC8Boe4l
 q9vA==
X-Gm-Message-State: ABy/qLa+P95n5e+HWVe4Gek2Jy9J2QJkZ9HyG7QPEA6MqqQBnLy3LXzI
 ja6t15Y92Sv9zD5w/1dQ5I7zmg==
X-Google-Smtp-Source: APBJJlGCO6R4FOu45zyNfCfgOEGN3dn4q7ZAFQLIJkdmLEBmM9VEiFjGCaDhmqulLWa3Tgn3QMxANA==
X-Received: by 2002:a2e:988b:0:b0:2b6:decf:5cbd with SMTP id
 b11-20020a2e988b000000b002b6decf5cbdmr3901235ljj.36.1690677320513; 
 Sat, 29 Jul 2023 17:35:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/8] drm/msm/dpu: inline _setup_pingpong_ops()
Date: Sun, 30 Jul 2023 03:35:11 +0300
Message-Id: <20230730003518.349197-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
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

Inline the _setup_pingpong_ops() function, it makes it easier to handle
different conditions involving PINGPONG configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 39 ++++++++-----------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 437d9e62a841..9298c166b213 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -281,27 +281,6 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
 	return 0;
 }
 
-static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
-				unsigned long features)
-{
-	if (test_bit(DPU_PINGPONG_TE, &features)) {
-		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
-		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
-		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
-		c->ops.get_line_count = dpu_hw_pp_get_line_count;
-		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
-	}
-
-	if (test_bit(DPU_PINGPONG_DSC, &features)) {
-		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
-		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
-		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
-	}
-
-	if (test_bit(DPU_PINGPONG_DITHER, &features))
-		c->ops.setup_dither = dpu_hw_pp_setup_dither;
-};
-
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 		void __iomem *addr)
 {
@@ -316,7 +295,23 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_pingpong_ops(c, c->caps->features);
+
+	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
+		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
+		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
+		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
+		c->ops.get_line_count = dpu_hw_pp_get_line_count;
+		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
+	}
+
+	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
+		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
+		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
+		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
+	}
+
+	if (test_bit(DPU_PINGPONG_DITHER, &cfg->features))
+		c->ops.setup_dither = dpu_hw_pp_setup_dither;
 
 	return c;
 }
-- 
2.39.2

