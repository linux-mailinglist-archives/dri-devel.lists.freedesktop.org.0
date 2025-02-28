Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B584FA49013
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 05:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F00E10EBFB;
	Fri, 28 Feb 2025 04:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CNAeDyAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB0A10EBF7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:14:26 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5454f00fc8dso1533057e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740716065; x=1741320865; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wKmEhSMCDJBoOlvCmALSOOybeelc7567Ow0tL2ku5rA=;
 b=CNAeDyAZh+1VSlFQWKYXzbZIZk8gB28OL6EymCZTBOfNd2hMvQNTzyV0+XotMreVn7
 poBI+7QX3OIGRwJQRMIOUarJM75/JWJcg29Hp1VfUQgqIfA9sEvtQIP+No2N1Py8iWKG
 3RLcx3RcJTmR5FqEIljfHfHlsSo5zxNC3S/+5E5x6JWoNp2cCehiAUdXue4jL6U7Br+L
 HdFkt75lRaY6lE0h1YM/f1m2dlk/tzpXNdH02ueu7rgpzUiij/gdUUo+MQkYSsh63r7v
 g3REeHE+Gv9GK0PNnBR+EAwgcnnziMZPAVqxsH1eWVmmT6dwwpU4HpOOf3bOJlh4AX+d
 8BRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740716065; x=1741320865;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKmEhSMCDJBoOlvCmALSOOybeelc7567Ow0tL2ku5rA=;
 b=X3EMUAYZEOuC/vmp6Xsxi/sjaTfiEOkKH2t+E0eisD8wHU/ELkk9XIovItLydVaiiC
 hO1sh0pUqIzoV2o98ePaM5OUWVKtOPvb0ds2mU9q0OPavKStn22nFgaT85HhYcrxuENz
 Mue1oaS7hMYAJgj1wYh9s1l20aaTEeAFOcrqhCEJmDbrtb/rB//IYUeKt9U/Pj2GRofp
 b8RE8mT0uwtG7q9azxEC3FwsajKy0SyNkWl8zx4+IJdHhxNlzZQhXH+c9XLQs/N477p6
 z176LC8LOLWY1niQL8ttQtGa8ASYkjEenhywJ7YON6xkPOmo4mfRhzdAnpyXiyQgnQd+
 +/Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYmCH8vKjdmcZB98l4a2VQ5MbmrwiPIkiS7/yxoFTJ2xL2DGxOPJifYGoccp7IYizD1GgGCALdZbc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkeX6HXiineNpxXTb8t2a7AG34MuuJ/NIY3dEI/ndC0yqUhN0F
 4IPTDh+YDNgvb5ktRxJJdTINALN8UblvMTMQH6+otLpn+u227NISUNylX9Bbszw009Nie1+n9mh
 bt9o=
X-Gm-Gg: ASbGncv8d65Z9Cgxl9Bcgi+7YC7yjyDWOW99TniDpnIBCEo8PaQoiphiFQSV+vIbsK7
 hkBkCfOisXR72IhuFNGksMoHYXLA9zgifNDaQ6KEKE02aizIoPcMq8KEUlMJs34blFlRDhaQkYW
 6fbo/UMwyZ5/tBTPUj7V6UjyVXh+VZzHtp3QHI68iK4Gjx+Cn791XLkEgLIWzcJxOUAYecmTTcE
 h3g3OAJscU8sQ+7hETny1YI7Dt08+V1kFbrfbkjPKGuRjA7Zs+cUWa5RaqMIsKv9Ml1GtO8Y58/
 piSMnRBAjiPx7eULW3Fg1cOqu7xJQxFg0Q==
X-Google-Smtp-Source: AGHT+IFrTPCwHoGYny5G5ckuZI9C77r7UCSKuEcNlsrjyiXZzEXpDmSCPxAlcfpE49ug1V57noOTpw==
X-Received: by 2002:a05:6512:281d:b0:53e:3a7c:c0b5 with SMTP id
 2adb3069b0e04-5494c129c16mr531065e87.10.1740716065030; 
 Thu, 27 Feb 2025 20:14:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:14:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:10 +0200
Subject: [PATCH v2 6/8] drm/msm/dpu: allocate single CTL for DPU >= 5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-6-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2950;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9ME/m1J0a8xy6pkwPYSmuv8Gj0s9JDUVh/PU+W77WMM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgPW1XbcApwPVKDVEeAb03bL+wmkGORnOawA
 uH15T8hTtGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DwAKCRCLPIo+Aiko
 1e9OB/9D4+zlNGC1yj7F8c0RRfwqJqfV6I3eZX/gkilovYH5z/qUEgL4iDR5UHJToEYT9jih8N5
 vw5J2AqH2CDEhPbTizrPvX3j3/inVKMqWYVYjoLNpB7iJoiCJPv7v1yXN6e3DYuuuRdgh7+hfoa
 3Hp5ahV7CNuJonfRI0RIXQ62eadvSDgEmTA552kowBP/MaHzLAMuAdrch+v0FANs2bPI6u2zYE8
 zrXe9dacEQQ+7IFFHchXWk/dHNkwt7ayZ5HYJ3YZiSlS8gEgC34U+sAGo3VZAl1XogSJJsIUWFY
 J1GuLCirv3jYxmdpvlncb1RdAaHRAyF/GuGl5Xz8KhFpeSe8
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

Unlike previous generation, since DPU 5.0 it is possible to use just one
CTL to handle all INTF and WB blocks for a single output. And one has to
use single CTL to support bonded DSI config. Allocate single CTL for
these DPU versions.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 5baf9df702b84b74ba00e703ad3cc12afb0e94a4..4dbc9bc7eb4f151f83055220665ee5fd238ae7ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -53,6 +53,8 @@ int dpu_rm_init(struct drm_device *dev,
 	/* Clear, setup lists */
 	memset(rm, 0, sizeof(*rm));
 
+	rm->has_legacy_ctls = (cat->mdss_ver->core_major_ver < 5);
+
 	/* Interrogate HW catalog and create tracking items for hw blocks */
 	for (i = 0; i < cat->mixer_count; i++) {
 		struct dpu_hw_mixer *hw;
@@ -381,10 +383,16 @@ static int _dpu_rm_reserve_ctls(
 	int i = 0, j, num_ctls;
 	bool needs_split_display;
 
-	/* each hw_intf needs its own hw_ctrl to program its control path */
-	num_ctls = top->num_intf;
+	if (rm->has_legacy_ctls) {
+		/* each hw_intf needs its own hw_ctrl to program its control path */
+		num_ctls = top->num_intf;
 
-	needs_split_display = _dpu_rm_needs_split_display(top);
+		needs_split_display = _dpu_rm_needs_split_display(top);
+	} else {
+		/* use single CTL */
+		num_ctls = 1;
+		needs_split_display = false;
+	}
 
 	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
 		const struct dpu_hw_ctl *ctl;
@@ -402,7 +410,8 @@ static int _dpu_rm_reserve_ctls(
 
 		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
 
-		if (needs_split_display != has_split_display)
+		if (rm->has_legacy_ctls &&
+		    needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 99bd594ee0d1995eca5a1f661b15e24fdf6acf39..130f753c36338544e84a305b266c3b47fa028d84 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -24,6 +24,7 @@ struct dpu_global_state;
  * @dspp_blks: array of dspp hardware resources
  * @hw_sspp: array of sspp hardware resources
  * @cdm_blk: cdm hardware resource
+ * @has_legacy_ctls: DPU uses pre-ACTIVE CTL blocks.
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -37,6 +38,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
 	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
 	struct dpu_hw_blk *cdm_blk;
+	bool has_legacy_ctls;
 };
 
 struct dpu_rm_sspp_requirements {

-- 
2.39.5

