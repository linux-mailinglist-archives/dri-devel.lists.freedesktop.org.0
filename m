Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F18805A7F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E6610E025;
	Tue,  5 Dec 2023 16:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3A610E025
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1701795136; x=1702054336;
 bh=qiEeNr0nUBQskSaTk+NkR6QIFZWtBEeiPQhs8rGq8B8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Y0L9WzR1kf2tLP2++DV+JySCQBYCIbPiF6z1r7e6EF34C6HSdMuazNwmL22oLKprx
 7iJtkR5GSMLXc7CH4w2AerrEZL0yZQHnbri/CbZuvoLWVMtwSu1eGPMcACOhDXIQo2
 AzASHE6W/Hh86559RwSCAxBrrUoxl37M3dUCbkzrDqteBbjS7+mrtRQAiCkyYK1zta
 0hTLUcCUAYddP5E9S4NBNzaPK5oAJIRrDgIIdQyVA+ImkLug3mHUdJf3Hpm1E9sYtS
 krqOBWuZWDYC2HDEzVagpz9HWC31Bha834MT3tH04+G5rDDAWNRbv9DuOsuHZKOlFy
 62/02JnX2DYYQ==
Date: Tue, 05 Dec 2023 16:52:06 +0000
To: Maxime Ripard <mripard@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <bFzdpt0kEb3hhcEQ9HlUzLadbzI_hCTCVCTZJRua62Z3E6eZR1LeFFFHjOP_5hiyqnzM99aqj5PSUFh9mstWI5frJ2WY8_EEeULbjxDqmVY=@emersion.fr>
In-Reply-To: <wsdxippxzmtjujlcpp5t2tp2dvr2xmhwtogrvvhj3huyj73yj7@cg2uniryh2co>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <SsSohScL3nokTnLEzO0FXd2Mhxq9IYM3_qjKhHD8-rynieR_0otvP-WmHQ18UNJuf1Dp7u4iaRB-XPZU4eAxZADSFODzbXxYPFuoJNJ6GcU=@emersion.fr>
 <wsdxippxzmtjujlcpp5t2tp2dvr2xmhwtogrvvhj3huyj73yj7@cg2uniryh2co>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 "T.J. Mercier" <tjmercier@google.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>






On Wednesday, November 29th, 2023 at 13:45, Maxime Ripard <mripard@kernel.o=
rg> wrote:


>=20
>=20
> Hi,
>=20
> Thanks for writing this down
>=20
> On Thu, Nov 16, 2023 at 03:53:20PM +0000, Simon Ser wrote:
>=20
> > On Thursday, November 9th, 2023 at 08:45, Simon Ser contact@emersion.fr=
 wrote:
> >=20
> > > User-space sometimes needs to allocate scanout-capable memory for
> > > GPU rendering purposes. On a vc4/v3d split render/display SoC, this
> > > is achieved via DRM dumb buffers: the v3d user-space driver opens
> > > the primary vc4 node, allocates a DRM dumb buffer there, exports it
> > > as a DMA-BUF, imports it into the v3d render node, and renders to it.
> > >=20
> > > However, DRM dumb buffers are only meant for CPU rendering, they are
> > > not intended to be used for GPU rendering. Primary nodes should only
> > > be used for mode-setting purposes, other programs should not attempt
> > > to open it. Moreover, opening the primary node is already broken on
> > > some setups: systemd grants permission to open primary nodes to
> > > physically logged in users, but this breaks when the user is not
> > > physically logged in (e.g. headless setup) and when the distribution
> > > is using a different init (e.g. Alpine Linux uses openrc).
> > >=20
> > > We need an alternate way for v3d to allocate scanout-capable memory.
> > > Leverage DMA heaps for this purpose: expose a CMA heap to user-space.
> >=20
> > So we've discussed about this patch on IRC [1] [2]. Some random notes:
> >=20
> > - We shouldn't create per-DRM-device heaps in general. Instead, we shou=
ld try
> > using centralized heaps like the existing system and cma ones. That way=
 other
> > drivers (video, render, etc) can also link to these heaps without depen=
ding
> > on the display driver.
> > - We can't generically link to heaps in core DRM, however we probably p=
rovide
> > a default for shmem and cma helpers.
> > - We're missing a bunch of heaps, e.g. sometimes there are multiple cma=
 areas
> > but only a single cma heap is created right now.
> > - Some hw needs the memory to be in a specific region for scanout (e.g.=
 lower
> > 256MB of RAM for Allwinner). We could create one heap per such region (=
but is
> > it fine to have overlapping heaps?).
>=20
> Just for reference, it's not the scanout itself that has that
> requirement on Allwinner SoCs, it's the HW codec. But if you want to
> display the decoded frame directly using dma-buf, you'll still need to
> either allocate a scanout buffer and hope it'll be in the lower 256MB,
> or allocate a buffer from the codec in the lower 256MB and then hope
> it's scanout-capable (which it is, so that's we do, but there's no
> guarantee about it).

OK. Yeah, the problem remains.

> I think the logicvc is a much better example for this, since it requires
> framebuffers to be in a specific area, with each plane having a
> dedicated area.
>=20
> AFAIK that's the most extreme example we have upstream.

That kind of restriction is not supported by generic user-space. As far
as user-space is concerned, scanout-capable buffers aren't tied to any
plane in particular. Generic user-space allocates via GBM or dumb
buffers, and at allocation time there is no hint about the plane the
buffer will be attached to.

I'm personally not super excited/interested about supporting this kind
of weird setup which doesn't match the KMS uAPI.
