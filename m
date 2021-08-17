Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35083EEEFB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 17:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1826E041;
	Tue, 17 Aug 2021 15:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB076E03C;
 Tue, 17 Aug 2021 15:13:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="196381182"
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="196381182"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 08:13:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="680397106"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 08:13:22 -0700
Date: Tue, 17 Aug 2021 08:08:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 06/22] drm/i915/execlists: Do not propagate errors to
 dependent fences
Message-ID: <20210817150809.GA19163@jons-linux-dev-box>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-7-matthew.brost@intel.com>
 <YRt/lynczP00iJqF@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRt/lynczP00iJqF@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 11:21:27AM +0200, Daniel Vetter wrote:
> On Mon, Aug 16, 2021 at 06:51:23AM -0700, Matthew Brost wrote:
> > Progagating errors to dependent fences is wrong, don't do it. Selftest
> > in following patch exposes this bug.
> 
> Please explain what "this bug" is, it's hard to read minds, especially at
> a distance in spacetime :-)
> 

Not a very good explaination.

> > Fixes: 8e9f84cf5cac ("drm/i915/gt: Propagate change in error status to children on unhold")
> 
> I think it would be better to outright revert this, instead of just
> disabling it like this.
>

I tried revert and git did some really odd things that I couldn't
resolve, hence the new patch.
 
> Also please cite the dma_fence error propagation revert from Jason:
> 
> commit 93a2711cddd5760e2f0f901817d71c93183c3b87
> Author: Jason Ekstrand <jason@jlekstrand.net>
> Date:   Wed Jul 14 14:34:16 2021 -0500
> 
>     Revert "drm/i915: Propagate errors on awaiting already signaled fences"
> 
> Maybe in full, if you need the justification.
>

Will site.

> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> 
> Unless "this bug" is some real world impact thing I wouldn't put cc:
> stable on this.

Got it.

Matt

> -Daniel
> > ---
> >  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index de5f9c86b9a4..cafb0608ffb4 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -2140,10 +2140,6 @@ static void __execlists_unhold(struct i915_request *rq)
> >  			if (p->flags & I915_DEPENDENCY_WEAK)
> >  				continue;
> >  
> > -			/* Propagate any change in error status */
> > -			if (rq->fence.error)
> > -				i915_request_set_error_once(w, rq->fence.error);
> > -
> >  			if (w->engine != rq->engine)
> >  				continue;
> >  
> > -- 
> > 2.32.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
