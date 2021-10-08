Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C24334272EA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 23:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E09B6E50E;
	Fri,  8 Oct 2021 21:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029286E50E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 21:14:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="249958263"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="249958263"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:14:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="569154310"
Received: from lenovo-x280.ger.corp.intel.com (HELO [10.249.254.98])
 ([10.249.254.98])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:14:00 -0700
Message-ID: <96a89fdb5a10141e87d7283720b4088461db722b.camel@linux.intel.com>
Subject: Re: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Zack Rusin <zackr@vmware.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: "christian.koenig@amd.com" <christian.koenig@amd.com>
Date: Fri, 08 Oct 2021 23:13:58 +0200
In-Reply-To: <dbfb505f1034a2d725d76e30a26d2da0a850dd41.camel@vmware.com>
References: <20211008173146.645127-1-zackr@vmware.com>
 <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
 <dbfb505f1034a2d725d76e30a26d2da0a850dd41.camel@vmware.com>
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

On Fri, 2021-10-08 at 20:40 +0000, Zack Rusin wrote:
> On Fri, 2021-10-08 at 22:28 +0200, Thomas Hellström wrote:
> > On Fri, 2021-10-08 at 13:31 -0400, Zack Rusin wrote:
> > > This is a largely trivial set that makes vmwgfx support module
> > > reload
> > > and PCI hot-unplug. It also makes IGT's core_hotunplug pass
> > > instead
> > > of kernel oops'ing.
> > > 
> > > The one "ugly" change is the "Introduce a new placement for MOB
> > > page
> > > tables". It seems vmwgfx has been violating a TTM assumption that
> > > TTM_PL_SYSTEM buffers are never fenced for a while. Apart from a
> > > kernel
> > > oops on module unload it didn't seem to wreak too much havoc, but
> > > we
> > > shouldn't be abusing TTM. So to solve it we're introducing a new
> > > placement, which is basically system, but can deal with fenced
> > > bo's.
> > > 
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > Hi, Zack,
> > 
> > What part of TTM doesn't allow fenced system memory currently? It
> > was
> > certainly designed to allow that and vmwgfx has been relying on
> > that
> > since the introduction of MOBs IIRC. Also i915 is currently relying
> > on
> > that.
> 
> It's the shutdown. BO's allocated through the ttm system manager
> might
> be busy during ttm_bo_put which results in them being scheduled for a
> delayed deletion. The ttm system manager is disabled before the final
> delayed deletion is ran in ttm_device_fini. This results in crashes
> during freeing of the BO resources because they're trying to remove
> themselves from a no longer existent ttm_resource_manager (e.g. in
> IGT's core_hotunplug on vmwgfx)
> 
> During review of the trivial patch that was fixing it in ttm
> Christian
> said that system domain buffers must be idle or otherwise a number of
> assumptions in ttm breaks:
> https://lists.freedesktop.org/archives/dri-devel/2021-September/324027.html
> And later clarified that in fact system domain buffers being fenced
> is
> illegal from a design point of view:
> https://lists.freedesktop.org/archives/dri-devel/2021-September/324697.html

Hmm, this looks very odd, because I remember reminding Christian as
late as this spring that both vmwgfx and i915 sets up GPU bindings to
system buffers, as part of the review of a patch series pushing a
couple of changes to the swapout path that apparently had missed this.

This more sounds like there have been changes to TTM happening not
taking into account or knowing that TTM was designed for system buffers
bound to GPU and that there were drivers actually doing that. 

And there is still older code around clearly implying system buffers
can be fenced, like ttm_bo_swapout(), and that there is dma fences
signaling completion on work that has never touched the GPU, not to
mention async eviction where a bo may be evicted to system but has tons
of outstanding fenced work in the pipe.

So if there has been a design change WRT this I believe it should have
been brought up on dri-devel to have it properly discussed so affected
drivers could agree on the different options.

Perhaps Christian can enlighten us here. Christian?

/Thomas


> 
> z


