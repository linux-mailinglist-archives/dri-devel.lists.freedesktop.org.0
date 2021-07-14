Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0C3C8449
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABEF6E237;
	Wed, 14 Jul 2021 12:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7686E233;
 Wed, 14 Jul 2021 12:08:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="210311656"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="210311656"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 05:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="459965915"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 14 Jul 2021 05:08:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 14 Jul 2021 15:08:43 +0300
Date: Wed, 14 Jul 2021 15:08:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: document caching related bits
Message-ID: <YO7Ty4y3k+zJ++Lm@intel.com>
References: <20210713104554.2381406-1-matthew.auld@intel.com>
 <YO23Y3PUS22FaXDC@intel.com>
 <CAM0jSHOx=WVbzfQzn=kL-5qaG4B3dxPLOimkvUdv6HFJymZeZw@mail.gmail.com>
 <YO3RsxZHUe5imN3q@intel.com>
 <CAM0jSHOsqPUOWCJu_Ti3gW-fnpWF2CtUoo-qt-aMWExAwDDT5A@mail.gmail.com>
 <YO3fhvKCo8eXrmst@intel.com> <YO7HqVPtY2GpbD77@phenom.ffwll.local>
 <YO7NvY3Mb2wgPFAi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YO7NvY3Mb2wgPFAi@intel.com>
X-Patchwork-Hint: comment
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 02:42:53PM +0300, Ville Syrjälä wrote:
> On Wed, Jul 14, 2021 at 01:16:57PM +0200, Daniel Vetter wrote:
> > On Tue, Jul 13, 2021 at 09:46:30PM +0300, Ville Syrjälä wrote:
> > > On Tue, Jul 13, 2021 at 07:24:23PM +0100, Matthew Auld wrote:
> > > > On Tue, 13 Jul 2021 at 18:47, Ville Syrjälä
> > > > <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > On Tue, Jul 13, 2021 at 05:13:37PM +0100, Matthew Auld wrote:
> > > > > > On Tue, 13 Jul 2021 at 16:55, Ville Syrjälä
> > > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > > >
> > > > > > > On Tue, Jul 13, 2021 at 11:45:50AM +0100, Matthew Auld wrote:
> > > > > > > > +     /**
> > > > > > > > +      * @cache_coherent:
> > > > > > > > +      *
> > > > > > > > +      * Track whether the pages are coherent with the GPU if reading or
> > > > > > > > +      * writing through the CPU cache.
> > > > > > > > +      *
> > > > > > > > +      * This largely depends on the @cache_level, for example if the object
> > > > > > > > +      * is marked as I915_CACHE_LLC, then GPU access is coherent for both
> > > > > > > > +      * reads and writes through the CPU cache.
> > > > > > > > +      *
> > > > > > > > +      * Note that on platforms with shared-LLC support(HAS_LLC) reads through
> > > > > > > > +      * the CPU cache are always coherent, regardless of the @cache_level. On
> > > > > > > > +      * snooping based platforms this is not the case, unless the full
> > > > > > > > +      * I915_CACHE_LLC or similar setting is used.
> > > > > > > > +      *
> > > > > > > > +      * As a result of this we need to track coherency separately for reads
> > > > > > > > +      * and writes, in order to avoid superfluous flushing on shared-LLC
> > > > > > > > +      * platforms, for reads.
> > > > > > > > +      *
> > > > > > > > +      * I915_BO_CACHE_COHERENT_FOR_READ:
> > > > > > > > +      *
> > > > > > > > +      * When reading through the CPU cache, the GPU is still coherent. Note
> > > > > > > > +      * that no data has actually been modified here, so it might seem
> > > > > > > > +      * strange that we care about this.
> > > > > > > > +      *
> > > > > > > > +      * As an example, if some object is mapped on the CPU with write-back
> > > > > > > > +      * caching, and we read some page, then the cache likely now contains
> > > > > > > > +      * the data from that read. At this point the cache and main memory
> > > > > > > > +      * match up, so all good. But next the GPU needs to write some data to
> > > > > > > > +      * that same page. Now if the @cache_level is I915_CACHE_NONE and the
> > > > > > > > +      * the platform doesn't have the shared-LLC, then the GPU will
> > > > > > > > +      * effectively skip invalidating the cache(or however that works
> > > > > > > > +      * internally) when writing the new value.  This is really bad since the
> > > > > > > > +      * GPU has just written some new data to main memory, but the CPU cache
> > > > > > > > +      * is still valid and now contains stale data. As a result the next time
> > > > > > > > +      * we do a cached read with the CPU, we are rewarded with stale data.
> > > > > > > > +      * Likewise if the cache is later flushed, we might be rewarded with
> > > > > > > > +      * overwriting main memory with stale data.
> > > > > > > > +      *
> > > > > > > > +      * I915_BO_CACHE_COHERENT_FOR_WRITE:
> > > > > > > > +      *
> > > > > > > > +      * When writing through the CPU cache, the GPU is still coherent. Note
> > > > > > > > +      * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> > > > > > > > +      *
> > > > > > > > +      * This is never set when I915_CACHE_NONE is used for @cache_level,
> > > > > > > > +      * where instead we have to manually flush the caches after writing
> > > > > > > > +      * through the CPU cache. For other cache levels this should be set and
> > > > > > > > +      * the object is therefore considered coherent for both reads and writes
> > > > > > > > +      * through the CPU cache.
> > > > > > >
> > > > > > > I don't remember why we have this read vs. write split and this new
> > > > > > > documentation doesn't seem to really explain it either.
> > > > > >
> > > > > > Hmm, I attempted to explain that earlier:
> > > > > >
> > > > > > * Note that on platforms with shared-LLC support(HAS_LLC) reads through
> > > > > > * the CPU cache are always coherent, regardless of the @cache_level. On
> > > > > > * snooping based platforms this is not the case, unless the full
> > > > > > * I915_CACHE_LLC or similar setting is used.
> > > > > > *
> > > > > > * As a result of this we need to track coherency separately for reads
> > > > > > * and writes, in order to avoid superfluous flushing on shared-LLC
> > > > > > * platforms, for reads.
> > > > > >
> > > > > > So AFAIK it's just because shared-LLC can be coherent for reads, while
> > > > > > also not being coherent for writes(CACHE_NONE),
> > > > >
> > > > > CPU vs. GPU is fully coherent when it comes to LLC. Or at least I've
> > > > > never heard of any mechanism that would make it only partially coherent.
> > > > 
> > > > What do you mean by "comes to LLC", are you talking about HAS_LLC() or
> > > > I915_CACHE_LLC?
> > > 
> > > I'm talking about the actual cache.
> > > 
> > > > 
> > > > If you set I915_CACHE_LLC, then yes it is fully coherent for both
> > > > HAS_LLC() and HAS_SNOOP().
> > > > 
> > > > If you set I915_CACHE_NONE, then reads are still coherent on
> > > > HAS_LLC(),
> > > 
> > > Reads and writes both. The only thing that's not coherent is the
> > > display engine.
> > 
> > There's a lot of code which seems to disagree,
> 
> Can't even imagine why anyone would make a cache coherency protocol
> that only handles reads but not writes...
> 
> > plus there's now this new
> > MOCS thing.
> 
> That's just a full LLC bypass AFAICS. Can't omit invalidates if
> you use that one or you'll just get stale data from the cache
> on reads as well.

And just to reiterate that the current "reads are coherent" thing
works is because the only non-coherent agent (display engine) never
writes anything. If/when we implement writeback support we can no
longer skip the invalidate even on LLC machines when reading from
a writeback buffer.

-- 
Ville Syrjälä
Intel
