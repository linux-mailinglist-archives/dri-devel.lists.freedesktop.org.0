Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B87E7CF2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9335310E085;
	Fri, 10 Nov 2023 14:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A7710E085
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699626199; x=1699885399;
 bh=5gvwXhCcyrP2rBSoShDiTirDIW3VWnV2N1VejxWRZn4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=dDa0X1QpCnwmYuZX6bW0g5vZ6xECidhgOvAtr+g0+DU5RAbdgkby8Fhsm9moWF2rQ
 gTzaBfcLsPfc10WHSx/T0DqINTQ7OKe5p98geFSL81TMm45P4elx+v9iaBtxTL/r9v
 VCuRYgt4wwup9QkVvSyKI9W6EwoOfZdh0rouqNJBIt9naUmRn3HHrfj2bm5h2++lom
 49mfM/qeyuflqZh3DSLA6JfxkorPQ9QFtQFAocbnTKQHDbIz+DHZREGXlqD7pIj56P
 GAQWN0Q970vVgND6TyVenvGQprPlQqV8idLIJCaISnhBsb2VzeQGxgIe3NbUDx5yZz
 Q6oi/fBmVHb/A==
Date: Fri, 10 Nov 2023 14:23:16 +0000
To: Maxime Ripard <mripard@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <gQR1IvZQuSocyjbMBXHrYbnNCMHNXwjmItCrmRgRVjG5xF2qFuD1WWB60aik8UNHJpNkPfTweafYINmniOywJpGPqFOSNvdwTemWPBUifeY=@emersion.fr>
In-Reply-To: <nptkmf2w6j7ro74ihthpvkrmc7r2bqm7zljiv2ajpqx565f5ty@o46mdlhzasvu>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
 <ph4ssz5r3afaovoviavkkemfxqyttqucnzl6nnrbyi3tejxfsf@22dyuwq3uyot>
 <x547FihqvjPqU5HRTVPzPb6Gsx8_I4z8LHxxhyiBjTi6fCNHYGKvgfAdQQJlXfcCfbf9rKKK7Tlj4vkZcey0PVaJfgwbEGgPaJIPJfMuou0=@emersion.fr>
 <nptkmf2w6j7ro74ihthpvkrmc7r2bqm7zljiv2ajpqx565f5ty@o46mdlhzasvu>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Iago Toral Quiroga <itoral@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, November 10th, 2023 at 15:01, Maxime Ripard <mripard@kernel.org>=
 wrote:

> On Fri, Nov 10, 2023 at 11:21:15AM +0000, Simon Ser wrote:
>=20
> > On Thursday, November 9th, 2023 at 20:17, Maxime Ripard mripard@kernel.=
org wrote:
> >=20
> > > > Can we add another function pointer to the struct drm_driver (or
> > > > similar) to do the allocation, and move the actual dmabuf handling
> > > > code into the core?
> > >=20
> > > Yeah, I agree here, it just seems easier to provide a global hook and=
 a
> > > somewhat sane default to cover all drivers in one go (potentially wit=
h
> > > additional restrictions, like only for modeset-only drivers or
> > > something).
> >=20
> > First off not all drivers are using the GEM DMA helpers (e.g. vc4 with
> > !vc5 does not).
>=20
> Right. vc4 pre-RPi4 is the exception though, so it's kind of what I
> meant by providing sane defaults: the vast majority of drivers are using
> GEM DMA helpers, and we should totally let drivers override that if
> relevant.
>=20
> Basically, we already have 2.5 citizen classes, I'd really like to avoid
> having 3 officially, even more so if it's not super difficult to do.
>=20
> > The heap code in this patch only works with drivers leveraging GEM DMA
> > helpers.
>=20
> We could add a new hook to drm_driver to allocate heaps, link to a
> default implementation in DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(), and
> then use that new hook in your new heap. It would already cover 40
> drivers at the moment, instead of just one, with all of them (but
> atmel-hlcdc maybe?) being in the same situation than RPi4-vc4 is.

As said in another e-mail, I really think the consequences of DMA heaps
need to be thought out on a per-driver basis. Moreover this approach
makes core DRM go in the wrong direction, deeper in midlayer territory.

> > Then maybe it's somewhat simple to cover typical display devices found
> > on split render/display SoCs, however for the rest it's going to be muc=
h
> > more complicated. For x86 typically there are multiple buffer placement=
s
> > supported by the GPU and we need to have one heap per possible placemen=
t.
> > And then figuring out all of the rules, priority and compatibility stuf=
f
> > is a whole other task in and of itself.
>=20
> But x86 typically doesn't have a split render/display setup, right?

So you're saying we should fix everything at once, but why is x86 not
part of "everything" then? x86 also has issues regarding buffer
placement. You're saying you don't want to fragment the ecosystem, but
it seems like there would still be "fragmentation" between split
render/display SoCs and the rest?

I'm having a hard time understanding your goals here.
