Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFB884476E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 19:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1F810FC09;
	Wed, 31 Jan 2024 18:48:13 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6528A10FC09;
 Wed, 31 Jan 2024 18:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706726891; x=1738262891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pekvpLdBKGfK69aUAMtDCzHVmf4LN8O75j2HCQgZFcw=;
 b=hKgwz8g/OW4ltJw9Fbbh+HNmQQR8OHGkNqhoFR/HpT04exJ/7kMObjpx
 4AUzMuV69LRW/WlZzGPhtYZ3JMm8Yp+0iEAtr9uvrLO94ZVIbyodCYBct
 mcY7LlVtKeDv0zFsLMhkTfC37UaNNV3nf7Fztv7DP28S5ZCsjDyzJuneZ
 GuWkcIRDAU5TTdgYxa6JMOMcAOJzKjQQJ4khEwkXeBujFeypa1/mvNWFH
 IHYguelpL8G4HSLM51SqzrO3OW4AYykfq6l/EraMifsg4Trn27IwHoSoT
 lnNPGf1OhJZ03UngEyCJFvXtHm8xc0EN1ECBaLtj4NSmvVeaPbGjbydyU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17075201"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="17075201"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="878869960"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="878869960"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.5])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:48:09 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Intel-GFX@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/gt: Restart the heartbeat timer when forcing a
 pulse
Date: Wed, 31 Jan 2024 19:48:07 +0100
Message-ID: <2202042.NgBsaNRSFp@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240110210216.4125092-1-John.C.Harrison@Intel.com>
References: <20240110210216.4125092-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: John.C.Harrison@intel.com, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Wednesday, 10 January 2024 22:02:16 CET John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The context persistence code does things like send super high priority
> heartbeat pulses to ensure any leaked context can still be pre-empted
> and thus isn't a total denial of service but only a minor denial of
> service. Unfortunately, it wasn't bothering to restart the heatbeat
> worker with a fresh timeout. Thus, if a persistent context happened to
> be closed just before the heartbeat was going to go ping anyway then
> the forced pulse would get a negligble execution time. And as the
> forced pulse is super high priority, the worker thread's next step is
> a reset. Which means a potentially innocent system randomly goes boom
> when attempting to close a context. So, force a re-schedule of the
> worker thread with the appropriate timeout.

I haven't looked too much in heartbeat pulses code before, but I think I can 
understand your change.  I've also got a positive opinion from Chris on it.  
I can provide my Ack, assuming the pre-merge failure reported by CI is not 
related, but could you please comment that failure first and/or ask BUG Filing 
to handle it so we have it cleaned up?

Thanks,
Janusz


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
> +
>  	return 0;
>  }
>  
> 




