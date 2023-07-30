Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D1A7682E6
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 02:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8469710E244;
	Sun, 30 Jul 2023 00:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9199A10E233
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:25 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b933bbd3eeso50140581fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677324; x=1691282124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLNzq9clNx/uWlRBBWtOxyDc+fCrCWWRwY8KEgjzC9M=;
 b=YWm67ldQanaYSYkq1JX4JLxy7bZmb8MrMtA/CmatXuK+eZAECwkT4gOreMlVns8iTs
 f8YGFaNcZQF2H/kYm8X/K1KyRggAC8ClrqYfh3CFflDZ2/ktpFJ0YjFssBRq57EY5Ypg
 AoYLyhgRXok3+56NHHIDNXDwBezQr8fCoYnh4CshOb9lb7+MNz3Kz6FLhGBSkslXtuuW
 5opCWoq5i6QtL86AV7Sys+uskgt7SFWOoCq6L3wrss9y0CQ5lctADcu+aSIeRSbuBWht
 hw3chSq7GvkJ/hMFjNp3khFCmZ6sBUnMG9UGyKTTnC1giqOFPzCqBmfDCwQajPgGXIkA
 utdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677324; x=1691282124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HLNzq9clNx/uWlRBBWtOxyDc+fCrCWWRwY8KEgjzC9M=;
 b=ilmvFFMVooggrG57mjJIvXRP++JGaTIKiJEeqREQQx/TJtjvhtI9fBpUSNc2HT6R5B
 wYbV+QNW0JvSQNBJhXWmHY/egGT5Y/XXPUkIzUxOhxcAccpmUTFJjUS00t6aj6OKjTKd
 V+INH7iY45RapPC4Wvk8gzQQ+oR79P+ANdv1WtXne34xi8BS4auvRV8Qiagicw8igi8V
 3b/JI3nTGE7OmhE1YbzPe52Jwq29/u/ObILcXIXTYZm5WVpvBjnMbqPHRuRpVVpLQ/OC
 RoFxTEbDZCCEFpkCMJgN0GXZrQpGb0P8inQnnyuQaG30eaqCcYOEyXcafKtetrNPZsaY
 qDPQ==
X-Gm-Message-State: ABy/qLZqKZNT9rnkF9NfJy/XbsZpA7qJt2o2izaWA2IO3AJTrUkWEioT
 jgeBKHqn3J+TZET2cNesSgbjaA==
X-Google-Smtp-Source: APBJJlHrONXwmzVZWBgRmgOzGs/gb8B2+l5XSBdHjZVuWCkSpRk+Ou8GzmtamNxK9nSpmCMhuYmbCQ==
X-Received: by 2002:a2e:9044:0:b0:2b9:575e:5298 with SMTP id
 n4-20020a2e9044000000b002b9575e5298mr4704915ljg.13.1690677323961; 
 Sat, 29 Jul 2023 17:35:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 4/8] drm/msm/dpu: inline _setup_intf_ops()
Date: Sun, 30 Jul 2023 03:35:14 +0300
Message-Id: <20230730003518.349197-5-dmitry.baryshkov@linaro.org>
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

Inline the _setup_intf_ops() function, it makes it easier to handle
different conditions involving INTF configuration.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 48 ++++++++++-----------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8ec6505d9e78..dd67686f5403 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -524,31 +524,6 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
 	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
 }
 
-static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
-		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
-{
-	ops->setup_timing_gen = dpu_hw_intf_setup_timing_engine;
-	ops->setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
-	ops->get_status = dpu_hw_intf_get_status;
-	ops->enable_timing = dpu_hw_intf_enable_timing_engine;
-	ops->get_line_count = dpu_hw_intf_get_line_count;
-	if (cap & BIT(DPU_INTF_INPUT_CTRL))
-		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
-	ops->setup_misr = dpu_hw_intf_setup_misr;
-	ops->collect_misr = dpu_hw_intf_collect_misr;
-
-	if (cap & BIT(DPU_INTF_TE)) {
-		ops->enable_tearcheck = dpu_hw_intf_enable_te;
-		ops->disable_tearcheck = dpu_hw_intf_disable_te;
-		ops->connect_external_te = dpu_hw_intf_connect_external_te;
-		ops->vsync_sel = dpu_hw_intf_vsync_sel;
-		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
-	}
-
-	if (mdss_rev->core_major_ver >= 7)
-		ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
-}
-
 struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
 {
@@ -571,7 +546,28 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 	 */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_intf_ops(&c->ops, c->cap->features, mdss_rev);
+
+	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
+	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
+	c->ops.get_status = dpu_hw_intf_get_status;
+	c->ops.enable_timing = dpu_hw_intf_enable_timing_engine;
+	c->ops.get_line_count = dpu_hw_intf_get_line_count;
+	c->ops.setup_misr = dpu_hw_intf_setup_misr;
+	c->ops.collect_misr = dpu_hw_intf_collect_misr;
+
+	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
+		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
+
+	if (cfg->features & BIT(DPU_INTF_TE)) {
+		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
+		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
+		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
+		c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
+		c->ops.disable_autorefresh = dpu_hw_intf_disable_autorefresh;
+	}
+
+	if (mdss_rev->core_major_ver >= 7)
+		c->ops.program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
 
 	return c;
 }
-- 
2.39.2

