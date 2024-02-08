Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705C684E395
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A375E10E84E;
	Thu,  8 Feb 2024 15:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t8feGnvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D3210E861
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:01:12 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51172803eecso441621e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 07:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707404471; x=1708009271; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=09TNoOVLZlsGmnIXste9R4IHFqjQ++tBbpkcO+S4Xzc=;
 b=t8feGnvPzphml0cEP2DIcZ94OYhQgXbXsPLcg1M70/kx94koEzDVRlUeIcL3cmbCYh
 7iE9vI4XsgMK1eHLTylpPuAd4+JDR1XaVx01Qg2QwQ3agDUp5nPF6kee2tK02JuGfYkf
 Olp7NnjFMAHI9uACbZTvbi55y+sXVZII+JCOgE50OrvPftxJlnxN4bPqXXHbyJfVMv6W
 pTZKQI/86X0b3C6XaYgYFHfoBfRLYipRaz0+Rw31fLuwLOPWZMwCBJ9CWExzed13Uxw5
 Ac1JoI1IwbXRJqqDufBcuDDjpcfF3wN2msVSgPAHtQoBX3qFWau/paQfhDRLhscsHoYJ
 fx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707404471; x=1708009271;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09TNoOVLZlsGmnIXste9R4IHFqjQ++tBbpkcO+S4Xzc=;
 b=qbymbxx/3oPfVsCK9zrYCW7QCEjDgqXSAP/cyt9Nfi/SZKEXmeWysJE0Z3s2n1D3/Y
 siDCjkNm/oLyQd8LKAZROVn1/TTxJVM/bzee/4ce4AcUJrF5JRcqxWWycVg3kLlUsZqG
 gK7isn3e1agAjArd+hWENDKzZ8GbgBFuPxmvJUqBr8wS4tfRLbwHz4g/d+s7Aerf+SfB
 JyqRiMa7/bG2jb8IvMKGbe/l+JNQifivLVPYrhd1Egk8sBgn46YgV2YpGIuZ4JVgq3Xy
 KwwSv9sx0YoHAbqFlndGXntqyzG1zkfRS0xR6GKjyWV2iXjgjeqXvi0eGq8H1Q1w/WrA
 ufhw==
X-Gm-Message-State: AOJu0YwVePPw4xHuRVGfeIUilF87yEx7IgFUGJb9W/IKBF9bOUxGL9T4
 usX+1VAtU0gjJ/j1dbqmhgGepICGv+hianKo/Wb4pOXA2wiQ4v7+UsY4KMHqu7Y=
X-Google-Smtp-Source: AGHT+IH997+Lfu4GrhYkgBcSCTznvkjiDvla5YKZrQcgsmhSieA7XDDwBqk0Ic8gCVYezKWNZFXtvg==
X-Received: by 2002:ac2:46cd:0:b0:511:554c:71a8 with SMTP id
 p13-20020ac246cd000000b00511554c71a8mr5672529lfo.37.1707404471078; 
 Thu, 08 Feb 2024 07:01:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8CIqsKS2MoC8IQIhHYrx25g7m3GhsQKEu4Gi+Jgrn8YB7SJYEUaUbOkBytY9JQDPqFaMV+iIVvv/IPw5PbLx5v4PISua+xLGpZFa9V95v4EFussmVHaWy3s8CCVHji2967gtRzmKlx113VF0JP1TZ7JdjrTweA86p7YWPpXmOt3T58tYAh+KRU2YDxxu6uCX6BHEk9YXkyXWuVj3cFv1J0VdMsUb/wTgF/euF2UBp7GV8TsznJGHd/tBUEGI5Lvb/0izy/Wo9mIqnrUv5YVCiWXVFf2hKMcSXM+1VabR0/RwDIUwcmIG+xvSmytRmIK3Vs4JrjgO0Pbv/SapB
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x18-20020a19f612000000b00511498107b8sm22444lfe.65.2024.02.08.07.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:01:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:01:08 +0200
Subject: [PATCH v4 1/4] drm/msm/mdss: generate MDSS data for MDP5 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd-migrate-mdp5-v4-1-945d08ef3fa8@linaro.org>
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
In-Reply-To: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wQrgj28WhABziCXeR2PKfGgoe/NHpSXiGLfXEY2pn/0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxOy1CdGwLI2jETK9ta5GNVMwZIFrQNtb/S0MN
 93oDS77A2CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTstQAKCRCLPIo+Aiko
 1WUjB/9cN0J33e4f7b+V8sC0ssXT1eF1ytulLSvWSvYkddvySGtXG/ck06ixKue7dP4BJjwnY1g
 ldINIUbCjJs3mOGhJRNDKkWdc62itbQ+D1cH92OBp7dGfoCP3+VQ9/78mV0pIEM9aHHN9hluoRV
 dO21fMcf96nM9dcqs6Hdj1EdKdd8oh3vagVjiINzxikl2THxFc5aKxzuRN9Fo+N1i+FFbr2wd9D
 Dm8y3ClXQdNhB/DEPx7KcDtwoGogz0idnNgGqc7Ucx1F8j5Hmw4QJGyJhyIRoZxPKUMqIneURFG
 flGm4ZfQw0BTKV4khUwcggfcgWyZbfy5x2sxs7LjLQKya5Dh
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

Older (mdp5) platforms do not use per-SoC compatible strings. Instead
they use a single compat entry 'qcom,mdss'. To facilitate migrating
these platforms to the DPU driver provide a way to generate the MDSS /
UBWC data at runtime, when the DPU driver asks for it.

It is not possible to generate this data structure at the probe time,
since some platforms might not have MDP_CLK enabled, which makes reading
HW_REV register useless and prone to possible crashes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 35423d10aafa..65657230bbff 100644
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
+#define MDSS_HW_MSM8953		0x1010
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
+	    hw_rev == MDSS_HW_MSM8953 ||
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

