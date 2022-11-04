Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048B861DDA0
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 20:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963B910E157;
	Sat,  5 Nov 2022 19:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75D910E72F;
 Fri,  4 Nov 2022 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667558316; x=1699094316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fqqtKLRYN5kDsLEk0+TvNtixmex/4vGMe3XB0EEHNbU=;
 b=jAd+CvP7N6HTeZjrhSRZfUygebTveHbFYX29YqYeVIlk6sFOyika8fRV
 /iN/R7SnyIksEWXAZ5IBItOTpq/p69xZ4StOGgFOdmcMIObTJkORUZZl4
 h/FusBvU0LUzcyugLNFlWj7C0ajgxzYHLdscmAy9h6WsPzhiQg5OAcSQM
 pth/0ZS/oftxAau5hDu3/R8HM3sv75R3aeAQc/qofLiIt1EMX4TUm4cYX
 MdHLurGzFQzytikFXispW3y5zkKO5xZBN1oltpx6lynOdp1ziPqy3inby
 njhXd2eMDWSJ7VsnrWeje71E7PeqXuzbzE9e1mYfMr5NDSoPAMZMgBZEe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="396236610"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="396236610"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 03:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="586146016"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="586146016"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.132])
 by orsmga003.jf.intel.com with ESMTP; 04 Nov 2022 03:38:31 -0700
Date: Fri, 4 Nov 2022 18:44:16 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH 0/9] drm/i915: Replace kmap_atomic() with kmap_local_page()
Message-ID: <Y2TtAAqSyAgTVIL8@liuzhao-OptiPlex-7080>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <10176905.nUPlyArG6x@suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10176905.nUPlyArG6x@suse>
X-Mailman-Approved-At: Sat, 05 Nov 2022 19:11:56 +0000
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
 dri-devel@lists.freedesktop.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 29, 2022 at 09:12:27AM +0200, Fabio M. De Francesco wrote:
> Date: Sat, 29 Oct 2022 09:12:27 +0200
> From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
> Subject: Re: [PATCH 0/9] drm/i915: Replace kmap_atomic() with
>  kmap_local_page()

Hi Fabio, thanks for your review!! (I'm sorry I missed the previous mails).

> 
> On luned? 17 ottobre 2022 11:37:16 CEST Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > The use of kmap_atomic() is being deprecated in favor of
> > kmap_local_page()[1].
> 
> Some words to explain why kmap_atomic was deprecated won't hurt. Many 
> maintainers and reviewers, and also casual readers might not yet be aware of 
> the reasons behind that deprecation.
>  
> > In the following patches, we can convert the calls of kmap_atomic() /
> > kunmap_atomic() to kmap_local_page() / kunmap_local(), which can
> > instead do the mapping / unmapping regardless of the context.
> 
> Readers are probably much more interested in what you did in the following 
> patches and why you did it, instead of being informed about what "we can" do.
> 
> I would suggest something like "The following patches convert the calls to 
> kmap_atomic() to kmap_local_page() [the rest looks OK]".
> 
> This could also be the place to say something about why we prefer 
> kmap_local_page() to kmap_atomic(). 
> 
> Are you sure that the reasons that motivates your conversions are merely 
> summarized to kmap_local_page() being able to do mappings regardless of 
> context? I think you are missing the real reasons why. 

Thanks for your reminder, I'll emphasize the motivation here.

> What about avoiding the often unwanted side effect of unnecessary page faults 
> disables?

Good suggestion! I'll add this into this cover message.

What I think is that we have two reasons to do the replacement work:
1. (main motication) Avoid unnessary pagefaulta and preemption disabling to gain
performance benefits.
2. We are trying to deprecate the old kmap/kmap_atomic interface. Some maintainer
said it's also a good reason especially for the case that the performance is not
critical [1].

In addition, also from [1], I find in some case people chooses kmap_atomic() for
the consideration that they want the atomic context. So, the explaination about
why the atomic context is not needed is also a reasion? I understand that I need
to make special explaination in each commit depending on the situation (In this
case, it is not suitable to describe in the cover?).

[1]: https://lore.kernel.org/lkml/YzRVaJA0EyfcVisW@liuwe-devbox-debian-v2/#t

> 
> > 
> > With kmap_local_page(), the mapping is per thread, CPU local and not
> > globally visible.
> 
> No news here. kmap_atomic() is "per thread, CPU local and not glocally 
> visible". I cannot see any difference here between kmap_atomic() and 
> kmap_local_page().

What about the below description which refers to your doc?
"kmap_atomic() in the kernel creates a non-preemptible section
and disable pagefaults. This could be a source of unwanted latency.
And kmap_local_page effectively overcomes this issue because it doesn't
disable pagefault and preemption."

Thanks,
Zhao

