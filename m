Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBFA43054C
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 00:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA236E8F0;
	Sat, 16 Oct 2021 22:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6003D6E8F6
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 22:17:02 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so305803ote.8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3Y7Ha8qdHXB57ScuBGUf5G032rtC1aky5TYdKeHYlc=;
 b=SMPbkoRBB/lcOrzbs9uZ+F6Va/xvb4NkR7QxSekAe6cWEZj23J6RoSS072CbhPFDxP
 9CNlSwRIyMQi/vCboyvGcqBGiC3bBwNUsau1uVcOYQODu1okGWl+pWWYUXDPJtR367St
 LfZFCS6zMV+JAtOdlsVr9sWK4ePwJuC6nSW+reiwChzB7qQvx+KTC32b51nG7qqpFSG2
 19S5HtRqL9qAa0AYpXlHHAe8fggbFMimJWUSt2gMi8tgOd73+qv3q33/wcYAUCBmk5+7
 tfy3NMASW2VeveqXztb3/eM5CkThQBn0jP4PJbY6IkRpe7zNfNdJIrFYyW9qaJI8vuQU
 whqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3Y7Ha8qdHXB57ScuBGUf5G032rtC1aky5TYdKeHYlc=;
 b=wiW/OpcGY7K8TIwNR6aDBKKUzzzoHx8S7qDPhxUu4q920hp7RCLOx42ugRlrXg46fX
 ahN8yDdPeE3Awg15PIL+lpE3Zbb17ro4pa30ptspv6rX/nC0ki0VJSYUg5JM7XPjFcl5
 PIEkmVnUWiXG9SDrrfjzkRZ14BKnhgEXyNSXCTaEi/uxYHP4timPk9pLt6AijndiLeAI
 NeM33g618lye7NCOqYCT8kVgue1yoSsyBCS71MYAbRdJ6UzgzAbCcF4boAiIe5pPap/j
 H5f5yw6xL7ew0LFTlc9+DnFiWsvpCkjY8Yz6+ZFs0htTrb+ZL3AKvTOEiAJPR2w9Vkdp
 D1Jg==
X-Gm-Message-State: AOAM5332iDxqo8cxr9qBx1Pp0PJyn9VWBoBcJHMjFq+YRMFPt5T4QAg8
 UfXEHcs2RdQPGSgefDgCzqqXQA==
X-Google-Smtp-Source: ABdhPJzbwAZ/58KHc9+pbm7OqifA8z0XA/zCUc73KhUCSVuimzfE5a7HsQuELxSbBB65p3p+C2mrBA==
X-Received: by 2002:a9d:70c4:: with SMTP id w4mr2703584otj.170.1634422621620; 
 Sat, 16 Oct 2021 15:17:01 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 d15sm1747058oic.32.2021.10.16.15.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 15:17:01 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/7] drm/msm/dp: Add sc8180x DP controllers
Date: Sat, 16 Oct 2021 15:18:43 -0700
Message-Id: <20211016221843.2167329-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Link: https://lore.kernel.org/linux-arm-msm/20210725042436.3967173-7-bjorn.andersson@linaro.org/
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Use the MSM_DP_CONTROLLER_n enums
- const the msm_dp_desc array

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 +++---
 drivers/gpu/drm/msm/dp/dp_display.c            | 11 +++++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 47d5d71eb5d3..0ac6a79e8af9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -918,13 +918,13 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 };
 
 static const struct dpu_intf_cfg sc8180x_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
 	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
 	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
 	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
-	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
-	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 2, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
+	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
+	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
 };
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d3c9d7273354..70dcd4e6d466 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -135,8 +135,19 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_descs = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.descs = (const struct msm_dp_desc[]) {
+		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+	},
+	.num_descs = 3,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
 	{}
 };
 
-- 
2.29.2

