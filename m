Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCEE790FDB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 04:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830C010E275;
	Mon,  4 Sep 2023 02:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9DB10E274
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 02:04:57 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bcfd3220d3so12523291fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 19:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793096; x=1694397896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VHLsmawO8YJUbD7foYhvrS8ZuNZpxIJ9tps5XjxyA5M=;
 b=Rw+XsBbrADs9a9uCvRetxwmTnOHEudTLkndRGPAVepByoVqXt6XFZcbzspOPLU9OTp
 KOhrO19Hh9VqCqp8Rube3STpyq34qkwA6JhzrLyzxO2y3Oulxmecqq5g1IRrVMg99XyM
 GcTwtgpfnuoQvdCPbZGv9L28eeppWWgQ9gsX6qjOyXfNCayEESCK3zYyXpKDKAaKIGZe
 MtsjpktwJr6YpQjM+AGAj7clfTbor7ti3F17wC4/zy51aQVLkRC9ygRo0HVPl/OmeNYS
 Slck/tR1uWGwb7PuNCsQ7oHOCbD8w2icjiCSDQ1NBdAbw4wmvVbIzXEEyjCLI/dKZlpr
 R2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793096; x=1694397896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHLsmawO8YJUbD7foYhvrS8ZuNZpxIJ9tps5XjxyA5M=;
 b=Ef2sbaBFCYebJySXHyL7GuebszxpB86kWXKfK0EubENpCPLU3jLi48xyM/n1Nw9Tcb
 Q+GF2tgavdIxuQ0DkJpQjIduE7dwHJomcJn9tqCItJ3XJ0MpJB5lqAwqHbi9ekhrQKFX
 tuKNLcOl/fPqZ7RwhyFk080JChAcuWGJYDUsDUrKwUf5IKVQJ7/PP0+45xYs91Ldq0dN
 7YkBGc8mXf5QZ2dDwWiz4Q5fVBB+Q86F7BZWc0N6FvQokT1Wqi+4CXmpFQfEmo3u3GWQ
 ZVf+tZLSZJ9sTSNKapd4w0Zq9QajuNI9ee+r0HCTdJ8/OYOrXALITxEn8omxqi6SrYGA
 r/eA==
X-Gm-Message-State: AOJu0YxBf1g8Nl22baQBfTgObwBTMFG7/ADI5D1pYwStI5oD/uKtZEtX
 S7M+0zZimlVh/3gvH/6iPxfgtA==
X-Google-Smtp-Source: AGHT+IE+2Yfq4u0kqraestEWo6xIjCVBQAPimXZVSpTk8IG0P/wMEfJmC/oNd+wc9c9gApNKbSJjTg==
X-Received: by 2002:a2e:888f:0:b0:2b6:de52:357 with SMTP id
 k15-20020a2e888f000000b002b6de520357mr6156564lji.40.1693793095982; 
 Sun, 03 Sep 2023 19:04:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 1/8] drm/msm/dpu: inline _setup_pingpong_ops()
Date: Mon,  4 Sep 2023 05:04:47 +0300
Message-Id: <20230904020454.2945667-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
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

