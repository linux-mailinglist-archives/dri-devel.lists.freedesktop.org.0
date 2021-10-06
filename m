Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DE5423A69
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 11:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D356E44A;
	Wed,  6 Oct 2021 09:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713C66F648;
 Wed,  6 Oct 2021 09:16:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="206072292"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="206072292"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 02:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="560120672"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 06 Oct 2021 02:16:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 Oct 2021 12:16:45 +0300
Date: Wed, 6 Oct 2021 12:16:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mike Galbraith <umgwanakikbuti@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/8] drm/i915: Don't disable interrupts on
 PREEMPT_RT during atomic updates
Message-ID: <YV1pfUZlbGYfe7d9@intel.com>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
 <20211005150046.1000285-3-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005150046.1000285-3-bigeasy@linutronix.de>
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

On Tue, Oct 05, 2021 at 05:00:40PM +0200, Sebastian Andrzej Siewior wrote:
> From: Mike Galbraith <umgwanakikbuti@gmail.com>
> 
> Commit
>    8d7849db3eab7 ("drm/i915: Make sprite updates atomic")
> 
> started disabling interrupts across atomic updates. This breaks on PREEMPT_RT
> because within this section the code attempt to acquire spinlock_t locks which
> are sleeping locks on PREEMPT_RT.
> 
> According to the comment the interrupts are disabled to avoid random delays and
> not required for protection or synchronisation.
> If this needs to happen with disabled interrupts on PREEMPT_RT, and the
> whole section is restricted to register access then all sleeping locks
> need to be acquired before interrupts are disabled and some function
> maybe moved after enabling interrupts again.
> This includes:
> - prepare_to_wait() + finish_wait() due its wake queue.
> - drm_crtc_vblank_put() -> vblank_disable_fn() drm_device::vbl_lock.
> - skl_pfit_enable(), intel_update_plane(), vlv_atomic_update_fifo() and
>   maybe others due to intel_uncore::lock
> - drm_crtc_arm_vblank_event() due to drm_device::event_lock and
>   drm_device::vblank_time_lock.
> 
> Don't disable interrupts on PREEMPT_RT during atomic updates.
> 
> [bigeasy: drop local locks, commit message]

I have my doubts about meething the deadlines here.
CONFIG_DRM_I915_DEBUG_VBLANK_EVADE should scream a bunch if it
looks like we're missing it.

That said, we already miss the deadline sometimes, esp. with
lockdep and whatnot enabled which makes the locking very expensive.

Also some ideas how to reduce the overhead:
- Try to make the mmio accesses lockless as much s possible
- Reduce the amount of work we do in the critical section

Anyways, RT hasn't really been on anyone's radar so no one
has yet spent significant amount of brain cells on this.

> 
> Signed-off-by: Mike Galbraith <umgwanakikbuti@gmail.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/gpu/drm/i915/display/intel_crtc.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 254e67141a776..7a39029b083f4 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -425,7 +425,8 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
>  	 */
>  	intel_psr_wait_for_idle(new_crtc_state);
>  
> -	local_irq_disable();
> +	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +		local_irq_disable();
>  
>  	crtc->debug.min_vbl = min;
>  	crtc->debug.max_vbl = max;
> @@ -450,11 +451,13 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
>  			break;
>  		}
>  
> -		local_irq_enable();
> +		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +			local_irq_enable();
>  
>  		timeout = schedule_timeout(timeout);
>  
> -		local_irq_disable();
> +		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +			local_irq_disable();
>  	}
>  
>  	finish_wait(wq, &wait);
> @@ -487,7 +490,8 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
>  	return;
>  
>  irq_disable:
> -	local_irq_disable();
> +	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +		local_irq_disable();
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_VBLANK_EVADE)
> @@ -566,7 +570,8 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
>  		new_crtc_state->uapi.event = NULL;
>  	}
>  
> -	local_irq_enable();
> +	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +		local_irq_enable();
>  
>  	/* Send VRR Push to terminate Vblank */
>  	intel_vrr_send_push(new_crtc_state);
> -- 
> 2.33.0

-- 
Ville Syrjälä
Intel
