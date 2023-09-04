Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00337790FD6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 04:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE13510E276;
	Mon,  4 Sep 2023 02:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210BC10E27A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 02:04:59 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bcb89b4767so13562471fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 19:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793098; x=1694397898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLNzq9clNx/uWlRBBWtOxyDc+fCrCWWRwY8KEgjzC9M=;
 b=WesYjuVbg9HH3czMb3FUb3F3GKaz3v8+7q6pyeIp4jk6I2/i2BdKqE6dNAmigDLSpR
 mATbtmS4+dTcTojR9HlrJfj76/bpxKrY7SYPrSVtjKEk+78JYGZ8jRZBp1Wcfg/fuaMc
 D5McqGmxpRROQTiShJyFel8Hi/XDz+A4vzzStxOxYL1uCF8wm5Oa6fPLI2ASgiiyNZ55
 ZhRXIQjRprsVrbuQZHTtOrwlCdvZnSJ1/omf+JIKDRs8q4PsxXB6W2wX2C94F06+Hhjv
 8hRqS44Ezdi+5PepynNKeIPXdT8XTiVG7N5RCVqDlMNxLQik//uCaNtSutjn+h8o5WKU
 pNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793098; x=1694397898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HLNzq9clNx/uWlRBBWtOxyDc+fCrCWWRwY8KEgjzC9M=;
 b=liOpWtOfJ58gQfsd+LhVJuZWi4rS81GkftU4YtDJx6Z02fo/8xK04skdRxMzooR8YG
 +kaz5NMdD8XFU5KPfkERWZ/NFozm4ks3CH7OAnZdEAx8dz6/CSu1iwaQiOtjW2dm1LW2
 XUbEIqLojMdtDFBptecW/foHOncogid1att7JfE0PBobefx3EiJRnuxKoy9JyOXK3mL8
 TNJUZUmnTnfINhOCHe3DGJKuKxgN6OG1qwEALryloTKucKtmzq11NCYiSEgxc/l80zgE
 NzX2sN9kMBL4/612jnt9FJjPK4DBLElRbjhMA1ouQSs3lisvZtm23yM4yfV5S96zRkvB
 /j+Q==
X-Gm-Message-State: AOJu0YyJF1dtCYXbm0kr6jfPdZoxltxC72w0K5PwHGtfwIQ+y3SSdX3L
 QFW3mUYwe6t63H0+OYVqnt3B6A==
X-Google-Smtp-Source: AGHT+IHkP8rfTayfHBwa0bIcxjuTohbwnOzqzgyIf2VEXTPMbpq5YLcCHqaSTmXhyMoMwzHfZPcdvQ==
X-Received: by 2002:a2e:9b94:0:b0:2b1:ed29:7c47 with SMTP id
 z20-20020a2e9b94000000b002b1ed297c47mr5810171lji.8.1693793098183; 
 Sun, 03 Sep 2023 19:04:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 4/8] drm/msm/dpu: inline _setup_intf_ops()
Date: Mon,  4 Sep 2023 05:04:50 +0300
Message-Id: <20230904020454.2945667-5-dmitry.baryshkov@linaro.org>
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

