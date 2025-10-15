Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA72BDD5C3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 10:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFB810E74E;
	Wed, 15 Oct 2025 08:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="tj0d1WjQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B275F10E74B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:22:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251015082254euoutp01a176820051fc890ef833f64aad320b09~unH88aCTJ3011730117euoutp013
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:22:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251015082254euoutp01a176820051fc890ef833f64aad320b09~unH88aCTJ3011730117euoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760516574;
 bh=aPM/dsLhraX1SP+D6nNbgxfUPQTEWM73C5V0IPs0LBo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=tj0d1WjQ/femGYRHiUQfbGlzQFCKXi1lEIvOSqqKWsLp193+PgnxmJIklzdC16AUp
 3LOOoPFwOBYWMHIIJ8JqqQ9shbpdum3evrsZP44HDxamLXsiJFWOCH1C/gT4ch+/1w
 XUHHmzVMusGKO0cUeTTEcge8rHq+nUFD7f+cJRvA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20251015082254eucas1p23fc961e7a49f4a29ca7a18d3e2817f86~unH8efIPP2064720647eucas1p2n;
 Wed, 15 Oct 2025 08:22:54 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251015082252eusmtip2e401500e400caaa29ed4e6cfd48f378a~unH6mID2S1919819198eusmtip2k;
 Wed, 15 Oct 2025 08:22:52 +0000 (GMT)
Message-ID: <336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com>
Date: Wed, 15 Oct 2025 10:22:51 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] drm/display: bridge_connector: get/put the stored
 bridges
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251015082254eucas1p23fc961e7a49f4a29ca7a18d3e2817f86
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251015082254eucas1p23fc961e7a49f4a29ca7a18d3e2817f86
X-EPHeader: CA
X-CMS-RootMailID: 20251015082254eucas1p23fc961e7a49f4a29ca7a18d3e2817f86
References: <20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com>
 <CGME20251015082254eucas1p23fc961e7a49f4a29ca7a18d3e2817f86@eucas1p2.samsung.com>
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

Hi Luca,

On 26.09.2025 16:59, Luca Ceresoli wrote:
> drm_bridge_connector_init() takes eight pointers to various bridges, some
> of which can be identical, and stores them in pointers inside struct
> drm_bridge_connector. Get a reference to each of the taken bridges and put
> it on cleanup.
>
> This is tricky because the pointers are currently stored directly in the
> drm_bridge_connector in the loop, but there is no nice and clean way to put
> those pointers on error return paths. To overcome this, store all pointers
> in temporary local variables with a cleanup action, and only on success
> copy them into struct drm_bridge_connector (getting another ref while
> copying).
>
> Additionally four of these pointers (edid, hpd, detect and modes) can be
> written in multiple loop iterations, in order to eventually store the last
> matching bridge. However, when one of those pointers is overwritten, we
> need to put the reference that we got during the previous assignment. Add a
> drm_bridge_put() before writing them to handle this.
>
> Finally, there is also a function-local panel_bridge pointer taken inside
> the loop and used after the loop. Use a cleanup action as well to ensure it
> is put on return.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

This patch landed recently in linux-next as commit 2be300f9a0b6 
("drm/display: bridge_connector: get/put the stored bridges"). In my 
tests I found that it causes the following NULL pointer dereference on 
DragonBoard410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts):

--->8---

  msm_mdp 1a01000.display-controller: bound 1c00000.gpu (ops a3xx_ops [msm])
  msm_mdp 1a01000.display-controller: [drm:mdp5_kms_init [msm]] MDP5 
version v1.6
  msm_mdp 1a01000.display-controller: fall back to the other CTL 
category for INTF 1!
  Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000110
  ...
  Internal error: Oops: 0000000096000004 [#1]  SMP
  Modules linked in: qcom_wcnss_pil(+) cpufreq_powersave 
cpufreq_conservative coresight_stm stm_core coresight_replicator 
coresight_cpu_debug coresight_funnel coresight_tmc coresight_cti 
coresight_tpiu adv7511 nfc coresight rfkill msm snd_soc_lpass_apq8016 
snd_soc_lpass_cpu snd_soc_apq8016_sbc snd_soc_msm8916_digital 
snd_soc_msm8916_analog snd_soc_lpass_platform snd_soc_qcom_common 
snd_soc_core qrtr snd_compress snd_pcm_dmaengine qcom_camss 
qcom_spmi_temp_alarm snd_pcm qcom_q6v5_mss qcom_pil_info ubwc_config 
qcom_q6v5 videobuf2_dma_sg llcc_qcom v4l2_fwnode rtc_pm8xxx ocmem 
venus_core v4l2_async qcom_sysmon qcom_common qcom_spmi_vadc drm_gpuvm 
qcom_vadc_common qcom_pon v4l2_mem2mem snd_timer drm_exec 
videobuf2_memops gpu_sched videobuf2_v4l2 snd qcom_glink_smem 
drm_dp_aux_bus videodev soundcore mdt_loader qmi_helpers 
drm_display_helper qnoc_msm8916 videobuf2_common qcom_stats mc qcom_rng 
rpmsg_ctrl rpmsg_char ramoops reed_solomon display_connector socinfo 
rmtfs_mem ax88796b asix usbnet phy_qcom_usb_hs ipv6
  CPU: 2 UID: 0 PID: 42 Comm: kworker/u16:1 Tainted: G W           
6.17.0-rc6+ #16051 PREEMPT
  Tainted: [W]=WARN
  Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
  Workqueue: events_unbound deferred_probe_work_func
  pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : drm_bridge_connector_hdmi_cec_init+0x8/0x38 [drm_display_helper]
  lr : drmm_connector_hdmi_cec_register+0xf8/0x1c8 [drm_display_helper]
  sp : ffff8000843d3560
  x29: ffff8000843d3560 x28: 0000000000000000 x27: 0000000000000000
  x26: ffff000010c14400 x25: ffff00000c034b68 x24: ffff00003b82a020
  x23: ffff00000c030000 x22: ffff0000097bf7d0 x21: ffff0000042e6a60
  x20: ffff80007c162af8 x19: ffff00000c034080 x18: 00000000ffffffff
  x5 : 00000000000007ff x4 : ffff800083cc5c50 x3 : 0000000000000000
  x2 : 0000000000000000 x1 : ffff00000c034080 x0 : 0000000000000000
  Call trace:
   drm_bridge_connector_hdmi_cec_init+0x8/0x38 [drm_display_helper] (P)
   drm_bridge_connector_init+0x6b4/0x6d4 [drm_display_helper]
   msm_dsi_manager_connector_init+0x9c/0xf0 [msm]
   msm_dsi_modeset_init+0x60/0xe8 [msm]
   modeset_init+0x3c4/0x4c0 [msm]
   mdp5_kms_init+0x3cc/0x670 [msm]
   msm_drm_kms_init+0x40/0x33c [msm]
   msm_drm_init+0x1c4/0x284 [msm]
   msm_drm_bind+0x30/0x3c [msm]
   try_to_bring_up_aggregate_device+0x168/0x1d4
   __component_add+0xa8/0x170
   component_add+0x14/0x20
   dsi_dev_attach+0x20/0x2c [msm]
   dsi_host_attach+0x58/0x98 [msm]
   devm_mipi_dsi_attach+0x34/0x90
   adv7533_attach_dsi+0x8c/0x104 [adv7511]
   adv7511_probe+0x764/0x988 [adv7511]
   i2c_device_probe+0x154/0x350
   really_probe+0xbc/0x298
   __driver_probe_device+0x78/0x12c
   driver_probe_device+0xdc/0x164
   __device_attach_driver+0xb8/0x138
   bus_for_each_drv+0x80/0xdc
   __device_attach+0xa8/0x1b0
   device_initial_probe+0x14/0x20
   bus_probe_device+0xb0/0xb4
   deferred_probe_work_func+0x8c/0xc8
   process_one_work+0x208/0x60c
   worker_thread+0x244/0x388
   kthread+0x150/0x228
   ret_from_fork+0x10/0x20
  Code: d50323bf d65f03c0 aa0003e1 f945e400 (f9408802)
  ---[ end trace 0000000000000000 ]---

This can be easily fixed by adding the following check:

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c 
b/drivers/gpu/drm/display/drm_bridge_connector.c
index 7b18be3ff9a3..222ecbc98155 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -601,7 +601,7 @@ static int drm_bridge_connector_hdmi_cec_init(struct 
drm_connector *connector)

         bridge = bridge_connector->bridge_hdmi_cec;

-       if (!bridge->funcs->hdmi_cec_init)
+       if (!bridge || !bridge->funcs->hdmi_cec_init)
                 return 0;

         return bridge->funcs->hdmi_cec_init(bridge, connector);


However I don't know the internals of the related code to judge that 
such check is the proper way to fix this issue.


> ---
> This series ensures the bridge-connector gets a reference to bridges when
> storing a pointer to them, and releases them afterwards.
>
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan was discussed in [1].
> Here's the work breakdown (➜ marks the current series):
>
>   1. ➜ add refcounting to DRM bridges (struct drm_bridge)
>      (based on devm_drm_bridge_alloc() [0])
>      A. ✔ add new alloc API and refcounting (v6.16)
>      B. ✔ convert all bridge drivers to new API (v6.17)
>      C. ✔ kunit tests (v6.17)
>      D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
>           and warn on old allocation pattern (v6.17)
>      E. … add get/put on drm_bridge accessors
>         1. ✔ drm_bridge_chain_get_first_bridge() + add a cleanup action
>              (drm-misc-next)
>         2. ✔ drm_bridge_get_prev_bridge() (drm-misc-next)
>         3. ✔ drm_bridge_get_next_bridge() (drm-misc-next)
>         4. ✔ drm_for_each_bridge_in_chain() (drm-misc-next)
>         5. ➜ drm_bridge_connector_init
>         6. protect encoder bridge chain with a mutex
>         7. of_drm_find_bridge
>         8. drm_of_find_panel_or_bridge, *_of_get_bridge
>      F. ➜ debugfs improvements
>         1. ✔ add top-level 'bridges' file (v6.16)
>         2. ✔ show refcount and list removed bridges (drm-misc-next)
>   2. … handle gracefully atomic updates during bridge removal
>   3. … DSI host-device driver interaction
>   4. removing the need for the "always-disconnected" connector
>   5. finish the hotplug bridge work, moving code to the core and potentially
>      removing the hotplug-bridge itself (this needs to be clarified as
>      points 1-3 are developed)
>
> This was tricky both because there is no central place in
> drm_bridge_connector.c to put the references on disposal (handled by patch
> 1) and because of the complex code flow of drm_bridge_connector_init()
> (handled by patch 2).
> ---
> Changes in v2:
> - Use drmm_add_action() instead of hacking the .destroy connector func
> - Removed patch 1 (where the hacking the .destroy connector func was)
> - Link to v1: https://lore.kernel.org/r/20250925-drm-bridge-alloc-getput-bridge-connector-v1-0-f0736e1c73ee@bootlin.com
> ---
>   drivers/gpu/drm/display/drm_bridge_connector.c | 114 +++++++++++++++++--------
>   1 file changed, 78 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index a5bdd6c1064399ece6b19560f145b877c9e0680e..7b18be3ff9a32b362468351835bdab43c3f524f1 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -618,6 +618,20 @@ static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_f
>    * Bridge Connector Initialisation
>    */
>   
> +static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
> +{
> +	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
> +
> +	drm_bridge_put(bridge_connector->bridge_edid);
> +	drm_bridge_put(bridge_connector->bridge_hpd);
> +	drm_bridge_put(bridge_connector->bridge_detect);
> +	drm_bridge_put(bridge_connector->bridge_modes);
> +	drm_bridge_put(bridge_connector->bridge_hdmi);
> +	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
> +	drm_bridge_put(bridge_connector->bridge_dp_audio);
> +	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
> +}
> +
>   /**
>    * drm_bridge_connector_init - Initialise a connector for a chain of bridges
>    * @drm: the DRM device
> @@ -638,7 +652,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	struct drm_bridge_connector *bridge_connector;
>   	struct drm_connector *connector;
>   	struct i2c_adapter *ddc = NULL;
> -	struct drm_bridge *panel_bridge = NULL;
> +	struct drm_bridge *panel_bridge      __free(drm_bridge_put) = NULL;
> +	struct drm_bridge *bridge_edid       __free(drm_bridge_put) = NULL;
> +	struct drm_bridge *bridge_hpd        __free(drm_bridge_put) = NULL;
> +	struct drm_bridge *bridge_detect     __free(drm_bridge_put) = NULL;
> +	struct drm_bridge *bridge_modes      __free(drm_bridge_put) = NULL;
> +	struct drm_bridge *bridge_hdmi       __free(drm_bridge_put) = NULL;
> +	struct drm_bridge *bridge_hdmi_audio __free(drm_bridge_put) = NULL;
> +	struct drm_bridge *bridge_dp_audio   __free(drm_bridge_put) = NULL;
> +	struct drm_bridge *bridge_hdmi_cec   __free(drm_bridge_put) = NULL;
>   	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
>   	unsigned int max_bpc = 8;
>   	bool support_hdcp = false;
> @@ -649,6 +671,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	if (!bridge_connector)
>   		return ERR_PTR(-ENOMEM);
>   
> +	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	bridge_connector->encoder = encoder;
>   
>   	/*
> @@ -672,22 +698,30 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   		if (!bridge->ycbcr_420_allowed)
>   			connector->ycbcr_420_allowed = false;
>   
> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -			bridge_connector->bridge_edid = bridge;
> -		if (bridge->ops & DRM_BRIDGE_OP_HPD)
> -			bridge_connector->bridge_hpd = bridge;
> -		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> -			bridge_connector->bridge_detect = bridge;
> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -			bridge_connector->bridge_modes = bridge;
> +		if (bridge->ops & DRM_BRIDGE_OP_EDID) {
> +			drm_bridge_put(bridge_edid);
> +			bridge_edid = drm_bridge_get(bridge);
> +		}
> +		if (bridge->ops & DRM_BRIDGE_OP_HPD) {
> +			drm_bridge_put(bridge_hpd);
> +			bridge_hpd = drm_bridge_get(bridge);
> +		}
> +		if (bridge->ops & DRM_BRIDGE_OP_DETECT) {
> +			drm_bridge_put(bridge_detect);
> +			bridge_detect = drm_bridge_get(bridge);
> +		}
> +		if (bridge->ops & DRM_BRIDGE_OP_MODES) {
> +			drm_bridge_put(bridge_modes);
> +			bridge_modes = drm_bridge_get(bridge);
> +		}
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
> -			if (bridge_connector->bridge_hdmi)
> +			if (bridge_hdmi)
>   				return ERR_PTR(-EBUSY);
>   			if (!bridge->funcs->hdmi_write_infoframe ||
>   			    !bridge->funcs->hdmi_clear_infoframe)
>   				return ERR_PTR(-EINVAL);
>   
> -			bridge_connector->bridge_hdmi = bridge;
> +			bridge_hdmi = drm_bridge_get(bridge);
>   
>   			if (bridge->supported_formats)
>   				supported_formats = bridge->supported_formats;
> @@ -696,10 +730,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
> -			if (bridge_connector->bridge_hdmi_audio)
> +			if (bridge_hdmi_audio)
>   				return ERR_PTR(-EBUSY);
>   
> -			if (bridge_connector->bridge_dp_audio)
> +			if (bridge_dp_audio)
>   				return ERR_PTR(-EBUSY);
>   
>   			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> @@ -710,14 +744,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			    !bridge->funcs->hdmi_audio_shutdown)
>   				return ERR_PTR(-EINVAL);
>   
> -			bridge_connector->bridge_hdmi_audio = bridge;
> +			bridge_hdmi_audio = drm_bridge_get(bridge);
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_DP_AUDIO) {
> -			if (bridge_connector->bridge_dp_audio)
> +			if (bridge_dp_audio)
>   				return ERR_PTR(-EBUSY);
>   
> -			if (bridge_connector->bridge_hdmi_audio)
> +			if (bridge_hdmi_audio)
>   				return ERR_PTR(-EBUSY);
>   
>   			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> @@ -728,7 +762,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			    !bridge->funcs->dp_audio_shutdown)
>   				return ERR_PTR(-EINVAL);
>   
> -			bridge_connector->bridge_dp_audio = bridge;
> +			bridge_dp_audio = drm_bridge_get(bridge);
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
> @@ -739,10 +773,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
> -			if (bridge_connector->bridge_hdmi_cec)
> +			if (bridge_hdmi_cec)
>   				return ERR_PTR(-EBUSY);
>   
> -			bridge_connector->bridge_hdmi_cec = bridge;
> +			bridge_hdmi_cec = drm_bridge_get(bridge);
>   
>   			if (!bridge->funcs->hdmi_cec_enable ||
>   			    !bridge->funcs->hdmi_cec_log_addr ||
> @@ -762,7 +796,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			ddc = bridge->ddc;
>   
>   		if (drm_bridge_is_panel(bridge))
> -			panel_bridge = bridge;
> +			panel_bridge = drm_bridge_get(bridge);
>   
>   		if (bridge->support_hdcp)
>   			support_hdcp = true;
> @@ -771,13 +805,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (bridge_connector->bridge_hdmi) {
> +	if (bridge_hdmi) {
>   		if (!connector->ycbcr_420_allowed)
>   			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
>   
>   		ret = drmm_connector_hdmi_init(drm, connector,
> -					       bridge_connector->bridge_hdmi->vendor,
> -					       bridge_connector->bridge_hdmi->product,
> +					       bridge_hdmi->vendor,
> +					       bridge_hdmi->product,
>   					       &drm_bridge_connector_funcs,
>   					       &drm_bridge_connector_hdmi_funcs,
>   					       connector_type, ddc,
> @@ -793,15 +827,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			return ERR_PTR(ret);
>   	}
>   
> -	if (bridge_connector->bridge_hdmi_audio ||
> -	    bridge_connector->bridge_dp_audio) {
> +	if (bridge_hdmi_audio || bridge_dp_audio) {
>   		struct device *dev;
>   		struct drm_bridge *bridge;
>   
> -		if (bridge_connector->bridge_hdmi_audio)
> -			bridge = bridge_connector->bridge_hdmi_audio;
> +		if (bridge_hdmi_audio)
> +			bridge = bridge_hdmi_audio;
>   		else
> -			bridge = bridge_connector->bridge_dp_audio;
> +			bridge = bridge_dp_audio;
>   
>   		dev = bridge->hdmi_audio_dev;
>   
> @@ -815,9 +848,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			return ERR_PTR(ret);
>   	}
>   
> -	if (bridge_connector->bridge_hdmi_cec &&
> -	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
> -		struct drm_bridge *bridge = bridge_connector->bridge_hdmi_cec;
> +	if (bridge_hdmi_cec &&
> +	    bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
> +		struct drm_bridge *bridge = bridge_hdmi_cec;
>   
>   		ret = drmm_connector_hdmi_cec_notifier_register(connector,
>   								NULL,
> @@ -826,9 +859,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			return ERR_PTR(ret);
>   	}
>   
> -	if (bridge_connector->bridge_hdmi_cec &&
> -	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
> -		struct drm_bridge *bridge = bridge_connector->bridge_hdmi_cec;
> +	if (bridge_hdmi_cec &&
> +	    bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
> +		struct drm_bridge *bridge = bridge_hdmi_cec;
>   
>   		ret = drmm_connector_hdmi_cec_register(connector,
>   						       &drm_bridge_connector_hdmi_cec_funcs,
> @@ -841,9 +874,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   
>   	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
>   
> -	if (bridge_connector->bridge_hpd)
> +	if (bridge_hpd)
>   		connector->polled = DRM_CONNECTOR_POLL_HPD;
> -	else if (bridge_connector->bridge_detect)
> +	else if (bridge_detect)
>   		connector->polled = DRM_CONNECTOR_POLL_CONNECT
>   				  | DRM_CONNECTOR_POLL_DISCONNECT;
>   
> @@ -854,6 +887,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	    IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
>   		drm_connector_attach_content_protection_property(connector, true);
>   
> +	bridge_connector->bridge_edid       = drm_bridge_get(bridge_edid);
> +	bridge_connector->bridge_hpd        = drm_bridge_get(bridge_hpd);
> +	bridge_connector->bridge_detect     = drm_bridge_get(bridge_detect);
> +	bridge_connector->bridge_modes      = drm_bridge_get(bridge_modes);
> +	bridge_connector->bridge_hdmi       = drm_bridge_get(bridge_hdmi);
> +	bridge_connector->bridge_hdmi_audio = drm_bridge_get(bridge_hdmi_audio);
> +	bridge_connector->bridge_dp_audio   = drm_bridge_get(bridge_dp_audio);
> +	bridge_connector->bridge_hdmi_cec   = drm_bridge_get(bridge_hdmi_cec);
> +
>   	return connector;
>   }
>   EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
>
> ---
> base-commit: 063db451832b8849faf1b0b8404b3a6a39995b29
> change-id: 20250925-drm-bridge-alloc-getput-bridge-connector-556f8dc14af4
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

