Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31E24CBA76
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 10:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36AE10EC22;
	Thu,  3 Mar 2022 09:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C4C10EB63;
 Thu,  3 Mar 2022 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646300421; x=1677836421;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Pr4DVx0cvSqlHPy0wZUMlhkJUgXtU7vy58WSqrm4jeM=;
 b=zHPTdxSnbB1vrI8DaWZiexVinVYXlr0H+mxs69TSxCD3XfwBg6MJtR9g
 2mkC32ffvJbTjDYvs8yLKdwEsHRMF3vyXolhErrpASezsImQc1mEfdnyy
 3DLBlo2jhzLDpLAmBlRxbzCWtHre8TTNPzLXXQKRZ5BFmwFSltGXN0fa2 4=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 03 Mar 2022 01:40:20 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 03 Mar 2022 01:40:19 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg01-blr.qualcomm.com with ESMTP; 03 Mar 2022 15:10:10 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 675833565; Thu,  3 Mar 2022 15:10:09 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
Date: Thu,  3 Mar 2022 15:10:01 +0530
Message-Id: <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
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

Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index fdaf303..2105eb7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3164,9 +3164,6 @@
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			clock-names = "iface", "bus", "nrt_bus", "core";
 
-			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			assigned-clock-rates = <460000000>;
-
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
@@ -3191,10 +3188,8 @@
 					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
 				clock-names = "iface", "bus", "core", "vsync";
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
-						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-				assigned-clock-rates = <460000000>,
-						       <19200000>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
 
 				operating-points-v2 = <&mdp_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
-- 
2.7.4

