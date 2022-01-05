Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90F4856A6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 17:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E877C10FBF0;
	Wed,  5 Jan 2022 16:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F0810FBF0;
 Wed,  5 Jan 2022 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641400188; x=1672936188;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gSIixaDkjmwiVnBGxqxRGWIVmIUwkKbxm1lHcGerhuA=;
 b=k3c7DqPBvkLwLHtQBaqRUwrlezX7HHQlG2vFBJtK0kVPVNh/4OZpUcFx
 A7iMCA6P+hHbmvIQ+TDlgU2WpSsB9q0qJQdoJtWets0IfRa+aVQjwlCup
 8q5YAeDfBRR63iUtZXRQ1l6Dc+j5rqc3hkKdl6EEeGbTlrM7Ozd755Cjq
 W5atsU1ax9PTfGLD7xWrgf+BQ4NLcdykv2/faM5K6f+AkYRvocXUvUoN6
 efcgwp1rA2AWLA0PpTcd0FoOc97M4LQv8g7Er9upSHcra6MXELkieUq5q
 TQYdXZ1utOJDif3/mq4mNb7NySuQxqYKtEUgeXc2sbU4D+rrVe1IYgqOa Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="328823295"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="328823295"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 08:29:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="472550740"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 08:29:48 -0800
Date: Wed, 5 Jan 2022 08:24:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Lock timeline mutex directly in
 error path of eb_pin_timeline
Message-ID: <20220105162402.GA33126@jons-linux-dev-box>
References: <20220104233056.11245-1-matthew.brost@intel.com>
 <3ae7e493-4b77-9e87-ca6f-34f85cab4ecb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ae7e493-4b77-9e87-ca6f-34f85cab4ecb@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 05, 2022 at 09:35:44AM +0000, Tvrtko Ursulin wrote:
> 
> On 04/01/2022 23:30, Matthew Brost wrote:
> > Don't use the interruptable version of the timeline mutex lock in the
> 
> interruptible
> 
> > error path of eb_pin_timeline as the cleanup must always happen.
> > 
> > v2:
> >   (John Harrison)
> >    - Don't check for interrupt during mutex lock
> > 
> > Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index e9541244027a..e96e133cbb1f 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -2516,9 +2516,9 @@ static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
> >   				      timeout) < 0) {
> >   			i915_request_put(rq);
> > -			tl = intel_context_timeline_lock(ce);
> > +			mutex_lock(&ce->timeline->mutex);
> 
> On the other hand it is more user friendly to handle signals (which maybe
> does not matter in this case, not sure any longer how long hold time it can
> have) but there is also a question of consistency within the very function
> you are changing.
> 
> Apart from consistency, what about the parent-child magic
> intel_context_timeline_lock does and you wouldn't have here?
> 
> And what about the very existence of intel_context_timeline_lock as a
> component boundary separation API, if it is used inconsistently throughout
> i915_gem_execbuffer.c?

intel_context_timeline_lock does 2 things:

1. Handles lockdep nesting of timeline locks for parent-child contexts
ensuring locks are acquired from parent to last child, then released
last child to parent
2. Allows the mutex lock to be interrupted

This helper should be used in setup steps where a user can signal abort
(context pinning time + request creation time), by 'should be' I mean
this was how it was done before I extended the execbuf IOCTL for
multiple BBs. Slightly confusing but this is what was in place so I
stuck with it.

This code here is an error path that only hold at most 1 timeline lock
(no nesting required) and is a path that must be executed as it is a
cleanup step (not allowed to be interrupted by user, intel_context_exit
must be called or we have dangling engine PM refs).

Make sense? I probably should update the comment message to explain this
a bit better as it did take me a bit to understand how this locking
worked.

Matt

> 
> Regards,
> 
> Tvrtko
> 
> >   			intel_context_exit(ce);
> > -			intel_context_timeline_unlock(tl);
> > +			mutex_unlock(&ce->timeline->mutex);
> >   			if (nonblock)
> >   				return -EWOULDBLOCK;
> > 
