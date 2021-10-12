Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F222A42A0BD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 11:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6547E6E821;
	Tue, 12 Oct 2021 09:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B576E821
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 09:10:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="214034561"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="214034561"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 02:10:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="460282708"
Received: from acagidia-mobl.ger.corp.intel.com (HELO [10.249.254.15])
 ([10.249.254.15])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 02:10:07 -0700
Message-ID: <02f01e6df6c1a55e7444926d06cc0239001bfd91.camel@linux.intel.com>
Subject: Re: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Zack
 Rusin <zackr@vmware.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Tue, 12 Oct 2021 11:10:04 +0200
In-Reply-To: <1b80b739-3d7e-1228-03d5-eba11f58dbe0@amd.com>
References: <20211008173146.645127-1-zackr@vmware.com>
 <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
 <dbfb505f1034a2d725d76e30a26d2da0a850dd41.camel@vmware.com>
 <96a89fdb5a10141e87d7283720b4088461db722b.camel@linux.intel.com>
 <232f45e9-8748-1243-09bf-56763e6668b3@amd.com>
 <4041c72ff1d3d149437cedbcf3c598ae2238519d.camel@linux.intel.com>
 <1b80b739-3d7e-1228-03d5-eba11f58dbe0@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2021-10-12 at 10:27 +0200, Christian König wrote:
> Am 11.10.21 um 14:04 schrieb Thomas Hellström:
> > [SNIP]
> > > > Hmm, this looks very odd, because I remember reminding
> > > > Christian as
> > > > late as this spring that both vmwgfx and i915 sets up GPU
> > > > bindings
> > > > to
> > > > system buffers, as part of the review of a patch series pushing
> > > > a
> > > > couple of changes to the swapout path that apparently had
> > > > missed
> > > > this.
> > > Well that was the trigger to look more deeply into this and as
> > > far as
> > > I
> > > can tell TTM was never capable of doing this correctly.
> > So apart from the teardown, which appear to be an oversight when
> > the
> > system manager was introduced where do whe fail currently with
> > this?
> 
> During validation for example. Moving BOs into the system domain
> means 
> that they are potentially swapped out.
> 
> In other words when drivers are accessing BOs in the system domain
> they 
> always need to take care of TTM_TT_FLAG_SWAPPED manually.

Yes, that's true. Initially TTMs were populated on a page basis. All
users of a particular page was required to validate that it was
present. This was later changed to per-tt population by Jerome I think
and somewhere along the line that requirement on the user to validate
appears to have gotten lost as well.

> 
> > > > This more sounds like there have been changes to TTM happening
> > > > not
> > > > taking into account or knowing that TTM was designed for system
> > > > buffers
> > > > bound to GPU and that there were drivers actually doing that.
> > > > 
> > > > And there is still older code around clearly implying system
> > > > buffers
> > > > can be fenced, like ttm_bo_swapout(), and that there is dma
> > > > fences
> > > > signaling completion on work that has never touched the GPU,
> > > > not to
> > > > mention async eviction where a bo may be evicted to system but
> > > > has
> > > > tons
> > > > of outstanding fenced work in the pipe.
> > > > 
> > > > So if there has been a design change WRT this I believe it
> > > > should
> > > > have
> > > > been brought up on dri-devel to have it properly discussed so
> > > > affected
> > > > drivers could agree on the different options.
> > > > 
> > > > Perhaps Christian can enlighten us here. Christian?
> > > There are multiple occasions where we assume that BOs in the
> > > system
> > > domain are not accessible by the GPU, swapout and teardown are
> > > just
> > > two
> > > examples.
> > > 
> > At swapout we *do* wait for idle after moving to system, It's
> > relying
> > on the swap_notifier to unbind. That's why the swap_notifier is
> > there,
> > so swapout is working perfectly fine.
> 
> You can of course define that BOs are not swapable or call 
> ttm_bo_validate() with a system domain placement and then make sure
> they 
> are swapped in manually, but that is extremely hacky and bad design.
> 
> As far as I know that's what i915 does, but that doesn't mean that
> this 
> is a good idea.

It might be that it was not a good idea, but this was the initial
design for TTM. 

> 
> Additional to that I've already noted that I think this swap_notify 
> callback is not a good idea either. We should rather have a separate 
> TTM_PL_SWAPPED domain for this so that drivers are cleanly informed 
> about the state change.
> 
> > > When Dave reorganized the buffer move code we also had to insert
> > > waits
> > > for moves to complete for anything which goes into the SYSTEM
> > > domain.
> > > 
> > > Apart from that it certainly makes sense to have that
> > > restriction.
> > > Memory which is accessed by the hardware and not directly
> > > evictable
> > > must
> > > be accounted differently.
> > Could you elaborate a bit on this? From a swapout point of view, it
> > looks to me like SYSTEM is treated just like TT by TTM? Or is the
> > accounting you mention something amdgpu-specific and more related
> > to
> > the amd GEM domains than to the TTM memory types?
> 
> No, that is something the Android people came up with to improve the 
> shrinker behavior.
> 
> > Note that TTM was never designed to deal with GPU binding, but to
> > provide a set of placements or memory-types where the memory can be
> > mapped by the CPU and bound by the GPU. TT was a special case
> > solely
> > because of the mappable apertures. A bind mechanism had to be
> > provided
> > for TTM to be able to map TT buffers, and most drivers used that
> > bound
> > mechanism for convenience.
> 
> Well that's certainly not correct. Before Dave moved this back into
> the 
> drivers TTM had bind/unbind callbacks for the translation tables.

Yes it had, and as discussed when Dave removed them, these were solely
intended to be used from TTM's point of view to keep track of when data
was in mappable apertures, so that TTM could point CPU mappings
correctly. 

Now most later drivers found that convenient and used those also to
bind other memory types, like vmwgfx does for GMR and MOB memory for
example, but that never meant it was a required use-pattern. Don't have
time to dig commit messages up but IIRC this was mentioned a number of
times during the years.

> 
> It's just that vmwgfx was an exception and all other drivers where
> using 
> that correctly. This vmwgfx exception is now what Zack is trying to
> fix 
> here.

While vmwgfx is binding page-tables to system it also used the bind /
unbind mechanisms for other memory types for convenience. Other drivers
most probably used copy-paste and wasn't aware of the feature.

> 
> > So now if this is going to be changed, I think we need to
> > understand
> > why and think this through really thoroughly:
> > 
> > * What is not working and why (the teardown seems to be a trivial
> > fix).
> > * How did we end up here,
> > * What's the cost of fixing that up compared to refactoring the
> > drivers
> > that rely on bindable system memory,
> > * What's the justification of a system type at all if it's not GPU-
> > bindable, meaning it's basically equivalent to swapped-out shmem
> > with
> > the exception that it's mappable?
> 
> Well, once more that isn't correct. This is nothing new and as far as
> I 
> know that behavior existing as long as TTM existed.

I'm not sure whats incorrect? I'm trying to explain what the initial
design was, and it may of course have been bad and the one you propose
a better one and if required we certainly need to fix i915 to align
with a new one.

What worries me though, that if you perceive the design differently and
change things in TTM according to that perception that breaks drivers
that rely on the initial design and then force drivers to change
claiming they are incorrect without a thorough discussion on dri-devel,
that's IMHO not good.

So I guess we don't have much choice other than to refactor i915 to
align to not gpu-bind system, but could we meanwhile at least fix that
takedown ordering while that's being worked on?

/Thomas


