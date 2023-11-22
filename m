Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021D37F42E7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 10:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9517210E02F;
	Wed, 22 Nov 2023 09:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7244E10E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 09:54:25 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 97EDC6601710;
 Wed, 22 Nov 2023 09:54:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700646864;
 bh=picqlStj180Ete06usNfm7bkxW9VWEAUIqXR2QYGvqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F71/Bo2RrQB2nsygym/bY3M6xOkZb78B0Hq5adl0Bcm3/SN0SanZEH6RvSRkwyXoj
 TySOokU1YFmnmnrlNt96GhCFmb2QFnXWcBvXPZFkgKqwC6z2IXbnEfPSGUYikGbXwA
 CvxkdLZe4CrH8fqYwca5aUqJClZaEHagCecSF9+fXUoSNhNvH7dQNaDHVSVgPjroEq
 lWHwnVNUi1l9CmfeuiUyNCP2qKK5zEbpioSJHVaahSEjLGCIrSbYaG51Hbk+OZDhSP
 y8TVZSSLxIpXoXWkjstujh/MELv1NrbdL2NrrjehknjrewRHkdqQff1MwyqHc2MpXa
 6tEfJOdLK2zRg==
Date: Wed, 22 Nov 2023 10:54:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Message-ID: <20231122105419.69724739@collabora.com>
In-Reply-To: <4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com>
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
 <7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
 <1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
 <6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
 <20231121175531.085809f5@collabora.com>
 <d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org>
 <4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 Steven Price <steven.price@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, wenst@chromium.org,
 kernel@collabora.com, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

On Wed, 22 Nov 2023 10:06:19 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Il 21/11/23 18:08, Krzysztof Kozlowski ha scritto:
> > On 21/11/2023 17:55, Boris Brezillon wrote: =20
> >> On Tue, 21 Nov 2023 17:11:42 +0100
> >> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> wrote:
> >> =20
> >>> Il 21/11/23 16:34, Krzysztof Kozlowski ha scritto: =20
> >>>> On 08/11/2023 14:20, Steven Price wrote: =20
> >>>>> On 02/11/2023 14:15, AngeloGioacchino Del Regno wrote: =20
> >>>>>> The layout of the registers {TILER,SHADER,L2}_PWROFF_LO, used to r=
equest
> >>>>>> powering off cores, is the same as the {TILER,SHADER,L2}_PWRON_LO =
ones:
> >>>>>> this means that in order to request poweroff of cores, we are supp=
osed
> >>>>>> to write a bitmask of cores that should be powered off!
> >>>>>> This means that the panfrost_gpu_power_off() function has always b=
een
> >>>>>> doing nothing.
> >>>>>>
> >>>>>> Fix powering off the GPU by writing a bitmask of the cores to powe=
roff
> >>>>>> to the relevant PWROFF_LO registers and then check that the transi=
tion
> >>>>>> (from ON to OFF) has finished by polling the relevant PWRTRANS_LO
> >>>>>> registers.
> >>>>>>
> >>>>>> While at it, in order to avoid code duplication, move the core mask
> >>>>>> logic from panfrost_gpu_power_on() to a new panfrost_get_core_mask=
()
> >>>>>> function, used in both poweron and poweroff.
> >>>>>>
> >>>>>> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
> >>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delreg=
no@collabora.com> =20
> >>>>
> >>>>
> >>>> Hi,
> >>>>
> >>>> This commit was added to next recently but it causes "external abort=
 on
> >>>> non-linefetch" during boot of my Odroid HC1 board.
> >>>>
> >>>> At least bisect points to it.
> >>>>
> >>>> If fixed, please add:
> >>>>
> >>>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>
> >>>> [    4.861683] 8<--- cut here ---
> >>>> [    4.863429] Unhandled fault: external abort on non-linefetch (0x1=
008) at 0xf0c8802c
> >>>> [    4.871018] [f0c8802c] *pgd=3D433ed811, *pte=3D11800653, *ppte=3D=
11800453
> >>>> ...
> >>>> [    5.164010]  panfrost_gpu_irq_handler from __handle_irq_event_per=
cpu+0xcc/0x31c
> >>>> [    5.171276]  __handle_irq_event_percpu from handle_irq_event+0x38=
/0x80
> >>>> [    5.177765]  handle_irq_event from handle_fasteoi_irq+0x9c/0x250
> >>>> [    5.183743]  handle_fasteoi_irq from generic_handle_domain_irq+0x=
28/0x38
> >>>> [    5.190417]  generic_handle_domain_irq from gic_handle_irq+0x88/0=
xa8
> >>>> [    5.196741]  gic_handle_irq from generic_handle_arch_irq+0x34/0x44
> >>>> [    5.202893]  generic_handle_arch_irq from __irq_svc+0x8c/0xd0
> >>>>
> >>>> Full log:
> >>>> https://krzk.eu/#/builders/21/builds/4392/steps/11/logs/serial0
> >>>>     =20
> >>>
> >>> Hey Krzysztof,
> >>>
> >>> This is interesting. It might be about the cores that are missing fro=
m the partial
> >>> core_mask raising interrupts, but an external abort on non-linefetch =
is strange to
> >>> see here. =20
> >>
> >> I've seen such external aborts in the past, and the fault type has
> >> often been misleading. It's unlikely to have anything to do with a =20
> >=20
> > Yeah, often accessing device with power or clocks gated.
> >  =20
>=20
> Except my commit does *not* gate SoC power, nor SoC clocks =F0=9F=99=82

It's not directly related to your commit, it's just a side effect.

>=20
> What the "Really power off ..." commit does is to ask the GPU to internal=
ly power
> off the shaders, tilers and L2, that's why I say that it is strange to se=
e that
> kind of abort.
>=20
> The GPU_INT_CLEAR GPU_INT_STAT, GPU_FAULT_STATUS and GPU_FAULT_ADDRESS_{H=
I/LO}
> registers should still be accessible even with shaders, tilers and cache =
OFF.

It's not the power_off() call that's problematic, it's when it happens
(the last thing called in panfrost_device_runtime_suspend()), and the
fact it generates interrupts. Yes, you don't explicitly gate the clocks
in panfrost_device_runtime_suspend(), but the PM layer does interact
directly with power domains, and shutting down a power domain might
result in other clks/components being gated, which might make the
register bank inaccessible from the CPU.

>=20
> Anyway, yes, synchronizing IRQs before calling the poweroff sequence woul=
d also
> work, but that'd add up quite a bit of latency on the runtime_suspend() c=
all,

Really? In practice I'd expect no pending interrupts, other than the
power transition ones, which are purely and simply ignored by the
handler. If we had any other pending interrupts on suspend, we would
have faced this problem before. To sum-up, I'd expect the extra latency
to just be the overhead of the synchronize_irq() call, which, after
looking at the code, shouldn't be such a big deal.

> so
> in this case I'd be more for avoiding to execute any register r/w in the =
handler
> by either checking if the GPU is supposed to be OFF,

Yes, that's an option, but I don't think that's enough (see below).

> or clearing interrupts,

The handler might have been called already when you clear the
interrupt, and you'd still need to make sure the handler has returned
before returning from panfrost_device_runtime_suspend() if you want to
guarantee no one is touching the registers when the power domains are
shutdown.

> which
> may not work if those are generated after the execution of the poweroff f=
unction.

They are generated while you poll the register, but that doesn't
guarantee they will be processed by the time you return from your
power_off() function, which I think is exactly the problem we're facing
here.

> Or we could simply disable the irq after power_off, but that'd be hacky (=
as well).

If by disabling the interrupt you mean calling disable_irq(), that
would work if the irq lines were not declared as shared (IRQF_SHARED
flag passed at request time). Beside, the latency of disable_irq()
should be pretty much the same as synchronize_irq(), given
synchronize_irq() from there.

If by disabling the interrupt, you mean masking it with _INT_MASK,
then, as said above, that's not enough. You need to make sure any
handler that may have been called as a result of this interrupt,
returns before you return from the suspend function, so you need some
kind of synchronization.

>=20
>=20
> Let's see if asking to poweroff *everything* works:

It might slightly change the timing, making this problem disappear by
chance (if the interrupt gets processed before power_off() returns),
but it doesn't make the suspend logic more robust. We really have to
guarantee that no one will touch the registers when we enter suspend,
be it some interrupt handler, or any kind of deferred work.

Again, none of this is a direct result of your patch, it's just that
your patch uncovered the problem, and I think now is a good time to fix
it properly.

>=20
>=20
> ---
>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c=20
> b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 09f5e1563ebd..1c7276aaa182 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -429,21 +429,29 @@ void panfrost_gpu_power_off(struct panfrost_device =
*pfdev)
>       int ret;
>       u32 val;
>=20
> -    gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present & =
core_mask);
> +    gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
> +    gpu_write(pfdev, SHADER_PWROFF_HI, U32_MAX);
>       ret =3D readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_L=
O,
>                        val, !val, 1, 1000);
>       if (ret)
>           dev_err(pfdev->dev, "shader power transition timeout");
>=20
>       gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
> +    gpu_write(pfdev, TILER_PWROFF_HI, U32_MAX);
>       ret =3D readl_relaxed_poll_timeout(pfdev->iomem + TILER_PWRTRANS_LO,
>                        val, !val, 1, 1000);
>       if (ret)
>           dev_err(pfdev->dev, "tiler power transition timeout");
>=20
> -    gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mas=
k);
> +    gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
>       ret =3D readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
> -                 val, !val, 0, 1000);
> +                     val, !val, 0, 1000);
> +    if (ret)
> +        dev_err(pfdev->dev, "l2_low power transition timeout");
> +
> +    gpu_write(pfdev, L2_PWROFF_HI, U32_MAX);
> +    ret =3D readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_HI,
> +                     val, !val, 0, 1000);
>       if (ret)
>           dev_err(pfdev->dev, "l2 power transition timeout");
>   }

