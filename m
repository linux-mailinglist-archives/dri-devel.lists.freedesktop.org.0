Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE6474B754
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 21:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2AB10E5EE;
	Fri,  7 Jul 2023 19:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C5E10E5E2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 19:39:47 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fa48b5dc2eso3705895e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688758786; x=1691350786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQpKCEoX0wDzwvYtZYOLMhBvx89hv9TtO2VMOF5Zspg=;
 b=d8kd4LwCK8JmRRCtZ7vWwUrKfbcjO/NRfw++krZjQ+tGGGt0z1ZUrUP3B/S3fwi1T8
 IkCVOVTYUW8T7L5vGkXUUPXlF9GKFZqNXq0gzZn0b2MfrxZhjObf9yyNXsV6w1rXPTb2
 iW8C3LFac4rZoh4Y2kFBBIGc2BQqEeIYnxfVcrHf3AuH4oZ2gdc9GvWnKmqGbQdMV0It
 CCfn/KFK12jPZrfxxAMu1zqhhWHWqkRq4QIXs/AzMq2/5bEYH3+JnYzUH16ImM+3JUSc
 8pxLbaAYAzrQKcbPjdThYknBuIhRiqLZ+aIKuIG5+NMKIz2RVJwtHqxAZMF7GcB1mmJw
 zMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758786; x=1691350786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQpKCEoX0wDzwvYtZYOLMhBvx89hv9TtO2VMOF5Zspg=;
 b=Uv0OKmnDS1SdQBYv7bxVY4aRFAMRtvYrlLzQOWGWDAIZ6ws7jsCl+0eksKYtVAyvs/
 CmeI78bBPg+kGW9/3ikWjqiEHPlWLVVMb/wtG+crHgZAHodK1evJELfHiB81AD8R05+f
 83F619b3bxMHtxt+F6nt3HVErgLx8PsP0xg9XCm33t2BHBgShrsdmLCGljbRIzPCleNz
 RWGMy9prTA/phkKpEw8yBghqvWC0CXuTang9DObl2H7IlJhzd3mAhALEV4scPQRRfQph
 /pzbDJqvkMSNfYQ2CBsLFmYLxIvktDqp0sydeG/05VT0WhMOUZZ2nNjwtjCqPHev6lDg
 0tfQ==
X-Gm-Message-State: ABy/qLab+AoVvYUK+GtcmPaYgIvLamTettbOMsHZhxVVqN5OHakLII2t
 s7tobYEcDIYDvuGMtXlCtUW4Yw==
X-Google-Smtp-Source: APBJJlHfbUdQtSsSktig1onHXDKAXml/Kgjl06pRamnL6+L3U9sxnMRrUS4tVsN3iFrTAN9JCGYVxA==
X-Received: by 2002:ac2:57cd:0:b0:4fb:7772:7bae with SMTP id
 k13-20020ac257cd000000b004fb77727baemr4383238lfo.6.1688758786063; 
 Fri, 07 Jul 2023 12:39:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 04/11] drm/msm/dpu: drop separate dpu_core_perf_tune
 overrides
Date: Fri,  7 Jul 2023 22:39:35 +0300
Message-Id: <20230707193942.3806526-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
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

The values in struct dpu_core_perf_tune are fixed per the core perf
mode. Drop the 'tune' values and substitute them with known values when
performing perf management.

Note: min_bus_vote was not used at all, so it is just silently dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 ++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  4 ---
 2 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 05d340aa18c5..348550ac7e51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -235,7 +235,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 {
 	struct dpu_core_perf_params perf = { 0 };
 	int i, ret = 0;
-	u64 avg_bw;
+	u32 avg_bw;
 
 	if (!kms->num_paths)
 		return 0;
@@ -291,10 +291,16 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 
 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 {
-	u64 clk_rate = kms->perf.perf_tune.min_core_clk;
+	u64 clk_rate;
 	struct drm_crtc *crtc;
 	struct dpu_crtc_state *dpu_cstate;
 
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
+		return kms->perf.fix_core_clk_rate;
+
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
+		return kms->perf.max_core_clk_rate;
+
 	drm_for_each_crtc(crtc, kms->dev) {
 		if (crtc->enabled) {
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
@@ -305,11 +311,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 		}
 	}
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
-		clk_rate = kms->perf.fix_core_clk_rate;
-
-	DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
-
 	return clk_rate;
 }
 
@@ -397,6 +398,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	if (update_clk) {
 		clk_rate = _dpu_core_perf_get_core_clk_rate(kms);
 
+		DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
+
 		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
 
 		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
@@ -418,7 +421,6 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		    const char __user *user_buf, size_t count, loff_t *ppos)
 {
 	struct dpu_core_perf *perf = file->private_data;
-	const struct dpu_perf_cfg *cfg = perf->catalog->perf;
 	u32 perf_mode = 0;
 	int ret;
 
@@ -433,14 +435,9 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		DRM_INFO("fix performance mode\n");
 	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
 		/* run the driver with max clk and BW vote */
-		perf->perf_tune.min_core_clk = perf->max_core_clk_rate;
-		perf->perf_tune.min_bus_vote =
-				(u64) cfg->max_bw_high * 1000;
 		DRM_INFO("minimum performance mode\n");
 	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
 		/* reset the perf tune params to 0 */
-		perf->perf_tune.min_core_clk = 0;
-		perf->perf_tune.min_bus_vote = 0;
 		DRM_INFO("normal performance mode\n");
 	}
 	perf->perf_tune.mode = perf_mode;
@@ -456,10 +453,8 @@ static ssize_t _dpu_core_perf_mode_read(struct file *file,
 	char buf[128];
 
 	len = scnprintf(buf, sizeof(buf),
-			"mode %d min_mdp_clk %llu min_bus_vote %llu\n",
-			perf->perf_tune.mode,
-			perf->perf_tune.min_core_clk,
-			perf->perf_tune.min_bus_vote);
+			"mode %d\n",
+			perf->perf_tune.mode);
 
 	return simple_read_from_buffer(buff, count, ppos, buf, len);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 29bb8ee2bc26..c965dfbc3007 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -29,13 +29,9 @@ struct dpu_core_perf_params {
 /**
  * struct dpu_core_perf_tune - definition of performance tuning control
  * @mode: performance mode
- * @min_core_clk: minimum core clock
- * @min_bus_vote: minimum bus vote
  */
 struct dpu_core_perf_tune {
 	u32 mode;
-	u64 min_core_clk;
-	u64 min_bus_vote;
 };
 
 /**
-- 
2.39.2

