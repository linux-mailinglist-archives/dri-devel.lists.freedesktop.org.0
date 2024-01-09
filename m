Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09982876B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 14:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D6410E41E;
	Tue,  9 Jan 2024 13:51:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B2710E41E
 for <DRI-Devel@lists.freedesktop.org>; Tue,  9 Jan 2024 13:51:43 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a28cfca3c45so75837566b.1
 for <DRI-Devel@lists.freedesktop.org>; Tue, 09 Jan 2024 05:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704808302; x=1705413102; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BBkhuDjKaGRCom0CDKBnDtqKZspqJNW52TxlkO3fe0E=;
 b=i2YtsrSPkls5XN0By0R8ZbBIFxUhVKGFhna6AjcscrBviSUbIzC786D717iLihaGv4
 nD0+hpF7XevPASSx81dCVh4I+wZMFDocqBN/IAhDHDoX96JrgzulT5VQK9RYSnF6RIUc
 MbaRASLbuVj1RAN5VHWhLeEinkTjEUHxLX9Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704808302; x=1705413102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBkhuDjKaGRCom0CDKBnDtqKZspqJNW52TxlkO3fe0E=;
 b=HSTtYSK0pOOUmjqw3LMhTvaK/Py+A8Ydo9TiBwTFX3ufg1pt9zwU3KR01aMMjKM5TH
 fN5x8u9d30OeqfbIjKZplv/bnnq68hIVJ09Hw66fN615tuF/ZtE7/OfUrFDziNeKHphg
 pI0162YRJQ1LPNl5NCqBqEZqezfyVslOA8PewybA2fKiDjnEPTUUdupuwLYWSeYJ+VvR
 qPSEfdO8u1m0XiBrvmJ3KGwUE8VbSWeYwVt4OAjaMVdBnFINTSVlvZ2eifmP34eJOerN
 4AyVmlxQRbJEEtF39y3GDWDnDQdTkTznTgmOYLoPihEtY2Z9GGgObsnuc2tMTgEgIsQt
 dnaw==
X-Gm-Message-State: AOJu0YyqqFUtTEGrO2u3gVDoV6xKrk0JF0imaHY2wRvqrRItlwt5HFjI
 lhSxl0b3h3HPPfIRR3nPFiRe8uQPOxBLSy519LalM6dmMm4=
X-Google-Smtp-Source: AGHT+IGmgBRGNxfj7in++EYNJJWrmtpSfgiYQ0Z164gasldVemojaeF0ykyuOjp5B4z+vdw0ke7KTw==
X-Received: by 2002:a17:907:a43:b0:a27:7701:f16 with SMTP id
 be3-20020a1709070a4300b00a2777010f16mr5495846ejc.7.1704808301787; 
 Tue, 09 Jan 2024 05:51:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170906724a00b00a2af287c6b8sm1077218ejk.16.2024.01.09.05.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 05:51:41 -0800 (PST)
Date: Tue, 9 Jan 2024 14:51:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John.C.Harrison@intel.com
Subject: Re: [PATCH] drm/i915/guc: Avoid circular locking issue on busyness
 flush
Message-ID: <ZZ1Pa1z_oKZheOBe@phenom.ffwll.local>
References: <20231219195957.212600-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219195957.212600-1-John.C.Harrison@Intel.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, Intel-GFX@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 11:59:57AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Avoid the following lockdep complaint:
> <4> [298.856498] ======================================================
> <4> [298.856500] WARNING: possible circular locking dependency detected
> <4> [298.856503] 6.7.0-rc5-CI_DRM_14017-g58ac4ffc75b6+ #1 Tainted: G
>     N
> <4> [298.856505] ------------------------------------------------------
> <4> [298.856507] kworker/4:1H/190 is trying to acquire lock:
> <4> [298.856509] ffff8881103e9978 (&gt->reset.backoff_srcu){++++}-{0:0}, at:
> _intel_gt_reset_lock+0x35/0x380 [i915]
> <4> [298.856661]
> but task is already holding lock:
> <4> [298.856663] ffffc900013f7e58
> ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at:
> process_scheduled_works+0x264/0x530
> <4> [298.856671]
> which lock already depends on the new lock.
> 
> The complaint is not actually valid. The busyness worker thread does
> indeed hold the worker lock and then attempt to acquire the reset lock
> (which may have happened in reverse order elsewhere). However, it does
> so with a trylock that exits if the reset lock is not available
> (specifically to prevent this and other similar deadlocks).
> Unfortunately, lockdep does not understand the trylock semantics (the
> lock is an i915 specific custom implementation for resets).
> 
> Not doing a synchronous flush of the worker thread when a reset is in
> progress resolves the lockdep splat by never even attempting to grab
> the lock in this particular scenario.
> 
> There are situatons where a synchronous cancel is required, however.
> So, always do the synchronous cancel if not in reset. And add an extra
> synchronous cancel to the end of the reset flow to account for when a
> reset is occurring at driver shutdown and the cancel is no longer
> synchronous but could lead to unallocated memory accesses if the
> worker is not stopped.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 48 ++++++++++++++++++-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +-
>  2 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a259f1118c5ab..0228a77d456ed 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1362,7 +1362,45 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
>  
>  static void guc_cancel_busyness_worker(struct intel_guc *guc)
>  {
> -	cancel_delayed_work_sync(&guc->timestamp.work);
> +	/*
> +	 * There are many different call stacks that can get here. Some of them
> +	 * hold the reset mutex. The busyness worker also attempts to acquire the
> +	 * reset mutex. Synchronously flushing a worker thread requires acquiring
> +	 * the worker mutex. Lockdep sees this as a conflict. It thinks that the
> +	 * flush can deadlock because it holds the worker mutex while waiting for
> +	 * the reset mutex, but another thread is holding the reset mutex and might
> +	 * attempt to use other worker functions.
> +	 *
> +	 * In practice, this scenario does not exist because the busyness worker
> +	 * does not block waiting for the reset mutex. It does a try-lock on it and
> +	 * immediately exits if the lock is already held. Unfortunately, the mutex
> +	 * in question (I915_RESET_BACKOFF) is an i915 implementation which has lockdep
> +	 * annotation but not to the extent of explaining the 'might lock' is also a
> +	 * 'does not need to lock'. So one option would be to add more complex lockdep
> +	 * annotations to ignore the issue (if at all possible). A simpler option is to
> +	 * just not flush synchronously when a rest in progress. Given that the worker
> +	 * will just early exit and re-schedule itself anyway, there is no advantage
> +	 * to running it immediately.
> +	 *
> +	 * If a reset is not in progress, then the synchronous flush may be required.
> +	 * As noted many call stacks lead here, some during suspend and driver unload
> +	 * which do require a synchronous flush to make sure the worker is stopped
> +	 * before memory is freed.
> +	 *
> +	 * Trying to pass a 'need_sync' or 'in_reset' flag all the way down through
> +	 * every possible call stack is unfeasible. It would be too intrusive to many
> +	 * areas that really don't care about the GuC backend. However, there is the
> +	 * 'reset_in_progress' flag available, so just use that.
> +	 *
> +	 * And note that in the case of a reset occurring during driver unload
> +	 * (wedge_on_fini), skipping the cancel in _prepare (when the reset flag is set
> +	 * is fine because there is another cancel in _finish (when the reset flag is
> +	 * not).
> +	 */
> +	if (guc_to_gt(guc)->uc.reset_in_progress)
> +		cancel_delayed_work(&guc->timestamp.work);
> +	else
> +		cancel_delayed_work_sync(&guc->timestamp.work);

I think it's all fairly horrible (but that's not news), but this comment
here I think explains in adequate detail what's all going on, what all
matters, why it's all safe and why it's rather hard to fix in a clean
fashion. So realistically about as good as it will ever get.

More importantly, it doesn't gloss over any of the details which do matter
(of which there is a lot, as the length of this comment shows).

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  }
>  
>  static void __reset_guc_busyness_stats(struct intel_guc *guc)
> @@ -1948,8 +1986,16 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
>  
>  void intel_guc_submission_reset_finish(struct intel_guc *guc)
>  {
> +	/*
> +	 * Ensure the busyness worker gets cancelled even on a fatal wedge.
> +	 * Note that reset_prepare is not allowed to because it confuses lockdep.
> +	 */
> +	if (guc_submission_initialized(guc))
> +		guc_cancel_busyness_worker(guc);
> +
>  	/* Reset called during driver load or during wedge? */
>  	if (unlikely(!guc_submission_initialized(guc) ||
> +		     !intel_guc_is_fw_running(guc) ||
>  		     intel_gt_is_wedged(guc_to_gt(guc)))) {
>  		return;
>  	}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 3872d309ed31f..5a49305fb13be 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -640,7 +640,7 @@ void intel_uc_reset_finish(struct intel_uc *uc)
>  	uc->reset_in_progress = false;
>  
>  	/* Firmware expected to be running when this function is called */
> -	if (intel_guc_is_fw_running(guc) && intel_uc_uses_guc_submission(uc))
> +	if (intel_uc_uses_guc_submission(uc))
>  		intel_guc_submission_reset_finish(guc);
>  }
>  
> -- 
> 2.41.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
