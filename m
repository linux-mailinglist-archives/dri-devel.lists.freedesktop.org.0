Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B5013D4A9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 07:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13F16EBF9;
	Thu, 16 Jan 2020 06:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA26C6EBF9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 06:52:49 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id bg7so1108900pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 22:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PE4BnlYdrwlls3sXyQZX3/ymWvNt+AEObITFicQkgqE=;
 b=KhdCroBH4KSABB5oBicBd8oq46RsESodHAuFmJbyWOHgb0cywrQfkwrnvBLrrTChxf
 N/V98hs9U2UnHDJm/JadrFQw2a+wBUQ1QbxNbrKJloyJGVzgULW4KAU9iYAIiEVrMFKP
 W475hrsdCeaJq4OFwzxI6XD0BabR+eAXSXj1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PE4BnlYdrwlls3sXyQZX3/ymWvNt+AEObITFicQkgqE=;
 b=DG27yDve5vRklIViazIJ3s3zcq8qaTqvoYhk93MPKDSZG/hQsq8pzC2kQ2v/0Peg8h
 GQ9uqrtf4vezfn/i3ZY6HnM2ZyOJeckwjXyw64Bxroxrtb+WwNZisjKEWbmjFyVOKX6q
 h/x1xfFyJa2RVLqLujWXm42YVK+lxy43MtRoPvaIaQqZPUlw1tGsYmGIk7J6FX/ofiU7
 gAuhX4hipGh7a0IRfEPONMl9vGCPHEYng4wvfTfbWMr/mDZS6x5UasrxKe6sAQ5+OduE
 atw4w88788d/S9D6zELUfVfF6RfUuda9oYFyz5q0v+1Dmhk1iMg46NYkoPOBuIRRnwPG
 2dvg==
X-Gm-Message-State: APjAAAV0a5zY3YXYrkjB9Z2WPf2Pul3RgRi7MNSpOlyhoOLwtM/LbTs6
 YI2d9j1RNCv+e4hnDCd4BEQ+RQ==
X-Google-Smtp-Source: APXvYqx9AdyUZbn2iZHudv+3tWSAKLT5IOu0K9kcbg7NdtIB68wkc/4qX2VjWFHl7h1syTaI5uTssw==
X-Received: by 2002:a17:902:e789:: with SMTP id
 cp9mr36426714plb.85.1579157569454; 
 Wed, 15 Jan 2020 22:52:49 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id k16sm2084996pje.18.2020.01.15.22.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 22:52:48 -0800 (PST)
Date: Thu, 16 Jan 2020 07:52:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Message-ID: <20200116065242.GC8400@dvetter-linux.ger.corp.intel.com>
References: <20200115205245.2772800-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115205245.2772800-1-chris@chris-wilson.co.uk>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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
Cc: intel-gfx@lists.freedesktop.org, David Laight <David.Laight@aculab.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 08:52:45PM +0000, Chris Wilson wrote:
> Since we may try and flush the cachelines associated with large buffers
> (an 8K framebuffer is about 128MiB, even before we try HDR), this leads
> to unacceptably long latencies (when using a voluntary CONFIG_PREEMPT).
> If we call cond_resched() between each sg chunk, that it about every 128
> pages, we have a natural break point in which to check if the process
> needs to be rescheduled. Naturally, this means that drm_clflush_sg() can
> only be called from process context -- which is true at the moment. The
> other clflush routines remain usable from atomic context.
> 
> Even though flushing large objects takes a demonstrable amount to time
> to flush all the cachelines, clflush is still preferred over a
> system-wide wbinvd as the latter has unpredictable latencies affecting
> the whole system not just the local task.
> 
> Reported-by: David Laight <David.Laight@ACULAB.COM>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: David Laight <David.Laight@ACULAB.COM>

The original bug report is complaining about latencies for SCHED_RT
threads, on a system that doesn't even use CONFIG_PREEMPT. I'm not sure
it's terribly valid to cater to that use-case - all the desktop distros
seem a lot more reasonable. So firmly *shrug* from my side ...

Patch itself looks correct, just not seeing the point.
-Daniel


> ---
>  drivers/gpu/drm/drm_cache.c | 49 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index 03e01b000f7a..fbd2bb644544 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -112,23 +112,64 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
>  }
>  EXPORT_SYMBOL(drm_clflush_pages);
>  
> +static __always_inline struct sgt_iter {
> +	struct scatterlist *sgp;
> +	unsigned long pfn;
> +	unsigned int curr;
> +	unsigned int max;
> +} __sgt_iter(struct scatterlist *sgl) {
> +	struct sgt_iter s = { .sgp = sgl };
> +
> +	if (s.sgp) {
> +		s.max = s.curr = s.sgp->offset;
> +		s.max += s.sgp->length;
> +		s.pfn = page_to_pfn(sg_page(s.sgp));
> +	}
> +
> +	return s;
> +}
> +
> +static inline struct scatterlist *__sg_next_resched(struct scatterlist *sg)
> +{
> +	if (sg_is_last(sg))
> +		return NULL;
> +
> +	++sg;
> +	if (unlikely(sg_is_chain(sg))) {
> +		sg = sg_chain_ptr(sg);
> +		cond_resched();
> +	}
> +	return sg;
> +}
> +
> +#define for_each_sgt_page(__pp, __iter, __sgt)				\
> +	for ((__iter) = __sgt_iter((__sgt)->sgl);			\
> +	     ((__pp) = (__iter).pfn == 0 ? NULL :			\
> +	      pfn_to_page((__iter).pfn + ((__iter).curr >> PAGE_SHIFT))); \
> +	     (((__iter).curr += PAGE_SIZE) >= (__iter).max) ?		\
> +	     (__iter) = __sgt_iter(__sg_next_resched((__iter).sgp)), 0 : 0)
> +
>  /**
>   * drm_clflush_sg - Flush dcache lines pointing to a scather-gather.
>   * @st: struct sg_table.
>   *
>   * Flush every data cache line entry that points to an address in the
> - * sg.
> + * sg. This may schedule between scatterlist chunks, in order to keep
> + * the system preemption-latency down for large buffers.
>   */
>  void
>  drm_clflush_sg(struct sg_table *st)
>  {
> +	might_sleep();
> +
>  #if defined(CONFIG_X86)
>  	if (static_cpu_has(X86_FEATURE_CLFLUSH)) {
> -		struct sg_page_iter sg_iter;
> +		struct sgt_iter sg_iter;
> +		struct page *page;
>  
>  		mb(); /*CLFLUSH is ordered only by using memory barriers*/
> -		for_each_sg_page(st->sgl, &sg_iter, st->nents, 0)
> -			drm_clflush_page(sg_page_iter_page(&sg_iter));
> +		for_each_sgt_page(page, sg_iter, st)
> +			drm_clflush_page(page);
>  		mb(); /*Make sure that all cache line entry is flushed*/
>  
>  		return;
> -- 
> 2.25.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
