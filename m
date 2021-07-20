Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0203D02B0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A656E4FE;
	Tue, 20 Jul 2021 20:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71E26E402;
 Tue, 20 Jul 2021 20:38:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885122"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885122"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:38:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="469891929"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:38:21 -0700
Date: Tue, 20 Jul 2021 20:38:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 30/51] drm/i915/guc: Handle context reset notification
Message-ID: <20210720203819.GA14430@DUT151-ICLU.fm.intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-31-matthew.brost@intel.com>
 <19438ac3-255f-78db-6ce3-ba919ea4e456@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19438ac3-255f-78db-6ce3-ba919ea4e456@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 01:29:26PM -0700, John Harrison wrote:
> On 7/16/2021 13:17, Matthew Brost wrote:
> > GuC will issue a reset on detecting an engine hang and will notify
> > the driver via a G2H message. The driver will service the notification
> > by resetting the guilty context to a simple state or banning it
> > completely.
> > 
> > v2:
> >   (John Harrison)
> >    - Move msg[0] lookup after length check
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 ++
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  3 ++
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++++
> >   drivers/gpu/drm/i915/i915_trace.h             | 10 ++++++
> >   4 files changed, 51 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index b3cfc52fe0bc..f23a3a618550 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -262,6 +262,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> >   					  const u32 *msg, u32 len);
> >   int intel_guc_sched_done_process_msg(struct intel_guc *guc,
> >   				     const u32 *msg, u32 len);
> > +int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> > +					const u32 *msg, u32 len);
> >   void intel_guc_submission_reset_prepare(struct intel_guc *guc);
> >   void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index 503a78517610..c4f9b44b9f86 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -981,6 +981,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
> >   	case INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
> >   		ret = intel_guc_sched_done_process_msg(guc, payload, len);
> >   		break;
> > +	case INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION:
> > +		ret = intel_guc_context_reset_process_msg(guc, payload, len);
> > +		break;
> >   	default:
> >   		ret = -EOPNOTSUPP;
> >   		break;
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index fdb17279095c..feaf1ca61eaa 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2196,6 +2196,42 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
> >   	return 0;
> >   }
> > +static void guc_context_replay(struct intel_context *ce)
> > +{
> > +	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
> > +
> > +	__guc_reset_context(ce, true);
> > +	tasklet_hi_schedule(&sched_engine->tasklet);
> > +}
> > +
> > +static void guc_handle_context_reset(struct intel_guc *guc,
> > +				     struct intel_context *ce)
> > +{
> > +	trace_intel_context_reset(ce);
> > +	guc_context_replay(ce);
> > +}
> > +
> > +int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> > +					const u32 *msg, u32 len)
> > +{
> > +	struct intel_context *ce;
> > +	int desc_idx;
> > +
> > +	if (unlikely(len != 1)) {
> > +		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> I think we decided that these should be drm_err rather than drm_dbg?
> 

Yes, we did. Already fixed this message and all subsequent in my branch.

Matt

> With that updated:
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> 
> > +		return -EPROTO;
> > +	}
> > +
> > +	desc_idx = msg[0];
> > +	ce = g2h_context_lookup(guc, desc_idx);
> > +	if (unlikely(!ce))
> > +		return -EPROTO;
> > +
> > +	guc_handle_context_reset(guc, ce);
> > +
> > +	return 0;
> > +}
> > +
> >   void intel_guc_submission_print_info(struct intel_guc *guc,
> >   				     struct drm_printer *p)
> >   {
> > diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> > index 97c2e83984ed..c095c4d39456 100644
> > --- a/drivers/gpu/drm/i915/i915_trace.h
> > +++ b/drivers/gpu/drm/i915/i915_trace.h
> > @@ -929,6 +929,11 @@ DECLARE_EVENT_CLASS(intel_context,
> >   		      __entry->guc_sched_state_no_lock)
> >   );
> > +DEFINE_EVENT(intel_context, intel_context_reset,
> > +	     TP_PROTO(struct intel_context *ce),
> > +	     TP_ARGS(ce)
> > +);
> > +
> >   DEFINE_EVENT(intel_context, intel_context_register,
> >   	     TP_PROTO(struct intel_context *ce),
> >   	     TP_ARGS(ce)
> > @@ -1026,6 +1031,11 @@ trace_i915_request_out(struct i915_request *rq)
> >   {
> >   }
> > +static inline void
> > +trace_intel_context_reset(struct intel_context *ce)
> > +{
> > +}
> > +
> >   static inline void
> >   trace_intel_context_register(struct intel_context *ce)
> >   {
> 
