Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3FF9166CD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 14:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DD410E62E;
	Tue, 25 Jun 2024 12:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D6310E62E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:01:24 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sM4rA-00087x-AW; Tue, 25 Jun 2024 14:01:04 +0200
Message-ID: <2e7a6d8defc84073a204a2071d834d87012a0f7d.camel@pengutronix.de>
Subject: Re: [etnaviv-next v14 0/8] drm/etnaviv: Add driver wrapper for
 vivante GPUs attached on PCI(e) device
From: Lucas Stach <l.stach@pengutronix.de>
To: Icenowy Zheng <uwu@icenowy.me>, Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Tue, 25 Jun 2024 14:01:02 +0200
In-Reply-To: <19acb7b11ed22a0a87694b2e74807b82e3b5450e.camel@icenowy.me>
References: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
 <19acb7b11ed22a0a87694b2e74807b82e3b5450e.camel@icenowy.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Dienstag, dem 25.06.2024 um 11:18 +0800 schrieb Icenowy Zheng:
> =E5=9C=A8 2024-05-20=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 00:53 +0800=EF=
=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> > drm/etnaviv use the component framework to bind multiple GPU cores to
> > a
> > virtual master, the virtual master is manually create during driver
> > load
> > time. This works well for various SoCs, yet there are some PCIe card
> > has
> > the vivante GPU cores integrated. The driver lacks the support for
> > PCIe
> > devices currently.
> >=20
> > Adds PCIe driver wrapper on the top of what drm/etnaviv already has,
> > the
> > component framework is still being used to bind subdevices, even
> > though
> > there is only one GPU core. But the process is going to be reversed,
> > we
> > create virtual platform device for each of the vivante GPU IP core
> > shipped
> > by the PCIe master. The PCIe master is real, bind all the virtual
> > child
> > to the master with component framework.
> >=20
> >=20
> > v6:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Fix build issue on sy=
stem without CONFIG_PCI enabled
> > v7:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add a separate patch =
for the platform driver rearrangement
> > (Bjorn)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Switch to runtime che=
ck if the GPU is dma coherent or not
> > (Lucas)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add ETNAVIV_PARAM_GPU=
_COHERENT to allow userspace to query
> > (Lucas)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Remove etnaviv_gpu.no=
_clk member (Lucas)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Fix Various typos and=
 coding style fixed (Bjorn)
> > v8:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Fix typos and remove =
unnecessary header included (Bjorn).
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add a dedicated funct=
ion to create the virtual master
> > platform
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device.
> > v9:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Use PCI_VDEVICE() mac=
ro (Bjorn)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add trivial stubs for=
 the PCI driver (Bjorn)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Remove a redundant de=
v_err() usage (Bjorn)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Clean up etnaviv_pdev=
_probe() with
> > etnaviv_of_first_available_node()
> > v10:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add one more cleanup =
patch
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Resolve the conflict =
with a patch from Rob
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Make the dummy PCI st=
ub inlined
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Print only if the pla=
tform is dma-coherrent
> > V11:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Drop unnecessary chan=
ges (Lucas)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Tweak according to ot=
her reviews of v10.
> >=20
> > V12:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Create a virtual plat=
form device for the subcomponent GPU
> > cores
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Bind all subordinate =
GPU cores to the real PCI master via
> > component.
> >=20
> > V13:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Drop the non-componen=
t code path, always use the component
> > framework
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to bind subcompo=
nent GPU core. Even though there is only
> > one core.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Defer the irq handler=
 register.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Rebase and improve th=
e commit message
> >=20
> > V14:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Rebase onto etnaviv-n=
ext and improve commit message.
> >=20
> > Tested with JD9230P GPU and LingJiu GP102 GPU.
>=20
> BTW how should VRAM and displayed related parts be handled on these
> dGPUs?
>=20
The only way to handle VRAM properly would be to rewrite our GEM
internals using TTM.

Regards,
Lucas

> >=20
> > Sui Jingfeng (8):
> > =C2=A0 drm/etnaviv: Add a dedicated helper function to get various cloc=
ks
> > =C2=A0 drm/etnaviv: Add constructor and destructor for the
> > =C2=A0=C2=A0=C2=A0 etnaviv_drm_private structure
> > =C2=A0 drm/etnaviv: Embed struct drm_device into struct
> > etnaviv_drm_private
> > =C2=A0 drm/etnaviv: Fix wrong cache property being used for vmap()
> > =C2=A0 drm/etnaviv: Add support for cached coherent caching mode
> > =C2=A0 drm/etnaviv: Replace the '&pdev->dev' with 'dev'
> > =C2=A0 drm/etnaviv: Allow creating subdevices and pass platform specifi=
c
> > data
> > =C2=A0 drm/etnaviv: Add support for vivante GPU cores attached via PCIe
> > =C2=A0=C2=A0=C2=A0 device
> >=20
> > =C2=A0drivers/gpu/drm/etnaviv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +
> > =C2=A0drivers/gpu/drm/etnaviv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 159 ++++++++++------
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 27 +++
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 22 ++-
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 144 +++++++++-----
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c=C2=A0=C2=A0=C2=A0 | 187
> > +++++++++++++++++++
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 18 ++
> > =C2=A0include/uapi/drm/etnaviv_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A012 files changed, 468 insertions(+), 110 deletions(-)
> > =C2=A0create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
> > =C2=A0create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
> >=20
> >=20
> > base-commit: 52272bfff15ee70c7bd5be9368f175948fb8ecfd
>=20

