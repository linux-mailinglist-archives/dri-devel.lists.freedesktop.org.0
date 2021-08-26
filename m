Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BC43F88EE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 15:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAB56E84F;
	Thu, 26 Aug 2021 13:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9516E84F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 13:27:34 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ia27so6255884ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vfDynG90aCVxgUZhTw4wYAntyD8hbntFe0CVuQqSKCo=;
 b=JkU0biJUnCenq9xhtDRBxqSKynYW8xwRPY0nvZWc3ZfPvS+BZHgj2BUvDeapHIuUow
 LiKf0v+xPLrQXG4oK1Nf4sSYbOi8imK3fxwmj4NgaO5giAP9P+TLmhbn0Cxb5LeMMi99
 K4G+3xUemPdxNKzmkwjW0BhVh2tIF+PJSzYxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vfDynG90aCVxgUZhTw4wYAntyD8hbntFe0CVuQqSKCo=;
 b=eMdPvqXrxky6/BI5AcbfgnEmfic0KU4vPNcC2MoqKVd/jwkF4rhYbeKZ1WFG/PXbXK
 0viNObAwFRqtoiY81c+QXxXCThh+hDdoeFc6GBOwn73yht585SVPTc7NKMhzKUN33r6R
 TJVf2ChHfqBQjgl4gVyNdWvjZuzxFX9He6gBwvzdi42FwY0JKBwhKhMm+6aA61iwsB20
 GI5XW36TIAZFTx+WEkO8OBsRjr1vRrCiEIFnplFsowQyh8fqQcSKiLmvh/xFvzjFF67I
 jLMQN1zZQbRnk4ThzByATGU849OiI2u25xNn7iuUgk/JKWtTIUMvRVkRboTXpS7/SAX8
 fqTw==
X-Gm-Message-State: AOAM532uqCS1IcpNipNMq3DEofIIy62K4di60x5gge4QrPHpbsqvDyb6
 X1p0SjMPneIuUm0Q0/EmZ0pmqcoV8VYvDQ==
X-Google-Smtp-Source: ABdhPJzMy/By1rzMK7bGIpuT/G3zH4mzuhIlpWUOVcQqn/UFXSzaHZCbeFkKOzgA7DOEK8CvQxDt1w==
X-Received: by 2002:a17:906:6b0c:: with SMTP id
 q12mr4421689ejr.0.1629984453158; 
 Thu, 26 Aug 2021 06:27:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id bm1sm1433713ejb.38.2021.08.26.06.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:27:32 -0700 (PDT)
Date: Thu, 26 Aug 2021 15:27:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: akpm@linux-foundation.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: Re: [PATCH 1/2] mm/vmscan: add sync_shrinkers function v2
Message-ID: <YSeWwnokqMda+JJv@phenom.ffwll.local>
References: <20210820120528.81114-1-christian.koenig@amd.com>
 <20210820120528.81114-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210820120528.81114-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Fri, Aug 20, 2021 at 02:05:27PM +0200, Christian König wrote:
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
> 
> While unplugging a device the TTM shrinker implementation
> needs a barrier to make sure that all concurrent shrink
> operations are done and no other CPU is referring to a
> device specific pool any more.
> 
> Taking and releasing the shrinker semaphore on the write
> side after unmapping and freeing all pages from the device
> pool should make sure that no shrinker is running in
> paralell.
> 
> This allows us to avoid the contented mutex in the TTM pool
> implementation for every alloc/free operation.
> 
> v2: rework the commit message to make clear why we need this
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Acked-by: Huang Rui <ray.huang@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  include/linux/shrinker.h |  1 +
>  mm/vmscan.c              | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index 9814fff58a69..1de17f53cdbc 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -93,4 +93,5 @@ extern void register_shrinker_prepared(struct shrinker *shrinker);
>  extern int register_shrinker(struct shrinker *shrinker);
>  extern void unregister_shrinker(struct shrinker *shrinker);
>  extern void free_prealloced_shrinker(struct shrinker *shrinker);
> +extern void sync_shrinkers(void);
>  #endif
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 4620df62f0ff..fde1aabcfa7f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -638,6 +638,16 @@ void unregister_shrinker(struct shrinker *shrinker)
>  }
>  EXPORT_SYMBOL(unregister_shrinker);
>  
> +/**
> + * sync_shrinker - Wait for all running shrinkers to complete.

I think it would be good to add a bit more text here maybe:

"This is equivalent to calling unregister_shrink() and
register_shrinker(), but atomically and with less overhead. This is useful
to guarantee that all shrinker invocations have seen an update, before
freeing memory, similar to rcu."

Also a bit a bikeshed, but if we look at the equivalent in irq land it's
called synchronize_irq() and synchronize_hardirq(). I think it'd be good
to bikeshed that for more conceptual consistency.
-Daniel

> + */
> +void sync_shrinkers(void)
> +{
> +	down_write(&shrinker_rwsem);
> +	up_write(&shrinker_rwsem);
> +}
> +EXPORT_SYMBOL(sync_shrinkers);
> +
>  #define SHRINK_BATCH 128
>  
>  static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
