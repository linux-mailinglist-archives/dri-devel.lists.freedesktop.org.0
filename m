Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA9D7404BD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 22:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAF510E339;
	Tue, 27 Jun 2023 20:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D126D10E322
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 20:14:39 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 632BF3F73D;
 Tue, 27 Jun 2023 22:14:37 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 27 Jun 2023 22:14:27 +0200
Subject: [PATCH v2 12/15] arm64: dts: qcom: sm6125: Switch fixed xo_board
 clock to RPM XO clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-sm6125-dpu-v2-12-03e430a2078c@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
In-Reply-To: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have a working RPM XO clock; no other driver except rpmcc should be
parenting directly to the fixed-factor xo_board clock nor should it be
reachable by that global name.  Remove the name to that effect, so that
every clock relation is explicitly defined in DTS.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 722dde560bec..edb03508dba3 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -22,7 +22,6 @@ xo_board: xo-board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
-			clock-output-names = "xo_board";
 		};
 
 		sleep_clk: sleep-clk {
@@ -306,6 +305,8 @@ rpm_requests: rpm-requests {
 			rpmcc: clock-controller {
 				compatible = "qcom,rpmcc-sm6125", "qcom,rpmcc";
 				#clock-cells = <1>;
+				clocks = <&xo_board>;
+				clock-names = "xo";
 			};
 
 			rpmpd: power-controller {
@@ -713,7 +714,7 @@ sdhc_1: mmc@4744000 {
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
 				 <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&xo_board>;
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
 			clock-names = "iface", "core", "xo";
 			iommus = <&apps_smmu 0x160 0x0>;
 
@@ -740,7 +741,7 @@ sdhc_2: mmc@4784000 {
 
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
 				 <&gcc GCC_SDCC2_APPS_CLK>,
-				 <&xo_board>;
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
 			clock-names = "iface", "core", "xo";
 			iommus = <&apps_smmu 0x180 0x0>;
 

-- 
2.41.0

