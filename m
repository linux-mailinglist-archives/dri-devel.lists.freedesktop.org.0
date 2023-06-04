Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E95F72146C
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F0910E100;
	Sun,  4 Jun 2023 03:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A974F10E0DC
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:13:12 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b1a3fa2cd2so41823321fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685848391; x=1688440391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YYLA29VsU9QCk6j7LBZzCA0nCXZou+a5ye4Thvl7Rxo=;
 b=HztxMKCjxn2iCy5+lKlyACMqndYqI1V/ksSjlVruigvSq/ug6f1EoUI/zC6A8+34pP
 F57WAu/rYH6GQToz7vOezLYQYc3o5sVYbi+lgvB+a0KlxYqwykMDE8ovLDQWqOc44Grh
 m2ntvWcA6BCyVJSBcJhmUcrHbJMOoZG0QyvS64kFHmesYqraZkR5JbTEVPij97ljFnRU
 MYUPrxrS+c31XW5CYJOOOflOHsDfPhV7FMpUp8HHr8uHGsVX/ezCqgeQTMoseL3WD5u5
 GStbySJUfL4xExFGk4cYAM2IeT2qUbLF8uj8FoxjIHnOzai2W2NBf701t2sDryi5w2+e
 /kDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685848391; x=1688440391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YYLA29VsU9QCk6j7LBZzCA0nCXZou+a5ye4Thvl7Rxo=;
 b=Dnr9s7usCfe3Iq7iC2Tv0lV/mcKpyLT/BhlJLvtvHeBGNKge5+pUZ9ioyXOZ4kcIyK
 fn4llwxcBfQy5Wt8canZZjBSAhMWbi8uZfu00r5Xmnxt/XBk0NGfX8uxAxCclkc04P7J
 26H72ymuCxeJwa8LTyCSE5md+FkopXsINM5VUCuiir3ouj9DPphWago+phPG7sI5aRqv
 QtmnhXdBYcuSeRIawxuaF8uRwp1Zx9gXko5AZut7Xtx/8d7nIDVnMNuUHejiX80PvUB9
 pHll7wKHqxXwxqB+4IvY77BndFEK86UYNU6L9WHRk8yV0Jvzv7ruPayBbqJCjY7WTPGb
 3CsA==
X-Gm-Message-State: AC+VfDwm4OoDAK8raMpT03PfiiSEqaSVvKvYlZOtZZ2P8oF76GMI3anO
 3Oqo3fsjt6JOrNQvDaEBXfTyrQ==
X-Google-Smtp-Source: ACHHUZ6C1Zsu6SNPpSrE1bjGwvHfaesKAskzT3VFGGgWgUsSxGvJTy75bbTAzHjxdUzU/gMGIGLbww==
X-Received: by 2002:a2e:86d0:0:b0:2af:18f9:ed31 with SMTP id
 n16-20020a2e86d0000000b002af18f9ed31mr2301801ljj.1.1685848390773; 
 Sat, 03 Jun 2023 20:13:10 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a25-20020a2e8619000000b002ab5ad42f3fsm856261lji.92.2023.06.03.20.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:13:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 2/2] drm/msm/dpu: use PINGPONG_NONE to unbind WB from PP
Date: Sun,  4 Jun 2023 06:13:08 +0300
Message-Id: <20230604031308.894274-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
References: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
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

Currently the driver passes the PINGPONG index to
dpu_hw_wb_ops::bind_pingpong_blk() callback and uses separate boolean
flag to tell whether WB should be bound or unbound. Simplify this by
passing PINGPONG_NONE in case of unbinding and drop the flag completely.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c           | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h           | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3e543d664c98..493905a5b63a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2080,8 +2080,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	if (phys_enc->hw_wb) {
 		/* disable the PP block */
 		if (phys_enc->hw_wb->ops.bind_pingpong_blk)
-			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, false,
-					phys_enc->hw_pp->idx);
+			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, PINGPONG_NONE);
 
 		/* mark WB flush as pending */
 		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index e9325cafb1a8..a466ff70a4d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -210,7 +210,7 @@ static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys *phys_enc)
 
 		/* setup which pp blk will connect to this wb */
 		if (hw_pp && phys_enc->hw_wb->ops.bind_pingpong_blk)
-			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, true,
+			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb,
 					phys_enc->hw_pp->idx);
 
 		phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index dcffd6cc47fc..ebc416400382 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -154,7 +154,7 @@ static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
 
 static void dpu_hw_wb_bind_pingpong_blk(
 		struct dpu_hw_wb *ctx,
-		bool enable, const enum dpu_pingpong pp)
+		const enum dpu_pingpong pp)
 {
 	struct dpu_hw_blk_reg_map *c;
 	int mux_cfg;
@@ -167,7 +167,7 @@ static void dpu_hw_wb_bind_pingpong_blk(
 	mux_cfg = DPU_REG_READ(c, WB_MUX);
 	mux_cfg &= ~0xf;
 
-	if (enable)
+	if (pp)
 		mux_cfg |= (pp - PINGPONG_0) & 0x7;
 	else
 		mux_cfg |= 0xf;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index c7f792eeb55c..2d7db2efa3d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -49,7 +49,7 @@ struct dpu_hw_wb_ops {
 			  bool enable);
 
 	void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
-			bool enable, const enum dpu_pingpong pp);
+				  const enum dpu_pingpong pp);
 };
 
 /**
-- 
2.39.2

