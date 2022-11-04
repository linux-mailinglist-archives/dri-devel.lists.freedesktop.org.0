Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2112D6192F5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 09:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF7510E703;
	Fri,  4 Nov 2022 08:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD558972C;
 Fri,  4 Nov 2022 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667551714; x=1699087714;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SieuJp0yLN7Eko7RfCaC+7W6DcydvNmx8QgS37YH/kU=;
 b=fq2cj16eks+5i8yGy1S9xJ6Jm9c5u1bzo212VX6gOKvfYoHXjEzHsdfI
 d7U4xlCi+kpNY5naVOSRr1ipH001dSTri89UFz+q9o8mjw799n2PKT3py
 YExx0GdFWVhR4jLhLN3P4i/Q5Q9rfKNI8jIB1SqrAwbcJIRR/S7DYccJE
 gwAedc5LA69MwPsSynoY9zX7UkaiWppQNCvu0n14jEFnIgSh2MCzLUhFi
 Ihdgx9XtlrQnLyR+V6kvc+QqCo/kkluPCXwFK5CCXJ1t6mcaD1+/yVZdl
 MD7v14B/ZLa2VN4HC/Pj89G2H90EEGK4xZTj/Jw9LUEKNb0IqJoGpkZeT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="289636202"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="289636202"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 01:48:34 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="809992785"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="809992785"
Received: from mlmesa-mobl2.ger.corp.intel.com (HELO [10.213.192.110])
 ([10.213.192.110])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 01:48:30 -0700
Message-ID: <ab708fad-9390-2b11-19d8-3e2635254f29@linux.intel.com>
Date: Fri, 4 Nov 2022 08:48:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC][PATCH v3 13/33] timers: drm: Use timer_shutdown_sync()
 before freeing timer
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
References: <20221104054053.431922658@goodmis.org>
 <20221104054914.271196777@goodmis.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221104054914.271196777@goodmis.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 04/11/2022 05:41, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> Before a timer is freed, timer_shutdown_sync() must be called.
> 
> Link: https://lore.kernel.org/all/20220407161745.7d6754b3@gandalf.local.home/
> 
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>   drivers/gpu/drm/gud/gud_pipe.c       | 2 +-
>   drivers/gpu/drm/i915/i915_sw_fence.c | 2 +-

If it stays all DRM drivers in one patch then I guess it needs to go via 
drm-misc, which for i915 would be okay I think in this case since patch 
is extremely unlikely to clash with anything. Or split it up per driver 
and then we can handle it in drm-intel-next once core functionality is in.

We do however have some more calls to del_timer_sync, where freeing is 
perhaps not immediately next to the site in code, but things definitely 
get freed like on module unload. Would we need to convert all of them to 
avoid some, presumably new, warnings?

Regards,

Tvrtko

>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 7c6dc2bcd14a..08429bdd57cf 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -272,7 +272,7 @@ static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
>   
>   	usb_sg_wait(&ctx.sgr);
>   
> -	if (!del_timer_sync(&ctx.timer))
> +	if (!timer_shutdown_sync(&ctx.timer))
>   		ret = -ETIMEDOUT;
>   	else if (ctx.sgr.status < 0)
>   		ret = ctx.sgr.status;
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 6fc0d1b89690..bfaa9a67dc35 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -465,7 +465,7 @@ static void irq_i915_sw_fence_work(struct irq_work *wrk)
>   	struct i915_sw_dma_fence_cb_timer *cb =
>   		container_of(wrk, typeof(*cb), work);
>   
> -	del_timer_sync(&cb->timer);
> +	timer_shutdown_sync(&cb->timer);
>   	dma_fence_put(cb->dma);
>   
>   	kfree_rcu(cb, rcu);
