Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A20AB70DC32
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 14:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C288510E44A;
	Tue, 23 May 2023 12:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1715110E440
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:15:10 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f4ba3e0b98so1061614e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844108; x=1687436108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enSUc5wVEHF7eZy9e0DAWbElAzfosEhYHkkqQR9evEU=;
 b=cLSxKqmrFivha60kjqdkAq/2GXt9zXw+KGWMkRMtnGfSoqc+rEbGIY9SPFp3raR+tL
 Fvve4+1DQYi2PZ2Uk+JYU1ZJHEpz7EtzCFXCqQ4nutMAoROslrRjO/0UMoGpS3F3PoLF
 b66oDK+O3wB+Kad+4bZv7mmK5nHfbLakmzppjNLiji1FtxYNYvhmsFa41D5FrKjbmdOp
 rGkgZ1zXw6baayCE5w1FciCQFkd3PAedqX2dE/XVUQBO6CdcCCjqBs+KpHQtjGAiY/44
 fX8XjppzEo8N+XyYR0YxjjNW/xd/cvw3Ha1RuV9t1+FNXekSLqTGUystJEhzUatiIUt+
 HICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844108; x=1687436108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=enSUc5wVEHF7eZy9e0DAWbElAzfosEhYHkkqQR9evEU=;
 b=hjRAOMeOCOPZ0AQBSbxe5saVEXuhPT7YsdEgozc8KEYCj7DzGJYiIrDsp8onhRqaef
 tFzk0k6ORxhEPpPn2k9mGX6op3ZzWnxzkCxANZrFrEmuvCXwvnj68ArA8osrbpWb7FYf
 KedzO5Qo7ktY89leWck5WRB1mvyZgma/tTOokxZwmvVm01tWl+cYz9T5fp3UCPz6rjh2
 lzrh41UDQ2sLDc5OViMI5N0EmgNghuTdCtd93/gsHzVa4lVkOi2rOeUAA6MxJ50xprhR
 +n1Jhfc5o4kJkwgaSulH3q520nKpmDxyZ3R1Znp6iezJOt0nxF9+LsIadDnQrocmHG6O
 rJTw==
X-Gm-Message-State: AC+VfDxlZhyYDflQDAYayTD91pI0+V2wszxB1UZgho8LU5MLZ9eSunII
 CzX6gWp31bCtUnUxeFlu4WzOLQ==
X-Google-Smtp-Source: ACHHUZ5WxYFiA0x3xgvZXvUWQdi/r/0i5DuVqgDFMuE7nU4AygQeYTf069U5/4/emwtjx39IRyOE/A==
X-Received: by 2002:a19:7003:0:b0:4f3:a99f:1ea3 with SMTP id
 h3-20020a197003000000b004f3a99f1ea3mr4008960lfc.32.1684844108297; 
 Tue, 23 May 2023 05:15:08 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:15:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 13/15] drm/msm/hdmi: pair msm_hdmi_phy_powerup with
 msm_hdmi_phy_powerdown
Date: Tue, 23 May 2023 15:14:52 +0300
Message-Id: <20230523121454.3460634-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
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

