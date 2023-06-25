Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B1F73D09D
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 13:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43AE10E1B5;
	Sun, 25 Jun 2023 11:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397C410E180
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 11:42:36 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b698dd515dso8703481fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687693354; x=1690285354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enSUc5wVEHF7eZy9e0DAWbElAzfosEhYHkkqQR9evEU=;
 b=GpwaJlGXYuG3Z4vYv+wgR1y2wSg6nEIFTwhWxzjR8tWukr9O16cDD9VF+YnnlCjaJb
 9P+vI/dv1+JB09f0n/C9kVydtIyLLSbVaC7drfvLGjsIrjRdsjgnY9y+OQxAf4jMayEn
 hhGSh+40bZWK785rOVrHPcEVEac9RpB2HOCfce4XDRh8b5mBgF7ee0u5PkJMxYcLcCTu
 afZ/9K18wwJFf6mdgQTTlTxs3inKzkdEK3QIv8Sren5kiPdEDhQk5vqYTDtlde2xYLH5
 QcoGxFiQwaEn/muwpiiGzEDnREKrol504vdRN3gMtj0DVLlYhdcq365Gif76dx6QF8zr
 9D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687693354; x=1690285354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=enSUc5wVEHF7eZy9e0DAWbElAzfosEhYHkkqQR9evEU=;
 b=KS1KbeEiDBfLb3mascxSbanqVpRyEcLhMgcJosObCoRrOtH6EX7gojs+aJvxtputtx
 kNkwYL2fSDiyIh7lQ2tLyHnRNme4di3aq7kxCxYIfisv622Xb+4FmRgHfvSHvVimuPgf
 cCcBVl+1zC3QqZKy0Sh5GDXp/AQWkVyP4fQTFPW7B/f3DhsxY/SuGTTJWewlfL0kRfbR
 CmQCfzZUPFjqo5CVpd5jNIKE79S2zGCXHjG61Oi//cH+8Y6BqjQE1a7gbzfOTzqwYYcg
 cYb2RliUNxpPNFjGfla+czYm2vMMnhV9Pv3gvT7f7EgWZSZLCoz04tvVRrsssvTnwZAh
 K3fQ==
X-Gm-Message-State: AC+VfDzkDtSVNXoGndWrn78hEkRWyZG7J9Ub1/tjlN+JsJddzSi6thY1
 hw76gFNQnf9qv08ToThIu/2Mgg==
X-Google-Smtp-Source: ACHHUZ7u+Sgj815uM7U4pf8to+2Ka6ErMJBQSl4tNszqEw9fDmnsKqiRTL0HxBnsCbazmmHgMzIq7g==
X-Received: by 2002:a05:6512:3d8e:b0:4fb:73d1:58e5 with SMTP id
 k14-20020a0565123d8e00b004fb73d158e5mr253539lfv.53.1687693354615; 
 Sun, 25 Jun 2023 04:42:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 04:42:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v2 13/15] drm/msm/hdmi: pair msm_hdmi_phy_powerup with
 msm_hdmi_phy_powerdown
Date: Sun, 25 Jun 2023 14:42:20 +0300
Message-Id: <20230625114222.96689-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
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

