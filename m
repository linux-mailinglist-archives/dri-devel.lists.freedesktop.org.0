Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C37F7443A7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4839110E505;
	Fri, 30 Jun 2023 20:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8075B10E4F5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:30 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so3717875e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158529; x=1690750529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wz+vONKB6c4xcTXdkry5A/Jy1Sh6oboOCEj2aaF/9ZI=;
 b=WcPMd0/hFStdqQhZiQtrNWawfWdS6922iMiCnfN7oMLB+bv5rcMAPoEvhIXOzCsyCw
 x9ZAB/ZJXmkK2g441cJuBhB62nR1CiBGJOKyMN5IbyN5QZ7KyjIck8qmrL2q4BlhHflE
 4YGo5cvLug/Svk+Q4lNpLz2RcKmOFF7kW/tQ4lm1sl1fPkCw1OE7kz4W1VQh5rbvnrDY
 ylmBwPd7xJZ3R+rctsLzQykTlxlaxQ8lc1mWgh2DmlufhKG32V8D7+b4rISQrbRE3/OI
 WC/4IqtthJvkXvn3GuYIcOG3/P+WJduyay18jvVrfJ2aiwuovLcBkOSaZp4D0F2dwkWW
 hFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158529; x=1690750529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wz+vONKB6c4xcTXdkry5A/Jy1Sh6oboOCEj2aaF/9ZI=;
 b=EwRdgs18jTX4xtfdsh21w//k+eELy5a4uFIhTkaHIN4MAZ04xkRdHvDJE+tYFHAd7y
 erJOCoCFMd/7xz65wCIEBQd9zZIF5xgMgKLsAAW4+NplVn5kl81VfgJg1WGFhtayW+P9
 gtO/QVoq6/WIYcsI3D6HpqpTC34PPDjuN2TBDf9IzRNa0fyn4eqoDo4ad46kEB0EzRXW
 YK/PZbmGLi2gvo91/1KMQuZOKdasmXtv+a+vrl/oNTkuuh5m8SGfRMoUCgtvPvIA5nR3
 gKJ8THeG8ahh/M+8gsUzjV/lon3P7EvNI9nUQERQm4LYlHKKD17aKbjMVUqExMKwYKu3
 U+tg==
X-Gm-Message-State: ABy/qLbyY0V7wYnm8gn5M5wKBxOdK3RiciianDvICVCz7nHobUYC6SEU
 li6ySVSwbYw4o7LtTBkgnrOSGA==
X-Google-Smtp-Source: APBJJlGCIEMLtwLyuJz+wTp2TF7DnBJT48fnyWFLi3foGEiAUwMtIQrDcEuSQPOJ06nn7Zo0B2QFnw==
X-Received: by 2002:a05:6512:2110:b0:4f8:5717:e421 with SMTP id
 q16-20020a056512211000b004f85717e421mr2803973lfr.40.1688158528876; 
 Fri, 30 Jun 2023 13:55:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 06/15] drm/msm/hdmi: drop clock frequency assignment
Date: Fri, 30 Jun 2023 23:55:14 +0300
Message-Id: <20230630205523.76823-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
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

The only clock which has frequency being set through hpd_freqs is the
"core" aka MDSS_HDMI_CLK clock. It always has the specified frequency,
so we can drop corresponding clk_set_rate() call together with the
hpd_freq infrastructure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 2 --
 drivers/gpu/drm/msm/hdmi/hdmi.h     | 1 -
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 9 ---------
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index a2780aba6d3c..e05bfc2ab64c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -249,12 +249,10 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 2d405da63bd0..4e32281296ca 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -96,7 +96,6 @@ struct hdmi_platform_config {
 
 	/* clks that need to be on for hpd: */
 	const char **hpd_clk_names;
-	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index bfa827b47989..6b017a07b57f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -68,15 +68,6 @@ static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
 
 	if (enable) {
 		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			if (config->hpd_freq && config->hpd_freq[i]) {
-				ret = clk_set_rate(hdmi->hpd_clks[i],
-						   config->hpd_freq[i]);
-				if (ret)
-					dev_warn(dev,
-						 "failed to set clk %s (%d)\n",
-						 config->hpd_clk_names[i], ret);
-			}
-
 			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
 			if (ret) {
 				DRM_DEV_ERROR(dev,
-- 
2.39.2

