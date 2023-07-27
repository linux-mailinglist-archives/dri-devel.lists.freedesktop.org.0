Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9B765887
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF1810E5CD;
	Thu, 27 Jul 2023 16:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5D410E5C8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:21:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5221f3affe4so1468619a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690474874; x=1691079674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FuApF2tyajHL/s2/ZcYG8M2Dg4vS+5aqnQz+jLrEH3M=;
 b=dDEQdWseFklTkgszol5mc6NqRBQPRwcLuQLK8rx3rGK4FeqxoTdKXYnwhPnWtDp+Ue
 Vb7rZKl0pt1DWYdGIrS2KnH9h9Nhk+4EZii0j+3+XBY6T/PaaIIe6ZjTr9gD2gqHgy7Z
 E8f+ezZtcpwiLzwzEfJw6ZeNeEl0Flj3IUZHpGiosy/8tb0USyTYcmDScit6cDG/AbN+
 Vqenz0DZkX2OO9cnEtBadDwisbl28fCqvnDC0jF8PXMy2lH3DmSuMXjtWpXoUiTVOFB8
 3WB5G/urRdy3T0Y8DXVANKnTJW5sgPQfnN5btRMXrrOnv0xtiTfN415h2fO4O+qz7MB4
 h1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690474874; x=1691079674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FuApF2tyajHL/s2/ZcYG8M2Dg4vS+5aqnQz+jLrEH3M=;
 b=Hii0y5bbvBfx4LmhyfzqEp+79vKbWzHVYE4AFm316a55IJHG8hFDaDzCI692KVJakt
 tbn95Ga86T21PrXS4Ntvz9bwWJlYhKXxztXea54CgobxYl5lKu/PmnpElO8OaLgZty0N
 S4x4aGBncZLBjC0B6RLSEK2VVKcJXpRYPpWjKB6GOnEdqEDnh0kes1clXDddXGTsjXJ8
 CVwBcmITkVwdgLP+AYjLLnb9ZJQsLKuEzetwjQH8gKAOSbHf8Uv64FbupohcHt3iGqXg
 bAyKRWtkuOU8HTvZXvXHbKnDt3SFWFtxWJYXuv7OIV2hJdjs64a9J++EeGStSmPXMACa
 z3YQ==
X-Gm-Message-State: ABy/qLbqm3RPsEo8hK2Fic9ix6KLuROL5LPp8e3BrZDwquNiAdGvu3aB
 w5lFwPDkw1ExGXCWi+bRklqh6g==
X-Google-Smtp-Source: APBJJlGaoWleLDRiMflrFY4jdKgQODEhZRFM+2J6NesFgS8dSuuubTF9uG1sTs08BdI9WELgtgOSjw==
X-Received: by 2002:a05:6402:341:b0:522:5873:d4aa with SMTP id
 r1-20020a056402034100b005225873d4aamr2411878edw.23.1690474874205; 
 Thu, 27 Jul 2023 09:21:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:21:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 7/7] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
Date: Thu, 27 Jul 2023 19:21:04 +0300
Message-Id: <20230727162104.1497483-8-dmitry.baryshkov@linaro.org>
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

As the INTF is fixed at the encoder creation time, we can move the
check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
This function can return an error if INTF doesn't have required feature.
Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
useful, as this function returns void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 37 +++++++++++--------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 04a1106101a7..e1dd0e1b4793 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -325,24 +325,17 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	unsigned long vsync_hz;
 	struct dpu_kms *dpu_kms;
 
-	if (phys_enc->has_intf_te) {
-		if (!phys_enc->hw_intf ||
-		    !phys_enc->hw_intf->ops.enable_tearcheck) {
-			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-			return;
-		}
-
-		DPU_DEBUG_CMDENC(cmd_enc, "");
-	} else {
-		if (!phys_enc->hw_pp ||
-		    !phys_enc->hw_pp->ops.enable_tearcheck) {
-			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-			return;
-		}
-
-		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
+	if (!phys_enc->has_intf_te &&
+	    (!phys_enc->hw_pp ||
+	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
+		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
+		return;
 	}
 
+	DPU_DEBUG_CMDENC(cmd_enc, "intf %d pp %d\n",
+			 phys_enc->hw_intf->idx - INTF_0,
+			 phys_enc->hw_pp->idx - PINGPONG_0);
+
 	mode = &phys_enc->cached_mode;
 
 	dpu_kms = phys_enc->dpu_kms;
@@ -768,9 +761,21 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
+	if (!phys_enc->hw_intf) {
+		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
+
+		return ERR_PTR(-EINVAL);
+	}
+
 	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
 		phys_enc->has_intf_te = true;
 
+	if (phys_enc->has_intf_te && !phys_enc->hw_intf->ops.enable_tearcheck) {
+		DPU_ERROR_CMDENC(cmd_enc, "tearcheck not supported\n");
+
+		return ERR_PTR(-EINVAL);
+	}
+
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
 
-- 
2.39.2

