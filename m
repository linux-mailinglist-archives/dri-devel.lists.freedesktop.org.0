Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D40837BD99
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 15:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557876EB98;
	Wed, 12 May 2021 13:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77D36EB98;
 Wed, 12 May 2021 13:02:09 +0000 (UTC)
IronPort-SDR: mz37/KCvRAK/+6Bwc5enMohDDAmTitMRX2JhERlCtotZPLms+Uog84RYMXc32VGOdFeIUHvlTG
 P1DYajJlPlxA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179963349"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="179963349"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 06:02:06 -0700
IronPort-SDR: cfTayY3noWvjLgRlrcBfD+8S9sVW2vG5X0AHxR/ciDX6w4SCFEv/bw6BHISIOpnHtWhzHQ4LtB
 g91OWBZt57/A==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="609921226"
Received: from kjeldbeg-mobl2.ger.corp.intel.com ([10.249.254.168])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 06:02:05 -0700
Message-ID: <6e317ee2b22546a2333d3098f5cda1a59da62a1a.camel@linux.intel.com>
Subject: Re: [PATCH 6/7] drm/i915/ttm, drm/ttm: Introduce a TTM i915 gem
 object backend
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= "(Intel)"
 <thomas_os@shipmail.org>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Wed, 12 May 2021 15:02:02 +0200
In-Reply-To: <d0f0c55d-1784-922b-e9bd-0248cd7fb6af@amd.com>
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
 <8ac6bc5c-17c0-2ffd-7f8c-823ab3c8a858@amd.com>
 <88ea8e22-3314-60a4-8f4b-0b37de444b1d@shipmail.org>
 <8551810c-a095-3906-d982-7bc409140c48@amd.com>
 <0b7f32d8-bfb9-84dd-fea7-556dddded1cc@linux.intel.com>
 <a0277869-7244-aee0-3359-21dac8f5a724@amd.com>
 <e85e9bd7a28c8570c6429683d6d68ee0855afacb.camel@linux.intel.com>
 <d0f0c55d-1784-922b-e9bd-0248cd7fb6af@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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

On Wed, 2021-05-12 at 09:09 +0200, Christian König wrote:
> Am 12.05.21 um 09:05 schrieb Thomas Hellström:
> > On Wed, 2021-05-12 at 08:57 +0200, Christian König wrote:
> > > Am 11.05.21 um 16:28 schrieb Thomas Hellström:
> > > > On 5/11/21 4:09 PM, Christian König wrote:
> > > > > 
> > > > > Am 11.05.21 um 16:06 schrieb Thomas Hellström (Intel):
> > > > > > On 5/11/21 3:58 PM, Christian König wrote:
> > > > > > > Am 11.05.21 um 15:25 schrieb Thomas Hellström:
> > > > > > > > Most logical place to introduce TTM buffer objects is
> > > > > > > > as an
> > > > > > > > i915
> > > > > > > > gem object backend. We need to add some ops to account
> > > > > > > > for
> > > > > > > > added
> > > > > > > > functionality like delayed delete and LRU list
> > > > > > > > manipulation.
> > > > > > > > 
> > > > > > > > Initially we support only LMEM and SYSTEM memory, but
> > > > > > > > SYSTEM
> > > > > > > > (which in this case means evicted LMEM objects) is not
> > > > > > > > visible to i915 GEM yet. The plan is to move the i915
> > > > > > > > gem
> > > > > > > > system
> > > > > > > > region
> > > > > > > > over to the TTM system memory type in upcoming patches.
> > > > > > > > 
> > > > > > > > We set up GPU bindings directly both from LMEM and from
> > > > > > > > the
> > > > > > > > system
> > > > > > > > region,
> > > > > > > > as there is no need to use the legacy TTM_TT memory
> > > > > > > > type.
> > > > > > > > We reserve
> > > > > > > > that for future porting of GGTT bindings to TTM.
> > > > > > > > 
> > > > > > > > There are some changes to TTM to allow for purging
> > > > > > > > system
> > > > > > > > memory
> > > > > > > > buffer
> > > > > > > > objects and to refuse swapping of some objects:
> > > > > > > > Unfortunately i915
> > > > > > > > gem
> > > > > > > > still relies heavily on short-term object pinning, and
> > > > > > > > we've
> > > > > > > > chosen to
> > > > > > > > keep short-term-pinned buffer objects on the TTM LRU
> > > > > > > > lists
> > > > > > > > for now,
> > > > > > > > meaning that we need some sort of mechanism to tell TTM
> > > > > > > > they are not
> > > > > > > > swappable. A longer term goal is to get rid of the
> > > > > > > > short-
> > > > > > > > term
> > > > > > > > pinning.
> > > > > > > Well just use the eviction_valuable interface for this.
> > > > > > Yes, we do that for vram/lmem eviction, but we have nothing
> > > > > > similar
> > > > > > for system swapping. Do I understand you correctly that you
> > > > > > want me
> > > > > > to add a call to eviction_valuable() also for that instead
> > > > > > of
> > > > > > swap_possible()?
> > > > > You should already have that. eviction_valuable is called in
> > > > > both
> > > > > cases.
> > > > > 
> > > > Hmm. I can only see it called from ttm_mem_evict_first() which
> > > > is
> > > > not
> > > > in the swapping path? Or do I miss something?
> > > Mhm, looks like my recollection was wrong. We should probably
> > > move
> > > the
> > > call into the ttm_bo_evict_swapout_allowable() function.
> > Yes, I think we also need a convention whether it's called dma_resv
> > locked or not, since the helper accesses bo->mem, which should
> > really
> > only be done under reservation. At the same point, there is value
> > in
> > calling this function while holding the LRU lock.
> 
> You actually need to call it while holding the lock because eviction 
> otherwise ends up in an endless loop.
> 
> Trying to fix that for years, but so far no luck with that.
> 
> > Also, I wonder whether implementations of this callback might
> > encounter
> > unexpected data when called from the swapout path, because at least
> > the
> > helper assumes it not in system memory, since it is accessing bo-
> > > mem.start.
> > So unless we use a separate callback for swapout, there's some
> > auditing
> > to be done.
> 
> Please audit the existing callbacks and move the callback into the 
> function after doing that.
> 
> Thanks,
> Christian.

Would it be OK if I also move the kref_get_unless_zero() to before 
ttm_bo_evict_swapout_allowable() to make the code less sensitive to
surprises?

/Thomas


> 
> > 
> > Pls let me know what you think.
> > Thanks,
> > Thomas
> > 
> > 
> > 
> > > Christian.
> > > 
> > > > Thanks,
> > > > 
> > > > Thomas
> > > > 
> > > > 
> > > > 
> > 
> 


