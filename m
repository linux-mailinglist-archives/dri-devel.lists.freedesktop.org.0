Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ECF5072E1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D4C10F0E3;
	Tue, 19 Apr 2022 16:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C28110F0E3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:20:34 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o2so30247053lfu.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Y386dymL2VIdENRDMYwnFni9IYIl2XYFT+P/ZpM9Wo=;
 b=RPKT5v3MzS/QFT4rX+d5z6++oE+7O/vF4Xn/lrBTpFAd8DIn/mVCaSR7oXE1YYL3xg
 H0D5In+S26kW9saleEO6/FhY7UB7MG4EgW3mVY9QhPxh8HxI30kPBOedur0NPswKa/oS
 xcGWq9LRLuGPxZ+szn6PUoxpJOb2XC/z6Jq5kmUac62GZ4ROdZxscc2s2vbzPYGqXJDY
 eZAbnvoak0sgiNieSky+cANHIKzFYPhovEBE12QmB0mAJborODkTN1vL5Ebv+jU6ZSrU
 CuXQUsRxnGAjz0O8z+AwzKP4q/kMywiTa7+nOi04BLx3WcitpYo6D5c1WuSHPQ4pCaRL
 S3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Y386dymL2VIdENRDMYwnFni9IYIl2XYFT+P/ZpM9Wo=;
 b=ES3HGuwYEU3y/XIjHQQgYlNFqJ9GDV0RwXUeoYLE0DFJsSGKuwAH7AHFEx5z6T5Apz
 pToQuMG0y5qRYkAPgemK1srmGOsWxoV2PF4IgvLvuetB7eK1lDEArwVYIkrKDklS4LsJ
 SjZTFDGKatZCYvGyAfOk6Vld3JvSSLr1S6JGWsw8l1UcdihX3MSIrhpOxncRLZXfhE7h
 ERM0QN+PU6mPOLHcBKGbJAQ+5eYGs9hbxDiwYe44eXt0xafclcs3kyjgL3PE1DZRQQV5
 KaxDxHkdEHIX2UEUWvBwG7rPF2ED+nkVLFOYtRXJ1OHHhGHC4HdmCOcFHw1c0NvvDxjZ
 cikA==
X-Gm-Message-State: AOAM531VXTNzBx06hd0+KC0A3pDifp6yiSUj8U+bEqycOkt2faicPDgd
 sgl55SPz08Nx1B8azD54scLfSw==
X-Google-Smtp-Source: ABdhPJzdDrIUM59TTCAicyjrfvPd/DiMKEY1iS0FzjI22Kxg5QOcJ22OHecE2AkXb5ZYBxkW1rr4Eg==
X-Received: by 2002:ac2:484c:0:b0:46d:28f:cc03 with SMTP id
 12-20020ac2484c000000b0046d028fcc03mr11354581lfy.235.1650385232726; 
 Tue, 19 Apr 2022 09:20:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1495153ljh.45.2022.04.19.09.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 09:20:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/3] drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
Date: Tue, 19 Apr 2022 19:20:28 +0300
Message-Id: <20220419162030.1287562-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
References: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove loops over hw_vbif. Instead always VBIF's idx as an index in the
array. This fixes an error in dpu_kms_hw_init(), where we fill
dpu_kms->hw_vbif[i], but check for an error pointer at
dpu_kms->hw_vbif[vbif_idx].

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 29 +++++++++++-------------
 2 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e29796c4f27b..aadf032a190b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -790,11 +790,9 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 	_dpu_kms_mmu_destroy(dpu_kms);
 
 	if (dpu_kms->catalog) {
-		for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
-			u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
-
-			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx])
-				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
+		for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
+			if (dpu_kms->hw_vbif[i])
+				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[i]);
 		}
 	}
 
@@ -1102,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
 		u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
 
-		dpu_kms->hw_vbif[i] = dpu_hw_vbif_init(vbif_idx,
+		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
 				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
 		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
 			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 21d20373eb8b..a18fb649301c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -11,6 +11,14 @@
 #include "dpu_hw_vbif.h"
 #include "dpu_trace.h"
 
+static struct dpu_hw_vbif *dpu_get_vbif(struct dpu_kms *dpu_kms, enum dpu_vbif vbif_idx)
+{
+	if (vbif_idx < ARRAY_SIZE(dpu_kms->hw_vbif))
+		return dpu_kms->hw_vbif[vbif_idx];
+
+	return NULL;
+}
+
 /**
  * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
  * @vbif:	Pointer to hardware vbif driver
@@ -148,20 +156,15 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_ot_params *params)
 {
-	struct dpu_hw_vbif *vbif = NULL;
+	struct dpu_hw_vbif *vbif;
 	struct dpu_hw_mdp *mdp;
 	bool forced_on = false;
 	u32 ot_lim;
-	int ret, i;
+	int ret;
 
 	mdp = dpu_kms->hw_mdp;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		if (dpu_kms->hw_vbif[i] &&
-				dpu_kms->hw_vbif[i]->idx == params->vbif_idx)
-			vbif = dpu_kms->hw_vbif[i];
-	}
-
+	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
 	if (!vbif || !mdp) {
 		DRM_DEBUG_ATOMIC("invalid arguments vbif %d mdp %d\n",
 				vbif != NULL, mdp != NULL);
@@ -204,7 +207,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_qos_params *params)
 {
-	struct dpu_hw_vbif *vbif = NULL;
+	struct dpu_hw_vbif *vbif;
 	struct dpu_hw_mdp *mdp;
 	bool forced_on = false;
 	const struct dpu_vbif_qos_tbl *qos_tbl;
@@ -216,13 +219,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	}
 	mdp = dpu_kms->hw_mdp;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		if (dpu_kms->hw_vbif[i] &&
-				dpu_kms->hw_vbif[i]->idx == params->vbif_idx) {
-			vbif = dpu_kms->hw_vbif[i];
-			break;
-		}
-	}
+	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
 
 	if (!vbif || !vbif->cap) {
 		DPU_ERROR("invalid vbif %d\n", params->vbif_idx);
-- 
2.35.1

