Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BA0712312
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 11:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF05310E7D3;
	Fri, 26 May 2023 09:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4CD10E7D3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 09:09:48 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2af2db78b38so5130691fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 02:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685092186; x=1687684186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lfip9WRM9noL0Gy0TC2bjz3Y0WgSk0gvAx7c/r1Jxko=;
 b=tC3msow/rYHS8fmhMtLDMTusljx5I9UlxeUipOQ+QzT+ZBCWBVBdTgzOsw8apyiVWn
 LfCicP6fAGq1Dsz6bYsGWGZOsUwQAYDHwCyiaGqge3f4jwJfgPQMU5LW4b+V33DxRNiJ
 cbC0WbRvoheZa8bc6Cto4grBIB0Un2a6u38AoLLBi7sPSf3ZQwZZjkhzSx9Kl4oPH1Yv
 kuHebrCdxIoXaG6W9nAUVjLLI8s2ukwNPTiXgI+6KBU+F5wMamkAoGcJWOdi20cnWL+c
 AVQrN7tHZ0SSQkL8NL2t9k/vP+BXrIArUjBYvXiFyc92kLBcjnzwFAF32UfAVIszKAKF
 zOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685092186; x=1687684186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lfip9WRM9noL0Gy0TC2bjz3Y0WgSk0gvAx7c/r1Jxko=;
 b=lvS9ZHoe430/4V8y3hoUMNOszT17HIeHPkvQpJPblUcJDXr9JuW0eMbdYdsQO9MdKT
 ONJfG5X96bO++LYRk10NUkX/FQf7jC5qH3E+WzZRTSDJJzkr0gImifRIHuciNzxALYEi
 5IP/r8SsluoDopD9NevSmF1uZcHKpAy7DsCl105qr8C1Vnhsmb/BTIbV0QaEk67zy8bU
 /agh/nPNsFC7fiprPCIXLZNIohsSYGz1/iub94vjqyfHwO+/jVlFwzZ4OECXDxwPpsJE
 wJKnyps6ZOiEEIzDPR6pfCOF8qM5P4xQjzBs9cObCjOAzbyAcVWisqE4E8aL7i+uLM8J
 VHKQ==
X-Gm-Message-State: AC+VfDyu5/ZygMCnYCXamiSF/Js0mp25djG9ebQjRfrzqKiOvWzN8EZV
 4uROmIhlIWjHS2Ast/+Uo0kWTQ==
X-Google-Smtp-Source: ACHHUZ7nSrpogwjiwCp+uhudeJqoYumglTZ0HcqOUiICGf86YSnpKgCMPXXDYHYk5q9AWFYo7TD8Kg==
X-Received: by 2002:ac2:4855:0:b0:4f3:b6b8:dabb with SMTP id
 21-20020ac24855000000b004f3b6b8dabbmr395149lfy.13.1685092186562; 
 Fri, 26 May 2023 02:09:46 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v24-20020ac25618000000b004cb43eb09dfsm538992lfd.123.2023.05.26.02.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 02:09:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
Date: Fri, 26 May 2023 12:09:45 +0300
Message-Id: <20230526090945.439639-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 -
 5 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ebe34eda6e50..7fd3a13ac226 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2102,8 +2102,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
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
index 1a4c20f02312..3130c86a32cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -66,7 +66,6 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
 				phys_enc->hw_intf,
-				true,
 				phys_enc->hw_pp->idx);
 
 	if (phys_enc->hw_intf->ops.enable_compression)
@@ -556,8 +555,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
 				phys_enc->hw_intf,
-				false,
-				phys_enc->hw_pp->idx);
+				PINGPONG_NONE);
 
 		ctl = phys_enc->hw_ctl;
 		ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 3a374292f311..220020273304 100644
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
index a2486f99d3c2..918d154848b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -268,7 +268,6 @@ static void dpu_hw_intf_setup_prg_fetch(
 
 static void dpu_hw_intf_bind_pingpong_blk(
 		struct dpu_hw_intf *intf,
-		bool enable,
 		const enum dpu_pingpong pp)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
@@ -277,7 +276,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
 	mux_cfg = DPU_REG_READ(c, INTF_MUX);
 	mux_cfg &= ~0xf;
 
-	if (enable)
+	if (pp != PINGPONG_NONE)
 		mux_cfg |= (pp - PINGPONG_0) & 0x7;
 	else
 		mux_cfg |= 0xf;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 72fe907729f1..e2d15e89880d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -89,7 +89,6 @@ struct dpu_hw_intf_ops {
 	u32 (*get_line_count)(struct dpu_hw_intf *intf);
 
 	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
-			bool enable,
 			const enum dpu_pingpong pp);
 	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
 	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
-- 
2.39.2

