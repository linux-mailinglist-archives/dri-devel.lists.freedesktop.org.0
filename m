Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C96387B60F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 02:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E3210E8BF;
	Thu, 14 Mar 2024 01:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Av1T74oV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CC710E396
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:10:48 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d4541bf57eso4947201fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710378647; x=1710983447; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H05lkKyWbPVJPRRlJwmLAAiEv2sm+h09AW5BdkwY1QU=;
 b=Av1T74oVzUm95y9sHz9OqTUH3S8PHfwbH7DotsGNbrHt8i0N4DknspoT9Mxmla0bb1
 AJlqcH4m/69FmYvslp3kPBGYZxs/S+F1C058khlbRL/HXNnbOmh/EZyuXQaUJhED6Nut
 KKbKOKn3zP00+lC62/X7fpYwSwkQPgUGJxpU1QS34OVWxyYWpREaDazd46i5ferJAea2
 ooz894JVWCf0XrOPLqMBJr8McKHP17nS276wCAqQHjkiMzcKrgpeYfI7ZZeamAO+zYjW
 r6ExWo19D3jEsLhLlxFyI+lzQ0vv7ZAK0F7CqBvk8Kn+BmFdUSJ4JsXnVj0Be1ulOOe7
 ZtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710378647; x=1710983447;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H05lkKyWbPVJPRRlJwmLAAiEv2sm+h09AW5BdkwY1QU=;
 b=Wmo57HN97+5uteGzK+L/XY0HqirjRH+s4tZowCBFkxvY7bHW1eYXQy+Dqi+CIS917I
 jwvv3xbgqpmTzisPM232BRLtwTQLZRUJAA00YHe5qkZ+dqenwMB3/KRHk45RrPD8Wg+/
 3o8Tbl+7wjEx0sQfJAopoK/ebafaYmLaXjJscOZYf0MaIdbXobVgyLqK1I+j6ploKLXW
 G43OIvFvAuCvF8rxYyHO8KmkkajbDh4ZCzzOwb9L2w+xCCNxgVzeWhW1e2QTNIMb2TgX
 QhTXABKp9ji3lgpCDdTMp92JSOiJ6AxaRBBZSV8zTARArb3E8xMuuKpswWRxjSe7rUlI
 8IAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxrlq989T/US1Ra+2PqyNsNezXzvhq8UwIr2esasDyDkw/CfeyiYS6jVU6R0pwkH5sCqkAx3imq9AGUAFW5drPBjgLEDW9qLNomYoA0kmY
X-Gm-Message-State: AOJu0YxqKgzeGfEjx7AKezkUF8SuJG5NumSVdO6is6INGtGR8sBLtCCj
 lyyaio/9oZZhCToSVc0fK0jVEUP6oYkxaJo4IsZGx827r9fjVlVPawybkG/IqDg=
X-Google-Smtp-Source: AGHT+IGW4KP56dB8kSZt72D48OJV+VAsUXapGyd7phHEUjL0KU73SEVc2EAO3GOCJO0b2LhW1PtD8Q==
X-Received: by 2002:a2e:be83:0:b0:2d4:64b1:25e2 with SMTP id
 a3-20020a2ebe83000000b002d464b125e2mr124380ljr.44.1710378646791; 
 Wed, 13 Mar 2024 18:10:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 18:10:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 03:10:42 +0200
Subject: [PATCH v3 2/5] drm/msm/dpu: core_perf: extract bandwidth
 aggregation function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-dpu-perf-rework-v3-2-79fa4e065574@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
In-Reply-To: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2547;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XB5qQZ6AM1gMdqH09M2m8W3Q7FcCw/TC5ffKreIP0Lc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+onv0kXr8re+i35+SlTdqBy1spZr5luMYQ+snYTuNj6O
 6JZfClnJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmkqbI/ovJbPuPd+LrnBLP
 Tzjj+pppSZDAq3k2HdHLK9qCywxrw9/c6V5y+t237E2zk/2+xlQpRP5e/OeBUA1v0IEpz1feM4h
 Z0R9XlnT6WMya/UpCbr7JgUZyu1Vsi8sXZib8047gDkg6qL4pdXlnwIOde01Xzlg+02oh27aUe4
 b7uqYtEyh+v8aSyYHbS2We+vwJ3HosssyhCXUZH0z/Jkm0q7PtrHoZ773c8ADLA8kbp45YF0XUH
 Gwp0GNJdcn9u9BOVb3z/6f+O7ZzjFIu2QpM+CKa1md/rLSNaVFz3mnrHfxSCVHuJWzHygWzAo+J
 Razje3jyZcabDgb/JtE3vgkf/eR+typM5tRJqTm8aW4mAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In preparation to refactoring the dpu_core_perf debugfs interface,
extract the bandwidth aggregation function from
_dpu_core_perf_crtc_update_bus().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 45 +++++++++++++++------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 68fae048a9a8..87b892069526 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -204,36 +204,41 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
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
-
-	if (!kms->num_paths)
-		return 0;
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
+	if (!kms->num_paths)
+		return 0;
+
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/

-- 
2.39.2

