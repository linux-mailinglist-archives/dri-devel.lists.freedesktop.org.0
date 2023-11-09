Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A26A7E6D71
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 16:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3884D10E8C6;
	Thu,  9 Nov 2023 15:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB46310E8C6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699543921; x=1699803121;
 bh=CeI15/KsF4VAlVftvwCOmnZSGMmudTkmBTWY7EclMXw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=H+WY/emesFVp6ef0NJ/MB5GoUEVnuXsdFKjGI8Tv3mgHqZHo36e9VU0nSU20EbK/c
 kQEgr6GPvQ2XY6qJ0JDWdxHM2bupHXJ9KRtEsLWUIkVZlvH2zJOZg4kCo6ARu9wc+L
 V6DMMu+4F2BplrjIv4iknXsW8GKEgLPir6VdrB63j5xGc5f42NBLqTkZBaLfOS37Ji
 64fJZQWykJ90steAlTbg83RLPG6bZlLHZdLV1xiz/LC+l0ufe6PJ4foKpphldBOtb6
 Q3GLZbvp2l4vTduRgjFDD7mxfMXlcrjqmA9WVQWtYGKYfZrdlBDSF903A9vhEJE0d6
 0CG53+ef8KjwA==
Date: Thu, 09 Nov 2023 15:31:44 +0000
To: Maxime Ripard <mripard@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <bEg7cd-LFy1CzhAIao2Dt0cNFUFEb6D1ZhZN1Rec3w151EjXWpaXsOAs2MmvEPMxQjVhuE0k3qvuryxN6hJp5tJCU1b7EqSKHdTXte-UvmQ=@emersion.fr>
In-Reply-To: <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
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
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 9th, 2023 at 10:11, Maxime Ripard <mripard@kernel.org=
> wrote:

> > - Does this approach make sense to y'all in general?
>=20
> Makes sense to me :)

Great to hear!

> > - What would be a good name for the heap? "vc4" is maybe a bit naive an=
d
> > not precise enough. Something with "cma"? Do we need to plan a naming
> > scheme to accomodate for multiple vc4 devices?
>=20
> That's a general issue though that happens with pretty much all devices
> with a separate node for modesetting and rendering, so I don't think
> addressing it only for vc4 make sense, we should make it generic.
>=20
> So maybe something like "scanout"?
>=20
> One thing we need to consider too is that the Pi5 will have multiple
> display nodes (4(?) iirc) with different capabilities, vc4 being only
> one of them. This will impact that solution too.

I'm not sure trying to find a unique generic name for all split render/disp=
lay
SoC is a good idea:

- For the purposes of replacing DRM dumb buffers usage from v3d, we don't
  actually need a generic name, it's perfectly fine to hardcode a name here
  since vc4 is pretty much hardcoded there already.
- As you said, "scanout" may be ill-defined depending on the system. What i=
f
  a PCIe or USB device is plugged in? What if vkms is loaded? What if there=
 are
  multiple platform display devices? What does "scanout" mean then?
- A generic solution to advertise what DMA heaps a DRM display device is
  compatible with is probably better addressed by populating sysfs with new
  files. We've talked with Sima at XDC about adding a symlink pointing to t=
he
  DMA heap and extra metadata files describing priorities and such. However=
 we
  don't actually need that part for the purposes of v3d -- I think I'd rath=
er
  defer that until more DMA heaps are plumbed across the DRM drivers.

So I'd be in favor of using something descriptive, platform-specific for th=
e
heap name, something that user-space can't generically try to interpret or
parse.

> > - Right now root privileges are necessary to open the heap. Should we
> > allow everybody to open the heap by default (after all, user-space can
> > already allocate arbitrary amounts of GPU memory)? Should we leave it
> > up to user-space to solve this issue (via logind/seatd or a Wayland
> > protocol or something else)?
>=20
> I would have expected a udev rule to handle that?

Right. That sounds fine to me. (It's not the end of the world if v3d can't
allocate scanout-capable memory if the heap is not accessible -- just means=
 we
will go through an extra copy in the compositor. And we can always keep the=
 DRM
legacy primary node stuff as a fallback if there really are concerns.)

> > TODO:
> >=20
> > - Need to add !vc5 support.
>=20
> If by !vc5 you mean RPi0-3, then it's probably not needed there at all
> since it has a single node for both modesetting and rendering?

Ah that's a good point. So we can just not expose any heap for !vc5.
