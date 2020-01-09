Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B84135A19
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 14:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16556E40B;
	Thu,  9 Jan 2020 13:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DE7ED6E40B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 13:29:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6179E31B;
 Thu,  9 Jan 2020 05:29:42 -0800 (PST)
Received: from arm.com (e112269-lin.cambridge.arm.com [10.1.194.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65F263F534;
 Thu,  9 Jan 2020 05:29:40 -0800 (PST)
Date: Thu, 9 Jan 2020 13:29:35 +0000
From: Steven Price <steven.price@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
Message-ID: <20200109132934.GA6198@arm.com>
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <79fe7055-c11b-c9f6-64e5-48e3d5687dfe@arm.com>
 <ca77cd74-b747-20c4-b07c-60df23421690@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca77cd74-b747-20c4-b07c-60df23421690@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <Mark.Rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 09, 2020 at 01:10:33PM +0000, Robin Murphy wrote:
> On 09/01/2020 12:01 pm, Steven Price wrote:
> > On 08/01/2020 05:23, Nicolas Boichat wrote:
> >> Hi!
> >>
> >> Sorry for the long delay since =

> >> https://patchwork.kernel.org/patch/11132381/,
> >> finally got around to give this a real try.
> >>
> >> The main purpose of this series is to upstream the dts change and the =

> >> binding
> >> document, but I wanted to see how far I could probe the GPU, to check =

> >> that the
> >> binding is indeed correct. The rest of the patches are =

> >> RFC/work-in-progress, but
> >> I think some of them could already be picked up.
> >>
> >> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
> >> backports to get the latest panfrost driver (I should probably try on
> >> linux-next at some point but this was the path of least resistance).
> >>
> >> I tested it as a module as it's more challenging (originally probing =

> >> would
> >> work built-in, on boot, but not as a module, as I didn't have the power
> >> domain changes, and all power domains are on by default during boot).
> >>
> >> Probing logs looks like this, currently:
> >> [=A0 221.867726] panfrost 13040000.gpu: clock rate =3D 511999970
> >> [=A0 221.867929] panfrost 13040000.gpu: Linked as a consumer to =

> >> regulator.14
> >> [=A0 221.868600] panfrost 13040000.gpu: Linked as a consumer to =

> >> regulator.31
> >> [=A0 221.870586] panfrost 13040000.gpu: Linked as a consumer to =

> >> genpd:0:13040000.gpu
> >> [=A0 221.871492] panfrost 13040000.gpu: Linked as a consumer to =

> >> genpd:1:13040000.gpu
> >> [=A0 221.871866] panfrost 13040000.gpu: Linked as a consumer to =

> >> genpd:2:13040000.gpu
> >> [=A0 221.872427] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 =

> >> minor 0x3 status 0x0
> >> [=A0 221.872439] panfrost 13040000.gpu: features: 00000000,13de77ff, =

> >> issues: 00000000,00000400
> >> [=A0 221.872445] panfrost 13040000.gpu: Features: L2:0x07120206 =

> >> Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0=
x7
> >> [=A0 221.872449] panfrost 13040000.gpu: shader_present=3D0x7 l2_presen=
t=3D0x1
> >> [=A0 221.873526] panfrost 13040000.gpu: error powering up gpu stack
> >> [=A0 221.878088] [drm] Initialized panfrost 1.1.0 20180908 for =

> >> 13040000.gpu on minor 2
> >> [=A0 221.940817] panfrost 13040000.gpu: error powering up gpu stack
> >> [=A0 222.018233] panfrost 13040000.gpu: error powering up gpu stack
> >> (repeated)
> > =

> > It's interesting that it's only the stack that is failing. In hardware =

> > there's a dependency: L2->stack->shader - so in theory the shader cores =

> > shouldn't be able to power up either. There are some known hardware bug=
s =

> > here though[1]:
> > =

> >  =A0=A0=A0=A0MODULE_PARM_DESC(corestack_driver_control,
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Let the driver power on/off the GPU=
 core stack =

> > independently "
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "without involving the Power Domain =
Controller. This should "
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "only be enabled on platforms for wh=
ich integration of the =

> > PDC "
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "to the Mali GPU is known to be prob=
lematic.");
> > =

> > [1] =

> > https://github.com/ianmacd/d2s/blob/master/drivers/gpu/arm/b_r16p0/back=
end/gpu/mali_kbase_pm_driver.c#L57 =

> > =

> > =

> > It might be worth just dropping the code for powering up/down stacks an=
d =

> > let the GPU's own dependency management handle it.
> =

> FWIW I remember digging into that same message a while back (although =

> I've forgotten which particular GPU I was playing with at the time), and =

> concluded that the STACK_PWRON/STACK_READY registers might just not be =

> implemented on some GPUs,

They are indeed not implemented on some GPUs. Specifically none of the
Midgard GPUs. I believe G71 also doesn't have it. However the register
addresses were picked so that on these older GPUs they should
read-as-zero and write-ignore so this shouldn't actually cause any
problems.

> and/or this easy-to-overlook register bit =

> could be some kind of enable for the functionality:
> =

> https://github.com/ianmacd/d2s/blob/master/drivers/gpu/arm/b_r16p0/backen=
d/gpu/mali_kbase_pm_driver.c#L1631
> =

> Since even in kbase this is all behind an 'expert' config option, I'm =

> inclined to agree that just dropping it from panfrost unless and until =

> it proves necessary is probably preferable to adding more logic and =

> inscrutable register-magic.

Indeed - I'll post a patch removing it.

Thanks,

Steve

> Robin.
> =

> > =

> > Steve
> > =

> >>
> >> So the GPU is probed, but there's an issue when powering up the STACK, =

> >> not
> >> quite sure why, I'll try to have a deeper look, at some point.
> >>
> >> Thanks!
> >>
> >> Nicolas
> >>
> >> v2:
> >> =A0 - Use sram instead of mali_sram as SRAM supply name.
> >> =A0 - Rename mali@ to gpu@.
> >> =A0 - Add dt-bindings changes
> >> =A0 - Stacking patches after the device tree change that allow basic
> >> =A0=A0=A0 probing (still incomplete and broken).
> >>
> >> Nicolas Boichat (7):
> >> =A0=A0 dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
> >> =A0=A0 arm64: dts: mt8183: Add node for the Mali GPU
> >> =A0=A0 drm/panfrost: Improve error reporting in panfrost_gpu_power_on
> >> =A0=A0 drm/panfrost: Add support for a second regulator for the GPU
> >> =A0=A0 drm/panfrost: Add support for multiple power domain support
> >> =A0=A0 RFC: drm/panfrost: Add bifrost compatible string
> >> =A0=A0 RFC: drm/panfrost: devfreq: Add support for 2 regulators
> >>
> >> =A0 .../bindings/gpu/arm,mali-bifrost.yaml=A0=A0=A0=A0=A0=A0=A0 |=A0 2=
0 ++++
> >> =A0 arch/arm64/boot/dts/mediatek/mt8183-evb.dts=A0=A0 |=A0=A0 7 ++
> >> =A0 arch/arm64/boot/dts/mediatek/mt8183.dtsi=A0=A0=A0=A0=A0 | 104 ++++=
+++++++++++++
> >> =A0 drivers/gpu/drm/panfrost/panfrost_devfreq.c=A0=A0 |=A0 18 +++
> >> =A0 drivers/gpu/drm/panfrost/panfrost_device.c=A0=A0=A0 | 108 ++++++++=
++++++++--
> >> =A0 drivers/gpu/drm/panfrost/panfrost_device.h=A0=A0=A0 |=A0=A0 7 ++
> >> =A0 drivers/gpu/drm/panfrost/panfrost_drv.c=A0=A0=A0=A0=A0=A0 |=A0=A0 =
1 +
> >> =A0 drivers/gpu/drm/panfrost/panfrost_gpu.c=A0=A0=A0=A0=A0=A0 |=A0 15 =
++-
> >> =A0 8 files changed, 267 insertions(+), 13 deletions(-)
> >>
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
