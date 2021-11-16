Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43C4537C5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 17:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDCC6E03E;
	Tue, 16 Nov 2021 16:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B839C6E03E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 16:37:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id i12so16723913wmq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 08:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tbVG0zLxx2OdRmBXqol7QL1Z8vbtq3aqMsSZsCQ6MTs=;
 b=WtY8nYi0J7zToYD8+SNvXhgatbQRO0AAGntCt6ejismlW88t4D0hqJRglXK0GjRH5v
 oJymQrTZWrtJFJM5k5HNN954fm/vzQhyqN+l06/EduvDWGiWTpx9dlFGiQzLN0MBPiul
 hx0ecoXWKbAvt+z4w52x6tB5YMvMayQKLHyu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tbVG0zLxx2OdRmBXqol7QL1Z8vbtq3aqMsSZsCQ6MTs=;
 b=n1j3qrjDjFfmSa07rcSkA4J+5YrMuNuXbo/jD+MmFZhsfyMXBlKjFFUsd9XC0AJHTn
 EBA30CX3kKDpeLbPhPXv6Qs2vaX3E6BCq6NWp2YZ5qSCTYSn2PrY/KVJO91Ifl220MUF
 0n9hR8RiA1kku0VwCJ370K7OgrpYSakhemxKZl4MUE6vFSdSK4okY8cX8lzhFuDuWFPc
 40hU0lEiL/9NvYCkaw6DFcVDxKGiWQ3IjaI6uK0fmjw73UqgKLH60P+hC1V1SwoNXYj4
 Xxv9+z+MSDgdIL/LEhf8Vt3uw0I6o2jENGaaTY7UIpf0rIWRjkCUEd8PX42FX+bPBJez
 YNCw==
X-Gm-Message-State: AOAM533NIKHtrb5LmtUrGzZytXL3OAZZ9JlFcG4Bhfr3++NmLqDKkawX
 1h6tASlmB5iN88PB0hv9wUUFXPlorvYwwQ==
X-Google-Smtp-Source: ABdhPJyZioQBeTc+kRqNwQwrqt6gaC+obTm61vpKOM3yHqWhs5KTYCZAO8Je4oJnknVZcYOst1zk4A==
X-Received: by 2002:a1c:9842:: with SMTP id a63mr70912757wme.102.1637080674082; 
 Tue, 16 Nov 2021 08:37:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c11sm4335223wmq.27.2021.11.16.08.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:37:53 -0800 (PST)
Date: Tue, 16 Nov 2021 17:37:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: fix dropping the last fence ref
Message-ID: <YZPeXyCSaRRtUN21@phenom.ffwll.local>
References: <20211116092519.99206-1-christian.koenig@amd.com>
 <20211116092519.99206-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211116092519.99206-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: frattaroli.nicolas@gmail.com, dri-devel@lists.freedesktop.org,
 y.oudjana@protonmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 10:25:19AM +0100, Christian König wrote:
> We need to grab another ref before trying to add the fence to the sched
> job and not after.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I wondered first why this goes boom, but then I realized that in some
cases add_dependency() drops the reference of the passed-in fence.

Please also add the Fixes: line like in the previous patch.

Cheers, Daniel

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 94fe51b3caa2..400d201c3c28 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -704,12 +704,14 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>  	int ret;
>  
>  	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> -		ret = drm_sched_job_add_dependency(job, fence);
> -		if (ret)
> -			return ret;
> -
>  		/* Make sure to grab an additional ref on the added fence */
>  		dma_fence_get(fence);
> +
> +		ret = drm_sched_job_add_dependency(job, fence);
> +		if (ret) {
> +			dma_fence_put(fence);
> +			return ret;
> +		}
>  	}
>  	return 0;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
