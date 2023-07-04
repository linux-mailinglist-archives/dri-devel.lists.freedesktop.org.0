Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D74C7474D0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE9510E2D5;
	Tue,  4 Jul 2023 15:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150D410E1C5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:04:01 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b69923a715so88381771fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483039; x=1691075039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVBXyrFdIkopLRLb6Grc/paJlGJi3BPT4fGEsbFMO5s=;
 b=vTYFTcqwoKzA37LP5kgGmv6Q7MRWkJfDdwM7uA8r4nDoNW+Hrgj+/qCCeq2AYgjTET
 0Z1tva04iVqfMd3+9tpP2PFQAk9FVoewnyUv62qKTuE6h4NCxXj9my66W/NkgWXiDQ9T
 MXGhapOakDmtksqQP/wJz5d3YBeTHjrfe+eSlWaQlifC5wY2EIRWS5ipOnA3N4bDAlpa
 rShvvgItPSylTcy9GYoVMhMdThAlqeP0Ji/Rsso6pFskQekfImZk8uU4a+oeNgY5tLw8
 75Lcxn0qrIQN9tVR0MS7vE5qSmWm4fTR2Fi4mjn3Q3UfCl8ZAhQndiVF5PnCgc7xeJ+K
 AVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483039; x=1691075039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVBXyrFdIkopLRLb6Grc/paJlGJi3BPT4fGEsbFMO5s=;
 b=Tw1LITHCzb7hTVVKgKj1cbRIuLOYY+Jnd0BVKhLBVdICic8BYOBBMcoJn9bvLxLl8U
 XTSMZ6TOE0MF3tQrqfOt8wGiPqRh5A6jHjjjQe5X7n353CNh73n7skP1pih795h26FAI
 3Lx3IyA5SsZLblhcGOr9flzleag6RhfcsjHx5GNKa0U4AD2VAyTLDyxaWqgtLyAtqcUK
 ah8CuC3v0mv7HiqWFkkhHD07NMe+SDM+UgY/qEKKGbIPZ92Xvcw0NSVrPlBw/F3UH5Ge
 7XGDxMleZqsZnUhFwXRcSbn5em59so9fbCeTVVkv4gZEUcXWjsNC+Amu/DPdHR7dxwAN
 U8ew==
X-Gm-Message-State: ABy/qLan1SeYLjfVlcMvCimfVA3ZRm8J2hk9OZIQjkg9lIAfPnZ0mlve
 WPkBU3GZ6SkwKvsF9fT1iVAWbQ==
X-Google-Smtp-Source: APBJJlFhs2TWohEyXM7WfY4+XrDHcNsc3HfHMCZncPI2bnOYUqpoQNfNoCXKOKQ8rK8aDHVYQz7gtw==
X-Received: by 2002:a2e:90c2:0:b0:2b6:ac18:aaae with SMTP id
 o2-20020a2e90c2000000b002b6ac18aaaemr10376531ljg.11.1688483039460; 
 Tue, 04 Jul 2023 08:03:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:03:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 05/14] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Date: Tue,  4 Jul 2023 18:03:45 +0300
Message-Id: <20230704150354.159882-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
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

Move perf mode handling for the bandwidth to
_dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
and then aggregating known values.

Note, this changes the fix_core_ab_vote. Previously it would be
multiplied per the CRTC number, now it will be used directly for
interconnect voting.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 37 +++++++++----------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 348550ac7e51..42c03a5f1f3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -116,21 +116,9 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 		return;
 	}
 
-	memset(perf, 0, sizeof(struct dpu_core_perf_params));
-
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		perf->bw_ctl = 0;
-		perf->max_per_pipe_ib = 0;
-		perf->core_clk_rate = 0;
-	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = kms->perf.fix_core_ab_vote;
-		perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
-		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
-	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-		perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
-	}
+	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
+	perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
+	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
@@ -236,17 +224,28 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	struct dpu_core_perf_params perf = { 0 };
 	int i, ret = 0;
 	u32 avg_bw;
+	u32 peak_bw;
 
 	if (!kms->num_paths)
 		return 0;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
+		avg_bw = 0;
+		peak_bw = 0;
+	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
+		avg_bw = kms->perf.fix_core_ab_vote;
+		peak_bw = kms->perf.fix_core_ib_vote;
+	} else {
+		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
+		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
+		peak_bw = perf.max_per_pipe_ib;
+	}
 
-	avg_bw = perf.bw_ctl;
-	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
+	avg_bw /= kms->num_paths;
 
 	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
+		icc_set_bw(kms->path[i], avg_bw, peak_bw);
 
 	return ret;
 }
-- 
2.39.2

