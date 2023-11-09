Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0717E70AF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 18:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92F310E0E4;
	Thu,  9 Nov 2023 17:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5840E10E8F1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 17:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699551961; x=1699811161;
 bh=fR+U7RDinGxKaid0RfxJnE9ObaBcFdNlSaf34YbqFDQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=aV41KMR/tC3Big2agXtd3bvBA4DUKdzGCYrTxDrEoaxmv3hBbQEcTV4wGUs3Bv6as
 852BOCb4JOj/kA3zVt+Pr8mQyV5JOHZe8ZQVbiTg57ArlKxcGbnix0vJrvQTB4W8Uh
 mQ5ZnDx2Q0A9pFOV0KZ3DcdRNfz/FlWBEnbwtPTPvxl8fwupNxspLqAUa8ByY9ndoi
 FbRgjAcwVdQYhbo0VZEoX4CGY/AE9csz2qlwrV0WQJhRncZTYYUMhjb/6ORuFzi/6A
 6xmPViV5q/Y1TrCEtGUM+LbeRAM1/288QNFnAINZUQVstTc60DRrrEQfuuOCC0wNmt
 v3GslquNJrYaQ==
Date: Thu, 09 Nov 2023 17:45:53 +0000
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <n_evglPOy869LKjnmZvX3Ka8Bh6P5NPJkoV7I-yGW9A-YZFl70d4dMuitHkUaPiNyX_o2-DZA31-hR6mp6tShKhGlNC_UWdnpL7OoGrZ52Y=@emersion.fr>
In-Reply-To: <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
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
Cc: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Iago Toral Quiroga <itoral@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 9th, 2023 at 16:42, Dave Stevenson <dave.stevenson@ra=
spberrypi.com> wrote:

> > > - What would be a good name for the heap? "vc4" is maybe a bit naive =
and
> > >   not precise enough. Something with "cma"? Do we need to plan a nami=
ng
> > >   scheme to accomodate for multiple vc4 devices?
> >
> > That's a general issue though that happens with pretty much all devices
> > with a separate node for modesetting and rendering, so I don't think
> > addressing it only for vc4 make sense, we should make it generic.
> >
> > So maybe something like "scanout"?
> >
> > One thing we need to consider too is that the Pi5 will have multiple
> > display nodes (4(?) iirc) with different capabilities, vc4 being only
> > one of them. This will impact that solution too.
>=20
> It does need to scale.
>=20
> Pi5 adds 4 additional DRM devices (2xDSI, 1xDPI, and 1xComposite
> Video), and just this last week I've been running Wayfire with TinyDRM
> drivers for SPI displays and UDL (DisplayLink) outputs as well.
> Presumably all of those drivers need to have appropriate hooks added
> so they each expose a dma-heap to enable scanout buffers to be
> allocated.

I'm not sure this makes sense necessarily for all of these devices. For vc4=
 and
the 4 additional RPi 5 DRM devices, probably. For the rest, e.g. UDL, I'm n=
ot
sure it makes sense to expose scanout memory allocation via DMA heaps: AFAI=
K
UDL needs CPU access to the buffers, it can't "scanout", and thus directly
rendering via v3d to a "scanout-capable" buffer doesn't make sense. There w=
ill
be a copy (CPU download) either way, and allocating via v3d wouldn't make a
difference.

> Can we add another function pointer to the struct drm_driver (or
> similar) to do the allocation, and move the actual dmabuf handling
> code into the core?

Do you mean that the new logic introduced in this patch should be in DRM co=
re
to allow other drivers to more easily re-use it? Or do you mean something e=
lse?

Indeed, there is nothing vc4-specific in this patch, the only requirement i=
s
that the driver uses drm_gem_dma_helper. So this code could be moved into (=
or
alongside) that helper in DRM core. However, maybe it would be best to wait=
 to
have a second user for this infrastructure before we move into core.

> > > - Need to add !vc5 support.
> >
> > If by !vc5 you mean RPi0-3, then it's probably not needed there at all
> > since it has a single node for both modesetting and rendering?
>=20
> That is true, but potentially vc4 could be rendering for scanout via UDL =
or SPI.
> Is it easier to always have the dma-heap allocator for every DRM card
> rather than making userspace mix and match depending on whether it is
> all in one vs split?

I don't think it's realistic to try to always make DMA heaps available for =
each
and every driver which might need it from day one. It's too big of a task. =
And
it's an even bigger task to try to design a fully generic heap compatibilit=
y
uAPI from day one. I'd much rather add the heaps one by one, if and when we
figure that it makes sense, and incrementally work our way through.
