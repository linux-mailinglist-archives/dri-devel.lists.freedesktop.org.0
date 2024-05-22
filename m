Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1088CBF84
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4366110F4C0;
	Wed, 22 May 2024 10:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nQM0qfIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E251D10F4BB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:03 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5238fe0cfc9so791763e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375062; x=1716979862; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tsC/gRsvFclAEANavYSBlEUjjyUnanQ9kBr3o4SWpJA=;
 b=nQM0qfIHpjPKRTH2B8XTDi+QwtbBKuDVtanzXsDWw8aDggYHkwrj5UrHQ2bRg8RBOh
 RGa8LQXYS8sUO+QWd0mk0owMGmqJMHZ1Q3t/QIcf4hfInTY21INgn/KseeSr9HDZAUE4
 /Uloyi0g41sIrVN3hFOlfQFSUGm61QXueLB5WtDKcYk/bBljMp7LqXPZKVzhOhzrddUn
 BuftT67rnhM1k+2372AXgrUGHOKUX5yXiMK1h1DQ6s4A8gKAOFcW/oQ+3n68oqHAbdaZ
 gyVBWU44k8BkT8gbJ+FH8LAHxwjrhCgkQzhZkco8P2ogrWkr11iMoAPNeH6MpABYdLgn
 xnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375062; x=1716979862;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tsC/gRsvFclAEANavYSBlEUjjyUnanQ9kBr3o4SWpJA=;
 b=JZo3/a027PPd9VorRhrFdG+A3qngpDukZIyVpb20o7RPIYjpheHHl/r792wK5/Tf9c
 DykMZGfZxN9GqjS8js7nR0U+R6YRKNtG0ZFbN8dWsAjSL53A/VrPqrR4TIOugJqEYt+L
 gYKAOhvFj4XwEFDY2RvIgDanT+/pUleUQCoYUTXbleHcI/3eflsuxUk0Rxp3NwzoZJJl
 wWjAsaRP99HIKSX/8UO0H08LrdJW29fB7hzoc0+D5+vmaEGqHHl0bLhTOomiSeV/JMeP
 8BXKumzYwlISVhNKRSXbEUrUYhG0ciwd6xdMy0nSx+OmeKnIxb7hdCcodSn7YBnNdSsr
 OOxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL6geD6fOYBOMhpbqAFBc/wsj2HIao/uUWdSy7ymMnXUC/TC3pHhgw0WkXWPDhXz7geH4SvweRWQwc/ZP5hvD/Un/1dSbWmwyHhbUlzNCE
X-Gm-Message-State: AOJu0YzGd+Yh3xwiLTTOxdGGXPPFliMcJT0mQgRNk8j0orgMpETG0Ek+
 av+2wbF15aHMTzePToYjNOSXxxmIWbLHjcFvGJxGnwGDm7dJPgbsJLHZWpeT1Tk=
X-Google-Smtp-Source: AGHT+IFKBWmoLwb0ELld20WRYh6MP860S9/NAr7J2q43NCXsCE00e4g0SyRTBt1FvFJipTvpKF/64A==
X-Received: by 2002:ac2:46ca:0:b0:51c:590f:4305 with SMTP id
 2adb3069b0e04-5269b2e6679mr529373e87.8.1716375062015; 
 Wed, 22 May 2024 03:51:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:57 +0300
Subject: [PATCH v2 05/14] drm/msm/hdmi: drop clock frequency assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-5-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=K1KI+nZVasxZlSMfFS8U9hLPw6QPc6PsVGWsUOlWg9o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PVwLPggWZS7nDhhkL19OkYk1UVB6HyzzLX
 mh6kxylRy2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1T3zB/9Tc0eNy+q8LiRXQPBs5tBj5FD0fCU6cAnP2CgFPzBGWPNFSlTgvY0wUYAIhkX8udzpSbe
 mhSARwL1p/kUkAYWEVinpmOOjzyfowqVQqiXtzGJgeCpzcLxg9YgdAefRuO5X4FMjOQIydeexxK
 4rFnK1ZBFuYeflTip1RBDLYsJfVb+Mt1XfJbbu7SRpyLkI8jEcESSPvtimktULPTKI2EYn3yrFE
 2u3lrsW6FWkc2GGo3v+uhClA+Q9YScQllpF2B+Z5ASitZziAnHHhXXXGZEN49f/AwmKHdT31gRc
 qJdqXDzQTGkSf7y4B0qFRGA5bslOc2ncIzYVceNhmOuRAAG7
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
index 681265e29aa0..c14e009f38b1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -236,12 +236,10 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 
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
index abdbe4779cf9..c0d60ed23b75 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -96,7 +96,6 @@ struct hdmi_platform_config {
 
 	/* clks that need to be on for hpd: */
 	const char **hpd_clk_names;
-	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 9ce0ffa35417..7ae69b14e953 100644
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

