Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9EA44C18
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 21:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CCB10E07E;
	Tue, 25 Feb 2025 20:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rxKxVRfA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAB410E07E;
 Tue, 25 Feb 2025 20:12:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE15C611FC;
 Tue, 25 Feb 2025 20:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560F2C4CEDD;
 Tue, 25 Feb 2025 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740514358;
 bh=7S6m5qj19j2HH2oirUAYDNOi+Wj6A6WK3mHdMWXnPOs=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=rxKxVRfA6iOtsiT3k9Ku1jxKYLor7MNqxEi3U5vaGizZg067EjMB4y61uJojIRlAW
 UAIhecahjb9vXBcGth4vfPWKPTya25Mjx3qtTHseFZ+xs7VL4MXURYQwx104ctQO0v
 qpRWPveKcx5tNUI1QpEfSPtYA6RzYJjncIgztOLC75Btg0Uy/mgWku7SCz97COSXUZ
 jGwQu3HeWX0lRJj1LYfVgUYCYGe9Mrfn71KO9BHVaXIM8cVeea1r5qKLTATF9Mtk/e
 Ktk6uzEPhXiA9uXpWP1Z/6HCrdqNsY7hASZRortJTgG3AtQgYC7pdUjAaV0h2qtr81
 xH/ElgTCWgXkA==
Date: Tue, 25 Feb 2025 14:12:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 freedreno@lists.freedesktop.org, neil.armstrong@linaro.org, sean@poorly.run, 
 devicetree@vger.kernel.org, robdclark@gmail.com, andersson@kernel.org, 
 dmitry.baryshkov@linaro.org, conor+dt@kernel.org, rfoss@kernel.org, 
 quic_jesszhan@quicinc.com, quic_vproddut@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 marijn.suijten@somainline.org, Laurent.pinchart@ideasonboard.com, 
 andrzej.hajda@intel.com, jonas@kwiboo.se, konradybcio@kernel.org, 
 robh+dt@kernel.org
To: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
Message-Id: <174051415386.2971902.3360853171203974622.robh@kernel.org>
Subject: Re: [PATCH 00/11] Add DSI display support for SA8775P target
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


On Tue, 25 Feb 2025 17:48:13 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 
> Ayushi Makhija (11):
>   dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
>   dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
>   dt-bindings: display: msm: document DSI controller and phy on SA8775P
>   drm/msm/dsi: add DSI PHY configuration on SA8775P
>   drm/msm/dsi: add DSI support for SA8775P
>   arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
>   arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes
>   arm64: dts: qcom: sa8775p-ride: enable Display serial interface
>   drm/bridge: anx7625: enable HPD interrupts
>   drm/bridge: anx7625: update bridge_ops and sink detect logic
>   drm/bridge: anx7625: change the gpiod_set_value API
> 
>  .../display/msm/dsi-controller-main.yaml      |   1 +
>  .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 170 +++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 198 +++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 183 +++++++++++++++-
>  drivers/gpu/drm/bridge/analogix/anx7625.c     |  24 ++-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  18 ++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  27 +++
>  11 files changed, 614 insertions(+), 12 deletions(-)
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250225121824.3869719-1-quic_amakhija@quicinc.com:

arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: gpio@74: 'gpio10_cfg', 'gpio11_cfg', 'gpio2_cfg', 'gpio3_cfg' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: anx7625@58: 'vdd10-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: anx7625@58: 'vdd18-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: anx7625@58: 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: anx7625@58: 'vdd10-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: anx7625@58: 'vdd18-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: anx7625@58: 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: gpio@74: 'gpio10_cfg', 'gpio11_cfg', 'gpio2_cfg', 'gpio3_cfg' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: anx7625@58: 'vdd10-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: anx7625@58: 'vdd18-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: anx7625@58: 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: anx7625@58: 'vdd10-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: anx7625@58: 'vdd18-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: anx7625@58: 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: gpio@74: 'gpio10_cfg', 'gpio11_cfg', 'gpio2_cfg', 'gpio3_cfg' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: anx7625@58: 'vdd10-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: anx7625@58: 'vdd18-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: anx7625@58: 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: anx7625@58: 'vdd10-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: anx7625@58: 'vdd18-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: anx7625@58: 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: gpio@74: 'gpio10_cfg', 'gpio11_cfg', 'gpio2_cfg', 'gpio3_cfg' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: anx7625@58: 'vdd10-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: anx7625@58: 'vdd18-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: anx7625@58: 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: anx7625@58: 'vdd10-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: anx7625@58: 'vdd18-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: anx7625@58: 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#





