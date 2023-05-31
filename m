Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F7A718745
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 18:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5983310E1D2;
	Wed, 31 May 2023 16:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545A910E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 16:23:34 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q4ObW-0006OY-35; Wed, 31 May 2023 18:23:18 +0200
Message-ID: <5e0b34054ca6fa540e481d93f3c1d9fbdd2defcd.camel@pengutronix.de>
Subject: Re: [PATCH v6 5/6] drm/etnaviv: add driver support for the PCI devices
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Bjorn Helgaas <helgaas@kernel.org>
Date: Wed, 31 May 2023 18:23:12 +0200
In-Reply-To: <950fdaaa-b62c-7f36-a499-9eca71c8bc47@loongson.cn>
References: <ZHZIXZPuCkFSMF4H@bhelgaas>
 <950fdaaa-b62c-7f36-a499-9eca71c8bc47@loongson.cn>
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
Cc: Li Yi <liyi@loongson.cn>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui Jingfeng,

Am Donnerstag, dem 01.06.2023 um 00:08 +0800 schrieb Sui Jingfeng:
> Hi,
>=20
> On 2023/5/31 03:02, Bjorn Helgaas wrote:
> > On Wed, May 31, 2023 at 12:06:42AM +0800, Sui Jingfeng wrote:
> > > This patch adds PCI driver support on top of what already have. Take =
the
> > > GC1000 in LS7A1000/LS2K1000 as the first instance of the PCI device d=
river.
> > > There is only one GPU core for the GC1000 in the LS7A1000 and LS2K100=
0.
> > > Therefore, component frameworks can be avoided. Because we want to bi=
nd the
> > > DRM driver service to the PCI driver manually.
> > > +	 * Loongson Mips and LoongArch CPU(ls3a5000, ls3a4000, ls2k1000la)
> > > +	 * maintain cache coherency by hardware
> > > +	 */
> > > +	if (IS_ENABLED(CONFIG_CPU_LOONGSON64) || IS_ENABLED(CONFIG_LOONGARC=
H))
> > > +		priv->has_cached_coherent =3D true;
> > This looks like something that should be a runtime check, not a
> > compile-time check.
> >=20
> > If it's possible to build a single kernel image that runs on Loongson
> > MIPS or LoongArch CPU and, in addition, runs on other platforms, you
> > cannot assume that all the others maintain this cache coherency.
>=20
> Nice catch! I don't even realize this!
>=20
>=20
> LS3A4000 is mips64r2 with MSA SIMD, while LS3A5000 is LoongArch,
>=20
> instruction set, compiler, and binary interface are totally changed.
>=20
> Therefore, it's impossible to build a single kernel image that runs on=
=20
> all Loongson CPUs.
>=20
> Currently, I can guarantee that this works on the Loongson platform.
>=20
> My initial intent here is to let priv->has_cached_coherent be *true* on=
=20
> the Loongson platform (both mips and loongarch).
>=20
> I do know there are some other vendors who bought GPU IP from Vivante.
>=20
> say GC7000, and integrate it into their discrete GPU product.
>=20
> But it is also a PCI device, but this is another story; it deserves=20
> another patch.
>=20
> I don't know if Etnaviv folk find some similar hardware on Arm Arch,
>=20
> Some Arm CPUs do not maintain cached coherency on hardware.
>=20
> The has_cached_coherent member can be set to false on such hardware.
>=20
> For us, it seems that there is no need to do runtime checking,
>=20
> because they are all cached coherent by default.
>=20
>=20
> Can I improve this in the future, currently I don't have a good idea.

I think I mentioned before that this needs to be a runtime check. What
does dev_is_dma_coherent() return for the Vivante GPU device on your
platform?

Regards,
Lucas
