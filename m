Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB979736085
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 02:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4AE10E234;
	Tue, 20 Jun 2023 00:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548AB10E160
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:08:55 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f871c93a5fso2097191e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687219733; x=1689811733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rD45IpamSHmeKBkLhjnckQHeaijA0W6PwrPUT5TTCbg=;
 b=qyOfbz/Mypt/wzh+jFNR5LmmPxAwWUX862FeawYY6sTYOUvAtQi8Ls9kqRQE0O652B
 epmnWTVftTgveNkyRZylP2InwySG4sKdolRFkAkv03TF/ojsBk8cuw3KBONcMi/ccIEV
 67BI9mWMs1f5lZplhcJKsP4CQpdfFiUjF8+rydMavMGebx+Cs841uF96YgYa/mIRyW8t
 UlI4DdcdmgnbOSkt+gWfK024TrpBTSCji82IpMRFDepVcY68q69hCs4chL9jyBHboMto
 m8ApvV2eD2LKsXQbjw1gMm/dVwM0nZhT+SCAB0Lgd4hwLoDkZwflt8igLQHVQAavRSfM
 yUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687219733; x=1689811733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rD45IpamSHmeKBkLhjnckQHeaijA0W6PwrPUT5TTCbg=;
 b=kH24K3qTQV6z8/afueWCA1Et07sRMvwqsv8Pzc8lGhNU7/sEm6+dWgXc6rHweX8QAZ
 wkwmvk22FoO6oQYuHjDSe6CWuMP5g6+3dcYiNsupIRAtJn1GhMeZyrS/IzCiQ03qajZI
 bab6gCWl2s7atohMk7BM8pCvnFztQ0o/nIKgUbD1HNvm25grGOgnMseQdCq2aSbUPCyJ
 YY0iQRJcseykZLJI4cSh99LjNRDJGxYkBePoJAhslcflAXaQ62l13lIkyJLGZKULtirm
 imGQVcI6XTM3ceqaDhJ9FFg5bY8JH8pYTE9MxLRwdf6RyQGcf+iDlvu6pO4fQKlTE4Xc
 3/4w==
X-Gm-Message-State: AC+VfDwDMpRWp0GYZfo/rgxCgyl/0YNbsYa16Mf0uUaKoXgBt+0jVDOg
 oovSYrLyfwO2FKUYVwgITZP3fA==
X-Google-Smtp-Source: ACHHUZ7vNLn4irxhnXegIB6RgBomQ+ch2nDxHDe7iN7TBQZ6KBi9/7Q4dAW/uCj5s6hSSmhsw8plAQ==
X-Received: by 2002:a05:6512:214f:b0:4f8:658f:fd2a with SMTP id
 s15-20020a056512214f00b004f8658ffd2amr3538700lfr.36.1687219733637; 
 Mon, 19 Jun 2023 17:08:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:08:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 5/8] drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s
 stop_req param
Date: Tue, 20 Jun 2023 03:08:43 +0300
Message-Id: <20230620000846.946925-6-dmitry.baryshkov@linaro.org>
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

The stop_req is true only in the dpu_crtc_disable() case, when
crtc->enable has already been set to false. This renders the stop_req
argument useless. Remove it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +++---
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f8d5c87d0915..773e641eab28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -277,7 +277,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 }
 
 int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
-		int params_changed, bool stop_req)
+			      int params_changed)
 {
 	struct dpu_core_perf_params *new, *old;
 	bool update_bus = false, update_clk = false;
@@ -301,13 +301,13 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	dpu_crtc = to_dpu_crtc(crtc);
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
 
-	DRM_DEBUG_ATOMIC("crtc:%d stop_req:%d core_clk:%llu\n",
-			crtc->base.id, stop_req, kms->perf.core_clk_rate);
+	DRM_DEBUG_ATOMIC("crtc:%d enabled:%d core_clk:%llu\n",
+			crtc->base.id, crtc->enabled, kms->perf.core_clk_rate);
 
 	old = &dpu_crtc->cur_perf;
 	new = &dpu_cstate->new_perf;
 
-	if (crtc->enabled && !stop_req) {
+	if (crtc->enabled) {
 		/*
 		 * cases for bus bandwidth update.
 		 * 1. new bandwidth vote - "ab or ib vote" is higher
@@ -337,7 +337,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	}
 
 	trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
-		new->core_clk_rate, stop_req, update_bus, update_clk);
+		new->core_clk_rate, !crtc->enabled, update_bus, update_clk);
 
 	if (update_bus) {
 		ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
@@ -355,7 +355,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	if (update_clk) {
 		clk_rate = _dpu_core_perf_get_core_clk_rate(kms);
 
-		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
+		trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
 
 		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
 		ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 2bf7836f79bb..c29ec72984b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -58,11 +58,10 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
  * dpu_core_perf_crtc_update - update performance of the given crtc
  * @crtc: Pointer to crtc
  * @params_changed: true if crtc parameters are modified
- * @stop_req: true if this is a stop request
  * return: zero if success, or error code otherwise
  */
 int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
-		int params_changed, bool stop_req);
+			      int params_changed);
 
 /**
  * dpu_core_perf_crtc_release_bw - release bandwidth of the given crtc
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ff5d306b95ed..214229d11e3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -718,7 +718,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 {
 	trace_dpu_crtc_complete_commit(DRMID(crtc));
-	dpu_core_perf_crtc_update(crtc, 0, false);
+	dpu_core_perf_crtc_update(crtc, 0);
 	_dpu_crtc_complete_flip(crtc);
 }
 
@@ -884,7 +884,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 		return;
 
 	/* update performance setting before crtc kickoff */
-	dpu_core_perf_crtc_update(crtc, 1, false);
+	dpu_core_perf_crtc_update(crtc, 1);
 
 	/*
 	 * Final plane updates: Give each plane a chance to complete all
@@ -1100,7 +1100,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 		atomic_set(&dpu_crtc->frame_pending, 0);
 	}
 
-	dpu_core_perf_crtc_update(crtc, 0, true);
+	dpu_core_perf_crtc_update(crtc, 0);
 
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
-- 
2.39.2

