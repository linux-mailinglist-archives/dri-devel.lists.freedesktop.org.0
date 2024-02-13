Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C8185239A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 01:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB5E10E4EC;
	Tue, 13 Feb 2024 00:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDeSTVte";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B25C10E3A9;
 Tue, 13 Feb 2024 00:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707784185; x=1739320185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CUji2c5PQndNwpUyO63Kb53yvZdQC2V6uumXpWz5L9k=;
 b=NDeSTVteRZ1wszZ9wbzVcDNeexJo12I0GKwjY4hy0y9B98ScFWZqKXfa
 ne/OoMJr/KGWhgmamsH++792FbDbZ95zPdK6OgkkMcCjnSp3Vs4sVIn6e
 ISTTv2SHuAoTO+5BnGp8zL3jcsTh8QpVVB3pU3fHU7SyR68xZUlJo3GPF
 ti4QseBQuHKAsdpiv27PYJMe+tMdAEDmcsGmFOJvVj73SmHk0l9bc7wFP
 q07FPWoeqGzIisCB9z/E0/7puP1WvIcBg/x5f8U5Dt+YnqNf+zGhAgs0I
 HVFdocM8Mm9ANymxaorVg4iRmD9CSJ+mxV6evJkpUDCJEepLEic5bVUHG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436924757"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; d="scan'208";a="436924757"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 16:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="2920516"
Received: from lchaves-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.246.48.59])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 16:29:40 -0800
Date: Tue, 13 Feb 2024 01:29:37 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/gt: Restart the heartbeat timer when forcing a
 pulse
Message-ID: <Zcq38SQlghqliSLw@ashyti-mobl2.lan>
References: <20240110210216.4125092-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110210216.4125092-1-John.C.Harrison@Intel.com>
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

Hi John,

On Wed, Jan 10, 2024 at 01:02:16PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The context persistence code does things like send super high priority
> heartbeat pulses to ensure any leaked context can still be pre-empted
> and thus isn't a total denial of service but only a minor denial of
> service. Unfortunately, it wasn't bothering to restart the heatbeat

/heatbeat/heartbeat/

> worker with a fresh timeout. Thus, if a persistent context happened to
> be closed just before the heartbeat was going to go ping anyway then
> the forced pulse would get a negligble execution time. And as the
> forced pulse is super high priority, the worker thread's next step is
> a reset. Which means a potentially innocent system randomly goes boom
> when attempting to close a context. So, force a re-schedule of the
> worker thread with the appropriate timeout.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index 1a8e2b7db0138..4ae2fa0b61dd4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -290,6 +290,9 @@ static int __intel_engine_pulse(struct intel_engine_cs *engine)
>  	heartbeat_commit(rq, &attr);
>  	GEM_BUG_ON(rq->sched.attr.priority < I915_PRIORITY_BARRIER);
>  
> +	/* Ensure the forced pulse gets a full period to execute */
> +	next_heartbeat(engine);

I think it makes sense to have this extra heardbeat here and,
as I've been mulling over it, I don't any harm.

The failure doesn't look related, either.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

>  	return 0;
>  }
>  
> -- 
> 2.43.0
