Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CFD486808
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 17:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A4F10FDB1;
	Thu,  6 Jan 2022 16:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2370F10FC67;
 Thu,  6 Jan 2022 16:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641488312; x=1673024312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TLxcQL4l0DXexFlv8708bMibTqWcLsWCXF0p7w5Ql9o=;
 b=BH6rh3lChnaGWQ/ShrHAqnm5qT+tNXdAkDtXS9q4F65D7Y9f9v8rfyf+
 goNJ0uK1NUaXY8Ae/cNpbD9l63t9EPtsclt5jRcpnvAA4zMCFLax43UWA
 x5IpAnik+ADwqTDVI/4ci8AFMtBZskx61/LCWd7Kkpvp2rl+ygVBkoVDx
 BqrVXD49unyLHt1sKUTyzu7f8Bj9ukKkNyA0bvCTKLbq70tdqpvLXj0TF
 SkjXHiPWIgz2gY0f74eJ8j0Qb9Jt6Pvq4Y36po9ZKYMrAqTKLI1I+7J2z
 h+L25/jtuOZ682LYNB586KtmI5J9XAd65RWXKBl3w5idDKBjHkftIM7ti g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="241509386"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="241509386"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 08:58:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="621576831"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 08:58:25 -0800
Date: Thu, 6 Jan 2022 08:52:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Lock timeline mutex directly in
 error path of eb_pin_timeline
Message-ID: <20220106165231.GA22261@jons-linux-dev-box>
References: <20220104233056.11245-1-matthew.brost@intel.com>
 <3ae7e493-4b77-9e87-ca6f-34f85cab4ecb@linux.intel.com>
 <20220105162402.GA33126@jons-linux-dev-box>
 <40920051-1aef-1e14-ec7e-03d158e02c22@linux.intel.com>
 <20220106161847.GA7452@jons-linux-dev-box>
 <b1179113-908f-e5a8-a555-67557b8d83aa@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1179113-908f-e5a8-a555-67557b8d83aa@linux.intel.com>
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

On Thu, Jan 06, 2022 at 04:51:21PM +0000, Tvrtko Ursulin wrote:
> 
> On 06/01/2022 16:18, Matthew Brost wrote:
> > On Thu, Jan 06, 2022 at 09:56:03AM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 05/01/2022 16:24, Matthew Brost wrote:
> > > > On Wed, Jan 05, 2022 at 09:35:44AM +0000, Tvrtko Ursulin wrote:
> > > > > 
> > > > > On 04/01/2022 23:30, Matthew Brost wrote:
> > > > > > Don't use the interruptable version of the timeline mutex lock in the
> > > > > 
> > > > > interruptible
> > > > > 
> > > > > > error path of eb_pin_timeline as the cleanup must always happen.
> > > > > > 
> > > > > > v2:
> > > > > >     (John Harrison)
> > > > > >      - Don't check for interrupt during mutex lock
> > > > > > 
> > > > > > Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
> > > > > >     1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > > index e9541244027a..e96e133cbb1f 100644
> > > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > > @@ -2516,9 +2516,9 @@ static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
> > > > > >     				      timeout) < 0) {
> > > > > >     			i915_request_put(rq);
> > > > > > -			tl = intel_context_timeline_lock(ce);
> > > > > > +			mutex_lock(&ce->timeline->mutex);
> > > > > 
> > > > > On the other hand it is more user friendly to handle signals (which maybe
> > > > > does not matter in this case, not sure any longer how long hold time it can
> > > > > have) but there is also a question of consistency within the very function
> > > > > you are changing.
> > > > > 
> > > > > Apart from consistency, what about the parent-child magic
> > > > > intel_context_timeline_lock does and you wouldn't have here?
> > > > > 
> > > > > And what about the very existence of intel_context_timeline_lock as a
> > > > > component boundary separation API, if it is used inconsistently throughout
> > > > > i915_gem_execbuffer.c?
> > > > 
> > > > intel_context_timeline_lock does 2 things:
> > > > 
> > > > 1. Handles lockdep nesting of timeline locks for parent-child contexts
> > > > ensuring locks are acquired from parent to last child, then released
> > > > last child to parent
> > > > 2. Allows the mutex lock to be interrupted
> > > > 
> > > > This helper should be used in setup steps where a user can signal abort
> > > > (context pinning time + request creation time), by 'should be' I mean
> > > > this was how it was done before I extended the execbuf IOCTL for
> > > > multiple BBs. Slightly confusing but this is what was in place so I
> > > > stuck with it.
> > > > 
> > > > This code here is an error path that only hold at most 1 timeline lock
> > > > (no nesting required) and is a path that must be executed as it is a
> > > > cleanup step (not allowed to be interrupted by user, intel_context_exit
> > > > must be called or we have dangling engine PM refs).
> > > > 
> > > > Make sense? I probably should update the comment message to explain this
> > > > a bit better as it did take me a bit to understand how this locking
> > > > worked.
> > > 
> > > The part which does not make sense is this:
> > > 
> > 
> > I'll try to explain this again...
> > 
> > > eb_pin_timeline()
> > > {
> > > ...
> > > 	tl = intel_context_timeline_lock(ce);
> > > 	if (IS_ERR(tl))
> > > 		return PTR_ERR(tl);
> > 
> > This part is allowed to be aborted by the user.
> > 
> > > 
> > > ... do some throttling, and if it fail:
> > > 			mutex_lock(&ce->timeline->mutex);
> > 
> > This part is not.
> 
> Pfft got it this time round.
> 
> I suggest a comment above the mutex to this effect. And maybe still consider
> the explicit error path which may be more readable due single request put,
> but it's up to you.
> 

I'll add comment and see how adding an explict error path looks in the code.

Matt

> Regards,
> 
> Tvrtko
