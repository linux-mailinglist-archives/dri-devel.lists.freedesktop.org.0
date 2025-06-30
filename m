Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3ACAEDA2B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F66110E40B;
	Mon, 30 Jun 2025 10:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="C1p/Dblg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3FB10E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BVaBcQr9EzIh6LRB1ICsLnNLx7oOkAXVTeIQ2p5ofoo=; b=C1p/Dblg19t0+M87Zlm9tEMye8
 z8LJnnWu8ZAe26eQ3TONvkyp+enFob0wPXgeFl1+k6nxfzAtzGWnTzQx+ASjuiZ+xOvNpmyEdCn1x
 nDLglRgq+KqaT7CaSzUN1a+sjS0y+wc/yu2zdO7fxA5VBzefLU0GecLktht+wCeNELsiv+i+kD6j2
 6WMjlKNNdLuWTc01MGt9c3Xr6rchvZxkUA3/u0tZryHWN1berhXUj88/1T1uJgiv7Z7eT024BmYGY
 wPDsm9e6DAGWq6sE8e5FB81oQZPMJQIyodoixMsKzEQw4DK+SSJ4z07yloWJ87d54Sl8TIMCOzBS6
 Elqk7WZQ==;
Received: from 80.174.120.123.dyn.user.ono.com ([80.174.120.123]
 helo=[192.168.0.17]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uWC03-00ARAx-Di; Mon, 30 Jun 2025 12:44:35 +0200
Message-ID: <dbd7db39a4995485ebe5c90f128a66058ff44c20.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Disable interrupts before resetting the GPU
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, "Juan A ." =?ISO-8859-1?Q?Su=E1rez?=
 <jasuarez@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 stable@vger.kernel.org
Date: Mon, 30 Jun 2025 12:44:24 +0200
In-Reply-To: <20250628224243.47599-1-mcanal@igalia.com>
References: <20250628224243.47599-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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

Good catch!

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El s=C3=A1b, 28-06-2025 a las 19:42 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> Currently, an interrupt can be triggered during a GPU reset, which
> can
> lead to GPU hangs and NULL pointer dereference in an interrupt
> context
> as shown in the following trace:
>=20
> =C2=A0[=C2=A0 314.035040] Unable to handle kernel NULL pointer dereferenc=
e at
> virtual address 00000000000000c0
> =C2=A0[=C2=A0 314.043822] Mem abort info:
> =C2=A0[=C2=A0 314.046606]=C2=A0=C2=A0 ESR =3D 0x0000000096000005
> =C2=A0[=C2=A0 314.050347]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =
=3D 32 bits
> =C2=A0[=C2=A0 314.055651]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> =C2=A0[=C2=A0 314.058695]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> =C2=A0[=C2=A0 314.061826]=C2=A0=C2=A0 FSC =3D 0x05: level 1 translation f=
ault
> =C2=A0[=C2=A0 314.066694] Data abort info:
> =C2=A0[=C2=A0 314.069564]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000005, ISS2=
 =3D 0x00000000
> =C2=A0[=C2=A0 314.075039]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, Tag=
Access =3D 0
> =C2=A0[=C2=A0 314.080080]=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =
=3D 0, Xs =3D 0
> =C2=A0[=C2=A0 314.085382] user pgtable: 4k pages, 39-bit VAs,
> pgdp=3D0000000102728000
> =C2=A0[=C2=A0 314.091814] [00000000000000c0] pgd=3D0000000000000000,
> p4d=3D0000000000000000, pud=3D0000000000000000
> =C2=A0[=C2=A0 314.100511] Internal error: Oops: 0000000096000005 [#1] PRE=
EMPT
> SMP
> =C2=A0[=C2=A0 314.106770] Modules linked in: v3d i2c_brcmstb vc4
> snd_soc_hdmi_codec gpu_sched drm_shmem_helper drm_display_helper cec
> drm_dma_helper drm_kms_helper drm drm_panel_orientation_quirks
> snd_soc_core snd_compress snd_pcm_dmaengine snd_pcm snd_timer snd
> backlight
> =C2=A0[=C2=A0 314.129654] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainte=
d
> 6.12.25+rpt-rpi-v8 #1=C2=A0 Debian 1:6.12.25-1+rpt1
> =C2=A0[=C2=A0 314.139388] Hardware name: Raspberry Pi 4 Model B Rev 1.4 (=
DT)
> =C2=A0[=C2=A0 314.145211] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT=
 -SSBS
> BTYPE=3D--)
> =C2=A0[=C2=A0 314.152165] pc : v3d_irq+0xec/0x2e0 [v3d]
> =C2=A0[=C2=A0 314.156187] lr : v3d_irq+0xe0/0x2e0 [v3d]
> =C2=A0[=C2=A0 314.160198] sp : ffffffc080003ea0
> =C2=A0[=C2=A0 314.163502] x29: ffffffc080003ea0 x28: ffffffec1f184980 x27=
:
> 021202b000000000
> =C2=A0[=C2=A0 314.170633] x26: ffffffec1f17f630 x25: ffffff8101372000 x24=
:
> ffffffec1f17d9f0
> =C2=A0[=C2=A0 314.177764] x23: 000000000000002a x22: 000000000000002a x21=
:
> ffffff8103252000
> =C2=A0[=C2=A0 314.184895] x20: 0000000000000001 x19: 00000000deadbeef x18=
:
> 0000000000000000
> =C2=A0[=C2=A0 314.192026] x17: ffffff94e51d2000 x16: ffffffec1dac3cb0 x15=
:
> c306000000000000
> =C2=A0[=C2=A0 314.199156] x14: 0000000000000000 x13: b2fc982e03cc5168 x12=
:
> 0000000000000001
> =C2=A0[=C2=A0 314.206286] x11: ffffff8103f8bcc0 x10: ffffffec1f196868 x9 =
:
> ffffffec1dac3874
> =C2=A0[=C2=A0 314.213416] x8 : 0000000000000000 x7 : 0000000000042a3a x6 =
:
> ffffff810017a180
> =C2=A0[=C2=A0 314.220547] x5 : ffffffec1ebad400 x4 : ffffffec1ebad320 x3 =
:
> 00000000000bebeb
> =C2=A0[=C2=A0 314.227677] x2 : 0000000000000000 x1 : 0000000000000000 x0 =
:
> 0000000000000000
> =C2=A0[=C2=A0 314.234807] Call trace:
> =C2=A0[=C2=A0 314.237243]=C2=A0 v3d_irq+0xec/0x2e0 [v3d]
> =C2=A0[=C2=A0 314.240906]=C2=A0 __handle_irq_event_percpu+0x58/0x218
> =C2=A0[=C2=A0 314.245609]=C2=A0 handle_irq_event+0x54/0xb8
> =C2=A0[=C2=A0 314.249439]=C2=A0 handle_fasteoi_irq+0xac/0x240
> =C2=A0[=C2=A0 314.253527]=C2=A0 handle_irq_desc+0x48/0x68
> =C2=A0[=C2=A0 314.257269]=C2=A0 generic_handle_domain_irq+0x24/0x38
> =C2=A0[=C2=A0 314.261879]=C2=A0 gic_handle_irq+0x48/0xd8
> =C2=A0[=C2=A0 314.265533]=C2=A0 call_on_irq_stack+0x24/0x58
> =C2=A0[=C2=A0 314.269448]=C2=A0 do_interrupt_handler+0x88/0x98
> =C2=A0[=C2=A0 314.273624]=C2=A0 el1_interrupt+0x34/0x68
> =C2=A0[=C2=A0 314.277193]=C2=A0 el1h_64_irq_handler+0x18/0x28
> =C2=A0[=C2=A0 314.281281]=C2=A0 el1h_64_irq+0x64/0x68
> =C2=A0[=C2=A0 314.284673]=C2=A0 default_idle_call+0x3c/0x168
> =C2=A0[=C2=A0 314.288675]=C2=A0 do_idle+0x1fc/0x230
> =C2=A0[=C2=A0 314.291895]=C2=A0 cpu_startup_entry+0x3c/0x50
> =C2=A0[=C2=A0 314.295810]=C2=A0 rest_init+0xe4/0xf0
> =C2=A0[=C2=A0 314.299030]=C2=A0 start_kernel+0x5e8/0x790
> =C2=A0[=C2=A0 314.302684]=C2=A0 __primary_switched+0x80/0x90
> =C2=A0[=C2=A0 314.306691] Code: 940029eb 360ffc13 f9442ea0 52800001 (f940=
6017)
> =C2=A0[=C2=A0 314.312775] ---[ end trace 0000000000000000 ]---
> =C2=A0[=C2=A0 314.317384] Kernel panic - not syncing: Oops: Fatal excepti=
on in
> interrupt
> =C2=A0[=C2=A0 314.324249] SMP: stopping secondary CPUs
> =C2=A0[=C2=A0 314.328167] Kernel Offset: 0x2b9da00000 from 0xffffffc08000=
0000
> =C2=A0[=C2=A0 314.334076] PHYS_OFFSET: 0x0
> =C2=A0[=C2=A0 314.336946] CPU features: 0x08,00002013,c0200000,0200421b
> =C2=A0[=C2=A0 314.342337] Memory Limit: none
> =C2=A0[=C2=A0 314.345382] ---[ end Kernel panic - not syncing: Oops: Fata=
l
> exception in interrupt ]---
>=20
> Before resetting the GPU, it's necessary to disable all interrupts
> and
> deal with any interrupt handler still in-flight. Otherwise, the GPU
> might
> reset with jobs still running, or yet, an interrupt could be handled
> during the reset.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for
> Broadcom V3D V3.x+")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h |=C2=A0 8 ++++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c |=C2=A0 2 ++
> =C2=A0drivers/gpu/drm/v3d/v3d_irq.c | 37 +++++++++++++++++++++++++-------=
-
> --
> =C2=A03 files changed, 37 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> b/drivers/gpu/drm/v3d/v3d_drv.h
> index b51f0b648a08..411e47702f8a 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -101,6 +101,12 @@ enum v3d_gen {
> =C2=A0	V3D_GEN_71 =3D 71,
> =C2=A0};
> =C2=A0
> +enum v3d_irq {
> +	V3D_CORE_IRQ,
> +	V3D_HUB_IRQ,
> +	V3D_MAX_IRQS,
> +};
> +
> =C2=A0struct v3d_dev {
> =C2=A0	struct drm_device drm;
> =C2=A0
> @@ -112,6 +118,8 @@ struct v3d_dev {
> =C2=A0
> =C2=A0	bool single_irq_line;
> =C2=A0
> +	int irq[V3D_MAX_IRQS];
> +
> =C2=A0	struct v3d_perfmon_info perfmon_info;
> =C2=A0
> =C2=A0	void __iomem *hub_regs;
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index d7d16da78db3..37bf5eecdd2c 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -134,6 +134,8 @@ v3d_reset(struct v3d_dev *v3d)
> =C2=A0	if (false)
> =C2=A0		v3d_idle_axi(v3d, 0);
> =C2=A0
> +	v3d_irq_disable(v3d);
> +
> =C2=A0	v3d_idle_gca(v3d);
> =C2=A0	v3d_reset_sms(v3d);
> =C2=A0	v3d_reset_v3d(v3d);
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c
> b/drivers/gpu/drm/v3d/v3d_irq.c
> index 2cca5d3a26a2..a515a301e480 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -260,7 +260,7 @@ v3d_hub_irq(int irq, void *arg)
> =C2=A0int
> =C2=A0v3d_irq_init(struct v3d_dev *v3d)
> =C2=A0{
> -	int irq1, ret, core;
> +	int irq, ret, core;
> =C2=A0
> =C2=A0	INIT_WORK(&v3d->overflow_mem_work, v3d_overflow_mem_work);
> =C2=A0
> @@ -271,17 +271,24 @@ v3d_irq_init(struct v3d_dev *v3d)
> =C2=A0		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR,
> V3D_CORE_IRQS(v3d->ver));
> =C2=A0	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS(v3d->ver));
> =C2=A0
> -	irq1 =3D platform_get_irq_optional(v3d_to_pdev(v3d), 1);
> -	if (irq1 =3D=3D -EPROBE_DEFER)
> -		return irq1;
> -	if (irq1 > 0) {
> -		ret =3D devm_request_irq(v3d->drm.dev, irq1,
> +	irq =3D platform_get_irq_optional(v3d_to_pdev(v3d), 1);
> +	if (irq =3D=3D -EPROBE_DEFER)
> +		return irq;
> +	if (irq > 0) {
> +		v3d->irq[V3D_CORE_IRQ] =3D irq;
> +
> +		ret =3D devm_request_irq(v3d->drm.dev, v3d-
> >irq[V3D_CORE_IRQ],
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v3d_irq, IRQF_SHARED,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "v3d_core0", v3d);
> =C2=A0		if (ret)
> =C2=A0			goto fail;
> -		ret =3D devm_request_irq(v3d->drm.dev,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> platform_get_irq(v3d_to_pdev(v3d), 0),
> +
> +		irq =3D platform_get_irq(v3d_to_pdev(v3d), 0);
> +		if (irq < 0)
> +			return irq;
> +		v3d->irq[V3D_HUB_IRQ] =3D irq;
> +
> +		ret =3D devm_request_irq(v3d->drm.dev, v3d-
> >irq[V3D_HUB_IRQ],
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v3d_hub_irq, IRQF_SHARED,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "v3d_hub", v3d);
> =C2=A0		if (ret)
> @@ -289,8 +296,12 @@ v3d_irq_init(struct v3d_dev *v3d)
> =C2=A0	} else {
> =C2=A0		v3d->single_irq_line =3D true;
> =C2=A0
> -		ret =3D devm_request_irq(v3d->drm.dev,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> platform_get_irq(v3d_to_pdev(v3d), 0),
> +		irq =3D platform_get_irq(v3d_to_pdev(v3d), 0);
> +		if (irq < 0)
> +			return irq;
> +		v3d->irq[V3D_CORE_IRQ] =3D irq;
> +
> +		ret =3D devm_request_irq(v3d->drm.dev, v3d-
> >irq[V3D_CORE_IRQ],
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v3d_irq, IRQF_SHARED,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "v3d", v3d);
> =C2=A0		if (ret)
> @@ -331,6 +342,12 @@ v3d_irq_disable(struct v3d_dev *v3d)
> =C2=A0		V3D_CORE_WRITE(core, V3D_CTL_INT_MSK_SET, ~0);
> =C2=A0	V3D_WRITE(V3D_HUB_INT_MSK_SET, ~0);
> =C2=A0
> +	/* Finish any interrupt handler still in flight. */
> +	for (int i =3D 0; i < V3D_MAX_IRQS; i++) {
> +		if (v3d->irq[i])
> +			synchronize_irq(v3d->irq[i]);
> +	}
> +
> =C2=A0	/* Clear any pending interrupts we might have left. */
> =C2=A0	for (core =3D 0; core < v3d->cores; core++)
> =C2=A0		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR,
> V3D_CORE_IRQS(v3d->ver));

