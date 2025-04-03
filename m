Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B799AA7A53C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 16:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADDB10E241;
	Thu,  3 Apr 2025 14:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F2bXWMuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F7210E241
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 14:35:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0058C68434;
 Thu,  3 Apr 2025 14:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6247DC4CEE5;
 Thu,  3 Apr 2025 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743690931;
 bh=dMClsw2AJio5KjDc2EyqIP58v8ggQ7YAMbyOKgPWoUY=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=F2bXWMuwErTuxjye1QgtQz0W30U6wtezV5ZFdv2VC1h9sxI5Q8BB1bTBDAhRVGaer
 /mvsJzBL+Q/H4vyTYVpV1GIHAuBOqS8GyBkoUp5Q3UTgrX9KFqCJotP6ZBAvdCFYYy
 GTkim+V7wOIJJVOqRDde/g8O3UYEkUzadAbLrM6++ZrAyokJUJRdLJtGU5HR47IEbo
 2VeHOprQ0Siaws3FScLm60DkJ5OU3W0hSi0Se4NeyDR2EMG3GBF3TLjUsyGDdXC5VW
 kG4oCVOm/4lhcyIXOCua2wBld47I4s3VEqZ+rCWdi2oJFipV4iOM24JBlxurSg+Gkh
 JYI8leV42+d7A==
Date: Thu, 03 Apr 2025 09:35:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org
To: Christopher Obbard <christopher.obbard@linaro.org>
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
Message-Id: <174369066305.2789458.14506142357884994907.robh@kernel.org>
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
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


On Wed, 02 Apr 2025 15:36:31 +0100, Christopher Obbard wrote:
> The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
> panels. This patch series adds support for the OLED model which has a
> Samsung ATNA40YK20 panel.
> 
> With this patch series the backlight of the OLED eDP panel does not
> illuminate since the brightness is incorrectly read from the eDP panel
> as (to be clear this is not a regression). This is fixed in [0].
> 
> [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
> Changes in v5:
> - Move edp_hpd_active from T14s DTS into SoC DTSI (Dmitry).
> - Link to v4: https://lore.kernel.org/r/20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org
> 
> Changes in v4:
> - Rework HPD GPIO into eDP device rather than panel (Johan).
> - Drop review tags for HPD GPIO patch.
> - Link to v3: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org
> 
> Changes in v3:
> - Added review trailers from v2.
> - Dropped dt-binding documentation patch (applied by Douglas Anderson into
>   drm-misc-next).
> - Dropped eDP maximum brightness patch (will be sent in separate
>   series).
> - Removed duplicate nodes in T14s OLED device tree.
> - Reworked WIP comments from commit messages.
> - Link to v2: https://lore.kernel.org/r/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org
> 
> Changes in v2:
> - Use the existing atna33xc20 driver rather than panel-edp.
> - Add eDP panel into OLED devicetree.
> - Add patch to read the correct maximum brightness from the eDP panel.
> - Link to v1: https://lore.kernel.org/r/20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org
> 
> ---
> Christopher Obbard (3):
>       arm64: dts: qcom: x1e80100: add epd hpd pinctrl
>       arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
>       arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
> 
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 3 +++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi                          | 5 +++++
>  3 files changed, 16 insertions(+)
> ---
> base-commit: b6ae34803e82511009e2b78dc4fd154330ecdc2d
> change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
> 
> Best regards,
> --
> Christopher Obbard <christopher.obbard@linaro.org>
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
 Base: using specified base-commit b6ae34803e82511009e2b78dc4fd154330ecdc2d

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org:

arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: panel: compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,atna40yk20', 'samsung,atna33xc20'] is too long
	'samsung,atna33xc20' was expected
	'samsung,atna40yk20' is not one of ['samsung,atna45af01', 'samsung,atna45dc02', 'samsung,atna56ac03']
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,atna33xc20.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel: failed to match any schema with compatible: ['samsung,atna40yk20', 'samsung,atna33xc20']
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: pinctrl@f100000: edp-hpd-active-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	'edp_hot' is not one of ['aon_cci', 'aoss_cti', 'atest_char', 'atest_char0', 'atest_char1', 'atest_char2', 'atest_char3', 'atest_usb', 'audio_ext', 'audio_ref', 'cam_aon', 'cam_mclk', 'cci_async', 'cci_i2c', 'cci_timer0', 'cci_timer1', 'cci_timer2', 'cci_timer3', 'cci_timer4', 'cmu_rng0', 'cmu_rng1', 'cmu_rng2', 'cmu_rng3', 'cri_trng', 'dbg_out', 'ddr_bist', 'ddr_pxi0', 'ddr_pxi1', 'ddr_pxi2', 'ddr_pxi3', 'ddr_pxi4', 'ddr_pxi5', 'ddr_pxi6', 'ddr_pxi7', 'edp0_hot', 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'eusb0_ac', 'eusb1_ac', 'eusb2_ac', 'eusb3_ac', 'eusb5_ac', 'eusb6_ac', 'gcc_gp1', 'gcc_gp2', 'gcc_gp3', 'gpio', 'i2s0_data0', 'i2s0_data1', 'i2s0_sck', 'i2s0_ws', 'i2s1_data0', 'i2s1_data1', 'i2s1_sck', 'i2s1_ws', 'ibi_i3c', 'jitter_bist', 'mdp_vsync0', 'mdp_vsync1', 'mdp_vsync2', 'mdp_vsync3', 'mdp_vsync4', 'mdp_vsync5', 'mdp_vsync6', 'mdp_vsync7', 'mdp_vsync8', 'pcie3_clk', 'pcie4_clk', 'pcie5_clk', 'pcie6a_clk', 'pcie6b_clk', 'phase_flag', 'pll_bist', 'pll_clk', 'prng_rosc0', 'prng_r
 osc1', 'prng_rosc2', 'prng_rosc3', 'qdss_cti', 'qdss_gpio', 'qspi00', 'qspi01', 'qspi02', 'qspi03', 'qspi0_clk', 'qspi0_cs0', 'qspi0_cs1', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3', 'qup0_se4', 'qup0_se5', 'qup0_se6', 'qup0_se7', 'qup1_se0', 'qup1_se1', 'qup1_se2', 'qup1_se3', 'qup1_se4', 'qup1_se5', 'qup1_se6', 'qup1_se7', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'qup2_se7', 'sd_write', 'sdc4_clk', 'sdc4_cmd', 'sdc4_data0', 'sdc4_data1', 'sdc4_data2', 'sdc4_data3', 'sys_throttle', 'tb_trig', 'tgu_ch0', 'tgu_ch1', 'tgu_ch2', 'tgu_ch3', 'tgu_ch4', 'tgu_ch5', 'tgu_ch6', 'tgu_ch7', 'tmess_prng0', 'tmess_prng1', 'tmess_prng2', 'tmess_prng3', 'tsense_pwm1', 'tsense_pwm2', 'sense_pwm3', 'tsense_pwm4', 'usb0_dp', 'usb0_phy', 'usb0_sbrx', 'usb0_sbtx', 'usb1_dp', 'usb1_phy', 'usb1_sbrx', 'usb1_sbtx', 'usb2_dp', 'usb2_phy', 'usb2_sbrx', 'usb2_sbtx', 'vsense_trigger']
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#





