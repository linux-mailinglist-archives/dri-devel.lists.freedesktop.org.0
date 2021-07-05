Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF13BB4D8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5D589BF0;
	Mon,  5 Jul 2021 01:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EDE89BAE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:19 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id r16so22346206ljk.9
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDsHX0hxp/QVNOmO09ufPm+XNBvCicnDs8mQ30Y15QQ=;
 b=w3dDSLN3s6dj6Eu0RsDo+s3MXu59YHHkVWukQHMb3jMNoaH5ZOPh01bXrgyaEOf/ee
 JrgKMnuSjLxehp+t0zFU4/IU48Z7bzVQN6Zs1dXiLgSDxH679bwn4ggDs80xy1Sr8apJ
 PMU8K0pqi/NH7GnQ+7O5sZT5P05kZ6ukJu2RhjH5R20d29Ozu2o6WMMIZ5VlEgYyGixq
 t1mHyNU2gQAM6lucsoDzVrr/xWI6zlCe3YWauAMHgLHU15qvNIUAyNYnFOoRnB97qPEg
 a4PjQOkaspcoqm2kzEUnezIonjCIA1K2m9qmlgpkC9vxA/NZYwN8XhOS8Gn8Yzheqp0l
 RTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDsHX0hxp/QVNOmO09ufPm+XNBvCicnDs8mQ30Y15QQ=;
 b=PC8yP+HUEwbupQqv2sU+y3D9e0ik3F9ozoBK+jhZ5+K3qY8NpxpuFuDbefzcnx4jER
 NivakI67MTlnfbMq6PT9FdsGVnVxw3M9vK44YUzKlk6B90QFSyErKmESDkNIu0XYMlZD
 JZpEWmCAvmNCp5xZWEB2iIO3nTchjI0XjJz5KUO/mKoaYTbz0OM1TugCu/9ITZtOTOtJ
 cPw1aOW3tzriD4RTQETQnPEA0Y528hNms+ZHj0s+YG50GUskvvcvA10cyGvDWkqCRW7U
 3ITe4jKxA9AuWVFpu1n9u2uu2Ua/dD1xRYhO13jCoQ9rqsGXROkW2cwFg0cyDlCdKW+G
 efvg==
X-Gm-Message-State: AOAM5333yLVSzTvS0T7h5o6KN9uEelFh4RepLLrKO+a6OpnYNei9DC5r
 8Oo+ZSXvMLbuBQwL9vl3Mrvm2ke3tCEABA==
X-Google-Smtp-Source: ABdhPJyBgJHrsLnImuBCvXevidlUx106HBbkf4d9I/VRlJgvxqrzm35g/QnBhWAaTj9rmTGB74lX4Q==
X-Received: by 2002:a2e:958b:: with SMTP id w11mr8919899ljh.55.1625448317628; 
 Sun, 04 Jul 2021 18:25:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 14/22] drm/msm/dpu: add list of supported formats to the
 DPU caps
Date: Mon,  5 Jul 2021 04:21:07 +0300
Message-Id: <20210705012115.4179824-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As we are going to add virtual planes, add the list of supported formats
to the hw catalog entry. It will be used to setup universal planes, with
later selecting a pipe depending on whether the YUV format is used for
the framebuffer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d01c4c919504..b8e0fece1f0b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -195,6 +195,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7180_dpu_caps = {
@@ -207,6 +209,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8150_dpu_caps = {
@@ -223,6 +227,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8250_dpu_caps = {
@@ -237,6 +243,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 4096,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7280_dpu_caps = {
@@ -249,6 +257,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d2a945a27cfa..f3c5aa3f4b3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -324,6 +324,8 @@ struct dpu_qos_lut_tbl {
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
+ * @format_list: Pointer to list of supported formats
+ * @num_formats: Number of supported formats
  */
 struct dpu_caps {
 	u32 max_mixer_width;
@@ -340,6 +342,8 @@ struct dpu_caps {
 	u32 pixel_ram_size;
 	u32 max_hdeci_exp;
 	u32 max_vdeci_exp;
+	const u32 *format_list;
+	u32 num_formats;
 };
 
 /**
-- 
2.30.2

