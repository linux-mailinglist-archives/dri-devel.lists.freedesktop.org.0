Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B36DC4BE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 11:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E525C10E0C9;
	Mon, 10 Apr 2023 09:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A7510E0C9;
 Mon, 10 Apr 2023 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681117204; x=1712653204;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dqF2REshPEPcaWNr3EMg4H0fo/5f+H+KwIw4rUrhjRc=;
 b=fqPAh+neaqzPKOzmmazkroBh3uv+YNDZRaNKC4ElhDcPUOicKCILJ5MJ
 fT5UEco5uztKe6KwvXjxwg0ec4+it6KJ7ETeWt6O7shyFdq2VllgDEA4H
 Tb1MUxFtog0yGXGTHXFcZwxVrc0k4GJKYuddkGqpK92/97+JgnSpiWnjj
 jIrUGqK1vUHAIq0xPwC62zVlvZrMcxkgNnEpWyfDatROlJ/H/S5hZcpQh
 dxKSqcKDZQ9dBYgk1BXpsnpcJ/BGErH7f4jO0RsZ40CySwwi9tEAmwyG6
 wWfU7P6DhJie76MTxFDzOxv6oIP/hKF9BH0mBqbdlggT2DZz9snnStlT0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="342081042"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="342081042"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 02:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="688209076"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="688209076"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.28])
 by orsmga002.jf.intel.com with ESMTP; 10 Apr 2023 01:59:58 -0700
Date: Mon, 10 Apr 2023 17:08:45 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Thomas =?utf-8?B?SGVsbHN0cu+/vW0=?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
Message-ID: <ZDPSHYn02GWTSMG4@liuzhao-OptiPlex-7080>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <64265ef8725fe_375f7e294a@iweiny-mobl.notmuch>
 <fdc8a470-1e6b-815d-e367-a9df1b0b14dd@linux.intel.com>
 <2177327.1BCLMh4Saa@suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2177327.1BCLMh4Saa@suse>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Christian =?utf-8?B?S++/vW5pZw==?= <christian.koenig@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks all for your review!

On Fri, Mar 31, 2023 at 05:32:17PM +0200, Fabio M. De Francesco wrote:
> Date: Fri, 31 Mar 2023 17:32:17 +0200
> From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
> Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
>  gem/i915_gem_execbuffer.c
> 
> On venerd? 31 marzo 2023 13:30:20 CEST Tvrtko Ursulin wrote:
> > On 31/03/2023 05:18, Ira Weiny wrote:
> 

[snip]

>  
> > However I am unsure if disabling pagefaulting is needed or not. Thomas,
> > Matt, being the last to touch this area, perhaps you could have a look?
> > Because I notice we have a fallback iomap path which still uses
> > io_mapping_map_atomic_wc. So if kmap_atomic to kmap_local conversion is
> > safe, does the iomap side also needs converting to
> > io_mapping_map_local_wc? Or they have separate requirements?
> 
> AFAIK, the requirements for io_mapping_map_local_wc() are the same as for 
> kmap_local_page(): the kernel virtual address is _only_ valid in the caller 
> context, and map/unmap nesting must be done in stack-based ordering (LIFO).
> 
> I think a follow up patch could safely switch to io_mapping_map_local_wc() / 
> io_mapping_unmap_local_wc since the address is local to context.
> 
> However, not being an expert, reading your note now I suspect that I'm missing 
> something. Can I ask why you think that page-faults disabling might be 
> necessary? 


About the disabling of pagefault here, could you please talk more about
it? :-)

From previous discussions and commit history, I didn't find relevant
information and I lack background knowledge about it...

If we have the reason to diable pagefault, I will fix and refresh the new
version.

Thanks,
Zhao

> 
> Thanks,
> 
> Fabio
> 
> > Regards,
> > 
> > Tvrtko
> 
> 
> 
