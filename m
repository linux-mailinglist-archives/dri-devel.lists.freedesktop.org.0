Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81072146B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF8110E0DD;
	Sun,  4 Jun 2023 03:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D830410E0DC
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:13:11 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b1b084620dso25836901fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685848390; x=1688440390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=etl4iORwrlQXokFeNE6rOHv8Ku5bBU279rEgdfGk7yU=;
 b=WB9SfAQO2bGNu3bPZzs3u57E1R56mudgGHhJn3pn+RVbKJfknAGhpUAfyuYo6nWKG7
 t/+drd6D+wHEz++M2sRRbFtDcoZQq5y02iSlzkHFUXNoJ/7dogQL0pVxBienzrCOVfpA
 TnRQfU0dYqwqQXc29CSUGU3BTFNFRb/G5T6e6vQc2YD37Zgf77hlD36IzDhzUGltbCFB
 BEAeF3/LNjS5cK3wWtdcC0GGQrMgXO/r0FrFzyIBy/+Uz8k1SPV8uy3PLT9Ai7GUaVVF
 TIhHeN+0dY+i8yNzQjf60HgE3N5/4BWDO07Rp8XLDewoYbX1kV+v/6wWIb/QwXLL2aaW
 iQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685848390; x=1688440390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=etl4iORwrlQXokFeNE6rOHv8Ku5bBU279rEgdfGk7yU=;
 b=L+X/s8XsXxyDz9xALjJSxryk80AM2wvLZ7qDCvOqCJxNTeyO2DXrpbT4XibEBAwepJ
 4o2qh7yMPRR1T4JdqoVx2xIV8fjTYeWgUGZC3Re0uYeRMmnpHldbhh34RUQHwioDmeu6
 miKJuYVEVchw3uVHGbHkMmeKu2MdGswEU7Y66cRYUaQisiar7TnQexzw6ZwmgpfUlo3d
 9mG80lvAcLjDuJ4MkozDPxaRslOec9abfKYYj7EupiBZV5hJgWxhXeWBmVShLawhXPmv
 rLB2ljoMx0crc3t8ejMGShutisKc0Y4YFT/k3HyH/Hsdld23Gy9+3y6uO22aVoTlY+DU
 FYIA==
X-Gm-Message-State: AC+VfDwtBVtTrNtfuSvRdj2/C/KLUxp/jRijgFR6AR5yMn4xE4aTQofS
 liP4pwOX+fjYeBgQO7w0pcvi5etDxsJknPWBXBM=
X-Google-Smtp-Source: ACHHUZ6yvwyVJi+JSCN266EYd49i9PZbvrLz4TVe07etuergHb2kUELvbRsSHLnoz+1wZHNjPXFyxw==
X-Received: by 2002:a05:651c:104a:b0:2b1:c09c:ee4a with SMTP id
 x10-20020a05651c104a00b002b1c09cee4amr778127ljm.26.1685848389985; 
 Sat, 03 Jun 2023 20:13:09 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a25-20020a2e8619000000b002ab5ad42f3fsm856261lji.92.2023.06.03.20.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:13:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/2] drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
Date: Sun,  4 Jun 2023 06:13:07 +0300
Message-Id: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
dpu_hw_intf_ops::bind_pingpong_blk() callback and uses separate boolean
flag to tell whether INTF should be bound or unbound. Simplify this by
passing PINGPONG_NONE in case of unbinding and drop the flag completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Dropped != PINGPONG_NONE (Marijn)

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 -
 5 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2e1873d29c4b..3e543d664c98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2090,8 +2090,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
 				phys_enc->hw_intf->ops.bind_pingpong_blk(
-						dpu_enc->phys_encs[i]->hw_intf, false,
-						dpu_enc->phys_encs[i]->hw_pp->idx);
+						dpu_enc->phys_encs[i]->hw_intf,
+						PINGPONG_NONE);
 
 			/* mark INTF flush as pending */
 			if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 4f8c9187f76d..107f0eff958c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -66,7 +66,6 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
 				phys_enc->hw_intf,
-				true,
 				phys_enc->hw_pp->idx);
 }
 
@@ -553,8 +552,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
 				phys_enc->hw_intf,
-				false,
-				phys_enc->hw_pp->idx);
+				PINGPONG_NONE);
 
 		ctl = phys_enc->hw_ctl;
 		ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index e26629e9e303..662d74ded1b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -287,7 +287,6 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
 				phys_enc->hw_intf,
-				true,
 				phys_enc->hw_pp->idx);
 
 	if (phys_enc->hw_pp->merge_3d)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 5dce18236d87..530f82e34c1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -267,7 +267,6 @@ static void dpu_hw_intf_setup_prg_fetch(
 
 static void dpu_hw_intf_bind_pingpong_blk(
 		struct dpu_hw_intf *intf,
-		bool enable,
 		const enum dpu_pingpong pp)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
@@ -276,7 +275,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
 	mux_cfg = DPU_REG_READ(c, INTF_MUX);
 	mux_cfg &= ~0xf;
 
-	if (enable)
+	if (pp)
 		mux_cfg |= (pp - PINGPONG_0) & 0x7;
 	else
 		mux_cfg |= 0xf;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 73b0885918f8..33895eca1211 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -88,7 +88,6 @@ struct dpu_hw_intf_ops {
 	u32 (*get_line_count)(struct dpu_hw_intf *intf);
 
 	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
-			bool enable,
 			const enum dpu_pingpong pp);
 	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
 	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
-- 
2.39.2

