Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8536C736082
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 02:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA68210E16E;
	Tue, 20 Jun 2023 00:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E80B10E072
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:08:52 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f875b267d9so1512522e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687219730; x=1689811730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwDSHffq50EAJMZ8kUXWDPT7Ut5okKFfNonuCGsv+ow=;
 b=BIR0I18HJgaxyNtu5LpLT+ktyQpawYxGfihb3/F+beVs5jooz29dKBxhNsCIfrjKCK
 gcNkhNdb/QRnKSS2dvzlC14rRcirtHLMBXBFkZKDN4IgYR6oQtacIFE882qyii/wNOBk
 G4cH8dtzKJuIin3QgfOoOZpd0KkiPKMxv59ggNMpwLfvBmPlaprol6oGRonpXDK683ls
 dZqraFFFXNKNa5xE1yha14e0ZYCNCGNml4jyCzbyFQLHCatZXzMamP2KHK4GTt5NJ5oB
 2VLItBaBM+Xl1lHuewb62Ma0YomV4tKUgK6jdBTBHvXulHHapECHvJOmIitl1EMZeLjn
 meOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687219730; x=1689811730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwDSHffq50EAJMZ8kUXWDPT7Ut5okKFfNonuCGsv+ow=;
 b=Hyh6/UaMO7WAaHLIRh2Si7d7e0se063INKyL4mBCQDL1mglvnvEmffp5M06KCLiQwu
 c9ZXWWdT53n5giaMwTHxidZ5WVFAXgkH3JSRjrYLA5vHWZRI1/Z29IBCBnqKxr0Ii/oc
 5UjOswU5fHkfzXfELexz3eBjbHr16PGlhP86k5yY9E8AUCptZpjgMv6rF0IyFRolLdvq
 X1ogz5z2Cdz+1WgmepWn/pBqGGL8Ou/xLWVgJC3faQJIXwTtiyfAzl79qyPXL+kKLPPR
 Z4E8jm00QgeE1usy4VGeBnAd7EfutHv4sA35Ajc2wjapPH5v70UZOM7IKazla6Hk75fW
 runw==
X-Gm-Message-State: AC+VfDznp9Mchy2+t8y3wLnA5iiUzfYbvrLcdPAPk3OpOzlMxif8QAyk
 y63Cc5H380+HE8/GWjvKZvfcgw==
X-Google-Smtp-Source: ACHHUZ5qdn80Tw8c4ywhXXeGKnji6vq6s599EFCQjZfiRF3/jPXA4NC37FbgtlvaIpZ0cHvHmIKUGQ==
X-Received: by 2002:a19:e304:0:b0:4f6:2473:f1cb with SMTP id
 a4-20020a19e304000000b004f62473f1cbmr6326146lfh.67.1687219730497; 
 Mon, 19 Jun 2023 17:08:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:08:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/8] drm/msm/dpu: drop performance tuning modes
Date: Tue, 20 Jun 2023 03:08:40 +0300
Message-Id: <20230620000846.946925-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPU performance module contains code to change performance state
calculations. In addition to normal (sum plane and CRTC requirements),
it can work in 'minimal' or 'fixed' modes. Both modes are impractical,
since they can easily end up with the display underruns. Userspace also
should not depend on these modes availability, since they are tuned
through debugfs, which might not be available.

Drop relevant code to simplify performance state calculations.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 99 +------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 19 ----
 2 files changed, 4 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..9902febc72c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -17,20 +17,6 @@
 #include "dpu_crtc.h"
 #include "dpu_core_perf.h"
 
-/**
- * enum dpu_perf_mode - performance tuning mode
- * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
- * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
- * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
- * @DPU_PERF_MODE_MAX: maximum value, used for error checking
- */
-enum dpu_perf_mode {
-	DPU_PERF_MODE_NORMAL,
-	DPU_PERF_MODE_MINIMUM,
-	DPU_PERF_MODE_FIXED,
-	DPU_PERF_MODE_MAX
-};
-
 /**
  * _dpu_core_perf_calc_bw() - to calculate BW per crtc
  * @kms:  pointer to the dpu_kms
@@ -118,19 +104,9 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 
 	memset(perf, 0, sizeof(struct dpu_core_perf_params));
 
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
@@ -286,7 +262,7 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 
 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 {
-	u64 clk_rate = kms->perf.perf_tune.min_core_clk;
+	u64 clk_rate = 0;
 	struct drm_crtc *crtc;
 	struct dpu_crtc_state *dpu_cstate;
 
@@ -300,9 +276,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 		}
 	}
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
-		clk_rate = kms->perf.fix_core_clk_rate;
-
 	DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
 
 	return clk_rate;
@@ -409,62 +382,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 
 #ifdef CONFIG_DEBUG_FS
 
-static ssize_t _dpu_core_perf_mode_write(struct file *file,
-		    const char __user *user_buf, size_t count, loff_t *ppos)
-{
-	struct dpu_core_perf *perf = file->private_data;
-	const struct dpu_perf_cfg *cfg = perf->catalog->perf;
-	u32 perf_mode = 0;
-	int ret;
-
-	ret = kstrtouint_from_user(user_buf, count, 0, &perf_mode);
-	if (ret)
-		return ret;
-
-	if (perf_mode >= DPU_PERF_MODE_MAX)
-		return -EINVAL;
-
-	if (perf_mode == DPU_PERF_MODE_FIXED) {
-		DRM_INFO("fix performance mode\n");
-	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
-		/* run the driver with max clk and BW vote */
-		perf->perf_tune.min_core_clk = perf->max_core_clk_rate;
-		perf->perf_tune.min_bus_vote =
-				(u64) cfg->max_bw_high * 1000;
-		DRM_INFO("minimum performance mode\n");
-	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
-		/* reset the perf tune params to 0 */
-		perf->perf_tune.min_core_clk = 0;
-		perf->perf_tune.min_bus_vote = 0;
-		DRM_INFO("normal performance mode\n");
-	}
-	perf->perf_tune.mode = perf_mode;
-
-	return count;
-}
-
-static ssize_t _dpu_core_perf_mode_read(struct file *file,
-			char __user *buff, size_t count, loff_t *ppos)
-{
-	struct dpu_core_perf *perf = file->private_data;
-	int len;
-	char buf[128];
-
-	len = scnprintf(buf, sizeof(buf),
-			"mode %d min_mdp_clk %llu min_bus_vote %llu\n",
-			perf->perf_tune.mode,
-			perf->perf_tune.min_core_clk,
-			perf->perf_tune.min_bus_vote);
-
-	return simple_read_from_buffer(buff, count, ppos, buf, len);
-}
-
-static const struct file_operations dpu_core_perf_mode_fops = {
-	.open = simple_open,
-	.read = _dpu_core_perf_mode_read,
-	.write = _dpu_core_perf_mode_write,
-};
-
 int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 {
 	struct dpu_core_perf *perf = &dpu_kms->perf;
@@ -489,14 +406,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			(u32 *)&catalog->perf->min_llcc_ib);
 	debugfs_create_u32("min_dram_ib", 0600, entry,
 			(u32 *)&catalog->perf->min_dram_ib);
-	debugfs_create_file("perf_mode", 0600, entry,
-			(u32 *)perf, &dpu_core_perf_mode_fops);
-	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
-			&perf->fix_core_clk_rate);
-	debugfs_create_u64("fix_core_ib_vote", 0600, entry,
-			&perf->fix_core_ib_vote);
-	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
-			&perf->fix_core_ab_vote);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 29bb8ee2bc26..e02cc2324af2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -26,18 +26,6 @@ struct dpu_core_perf_params {
 	u64 core_clk_rate;
 };
 
-/**
- * struct dpu_core_perf_tune - definition of performance tuning control
- * @mode: performance mode
- * @min_core_clk: minimum core clock
- * @min_bus_vote: minimum bus vote
- */
-struct dpu_core_perf_tune {
-	u32 mode;
-	u64 min_core_clk;
-	u64 min_bus_vote;
-};
-
 /**
  * struct dpu_core_perf - definition of core performance context
  * @dev: Pointer to drm device
@@ -48,9 +36,6 @@ struct dpu_core_perf_tune {
  * @max_core_clk_rate: maximum allowable core clock rate
  * @perf_tune: debug control for performance tuning
  * @enable_bw_release: debug control for bandwidth release
- * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
- * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
- * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
  */
 struct dpu_core_perf {
 	struct drm_device *dev;
@@ -59,11 +44,7 @@ struct dpu_core_perf {
 	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
-	struct dpu_core_perf_tune perf_tune;
 	u32 enable_bw_release;
-	u64 fix_core_clk_rate;
-	u64 fix_core_ib_vote;
-	u64 fix_core_ab_vote;
 };
 
 /**
-- 
2.39.2

