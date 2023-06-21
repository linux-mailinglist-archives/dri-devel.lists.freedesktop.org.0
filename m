Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B3C7388B4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B7210E4AB;
	Wed, 21 Jun 2023 15:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACB110E4AB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:20:19 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qBzcv-0007yD-MP; Wed, 21 Jun 2023 17:20:09 +0200
Message-ID: <6ef512179a4cc9ce24890e5ed50c6fabd86a18c1.camel@pengutronix.de>
Subject: Re: [PATCH v10 03/11] drm/etnaviv: Add dedicated functions to
 create and destroy platform device
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <18949883232@163.com>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jun 2023 17:20:04 +0200
In-Reply-To: <ab17a1e6-c621-9a92-73fc-8b762fd0800e@loongson.cn>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-4-18949883232@163.com>
 <0daa7182d6600a24988d1c81cf8fe3c0c9487f52.camel@pengutronix.de>
 <1c7596fd-7e63-6719-2574-7d7820687832@loongson.cn>
 <6d287bbb1733814009dfeb7d48f08cb6f44dc56c.camel@pengutronix.de>
 <30d80802-2d9d-2816-1a02-240145f6dd3a@loongson.cn>
 <0f1095ef333da7ea103486a1121ca9038815e57c.camel@pengutronix.de>
 <ab17a1e6-c621-9a92-73fc-8b762fd0800e@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 21.06.2023 um 22:35 +0800 schrieb Sui Jingfeng:
> Hi,
>=20
> On 2023/6/21 22:00, Lucas Stach wrote:
> > Am Mittwoch, dem 21.06.2023 um 21:31 +0800 schrieb Sui Jingfeng:
> > > On 2023/6/21 18:23, Lucas Stach wrote:
> > > > > While back to the question you ask, I want etnaviv_create_platfor=
m_device() to be generic,
> > > > >=20
> > > > > can be used by multiple place for multiple purpose.
> > > > >=20
> > > > > I have successfully copy this to a another drm driver by simply r=
enaming.
> > > > >=20
> > > > > The body of the function itself does not need to change.
> > > > But it isn't shared,
> > > This can be shared for drm/etnaviv in the future,
> > >=20
> > > currently, we just need an opportunity to use this function.
> > >=20
> > I'm not convinced, yet.
> >=20
> > > I want to create a dummy platform device,
> > >=20
> > > let this dummy platform be bound to the single PCI GPU master.
> > >=20
> > >=20
> > > etnaviv_create_platform_device("dummy", &dummy_device);
> > >=20
> > >=20
> > > 1) To verify the component code path on PCI case.
> > >=20
> > My favorite option would be to just always use the component path even
> > when the GPU is on a PCI device to keep both paths mostly aligned. One
> > could easily image both a 3D and a 2D core being made available though
> > the same PCI device.
>=20
> Component is for something that is possible not available. (or something=
=20
> is optional)
>=20
> Yes it provided flexibly, but don't forget, it rely on the DT.

The component framework itself doesn't rely on DT in any way. By
providing a appropriate match function you can make it work with any
kind of device. In fact etnaviv supports platform devices instantiated
via board code today. They don't need to come from DT.

If we could make the PCI stuff work the same way, that would be my
preferred option.

>=20
>=20
> But for the PCIe device, it always the case that all of the hardware is=
=20
> available at the same time
>=20
> when the device driver(kernel module) is loaded.
That isn't the issue solved by the component framework. On the existing
SoCs all the hardware is available when the driver is probed. The
component framework just makes sure that we only expose the DRM device
after all GPU cores that should be managed by a single DRM device
instance are probed.

One could easily image a PCI device that containing a 2D and a 3D
Vivante GPU that should be made available through a single DRM device.
In that case you'll also need to use the component framework.

>=20
>=20
> > > 2) Possibly for create a device for some other tiny hardware logic
> > > come with the platform
> > >=20
> > Do you have something in mind here? Until now I assumed that only the
> > GPU core is behind the PCI abstraction. Is there something else sharing
> > the MMIO space?
>=20
> A display controller, HDMI phy, vga encoder etc
>=20
>=20
> I have a discrete PCIe GPU card from another vendor,
>=20
> It integrated display controller and vivante GPU and unknown VPUs.
>=20
> All of the=C2=A0 hardware block mentioned above sharing the MMIO space.
>=20
> There are available on the same time when you mount this discrete PCIe=
=20
> GPU card on the mother board
>=20
But they surely should not all be made available through the etnaviv
driver. Etnaviv deals with the Vivante GPUs. If you have a PCI device
with multiple IP cores behind the shared MMIO space you should have a
PCI driver instantiating platform devices so the respective drivers for
those IP cores can bind to the platform device. Etnaviv is not that
driver.

Regards,
Lucas

> >=20
> > Regards,
> > Lucas
> >=20
> > > 3) Revival component_compare_dev_name() function.
> > >=20
> > > > in this compilation unit this function is specific
> > > > to the etnaviv driver and I don't see why we shouldn't have etnaviv
> > > > specifics in there if it makes the code of this driver easier to
> > > > follow.
>=20

