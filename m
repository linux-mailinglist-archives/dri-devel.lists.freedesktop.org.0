Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9657E7B95
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 12:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E1510E98E;
	Fri, 10 Nov 2023 11:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4474710E98E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 11:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699614127; x=1699873327;
 bh=3TF2CVI+efc/5Cfq1Y+/2PARk3tlrG+0uxnA5bsbKbQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=AIlRy/lw+6jHc2XBKNi6X1FKO3CjZTnLlcnqzmo5sWtxgBxG2IrSOUnaDHXBlGl7x
 S8FFuYJEwrelkbpKqylzuRHiA+SjTPShE7ujX+GcqW0BO/bQtyWCC+F2O2LNt6OSxO
 iCUNk5WYeHd7HlzL+FIA2PRN04NEL+7oqFf+ZftkoG6bD59eYO7Ok7R4PU4KXIlnch
 I1JuGZwTdtuAjb5J5HUfu+uv12UO/5ZbqP0RSJ2TeUjfJEKE8FgzPVGwuV4rqAnBHk
 CONjVnnAyP0Aw0KkqHxgmBikTcwnRy/xSlvhgpMHNdY4wjuHMiSSxGoAoUjTjrm38N
 p/tUSMZTmZ4XA==
Date: Fri, 10 Nov 2023 11:01:37 +0000
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <a5sVz8pDt49O7hbbxuidCoUByUe0mpaWntH9OfvBBCSTILrYnzeoFaXGGqgl1Z-Yjp7FkFlTSREmHwRejJDGA2V2yZGXfWzk60Tonuo6t2o=@emersion.fr>
In-Reply-To: <CAPY8ntCjN8Hdam=r2i2-EePjhZZFQxn9zEm0Soz-W5WwKGO8Hg@mail.gmail.com>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
 <n_evglPOy869LKjnmZvX3Ka8Bh6P5NPJkoV7I-yGW9A-YZFl70d4dMuitHkUaPiNyX_o2-DZA31-hR6mp6tShKhGlNC_UWdnpL7OoGrZ52Y=@emersion.fr>
 <CAPY8ntCjN8Hdam=r2i2-EePjhZZFQxn9zEm0Soz-W5WwKGO8Hg@mail.gmail.com>
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

On Thursday, November 9th, 2023 at 19:38, Dave Stevenson <dave.stevenson@ra=
spberrypi.com> wrote:

> Hi Simon
>=20
> On Thu, 9 Nov 2023 at 17:46, Simon Ser <contact@emersion.fr> wrote:
> >
> > On Thursday, November 9th, 2023 at 16:42, Dave Stevenson <dave.stevenso=
n@raspberrypi.com> wrote:
> >
> > > > > - What would be a good name for the heap? "vc4" is maybe a bit na=
ive and
> > > > >   not precise enough. Something with "cma"? Do we need to plan a =
naming
> > > > >   scheme to accomodate for multiple vc4 devices?
> > > >
> > > > That's a general issue though that happens with pretty much all dev=
ices
> > > > with a separate node for modesetting and rendering, so I don't thin=
k
> > > > addressing it only for vc4 make sense, we should make it generic.
> > > >
> > > > So maybe something like "scanout"?
> > > >
> > > > One thing we need to consider too is that the Pi5 will have multipl=
e
> > > > display nodes (4(?) iirc) with different capabilities, vc4 being on=
ly
> > > > one of them. This will impact that solution too.
> > >
> > > It does need to scale.
> > >
> > > Pi5 adds 4 additional DRM devices (2xDSI, 1xDPI, and 1xComposite
> > > Video), and just this last week I've been running Wayfire with TinyDR=
M
> > > drivers for SPI displays and UDL (DisplayLink) outputs as well.
> > > Presumably all of those drivers need to have appropriate hooks added
> > > so they each expose a dma-heap to enable scanout buffers to be
> > > allocated.
> >
> > I'm not sure this makes sense necessarily for all of these devices. For=
 vc4 and
> > the 4 additional RPi 5 DRM devices, probably. For the rest, e.g. UDL, I=
'm not
> > sure it makes sense to expose scanout memory allocation via DMA heaps: =
AFAIK
> > UDL needs CPU access to the buffers, it can't "scanout", and thus direc=
tly
> > rendering via v3d to a "scanout-capable" buffer doesn't make sense. The=
re will
> > be a copy (CPU download) either way, and allocating via v3d wouldn't ma=
ke a
> > difference.
>=20
> You as a developer may know that UDL is going to need CPU access, but
> how does a generic userspace app know? Is it a case of falling back to
> allocating via the renderer if there is no suitably named heap?

Yeah, just like how things are working today. Then try to do direct scanout
with the buffer allocated on the render node, and if it doesn't work blit i=
nto
a DRM dumb buffer.

> > Indeed, there is nothing vc4-specific in this patch, the only requireme=
nt is
> > that the driver uses drm_gem_dma_helper. So this code could be moved in=
to (or
> > alongside) that helper in DRM core. However, maybe it would be best to =
wait to
> > have a second user for this infrastructure before we move into core.
>=20
> Upstreaming of the DSI / DPI / composite drivers for Pi5 should only
> be a few months away, and they can all directly scanout.
>=20
> I expect the Rockchip platforms to also fall into the same category as
> the Pi, with Mali as the 3D IP, and the VOP block as the scanout
> engine. Have I missed some detail that means that they aren't a second
> user for this?
>=20
> > > > > - Need to add !vc5 support.
> > > >
> > > > If by !vc5 you mean RPi0-3, then it's probably not needed there at =
all
> > > > since it has a single node for both modesetting and rendering?
> > >
> > > That is true, but potentially vc4 could be rendering for scanout via =
UDL or SPI.
> > > Is it easier to always have the dma-heap allocator for every DRM card
> > > rather than making userspace mix and match depending on whether it is
> > > all in one vs split?
> >
> > I don't think it's realistic to try to always make DMA heaps available =
for each
> > and every driver which might need it from day one. It's too big of a ta=
sk. And
> > it's an even bigger task to try to design a fully generic heap compatib=
ility
> > uAPI from day one. I'd much rather add the heaps one by one, if and whe=
n we
> > figure that it makes sense, and incrementally work our way through.
>=20
> Is it really that massive a task? We have the dma heap UAPI for
> handling the allocations, so what new UAPI is required?

I'm only focused on fixing v3d for now. Some split render/display drivers d=
o
similar things, some drivers not. I don't have hardware to test, I'm not
willing to commit a lot of time writing a patchset I'm not even sure will m=
ake
it. I don't really understand the hurry of doing all of the things at once =
here.
If you do happen to have the time, feel free to write the patches or even t=
ake
over this series.

I'm worried about blindly adding heaps all over the place, because as said
above, I don't believe it makes sense for all drivers. I think it's probabl=
y a
safe bet to add heaps in cases where we use kmsro with dumb buffers on the =
Mesa
side. But anything else and it really needs to be discussed on a case-by-ca=
se
basis.

> If it's a new function pointer in struct drm_driver, then the heap is
> only created by the core if that function is defined using the driver
> name. The function returns a struct dma_buf *.
> Any driver using drm_gem_dma_helper can use the new helper function
> that is basically your vc4_dma_heap_allocate. The "if
> (WARN_ON_ONCE(!vc4->is_vc5))" could be handled by not setting the
> function pointer on those platforms.

I would advise against a function pointer, because that kind of API design
makes DRM core more of a midlayer than a helper library, and this is someth=
ing
we prefer to avoid [1]. I would instead suggest introducing a DRM core func=
tion
which creates the heap and can be called from the driver. 1-line vs. 3-line
in driver code doesn't really make such a big difference.

[1]: https://blog.ffwll.ch/2016/12/midlayers-once-more-with-feeling.html
