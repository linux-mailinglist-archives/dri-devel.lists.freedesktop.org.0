Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4B37AACD
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 17:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DCB6EA62;
	Tue, 11 May 2021 15:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8346EA62
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 15:37:58 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id c22so2312716ejd.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nZ2W0ETwKDVnKN8YndLe1cMnvKC1+I/FRbzUkYKiaXI=;
 b=OIPx0g7mm3sjdy33BWOdcg5ZqYtL74k6WdGfTMGp7OiOUBACH+2/8Sl4dy7CJuv+7p
 2glIT5C1d5TBg+Pd7ccyx4us1JZz6QIHGe9yV8vJnBeuJvslN7TsO/JsL2k7/G9+pSpz
 fwddBdZ0SSifV6FNLRh126i1/B054Wb8Dsa4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nZ2W0ETwKDVnKN8YndLe1cMnvKC1+I/FRbzUkYKiaXI=;
 b=CPbe7Uz5dIdzRfn+J3x/Fh0DXUN7jlqW0G1Qk11R41YOL9NlrRDu/05lQN+XonccES
 MRLgaUWDFYN+rZ3WqojZlD0Ax0eAL51NAIFgVMmNQjCzvk8LoseaC3jJuETquzLo6NA3
 nO8FFghsR/m4Qq4Ha09sDluJfPsMuMTATVULvUvGA3gzjMAjty73so5DaV6k/V9Qqyln
 QJ5/DS+8epSRVgXSV99pYIyM1fVVmICmBcGMphzEa5iKPL70PPRtF7mmlfXhHxnKGaKu
 vXxjtKmOBaBfc8/Ia1zmx95zFmHwXOWy2+7Zi/0mfWhThzA7xBE8eNgjP+pLQIPa1iKZ
 Ucvw==
X-Gm-Message-State: AOAM5339el9CXK5ZcWdRHgJn1MP0eCC+Cev4PVklcnjTciqOv9AVO0+y
 FpwSkUdXfVdSDBRcIoVWyo/OVA==
X-Google-Smtp-Source: ABdhPJxqb572XNIo/l8W0rUTgEm7cTCbjvI1iV+a/cnBcwfVhOGkXlE7t/UxF3wkjw3hwOdU5A6W/g==
X-Received: by 2002:a17:906:c01a:: with SMTP id
 e26mr32624298ejz.300.1620747477334; 
 Tue, 11 May 2021 08:37:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g24sm5203284eds.41.2021.05.11.08.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:37:56 -0700 (PDT)
Date: Tue, 11 May 2021 17:37:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 49/97] drm/i915/guc: Disable engine barriers with GuC
 during unpin
Message-ID: <YJqk0pcx4JruoyXz@phenom.ffwll.local>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-50-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-50-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: tvrtko.ursulin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:14:03PM -0700, Matthew Brost wrote:
> Disable engine barriers for unpinning with GuC. This feature isn't
> needed with the GuC as it disables context scheduling before unpinning
> which guarantees the HW will not reference the context. Hence it is
> not necessary to defer unpinning until a kernel context request
> completes on each engine in the context engine mask.
> 
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Instead of these ifs in the code, can we push this barrier business down
into backends?

Not in this series, but as one of the things to sort out as part of the
conversion to drm/scheduler.
-Daniel

> ---
>  drivers/gpu/drm/i915/gt/intel_context.c    |  2 +-
>  drivers/gpu/drm/i915/gt/intel_context.h    |  1 +
>  drivers/gpu/drm/i915/gt/selftest_context.c | 10 ++++++++++
>  drivers/gpu/drm/i915/i915_active.c         |  3 +++
>  4 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 1499b8aace2a..7f97753ab164 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -80,7 +80,7 @@ static int intel_context_active_acquire(struct intel_context *ce)
>  
>  	__i915_active_acquire(&ce->active);
>  
> -	if (intel_context_is_barrier(ce))
> +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
>  		return 0;
>  
>  	/* Preallocate tracking nodes */
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 92ecbab8c1cd..9b211ca5ecc7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -16,6 +16,7 @@
>  #include "intel_engine_types.h"
>  #include "intel_ring_types.h"
>  #include "intel_timeline_types.h"
> +#include "uc/intel_guc_submission.h"
>  
>  #define CE_TRACE(ce, fmt, ...) do {					\
>  	const struct intel_context *ce__ = (ce);			\
> diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
> index 26685b927169..fa7b99a671dd 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_context.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_context.c
> @@ -209,7 +209,13 @@ static int __live_active_context(struct intel_engine_cs *engine)
>  	 * This test makes sure that the context is kept alive until a
>  	 * subsequent idle-barrier (emitted when the engine wakeref hits 0
>  	 * with no more outstanding requests).
> +	 *
> +	 * In GuC submission mode we don't use idle barriers and we instead
> +	 * get a message from the GuC to signal that it is safe to unpin the
> +	 * context from memory.
>  	 */
> +	if (intel_engine_uses_guc(engine))
> +		return 0;
>  
>  	if (intel_engine_pm_is_awake(engine)) {
>  		pr_err("%s is awake before starting %s!\n",
> @@ -357,7 +363,11 @@ static int __live_remote_context(struct intel_engine_cs *engine)
>  	 * on the context image remotely (intel_context_prepare_remote_request),
>  	 * which inserts foreign fences into intel_context.active, does not
>  	 * clobber the idle-barrier.
> +	 *
> +	 * In GuC submission mode we don't use idle barriers.
>  	 */
> +	if (intel_engine_uses_guc(engine))
> +		return 0;
>  
>  	if (intel_engine_pm_is_awake(engine)) {
>  		pr_err("%s is awake before starting %s!\n",
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index b1aa1c482c32..9a264898bb91 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -968,6 +968,9 @@ void i915_active_acquire_barrier(struct i915_active *ref)
>  
>  	GEM_BUG_ON(i915_active_is_idle(ref));
>  
> +	if (llist_empty(&ref->preallocated_barriers))
> +		return;
> +
>  	/*
>  	 * Transfer the list of preallocated barriers into the
>  	 * i915_active rbtree, but only as proto-nodes. They will be
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
