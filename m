Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C774B756
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 21:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EA210E5EF;
	Fri,  7 Jul 2023 19:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F414110E5E1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 19:39:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f96d680399so3386153e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 12:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688758785; x=1691350785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjoI3Dx1Y7JEO/QjjX2Gq34JkRG4tKXD0+CPY31Fy3E=;
 b=TotxLp9WEbEa1H0ui4tZtY7EzhGfQ3fBWZC5iUtDBnbwg0MTlgsGk1A3H9rzvZQh0x
 VurNoqfvegRbAAw+d1xNGyniWPDdLER8VAVoUOBdSuGV/BIyDEJEwfSci02GHpCfaeLl
 ILhnVBkMtfvfQuld9mw9cgMzSNJVwvlIulPYELfS3fmefr3zPOeTDURxyw4Fz9hrLR6X
 QdmuNbI0yE3gnlNoy68rWkgkAgdMj0RQdZtX9Zb8OpruTWxkabvv97Sn+6EB9IiTu3CA
 2Dmm8G3QJubAyrP7MOptZafM1OU7SeSI27Cgd2MFFSW+P3ryciIDpqa5CKqhqQ2WoFZD
 D5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758785; x=1691350785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NjoI3Dx1Y7JEO/QjjX2Gq34JkRG4tKXD0+CPY31Fy3E=;
 b=KPRJWVCk79C2Zqs7pTOKjv/DlIoN3R+I5icsSCV6yGkxHidL1ctrPXy+nZeTmhf0FJ
 3ENxoqU42n0UFU/Qp4sLwA4Rp/ybz4z3vRs0gPsdZubTq3oeY9I9xLEn8smwXsGdLdiP
 CBabeExfsDZ5x5VlQZM3y2BcGDoZIA1UuYC/J0yVUP+0LUKFiykFOoIvUFEMcjl9H7Sv
 9XWLHrlXdH/kW7FDK99JJ/0055jSrXmJAEviGaNtV046ZIbESdjaHJd6AZgICs2IsdYp
 kP9pA1HUK+LrMQmNH/QKCJWO2gLM4+dTJ4r4WlWW6oIDrfplictqPqNN0bXfKKgEJz2K
 DTKw==
X-Gm-Message-State: ABy/qLZv5kdSr2iA3XGQ6W73tIgfRb0ZRLewwJZZYJjr4jp1oek3bqgr
 j+fEsbe0riYQ2KPL+qrOUlHAuw==
X-Google-Smtp-Source: APBJJlFdYPw4GxOROVzMAnYhE6vEelZplJXJjnXlGWENi3d9i5ezSHyTJHzQS0wP8tC7Ahq3f0VVZA==
X-Received: by 2002:a05:6512:36c5:b0:4fb:8f79:631 with SMTP id
 e5-20020a05651236c500b004fb8f790631mr4796453lfs.46.1688758784667; 
 Fri, 07 Jul 2023 12:39:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 12:39:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 02/11] drm/msm/dpu: core_perf: extract bandwidth
 aggregation function
Date: Fri,  7 Jul 2023 22:39:33 +0300
Message-Id: <20230707193942.3806526-3-dmitry.baryshkov@linaro.org>
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

In preparation to refactoring the dpu_core_perf debugfs interface,
extract the bandwidth aggregation function from
_dpu_core_perf_crtc_update_bus().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++--------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..333dcfe57800 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -206,33 +206,38 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
-		struct drm_crtc *crtc)
+static void dpu_core_perf_aggregate(struct drm_device *ddev,
+				    enum dpu_crtc_client_type curr_client_type,
+				    struct dpu_core_perf_params *perf)
 {
-	struct dpu_core_perf_params perf = { 0 };
-	enum dpu_crtc_client_type curr_client_type
-					= dpu_crtc_get_client_type(crtc);
-	struct drm_crtc *tmp_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	int i, ret = 0;
-	u64 avg_bw;
+	struct drm_crtc *tmp_crtc;
 
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+	drm_for_each_crtc(tmp_crtc, ddev) {
 		if (tmp_crtc->enabled &&
-			curr_client_type ==
-				dpu_crtc_get_client_type(tmp_crtc)) {
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
-					dpu_cstate->new_perf.max_per_pipe_ib);
+			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
+						    dpu_cstate->new_perf.max_per_pipe_ib);
 
-			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
+			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
-			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
-				  tmp_crtc->base.id,
-				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
+					 tmp_crtc->base.id,
+					 dpu_cstate->new_perf.bw_ctl);
 		}
 	}
+}
+
+static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
+		struct drm_crtc *crtc)
+{
+	struct dpu_core_perf_params perf = { 0 };
+	int i, ret = 0;
+	u64 avg_bw;
+
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	if (!kms->num_paths)
 		return 0;
-- 
2.39.2

