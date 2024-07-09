Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB4092BC6B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 16:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8635C10E574;
	Tue,  9 Jul 2024 14:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="q79Qd1p6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132D810E571
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 14:02:54 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-36796d2e5a9so3516957f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1720533772; x=1721138572;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uu9OJhTofwP0VwGCWg6NqwdVMvMXhiTMagbsBjbyLLo=;
 b=q79Qd1p6aypvNHL3DoZUopo+PUlpmPUg8hy/8JbS8EEL8he6TwuHfUZkKOJLBbhrrB
 ApwJAm4xXP3Ltp5hDTpRWdyyEHXklF556RZQWvsHE1oDuvzJzlbvMBO9X0kfxHp1isHy
 CUXUMKsFw0fR7Pa/LBwyKWRqCjgDaGmEAWP68XM8ITwyD0Cvr65RRM1cbHhJxnsgUgEf
 XsF8miUxagFLlT+iem/MWoTSJCUwW5h/SGMoTcO5uzi2YndXPCXFlQDJ120Y4+ulg6uo
 B59OKEGLFRGOcOWZnDjhpMn0ETRvnTS8Eyr1xuh54EZ+aK2Fc5dQdfAry2ZGu6dMYB1u
 38+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720533772; x=1721138572;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uu9OJhTofwP0VwGCWg6NqwdVMvMXhiTMagbsBjbyLLo=;
 b=D8deLN5ad7eg56kt1RyQ88q57Wl+1FSMri3IXHxiO0Dsyli2N2aG/+o8sLr4zSK8yL
 0nI6APktg7vjz0EC8ZWjG9LRTDi7SPkFFPFllv+MHMIzF0DHtSFDEZJX+sLEsR69+dXk
 HOy9jIC7uxRAE8QOobM2bodRxfRbfQml346Zrn93bqAjAQPXfFA0C/9MhZKm+MWVhggZ
 kxV2Kns13CHT01G8B5jRvgyHapC/NHd9crpkfTYuVYOcWEasAZ0m+PNpWtEQbs3CPycA
 QQcppBcN8/f64Zsdd8X5DtPXPxgnSyeh3hAaBkpDnoRpDIqoXBJ/EE/CKc2udBANvldo
 OGMQ==
X-Gm-Message-State: AOJu0YwTrNiCrkO8QsVVx81RnCuktWYB1YxhQ2QcqMk5sPqIaS42fh5h
 h4kYjvPKXZin1FTW8tCxNPC6vB/UVYcyw3mzHmNZWXKkBfkhV8ZaaE5mI+vYQp0=
X-Google-Smtp-Source: AGHT+IFtT5ee2t3crvq4ZNBz+KhMcZm7i0t9xadFlUz5eVRkiHO6Bw0KLJ9RPYcYHiCfNac1dtmlnQ==
X-Received: by 2002:adf:a3d9:0:b0:367:958e:9832 with SMTP id
 ffacd0b85a97d-367cea46060mr1876324f8f.14.1720533772204; 
 Tue, 09 Jul 2024 07:02:52 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2fca8bsm209640155e9.47.2024.07.09.07.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 07:02:51 -0700 (PDT)
Message-ID: <51d17145-39bd-4ba5-a703-10725a1d3bc1@ursulin.net>
Date: Tue, 9 Jul 2024 15:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
To: Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, andi.shyti@intel.com,
 chris.p.wilson@linux.intel.com, nirmoy.das@intel.com,
 janusz.krzysztofik@linux.intel.com, stable@vger.kernel.org
References: <20240709125302.861319-1-nitin.r.gote@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240709125302.861319-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 09/07/2024 13:53, Nitin Gote wrote:
> We're seeing a GPU HANG issue on a CHV platform, which was caused by
> bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8").
> 
> Gen8 platform has only timeslice and doesn't support a preemption mechanism
> as engines do not have a preemption timer and doesn't send an irq if the
> preemption timeout expires. So, add a fix to not consider preemption
> during dequeuing for gen8 platforms.
> 
> Also move can_preemt() above need_preempt() function to resolve implicit
> declaration of function ‘can_preempt' error and make can_preempt()
> function param as const to resolve error: passing argument 1 of
> ‘can_preempt’ discards ‘const’ qualifier from the pointer target type.
> 
> Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11396
> Suggested-by: Andi Shyti <andi.shyti@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> CC: <stable@vger.kernel.org> # v5.2+
> ---
>   .../drm/i915/gt/intel_execlists_submission.c  | 24 ++++++++++++-------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 21829439e686..30631cc690f2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -294,11 +294,26 @@ static int virtual_prio(const struct intel_engine_execlists *el)
>   	return rb ? rb_entry(rb, struct ve_node, rb)->prio : INT_MIN;
>   }
>   
> +static bool can_preempt(const struct intel_engine_cs *engine)
> +{
> +	if (GRAPHICS_VER(engine->i915) > 8)
> +		return true;
> +
> +	if (IS_CHERRYVIEW(engine->i915) || IS_BROADWELL(engine->i915))
> +		return false;
> +
> +	/* GPGPU on bdw requires extra w/a; not implemented */
> +	return engine->class != RENDER_CLASS;

Aren't BDW and CHV the only Gen8 platforms, in which case this function 
can be simplifies as:

...
{
	return GRAPHICS_VER(engine->i915) > 8;
}

?

> +}
> +
>   static bool need_preempt(const struct intel_engine_cs *engine,
>   			 const struct i915_request *rq)
>   {
>   	int last_prio;
>   
> +	if ((GRAPHICS_VER(engine->i915) <= 8) && can_preempt(engine))

The GRAPHICS_VER check here looks redundant with the one inside 
can_preempt().

Regards,

Tvrtko

> +		return false;
> +
>   	if (!intel_engine_has_semaphores(engine))
>   		return false;
>   
> @@ -3313,15 +3328,6 @@ static void remove_from_engine(struct i915_request *rq)
>   	i915_request_notify_execute_cb_imm(rq);
>   }
>   
> -static bool can_preempt(struct intel_engine_cs *engine)
> -{
> -	if (GRAPHICS_VER(engine->i915) > 8)
> -		return true;
> -
> -	/* GPGPU on bdw requires extra w/a; not implemented */
> -	return engine->class != RENDER_CLASS;
> -}
> -
>   static void kick_execlists(const struct i915_request *rq, int prio)
>   {
>   	struct intel_engine_cs *engine = rq->engine;
