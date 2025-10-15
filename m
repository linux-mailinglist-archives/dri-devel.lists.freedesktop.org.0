Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A8FBE0949
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 22:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F120310E8D8;
	Wed, 15 Oct 2025 20:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TOu9DTL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039B110E8D8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 20:09:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 765E31A13DD;
 Wed, 15 Oct 2025 20:09:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3A4E660673;
 Wed, 15 Oct 2025 20:09:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB584102F22E1; 
 Wed, 15 Oct 2025 22:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760558960; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qvamg92yY+Cln5Bdf/HdLAJCwnNFOVVJbhQMKT2qyig=;
 b=TOu9DTL8PSkrbLKe7Lxkh4xe+uusSXKXVy9xVsoDz5z0KBllXdstSaCuv9g0QRnnt3S502
 LLHRaoHlk1bHK69ba6M4KU1lGuJrARmohnXcNINkTfa52MdOBClX09/6usXQ90vAet5FQY
 D2h3EFodV+tFi7nkpuidzzn7jSyt6SEsEOpc1zkpkUXVbjN1MYuccC0AdhoLHng1UbyHK6
 YN5bNBrB/mB8sGt2LeDXpRr3oYf2nWszysuvMLktKzN7b8t2KJ0AWfk0cqxmJPSmxxZ4mI
 AiyayBX4b5gcC2VQtAMbnbW6/WMyS9Uph/UwS6Ck70lKVJdGiBRbrs7evoYRiw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Oct 2025 22:08:59 +0200
Message-Id: <DDJ623AGI83R.ESC0V9XXWXFN@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/display: bridge_connector: get/put the stored
 bridges
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1
References: <20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com>
 <CGME20251015082254eucas1p23fc961e7a49f4a29ca7a18d3e2817f86@eucas1p2.samsung.com>
 <336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com>
In-Reply-To: <336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Marek,

On Wed Oct 15, 2025 at 10:22 AM CEST, Marek Szyprowski wrote:
> Hi Luca,
>
> On 26.09.2025 16:59, Luca Ceresoli wrote:
>> drm_bridge_connector_init() takes eight pointers to various bridges, som=
e
>> of which can be identical, and stores them in pointers inside struct
>> drm_bridge_connector. Get a reference to each of the taken bridges and p=
ut
>> it on cleanup.
>>
>> This is tricky because the pointers are currently stored directly in the
>> drm_bridge_connector in the loop, but there is no nice and clean way to =
put
>> those pointers on error return paths. To overcome this, store all pointe=
rs
>> in temporary local variables with a cleanup action, and only on success
>> copy them into struct drm_bridge_connector (getting another ref while
>> copying).
>>
>> Additionally four of these pointers (edid, hpd, detect and modes) can be
>> written in multiple loop iterations, in order to eventually store the la=
st
>> matching bridge. However, when one of those pointers is overwritten, we
>> need to put the reference that we got during the previous assignment. Ad=
d a
>> drm_bridge_put() before writing them to handle this.
>>
>> Finally, there is also a function-local panel_bridge pointer taken insid=
e
>> the loop and used after the loop. Use a cleanup action as well to ensure=
 it
>> is put on return.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> This patch landed recently in linux-next as commit 2be300f9a0b6
> ("drm/display: bridge_connector: get/put the stored bridges"). In my
> tests I found that it causes the following NULL pointer dereference on
> DragonBoard410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts):
>
> --->8---
>
>  =C2=A0msm_mdp 1a01000.display-controller: bound 1c00000.gpu (ops a3xx_op=
s [msm])
>  =C2=A0msm_mdp 1a01000.display-controller: [drm:mdp5_kms_init [msm]] MDP5
> version v1.6
>  =C2=A0msm_mdp 1a01000.display-controller: fall back to the other CTL
> category for INTF 1!
>  =C2=A0Unable to handle kernel NULL pointer dereference at virtual addres=
s
> 0000000000000110
>  =C2=A0...
>  =C2=A0Internal error: Oops: 0000000096000004 [#1]=C2=A0 SMP
>  =C2=A0Modules linked in: qcom_wcnss_pil(+) cpufreq_powersave
> cpufreq_conservative coresight_stm stm_core coresight_replicator
> coresight_cpu_debug coresight_funnel coresight_tmc coresight_cti
> coresight_tpiu adv7511 nfc coresight rfkill msm snd_soc_lpass_apq8016
> snd_soc_lpass_cpu snd_soc_apq8016_sbc snd_soc_msm8916_digital
> snd_soc_msm8916_analog snd_soc_lpass_platform snd_soc_qcom_common
> snd_soc_core qrtr snd_compress snd_pcm_dmaengine qcom_camss
> qcom_spmi_temp_alarm snd_pcm qcom_q6v5_mss qcom_pil_info ubwc_config
> qcom_q6v5 videobuf2_dma_sg llcc_qcom v4l2_fwnode rtc_pm8xxx ocmem
> venus_core v4l2_async qcom_sysmon qcom_common qcom_spmi_vadc drm_gpuvm
> qcom_vadc_common qcom_pon v4l2_mem2mem snd_timer drm_exec
> videobuf2_memops gpu_sched videobuf2_v4l2 snd qcom_glink_smem
> drm_dp_aux_bus videodev soundcore mdt_loader qmi_helpers
> drm_display_helper qnoc_msm8916 videobuf2_common qcom_stats mc qcom_rng
> rpmsg_ctrl rpmsg_char ramoops reed_solomon display_connector socinfo
> rmtfs_mem ax88796b asix usbnet phy_qcom_usb_hs ipv6
>  =C2=A0CPU: 2 UID: 0 PID: 42 Comm: kworker/u16:1 Tainted: G W
> 6.17.0-rc6+ #16051 PREEMPT
>  =C2=A0Tainted: [W]=3DWARN
>  =C2=A0Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
>  =C2=A0Workqueue: events_unbound deferred_probe_work_func
>  =C2=A0pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>  =C2=A0pc : drm_bridge_connector_hdmi_cec_init+0x8/0x38 [drm_display_help=
er]
>  =C2=A0lr : drmm_connector_hdmi_cec_register+0xf8/0x1c8 [drm_display_help=
er]
>  =C2=A0sp : ffff8000843d3560
>  =C2=A0x29: ffff8000843d3560 x28: 0000000000000000 x27: 0000000000000000
>  =C2=A0x26: ffff000010c14400 x25: ffff00000c034b68 x24: ffff00003b82a020
>  =C2=A0x23: ffff00000c030000 x22: ffff0000097bf7d0 x21: ffff0000042e6a60
>  =C2=A0x20: ffff80007c162af8 x19: ffff00000c034080 x18: 00000000ffffffff
>  =C2=A0x5 : 00000000000007ff x4 : ffff800083cc5c50 x3 : 0000000000000000
>  =C2=A0x2 : 0000000000000000 x1 : ffff00000c034080 x0 : 0000000000000000
>  =C2=A0Call trace:
>  =C2=A0 drm_bridge_connector_hdmi_cec_init+0x8/0x38 [drm_display_helper] =
(P)
>  =C2=A0 drm_bridge_connector_init+0x6b4/0x6d4 [drm_display_helper]
>  =C2=A0 msm_dsi_manager_connector_init+0x9c/0xf0 [msm]
>  =C2=A0 msm_dsi_modeset_init+0x60/0xe8 [msm]
>  =C2=A0 modeset_init+0x3c4/0x4c0 [msm]
>  =C2=A0 mdp5_kms_init+0x3cc/0x670 [msm]
>  =C2=A0 msm_drm_kms_init+0x40/0x33c [msm]
>  =C2=A0 msm_drm_init+0x1c4/0x284 [msm]
>  =C2=A0 msm_drm_bind+0x30/0x3c [msm]
>  =C2=A0 try_to_bring_up_aggregate_device+0x168/0x1d4
>  =C2=A0 __component_add+0xa8/0x170
>  =C2=A0 component_add+0x14/0x20
>  =C2=A0 dsi_dev_attach+0x20/0x2c [msm]
>  =C2=A0 dsi_host_attach+0x58/0x98 [msm]
>  =C2=A0 devm_mipi_dsi_attach+0x34/0x90
>  =C2=A0 adv7533_attach_dsi+0x8c/0x104 [adv7511]
>  =C2=A0 adv7511_probe+0x764/0x988 [adv7511]
>  =C2=A0 i2c_device_probe+0x154/0x350
>  =C2=A0 really_probe+0xbc/0x298
>  =C2=A0 __driver_probe_device+0x78/0x12c
>  =C2=A0 driver_probe_device+0xdc/0x164
>  =C2=A0 __device_attach_driver+0xb8/0x138
>  =C2=A0 bus_for_each_drv+0x80/0xdc
>  =C2=A0 __device_attach+0xa8/0x1b0
>  =C2=A0 device_initial_probe+0x14/0x20
>  =C2=A0 bus_probe_device+0xb0/0xb4
>  =C2=A0 deferred_probe_work_func+0x8c/0xc8
>  =C2=A0 process_one_work+0x208/0x60c
>  =C2=A0 worker_thread+0x244/0x388
>  =C2=A0 kthread+0x150/0x228
>  =C2=A0 ret_from_fork+0x10/0x20
>  =C2=A0Code: d50323bf d65f03c0 aa0003e1 f945e400 (f9408802)
>  =C2=A0---[ end trace 0000000000000000 ]---

Thanks for testing and reporting.

I'm afraid I have no hardware where the same bug can be reproduced, but by
code inspection the root cause is clear given the call chain:

  drm_bridge_connector_init() [1]
   -> drmm_connector_hdmi_cec_register() [2]
       -> funcs->init() =3D drm_bridge_connector_hdmi_cec_init() [3]

[1] used to set bridge_connector->bridge_hdmi_cec before calling [2], now
it does it afterwards. But [3] expects it to be set already.

I have overlooked this when writing the patch. My apologies.

> This can be easily fixed by adding the following check:
>
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c
> b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 7b18be3ff9a3..222ecbc98155 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -601,7 +601,7 @@ static int drm_bridge_connector_hdmi_cec_init(struct
> drm_connector *connector)
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge =3D bridge_connector->=
bridge_hdmi_cec;
>
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!bridge->funcs->hdmi_cec_init)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!bridge || !bridge->funcs->hdmi=
_cec_init)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return 0;
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return bridge->funcs->hdmi_ce=
c_init(bridge, connector);
>
>
> However I don't know the internals of the related code to judge that
> such check is the proper way to fix this issue.

I'm afraid this is not a correct solution. When this function is called,
the bridge_hdmi_cec is already known, but (after my patch) not yet set
where it is expected to be. So skipping the bridge->funcs->hdmi_cec_init()
call would make the code behave differently for no good reason.

I'm looking at how to properly fix this bug ASAP.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
