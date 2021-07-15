Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CFB3CA54E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9706E89F;
	Thu, 15 Jul 2021 18:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp87.ord1d.emailsrvr.com (smtp87.ord1d.emailsrvr.com
 [184.106.54.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEF36E89E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 18:21:11 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp3.relay.ord1d.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id E54F4601AF; 
 Thu, 15 Jul 2021 14:21:09 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/i915/userptr: Probe existence of backing struct
 pages upon creation
Date: Thu, 15 Jul 2021 11:21:02 -0700
Message-ID: <2516720.Dzi6zm1QmA@mizzik>
In-Reply-To: <2098303d-5b94-d9ff-7bd4-a7ba197a7431@linux.intel.com>
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <YPAW9f/2oJV4UNnB@phenom.ffwll.local>
 <2098303d-5b94-d9ff-7bd4-a7ba197a7431@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2648525.DymQHBDzp5";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Classification-ID: dc1ff6a0-167f-4ca9-8158-53d1a4e89471-1-1
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
Cc: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart2648525.DymQHBDzp5
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
To: Daniel Vetter <daniel@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jordan Justen <jordan.l.justen@intel.com>, Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>, Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH 3/4] drm/i915/userptr: Probe existence of backing struct pages upon creation
Date: Thu, 15 Jul 2021 11:21:02 -0700
Message-ID: <2516720.Dzi6zm1QmA@mizzik>
In-Reply-To: <2098303d-5b94-d9ff-7bd4-a7ba197a7431@linux.intel.com>
References: <20210715101536.2606307-1-matthew.auld@intel.com> <YPAW9f/2oJV4UNnB@phenom.ffwll.local> <2098303d-5b94-d9ff-7bd4-a7ba197a7431@linux.intel.com>

On Thursday, July 15, 2021 4:27:44 AM PDT Tvrtko Ursulin wrote:
> 
> On 15/07/2021 12:07, Daniel Vetter wrote:
> > On Thu, Jul 15, 2021 at 11:33:10AM +0100, Tvrtko Ursulin wrote:
> >>
> >> On 15/07/2021 11:15, Matthew Auld wrote:
> >>> From: Chris Wilson <chris@chris-wilson.co.uk>
> >>>
> >>> Jason Ekstrand requested a more efficient method than userptr+set-domain
> >>> to determine if the userptr object was backed by a complete set of pages
> >>> upon creation. To be more efficient than simply populating the userptr
> >>> using get_user_pages() (as done by the call to set-domain or execbuf),
> >>> we can walk the tree of vm_area_struct and check for gaps or vma not
> >>> backed by struct page (VM_PFNMAP). The question is how to handle
> >>> VM_MIXEDMAP which may be either struct page or pfn backed...
> >>>
> >>> With discrete are going to drop support for set_domain(), so offering a
> >>> way to probe the pages, without having to resort to dummy batches has
> >>> been requested.
> >>>
> >>> v2:
> >>> - add new query param for the PROPBE flag, so userspace can easily
> >>>     check if the kernel supports it(Jason).
> >>> - use mmap_read_{lock, unlock}.
> >>> - add some kernel-doc.
> >>
> >> 1)
> >>
> >> I think probing is too weak to be offered as part of the uapi. What probes
> >> successfully at create time might not be there anymore at usage time. So if
> >> the pointer is not trusted at one point, why should it be at a later stage?
> >>
> >> Only thing which works for me is populate (so get_pages) at create time. But
> >> again with no guarantees they are still there at use time clearly
> >> documented.
> > 
> > Populate is exactly as racy as probe. We don't support pinned userptr
> > anymore.
> 
> Yes, wrote so myself - "..again with no guarantees they are still there 
> at use time..".
> 
> Perhaps I don't understand what problem is probe supposed to solve. It 
> doesn't deal 1:1 with set_domain removal since that one actually did 
> get_pages so that would be populate. But fact remains regardless that if 
> userspace is given a pointer it doesn't trust, _and_ wants the check it 
> for this reason or that, then probe solves nothing. Unless there is 
> actually at minimum some protocol to reply to whoever sent the pointer 
> like "not that pointer please".

That's exactly the point.  GL_AMD_pinned_memory requires us the OpenGL
implementation to return an error for "not that pointer, please", at the
time when said pointer is supplied - not at first use.

Sure, there can be reasons why it might seem fine up front, and not work
later.  But an early check of "just no, you're doing it totally wrong"
at the right moment can be helpful for application developers.  While it
shouldn't really happen, if it ever did, it would be a lot more obvious
to debug than "much later on, when something randomly flushed the GPU
commands we were building, something went wrong, and we don't know why."

--Ken

--nextPart2648525.DymQHBDzp5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmDwfI4ACgkQW1vaBx1J
zDjFYBAAkubtag4uWg/OExHbt+enjMf8iS6ixHgDGNmUyx/1F3DVN9b4zcc0P3XB
MAglp+DwZ4ckynpSF4A1oZX4fMlzRmNQhsU6A8BfInZYYBO5/nE5xgq1ztI/SyDM
CVhTE7k+++50S1xdRs4/BS5z6m7ZgwRrj1FM4x/gFKysF95RNSx+gFzggd4vPnR/
SGNK4537rVhMiMrcpqTr/0Ia+Av+wJ5lEoSRw1tJ3DH/fjOFEg3Ne9gmr2W3pyES
xlChzWgEvuCYpi5BanpWMMhlmq+zSg4VYtLdcqUCdpDewhKtUo3ODB4xPF4q9l+p
lvT4b98ROqy57dGDBw3i7ojkB8Ond3tKhoL1Hy1NoHFlTzNMmgEHR4Pn3Rox6Vi7
zer2Hu3Kth6xgQWEnYxUdrAzTTKlrFhqu7nPrB+K6wPP4Qen1Md4pjiiFea/ur8X
Po0cqu9Kp8g7CAtssYhrAOEGr3ZaGjWmoJk5WPAdaHwEsjLcVJCD/3m+icc4UJty
xczR/v98Po+fcaq8/1kZ1+52xY4TvPZ0xw4qrn8zzYdYDkDgLqtdigf/M/sqqVHL
umMIjKEuNinRatYQDhugXmiATcEUJ9bJLisutQky7u8UCLW1MJC0JyOgJgyvWEEo
qMIwQ8JpIdLHR9DCh4nylxPn0fmEXg6LEsBKo4CgIbiSRT7HZZU=
=/79x
-----END PGP SIGNATURE-----

--nextPart2648525.DymQHBDzp5--



