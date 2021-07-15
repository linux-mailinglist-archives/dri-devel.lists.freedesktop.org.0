Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE27B3C9532
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A556E4F4;
	Thu, 15 Jul 2021 00:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1176E4EC;
 Thu, 15 Jul 2021 00:32:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="210493749"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="210493749"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 17:32:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="460177811"
Received: from dut031-tgly.fm.intel.com ([10.105.19.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 17:32:48 -0700
Date: Thu, 15 Jul 2021 00:32:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 35/47] drm/i915/guc: Handle context reset notification
Message-ID: <20210715003246.GA18054@DUT031-TGLY.fm.intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-36-matthew.brost@intel.com>
 <4c6c60f4-c920-b86f-0ea5-6e2bfe0e61b8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c6c60f4-c920-b86f-0ea5-6e2bfe0e61b8@intel.com>
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

On Mon, Jul 12, 2021 at 03:58:12PM -0700, John Harrison wrote:
> On 6/24/2021 00:05, Matthew Brost wrote:
> > GuC will issue a reset on detecting an engine hang and will notify
> > the driver via a G2H message. The driver will service the notification
> > by resetting the guilty context to a simple state or banning it
> > completely.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 ++
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  3 ++
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 35 +++++++++++++++++++
> >   drivers/gpu/drm/i915/i915_trace.h             | 10 ++++++
> >   4 files changed, 50 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 85ef6767f13b..e94b0ef733da 100644
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
> > index 4ed074df88e5..a2020373b8e8 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -945,6 +945,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
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
> > index 16b61fe71b07..9845c5bd9832 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2192,6 +2192,41 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
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
> > +	int desc_idx = msg[0];
> Should do this dereference after checking the length? Or is it guaranteed
> that the length cannot be zero?
> 

I think for safety, it should be moved.

Matt

> John.
> 
> > +
> > +	if (unlikely(len != 1)) {
> > +		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> > +		return -EPROTO;
> > +	}
> > +
> > +	ce = g2h_context_lookup(guc, desc_idx);
> > +	if (unlikely(!ce))
> > +		return -EPROTO;
> > +
> > +	guc_handle_context_reset(guc, ce);
> > +
> > +	return 0;
> > +}
> > +
> >   void intel_guc_log_submission_info(struct intel_guc *guc,
> >   				   struct drm_printer *p)
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
