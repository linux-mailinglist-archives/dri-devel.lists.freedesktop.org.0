Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D11F78C061
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 10:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4176B10E17B;
	Tue, 29 Aug 2023 08:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A3910E17B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 08:38:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A42F661756;
 Tue, 29 Aug 2023 08:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEE3C433C8;
 Tue, 29 Aug 2023 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693298287;
 bh=lrPVK9thEyqQovRleImFGsZ/M+QsnNDN/Ncyq0d6vA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cW5HBbzsmEyW6hz14GMFZ+NXRHfUePMJ+9NuHPR833parCacNt01Vmrgnj6RpQ+V6
 RW1GOLpX1pZXAhu9bS+zgWsaXvOB+d8BQNOA2U4BfldL3smh8rbffg56QvncZwmbyL
 hJHtS/nz7quSPrdfpWDY8JVTmVUN/48l3bHMNMVopGRxOcb4PXefM7qBNY90Rlyepc
 I5/y6qiiZwBJ55asW/PtPSTpdDiYeIBtsnQbK2LeUqvHX5Tp0lRX+ATZ9/ITOcYYSo
 Afqn0fpHF7LIpT9R2Vf9E0ZLSE0LfFRGrSjgUJbMjjBkD+q7LzF2DInQ75vgUpwyPW
 pxX9DYrR5qCAw==
Date: Tue, 29 Aug 2023 10:38:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
Message-ID: <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid>
 <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
 <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
 <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
 <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 09:06:29AM -0700, Doug Anderson wrote:
> > > Shutdown is called any time you reboot a device. That means that if a
> > > DRM driver is _not_ calling drm_atomic_helper_shutdown() on the
> > > panel's behalf at shutdown time then the panel won't be powered off
> > > properly. This feels to me like something that might actually matter.
> >
> > It does matter. What I disagree on is that you suggest working around
> > that brokenness in the core framework. What I'm saying is driver is
> > broken, we should keep the core framework sane and fix it in the driver.
> >
> > It should be fairly easy with a coccinelle script to figure out which
> > panels are affected, and to add that call in remove.
>=20
> I think I'm confused here. I've already figured out which panels are
> affected in my patch series, right? It's the set of panels that today
> try to power the panel off in their shutdown call, right? ...but I
> think we can't add the call you're suggesting,
> drm_atomic_helper_shutdown(), to the _panel_'s shutdown callback, can
> we? We need to add it to the shutdown callback of the top-level DRM
> driver, right?

I have no idea what happens if we just unbind the panel device from its
driver.

If we can't, then it's all fine. If we can, then we need figure out how
to unregister the DRM device (or block the unbinding from happening).

> > > Panels tend to be one of those things that really care about their
> > > power sequencing and can even get damaged (or not turn on properly
> > > next time) if sequencing is not done properly, so just removing this
> > > code and putting the blame on the DRM driver seems scary to me.
> >
> > Sure, it's bad. But there's no difference compared to the approach you
> > suggest in that patch: you created a helper, yes, but every driver will
> > still have to call that helper and if they don't, the panel will still
> > be called and it's a bug. And we would have to convert everything to
> > that new helper.
> >
> > It's fundamentally the same discussion than what you were opposed to
> > above.
>=20
> I think the key difference here is that, if I understand correctly,
> drm_atomic_helper_shutdown() needs to be added to the top-level DRM
> driver, not to the panel itself. I guess I'm worried that I'll either
> miss a case or that simply adding a call to
> drm_atomic_helper_shutdown() in the top-level DRM driver will break
> something. Well, I suppose I can try it and see what happens...

The more I think about this discussion, the more I think that the
original intent of the prepared/enabled flags were precisely there to
prevent a double-disable for drivers with drm_atomic_helper_shutdown(),
while still shutting down the panel resources when the panel is used
with a driver that doesn't call it.

Honestly, I think the right thing to do here is to make every driver
call shutdown, and then you don't need the reference counting anymore.

I had a shot at a (possibly very suboptimal) coccinelle script to look
for drivers that are KMS drivers but don't call
drm_atomic_helper_shutdown() at shutdown.

https://paste.ack.tf/bb42e6@raw

The result is:

$ make coccicheck COCCI=3D./test-drm-shutdown.cocci MODE=3Dreport

=2E..

=2E/drivers/gpu/drm/sti/sti_drv.c:262:30-49: ERROR: KMS driver sti_platform=
_driver is missing shutdown implementation
=2E/drivers/gpu/drm/armada/armada_drv.c:245:30-56: ERROR: KMS driver armada=
_drm_platform_driver is missing shutdown implementation
=2E/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1637:25-39: ERROR: KMS driver vmw_p=
ci_driver is missing shutdown implementation
=2E/drivers/gpu/drm/vboxvideo/vbox_drv.c:163:25-40: ERROR: KMS driver vbox_=
pci_driver is missing shutdown implementation
=2E/drivers/gpu/drm/tiny/arcpgu.c:424:30-52: ERROR: KMS driver arcpgu_platf=
orm_driver is missing shutdown implementation
=2E/drivers/gpu/drm/omapdrm/omap_drv.c:856:30-34: ERROR: KMS driver pdev is=
 missing shutdown implementation
=2E/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c:361:30-57: ERROR: KMS driver =
fsl_dcu_drm_platform_driver is missing shutdown implementation
=2E/drivers/gpu/drm/tve200/tve200_drv.c:261:30-43: ERROR: KMS driver tve200=
_driver is missing shutdown implementation
=2E/drivers/gpu/drm/stm/drv.c:235:30-53: ERROR: KMS driver stm_drm_platform=
_driver is missing shutdown implementation
=2E/drivers/gpu/drm/qxl/qxl_drv.c:267:25-39: ERROR: KMS driver qxl_pci_driv=
er is missing shutdown implementation
=2E/drivers/gpu/drm/logicvc/logicvc_drm.c:494:30-57: ERROR: KMS driver logi=
cvc_drm_platform_driver is missing shutdown implementation
=2E/drivers/gpu/drm/sun4i/sun4i_drv.c:439:30-55: ERROR: KMS driver sun4i_dr=
v_platform_driver is missing shutdown implementation
=2E/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c:827:30-60: ERROR: KMS driv=
er atmel_hlcdc_dc_platform_driver is missing shutdown implementation
=2E/drivers/gpu/drm/mcde/mcde_drv.c:471:30-41: ERROR: KMS driver mcde_drive=
r is missing shutdown implementation
=2E/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:366:25-41: ERROR: KMS d=
river hibmc_pci_driver is missing shutdown implementation
=2E/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c:365:30-56: ERROR: KMS driver as=
peed_gfx_platform_driver is missing shutdown implementation
=2E/drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1607:30-48: ERROR: KMS driver=
 ingenic_drm_driver is missing shutdown implementation
=2E/drivers/gpu/drm/arm/malidp_drv.c:982:30-52: ERROR: KMS driver malidp_pl=
atform_driver is missing shutdown implementation
=2E/drivers/gpu/drm/arm/hdlcd_drv.c:400:30-51: ERROR: KMS driver hdlcd_plat=
form_driver is missing shutdown implementation
=2E/drivers/gpu/drm/kmb/kmb_drv.c:622:30-49: ERROR: KMS driver kmb_platform=
_driver is missing shutdown implementation
=2E/drivers/gpu/drm/exynos/exynos_drm_drv.c:356:30-56: ERROR: KMS driver ex=
ynos_drm_platform_driver is missing shutdown implementation
=2E/drivers/gpu/drm/tiny/bochs.c:718:25-41: ERROR: KMS driver bochs_pci_dri=
ver is missing shutdown implementation
=2E/drivers/gpu/drm/tiny/cirrus.c:746:25-42: ERROR: KMS driver cirrus_pci_d=
river is missing shutdown implementation
=2E/drivers/gpu/drm/mediatek/mtk_drm_drv.c:954:30-53: ERROR: KMS driver mtk=
_drm_platform_driver is missing shutdown implementation

It's a significant number of drivers, but it's not the end of the world,
really.

Then, once the expectation is that all drivers are calling shutdown, we
don't have to worry about the refcounting at all in the panels, or
resources not being free'd anymore. And we have a single path to test
(disable) instead of two including one that might be difficult to test
properly.

> I'll try to cook up a v2 and we'll see what people say. I might keep
> the RFC tag for v2 just because I expect it to still be touching a lot
> of stuff.

Awesome, thanks

Maxime
