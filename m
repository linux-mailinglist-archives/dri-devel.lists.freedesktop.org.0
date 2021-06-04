Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251A939BFD1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 20:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB4D6F89C;
	Fri,  4 Jun 2021 18:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02FB6F89C;
 Fri,  4 Jun 2021 18:42:39 +0000 (UTC)
IronPort-SDR: mItKS1zyPNGdqA6pSmen6xUSfm2JzmSl/K8C+/WnuKkYbljdxyODO5lBDDTnb4DKSUeLVuFomc
 /2wSGoqgpK/Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="202489749"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="202489749"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 11:42:38 -0700
IronPort-SDR: oZSAYzurFWalJLPmQKU1dSxV6CXraDuCDFX09gnbU0YHfAdjHq74kZ/vw5mB697fh2jmKw57IO
 ++QSoYy3fEmw==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="417843002"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 11:42:38 -0700
Date: Fri, 4 Jun 2021 11:35:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 13/20] drm/i915/guc: Relax CTB response timeout
Message-ID: <20210604183539.GA26392@sdutt-i7>
References: <20210603051630.2635-1-matthew.brost@intel.com>
 <20210603051630.2635-14-matthew.brost@intel.com>
 <YLnlQyPJZygHTHxk@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLnlQyPJZygHTHxk@phenom.ffwll.local>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 10:33:07AM +0200, Daniel Vetter wrote:
> On Wed, Jun 02, 2021 at 10:16:23PM -0700, Matthew Brost wrote:
> > From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > 
> > In upcoming patch we will allow more CTB requests to be sent in
> > parallel to the GuC for processing, so we shouldn't assume any more
> > that GuC will always reply without 10ms.
> > 
> > Use bigger value from CONFIG_DRM_I915_GUC_CTB_TIMEOUT instead.
> > 
> > v2: Add CONFIG_DRM_I915_GUC_CTB_TIMEOUT config option
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> So this is a rant, but for upstream we really need to do better than
> internal:
> 
> - The driver must work by default in the optimal configuration.
> 
> - Any config change that we haven't validated _must_ taint the kernel
>   (this is especially for module options, but also for config settings)
> 
> - Config need a real reason beyond "was useful for bring-up".
> 
> Our internal tree is an absolute disaster right now, with multi-line
> kernel configs (different on each platform) and bespoke kernel config or
> the driver just fails. We're the expert on our own hw, we should know how
> it works, not offload that to users essentially asking them "how shitty do
> you think Intel hw is in responding timely".
> 
> Yes I know there's a lot of these there already, they don't make a lot of
> sense either.
> 
> Except if there's a real reason for this (aside from us just offloading
> testing to our users instead of doing it ourselves properly) I think we
> should hardcode this, with a comment explaining why. Maybe with a switch
> between the PF/VF case once that's landed.
> 
> > ---
> >  drivers/gpu/drm/i915/Kconfig.profile      | 10 ++++++++++
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  5 ++++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
> > index 39328567c200..0d5475b5f28a 100644
> > --- a/drivers/gpu/drm/i915/Kconfig.profile
> > +++ b/drivers/gpu/drm/i915/Kconfig.profile
> > @@ -38,6 +38,16 @@ config DRM_I915_USERFAULT_AUTOSUSPEND
> >  	  May be 0 to disable the extra delay and solely use the device level
> >  	  runtime pm autosuspend delay tunable.
> >  
> > +config DRM_I915_GUC_CTB_TIMEOUT
> > +	int "How long to wait for the GuC to make forward progress on CTBs (ms)"
> > +	default 1500 # milliseconds
> > +	range 10 60000
> 
> Also range is definitely off, drm/scheduler will probably nuke you
> beforehand :-)
> 
> That's kinda another issue I have with all these kconfig knobs: Maybe we
> need a knob for "relax with reset attempts, my workloads overload my gpus
> routinely", which then scales _all_ timeouts proportionally. But letting
> the user set them all, with silly combiniations like resetting the
> workload before heartbeat or stuff like that doesn't make much sense.
>

Yes, the code as is the user could do some wacky stuff that doesn't make
sense at all.
 
> Anyway, tiny patch so hopefully I can leave this one out for now until
> we've closed this.

No issue leaving this out as blocking CTBs are never really used anyways
until SRIOV aside from setup / debugging. That being said, we might
still want a higher hardcoded value in the meantime, perhaps around a
second. I can follow up on that if needed.

Matt

> -Daniel
> 
> > +	help
> > +	  Configures the default timeout waiting for GuC the to make forward
> > +	  progress on CTBs. e.g. Waiting for a response to a requeset.
> > +
> > +	  A range of 10 ms to 60000 ms is allowed.
> > +
> >  config DRM_I915_HEARTBEAT_INTERVAL
> >  	int "Interval between heartbeat pulses (ms)"
> >  	default 2500 # milliseconds
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index 916c2b80c841..cf1fb09ef766 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -436,6 +436,7 @@ static int ct_write(struct intel_guc_ct *ct,
> >   */
> >  static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
> >  {
> > +	long timeout;
> >  	int err;
> >  
> >  	/*
> > @@ -443,10 +444,12 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
> >  	 * up to that length of time, then switch to a slower sleep-wait loop.
> >  	 * No GuC command should ever take longer than 10ms.
> >  	 */
> > +	timeout = CONFIG_DRM_I915_GUC_CTB_TIMEOUT;
> > +
> >  #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
> >  	err = wait_for_us(done, 10);
> >  	if (err)
> > -		err = wait_for(done, 10);
> > +		err = wait_for(done, timeout);
> >  #undef done
> >  
> >  	if (unlikely(err))
> > -- 
> > 2.28.0
> > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
