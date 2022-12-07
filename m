Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB73764510B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 02:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F2E10E16E;
	Wed,  7 Dec 2022 01:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE2410E165
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 01:22:38 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h10so19214741ljk.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 17:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JzVHcmxorROJCIoZd11bHlIHsRKO6twZzQN8g754tbQ=;
 b=rppgqtvroVysk12yUykyeXuujps8u2NLR36dj0h3BDjwc8N3JRjDZkKUomqO8M3jNU
 LCuZ7wIM42zsCvb3MvYYAPj2gI6feufVN8PxpsE21lKubOIFN1D96vNXGHcQdW7Rf0+9
 lIiZcLrGzSiBYzJazuiI10190k4aEjJSnWZqzRIZqFZkHHbST7WKJQtyVdAyLdbRbeuv
 enHzNhSQxNMfnADgMLCqfU2OEW7w6Ybqao+BcTsrypzVK6AwJzAyhUcQUpr3NiYUhoAn
 OzRVso4Nnj87QnCZcvAi6SO+ndj/c6oUgs8oTw4p8O4/JD+HAySp440FixJi0tCGwqy+
 tcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JzVHcmxorROJCIoZd11bHlIHsRKO6twZzQN8g754tbQ=;
 b=vIEyfRu2S8ECJbNNEPtO82oPfqIm1eJv9oOykn6K4qHdzmDM5MtfAeDralYYlz8D03
 V2pEXfhiL6wfQ9m2ojb27Ekf2y01XFvGRxaysqk0FEgvd/Q/N9La6PdkVU98m0XSUMhY
 L07F9sL0/r6Zbcbbxyzj/CczjdDCONC+4QTUDCZU2uK9en9fj+nMs2WAPEFXq80WtvDf
 TyRzYgiqeu5EDhQ+dmNPVrz4DDzUucJOoZ6XTdnQhjUfiQku3VKvRZFYT1Q04kAV4kTJ
 CNr4Z2dMCx5zojD67YwI4a1Zh6SBsaomHDjn3/LEbYqP4n2fic4AAivsek/68TtC3XNs
 Zukg==
X-Gm-Message-State: ANoB5plx9kX49gUR9wu+SsmMTnxWiVXsNTKL9AoJMIx9u0X//P0ZJyEw
 qQadW9bOqjXde8Yt5XPO7U8CVw==
X-Google-Smtp-Source: AA0mqf57pCYrgTBoXwcRKVwfNAqUrXTO2A1omPT38r8S092StXXU2pztaoqRusFXJyFXOuSMhWC1zw==
X-Received: by 2002:a2e:9155:0:b0:279:e6de:5c31 with SMTP id
 q21-20020a2e9155000000b00279e6de5c31mr5251648ljg.340.1670376156505; 
 Tue, 06 Dec 2022 17:22:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:22:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 05/11] drm/msm/dsi/phy: rework register setting for 7nm PHY
Date: Wed,  7 Dec 2022 03:22:25 +0200
Message-Id: <20221207012231.112059-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to adding the sm8350 and sm8450 PHYs support, rearrange
register values calculations in dsi_7nm_phy_enable(). This change bears
no functional changes itself, it is merely a preparation for the next
patch.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 9e7fa7d88ead..0b780f9d3d0a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -858,23 +858,34 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
 	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
 
+	if (phy->cphy_mode) {
+		vreg_ctrl_0 = 0x51;
+		vreg_ctrl_1 = 0x55;
+		glbl_pemph_ctrl_0 = 0x11;
+		lane_ctrl0 = 0x17;
+	} else {
+		vreg_ctrl_1 = 0x5c;
+		glbl_pemph_ctrl_0 = 0x00;
+		lane_ctrl0 = 0x1f;
+	}
+
 	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
-		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 		if (phy->cphy_mode) {
 			glbl_rescode_top_ctrl = 0x00;
 			glbl_rescode_bot_ctrl = 0x3c;
 		} else {
+			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
 			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
 		}
 		glbl_str_swi_cal_sel_ctrl = 0x00;
 		glbl_hstx_str_ctrl_0 = 0x88;
 	} else {
-		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
 		if (phy->cphy_mode) {
 			glbl_str_swi_cal_sel_ctrl = 0x03;
 			glbl_hstx_str_ctrl_0 = 0x66;
 		} else {
+			vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
 			glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
 			glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
 		}
@@ -882,17 +893,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		glbl_rescode_bot_ctrl = 0x3c;
 	}
 
-	if (phy->cphy_mode) {
-		vreg_ctrl_0 = 0x51;
-		vreg_ctrl_1 = 0x55;
-		glbl_pemph_ctrl_0 = 0x11;
-		lane_ctrl0 = 0x17;
-	} else {
-		vreg_ctrl_1 = 0x5c;
-		glbl_pemph_ctrl_0 = 0x00;
-		lane_ctrl0 = 0x1f;
-	}
-
 	/* de-assert digital and pll power down */
 	data = BIT(6) | BIT(5);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
-- 
2.35.1

