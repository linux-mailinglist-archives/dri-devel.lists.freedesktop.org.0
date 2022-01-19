Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29C249421A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 21:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F6E10E1DB;
	Wed, 19 Jan 2022 20:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DE310E120;
 Wed, 19 Jan 2022 20:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642625589; x=1674161589;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Sq978MUO4yWRzD+InMAXUclwugVX5xhRcyMKx/xGDkY=;
 b=SxQvDuVYG6UCsnPkL1PjT5sB6WAEFJxHyermJJjsLAAGAHhNOBYshK++
 KITvP4KwbIjIDfyoOGQuoohZCsXU51YVwKAtO4OZWonQM3yBa7RBQ3eie
 zwglQGQ0iHHIJ0Mo/7bKfsqTD5xc3JrM8tOcwCaiU4guvtB7+itZjH83O
 aBrUOlarKG5pNFW/17k/kAF8cHGW/qA/Qwx0FgS0FvOp7mXPSK/PVa2gv
 pQ8h7a6eB6G7FMAVgLF4fcwAj0xiYUCPpiZEKgf8lNHv5eWJoJ1qD64P3
 Wk8UjPiPuAQWFf2dxH8yNYJ/E0p2vPkkbtMDGjpxUfl2GjTkUt8A6JQjm g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245145851"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="245145851"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 12:53:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="626038886"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 12:53:09 -0800
Date: Wed, 19 Jan 2022 12:47:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 1/3] drm/i915: Allocate intel_engine_coredump_alloc with
 ALLOW_FAIL
Message-ID: <20220119204722.GA32405@jons-linux-dev-box>
References: <20220118214357.33740-1-matthew.brost@intel.com>
 <20220118214357.33740-2-matthew.brost@intel.com>
 <22b0f8c6-fea1-f03c-d91f-253de481287f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22b0f8c6-fea1-f03c-d91f-253de481287f@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 05:29:54PM -0800, John Harrison wrote:
> On 1/18/2022 13:43, Matthew Brost wrote:
> > Allocate intel_engine_coredump_alloc with ALLOW_FAIL rather than
> > GFP_KERNEL do fully decouple the error capture from fence signalling.
> s/do/to/
> 

Yep.

> > 
> > Fixes: 8b91cdd4f8649 ("drm/i915: Use __GFP_KSWAPD_RECLAIM in the capture code")
> Does this really count as a bug fix over that patch? Isn't it more of a
> changing in policy now that we do DRM fence signalling and that other
> changes related to error capture behaviour have been implemented.
>

That patch was supposed to allow signalling annotations to be added,
without this change I think these annotations would be broken. So I
think the Fixes is correct. 
 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> > index 67f3515f07e7a..aee42eae4729f 100644
> > --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> > +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> > @@ -1516,7 +1516,7 @@ capture_engine(struct intel_engine_cs *engine,
> >   	struct i915_request *rq = NULL;
> >   	unsigned long flags;
> > -	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
> > +	ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL);
> This still makes me nervous that we will fail to allocate engine captures in
> stress test scenarios, which are exactly the kind of situations where we
> need valid error captures.
> 

Me too, but this whole file has been changed to the ALLOW_FAIL. Thomas
and Daniel seem to think this is correct. For what it's worth this
allocation is less than a page, so it should be pretty safe to do with
ALLOW_FAIL.

> There is also still a GFP_KERNEL in __i915_error_grow(). Doesn't that need
> updating as well?
>

Probably just should be deleted. If look it tries with ALLOW_FAIL first,
then falls back to GFP_KERNEL. I didn't want to make that update in this
series yet but that is something to keep an eye on.

Matt
 
> John.
> 
> >   	if (!ee)
> >   		return NULL;
> 
