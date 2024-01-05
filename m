Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE2825D2A
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 00:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2A010E6C0;
	Fri,  5 Jan 2024 23:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAE110E6AC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 23:34:19 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e8ca6c76dso70049e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 15:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704497658; x=1705102458; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pivXLuv3moQJBJFOlfzUjv/WGq0UATAH7Ew9ljEMyg4=;
 b=vTWA+S2T01KRC3bFOAgQ9sUg/nNWkNiZMpHPyhd2XZZfL0qnjr5BDBtb5K2xojDQXv
 E5gVgMgWXafKMK0iB30oNKDGV/xAUKtOYHDIFQb2hQXj1YvUINoHBEnhBjilNLOP+Njn
 iN+r1ooIjvlaTkEnHUFGUCLST5s9SFTwYLrlW8vDEb/Xc/05QgH1sXgqgZ3CTufbCbxu
 zXQqdxbyUk3ZNbzpIrHsLRzuRPd78aHrVmGzunMIkVIaO8k96o/NR03lldpNWfv1f5sZ
 5g13OCgQSDuWa9iHEI7cUzWojbmq8VCTjRP51ysUSU4+jvvyHZKUiXy+x3LCV1FYUlkZ
 /BAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704497658; x=1705102458;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pivXLuv3moQJBJFOlfzUjv/WGq0UATAH7Ew9ljEMyg4=;
 b=gJq1drgeGjgv/o7AizSjsvzc01m4EUcH/GK8NoZoNw9StddPTEQiY/3FrqHVowxfek
 WToROmYNEkUGgOCZB6bghLQoEzWX01thiP6vjYFSP3+18T7FRNXZlYLMPIkWMmh93Jq/
 JYZlA8M2pc2E1RF4rv78MsW0zVShxFg6vxz8FgeWgBG8MLyZ8gSdsB7wtgzD7epLvWnR
 UfoZwfIZ6nju1CMErEguAu7PXcxNVF9IXnpSF6ya7+WX2H/TOUqOIX6KJ2w5t7ImoiFE
 UGePQQm5ha0V3zKNolm3nj2vsUYzL0ECIiJ9wBL1MnwXjKeZP0XYOROOoxkhSWDnQ+pT
 uc1Q==
X-Gm-Message-State: AOJu0YxdEDJGQbxpRvnJJgKIyDYmT1k27kNAi7MqgBN5CzN0fDPlbfWZ
 BuvWiE5M7if0WypnzwqVZux5s8mhOv+1Qw==
X-Google-Smtp-Source: AGHT+IHjjfgIUzKUmYx8HvWto+XFSDXGxrDrzCnNGlIaweKA9Pizp1MjnofAvmLAwmRQ4ywaKSuTYQ==
X-Received: by 2002:a05:6512:1304:b0:50e:b206:50f6 with SMTP id
 x4-20020a056512130400b0050eb20650f6mr105571lfu.62.1704497658026; 
 Fri, 05 Jan 2024 15:34:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 k4-20020ac24f04000000b0050e74d04c8asm362211lfr.132.2024.01.05.15.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:34:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 06 Jan 2024 01:34:15 +0200
Subject: [PATCH v3 1/4] drm/msm/mdss: generate MDSS data for MDP5 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240106-fd-migrate-mdp5-v3-1-3d2750378063@linaro.org>
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
In-Reply-To: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LkZVf/+xPhq0hvOZBHDG1k3f2Ti6cdXMRdV8DhuZcww=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlmJH3neGn4tNLgH5uqv+GRDujihKsIuYzeU+fQ
 q1wipxEVTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZiR9wAKCRCLPIo+Aiko
 1Yx5B/9qCYBUPIhNXXCNksAqS7Arv9TpBfuk3jYAtOIwuslsf84dtngnOJy6DXX8QwgKpSXgDe5
 JhfPlKOHR9iZhYK5hS+C7iwVbnxvAPpdrd9Sywmekw1jdXD/dHqJIh2i5zEfj0rtE8rxaa2TPF9
 deM0w/KJ3NIz8Uu1jb8Bi+PlnwiBb6hF9y0B5Mj4/TNl/a//GjhBJGxY0RCpdck24Tmcm+HrJsP
 wzskwxbkgDYAjlaGhfEYZHoYz5WQddJgOS0LAk/hk4qamQvaJBUlIlZSYNqY0s/JbokBghgyYjA
 ZMWyStoIRyPRfOWmjpgpomAa1vpzfGd8sMkF08lDj+F1roJy
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
 drivers/gpu/drm/msm/msm_mdss.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 455b2e3a0cdd..566a5dd5b8e8 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interconnect.h>
@@ -213,6 +214,49 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
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
@@ -222,6 +266,13 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
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

