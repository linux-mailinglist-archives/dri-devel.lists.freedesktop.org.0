Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431827B1A59
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9CE10E616;
	Thu, 28 Sep 2023 11:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FDA10E613
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:16:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50336768615so21756267e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695899802; x=1696504602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enSUc5wVEHF7eZy9e0DAWbElAzfosEhYHkkqQR9evEU=;
 b=G1+lLGRlJzK4CwXaN4/Yf4BMG5KzEiOkMXaEYRniEKARdcPkJECFWvwPkrhp54U0pn
 tVE2DmVGzQ2tukQffhHzESsqdY8NDCxh9Y7hePiCXQoulUwdioRfBvvMJnSUbN+5NHOq
 VcA6oDBXNRRfD/xlcILp/sK2T873nMMe0GBqZLL8Vp1ekdHxaHj3b9DkFmhdl0QDrETx
 OWOfgiBIpIvzt2yl7VVyfox+lumsb0ECnkdtDxAO6p8KPy1Q6NM5jORUUbBenktyNEwy
 hD93ismZ6z61/C6ih61Qp+IcDuV1WqiufVM0g4L6C/84ShTNo4Lj9cmeykj8C5G6joI8
 +5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695899802; x=1696504602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=enSUc5wVEHF7eZy9e0DAWbElAzfosEhYHkkqQR9evEU=;
 b=DCOA7DWJ3Vk+P9OuNAWLNbaaZUosVa6yVDBavEUUNcyLKYXa9rm5MYfgZFzdLMjuLS
 X9z5TZSsxdG3aFn2mAnshZ+/ga/y9bjiEBLCIBFCpIZBVkMerjQBO0HWDeC8r0bWKOjO
 wsixfsXZpWSCqA0aJQb1qk+JS2W2bW6KinPyjY0anyMSmPQmylb0jzi78BtEE1CHYHHZ
 JBK7nZCh3EpJiA493VwJVYafis7EiKVkr4scqrV43xF+sxvlqoHFF5zzhFbotxc4Gxd4
 HvVnqwPwnHS+9RgUjoWNJ74/YSegaWRZLsfhKGV5Ojr8qOu5jUV0KjT3uSmrPD7J8fAr
 35dg==
X-Gm-Message-State: AOJu0Yy/hVIHg0lqVeXB7vNvAeOMUb9iWN9Mauencq6s0zeHqAcQYcj3
 4X/EI71JPqm5ApxdM2Uul9163Q==
X-Google-Smtp-Source: AGHT+IGwCeckW7pWu4XX3/cIFXJn7uNwvwln041/BMgKyIZsfbVBTMcODI67KjHZ8k4db5jC4PvYXA==
X-Received: by 2002:a05:6512:2148:b0:500:9bbf:da17 with SMTP id
 s8-20020a056512214800b005009bbfda17mr689312lfr.51.1695899802188; 
 Thu, 28 Sep 2023 04:16:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:16:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v3 13/15] drm/msm/hdmi: pair msm_hdmi_phy_powerup with
 msm_hdmi_phy_powerdown
Date: Thu, 28 Sep 2023 14:16:27 +0300
Message-Id: <20230928111630.1217419-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to converting MSM HDMI driver to use PHY framework, which
requires phy_power_on() calls to be paired with phy_power_off(), add a
conditional call to msm_hdmi_phy_powerdown() before the call to
msm_hdmi_phy_powerup().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 2d405da63bd0..46ae7ef9bc98 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -42,6 +42,7 @@ struct hdmi {
 
 	/* video state: */
 	bool power_on;
+	bool phy_power_on;
 	unsigned long int pixclock;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index bb10b35194ff..1bbd76e595af 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -148,7 +148,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_audio_update(hdmi);
 	}
 
+	if (hdmi->phy_power_on)
+		msm_hdmi_phy_powerdown(phy);
+
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
+	hdmi->phy_power_on = true;
 
 	msm_hdmi_set_mode(hdmi, true);
 
@@ -170,6 +174,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	msm_hdmi_set_mode(hdmi, false);
 
 	msm_hdmi_phy_powerdown(phy);
+	hdmi->phy_power_on = false;
 
 	if (hdmi->power_on) {
 		power_off(bridge);
-- 
2.39.2

