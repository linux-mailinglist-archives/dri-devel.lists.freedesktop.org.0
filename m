Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1874392C1C
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9FD6EE70;
	Thu, 27 May 2021 10:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E656EE6A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:46:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id m18so503986wmq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 03:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c4mAgs3hJlBW+DiixgSX63+ZKG0ya2IvVafcPSMKtOY=;
 b=eE+DepAkkxmAXyPtGebp5t2DkS0QWpt3NP//4e9CgMA/g5oE9asyfE5MtuHtdp1xtT
 wQDW2qY84c/fQz3v+F9mJ/99u+Mx+motiKogG85xeBODBRPUukq+SoaO/zsmaaWLzHkc
 DyML0I0pCifpOBSDrAtOgB3uMZky0vsyRKag0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c4mAgs3hJlBW+DiixgSX63+ZKG0ya2IvVafcPSMKtOY=;
 b=Y+x0jtD9bFIezi9yfsxGS4gKCf5na/2hclnt9673i/kxFTigNrD7Ba3ot2eZ0hZDwt
 dMXUGpctdrfT8lTjcBGblrCbVrVZH+xHYM1Q+7dmor/XOKGyBkrjPp8Gb48KVCpvBueQ
 htWdWHugheVCTWST/jPAAoaHKOxJIk03b49Ombs7jyO4toTDK5yGCcV4EU7514ZhAuuN
 K4aqOKDrEKHTqB9FKLyOseotMCOKxFT+ggTkXDJV5NarCGj+tsI45vCyn7PBP9eNjtZ6
 TlFhmnmcEZJpiaUv1Yy09qOiSCVIkzaoJMe+TJKlmNjgwiDioaLXiDkqydGOQHxAb2L8
 V8jQ==
X-Gm-Message-State: AOAM5316roheC8DbM9NYON0wHUvTdeZlq1zrBqle2tYsYzMXUCHOXtNP
 YUw5s7RrMR3cxWjAry8kS4AwUA==
X-Google-Smtp-Source: ABdhPJwEM6S72jKFAAfC0ikqcP1P7/Pbjc03v3unHEzNzPOpsI1rIbDFECddTTELO8u5abhghy9QYQ==
X-Received: by 2002:a1c:4444:: with SMTP id r65mr7507098wma.127.1622112396063; 
 Thu, 27 May 2021 03:46:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h8sm2579047wrw.85.2021.05.27.03.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 03:46:35 -0700 (PDT)
Date: Thu, 27 May 2021 12:46:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 01/12] drm/i915: Take rcu_read_lock for
 querying fence's driver/timeline names
Message-ID: <YK94iSW7JoJippim@phenom.ffwll.local>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
 <20210526141456.2334192-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526141456.2334192-2-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 03:14:45PM +0100, Tvrtko Ursulin wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> The name very often may be freed independently of the fence, with the
> only protection being RCU. To be safe as we read the names, hold RCU.

Yeah no.

If it's not clear why, figure it out first.
-Daniel

> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_sw_fence.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 2744558f3050..dfabf291e5cd 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -430,11 +430,13 @@ static void timer_i915_sw_fence_wake(struct timer_list *t)
>  	if (!fence)
>  		return;
>  
> +	rcu_read_lock();
>  	pr_notice("Asynchronous wait on fence %s:%s:%llx timed out (hint:%ps)\n",
>  		  cb->dma->ops->get_driver_name(cb->dma),
>  		  cb->dma->ops->get_timeline_name(cb->dma),
>  		  cb->dma->seqno,
>  		  i915_sw_fence_debug_hint(fence));
> +	rcu_read_unlock();
>  
>  	i915_sw_fence_set_error_once(fence, -ETIMEDOUT);
>  	i915_sw_fence_complete(fence);
> -- 
> 2.30.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
