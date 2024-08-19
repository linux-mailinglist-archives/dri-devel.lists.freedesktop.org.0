Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13EC956EC2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1950910E2CB;
	Mon, 19 Aug 2024 15:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvDGou6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C2810E2CA;
 Mon, 19 Aug 2024 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724081503; x=1755617503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vWB2NhHvExaC2xMMPLID1hWA3Dc9vtqeLjtXhzviw6s=;
 b=LvDGou6sX6r2HuFMbN0UBPqPvvChT2F5cfkcBtC5l20kAiDAgSYUFAa7
 Dldq+wK0AoeVwXp/nfnMeuaEBbPuxiiTd5ELW/oEyz4SuAZ+pUsmNd+Ki
 yY3Lw2lD/PPuJLeN05ry2XReJcs3cV6HcDoH/uUGsyvdNkkzl8mFvJ8XX
 cZUc2N6tYsTLWkmTEBL8oZC9Q/OvZKObRCj0RD+7WMFN1PsHTurJiscf5
 OlcAm3IYDDznU4ZpVYJXb0Qj8Nxsmls/uEj95cCseWLValZ0IvXWsiqZT
 jOQfbbTaDfsJedsFi7P2x3gHwkU0z9i52rNAUrZkoiMZmMpClxufht9jH w==;
X-CSE-ConnectionGUID: KIzbo7rtQGiKSexjvLPtqg==
X-CSE-MsgGUID: OInMC2pvRUaWf2Hv7xMDfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26202935"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="26202935"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:31:43 -0700
X-CSE-ConnectionGUID: j6oSyBeCTEmfhnsZl9oObw==
X-CSE-MsgGUID: pOMkHzVwQS6J0TlahiyjFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="64807794"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.73])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:31:40 -0700
Date: Mon, 19 Aug 2024 17:31:36 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZsNlWP6v2pwvx00L@ashyti-mobl2.lan>
References: <ZrXZEpplb6YA9T_d@phenom.ffwll.local>
 <ZrXtiBKyCCh0a_ym@ashyti-mobl2.lan>
 <ZrnRuRGjxHe5zxuf@phenom.ffwll.local>
 <Zrn3QqOvOEW2EYB0@ashyti-mobl2.lan>
 <ZrogDGT326oSUZls@phenom.ffwll.local>
 <ZrrK5yjirbjJQSFL@DUT025-TGLU.fm.intel.com>
 <ZrtpM6ILa0laVR1N@phenom.ffwll.local>
 <ZruvEu0BafdsVjSi@DUT025-TGLU.fm.intel.com>
 <ZrwRsXT3gu3WgjCe@DUT025-TGLU.fm.intel.com>
 <ZsNT3aCHSXoD5N2a@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsNT3aCHSXoD5N2a@phenom.ffwll.local>
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

Hi Sima,

On Mon, Aug 19, 2024 at 04:17:01PM +0200, Daniel Vetter wrote:
> On Wed, Aug 14, 2024 at 02:08:49AM +0000, Matthew Brost wrote:
> > On Tue, Aug 13, 2024 at 07:08:02PM +0000, Matthew Brost wrote:
> > > On Tue, Aug 13, 2024 at 04:09:55PM +0200, Daniel Vetter wrote:
> > > > On Tue, Aug 13, 2024 at 02:54:31AM +0000, Matthew Brost wrote:
> > > > > On Mon, Aug 12, 2024 at 04:45:32PM +0200, Daniel Vetter wrote:
> > > > > > On Mon, Aug 12, 2024 at 01:51:30PM +0200, Andi Shyti wrote:
> > > > > > > On Mon, Aug 12, 2024 at 11:11:21AM +0200, Daniel Vetter wrote:
> > > > > > > > On Fri, Aug 09, 2024 at 11:20:56AM +0100, Andi Shyti wrote:
> > > > > > > > > On Fri, Aug 09, 2024 at 10:53:38AM +0200, Daniel Vetter wrote:
> > > > > > > > > > On Wed, Aug 07, 2024 at 11:05:19AM +0100, Andi Shyti wrote:
> > > > > > > > > > > This patch series concludes on the memory mapping fixes and
> > > > > > > > > > > improvements by allowing partial memory mapping for the cpu
> > > > > > > > > > > memory as well.
> > > > > > > > > > > 
> > > > > > > > > > > The partial memory mapping by adding an object offset was
> > > > > > > > > > > implicitely included in commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix
> > > > > > > > > > > Virtual Memory mapping boundaries calculation") for the gtt
> > > > > > > > > > > memory.
> > > > > > > > > > 
> > > > > > > > > > Does userspace actually care? Do we have a flag or something, so that
> > > > > > > > > > userspace can discover this?
> > > > > > > > > > 
> > > > > > > > > > Adding complexity of any kind is absolute no-go, unless there's a
> > > > > > > > > > userspace need. This also includes the gtt accidental fix.
> > > > > > > > > 
> > > > > > > > > Actually this missing functionality was initially filed as a bug
> > > > > > > > > by mesa folks. So that this patch was requested by them (Lionel
> > > > > > > > > is Cc'ed).
> > > > > > > > > 
> > > > > > > > > The tests cases that have been sent previously and I'm going to
> > > > > > > > > send again, are directly taken from mesa use cases.
> > > > > > > > 
> > > > > > > > Please add the relevant mesa MR to this patch then, and some relevant
> > > > > > > > explanations for how userspace detects this all and decides to use it.
> > > > > > > 
> > > > > > > AFAIK, there is no Mesa MR. We are adding a feature that was
> > > > > > > missing, but Mesa already supported it (indeed, Nimroy suggested
> > > > > > > adding the Fixes tag for this).
> > > > > > > 
> > > > > > > Also because, Mesa was receiving an invalid address error and
> > > > > > > asked to support the partial mapping of the memory.
> > > > > > 
> > > > > > Uh this sounds a bit too much like just yolo'ing uabi. There's two cases:
> > > > > > 
> > > > > > - Either this is a regression, it worked previously, mesa is now angry.
> > > > > >   Then we absolutely need a Fixes: tag, and we also need that for the
> > > > > >   preceeding work to re-enable this for gtt mappings.
> > > > > > 
> > > > > > - Or mesa is just plain wrong here, which is what my guess is. Because bo
> > > > > >   mappings have always been full-object (except for the old-style shm
> > > > > >   mmaps). In that case mesa needs to be fixed (because we're not going to
> > > > > >   backport old uapi).
> > > > > > 
> > > > > >   Also in that case, _if_ (and that's a really big if) we really want this
> > > > > >   uapi, we need it in xe too, it needs a proper mesa MR to use it, it
> > > > > 
> > > > > I looked at this code from Xe PoV to see if we support this and I think
> > > > > we actually do as our CPU fault handler more or less just calls
> > > > > ttm_bo_vm_fault_reserved which has similar code to this patch. So I
> > > > > think this actually a valid fix. Can't be 100% sure though as I quickly
> > > > > just reversed engineered this code and TTM.
> > > > 
> > > > That's the fault path, which isn't relevant here since you already have
> > > > the vma set up. The relevant path is the mmap path, which is common for
> > > > all gem drivers nowadays and the lookup handled entirely in the core. Well
> > > > except for i915-gem being absolutely massively over the top special in
> > > > everything. i915-gem being extremely special here is also why this patch
> > > > caught my attention, because it just furthers the divergence instead of at
> > > > least stopping. Since we've given up on trying to get i915-gem onto common
> > > > code and patterns that's not an option, and the reason why xe exists ...
> > > > 
> > > > Anyway that common gem bo mmap code code is in drm_gem_mmap and still only
> > > > allows exact matches.
> > > > 
> > > > Unless I'm completely blind, it does happen :-)
> > > > 
> > > 
> > > Not blind.
> > > 
> > > > > We don't have IGT test cases for this in Xe though, we likely should add
> > > > > some if mesa is doing this.
> > > > 
> > > > I'd expect they would fail ...
> > > >
> > > 
> > > Just wrote one, it fails.
> > > 
> > > So agree with everything you are saying. Sorry for the noise. 
> > 
> > To be clear what I agree with:
> > 
> > - Xe doesn't support partial mmaps, if the i915 / Mesa needs to support
> >   partial mmaps Xe needs changed in step with the i915 (it is a 1 line
> >   change in drm_gem_mmap which then will a community ack too)
> > - We need IGTs for partial mmaps in both i915 and Xe
> > - The Mesa use needs to be understood ensuring this isn't a bug on their
> >   end and this actually required
> > - If partial mmaps are actually required, I'd like to see this in 6.12
> >   for Xe as we are about to remove force probe
> 
> Fwiw I concur on this all. Maybe one thing to add is that if i915/mesa do
> not need partial mmaps, then we should also again removed them for gtt
> mmaps since that patch already slipped in.

I'm sorry, but I am not understanding why i915 should
deliberately stop supporting Mesa? This was requested by them
because there were bug reports filed.

There is a test developed by Lionel[1] that is now taken into
igt[2].

The gtt partial mapping did not slip in accidentaly, we fixed a
security issue where the partial mapping needed to be taken into
account.

Thanks,
Andi

[1] https://gitlab.freedesktop.org/llandwerlin/igt-gpu-tools/-/commits/wip/gem_mmap_offset-partial-unmap
[2] https://patchwork.freedesktop.org/series/137303/
