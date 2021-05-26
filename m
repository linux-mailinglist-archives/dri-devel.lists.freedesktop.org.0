Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DBA391E55
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 19:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CBE6EC55;
	Wed, 26 May 2021 17:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACBB6E512;
 Wed, 26 May 2021 17:45:16 +0000 (UTC)
IronPort-SDR: 0ivP7lhiMMAmLSM1eLUNF2l8aegAhMBUISPvhOuBNd+ZHObQpbAypaMvCZ2SQwscCgjNVBhf+a
 m7QmSIzPrSnA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="189647237"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="189647237"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 10:45:15 -0700
IronPort-SDR: PNN2p3ohkc4Y8x5jHx7m9SuC75tf161wUaQVsY63qQAwIui7IZSeTGz+UeZdUXgDWtNTWihmXg
 7uzkPGYrAU9Q==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="414548847"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 10:45:14 -0700
Date: Wed, 26 May 2021 10:38:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 13/18] drm/i915/guc: Relax CTB response timeout
Message-ID: <20210526173808.GA31459@sdutt-i7>
References: <20210526064237.77853-1-matthew.brost@intel.com>
 <20210526064237.77853-14-matthew.brost@intel.com>
 <cef31e1d-7502-78ae-84bd-60daaca01732@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cef31e1d-7502-78ae-84bd-60daaca01732@intel.com>
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

On Wed, May 26, 2021 at 02:25:26PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 26.05.2021 08:42, Matthew Brost wrote:
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
> > ---
> >  drivers/gpu/drm/i915/Kconfig.profile      | 9 +++++++++
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 5 ++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
> > index 39328567c200..68ac707755d2 100644
> > --- a/drivers/gpu/drm/i915/Kconfig.profile
> > +++ b/drivers/gpu/drm/i915/Kconfig.profile
> > @@ -38,6 +38,15 @@ config DRM_I915_USERFAULT_AUTOSUSPEND
> >  	  May be 0 to disable the extra delay and solely use the device level
> >  	  runtime pm autosuspend delay tunable.
> >  
> > +config DRM_I915_GUC_CTB_TIMEOUT
> > +	int "How long to wait for the GuC to make forward progress on CTBs (ms)"
> 
> maybe worth to provide here explicit allowed range:
> 
> 	range 10 60000
> 
> and then we can skip runtime adjustment for minimum 10ms timeout

Didn't know this option, done.

> 
> > +	default 1500 # milliseconds
> > +	help
> > +	  Configures the default timeout waiting for GuC the to make forward
> > +	  progress on CTBs. e.g. Waiting for a response to requeset.
> 
> typo
>

Fixed.

Matt

> > +
> > +	  A minimum value of 10 ms is allowed.
> > +
> >  config DRM_I915_HEARTBEAT_INTERVAL
> >  	int "Interval between heartbeat pulses (ms)"
> >  	default 2500 # milliseconds
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index 916c2b80c841..5b0dece7a7cd 100644
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
> > +	timeout = max(10, CONFIG_DRM_I915_GUC_CTB_TIMEOUT);
> > +
> >  #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
> >  	err = wait_for_us(done, 10);
> >  	if (err)
> > -		err = wait_for(done, 10);
> > +		err = wait_for(done, timeout);
> >  #undef done
> >  
> >  	if (unlikely(err))
> > 
