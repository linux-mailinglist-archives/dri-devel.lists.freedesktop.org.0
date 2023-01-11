Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93441665BA2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 13:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B6310E718;
	Wed, 11 Jan 2023 12:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6D310E718
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 12:41:43 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230111124141euoutp01ec7291276a732b0e51a97c891a7baeef~5QaImkbza2080120801euoutp019
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 12:41:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230111124141euoutp01ec7291276a732b0e51a97c891a7baeef~5QaImkbza2080120801euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673440901;
 bh=hdgkIvejhIrF4yWA4aPn/rz4dltgsaxZqC/WjJ7o7fw=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=PDaQZ6xTbRt899RN9q1Igf3pkYYlQ631ITkq3zL60SgQ5mPZGnZUngzRu5SkliNcs
 db2kZA2oOwgq0R8vvJmrHLh/9BX2WecCStG5mVLexijTr25P14xBDB2M1LgwpgRC8E
 30kOlJgNgl8qkdSVJoHIfHoVShk2LWDdsWyJA+s0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230111124140eucas1p1607c37c71cbd213d6f1431644f25453d~5QaIWFvyc3134831348eucas1p1Z;
 Wed, 11 Jan 2023 12:41:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AC.B3.43884.48EAEB36; Wed, 11
 Jan 2023 12:41:40 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee~5QaH7g4GD3198431984eucas1p2f;
 Wed, 11 Jan 2023 12:41:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230111124140eusmtrp233472597c70c70fd0375071d9bc84eaf~5QaH6k3rm0900909009eusmtrp2G;
 Wed, 11 Jan 2023 12:41:40 +0000 (GMT)
X-AuditID: cbfec7f5-25bff7000000ab6c-22-63beae84bc1d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 07.0E.52424.48EAEB36; Wed, 11
 Jan 2023 12:41:40 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230111124139eusmtip21c777cf91ad2b98e1fe31db33bfe4cf5~5QaG0gXYR1260312603eusmtip2E;
 Wed, 11 Jan 2023 12:41:39 +0000 (GMT)
Message-ID: <a3f59ce3-8426-2af0-4663-ee948490d75c@samsung.com>
Date: Wed, 11 Jan 2023 13:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [v3,3/7] drm/bridge_connector: rely on drm_kms_helper_poll_*
 for HPD enablement
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Laurentiu Palcu
 <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Philipp
 Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Tomi Valkeinen
 <tomba@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20221102180705.459294-4-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTdRj3u/fdu7Hc7mVa+56R2lKPfvDroO57R8dFct1bp6ZWt8LO2o23
 gRtsbPzWIzoB3bRkcgaMZKMDRSrUCejYzMaGU7wNEjHZiZCuI0wgdCQMyNxeK/77PJ/n8zyf
 53nu4WLCamIVNysnj9bkSJVigod3XpzzxpS3/SiLN9kS0aVfvmWhR50GDBn65gh0bWaKQL8O
 vou+GfMA1HrEiqPRo0MsZJ2x48hc/xSy3LnORoYLHg7SB09gqHG6A0eVumNsNGX1ATR86xKO
 7jmq2GiscRZDi2ctOBqudgH0e7sITQ61YKj9noH9BqTO/2XGKatxmENZWnUEdfO6naAaLm+j
 Rg64WdSZps+p05PnWNRtlw2nDi3GU+4uH4cy2EupM1d2Uw8sq7cK0nmvZ9DKrAJaE5fyKS/T
 ZasE6qbXilzfv1wG5mL1gMuFZBI8/51ED3hcIdkCYFdwgMUEAQDt1gCbCR4A2FlxitCDiHCF
 q1nHCWEheRxAc/VqBk8D6KmXhLryyRRoHQEhGifXQ+etC2E5n4yEl+v8eEjyNJkBLQsFIXoF
 uRP2XfSH5Rgpgj6/iRXCK8m9BPSN7wqNgJGnANSNd4UTBJkA9RN6ItQngnwTOmrWM7Vr4N6O
 eiykh2QdD873TT4ZOQ3O72tiM3gFvOtu5zA4Cj6ymlhMwb7Hq8yPPAmqACwb8wFGlQxveoNh
 N4x8EZ7simPoVNi/6CeYKwrgjYlIZggBPNxZgzE0H+6vFDLqDdDobvvP1tF/FasCYuOSqxiX
 rG9cso7xf18zwFuBiM7XZstpbWIOXRirlWZr83PksTJVtgU8/tsrf7tnzoGWu9Ox3YDFBd0A
 cjHxSv6JCLtMyM+QFpfQGtUnmnwlre0Gz3JxsYhf22GSCUm5NI9W0LSa1vybZXEjVpWxDipi
 PiiXS4IfOXprRXF/CGVJR4r9kYU3NhUG4hMqejzFC9FRadHjrygG8f3lP1BtcmV52qZcc3fD
 Mb7gy/Te+A2WzzbeXhe1Tls03S+71tazO71B2jysWLbt7M+7Btaoo1S5X+xZW/b1T+7Nyp3z
 b0FBQV3KaKzlQLYtN7lmh2fIW6CIUd15Z+0zW9SW1MSFLm/1bElA/BzIWt449L5Lbctkq/90
 3g8MRFeUBveYr25ULRwik18ofqh7j+ckbJKpnlHvh1+dPOxYPsArEW4XFqUu22rKOz54ujmf
 7J39rdYo+HjLZonjeUly3I6370/pD77a4CztSXKq9KMC58TDjBSdGNdmShNewjRa6T+cInHY
 JgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsVy+t/xe7ot6/YlG7ztk7Q4cX0Rk8X/bROZ
 LSae/8lmceXrezaLh1f9LeY8P8tosWrqThaLB3NvMlns/LqHxWLBbG6LTY+vsVpM3H+W3aLr
 10pmi4Uft7JYtHUuY7V4v/MWo8XdeydYLN4cnMBq8XzhD2aLv9s3sVjcnXyE0eLFFnGLdzdX
 MFtseTOR1UHCY++3BSweO2fdZffYtKqTzePOtT1sHvNOBnrc7z7O5LF5Sb3Hxnc7mDweHdnN
 4tH/18Dj+K5b7B4T99R5bD5d7fF5k1wAX5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6h
 sXmslZGpkr6dTUpqTmZZapG+XYJexpHdbYwFS8wqjqzRbmD8qdfFyMkhIWAicWRpJ3sXIxeH
 kMBSRonfE4+wQiRkJE5Oa4CyhSX+XOtigyh6zyix4/UPoA4ODl4BO4md9xlBalgEVCUO39vP
 DmLzCghKnJz5hAXEFhVIkWh+fhJsjrBAnMTJH5vB4swC4hK3nsxnApkpItDOJjH/7UxWEIdZ
 YAOjxLnV35hAqoQEHCUeTl3HDGKzCRhKdL0FuYKDg1PASeLgdFWIQWYSXVu7GCFseYnmrbOZ
 JzAKzUJyxywk+2YhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwDSz7djPLTsY
 V776qHeIkYmD8RCjBAezkgjvSs49yUK8KYmVValF+fFFpTmpxYcYTYGBMZFZSjQ5H5jo8kri
 Dc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUamBTYjJ6en77j+N2m+Q4v
 TPmLy19o9G3KfuS+d25Y9B+G/iTbWaxTllYvcVBO82JS3Bj043j3IxOO19W9l7bcUV9XyaDk
 ePycnMAb3S1VHO8FdfdnWLSwXU7xZYv9NzXt7GzWS1aP2CIVLwqfFb2+9p6L4UqGv8G5S200
 LHenHzlyxeREsW2hyraggjqNs5FTODj0mdnmZu05uTHp6WGerqBjpf0L3LQf3vj9w5LtS/UL
 5oliZ3Vcnn3hDvz7LUNA8ULBtfOqB369e+Nrs+mQ7bv4JMVDNxap308L9EoLX2LBpfJcUJ8x
 ndnE+O2R1hCFW3wz1msvubTF5mGxxlLVOzoMK5WmhQuyHY+8v79IUImlOCPRUIu5qDgRAIdh
 G5O8AwAA
X-CMS-MailID: 20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee
References: <20221102180705.459294-4-dmitry.baryshkov@linaro.org>
 <CGME20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee@eucas1p2.samsung.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.11.2022 19:07, Dmitry Baryshkov wrote:
> Use drm_connector's helpers enable_hpd and disable_hpd to enable and
> disable HPD automatically by the means of drm_kms_helper_poll_*
> functions. As the drm_bridge_connector_enable_hpd() and
> drm_bridge_connector_disable_hpd() functions are now unused, replace
> them with stubs to ease driver migration.
>
> Enabling the HPD from drm_bridge_connector_init() can happen too early,
> before the driver is prepared to handle HPD events. As the
> drm_bridge_connector_enable_hpd() is empty anyway, drop this call
> anyway.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

This patch, merged to recent linux-next as commit 92d755d8f13b 
("drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD 
enablement"), triggers the following warning on all my Amlogic Meson 
based boards:

------------[ cut here ]------------
Hot plug detection already enabled
WARNING: CPU: 2 PID: 285 at drivers/gpu/drm/drm_bridge.c:1257 
drm_bridge_hpd_enable+0x90/0xa0
Modules linked in: snd_soc_meson_axg_frddr snd_soc_meson_axg_fifo 
dwmac_generic panfrost(+) reset_meson_audio_arb(+) drm_shmem_helper 
meson_dw_hdmi(+) dw_hdmi rc_odroid drm_display_helper meson_ir(+) 
gpu_sched meson_rng rng_core meson_gxbb_wdt crct10dif_ce dwmac_meson8b 
stmmac_platform snd_soc_meson_axg_sound_card snd_soc_meson_card_utils 
mdio_mux_meson_g12a stmmac meson_drm pwm_meson pcs_xpcs meson_canvas 
snd_soc_meson_axg_tdm_interface rtc_meson_vrtc 
snd_soc_meson_axg_tdm_formatter nvmem_meson_efuse display_connector
CPU: 2 PID: 285 Comm: systemd-udevd Not tainted 6.1.0-rc6+ #13236
Hardware name: Hardkernel ODROID-C4 (DT)
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : drm_bridge_hpd_enable+0x90/0xa0
lr : drm_bridge_hpd_enable+0x90/0xa0
...
Call trace:
  drm_bridge_hpd_enable+0x90/0xa0
  _drm_bridge_connector_enable_hpd+0x24/0x34
  drm_kms_helper_poll_enable.part.0+0x50/0xd0
  drm_helper_probe_single_connector_modes+0x400/0x530
  drm_client_modeset_probe+0x1ec/0xba0
  __drm_fb_helper_initial_config_and_unlock+0x4c/0x630
  drm_fb_helper_initial_config+0x50/0x60
  drm_fbdev_client_hotplug+0xc4/0x150
  drm_fbdev_generic_setup+0x88/0x150
  meson_drv_bind_master+0x3d4/0x4a0 [meson_drm]
  meson_drv_bind+0x14/0x20 [meson_drm]
  try_to_bring_up_aggregate_device+0x164/0x1d0
  __component_add+0xa8/0x174
  component_add+0x14/0x20
  meson_dw_hdmi_probe+0x1c/0x30 [meson_dw_hdmi]
  platform_probe+0x68/0xe0
  really_probe+0xbc/0x2e0
  __driver_probe_device+0x78/0xe0
  driver_probe_device+0x3c/0x160
  __driver_attach+0x88/0x1a0
  bus_for_each_dev+0x70/0xd0
  driver_attach+0x24/0x30
  bus_add_driver+0x154/0x204
  driver_register+0x78/0x130
  __platform_driver_register+0x28/0x34
  meson_dw_hdmi_platform_driver_init+0x24/0x1000 [meson_dw_hdmi]
  do_one_initcall+0x74/0x400
  do_init_module+0x48/0x1d4
  load_module+0x1818/0x1de0
  __do_sys_finit_module+0xc0/0x114
  __arm64_sys_finit_module+0x20/0x30
  invoke_syscall+0x48/0x114
  el0_svc_common.constprop.0+0x60/0x11c
  do_el0_svc_compat+0x1c/0x40
  el0_svc_compat+0x48/0xc0
  el0t_32_sync_handler+0x90/0x140
  el0t_32_sync+0x190/0x194
irq event stamp: 17422
hardirqs last  enabled at (17421): [<ffff800009196058>] 
__schedule+0x998/0xa14
hardirqs last disabled at (17422): [<ffff80000918e4a4>] el1_dbg+0x24/0x90
softirqs last  enabled at (17404): [<ffff80000801046c>] _stext+0x46c/0x5d8
softirqs last disabled at (17383): [<ffff8000080166d0>] 
____do_softirq+0x10/0x20
---[ end trace 0000000000000000 ]---

I looks that this change requires some additional changes/fixes in the 
drivers/gpu/drm/meson/meson_dw_hdmi.c


>   drivers/gpu/drm/drm_bridge_connector.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 1c7d936523df..0e13bc87a6ac 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -136,6 +136,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
>    * This is typically used by display drivers in their resume handler.
>    */
>   void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
> +{
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
> +
> +static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
>   {
>   	struct drm_bridge_connector *bridge_connector =
>   		to_drm_bridge_connector(connector);
> @@ -145,7 +150,6 @@ void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
>   		drm_bridge_hpd_enable(hpd, drm_bridge_connector_hpd_cb,
>   				      bridge_connector);
>   }
> -EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
>   
>   /**
>    * drm_bridge_connector_disable_hpd - Disable hot-plug detection for the
> @@ -156,6 +160,11 @@ EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
>    * This is typically used by display drivers in their suspend handler.
>    */
>   void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
> +{
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
> +
> +static void _drm_bridge_connector_disable_hpd(struct drm_connector *connector)
>   {
>   	struct drm_bridge_connector *bridge_connector =
>   		to_drm_bridge_connector(connector);
> @@ -164,7 +173,6 @@ void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
>   	if (hpd)
>   		drm_bridge_hpd_disable(hpd);
>   }
> -EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
>   
>   /* -----------------------------------------------------------------------------
>    * Bridge Connector Functions
> @@ -305,6 +313,8 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
>   static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
>   	.get_modes = drm_bridge_connector_get_modes,
>   	/* No need for .mode_valid(), the bridges are checked by the core. */
> +	.enable_hpd = _drm_bridge_connector_enable_hpd,
> +	.disable_hpd = _drm_bridge_connector_disable_hpd,
>   };
>   
>   /* -----------------------------------------------------------------------------
> @@ -387,10 +397,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   				    connector_type, ddc);
>   	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
>   
> -	if (bridge_connector->bridge_hpd) {
> +	if (bridge_connector->bridge_hpd)
>   		connector->polled = DRM_CONNECTOR_POLL_HPD;
> -		drm_bridge_connector_enable_hpd(connector);
> -	}
>   	else if (bridge_connector->bridge_detect)
>   		connector->polled = DRM_CONNECTOR_POLL_CONNECT
>   				  | DRM_CONNECTOR_POLL_DISCONNECT;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

