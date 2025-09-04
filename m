Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A723B438E3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 12:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A3E10E9AA;
	Thu,  4 Sep 2025 10:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B107110E244;
 Thu,  4 Sep 2025 10:36:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D84321756;
 Thu,  4 Sep 2025 03:36:05 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19C653F63F;
 Thu,  4 Sep 2025 03:36:12 -0700 (PDT)
Date: Thu, 4 Sep 2025 11:36:09 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai
 <wens@csie.org>, linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: drm/etnaviv: detecting disabled Vivante GPU?
Message-ID: <20250904113609.18c39d38@donnerap>
In-Reply-To: <CAH9NwWepSZnBP7tot9it_bDEbSC14PrMePz+fBtHfHz4ikLDYA@mail.gmail.com>
References: <20250904002924.2bc63b73@minigeek.lan>
 <CAH9NwWepSZnBP7tot9it_bDEbSC14PrMePz+fBtHfHz4ikLDYA@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Sep 2025 12:10:30 +0200
Christian Gmeiner <christian.gmeiner@gmail.com> wrote:

> Hi
>=20
> >
> > the Allwinner A523/A527/T527 family of SoCs feature a Vivante
> > "VIP9000"(?) NPU, though it seems to be disabled on many SKUs.
> > See https://linux-sunxi.org/A523#Family_of_sun55iw3 for a table, the
> > row labelled "NPU" indicates which model has the IP. We suspect it's
> > all the same die, with the NPU selectively fused off on some packages.
> >
> > Board vendors seem to use multiple SKUs of the SoC on the same board,
> > so it's hard to say which particular board has the NPU or not. We
> > figured that on unsupported SoCs all the NPU registers read as 0,
> > though, so were wondering if that could be considered as a bail-out
> > check for the driver?
> > At the moment I get this, on a SoC with a disabled NPU:
> > [    1.677612] etnaviv etnaviv: bound 7122000.npu (ops gpu_ops)
> > [    1.683849] etnaviv-gpu 7122000.npu: model: GC0, revision: 0
> > [    1.690020] etnaviv-gpu 7122000.npu: Unknown GPU model
> > [    1.696145] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0
> > [    1.953053] etnaviv-gpu 7122000.npu: GPU not yet idle, mask: 0x00000=
000
> >
> > Chen-Yu got this on his board featuring the NPU:
> >     etnaviv-gpu 7122000.npu: model: GC9000, revision: 9003
> >
> > If I get the code correctly, then etnaviv_gpu_init() correctly detects
> > the "unsupported" GPU model, and returns -ENXIO, but load_gpu() in
> > etnaviv_drv.c then somewhat ignores this, since it keeps looking for mo=
re
> > GPUs, and fails to notice that *none* showed up:
> > /sys/kernel/debug/dri/etnaviv/gpu is empty in my case.
> > =20
>=20
> Looks fine to me - no wrong behavior.
>=20
> > Quick questions:
> > - Is reading 0 from VIVS_HI_CHIP_IDENTITY (or any other of the ID
> >   registers) an invalid ID, so we can use that to detect those disabled
> >   NPUs? If not, can any other register used to check this? The whole
> >   block seems to be RAZ/WI when the NPU is disabled.
> >
> > - Would it be acceptable to change the logic to error out of the
> >   driver's init or probe routine when no GPU/NPU has been found, at
> >   best with a proper error message? As it stands at the moment, the
> >   driver is loaded, but of course nothing is usable, so it keeps
> >   confusing users.
> > =20
>=20
> From an application standpoint, it=E2=80=99s not confusing since there is=
 no etnaviv
> device to interact with. The user might wonder about the kernel messages,
> but that=E2=80=99s actually caused by an incorrect device tree. If the So=
C doesn=E2=80=99t
> have an NPU, it shouldn=E2=80=99t be enabled in the DTS.

You have a point there, but as I mentioned above, that sounds tricky to
do: I have two boards that looks otherwise identical, but one has an A527,
the other an T527. And still both don't have the NPU, since only some
T527s feature it. So putting this on the user to use the right DT (or
U-Boot defconfig) does not sound very nice.

And in contrast to many other devices described in DTs, we *can* safely
detect the existence of this NPU: each of the SoCs have all the clock
gates and resets, and accesses to the MMIO frame do not fault - and the
kernel code apparently can cope with this situation already. So yeah, we
could smear something into U-Boot, to put a status =3D "disabled"; in there,
but I would like to avoid that, especially if the kernel is almost there
already.

Cheers,
Andre

=20
