Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD134746B1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 16:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D2210E552;
	Tue, 14 Dec 2021 15:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3978D10E552;
 Tue, 14 Dec 2021 15:41:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238949105"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="238949105"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 07:41:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="682099432"
Received: from nalbarnj-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.3.235])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 07:41:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [PATCH 7/8] drm/i915: Disable tracing points on PREEMPT_RT
In-Reply-To: <20211214093652.0dfa5b6f@gandalf.local.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211214140301.520464-1-bigeasy@linutronix.de>
 <20211214140301.520464-8-bigeasy@linutronix.de>
 <20211214093652.0dfa5b6f@gandalf.local.home>
Date: Tue, 14 Dec 2021 17:41:17 +0200
Message-ID: <87bl1j5h42.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Luca Abeni <lucabe72@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Dec 2021, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Tue, 14 Dec 2021 15:03:00 +0100
> Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
>
>> Luca Abeni reported this:
>> | BUG: scheduling while atomic: kworker/u8:2/15203/0x00000003
>> | CPU: 1 PID: 15203 Comm: kworker/u8:2 Not tainted 4.19.1-rt3 #10
>> | Call Trace:
>> |  rt_spin_lock+0x3f/0x50
>> |  gen6_read32+0x45/0x1d0 [i915]
>> |  g4x_get_vblank_counter+0x36/0x40 [i915]
>> |  trace_event_raw_event_i915_pipe_update_start+0x7d/0xf0 [i915]
>> 
>> The tracing events use trace_i915_pipe_update_start() among other events
>> use functions acquire spinlock_t locks which are transformed into
>> sleeping locks on PREEMPT_RT. A few trace points use
>> intel_get_crtc_scanline(), others use ->get_vblank_counter() wich also
>> might acquire a sleeping locks on PREEMPT_RT.
>> At the time the arguments are evaluated within trace point, preemption
>> is disabled and so the locks must not be acquired on PREEMPT_RT.
>> 
>> Based on this I don't see any other way than disable trace points on
>> PREMPT_RT.
>
> Another way around this that I can see is if the data for the tracepoints
> can fit on the stack and add wrappers around the tracepoints. For example,
> looking at the first tracepoint in i915_trace.h:

FYI display portions of the file have been split to
display/intel_display_trace.[ch] in current drm-intel-next, headed for
v5.17 merge window.

BR,
Jani.


>
> TRACE_EVENT(intel_pipe_enable,
> 	    TP_PROTO(struct intel_crtc *crtc),
> 	    TP_ARGS(crtc),
>
> 	    TP_STRUCT__entry(
> 			     __array(u32, frame, 3)
> 			     __array(u32, scanline, 3)
> 			     __field(enum pipe, pipe)
> 			     ),
> 	    TP_fast_assign(
> 			   struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
> 			   struct intel_crtc *it__;
> 			   for_each_intel_crtc(&dev_priv->drm, it__) {
> 				   __entry->frame[it__->pipe] = intel_crtc_get_vblank_counter(it__);
> 				   __entry->scanline[it__->pipe] = intel_get_crtc_scanline(it__);
> 			   }
> 			   __entry->pipe = crtc->pipe;
> 			   ),
>
> 	    TP_printk("pipe %c enable, pipe A: frame=%u, scanline=%u, pipe B: frame=%u, scanline=%u, pipe C: frame=%u, scanline=%u",
> 		      pipe_name(__entry->pipe),
> 		      __entry->frame[PIPE_A], __entry->scanline[PIPE_A],
> 		      __entry->frame[PIPE_B], __entry->scanline[PIPE_B],
> 		      __entry->frame[PIPE_C], __entry->scanline[PIPE_C])
> );
>
> We could modify this to be:
>
> TRACE_EVENT(intel_pipe_enable,
> 	    TP_PROTO(u32 *frame, u32 *scanline, enum pipe),
> 	    TP_ARGS(frame, scanline, pipe),
>
> 	    TP_STRUCT__entry(
> 			     __array(u32, frame, 3)
> 			     __array(u32, scanline, 3)
> 			     __field(enum pipe, pipe)
> 			     ),
> 	    TP_fast_assign(
> 			   int i;
> 			   for (i = 0; i < 3; i++) {
> 			      __entry->frame[i] = frame[i];
> 			      __entry->scanline[i] = scanline[i];
> 			   }
> 			   __entry->pipe = pipe;
> 			   ),
>
> 	    TP_printk("pipe %c enable, pipe A: frame=%u, scanline=%u, pipe B: frame=%u, scanline=%u, pipe C: frame=%u, scanline=%u",
> 		      pipe_name(__entry->pipe),
> 		      __entry->frame[PIPE_A], __entry->scanline[PIPE_A],
> 		      __entry->frame[PIPE_B], __entry->scanline[PIPE_B],
> 		      __entry->frame[PIPE_C], __entry->scanline[PIPE_C])
> );
>
>
> static inline void do_trace_intel_pipe(struct intel_crtc *crtc)
> {
> 	u32 frame[3];
> 	u32 scanline[3];
> 	enum pipe pipe;
>
> 	if (!trace_intel_pipe_enable_enabled())
> 		return;
>
> 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
> 	struct intel_crtc *it__;
> 	for_each_intel_crtc(&dev_priv->drm, it__) {
> 		frame[it__->pipe] = intel_crtc_get_vblank_counter(it__);
> 		scanline[it__->pipe] = intel_get_crtc_scanline(it__);
> 	}
>
> 	trace_intel_pipe(frame, scanline, crtc->pipe);
> }
>
>
> The trace_intel_pipe_enable_enabled() is a static_branch that will act the
> same as the nop of a trace event, so this will still not add overhead when
> not enabled.
>
> All the processing will be done outside the trace event allowing it to be
> preempted, and then when the trace event is executed, it will run quickly
> without taking any locks.
>
> Then have the code call do_trace_intel_pipe() instead of trace_intel_pipe()
> and this should fix the issue with preempt rt.
>
> -- Steve

-- 
Jani Nikula, Intel Open Source Graphics Center
