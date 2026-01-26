Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MqVGHqnd2lrjwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 18:42:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B318B980
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 18:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA3089950;
	Mon, 26 Jan 2026 17:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="nrz4+E+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A05389950
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 17:42:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260126174209euoutp01d8845f787646e1ccb38509ae2b34dc63~OWMpImYMh0629706297euoutp01c;
 Mon, 26 Jan 2026 17:42:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260126174209euoutp01d8845f787646e1ccb38509ae2b34dc63~OWMpImYMh0629706297euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1769449329;
 bh=0hZIidlQwtEAZPDQwy5fCpgn5aYTrltQ0aWsqkrl/MA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=nrz4+E+2t7tfDF869R6ejue7cgak6v9clKDONEvHjbNwmOVc3lAWzNkgauBE0u2G9
 XMbsdqNGq2ckduW+Y0KXZQ2SyyAKRGJyF+5/57qM+GvUo9tqx+5Nn/CfoE3+5skQXL
 WK/TBRhZlZKJU4TQI2Z68YhRXQdg6bm54Zd9BN6w=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260126174209eucas1p28e3856ee9f7a841db54dd05e5ea30178~OWMo4Zig62641726417eucas1p2J;
 Mon, 26 Jan 2026 17:42:09 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260126174207eusmtip2c8c9672c51997b866a94fb0a7a1010cb~OWMnUdX7Y2552625526eusmtip2d;
 Mon, 26 Jan 2026 17:42:07 +0000 (GMT)
Message-ID: <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
Date: Mon, 26 Jan 2026 18:42:06 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260126174209eucas1p28e3856ee9f7a841db54dd05e5ea30178
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260126174209eucas1p28e3856ee9f7a841db54dd05e5ea30178
X-EPHeader: CA
X-CMS-RootMailID: 20260126174209eucas1p28e3856ee9f7a841db54dd05e5ea30178
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
 <CGME20260126174209eucas1p28e3856ee9f7a841db54dd05e5ea30178@eucas1p2.samsung.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:victor.liu@nxp.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.f
 reedesktop.org,m:linux-rockchip@lists.infradead.org,m:jernejskrabec@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,raspberrypi.com,igalia.com,sholland.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,collabora.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.8:email,0.0.0.6:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,samsung.com:mid,samsung.com:dkim,0.0.0.4:email,0.0.0.3:email,0.0.0.5:email,0.0.0.7:email]
X-Rspamd-Queue-Id: B9B318B980
X-Rspamd-Action: no action

On 07.01.2026 19:14, Dmitry Baryshkov wrote:
> Implement the clear_infoframe callback, disabling corresponding
> InfoFrame type.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

This patch landed recently in linux-next as commit 3a4ceb89a972 
("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
it causes the following regression on Qualcomm RB5 board:

platform 8300000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to 
iommu group 25
msm_dpu ae01000.display-controller: bound ae90000.displayport-controller 
(ops msm_dp_display_comp_ops [msm])
platform 8300000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to 
iommu group 26
platform 8300000.remoteproc:glink-edge:fastrpc:compute-cb@8: Adding to 
iommu group 27
qcom,fastrpc 17300000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: 
no reserved DMA memory for FASTRPC
platform 17300000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to 
iommu group 28
msm_dpu ae01000.display-controller: bound 3d00000.gpu (ops a3xx_ops [msm])
[drm:dpu_kms_hw_init:1173] dpu hardware revision:0x60000000
platform 17300000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to 
iommu group 29
platform 17300000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to 
iommu group 30
wsa_macro 3240000.codec: using zero-initialized flat cache, this may 
cause unexpected behavior
qcom-soundwire 3250000.soundwire: din-ports (2) mismatch with controller (3)
[drm:msm_dsi_manager_connector_init [msm]] *ERROR* Unable to create 
bridge connector
msm_dpu ae01000.display-controller: [drm:msm_dsi_modeset_init [msm]] 
*ERROR* failed to create dsi connector: -22
[drm:_dpu_kms_initialize_dsi:630] [dpu error]modeset_init failed for 
dsi[0], rc = -22
[drm:_dpu_kms_setup_displays:766] [dpu error]initialize_dsi failed, rc = -22
[drm:dpu_kms_hw_init:1283] [dpu error]modeset init failed: -22
msm_dpu ae01000.display-controller: [drm:msm_drm_kms_init [msm]] *ERROR* 
kms hw init failed: -22
Unable to handle kernel paging request at virtual address dead000000000108
Mem abort info:
   ESR = 0x0000000096000044
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x04: level 0 translation fault
Data abort info:
   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[dead000000000108] address between user and kernel address ranges
Internal error: Oops: 0000000096000044 [#1]  SMP
Bluetooth: hci0: QCA Downloading qca/htnv20.bin
Modules linked in: snd_soc_wsa881x ax88179_178a(+) regmap_sdw usbnet 
ath11k_pci(+) ath11k q6asm_dai onboard_usb_dev q6afe_dai q6routing 
q6afe_clocks mac80211 libarc4 q6adm cfg80211 q6asm q6afe 
snd_q6dsp_common mhi q6core venus_enc venus_dec videobuf2_dma_contig 
imx412 apr mcp251xfd pdr_interface qcom_pd_mapper rpmsg_ctrl 
lontium_lt9611uxc(+) can_dev qrtr_smd nb7vpq904m rpmsg_char qcom_pdr_msg 
pci_pwrctrl_pwrseq fastrpc leds_qcom_lpg qcom_pbs snd_soc_sm8250 
snd_soc_qcom_offload_utils qcom_pmic_tcpm qcom_usb_vbus_regulator 
led_class_multicolor snd_soc_qcom_sdw tcpm snd_soc_qcom_common 
aux_hpd_bridge soc_usb qcom_spmi_adc_tm5 qcom_pon msm 
qcom_spmi_temp_alarm snd_usb_audio hci_uart qcom_spmi_adc5 snd_hwdep 
rtc_pm8xxx qcom_vadc_common ubwc_config btqca snd_usbmidi_lib qcom_camss 
venus_core gpio_shared_proxy btbcm snd_rawmidi ocmem videobuf2_dma_sg 
qcom_stats drm_gpuvm v4l2_fwnode drm_exec v4l2_mem2mem v4l2_async 
videobuf2_memops soundwire_qcom gpu_sched videobuf2_v4l2 soundwire_bus 
bluetooth videodev
  snd_soc_lpass_va_macro
mhi mhi0: Requested to power ON
  snd_soc_lpass_wsa_macro slimbus drm_dp_aux_bus videobuf2_common 
ecdh_generic snd_soc_lpass_macro_common ecc drm_display_helper rfkill 
spi_geni_qcom camcc_sm8250
mhi mhi0: Power on setup success
  i2c_qcom_cci mc llcc_qcom phy_qcom_qmp_combo snd_soc_core 
i2c_qcom_geni btrfs aux_bridge qrtr snd_compress typec icc_bwmon 
phy_qcom_qmp_usb qcom_refgen_regulator snd_pcm_dmaengine 
phy_qcom_snps_femto_v2 snd_pcm coresight_stm qcom_rng coresight_tmc 
qcrypto stm_core coresight_replicator coresight_funnel sha256 snd_timer 
pinctrl_sm8250_lpass_lpi coresight sha1 snd qcom_q6v5_pas 
pinctrl_lpass_lpi qcom_pil_info authenc libdes soundcore blake2b 
qcom_q6v5 libblake2b qcom_sysmon qcom_common xor qcom_glink_smem 
xor_neon pwrseq_qcom_wcn mdt_loader socinfo qmi_helpers qcom_wdt 
phy_qcom_qmp_pcie icc_osm_l3 display_connector pwrseq_core raid6_pq 
zstd_compress fuse dm_mod ipv6 libsha1
mhi mhi0: Wait for device to enter SBL or Mission mode
CPU: 5 UID: 0 PID: 271 Comm: (udev-worker) Not tainted 6.19.0-rc1+ 
#16433 PREEMPT
Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
Bluetooth: hci0: QCA setup on UART is completed
pc : drm_atomic_private_obj_fini+0x24/0x70
lr : _dpu_kms_hw_destroy+0x4c/0x64 [msm]
...
Call trace:
  drm_atomic_private_obj_fini+0x24/0x70 (P)
  _dpu_kms_hw_destroy+0x4c/0x64 [msm]
  dpu_kms_destroy+0x28/0xb0 [msm]
  msm_drm_kms_uninit+0xb0/0xdc [msm]
  msm_drm_uninit.isra.0+0x54/0xd4 [msm]
  msm_drm_init+0x214/0x284 [msm]
  msm_drm_bind+0x30/0x3c [msm]
  try_to_bring_up_aggregate_device+0x168/0x1d4
  __component_add+0xa8/0x170
  component_add+0x14/0x20
  dsi_dev_attach+0x20/0x2c [msm]
  dsi_host_attach+0x58/0x98 [msm]
  devm_mipi_dsi_attach+0x34/0x90
  lt9611uxc_attach_dsi.isra.0+0x84/0x100 [lontium_lt9611uxc]
  lt9611uxc_probe+0x5ec/0x684 [lontium_lt9611uxc]
  i2c_device_probe+0x154/0x344
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0x40/0x164
  __driver_attach+0x9c/0x1ac
  bus_for_each_dev+0x74/0xd0
  driver_attach+0x24/0x30
  bus_add_driver+0xe4/0x208
  driver_register+0x60/0x128
  i2c_register_driver+0x48/0xd0
  lt9611uxc_driver_init+0x20/0x1000 [lontium_lt9611uxc]
  do_one_initcall+0x64/0x308
  do_init_module+0x58/0x23c
  load_module+0x1b48/0x1dc4
  init_module_from_file+0xd4/0xec
  idempotent_init_module+0x188/0x280
  __arm64_sys_finit_module+0x68/0xac
  invoke_syscall+0x48/0x10c
  el0_svc_common.constprop.0+0xc8/0xe8
  do_el0_svc+0x20/0x2c
  el0_svc+0x50/0x2e8
  el0t_64_sync_handler+0xa0/0xe4
  el0t_64_sync+0x198/0x19c
Code: d2802443 f2fbd5a4 f2fbd5a3 a9408402 (f9000441)
---[ end trace 0000000000000000 ]---



> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 1798d1156d10..4cfb7ebc0c81 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -624,6 +624,30 @@ static int vc4_hdmi_stop_packet(struct vc4_hdmi *vc4_hdmi,
>   	return ret;
>   }
>   
> +static int vc4_hdmi_clear_infoframe(struct drm_connector *connector,
> +				    enum hdmi_infoframe_type type)
> +{
> +	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> +	struct drm_device *drm = connector->dev;
> +	int ret;
> +	int idx;
> +
> +	if (!drm_dev_enter(drm, &idx))
> +		return 0;
> +
> +	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
> +		    VC4_HDMI_RAM_PACKET_ENABLE),
> +		  "Packet RAM has to be on to store the packet.");
> +
> +	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
> +	if (ret)
> +		drm_err(drm, "Failed to wait for infoframe to go idle: %d\n", ret);
> +
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
>   static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
>   				    enum hdmi_infoframe_type type,
>   				    const u8 *infoframe, size_t len)
> @@ -1660,6 +1684,7 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
>   
>   static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
>   	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
> +	.clear_infoframe	= vc4_hdmi_clear_infoframe,
>   	.write_infoframe	= vc4_hdmi_write_infoframe,
>   };
>   
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

