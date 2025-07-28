Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB767B13B24
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 15:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEB310E516;
	Mon, 28 Jul 2025 13:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W1lsL9tF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2727610E50B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:15:10 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-74b56b1d301so2883217b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708510; x=1754313310; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=W1lsL9tFEFT6Wmo95j/Od38AtRD6QcivmKasf/dENrNOfhf/3CP80i9ZVXeaCqtZPB
 oem1oDnEhOjqw8kxxNuwXQgprYLYdrNQbL97pK1I9lDwxQlGKP4Pk9u0f85XP0kEGVs4
 +ORcX5wWs25SXTELSirrVOoJ9IVitO095o2bTLbNLTWAhLNq+KyMXUTdZzorutGn7QZg
 WHj7tx6OBeAd7ZWhduFU0BfOiO/HtPdOfL15xyOFMn+d3bTq1RPScHBTjxr0WOI2OIhH
 ai2IP2pbbSecwNPcUvqXqULkDwDPVyeGgMBOL8WzIke522P+msmWjbpZ3W55mbE05GIL
 nBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708510; x=1754313310;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=fwF2rSwftz6I3BGJB3/uwTyBh5mTLU/iAcKNYloWTwBDKUXzkfh/kb3UxbzLak0jcO
 6Pw+0ZZdbGXncJETAiFHGcAk0e+hWO4PubuapcEzd4JTKrjtxbvyih15+cA0QCL6KQXX
 /icdI59KaAg+M7GwYfeHOZijYrVFaIPCs3fNHtqCEu1HeK/nb38u3Ank5LW4HC5y7h7r
 hSV6CccSLkMzzeVT/smX0IhfED8vWds4hO7zDWKtbwnFk5anv+Uy7UGaxfN00W85PScv
 /9Es/AE0qdNqL3MgDTXsFKOcIed61Igqd3TGPrywnJgz7x4ROcnoPTmWEPhmFtXSbzGA
 hkKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOU1ZNTuEoB+i8frDFoHW+EMznaPT7dteyZZc8aPPPt3a4Ly1tDU2FLBinBvX95X7/+MmuZJExkJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVuqwy23XMiVRzoU0V09JrPgjEvQ11oOgRJRMXiTL0wtxzLIXt
 8pr21jwZ4mEW7bBJCC3NDnLrxZfdDbGKT8JyZEkZl+6KTYs3cQcSihbSJOtDAR2/T9s=
X-Gm-Gg: ASbGncs1Xm1mjx6OJADPuiejNj+peFCwCqIO9YlUgsMM5WWvHH8RzPTogK/3v1KXtIp
 KEFwBg2/oyNsGbFxMb3FhDfxYIUWjoWKjxeSvNg5D81yTK6Vz568sNyGHK6jDDwg8khz/AeSOJO
 30JwMmB4db9iSryP3xd+C/HBdxR4aEKI6xjE6GkzS7WyPpCmmvxfUFtGWkeZHjx5B6bpMAhmFap
 DRxbi1ghFtYMba3G5IeXOeqCjqaq2TEm76Ld/4Qlcx1v0rUkaFqqehCJRzWQ4N3A6FlPM+IT9VD
 B+qvWjvggP6YuyAq0FU4mKCM3ERbGd5zpOs+IFfbrBAbPD86Q6EUhrm/1z8PAi8hbeEASU7hl0Q
 7o7uhiLzX08MXcwJzzBudviu8CQJ2
X-Google-Smtp-Source: AGHT+IG+JbwyDUG7pX0QI1BqFWP0lb0OYydB+BpasTxsom5LPqVzrzwiajyvHToI6cH2mOOlOZF3xw==
X-Received: by 2002:a05:6a00:10c6:b0:748:ff4d:b585 with SMTP id
 d2e1a72fcca58-763347bdacdmr17649834b3a.19.1753708509513; 
 Mon, 28 Jul 2025 06:15:09 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:15:09 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:28 +0800
Subject: [PATCH v13 04/12] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-4-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=flbnou7XSx1ETCmAxdlZnvB3+bqdNxru9LUU48yIE7A=;
 b=Ze5paCQmaim3zJLE+SGSxm+xuFv+T0ykWoQxHFa9eh0exvmqLFyGEoTIgJBruGpU5h0dCU5bQ
 XzB2G6FTTm8APL+bSd7UT2Q3ACByObc4/Y7dSxbfgklxj9Ilef2hIEf
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b476d3c97ac9b6b4c5ca2963aa4a5805d57c8d7e..2d88d9129ec787df6dac70e6f4488ab77c6aeeed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1158,7 +1158,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1237,10 +1237,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

