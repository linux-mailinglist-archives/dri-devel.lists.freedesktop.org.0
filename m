Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6394E269A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 13:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED02B10E278;
	Mon, 21 Mar 2022 12:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3453C10E278;
 Mon, 21 Mar 2022 12:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647865991; x=1679401991;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+JQhiHkiAO6Sssy0vN6VXlc0UIjEstqV8G5naEXVdJQ=;
 b=eyFyG/aCA4V1QSxpKmjquZ+/k9Xr4UDw1fzH8TN+tCPCV2K0+07aA7Ar
 n295uuYoPKxdYt5S29zvJdqrep0IaExpVgomh4Z+Bd7AD9vQ+b+hv1SCC
 C7BKw8V2tXzzgusrHPlLKfDU1DAhTxHkF568HqcIhWr0mUdncHoxN2DEY
 OWkgc6V+cQCRbTW+ojP479s8ouPR4lM1js7BMz9vjgjFH0znpIrdDhXSL
 XJAiIyxBHkuy+FgS5tPyE3cNMQBF+XEHx80TUk19RH9IEYJHgUevRmYAa
 ynAfaDKoOPTp6bfRd5Iqi04wKHaro0huLZjL89UcOtmAE/hopPYGcQwE4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="320742040"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="320742040"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 05:33:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="636631396"
Received: from evinintel.ger.corp.intel.com (HELO [10.249.254.209])
 ([10.249.254.209])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 05:33:07 -0700
Message-ID: <29bde7b0e680e503fbf483a560616e2ce22cdd79.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] Drop wbinvd_on_all_cpus usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michael Cheng
 <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 21 Mar 2022 13:33:05 +0100
In-Reply-To: <abdc3b07-a05e-f67d-2135-a30421cb9d12@linux.intel.com>
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <4c86ae70-6f97-7a7c-1fd4-5e73ca29d0ba@linux.intel.com>
 <5db61477-6064-ada0-82a7-c1dc659dacad@linux.intel.com>
 <abdc3b07-a05e-f67d-2135-a30421cb9d12@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
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
Cc: wayne.boyer@intel.com, daniel.vetter@ffwll.ch, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-03-21 at 12:22 +0000, Tvrtko Ursulin wrote:
> 
> On 21/03/2022 11:03, Thomas Hellström wrote:
> > Hi, Tvrtko.
> > 
> > On 3/21/22 11:27, Tvrtko Ursulin wrote:
> > > 
> > > On 19/03/2022 19:42, Michael Cheng wrote:
> > > > To align with the discussion in [1][2], this patch series drops
> > > > all 
> > > > usage of
> > > > wbvind_on_all_cpus within i915 by either replacing the call
> > > > with certain
> > > > drm clflush helpers, or reverting to a previous logic.
> > > 
> > > AFAIU, complaint from [1] was that it is wrong to provide non x86
> > > implementations under the wbinvd_on_all_cpus name. Instead an
> > > arch 
> > > agnostic helper which achieves the same effect could be created.
> > > Does 
> > > Arm have such concept?
> > 
> > I also understand Linus' email like we shouldn't leak incoherent IO
> > to 
> > other architectures, meaning any remaining wbinvd()s should be X86
> > only.
> 
> The last part is completely obvious since it is a x86 instruction
> name.

Yeah, I meant the function implementing wbinvd() semantics.

> 
> But I think we can't pick a solution until we know how the concept
> maps 
> to Arm and that will also include seeing how the drm_clflush_sg for
> Arm 
> would look. Is there a range based solution, or just a big hammer
> there. 
> If the latter, then it is no good to churn all these reverts but
> instead 
> an arch agnostic wrapper, with a generic name, would be the way to
> go.

But my impression was that ARM would not need the range-based interface
either, because ARM is only for discrete and with discrete we're always
coherent.

So in essence it all would become:

1) Any cache flushing intended for incoherent IO is x86 only.
2) Prefer range-based flushing if possible and any implications sorted
out.

/Thomas


> 
> Regards,
> 
> Tvrtko
> 
> > Also, wbinvd_on_all_cpus() can become very costly, hence prefer the
> > range apis when possible if they can be verified not to degrade 
> > performance.
> > 
> > 
> > > 
> > > Given that the series seems to be taking a different route,
> > > avoiding 
> > > the need to call wbinvd_on_all_cpus rather than what [1] suggests
> > > (note drm_clflush_sg can still call it!?), concern is that the
> > > series 
> > > has a bunch of reverts and each one needs to be analyzed.
> > 
> > 
> > Agreed.
> > 
> > /Thomas
> > 
> > 
> > 
> > > 
> > > For instance looking at just the last one, 64b95df91f44, who has 
> > > looked at the locking consequences that commit describes:
> > > 
> > > """
> > >     Inside gtt_restore_mappings() we currently take the 
> > > obj->resv->lock, but
> > >     in the future we need to avoid taking this fs-reclaim tainted
> > > lock 
> > > as we
> > >     need to extend the coverage of the vm->mutex. Take advantage
> > > of the
> > >     single-threaded nature of the early resume phase, and do a
> > > single
> > >     wbinvd() to flush all the GTT objects en masse.
> > > 
> > > """
> > > 
> > > ?
> > > 
> > > Then there are suspend and freeze reverts which presumably can
> > > regress 
> > > the suspend times. Any data on those?
> > > 
> > > Adding Matt since he was the reviewer for that work so might
> > > remember 
> > > something.
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > 
> > > > [1]. 
> > > > https://lists.freedesktop.org/archives/dri-devel/2021-November/330928.html
> > > >  
> > > > 
> > > > [2].
> > > > https://patchwork.freedesktop.org/patch/475752/?series=99991&rev=5
> > > > 
> > > > Michael Cheng (4):
> > > >    i915/gem: drop wbinvd_on_all_cpus usage
> > > >    Revert "drm/i915/gem: Almagamate clflushes on suspend"
> > > >    i915/gem: Revert i915_gem_freeze to previous logic
> > > >    drm/i915/gt: Revert ggtt_resume to previous logic
> > > > 
> > > >   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  9 +---
> > > >   drivers/gpu/drm/i915/gem/i915_gem_pm.c     | 56
> > > > ++++++++++++++--------
> > > >   drivers/gpu/drm/i915/gt/intel_ggtt.c       | 17 +++----
> > > >   drivers/gpu/drm/i915/gt/intel_gtt.h        |  2 +-
> > > >   4 files changed, 46 insertions(+), 38 deletions(-)
> > > > 


