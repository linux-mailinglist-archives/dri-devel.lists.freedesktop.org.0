Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629E8428C8C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 14:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE7489E2A;
	Mon, 11 Oct 2021 12:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DE489E2A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 12:05:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="207663910"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="207663910"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 05:04:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="523791723"
Received: from sfhansen-mobl1.ger.corp.intel.com (HELO [10.249.254.194])
 ([10.249.254.194])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 05:04:18 -0700
Message-ID: <4041c72ff1d3d149437cedbcf3c598ae2238519d.camel@linux.intel.com>
Subject: Re: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Zack
 Rusin <zackr@vmware.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Mon, 11 Oct 2021 14:04:16 +0200
In-Reply-To: <232f45e9-8748-1243-09bf-56763e6668b3@amd.com>
References: <20211008173146.645127-1-zackr@vmware.com>
 <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
 <dbfb505f1034a2d725d76e30a26d2da0a850dd41.camel@vmware.com>
 <96a89fdb5a10141e87d7283720b4088461db722b.camel@linux.intel.com>
 <232f45e9-8748-1243-09bf-56763e6668b3@amd.com>
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

On Mon, 2021-10-11 at 10:17 +0200, Christian König wrote:
> Am 08.10.21 um 23:13 schrieb Thomas Hellström:
> > On Fri, 2021-10-08 at 20:40 +0000, Zack Rusin wrote:
> > > On Fri, 2021-10-08 at 22:28 +0200, Thomas Hellström wrote:
> > > > On Fri, 2021-10-08 at 13:31 -0400, Zack Rusin wrote:
> > > > > This is a largely trivial set that makes vmwgfx support
> > > > > module
> > > > > reload
> > > > > and PCI hot-unplug. It also makes IGT's core_hotunplug pass
> > > > > instead
> > > > > of kernel oops'ing.
> > > > > 
> > > > > The one "ugly" change is the "Introduce a new placement for
> > > > > MOB
> > > > > page
> > > > > tables". It seems vmwgfx has been violating a TTM assumption
> > > > > that
> > > > > TTM_PL_SYSTEM buffers are never fenced for a while. Apart
> > > > > from a
> > > > > kernel
> > > > > oops on module unload it didn't seem to wreak too much havoc,
> > > > > but
> > > > > we
> > > > > shouldn't be abusing TTM. So to solve it we're introducing a
> > > > > new
> > > > > placement, which is basically system, but can deal with
> > > > > fenced
> > > > > bo's.
> > > > > 
> > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Hi, Zack,
> > > > 
> > > > What part of TTM doesn't allow fenced system memory currently?
> > > > It
> > > > was
> > > > certainly designed to allow that and vmwgfx has been relying on
> > > > that
> > > > since the introduction of MOBs IIRC. Also i915 is currently
> > > > relying
> > > > on
> > > > that.
> > > It's the shutdown. BO's allocated through the ttm system manager
> > > might
> > > be busy during ttm_bo_put which results in them being scheduled
> > > for a
> > > delayed deletion. The ttm system manager is disabled before the
> > > final
> > > delayed deletion is ran in ttm_device_fini. This results in
> > > crashes
> > > during freeing of the BO resources because they're trying to
> > > remove
> > > themselves from a no longer existent ttm_resource_manager (e.g.
> > > in
> > > IGT's core_hotunplug on vmwgfx)
> > > 
> > > During review of the trivial patch that was fixing it in ttm
> > > Christian
> > > said that system domain buffers must be idle or otherwise a
> > > number of
> > > assumptions in ttm breaks:
> > > 
> > > 

> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2021-September%2F324027.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2391a82208e6464c8db208d98aa08dd2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637693244449717755%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=BZ3C00rZDDdpKNoGa0PYwoHeM89uVzN1Md4iN2qkGB0%3D&amp;reserved=0
> > > And later clarified that in fact system domain buffers being
> > > fenced
> > > is
> > > illegal from a design point of view:
> > > 
> > > 

> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2021-September%2F324697.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2391a82208e6464c8db208d98aa08dd2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637693244449717755%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3eXNqeh7Ifqe6lllRMvdfJX%2F7rX7%2FqH3wldNE5AodMc%3D&amp;reserved=0
> > Hmm, this looks very odd, because I remember reminding Christian as
> > late as this spring that both vmwgfx and i915 sets up GPU bindings
> > to
> > system buffers, as part of the review of a patch series pushing a
> > couple of changes to the swapout path that apparently had missed
> > this.
> 
> Well that was the trigger to look more deeply into this and as far as
> I 
> can tell TTM was never capable of doing this correctly.

So apart from the teardown, which appear to be an oversight when the
system manager was introduced where do whe fail currently with this? 

> 
> > This more sounds like there have been changes to TTM happening not
> > taking into account or knowing that TTM was designed for system
> > buffers
> > bound to GPU and that there were drivers actually doing that.
> > 
> > And there is still older code around clearly implying system
> > buffers
> > can be fenced, like ttm_bo_swapout(), and that there is dma fences
> > signaling completion on work that has never touched the GPU, not to
> > mention async eviction where a bo may be evicted to system but has
> > tons
> > of outstanding fenced work in the pipe.
> > 
> > So if there has been a design change WRT this I believe it should
> > have
> > been brought up on dri-devel to have it properly discussed so
> > affected
> > drivers could agree on the different options.
> > 
> > Perhaps Christian can enlighten us here. Christian?
> 
> There are multiple occasions where we assume that BOs in the system 
> domain are not accessible by the GPU, swapout and teardown are just
> two 
> examples.
> 

At swapout we *do* wait for idle after moving to system, It's relying
on the swap_notifier to unbind. That's why the swap_notifier is there,
so swapout is working perfectly fine.


> When Dave reorganized the buffer move code we also had to insert
> waits 
> for moves to complete for anything which goes into the SYSTEM domain.
> 
> Apart from that it certainly makes sense to have that restriction. 
> Memory which is accessed by the hardware and not directly evictable
> must 
> be accounted differently.

Could you elaborate a bit on this? From a swapout point of view, it
looks to me like SYSTEM is treated just like TT by TTM? Or is the
accounting you mention something amdgpu-specific and more related to
the amd GEM domains than to the TTM memory types?

Note that TTM was never designed to deal with GPU binding, but to
provide a set of placements or memory-types where the memory can be
mapped by the CPU and bound by the GPU. TT was a special case solely
because of the mappable apertures. A bind mechanism had to be provided
for TTM to be able to map TT buffers, and most drivers used that bound
mechanism for convenience.

So now if this is going to be changed, I think we need to understand
why and think this through really thoroughly:

* What is not working and why (the teardown seems to be a trivial fix).
* How did we end up here,
* What's the cost of fixing that up compared to refactoring the drivers
that rely on bindable system memory,
* What's the justification of a system type at all if it's not GPU-
bindable, meaning it's basically equivalent to swapped-out shmem with
the exception that it's mappable?

It's probably a non-trivial effort to refactor i915 to not use system
for gpu-binding and in that case I think we need some solid
justification why we need to do that rather than fix up what's not
working with TTM + bindable system:

So could you please elaborate (assuming that the teardown is fixable)
on the other parts that don't work.

Thanks

/Thomas


> 
> Regards,
> Christian.
> 
> > 
> > /Thomas
> > 
> > 
> > > z
> > 
> 


