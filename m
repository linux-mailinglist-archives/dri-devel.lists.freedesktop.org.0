Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0ED3C687F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 04:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBCB6E02A;
	Tue, 13 Jul 2021 02:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Tue, 13 Jul 2021 02:26:42 UTC
Received: from smtp68.ord1d.emailsrvr.com (smtp68.ord1d.emailsrvr.com
 [184.106.54.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD2D6E029;
 Tue, 13 Jul 2021 02:26:42 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp17.relay.ord1d.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 93DFF2021E; 
 Mon, 12 Jul 2021 22:20:45 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v2 3/3] drm/i915/uapi: reject set_domain for
 discrete
Date: Mon, 12 Jul 2021 19:20:41 -0700
Message-ID: <7875243.I5qLFmRNRi@mizzik>
In-Reply-To: <YN9nkhxOX8wxfhp2@phenom.ffwll.local>
References: <20210701151019.1103315-1-matthew.auld@intel.com>
 <6b1fb400-07a6-bac0-929a-46991835d1f2@linux.intel.com>
 <YN9nkhxOX8wxfhp2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1983055.Jz6SuXlB5u";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Classification-ID: 0cbd5093-6dc4-4008-a1dc-7e1bb7f04296-1-1
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
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart1983055.Jz6SuXlB5u
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org, Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v2 3/3] drm/i915/uapi: reject set_domain for discrete
Date: Mon, 12 Jul 2021 19:20:41 -0700
Message-ID: <7875243.I5qLFmRNRi@mizzik>
In-Reply-To: <YN9nkhxOX8wxfhp2@phenom.ffwll.local>
References: <20210701151019.1103315-1-matthew.auld@intel.com> <6b1fb400-07a6-bac0-929a-46991835d1f2@linux.intel.com> <YN9nkhxOX8wxfhp2@phenom.ffwll.local>

On Friday, July 2, 2021 12:22:58 PM PDT Daniel Vetter wrote:
> On Fri, Jul 02, 2021 at 03:31:08PM +0100, Tvrtko Ursulin wrote:
> > 
> > On 01/07/2021 16:10, Matthew Auld wrote:
> > > The CPU domain should be static for discrete, and on DG1 we don't need
> > > any flushing since everything is already coherent, so really all this
> > 
> > Knowledge of the write combine buffer is assumed to be had by anyone involved?
> > 
> > > does is an object wait, for which we have an ioctl. Longer term the
> > > desired caching should be an immutable creation time property for the
> > > BO, which can be set with something like gem_create_ext.
> > > 
> > > One other user is iris + userptr, which uses the set_domain to probe all
> > > the pages to check if the GUP succeeds, however keeping the set_domain
> > > around just for that seems rather scuffed. We could equally just submit
> > > a dummy batch, which should hopefully be good enough, otherwise adding a
> > > new creation time flag for userptr might be an option. Although longer
> > > term we will also have vm_bind, which should also be a nice fit for
> > > this, so adding a whole new flag is likely overkill.
> > 
> > Execbuf sounds horrible. But it all reminds me of past work by Chris which is surprisingly hard to find in the archives. Patches like:
> > 
> > commit 7706a433388016983052a27c0fd74a64b1897ae7
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Wed Nov 8 17:04:07 2017 +0000
> > 
> >     drm/i915/userptr: Probe existence of backing struct pages upon creation
> >     Jason Ekstrand requested a more efficient method than userptr+set-domain
> >     to determine if the userptr object was backed by a complete set of pages
> >     upon creation. To be more efficient than simply populating the userptr
> >     using get_user_pages() (as done by the call to set-domain or execbuf),
> >     we can walk the tree of vm_area_struct and check for gaps or vma not
> >     backed by struct page (VM_PFNMAP). The question is how to handle
> >     VM_MIXEDMAP which may be either struct page or pfn backed...
> > 
> > commit 7ca21d3390eec23db99b8131ed18bc036efaba18
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Wed Nov 8 17:48:22 2017 +0000
> > 
> >     drm/i915/userptr: Add a flag to populate the userptr on creation
> >     Acquiring the backing struct pages for the userptr range is not free;
> >     the first client for userptr would insist on frequently creating userptr
> >     objects ahead of time and not use them. For that first client, deferring
> >     the cost of populating the userptr (calling get_user_pages()) to the
> >     actual execbuf was a substantial improvement. However, not all clients
> >     are the same, and most would like to validate that the userptr is valid
> >     and backed by struct pages upon creation, so offer a
> >     I915_USERPTR_POPULATE flag to do just that.
> >     Note that big difference between I915_USERPTR_POPULATE and the deferred
> >     scheme is that POPULATE is guaranteed to be synchronous, the result is
> >     known before the ioctl returns (and the handle exposed). However, due to
> >     system memory pressure, the object may be paged out before use,
> >     requiring them to be paged back in on execbuf (as may always happen).
> > 
> > At least with the first one I think I was skeptical, since probing at
> > point A makes a weak test versus userptr getting used at point B.
> > Populate is kind of same really when user controls the backing store. At
> > least these two arguments I think stand if we are trying to sell these
> > flags as validation. But if the idea is limited to pure preload, with no
> > guarantees that it keeps working by time of real use, then I guess it
> > may be passable.
> 
> Well we've thrown this out again because there was no userspace. But if
> this is requested by mesa, then the _PROBE flag should be entirely
> sufficient.
> 
> Since I don't want to hold up dg1 pciids on this it'd be nice if we could
> just go ahead with the dummy batch, if Ken/Jordan don't object - iris is
> the only umd that needs this.

I really would rather not have to submit a dummy batchbuffer.

The GL_AMD_pinned_memory extension requires throwing an error when
performing the initial userptr import if "the store cannot be mapped to
the GPU address space".  So this is not a weird thing that iris is
doing, it's part of the actual API we're implementing.

Today, I can use SET_DOMAIN which is almost no code.  In the future,
I'll have VM_BIND, which also makes sense.  In the meantime, this is
taking away my easy implementation for a bunch of code that I have to
keep supporting forever.

From the point of view of having a clean API...

- Using SET_DOMAIN is clearly a hack.  It works, but we're not intending
  to do anything with cache domains.  Dropping this API is a good plan.

- Passing a flag to USERPTR that says "please actually make sure it
  works" seems entirely reasonable to have as part of the API, and
  matches our userspace API.

- Using VM_BIND would also make sense and seems reasonable.

- Having to construct an entire batch and submit it for actual execution
  on the GPU just to check for an error case seems like awful design IMO.
  Error checking buffers is not what execbuf is for.  And it's not
  simple to use, either.

I checked with Jason and I believe he also prefers having a new flag on
the userptr ioctl.

--Ken

--nextPart1983055.Jz6SuXlB5u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmDs+HkACgkQW1vaBx1J
zDjVgg/+L6rSlihEIHkZwquWbgJz/xTb2AE5GtloWRG6sVQPKbOuwEGCmht2L2iu
OwlSezU6abXsOHfKo3BBesfloOLdpz2JvAlHNDqIjln4SozJbpnmPkeGsHhcUzkY
7ARUjWjDsSqNkgT6HeBLVg+wmkn2ENXEGtaNTMRcQXE9Y9P+Lh7fFK/2/T9cccde
KCV88OpFPG+4pEfLof4lFTi1OyrOsIminyujT9rFqrXZi6mHhW1Ph7aZnaOCB8bN
LJH1qYIemAp5XdNrSKD9/6GMaVn1qJxlDJ1REL6mJezGreCx05vj4Y2AGPs54tWe
HAbATAKPdh9x+j3R2vUGqO9fj9fW8FD2jn7XGiYQPK1rnlGgnrv/KWcyzlGdTf62
3NygXPXnNT8ftTn+S24Lx1QEIB/xhGXpZXSrDd54AGNzLPzoz4/S7uEvYnDFKZsQ
HfzqH3UcgAgvb6LsoPaqxGpBso4EXH3x0YhDg8VPikCXAEDgHi4YLFpXPfnU/fk5
3M9um6gM3AVBSr6xaEk8e4Gyf4qX9CtwGF4QUK4JXTzpvpVnpg66wswkzVXvi5sf
546kJRH4VRUk9pY8AtNhWmfy77NLD3mnxseqHdY+vFrJ7h/DDp3hnwEF4LFoF0V+
kwIl30Kek5kMk5t+DmphXTA4ID3z4mMzzp0Xyb0caDgjVUhjW4s=
=ptc9
-----END PGP SIGNATURE-----

--nextPart1983055.Jz6SuXlB5u--



