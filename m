Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B443360D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 14:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61196E150;
	Tue, 19 Oct 2021 12:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965606E150
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 12:35:24 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id ec8so12373221edb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=skz9RisUW4S/qiDO+uHl0XaPBD9dUYYUERXYsjD/4Jg=;
 b=EYB58TsgeqhilyH713MJ3zodt9ukU4z+13Cjbuwm4YVk7vx8NpePwcCF0EL8HztvCr
 NRjLfLaGqefHdmYjcEoZaXa2RzhEC1q/YFs1IedmvQhh/2OIRNJmoRinBsr3hfOMIpzN
 03ef/Ei/kexXwevj5VRUJ6srg+9BlUZ4y5TY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=skz9RisUW4S/qiDO+uHl0XaPBD9dUYYUERXYsjD/4Jg=;
 b=0cnrWFzQJM6hlI7VmWOUP8mBPtQMeB6w3N389FAN+rtMLlQ48lU0x6dbWxWXVHNJSe
 yex3M66EDp/RbQwlxO59kiZ6fignb5T3o1wyb6iSnkrWAfyyD2HXrQMzZOBWm5/YaWlT
 hPcVmyoKvT+BG5NDvvE80P8Q5a5s1x5gebhJvZz1G6KaQTWljvFQGHirrEa0Enb3iHxa
 9uv01KMGWxICLtrWsSAPALDEpmardbw0ZzUdGwzWSzczWCgR2NAa8QRJvt821KmpByCE
 EKA+tRs/Tm6sAHvuOaUD798YMs3wYD3QOCjNlKAl/z712Mo+BR5GcodtjBYVLAaH+cxZ
 SLQA==
X-Gm-Message-State: AOAM533h+asJ+zq+oSoTRfJYhXFskOTAaHFs9/boiwwFXrl5ZKlbsq0P
 HOonH9ETR++JIz8qmXdwpop2FtwB84LFQA==
X-Google-Smtp-Source: ABdhPJw9uladzagSnhCYHCwYj86ixtI4IJrHlJKrumdHRZ8h0QGjNQ25iICfWD9ixZHu90eaj6pzHw==
X-Received: by 2002:a17:906:6a2a:: with SMTP id
 qw42mr36630634ejc.561.1634646923011; 
 Tue, 19 Oct 2021 05:35:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z19sm10158176ejw.44.2021.10.19.05.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 05:35:22 -0700 (PDT)
Date: Tue, 19 Oct 2021 14:35:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: frattaroli.nicolas@gmail.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
Message-ID: <YW67iLFQ7ttCT54O@phenom.ffwll.local>
References: <20211019112706.27769-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211019112706.27769-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 19, 2021 at 01:27:06PM +0200, Christian König wrote:
> Trivial fix since we now need to grab a reference to the fence we have
> added. Previously the dma_resv function where doing that for us.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job_add_implicit_dependencies v2")

Uh I completely missed checking for that. Did you review all other
conversions you've pushed for this kind of bug?

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also

Reported-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com> 
References: https://lore.kernel.org/dri-devel/2023306.UmlnhvANQh@archbook/

It's important to credit bug reporters! Also upgrade to t-b if Nicolas
gets around to testing quickly.

Cheers, Daniel

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 5bc5f775abe1..94fe51b3caa2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -707,6 +707,9 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>  		ret = drm_sched_job_add_dependency(job, fence);
>  		if (ret)
>  			return ret;
> +
> +		/* Make sure to grab an additional ref on the added fence */
> +		dma_fence_get(fence);
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
