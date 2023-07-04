Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161DF7474D5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A97E10E2D7;
	Tue,  4 Jul 2023 15:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B93E10E1B8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:04:02 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b6b98ac328so85238171fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483040; x=1691075040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j+aq1OFXpf6G4H+BcGCSA0YL933rxkAV4l8sCcsEZis=;
 b=kXqNbmDflyvlxSx/8Rxgxa3xl2Z07elSrH3JpkankgIT7FrzGdcA7mYlbzfsHTWmYo
 pET1u6dnJuES4DmSg+qrQJOxQtHDWtMRgm0rec5RwVU4XJaLWjZIRjuJePuRWJH+lY+M
 fNugozyvnotBtqAzASefM+bcs2PSgYptOIBXiNuT8K0Wf9Qi0yP8loXGAsa1OzlN3E6+
 CTOljsTgLTlYA//5a9R1ECZtwGVPQjQTWBJXmAUdIq9ujozTxCKVU62XJL5u7dXk5Wwj
 ZaCtWG5ccK50E4CTDivHLXsVLyJI2fOw2joWCokbiVIgm3VErUa3V95PvdMSrctAfcOn
 87fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483040; x=1691075040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j+aq1OFXpf6G4H+BcGCSA0YL933rxkAV4l8sCcsEZis=;
 b=PpL97G/TkOKev9cjictUyEC9AIUszoF140y6EfL4rR7pgB0CbHWRXfMpCAL9SC8695
 0NcZCVWElAhu6ObnGnbCDM9x40aIiZ4MdWZ1y2ZlNoaJPoeyJ9Lu8snxXNQYjND7WmkP
 j+8Q9tB+ZgvjJB2sE0mQjiB0dF/4tTDE1s+EOl+DwKq3GsYirEkJBrhleMOCbTpj2nsP
 qdl6IhjvOUrwtqNVnNbOUgwxU+5+upXH5M5mnPX2IN2/2H/m/EAffFR7CDBLZN5YkpIj
 A5kxbSc8YIfFsOsa+nSVvyHEtrmLv4fDPD25u+F9DNTOOtEMD/9rnIvoURoAOk+3sDxQ
 T04g==
X-Gm-Message-State: ABy/qLau80sWKRaQBFuMfcZ7kKcLKplnjTiXaVMoe5FEnOG8mq5Lf3mf
 u8FMP7s+jw1njBZNSUESC/fPmQ==
X-Google-Smtp-Source: APBJJlHHe490LvEGHTlSi9065fHYlPgN0olmh74EqKOJJUaIUc6IiWX0RLYGd7CBpnAIQIFXbc0RZw==
X-Received: by 2002:a2e:910c:0:b0:2b6:a22f:9fb9 with SMTP id
 m12-20020a2e910c000000b002b6a22f9fb9mr9419715ljg.27.1688483040418; 
 Tue, 04 Jul 2023 08:04:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:03:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 06/14] drm/msm/dpu: rework core_perf debugfs overrides
Date: Tue,  4 Jul 2023 18:03:46 +0300
Message-Id: <20230704150354.159882-7-dmitry.baryshkov@linaro.org>
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

Currently debugfs provides separate 'modes' to override calculated
MDP_CLK rate and interconnect bandwidth votes. Change that to allow
overriding individual values (e.g. one can override just clock or just
average bandwidth vote).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 ++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
 2 files changed, 9 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 42c03a5f1f3e..23a29f159eff 100644
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
@@ -229,18 +215,16 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	if (!kms->num_paths)
 		return 0;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		avg_bw = 0;
-		peak_bw = 0;
-	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
+	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
+	peak_bw = perf.max_per_pipe_ib;
+
+	if (kms->perf.fix_core_ab_vote)
 		avg_bw = kms->perf.fix_core_ab_vote;
-		peak_bw = kms->perf.fix_core_ib_vote;
-	} else {
-		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
-		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
-		peak_bw = perf.max_per_pipe_ib;
-	}
+	if (kms->perf.fix_core_ib_vote)
+		peak_bw = kms->perf.fix_core_ib_vote;
 
 	avg_bw /= kms->num_paths;
 
@@ -294,12 +278,9 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 	struct drm_crtc *crtc;
 	struct dpu_crtc_state *dpu_cstate;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
+	if (kms->perf.fix_core_clk_rate)
 		return kms->perf.fix_core_clk_rate;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
-		return kms->perf.max_core_clk_rate;
-
 	drm_for_each_crtc(crtc, kms->dev) {
 		if (crtc->enabled) {
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
@@ -416,54 +397,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 
 #ifdef CONFIG_DEBUG_FS
 
-static ssize_t _dpu_core_perf_mode_write(struct file *file,
-		    const char __user *user_buf, size_t count, loff_t *ppos)
-{
-	struct dpu_core_perf *perf = file->private_data;
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
-		DRM_INFO("minimum performance mode\n");
-	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
-		/* reset the perf tune params to 0 */
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
-			"mode %d\n",
-			perf->perf_tune.mode);
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
@@ -488,8 +421,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			(u32 *)&catalog->perf->min_llcc_ib);
 	debugfs_create_u32("min_dram_ib", 0600, entry,
 			(u32 *)&catalog->perf->min_dram_ib);
-	debugfs_create_file("perf_mode", 0600, entry,
-			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
 			&perf->fix_core_clk_rate);
 	debugfs_create_u64("fix_core_ib_vote", 0600, entry,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index c965dfbc3007..1b791b170c6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -26,14 +26,6 @@ struct dpu_core_perf_params {
 	u64 core_clk_rate;
 };
 
-/**
- * struct dpu_core_perf_tune - definition of performance tuning control
- * @mode: performance mode
- */
-struct dpu_core_perf_tune {
-	u32 mode;
-};
-
 /**
  * struct dpu_core_perf - definition of core performance context
  * @dev: Pointer to drm device
@@ -42,7 +34,6 @@ struct dpu_core_perf_tune {
  * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
- * @perf_tune: debug control for performance tuning
  * @enable_bw_release: debug control for bandwidth release
  * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
  * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
@@ -55,7 +46,6 @@ struct dpu_core_perf {
 	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
-	struct dpu_core_perf_tune perf_tune;
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
 	u64 fix_core_ib_vote;
-- 
2.39.2

