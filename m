Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24767C935E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 10:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2408F10E0A8;
	Sat, 14 Oct 2023 08:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1CE410E1A3;
 Fri, 13 Oct 2023 16:05:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8800B11FB;
 Fri, 13 Oct 2023 09:05:48 -0700 (PDT)
Received: from [10.57.2.80] (unknown [10.57.2.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF0393F5A1;
 Fri, 13 Oct 2023 09:05:05 -0700 (PDT)
Message-ID: <dff4bd1d-e32a-9541-94d2-c354adf3d23b@arm.com>
Date: Fri, 13 Oct 2023 17:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Warning notice "Memory manager not clean during takedown" on RB5 runs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
 <20230817145940.9887-5-dmitry.baryshkov@linaro.org>
From: Aishwarya TCV <aishwarya.tcv@arm.com>
In-Reply-To: <20230817145940.9887-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 14 Oct 2023 08:04:12 +0000
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
 broonie@kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry


On 17/08/2023 15:59, Dmitry Baryshkov wrote:
> Add displayport altmode declaration to the Type-C controller node to
> enable DP altmode negotiation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

At present RB5 runs against next-master are consistently throwing
warning messages (attached below with call trace) on "Memory manager not
clean during takedown". I can send full logs if required. However, the
runs are booting successfully so the logs are quite big. Tried running
with older dtb built, where these
warnings was not observed.


A bisect (full log below) identified this patch as
introducing the failure.

git bisect start
# good: [8a749fd1a8720d4619c91c8b6e7528c0a355c0aa] Linux 6.6-rc4
git bisect good 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
# bad: [2a860505b617cf8fda4ebff6cf05d3f774145440] Add linux-next
specific files for 20231009
git bisect bad 2a860505b617cf8fda4ebff6cf05d3f774145440
# bad: [11a92414d65ec3ea50b86004baa9b54e03fc454a] Merge branch 'master'
of git://linuxtv.org/media_tree.git
git bisect bad 11a92414d65ec3ea50b86004baa9b54e03fc454a
# good: [d4ec2b3f0e34a40991fb8d5fb374c07382fe0892] bcachefs:
stack_trace_save_tsk() depends on CONFIG_STACKTRACE
git bisect good d4ec2b3f0e34a40991fb8d5fb374c07382fe0892
# good: [94b6eadf2db4b7ec5b6e5c4dfd3d552ea388e441] Merge branch
'for-next' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
git bisect good 94b6eadf2db4b7ec5b6e5c4dfd3d552ea388e441
# bad: [15c1906eb69acb82e6992d701f9522216fdaf234] Merge branch
'xtensa-for-next' of git://github.com/jcmvbkbc/linux-xtensa.git
git bisect bad 15c1906eb69acb82e6992d701f9522216fdaf234
# bad: [b837ae5f505e0a05329ab9c72ed1a6c55f70456c] Merge branch
'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
git bisect bad b837ae5f505e0a05329ab9c72ed1a6c55f70456c
# bad: [33e9032a1875bb1aee3c68a4540f5a577ff44130] arm64: dts: qcom:
apq8016-sbc: Add missing ADV7533 regulators
git bisect bad 33e9032a1875bb1aee3c68a4540f5a577ff44130
# bad: [a6546460ca439bade19d64eb63cee2d97c29fb72] arm64: dts: qcom:
sc8180x: switch PCIe QMP PHY to new style of bindings
git bisect bad a6546460ca439bade19d64eb63cee2d97c29fb72
# good: [4988881ec067c3e6d382de1583b7f5b1095ddea2] arm64: dts: qcom:
sm6125: Add dispcc node
git bisect good 4988881ec067c3e6d382de1583b7f5b1095ddea2
# good: [ea96b90a58cf5d2e91ac177f081118ff26b85c1d] arm64: dts: qcom:
sm8250: Define ports for qmpphy orientation-switching
git bisect good ea96b90a58cf5d2e91ac177f081118ff26b85c1d
# bad: [b3dea914127e9065df003002ed13a2ef40d19877] arm64: dts: qcom:
qrb5165-rb5: enable DP altmode
git bisect bad b3dea914127e9065df003002ed13a2ef40d19877
# good: [25defdca4d902b338c05bc01a1de1064a6d3b7f3] arm64: dts: qcom:
qrb5165-rb5: Switch on TCPM usb-role-switching for usb_1
git bisect good 25defdca4d902b338c05bc01a1de1064a6d3b7f3
# good: [956aa24b16350a50d3a6beb9237bc35aa2f447d6] arm64: dts: qcom:
sm8250: Add DisplayPort device node
git bisect good 956aa24b16350a50d3a6beb9237bc35aa2f447d6
# bad: [96387ee7534dc449be35a9bb98b7668da2bed545] arm64: dts: qcom:
qrb5165-rb5: enable displayport controller
git bisect bad 96387ee7534dc449be35a9bb98b7668da2bed545
# good: [d342e1c993bd7589cad9d2da099c6a9c652ecb9f] arm64: dts: qcom:
qrb5165-rb5: add onboard USB-C redriver
git bisect good d342e1c993bd7589cad9d2da099c6a9c652ecb9f
# first bad commit: [96387ee7534dc449be35a9bb98b7668da2bed545] arm64:
dts: qcom: qrb5165-rb5: enable displayport controller


Boot log:

<4>[   87.062915] ------------[ cut here ]------------
<4>[   87.067944] Memory manager not clean during takedown.
<4>[   87.074791] WARNING: CPU: 7 PID: 70 at
drivers/gpu/drm/drm_mm.c:999 drm_mm_takedown+0x28/0x38 [drm]
<4>[   87.084382] Modules linked in: fuse ip_tables x_tables ipv6
r8153_ecm cdc_ether snd_soc_hdmi_codec ax88179_178a venus_dec venus_enc
r8152 videobuf2_dma_contig usbnet videobuf2_memops onboard_usb_hub
mcp251xfd nb7vpq904m can_dev lontium_lt9611uxc msm leds_qcom_lpg
qcom_spmi_adc_tm5 qcom_spmi_adc5 rtc_pm8xxx led_class_multicolor ocmem
qcom_pon qcom_spmi_temp_alarm qcom_vadc_common venus_core v4l2_mem2mem
gpu_sched videobuf2_v4l2 crct10dif_ce drm_dp_aux_bus videodev
snd_soc_sm8250 snd_soc_qcom_sdw drm_display_helper videobuf2_common
snd_soc_qcom_common qrtr qcom_stats mc coresight_stm stm_core
qcom_q6v5_pas spi_geni_qcom llcc_qcom phy_qcom_qmp_combo qcom_pil_info
typec icc_bwmon i2c_qcom_geni phy_qcom_qmp_usb qcom_q6v5
coresight_replicator coresight_tmc coresight_etm4x coresight_funnel
phy_qcom_snps_femto_v2 qcom_rng qcom_sysmon snd_soc_lpass_va_macro
qcom_common lpass_gfm_sm8250 qcrypto pinctrl_sm8250_lpass_lpi
qcom_glink_smem snd_soc_lpass_macro_common coresight ufs_qcom
sha256_generic mdt_loader libsha256 qmi_helpers
<4>[   87.084435]  pinctrl_lpass_lpi soundwire_qcom soundwire_bus
authenc display_connector qcom_wdt phy_qcom_qmp_ufs
snd_soc_lpass_wsa_macro phy_qcom_qmp_pcie slimbus icc_osm_l3 libdes
drm_kms_helper drm socinfo backlight qnoc_sm8250
<4>[   87.198040] CPU: 7 PID: 70 Comm: kworker/u16:3 Tainted: G        W
         6.6.0-rc5-next-20231013 #1
<4>[   87.207857] Hardware name: Qualcomm Technologies, Inc. Robotics
RB5 (DT)
<4>[   87.215009] Workqueue: events_unbound deferred_probe_work_func
<4>[   87.221273] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
BTYPE=--)
<4>[   87.228686] pc : drm_mm_takedown+0x28/0x38 [drm]
<4>[   87.233716] lr : drm_mm_takedown+0x28/0x38 [drm]
<4>[   87.238741] sp : ffff800080743810
<4>[   87.242416] x29: ffff800080743810 x28: ffff7824cd321880 x27:
ffff7824c36c9d40
<4>[   87.250007] x26: ffffb54fa83c71a0 x25: dead000000000100 x24:
dead000000000122
<4>[   87.257599] x23: ffff7824c3600810 x22: ffffb54f5a99b708 x21:
ffff7824c3600800
<4>[   87.265189] x20: ffff7824c4a4c600 x19: ffff7824c7752800 x18:
ffffb54f5a8e0048
<4>[   87.272779] x17: 0000000000010108 x16: 0000000000010108 x15:
0000483e088c93ae
<4>[   87.280371] x14: 00000000000002a4 x13: 00000000000002a4 x12:
0000000000000000
<4>[   87.287962] x11: 0000000000000001 x10: 0000000000000a60 x9 :
ffff800080743680
<4>[   87.295554] x8 : ffff7824c0320ac0 x7 : ffff78263efaf040 x6 :
00000000012105e7
<4>[   87.303140] x5 : 00000000410fd0d0 x4 : 0000000000f0000f x3 :
0000000000100000
<4>[   87.310730] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
ffff7824c0320000
<4>[   87.318317] Call trace:
<4>[   87.321103]  drm_mm_takedown+0x28/0x38 [drm]
<4>[   87.325778]  drm_vma_offset_manager_destroy+0x14/0x20 [drm]
<4>[   87.331794]  drm_gem_init_release+0x14/0x20 [drm]
<4>[   87.336918]  drm_managed_release+0xac/0x140 [drm]
<4>[   87.342043]  drm_dev_put+0x94/0xbc [drm]
<4>[   87.346366]  msm_drm_uninit.isra.0+0x98/0xd0 [msm]
<4>[   87.351594]  msm_drm_bind+0x20c/0x3b0 [msm]
<4>[   87.356181]  try_to_bring_up_aggregate_device+0x168/0x1d4
<4>[   87.361994]  __component_add+0xa4/0x170
<4>[   87.366202]  component_add+0x14/0x20
<4>[   87.370142]  dsi_dev_attach+0x20/0x2c [msm]
<4>[   87.374731]  dsi_host_attach+0x9c/0x144 [msm]
<4>[   87.379493]  devm_mipi_dsi_attach+0x34/0xb4
<4>[   87.384064]  lt9611uxc_attach_dsi.isra.0+0x84/0xfc [lontium_lt9611uxc]
<4>[   87.391040]  lt9611uxc_probe+0x598/0x65c [lontium_lt9611uxc]
<4>[   87.397126]  i2c_device_probe+0x1a8/0x330
<4>[   87.401520]  really_probe+0x148/0x2b4
<4>[   87.405554]  __driver_probe_device+0x78/0x12c
<4>[   87.410302]  driver_probe_device+0x3c/0x15c
<4>[   87.414875]  __device_attach_driver+0xb8/0x134
<4>[   87.419710]  bus_for_each_drv+0x84/0xe0
<4>[   87.423929]  __device_attach+0xa8/0x1b0
<4>[   87.428138]  device_initial_probe+0x14/0x20
<4>[   87.432704]  bus_probe_device+0xa8/0xac
<4>[   87.436913]  deferred_probe_work_func+0x88/0xc0
<4>[   87.441829]  process_one_work+0x138/0x260
<4>[   87.446225]  worker_thread+0x32c/0x438
<4>[   87.450346]  kthread+0x118/0x11c
<4>[   87.453941]  ret_from_fork+0x10/0x20
<4>[   87.457888] ---[ end trace 0000000000000000 ]---

Thanks,
Aishwarya

> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 3bd0c06e7315..c8cd40a462a3 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1423,6 +1423,13 @@ PDO_FIXED_DUAL_ROLE |
>  					 PDO_FIXED_USB_COMM |
>  					 PDO_FIXED_DATA_SWAP)>;
>  
> +		altmodes {
> +			displayport {
> +				svid = <0xff01>;
> +				vdo = <0x00001c46>;
> +			};
> +		};
> +
>  		ports {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
