Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE53561DDA4
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 20:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A6B10E179;
	Sat,  5 Nov 2022 19:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC6D10E096;
 Fri,  4 Nov 2022 11:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667561385; x=1699097385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eXo4mbINpwUv/8iK65/Pz2/8S04AvDk9WaxQmyn2/YU=;
 b=dKUpDxsEbbtD6MGOfx/wS5jP6k8p7l8Jq3ZOtXrBimcW+O8Wri7BNLDk
 ZtrdpqpuK32YeEITscXfJsaxhcHdVe3FfqLvED1wVoxzaxh2JQruBHFXA
 oKfLstX4sWV1w60dofnWsRs9QLyeRn/wLi0f6233Cv/mA5UJYhnXQWApC
 PKj3HNU1Ig6mkParR7MgDadFrElOp+1ipYjq+PFYgBcDfDau4a9Xyp9t2
 aHuKvUCaMc3DQ5a1kL6Jd/am1qUqYUN8UcEqIUV5IiXyjVfYpIpe+Mwm+
 A0ToH0nmEbABMFdxkZA8ZOkcXYNYp8CTMNnk2hgY/76z8ggdI8svYz3cz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="297412091"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="297412091"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 04:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="724322182"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="724322182"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.132])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2022 04:29:42 -0700
Date: Fri, 4 Nov 2022 19:35:28 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 1/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_object.c
Message-ID: <Y2T5AFZ0IUFf0wsY@liuzhao-OptiPlex-7080>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <20221017093726.2070674-2-zhao1.liu@linux.intel.com>
 <2541717.Lt9SDvczpP@suse> <Y2Pxi9FsdeULhHKI@iweiny-desk3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2Pxi9FsdeULhHKI@iweiny-desk3>
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
Cc: Zhenyu Wang <zhenyu.z.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Hansen <dave.hansen@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 03, 2022 at 09:51:23AM -0700, Ira Weiny wrote:
> Date: Thu, 3 Nov 2022 09:51:23 -0700
> From: Ira Weiny <ira.weiny@intel.com>
> Subject: Re: [PATCH 1/9] drm/i915: Use kmap_local_page() in
>  gem/i915_gem_object.c
> 
> On Sat, Oct 29, 2022 at 01:17:03PM +0200, Fabio M. De Francesco wrote:
> > On luned? 17 ottobre 2022 11:37:17 CEST Zhao Liu wrote:
> > > From: Zhao Liu <zhao1.liu@intel.com>
> > > 
> > > The use of kmap_atomic() is being deprecated in favor of
> > > kmap_local_page()[1].
> > > 
> > > The main difference between atomic and local mappings is that local
> > > mappings doesn't disable page faults or preemption.
> > 
> > You are right about about page faults which are never disabled by 
> > kmap_local_page(). However kmap_atomic might not disable preemption. It 
> > depends on CONFIG_PREEMPT_RT.
> > 
> > Please refer to how kmap_atomic_prot() works (this function is called by 
> > kmap_atomic() when kernels have HIGHMEM enabled).
> > 
> > > 
> > > There're 2 reasons why i915_gem_object_read_from_page_kmap() doesn't
> > > need to disable pagefaults and preemption for mapping:
> > > 
> > > 1. The flush operation is safe for CPU hotplug when preemption is not
> > > disabled. 
> > 
> > I'm confused here. Why are you talking about CPU hotplug?
> 
> I agree with Fabio here.  I'm not making the connection between cpu hotplug and
> this code path.

Sorry, my misunderstanding. Will delete this wrong explanation.

Thanks,
Zhao
