Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B35EA9A378
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 09:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6862110E745;
	Thu, 24 Apr 2025 07:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="toHVGeMe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IsLUglRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Thu, 24 Apr 2025 07:24:36 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3516B10E009;
 Thu, 24 Apr 2025 07:24:36 +0000 (UTC)
Date: Thu, 24 Apr 2025 09:15:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1745478955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2PCGrdmxoQ3SbHA+7E+kNOmoS0qvn21yo5rrDA+j3rw=;
 b=toHVGeMeU2cfiS1J7qzC0zNuHQNrnhoBv7pm+YyFA3l0Mqtw5VpFwwyrR8ACkHbSMh8PUZ
 bRVRhtLFL7PudO4ZIEFTTQ/J5srMRBTxCT/qAgA30CLEX22Kv1EpEIZX9ZWiNwX6MjcEAz
 RCgJYeR8dj17UUs2MeSz9pP1GOLkmEW9PF0pqfJGKgmrF7YmCDMabd5gNpxAu05vIaGx3T
 uTk8WkvgRXlPgXe8o4qoF0nDoyC/TCBUGyvXAcMrmh9MVmF5vA5JWpmytYFWDbMdRvUgWV
 nPPhD9aWKvF5NzI/jNGBRAiMM4MrxlvDJd8IRKmA3NCIm5mcvp+y0pAB8aJ43g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1745478955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2PCGrdmxoQ3SbHA+7E+kNOmoS0qvn21yo5rrDA+j3rw=;
 b=IsLUglREf3JqL+7nt64O8XhbXk70GcRbLMhGRAWmAsPhBPqp+BJcAtp61Q84B7+dvXom/5
 Rc9wphuvfPmPqMBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Junxiao Chang <junxiao.chang@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] drm/i915/gsc: mei interrupt top half should be in irq
 disabled context
Message-ID: <20250424071553.yT9-dWWM@linutronix.de>
References: <20250424065609.624457-1-junxiao.chang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424065609.624457-1-junxiao.chang@intel.com>
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

On 2025-04-24 14:56:08 [+0800], Junxiao Chang wrote:
> MEI GSC interrupt comes from i915. It has top half and bottom half.
> Top half is called from i915 interrupt handler. It should be in
> irq disabled context.
> 
> With RT kernel, by default i915 IRQ handler is in threaded IRQ. MEI GSC
> top half might be in threaded IRQ context. In this case, local IRQ
> should be disabled for MEI GSC interrupt top half.
> 
> This change fixes A380/A770 GPU boot hang issue with RT kernel.

This should have a Fixes when generic_handle_irq() was introduced. 

> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gsc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
> index 1e925c75fb080..9c72117263f78 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gsc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
> @@ -270,6 +270,9 @@ static void gsc_init_one(struct drm_i915_private *i915, struct intel_gsc *gsc,
>  static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
>  {
>  	int ret;
> +#ifdef CONFIG_PREEMPT_RT
> +	int irq_disabled_flag;
> +#endif
>  
>  	if (intf_id >= INTEL_GSC_NUM_INTERFACES) {
>  		gt_warn_once(gt, "GSC irq: intf_id %d is out of range", intf_id);
> @@ -284,7 +287,18 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
>  	if (gt->gsc.intf[intf_id].irq < 0)
>  		return;
>  
> +#ifdef CONFIG_PREEMPT_RT
> +	/* mei interrupt top half should run in irq disabled context */
> +	irq_disabled_flag = irqs_disabled();
> +	if (!irq_disabled_flag)
> +		local_irq_disable();
> +#endif
>  	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);

What about generic_handle_irq_safe() instead the whole ifdef show?

> +#ifdef CONFIG_PREEMPT_RT
> +	if (!irq_disabled_flag)
> +		local_irq_enable();
> +#endif
> +
>  	if (ret)
>  		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
>  }

Sebastian
