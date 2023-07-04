Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E9A7474D4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9285D10E2DE;
	Tue,  4 Jul 2023 15:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C9810E1B8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:03:59 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b69e6d324aso92168881fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 08:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483037; x=1691075037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjoI3Dx1Y7JEO/QjjX2Gq34JkRG4tKXD0+CPY31Fy3E=;
 b=mnlRrEYkT1bLTpjdSK3/SYPxwdfahLX/mA2DCiGjVRVrwWVAmO1HzFdVn/6bWm0Ng3
 JCB9IdVKH2/S9Iatr/GJ653jQQRbrtW1iaR+h+/QQQ+Y9yZJIT0n9mzJJkL6vXoJ3qUF
 Nxt0v8JaIlHu1EMSXtJrrW/i3scdz50zmlB8gOyQI3UMn9XVvtU6Wa9duFjdaeLtSlx8
 cm6hj8aIHcj2gNWFx/zp2q/N46Z+jTCXXWLotENrtAUEIECfFFRSozCzSAu+AAsBEuP5
 KwZGJUVu6SQBvujwi87Pg1WFrb/Cv5txzKL97atlq5GEEorPs6hZ3k7LQW/eM5RW/W0p
 A70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483037; x=1691075037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NjoI3Dx1Y7JEO/QjjX2Gq34JkRG4tKXD0+CPY31Fy3E=;
 b=OhbbyeBept5RrZvLdSF0wJP5wA1V/W6swGalGoKZtV+rEtxLxI+PcgeQaIrHxmaMPx
 f0RytB7kdjLO2JoWljqEzUas806vz6yBgQU9CBZ/um6SZAiGoNfbiebkse9CTzRGKQ1C
 nnTf7kBspRGUpO1Lxmsppi+bBH5F5aW1C/Phtxo66NMoEsWgA33VwS65v4/8+AlTChd+
 YiWUwPlREXnhnJZ9BdjxwAAtm2IY3hJ9QIia9OlKfDaxISgAgudKE7lmUPpO3czmahLm
 6mDf4plhuB8tPFU/6W6bwbyn5KNAv6PamLcDDqkDrpPV/zAhznvCaYHIUKm7WmBThPNK
 tnrQ==
X-Gm-Message-State: ABy/qLZF/UqZHMLMrj6mH2dc4UsW/mLS6C9uLUjPb48+g4+PHwYyR0uL
 qnbDpKiIEaOBqeYXkmvnXxnsCQ==
X-Google-Smtp-Source: APBJJlEIpyGmPKFAyIMvvdNdb1Ujx+ZPnxW2uFUNINEv2423vq4210IYOn5QzypLYX/RQ6fr20NjxA==
X-Received: by 2002:a2e:9147:0:b0:2b6:b942:aaf8 with SMTP id
 q7-20020a2e9147000000b002b6b942aaf8mr9801084ljg.30.1688483036977; 
 Tue, 04 Jul 2023 08:03:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:03:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 02/14] drm/msm/dpu: core_perf: extract bandwidth
 aggregation function
Date: Tue,  4 Jul 2023 18:03:42 +0300
Message-Id: <20230704150354.159882-3-dmitry.baryshkov@linaro.org>
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

