Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2192838C6DE
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A35F6E50D;
	Fri, 21 May 2021 12:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA756E500;
 Fri, 21 May 2021 12:50:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14B946128A;
 Fri, 21 May 2021 12:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621601408;
 bh=evW5pHUN/T4rGcgEYxzNl0VVIeE5qNWtjDjSxJvpPkQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=swpkH1OlMp8m3dC3Op2knzSP+7dNpwV+GLpnTqKTP6Rv9cOr4ZuDrQg1RerHShygz
 GWLDF2inM+t6mnDbG2UCW7r6z/TwN1q7YgMWTOaDoVRGulMbiBXG8zG4/5b91XLUTP
 rDwf1hQ18aLr1h+gRkhRnfQT8Lqeyrv1Hyxyq9Mt1y1Imwn3MLM8ZTGY/hqHpwX4uB
 TeSq+8VtHdoDVNt4FL7T80PylE2tHdIJvqLYj8bApZz92UPSMmy3eukhXnaatygXaK
 Jd9UQgB4pJ7MrivQRrAButxeohwGiHLp1cdP/JL73buJlKi0PQaKtPGYBKrDtL3LMS
 uVKjiCutUDDQg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH 02/13] dt-bindings: msm/dsi: Document Display Stream
 Compression (DSC) parameters
Date: Fri, 21 May 2021 18:19:31 +0530
Message-Id: <20210521124946.3617862-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSC enables streams to be compressed before we send to panel. This
requires DSC enabled encoder and a panel to be present. So we add this
information in board DTS and find if DSC can be enabled and the
parameters required to configure DSC are added to binding document along
with example

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index b9a64d3ff184..83d2fb92267e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -48,6 +48,13 @@ Optional properties:
 - pinctrl-n: the "sleep" pinctrl state
 - ports: contains DSI controller input and output ports as children, each
   containing one endpoint subnode.
+- qcom,mdss-dsc-enabled: Display Stream Compression (DSC) is enabled
+- qcom,mdss-slice-height: DSC slice height in pixels
+- qcom,mdss-slice-width: DSC slice width in pixels
+- qcom,mdss-slice-per-pkt: DSC slices per packet
+- qcom,mdss-bit-per-component: DSC bits per component
+- qcom,mdss-bit-per-pixel: DSC bits per pixel
+- qcom,mdss-block-prediction-enable: Block prediction mode of DSC enabled
 
   DSI Endpoint properties:
   - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
@@ -188,6 +195,14 @@ Example:
 		qcom,master-dsi;
 		qcom,sync-dual-dsi;
 
+		qcom,mdss-dsc-enabled;
+		qcom,mdss-slice-height = <16>;
+		qcom,mdss-slice-width = <540>;
+		qcom,mdss-slice-per-pkt = <1>;
+		qcom,mdss-bit-per-component = <8>;
+		qcom,mdss-bit-per-pixel = <8>;
+		qcom,mdss-block-prediction-enable;
+
 		qcom,mdss-mdp-transfer-time-us = <12000>;
 
 		pinctrl-names = "default", "sleep";
-- 
2.26.3

