Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D27423A9F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 11:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF646F63E;
	Wed,  6 Oct 2021 09:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FA16F632;
 Wed,  6 Oct 2021 09:34:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="286834244"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="286834244"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 02:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="524198646"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 06 Oct 2021 02:34:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 Oct 2021 12:34:19 +0300
Date: Wed, 6 Oct 2021 12:34:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Luca Abeni <lucabe72@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 3/8] drm/i915: Disable tracing points on PREEMPT_RT
Message-ID: <YV1tm8bNEBbPeU6/@intel.com>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
 <20211005150046.1000285-4-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005150046.1000285-4-bigeasy@linutronix.de>
X-Patchwork-Hint: comment
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

On Tue, Oct 05, 2021 at 05:00:41PM +0200, Sebastian Andrzej Siewior wrote:
> Luca Abeni reported this:
> | BUG: scheduling while atomic: kworker/u8:2/15203/0x00000003
> | CPU: 1 PID: 15203 Comm: kworker/u8:2 Not tainted 4.19.1-rt3 #10
> | Call Trace:
> |  rt_spin_lock+0x3f/0x50
> |  gen6_read32+0x45/0x1d0 [i915]
> |  g4x_get_vblank_counter+0x36/0x40 [i915]
> |  trace_event_raw_event_i915_pipe_update_start+0x7d/0xf0 [i915]
> 
> The tracing events use trace_i915_pipe_update_start() among other events
> use functions acquire spinlock_t locks which are transformed into
> sleeping locks on PREEMPT_RT. A few trace points use
> intel_get_crtc_scanline(), others use ->get_vblank_counter() wich also
> might acquire a sleeping locks on PREEMPT_RT.
> At the time the arguments are evaluated within trace point, preemption
> is disabled and so the locks must not be acquired on PREEMPT_RT.
> 
> Based on this I don't see any other way than disable trace points on
> PREMPT_RT.

I think the correct answer is to make uncore.lock a raw_spinlock.
Without the tracepoints deubgging any of this is stuff pretty much
impossible. We also take that lock a lot.

The horrible truth is that some of the hardware just keels over
if two CPUs access the same mmio cacheline simultanously, so
pretty much all mmio accesses need to be performed under uncore.lock.

The vblank locking situation is a lot more self inflicted. As in
there are something like three different spinlocks in there for
some reason. Not sure what to do about that. I guess one option
would be to skip the vblank timestamp based stuff in the
tracepoints for the time being. Most hardware should have
a hardware vblank counter so the fallback isn't super common.

> 
> Reported-by: Luca Abeni <lucabe72@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/gpu/drm/i915/i915_trace.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 806ad688274bf..773e7362c4442 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -2,6 +2,10 @@
>  #if !defined(_I915_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
>  #define _I915_TRACE_H_
>  
> +#ifdef CONFIG_PREEMPT_RT
> +#define NOTRACE
> +#endif
> +
>  #include <linux/stringify.h>
>  #include <linux/types.h>
>  #include <linux/tracepoint.h>
> -- 
> 2.33.0

-- 
Ville Syrjälä
Intel
