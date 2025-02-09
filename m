Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59711A2DA91
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 04:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A15A10E462;
	Sun,  9 Feb 2025 03:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mUl1eu/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A968A10E462
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 03:21:30 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-545075ff6d5so557937e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 19:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071289; x=1739676089; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L6wwW0QFPdtORCKU8NZ1/0ghy/8xuSyLBH+dFHVgBk4=;
 b=mUl1eu/uPXTJp8LQGd6a4pfbVFNByPsE25DO/n3ocDe7mh91nld/rnvUQuMhI0O4jy
 rvx2TGfNmrvHMJhBXYjNplZfWo6xlJe8IisAijBXEVV+vkC4w9FUOWJh54E4+ef8+P8F
 eEfZVjxdnXHt6HmWlRU/ZV0PZjnwQXP+I5AIOZATdu8yeueNtHm8/u+LCob1t1icCQFX
 q81KctI71L1ThYolRv/7v/Xg7xMYN4J5P3p5zqCvKcgr6vqlBCr8srtRoTRuor5KExBn
 hL/9et0Gg2W/tUF56GcDvEWNmAcFKZDiXqxZW4KxlTULQ+NTteQOUTYBG3mKOBxJKWTW
 k+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071289; x=1739676089;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L6wwW0QFPdtORCKU8NZ1/0ghy/8xuSyLBH+dFHVgBk4=;
 b=Y9fmOl91JFRGSeWo8O3MNgWGBop0ptCQxx+Pdk8Mhc52080Kne166aR1fT3wnfd0LK
 SbWe7BLOnn039DEWwONidkBHkjZXfUFPL0j0n/ZPZ177O7Kbk5jzVTon6UDk5lmxfQNp
 MjnR7gogrFkXDRjSXBDPRiTr0uaftG/RIrgrTqsefPM2HApVq5WrhwoyZkisWT5MDklf
 u4H1iIxxMf/DiwDiFr5nMRVMp3xxIM7nuZeup2J8SV7qzDOeOMV2o3o3NYKmDkw13dv5
 UdAAEW0iNYaM/1BHh8zRRb/Pfkcj4nYrE9dCKrkKNc7cxq4KDm+m0HrAw+1BvgItApOU
 C2Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo703iq+5R2WlSCB3jP+dsfNQud1PHGufKcdqCqWPP+Mt1+/rA6yTWb6nsvgGZ4+h6C1JOI0P6oac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4HPk099z0CgLNURIaubyp0uAm2AR1eLrJhxuQ+EM2Zu36oJSa
 Cyr/vP1RzBdUB6x3BUsYpm33Fq/f7gTQSRtmDIcEyNtv7xgT2nvZpCIhYR90Vhk=
X-Gm-Gg: ASbGnctI0K6DckTFl24mdfw5pH6maMyqYODKC1wDVQcfzGzhFy76O75QwD5SqDy7UFz
 DKlsj3ro3Jgf/j9tzN0Jsnn4xrOlyNNQRs3dIuEVRRtNPo+j9oIBVuwYOZWvSVIRFKlGB5U4O1t
 srCeLRI/4O/rL0Gz70aSJVQTdiFy+ocqxPZky/pZnhXkdAduIWl/8rUDbUa9qwf0jCMoS1DsPbU
 jMPPUBLCrfC/GEbhbtpQSIOE72ZWoiZRpJv4TytlyE33m3gwxuyiRPUpBTZPqVQvnZ9HnwEG2MU
 uje9JMcafaP7gf01n4LEKIk=
X-Google-Smtp-Source: AGHT+IHXUbH/9yqUmGnp3k36rb6gFBh+eJdHg9jUhlwppiog1OyIRRhSRdeufKtsyeV4etFm6mPnPg==
X-Received: by 2002:a05:6512:3051:b0:545:54b:6a0e with SMTP id
 2adb3069b0e04-545054b6b1emr1242776e87.48.1739071288890; 
 Sat, 08 Feb 2025 19:21:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:21:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:12 +0200
Subject: [PATCH v5 2/8] drm/msm/dpu: remove duplicate code calculating sum
 of bandwidths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-2-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4737;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VkKt7DJwj8H2cF9BwqW7u1ROLqNk4NBL0guvyk9GsSU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wh6HJKbyu78/IMI06YCXqau9Jwg6s8jEuH
 rR2Fc6F4SyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1TPcB/49BWLC7cQRm6HFzEGFU4HgjYm8aRd57tVqmsvestZ0rfSc6ldlE3TwOrteRyekalsf+8D
 ikGK1Cipbxh7Weo3N7TfuM/rtgRCX7NJIhRUlCzqY22seU2u+qYxrm0jDlVhdSv7Tp4N3MJphJx
 o59XVnEiETSkzTcsPUzwuuyBviEWrvr6/r7BPS4da0hrYbgdK8Y1upkZAX+bZAvdSZ/gwlbNjru
 M5GgsRBk6h2X7jZDmy0SSakAePkWwP/209i8iEUmtrkY8RyMljEJZQG1BD8SuErUbNYytCAh93D
 +iUPWQq2L+PkcYRr2V7OdK4pLabe2j86biKfc+KfcW1T3L56
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

The code in dpu_core_perf_crtc_check() mostly duplicates code in
dpu_core_perf_aggregate(). Remove the duplication by reusing the latter
function.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 94 +++++++++++----------------
 1 file changed, 38 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index c7ac1140e79dbf48566a89fa4d70f6bec69d1d81..f0d490afb53be2f4bc706af91da05bb893a5fe34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -140,6 +140,30 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 			perf->max_per_pipe_ib, perf->bw_ctl);
 }
 
+static void dpu_core_perf_aggregate(struct drm_device *ddev,
+				    enum dpu_crtc_client_type curr_client_type,
+				    struct dpu_core_perf_params *perf)
+{
+	struct dpu_crtc_state *dpu_cstate;
+	struct drm_crtc *tmp_crtc;
+
+	drm_for_each_crtc(tmp_crtc, ddev) {
+		if (tmp_crtc->enabled &&
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
+			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
+
+			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
+						    dpu_cstate->new_perf.max_per_pipe_ib);
+
+			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
+
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
+					 tmp_crtc->base.id,
+					 dpu_cstate->new_perf.bw_ctl);
+		}
+	}
+}
+
 /**
  * dpu_core_perf_crtc_check - validate performance of the given crtc state
  * @crtc: Pointer to crtc
@@ -150,11 +174,9 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
 	u32 bw, threshold;
-	u64 bw_sum_of_intfs = 0;
-	enum dpu_crtc_client_type curr_client_type;
 	struct dpu_crtc_state *dpu_cstate;
-	struct drm_crtc *tmp_crtc;
 	struct dpu_kms *kms;
+	struct dpu_core_perf_params perf;
 
 	if (!crtc || !state) {
 		DPU_ERROR("invalid crtc\n");
@@ -172,68 +194,28 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	/* obtain new values */
 	_dpu_core_perf_calc_crtc(&kms->perf, crtc, state, &dpu_cstate->new_perf);
 
-	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
-	curr_client_type = dpu_crtc_get_client_type(crtc);
-
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
-		if (tmp_crtc->enabled &&
-		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
-		    tmp_crtc != crtc) {
-			struct dpu_crtc_state *tmp_cstate =
-				to_dpu_crtc_state(tmp_crtc->state);
-
-			DRM_DEBUG_ATOMIC("crtc:%d bw:%llu ctrl:%d\n",
-					 tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
-					 tmp_cstate->bw_control);
-
-			bw_sum_of_intfs += tmp_cstate->new_perf.bw_ctl;
-		}
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
-		/* convert bandwidth to kb */
-		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
-		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
+	/* convert bandwidth to kb */
+	bw = DIV_ROUND_UP_ULL(perf.bw_ctl, 1000);
+	DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
-		threshold = kms->perf.perf_cfg->max_bw_high;
+	threshold = kms->perf.perf_cfg->max_bw_high;
 
-		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
+	DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
-		if (!threshold) {
-			DPU_ERROR("no bandwidth limits specified\n");
-			return -E2BIG;
-		} else if (bw > threshold) {
-			DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
-					threshold);
-			return -E2BIG;
-		}
+	if (!threshold) {
+		DPU_ERROR("no bandwidth limits specified\n");
+		return -E2BIG;
+	} else if (bw > threshold) {
+		DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
+				threshold);
+		return -E2BIG;
 	}
 
 	return 0;
 }
 
-static void dpu_core_perf_aggregate(struct drm_device *ddev,
-				    enum dpu_crtc_client_type curr_client_type,
-				    struct dpu_core_perf_params *perf)
-{
-	struct dpu_crtc_state *dpu_cstate;
-	struct drm_crtc *tmp_crtc;
-
-	drm_for_each_crtc(tmp_crtc, ddev) {
-		if (tmp_crtc->enabled &&
-		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
-			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
-
-			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
-						    dpu_cstate->new_perf.max_per_pipe_ib);
-
-			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
-
-			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
-					 tmp_crtc->base.id,
-					 dpu_cstate->new_perf.bw_ctl);
-		}
-	}
-}
-
 static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 					  struct drm_crtc *crtc)
 {

-- 
2.39.5

