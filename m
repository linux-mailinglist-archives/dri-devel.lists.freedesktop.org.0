Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20007682E8
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 02:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B2B10E240;
	Sun, 30 Jul 2023 00:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B8510E235
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:28 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9ba3d6157so49564901fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677327; x=1691282127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SmjGd6hQg5+KzT5ujuzMh2o3ciL+YNI2GkvXWKUqqAs=;
 b=ZgJVLnAfJAQUM4bSILyTLf+Im47B/dyNmIyjpw4oLc7ObYAql/7HIJvFcc5f5ihTYT
 i9Ln4Mx04ujT9NUQWmmTbnq2NPgsbno7+kUVJWslgHnU0kk+YrAXB2n6PnOZuPK3iu2q
 ZM1fOzodAF9BzogVBY/7FuouLzzYKpeMyBwCtX5hVxKNpG+FsQa5igVuW1CPKj96xrSq
 nZkom/2QU0nJ5vgVrMr3kiQjoD98jU6Gd8i7H2EimBllj+MmF3AKfI1A2lywH24Um7m/
 NOsb38b5TXSVTAjkLyiqQxZOIR6rMROneXCiKZLru4YgDJWKPp3cK99x1iyGtdx5BAOl
 Ifag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677327; x=1691282127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SmjGd6hQg5+KzT5ujuzMh2o3ciL+YNI2GkvXWKUqqAs=;
 b=U0k12AhfK/kMZ094EcRaF2o9mYVf/i/XNac3LNs5KBsA/iPMzZeS8jTYMnu7YIeTAc
 pQTydaIZj2j6e8Tp5TzQTRP51hsMM8Dusre4BLHxvo0HdDw7jAL6WA2FOjF0BvTHkqWP
 TAXVQmh1qLUCSicDcLkIwUZTeJEhV7NbWLqdW8YA6wBaIdU8CUe1AWvIVIaM1X4tkCTe
 mCy3JxCT1whaxrh7WCoOOXz0YFk6sR0QAThcRoBB5AwEfoFzWhQR1edQHPcrAe/a8sMX
 sPS7YDzA/UOOelZ/j67ocBPRTZC8w522J9kmRvD/0lEot0FOs+CtxRN3pjIv6NHsupmT
 OyLg==
X-Gm-Message-State: ABy/qLZFgHgUhPFIM6jpm0RPZB+q0LpveTuWakqAQXr20ivWncmHN8nL
 PfIF0dSxOYcp4rl9q0THX+EPNw==
X-Google-Smtp-Source: APBJJlE/Masgcy12zxqKZTm46aarOd7BSDmEN/SL2Jz+5EdmLFdorC+H60FSJfrmlnBy05dFeOevtg==
X-Received: by 2002:a2e:c51:0:b0:2b9:e053:7a01 with SMTP id
 o17-20020a2e0c51000000b002b9e0537a01mr925423ljd.43.1690677327182; 
 Sat, 29 Jul 2023 17:35:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 8/8] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
Date: Sun, 30 Jul 2023 03:35:18 +0300
Message-Id: <20230730003518.349197-9-dmitry.baryshkov@linaro.org>
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

As the INTF is fixed at the encoder creation time, we can move the
check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
This function can return an error if INTF doesn't have required feature.
Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
useful, as this function returns void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 41 +++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 012986cff38c..adbd559a5290 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -325,24 +325,21 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
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
+	/*
+	 * TODO: if/when resource allocation is refactored, move this to a
+	 * place where the driver can actually return an error.
+	 */
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
@@ -768,10 +765,22 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
+	if (!phys_enc->hw_intf) {
+		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
+
+		return ERR_PTR(-EINVAL);
+	}
+
 	/* DPU before 5.0 use PINGPONG for TE handling */
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

