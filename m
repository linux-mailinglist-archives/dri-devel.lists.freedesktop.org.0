Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4267CE26E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 18:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D1110E00A;
	Wed, 18 Oct 2023 16:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE2810E00A;
 Wed, 18 Oct 2023 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697645541; x=1729181541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nGqblrlxfU5rTc5M5fBrkYXS9WCT/h6zOCksAxopYT8=;
 b=iKt0p5LRuwtApZLneyUf3dhGhmh8cIeyjF2Eg39fcYjSLe0+prOiz9tS
 nijASFy9sDmu9ZvADtnYozN3EE2Su43wKXAcOAuq733nICOV83Uab8ytF
 b1Tv1bnarUP1xQh4wiQrKOpMy990MM50ip2RkJGYrzlVo0q/2QpJpm+2N
 HckzjuQmKxvye0OmiFxXLa9IGKquHEhEGLX3ulYR4BY502QQCvozRJ5lo
 f14/mqRXSfsjmGerPu1dmr72OUcRtvBLdU0kE06ICWf34lsshIre7dykl
 Fxm25T8+jKwg7NHOQxELqvqA2vIEvz08jPi90labJ49mahaYN7lKgauct w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452519833"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="452519833"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 09:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822482667"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="822482667"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by fmsmga008.fm.intel.com with ESMTP; 18 Oct 2023 09:07:57 -0700
Date: Thu, 19 Oct 2023 00:19:34 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
Message-ID: <ZTAFltHj1mNS/Ok3@liuzhao-OptiPlex-7080>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <64265ef8725fe_375f7e294a@iweiny-mobl.notmuch>
 <fdc8a470-1e6b-815d-e367-a9df1b0b14dd@linux.intel.com>
 <2177327.1BCLMh4Saa@suse>
 <1b341218-f0e2-a613-2ac6-107064a813ca@linux.intel.com>
 <ZDku5SJhl2Ve51UC@liuzhao-OptiPlex-7080>
 <048d4dba-153f-5d32-75fc-d7e7144d1e9c@linux.intel.com>
 <ZD1daLWcOslJ/wdt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZD1daLWcOslJ/wdt@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Thomas =?utf-8?B?SGVsbHN0cu+/vW0=?= <thomas.hellstrom@linux.intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Zhao Liu <zhao1.liu@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Christian =?utf-8?B?S++/vW5pZw==?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo and Tvrtko,

It seems this series is missed in v6.5.
This work should not be forgotten. Let me rebase and refresh the version.

Regards,
Zhao

On Mon, Apr 17, 2023 at 10:53:28AM -0400, Rodrigo Vivi wrote:
> Date: Mon, 17 Apr 2023 10:53:28 -0400
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
>  gem/i915_gem_execbuffer.c
> 
> On Mon, Apr 17, 2023 at 12:24:45PM +0100, Tvrtko Ursulin wrote:
> > 
> > On 14/04/2023 11:45, Zhao Liu wrote:
> > > Hi Tvrtko,
> > > 
> > > On Wed, Apr 12, 2023 at 04:45:13PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > [snip]
> > > 
> > > > > 
> > > > > [snip]
> > > > > > However I am unsure if disabling pagefaulting is needed or not. Thomas,
> > > > > > Matt, being the last to touch this area, perhaps you could have a look?
> > > > > > Because I notice we have a fallback iomap path which still uses
> > > > > > io_mapping_map_atomic_wc. So if kmap_atomic to kmap_local conversion is
> > > > > > safe, does the iomap side also needs converting to
> > > > > > io_mapping_map_local_wc? Or they have separate requirements?
> > > > > 
> > > > > AFAIK, the requirements for io_mapping_map_local_wc() are the same as for
> > > > > kmap_local_page(): the kernel virtual address is _only_ valid in the caller
> > > > > context, and map/unmap nesting must be done in stack-based ordering (LIFO).
> > > > > 
> > > > > I think a follow up patch could safely switch to io_mapping_map_local_wc() /
> > > > > io_mapping_unmap_local_wc since the address is local to context.
> > > > > 
> > > > > However, not being an expert, reading your note now I suspect that I'm missing
> > > > > something. Can I ask why you think that page-faults disabling might be
> > > > > necessary?
> > > > 
> > > > I am not saying it is, was just unsure and wanted some people who worked on this code most recently to take a look and confirm.
> > > > 
> > > > I guess it will work since the copying is done like this anyway:
> > > > 
> > > > 		/*
> > > > 		 * This is the fast path and we cannot handle a pagefault
> > > > 		 * whilst holding the struct mutex lest the user pass in the
> > > > 		 * relocations contained within a mmaped bo. For in such a case
> > > > 		 * we, the page fault handler would call i915_gem_fault() and
> > > > 		 * we would try to acquire the struct mutex again. Obviously
> > > > 		 * this is bad and so lockdep complains vehemently.
> > > > 		 */
> > > > 		pagefault_disable();
> > > > 		copied = __copy_from_user_inatomic(r, urelocs, count * sizeof(r[0]));
> > > > 		pagefault_enable();
> > > > 		if (unlikely(copied)) {
> > > > 			remain = -EFAULT;
> > > > 			goto out;
> > > > 		}
> > > > 
> > > > Comment is a bit outdated since we don't use that global "struct mutex" any longer, but in any case, if there is a page fault on the mapping where we need to recurse into i915 again to satisfy if, we seem to have code already to handle it. So kmap_local conversion I *think* can't regress anything.
> > > 
> > > Thanks for your explanation!
> > > 
> > > > 
> > > > Patch to convert the io_mapping_map_atomic_wc can indeed come later.
> > > 
> > > Okay, I will also look at this.
> > > 
> > > > 
> > > > In terms of logistics - if we landed this series to out branch it would be queued only for 6.5. Would that work for you?
> > > 
> > > Yeah, it's ok for me. But could I ask, did I miss the 6.4 merge time?
> > 
> > Yes, but just because we failed to review and merge in time, not because you
> > did not provide patches in time.
> 
> It is worth mentioning that under drm we close the merge window earlier.
> Around -rc5.
> 
> So, Linus' merge window for 6.4 didn't happen yet. But our drm-next that
> is going to be sent there is already closed.
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
