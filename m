Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B0736AFA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ACB10E2CA;
	Tue, 20 Jun 2023 11:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED3110E17F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:30:05 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f841b7a697so5575492e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 04:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687260603; x=1689852603;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mvj4Ws5lfpRkepZDTp/39wphy6EdJ013fn+mBz94DMg=;
 b=MbGQYduFNJMlpq71oNbfIylCEuMuMKZ2l0XzU8mFm+OFEGcP3WDjjh67j0j1jC87C8
 pYTHIQ/yvYrTj2pV4dMUjTJ6UTZXnbiWSQ8Bcqd5BEDSrCkiXMSYAGlCH9JFLDwe2Q7Y
 mFCRwPSLgLb5cvi1gzHZgJ+N4txzBsG/JA5MZbQ+3z6ZLyd9KK3U4BOT+yMswRus/yR3
 rsqZMTMW3mA+7fLlIRTcYW+jhhL8ZNAl9/zAZDWhWD7YgcIAm5rWZ+XC1P5AZvvYcyyU
 2uIaTnnDWx8PtkZFzMshkywp4fa254N2NrXrHNJNMC5bCB9I0vwDSuLrBYweWNSdDVKl
 fmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687260603; x=1689852603;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvj4Ws5lfpRkepZDTp/39wphy6EdJ013fn+mBz94DMg=;
 b=AW2J6CGaVJT2YnwOuxUSZPKqn4pjt9jHS3h7imv81PiAWmsegapbfzZpgIbOUQ5LDl
 4ubwqRpPYQjov7EO3/q0CT2+Jp1EbTn36cGHjTg++9urp+Puo8KNfYbMX8mDYVkFwcnW
 bJWVA5cVGUKWWOdj7pHBpVT3Tml2ROc1l3iRavBab7q+F5tQcCWmfxN1N8ev8poJFwMA
 RWoje2KPMMQArhXtL+Daoqna77/F04RBW9uZOFW1coEQpo0lrFOhIfd+9l9OOtVg4Oaf
 6jMnpMCmHOFPW6AW/b+Jv+NbDfQ3I4LG2QT6DZubJ/zsE8nUiekyY68dCmREMZ0dQ/zU
 w2RA==
X-Gm-Message-State: AC+VfDwT1A59Wm5/vZ/DG4lJGr8njabLAW0mlVSizUaf2TnAYMbf2NIm
 wUBowJKSgiuQDLlNiL2wBAGdyA==
X-Google-Smtp-Source: ACHHUZ6ED/zWchOlt8YalqHTrP43Ype8jf/mpfCxQFHrsHIEf3K8XmAOEKaItoY4Q9L1P78PA+TQUA==
X-Received: by 2002:a05:6512:b0e:b0:4f8:54f3:a6c0 with SMTP id
 w14-20020a0565120b0e00b004f854f3a6c0mr7225414lfu.11.1687260603553; 
 Tue, 20 Jun 2023 04:30:03 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004eed8de597csm335709lft.32.2023.06.20.04.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:30:03 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:29:58 +0200
Subject: [PATCH 1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to prevent
 refcnt leaks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-dsiphy_rpm-v1-1-446a7fd0ce43@linaro.org>
References: <20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687260601; l=756;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=p+WuOmdprSDjusI/rvtFLxmtLwQxfj48jFs663vX5YQ=;
 b=FXvuUQg/5YWokhed8hsEyalTU7MwztoQeLbEK29H7mFag8FeR7dCHiJpMDyZtqenlstrvvDDB
 So/552dSW3VCVmtxh0gCXhw3vbmoCQ+QGVZWY9PrHc42lkTyes+CkvM
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helper has been introduced to avoid programmer errors when using
pm_runtime_get, use it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 9d5795c58a98..0a8e1dd4509e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -516,7 +516,7 @@ static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int ret;
 
-	pm_runtime_get_sync(dev);
+	pm_runtime_resume_and_get(dev);
 
 	ret = clk_prepare_enable(phy->ahb_clk);
 	if (ret) {

-- 
2.41.0

