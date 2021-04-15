Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2B4360A71
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 15:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E42189319;
	Thu, 15 Apr 2021 13:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9292989319
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 13:23:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j5so22334987wrn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=2byzceuK3pVnwSQR1hAUK7MTfgfE49ObHg97SKhpp+I=;
 b=gHz5ulHPjyGzx58KOs2I/mZratDDUnZQOXLx9H13nEFfFB0VM2EOH/+jYdoTdG2PIG
 pffpmQSF4ayc1tfeq4wD4h4xXvNv2TUObtoDg15v74rarty49XSTnlKwrG1dG2ZTzAgD
 YHWbQC6nuAhLI2DHeIww6BVzA82BI5DiI8m3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=2byzceuK3pVnwSQR1hAUK7MTfgfE49ObHg97SKhpp+I=;
 b=AQyrqhG/47MkVp7Gpaw+Q0U8EqhmKSFoHEGwOIm20IKX48KZRVPhUoEUCgU8PWZ1ST
 LtZxOuhwb2jGBzEEzsFaqCrZi3svZPmBZ8QShdwD6iX5wkELOkytaC4Ezh73wF9uK8fi
 bAKVofe2dv36x4KWDYsfsFzPQGBHEOBFQiMCFrkfHzUxZxPKjvWydlWokHg5nIGLQPBq
 wjeNcP6U/YEAGw0R1PaueZGJR9AJ0FTkXNqPIop732mqu7ryTt/8DH8CWiV1P3l++Cp1
 49D8FtligiLmMLuVXACo4+hekR5aPcRCjmpB1pHpLJVcwO/9wdUV3A1HUh0t+XE3NU7c
 KWfg==
X-Gm-Message-State: AOAM532OTKeshohig2q9pnM95Jv8xPw6k5fuWVlR5E9Sdhh/gKrSJT/U
 rj1PX/9i1OFTEOuaShE73BdlWw==
X-Google-Smtp-Source: ABdhPJxk1bRa6Yg4LDCIMkLe5Y4AfcZMposl53lwQa5X8eeL0yZm+SFvcApMmBpSk+Vtic4l7YLXIA==
X-Received: by 2002:adf:fdc3:: with SMTP id i3mr3457489wrs.385.1618493026340; 
 Thu, 15 Apr 2021 06:23:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u14sm3290214wrq.65.2021.04.15.06.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 06:23:45 -0700 (PDT)
Date: Thu, 15 Apr 2021 15:23:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] mm/vmscan: add sync_shrinkers function
Message-ID: <YHg+X7KLCmn2+yqw@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, vbabka@suse.cz, ray.huang@amd.com,
 akpm@linux-foundation.org
References: <20210415115624.2904-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415115624.2904-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, ray.huang@amd.com, akpm@linux-foundation.org,
 vbabka@suse.cz
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 01:56:23PM +0200, Christian K=F6nig wrote:
> To be able to switch to a spinlock and reduce lock contention in the TTM
> shrinker we don't want to hold a mutex while unmapping and freeing pages
> from the pool.
> =

> But then we somehow need to prevent a race between (for example) the shri=
nker
> trying to free pages and hotplug trying to remove the device which those =
pages
> belong to.
> =

> Taking and releasing the shrinker semaphore on the write side after
> unmapping and freeing all pages should make sure that no shrinker is runn=
ing in
> paralell any more.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  include/linux/shrinker.h |  1 +
>  mm/vmscan.c              | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> =

> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index 0f80123650e2..6b75dc372fce 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -92,4 +92,5 @@ extern void register_shrinker_prepared(struct shrinker =
*shrinker);
>  extern int register_shrinker(struct shrinker *shrinker);
>  extern void unregister_shrinker(struct shrinker *shrinker);
>  extern void free_prealloced_shrinker(struct shrinker *shrinker);
> +extern void sync_shrinkers(void);
>  #endif
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 562e87cbd7a1..46cd9c215d73 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -408,6 +408,16 @@ void unregister_shrinker(struct shrinker *shrinker)
>  }
>  EXPORT_SYMBOL(unregister_shrinker);
>  =

> +/**
> + * sync_shrinker - Wait for all running shrinkers to complete.

Maybe make it clear this is a barrier type thing, it wont stop shrinkers
at all, just synchronize with them.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But needs an ack from Andrew for merging through drm-misc-next before we
push it there.
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
>  =

>  static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
