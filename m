Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297616E2111
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 12:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C44010ECC8;
	Fri, 14 Apr 2023 10:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D9510ECC8;
 Fri, 14 Apr 2023 10:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681468648; x=1713004648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CFmbTNZab9I7ir2+O5evjGn+3mmBidb0nlh8n5NmjpY=;
 b=FLLpK0UNlhyeUfNVfpO0xjPxziNlJmwlZUx12QF+SWjPk7FXTPfHBOaI
 3U2mC+zxP+sAUTxvf67/19u+iffjayhu5H7sExHVUYtf1frHJUvWgL1PM
 slfN9fOPOnz7XOgY8bOxu2Ntf1y8WMUuENl5dyH5xK1tOf7HeENks6GZ1
 Ti6hWX0OM/j2C6CMYwn8K/vykNWNuxXsA7EOOfDhtA8mxjtmE6pEUGSG/
 F5pooBBNZHqoLcH7FA89f4OIeGCNtp3q8RRil+ECIKo8URqrCjEkygrq+
 dfctf5hJW+ejrtoyyzL1kHEVVIoT2JZj3xICyawgDq+bBqePj4x8j3fVe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="344433724"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="344433724"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 03:37:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="864170782"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="864170782"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.28])
 by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 03:37:07 -0700
Date: Fri, 14 Apr 2023 18:45:57 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
Message-ID: <ZDku5SJhl2Ve51UC@liuzhao-OptiPlex-7080>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <64265ef8725fe_375f7e294a@iweiny-mobl.notmuch>
 <fdc8a470-1e6b-815d-e367-a9df1b0b14dd@linux.intel.com>
 <2177327.1BCLMh4Saa@suse>
 <1b341218-f0e2-a613-2ac6-107064a813ca@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b341218-f0e2-a613-2ac6-107064a813ca@linux.intel.com>
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
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Wed, Apr 12, 2023 at 04:45:13PM +0100, Tvrtko Ursulin wrote:

[snip]

> > 
> > [snip]
> > > However I am unsure if disabling pagefaulting is needed or not. Thomas,
> > > Matt, being the last to touch this area, perhaps you could have a look?
> > > Because I notice we have a fallback iomap path which still uses
> > > io_mapping_map_atomic_wc. So if kmap_atomic to kmap_local conversion is
> > > safe, does the iomap side also needs converting to
> > > io_mapping_map_local_wc? Or they have separate requirements?
> > 
> > AFAIK, the requirements for io_mapping_map_local_wc() are the same as for
> > kmap_local_page(): the kernel virtual address is _only_ valid in the caller
> > context, and map/unmap nesting must be done in stack-based ordering (LIFO).
> > 
> > I think a follow up patch could safely switch to io_mapping_map_local_wc() /
> > io_mapping_unmap_local_wc since the address is local to context.
> > 
> > However, not being an expert, reading your note now I suspect that I'm missing
> > something. Can I ask why you think that page-faults disabling might be
> > necessary?
> 
> I am not saying it is, was just unsure and wanted some people who worked on this code most recently to take a look and confirm.
> 
> I guess it will work since the copying is done like this anyway:
> 
> 		/*
> 		 * This is the fast path and we cannot handle a pagefault
> 		 * whilst holding the struct mutex lest the user pass in the
> 		 * relocations contained within a mmaped bo. For in such a case
> 		 * we, the page fault handler would call i915_gem_fault() and
> 		 * we would try to acquire the struct mutex again. Obviously
> 		 * this is bad and so lockdep complains vehemently.
> 		 */
> 		pagefault_disable();
> 		copied = __copy_from_user_inatomic(r, urelocs, count * sizeof(r[0]));
> 		pagefault_enable();
> 		if (unlikely(copied)) {
> 			remain = -EFAULT;
> 			goto out;
> 		}
> 
> Comment is a bit outdated since we don't use that global "struct mutex" any longer, but in any case, if there is a page fault on the mapping where we need to recurse into i915 again to satisfy if, we seem to have code already to handle it. So kmap_local conversion I *think* can't regress anything.

Thanks for your explanation!

> 
> Patch to convert the io_mapping_map_atomic_wc can indeed come later.

Okay, I will also look at this.

> 
> In terms of logistics - if we landed this series to out branch it would be queued only for 6.5. Would that work for you?

Yeah, it's ok for me. But could I ask, did I miss the 6.4 merge time?

Thanks,
Zhao

> 
> Regards,
> 
> Tvrtko
