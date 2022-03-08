Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2174D1DEA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD0E10E61E;
	Tue,  8 Mar 2022 16:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8888B10E4CF;
 Tue,  8 Mar 2022 16:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646758520; x=1678294520;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=2xxX+RXGBrLvHJHOqC2plDl24DyYYOQdo/LiauSG4nw=;
 b=WS9/fbHbIcYvBt4Oc+WDt/VjZkoMEQEGKufzQ+3rW6UlZ3HJNTRZ7CjG
 eeyyFG5cifdeoylzuL54pQ/mcPBgzM6ENaA1WrAsgCPNdP+Pw1L0ofJRQ
 7nRnzHhA5qhI/QBvMcW82gz6fXZ00RvkOfv2nGFY7y7rjMFHINTwNkTc0 A=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 08 Mar 2022 08:55:20 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 08 Mar 2022 08:55:19 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 08 Mar 2022 22:25:03 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 5DE2453EA; Tue,  8 Mar 2022 22:25:02 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v5 2/5] arm64/dts/qcom/sc7180: remove assigned-clock-rate
 property for mdp clk
Date: Tue,  8 Mar 2022 22:24:57 +0530
Message-Id: <1646758500-3776-3-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel clock driver assumes that initial rate is the
max rate for that clock and was not allowing it to scale
beyond the assigned clock value.

Drop the assigned clock rate property and vote on the mdp clock as per
calculated value during the usecase.

Fixes: a3db7ad1af("arm64: dts: qcom: sc7180: add display dt nodes")
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index e1c46b8..eaab746 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2900,9 +2900,6 @@
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			clock-names = "iface", "ahb", "core";
 
-			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			assigned-clock-rates = <300000000>;
-
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
@@ -2932,12 +2929,10 @@
 					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
 				clock-names = "bus", "iface", "rot", "lut", "core",
 					      "vsync";
-				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
-						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
 						  <&dispcc DISP_CC_MDSS_ROT_CLK>,
 						  <&dispcc DISP_CC_MDSS_AHB_CLK>;
-				assigned-clock-rates = <300000000>,
-						       <19200000>,
+				assigned-clock-rates = <19200000>,
 						       <19200000>,
 						       <19200000>;
 				operating-points-v2 = <&mdp_opp_table>;
-- 
2.7.4

