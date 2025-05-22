Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C55AC13C4
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 20:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C032A10E7E8;
	Thu, 22 May 2025 18:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y3zM9713";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A7810E7B5;
 Thu, 22 May 2025 18:54:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE73362A4D;
 Thu, 22 May 2025 18:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A971FC4CEED;
 Thu, 22 May 2025 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747940046;
 bh=HgoC348FoN0KI8WyZOjPt5Nfl+InpZc7Ed/ze4ZkVgA=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=Y3zM9713PxaCEtdsvRfVrkb/IaGPCUb0Bjr0IvW2mII3n0rFy+JIH7JDAp5+P6tqa
 PBLoGfZIHEcYCEMWVzI6WXEUe8LZ2Ary9Q7ptIY4aWe1Kl3ygTFp/HK3dPb13Z40v4
 FdRAW8wXVsiKr9cHNzzVUkmSql5vDM2Ks6pdzRrhF8DhGCNO4ULovihEqhdRa0haW8
 RXsx7PE6aVsFfyUw49xEf5/2fxTPEkgtO4t8jUdufqKFQCGlcUE9DtdvrQ8pRe5z5v
 OF/1R0xuLxSGbdZG8Wr7fpXevQeHiANcj4l0KOYtAjmNJt55705X5zIvaF0ETIAEOQ
 cgJiO05uAiJfg==
Date: Thu, 22 May 2025 13:54:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: jernej.skrabec@gmail.com, rfoss@kernel.org, quic_jesszhan@quicinc.com, 
 Laurent.pinchart@ideasonboard.com, sean@poorly.run, robdclark@gmail.com, 
 andrzej.hajda@intel.com, quic_rajeevny@quicinc.com, 
 freedreno@lists.freedesktop.org, andersson@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org, 
 marijn.suijten@somainline.org, linux-kernel@vger.kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
 quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org, jonas@kwiboo.se, 
 quic_abhinavk@quicinc.com
To: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20250522051318.1783905-1-quic_amakhija@quicinc.com>
References: <20250522051318.1783905-1-quic_amakhija@quicinc.com>
Message-Id: <174793994107.3440338.11584207816526573442.robh@kernel.org>
Subject: Re: [PATCH v8 0/2] Add DSI display support for SA8775P target
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


On Thu, 22 May 2025 10:43:16 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 
> ---
> Changes in  v8: Fixed the review comments from Dmirty
>     - Renamed the opp table from dsi0_opp_table to mdss_dsi_opp_table in patch 1. [Dmitry]
>     - Referred the same mdss_dsi_opp_table opp table in mdss0_dsi1 node in patch 1. [Dmitry]
>     - Link to v7 : https://lore.kernel.org/all/20250513102611.1456868-1-amakhija@qti.qualcomm.com/
> 
> Changes in v7: Rebased and fixed the review comments from Dmitry
>     - Below four patches of v6 are merged. Removed them from this version.
>         - [08/11] drm/bridge: anx7625: enable HPD interrupts
>         - [09/11] drm/bridge: anx7625: fix drm_bridge ops flags to
>           support hot-plugging
>         - [10/11] drm/bridge: anx7625: fix anx7625_sink_detect() to
>           return correct hpd status
>         - [11/11] drm/bridge: anx7625: change the gpiod_set_value API
>     - Rebased the remaining two patches of the series.
>     - Added anx7625 bridge supplies as fixed reulators, according to the power grid. [Dmitry]
>     - Link to v6 : https://lore.kernel.org/all/20250505094245.2660750-1-quic_amakhija@quicinc.com/
> 
> Changes in v6: Fixed the review comments from konard.
>     - Added the reference voltage in patch 7 for vph-pwr. [Konard]
>     - Patches from 1 to 5 of version 5 of the series are accepted.
>       So removed from here.
>     - Link to v5 : https://lore.kernel.org/all/20250424062431.2040692-1-quic_amakhija@quicinc.com/
> 
> Changes in v5: Fixed review comments from Dmitry
>     - Added reset gpio for io_expander(tca9539) in patch 7. [Dmitry]
>     - Updated the commit text of patch 10 for eDP configuration. [Dmitry]
>     - Link to v4 : https://lore.kernel.org/all/20250417053909.1051416-1-amakhija@qti.qualcomm.com/
> 
> Changes in v4: Fixed review comments from Dmirty, Krzysztof and konard
>     - Add only single compatible string in dsi ctrl pattern properties
>       in patch 3. [Krzysztof/Dmitry]
>     - Move the io_expander RESET and INTR pinctrls from i2c18 node to
>       io_expander node in patch 7. [Dmitry]
>     - Remove the gpio-hogs from io_expander node, as we are already
>       configuring them under anx7625 bridge nodes. [Dmitry/Konard]
>     - Updated the commit message based on hpd_enable() and
>       hpd_disabled() recommendation in patch 8. [Dmitry]
>     - Split the patch 9 of vesrion 3 into two separate patches. [Dmirty]
>     - Updated the commit message and commit text in patch 9 and
>       patch 10.
>     - Link to v3 : https://lore.kernel.org/all/20250404115539.1151201-1-quic_amakhija@quicinc.com/
> 
> Changes in v3: Fixed review comments from Dmitry and Krzysztof
>     - Added qcom,sa8775p-dsi-ctrl compatible based on the set of clocks
>       which are associated with it in patch 2. [Krzysztof]
>     - Drop the blank line and add contains instead of items in pattern
>       properties of dsi ctrl and phy in patch 3. [Krzysztof]
>     - Updated the node name from anx7625@58 to bridge@58 for anx7625
>       dsi-dp bridge in patch 7. [Dmitry/Krzysztof]
>     - Updated endpoint label name for input output ports of analogix bridge chip in patch 7.
>     - Check the DP or eDP confiuration based on the aux node in patch 9. [Dmitry]
>     - Link to v2 : https://lore.kernel.org/all/20250311122445.3597100-1-quic_amakhija@quicinc.com/
> 
> Changes in v2: Fixed review comments from Rob, konard, Dmitry and Krzysztof
>     - Added additionalProperities in dsi and phy patternProperties in patch 3. [Rob's bot]
>     - Updated example in qcom,sa8775p-mdss.yaml of patch 3:
>         - Added port1 and port2 inside mdss0 ports.
>         - Renamed dsi ports from mdss_dsi0_in to mdss0_dsi0_in and mdss_dsi1_in to mdss0_dsi1_in.
>     - Updated the init load value for vdds supply of DSI PHY from
>       150000uA to 48000uA as per chipset power grid in patch 4. [Dmitry]
>     - Updated the init load value for vdda supply for DSI ctrl
>       from 30100uA to 8300uA as per chipset power grid in patch 5.[Dmitry]
>     - Rebase the series to use the header with DSI phy clock IDs to make code more
>       readable in patch 6. [konard]
>     - Added the interrupts-extended in patch 7. [konard]
>     - Fixed the warning from DT checker against DT binding in patch 7. [Krzysztof]
>     - Changed the connector node name from dsi0-connector to dp-dsi0-connector and dsi1-connector to dp-dsi1-connector
>       respectively in patch 7. [Dmitry]
>     - Added the vph_pwr for anx7625 vdda10, vdds18 and vdda33 supply to fix the warnings from DT checker in
>       patch 7. [Rob's bot]
>     - Addressed device tree comments in patch 7. [Konard]
>     - Squash the DT patch 8 into DT patch 7. [Dmitry]
>     - Added hpd_enable() and hpd_disable() bridge funcs in patch 9. [Dmitry]
>     - Update hpd detection bridge op flags logic based on eDP connector in patch 10. [Dmitry]
>     - Link to v1 : https://lore.kernel.org/linux-arm-msm/20250225121824.3869719-1-quic_amakhija@quicinc.com/
> 
> Ayushi Makhija (2):
>   arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
>   arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes
> 
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 232 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 177 +++++++++++++++-
>  2 files changed, 408 insertions(+), 1 deletion(-)
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: remotes/arm-soc/qcom/dt64-45-g27880745470a (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250522051318.1783905-1-quic_amakhija@quicinc.com:

arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): phy@ae94400:compatible:0: 'qcom,sa8775p-edp-phy' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): phy@ae96400:compatible:0: 'qcom,sa8775p-edp-phy' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): phy@ae94400:compatible:0: 'qcom,sa8775p-edp-phy' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): phy@ae96400:compatible:0: 'qcom,sa8775p-edp-phy' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: dsi@ae94000 (qcom,sa8775p-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: dsi@ae94000 (qcom,sa8775p-dsi-ctrl): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sa8775p-dsi-phy-5nm']
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: dsi@ae94000 (qcom,sa8775p-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: dsi@ae96000 (qcom,sa8775p-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: dsi@ae94000 (qcom,sa8775p-dsi-ctrl): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: dsi@ae96000 (qcom,sa8775p-dsi-ctrl): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sa8775p-dsi-phy-5nm']
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sa8775p-dsi-phy-5nm']
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): phy@ae94400:compatible:0: 'qcom,sa8775p-edp-phy' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): phy@ae96400:compatible:0: 'qcom,sa8775p-edp-phy' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: dsi@ae96000 (qcom,sa8775p-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: dsi@ae96000 (qcom,sa8775p-dsi-ctrl): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sa8775p-dsi-phy-5nm']
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: dsi@ae94000 (qcom,sa8775p-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: dsi@ae94000 (qcom,sa8775p-dsi-ctrl): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sa8775p-dsi-phy-5nm']
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: dsi@ae96000 (qcom,sa8775p-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: dsi@ae96000 (qcom,sa8775p-dsi-ctrl): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sa8775p-dsi-phy-5nm']
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): phy@ae94400:compatible:0: 'qcom,sa8775p-edp-phy' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): phy@ae96400:compatible:0: 'qcom,sa8775p-edp-phy' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-subsystem@ae00000 (qcom,sa8775p-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: dsi@ae94000 (qcom,sa8775p-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: dsi@ae94000 (qcom,sa8775p-dsi-ctrl): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sa8775p-dsi-phy-5nm']
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: dsi@ae96000 (qcom,sa8775p-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
	'qcom,sa8775p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: dsi@ae96000 (qcom,sa8775p-dsi-ctrl): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sa8775p-dsi-phy-5nm']





