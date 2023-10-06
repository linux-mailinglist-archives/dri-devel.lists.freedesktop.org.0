Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 168727BB94A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CFB10E50A;
	Fri,  6 Oct 2023 13:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D67310E4FB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:37:25 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-503f39d3236so2633892e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696599443; x=1697204243; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plrtfO8h25uUoR+D2Ur8tutbh5oxCszjqqN/PL1rwNQ=;
 b=W/AAa71CHPGtsfJRS4HwsD2Eag59LTyfo9Npg8Bli80wWU/RHUqvIIhpLgf2eKDk2O
 nl3Ha1uzOLVsBKlAcbMgi+8uSqbNTeRj02x67EGN71fD26AN4R5JaHuL3VFCGnBndmPG
 JHgkeJ1A/rnSDK34n+T+HBFg0/9jhZseZjtMZRko87ajmtdPfLhARBP697BHIrMUODe+
 vay9eWnnFjDpiU73d81c/NHIwGsBNX5xexkhh2AzibVGNULpq+cCsKyHq8X0tD++Z5H+
 orH/hZnWGYNajnFlbgvsl0wDyLbFK0RrFnp5bi9D328Lcl2/vTujyr/9s9VHMHUwHsC5
 orbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599443; x=1697204243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=plrtfO8h25uUoR+D2Ur8tutbh5oxCszjqqN/PL1rwNQ=;
 b=mDK2r4Zva49YPksCKC531wqBxL4x8CONtqnylOutHqgFf86KVZLylIC4XkckM0ldty
 0RbzjLxCYHMUaX1IhY3Xncq+zKDpt+WI6T5Ac/ussIYU18/ro/LSV33bjaIHPYQDgXAH
 +T71hVeb86V1i2VQQwk5ShlTzKFscXB8QVDIpgpYySyaFE1VT9RtnMPo2JSuAjCCd90F
 3BrWjI/+iPmzCP6Ep/k57m7VK3nHgEkaq8ClFM96buocU+LT37UGvhdzLclN61/TDUrd
 PkF0ROHQ3p2gDvhi2tmZqare57ghBOdBMCQKdtp4mRiPZBSwDdJLXr4SQNQtUYujrAgd
 n7iw==
X-Gm-Message-State: AOJu0YwR71dHuB1rHfhSqDBHP0SVxcIPrknrrfOf5daZaJAmROb63ZCp
 SDcQCg54QZoyQMcT+3Le3Uf3Xw==
X-Google-Smtp-Source: AGHT+IF0aCUsyxayOk5nYHN7LEgt7M/V+gnGLbc7RMgQ3Q/sol+ZdeG75i01bUgm8c8YVyBTiGCMIQ==
X-Received: by 2002:a05:6512:ac5:b0:503:2eaf:1659 with SMTP id
 n5-20020a0565120ac500b005032eaf1659mr9547303lfu.41.1696599443020; 
 Fri, 06 Oct 2023 06:37:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056512015b00b0050567cdb8f6sm303534lfo.239.2023.10.06.06.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:37:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/5] drm/msm/mdss: generate MDSS data for MDP5 platforms
Date: Fri,  6 Oct 2023 16:37:16 +0300
Message-Id: <20231006133720.2471770-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
References: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
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

Older (mdp5) platforms do not use per-SoC compatible strings. Instead
they use a single compat entry 'qcom,mdss'. To facilitate migrating
these platforms to the DPU driver provide a way to generate the MDSS /
UBWC data at runtime, when the DPU driver asks for it.

It is not possible to generate this data structure at the probe time,
since some platforms might not have MDP_CLK enabled, which makes reading
HW_REV register return 0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 51 ++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6865db1e3ce8..4d98ef45c10d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interconnect.h>
@@ -222,6 +223,49 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+#define MDSS_HW_MAJ_MIN		GENMASK(31, 16)
+
+#define MDSS_HW_MSM8996		0x1007
+#define MDSS_HW_MSM8937		0x100e
+#define MDSS_HW_MSM8956		0x1010
+#define MDSS_HW_MSM8998		0x3000
+#define MDSS_HW_SDM660		0x3002
+#define MDSS_HW_SDM630		0x3003
+
+/*
+ * MDP5 platforms use generic qcom,mdp5 compat string, so we have to generate this data
+ */
+static const struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
+{
+	struct msm_mdss_data *data;
+	u32 hw_rev;
+
+	data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	hw_rev = readl_relaxed(mdss->mmio + HW_REV);
+	hw_rev = FIELD_GET(MDSS_HW_MAJ_MIN, hw_rev);
+
+	if (hw_rev == MDSS_HW_MSM8996 ||
+	    hw_rev == MDSS_HW_MSM8937 ||
+	    hw_rev == MDSS_HW_MSM8956 ||
+	    hw_rev == MDSS_HW_MSM8998 ||
+	    hw_rev == MDSS_HW_SDM660 ||
+	    hw_rev == MDSS_HW_SDM630) {
+		data->ubwc_dec_version = UBWC_1_0;
+		data->ubwc_enc_version = UBWC_1_0;
+	}
+
+	if (hw_rev == MDSS_HW_MSM8996 ||
+	    hw_rev == MDSS_HW_MSM8998)
+		data->highest_bank_bit = 2;
+	else
+		data->highest_bank_bit = 1;
+
+	return data;
+}
+
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 {
 	struct msm_mdss *mdss;
@@ -231,6 +275,13 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 	mdss = dev_get_drvdata(dev);
 
+	/*
+	 * We could not do it at the probe time, since hw revision register was
+	 * not readable. Fill data structure now for the MDP5 platforms.
+	 */
+	if (!mdss->mdss_data && mdss->is_mdp5)
+		mdss->mdss_data = msm_mdss_generate_mdp5_mdss_data(mdss);
+
 	return mdss->mdss_data;
 }
 
-- 
2.39.2

