Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963DF3F88F2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 15:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AF56E850;
	Thu, 26 Aug 2021 13:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EF76E850
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 13:28:51 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g21so4685455edw.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FYT75zVitZzbcnj2mAQhOcK5KWjHY0hyESkjVzUOkQA=;
 b=PLcsUhwJT68haranzQDR66Uw1a3Zqv2Kbmad9y7M7RXUVFILwRViC6BoKJVQYjghb+
 Km9cFFfZeq3cb6lLbZpIwrBxeeJMkMNZVkEJHYwh2mYKlWEz9wsbQuAfKQBed/oq5SnW
 JJ965K18OmvygVy9bGD+EpRuAbdCms9bx4BJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FYT75zVitZzbcnj2mAQhOcK5KWjHY0hyESkjVzUOkQA=;
 b=W75I9klZiY6+7hrKJE7Ru13JzEbCjDo3ygSWcAZc+iwsXzibwKl2ZYDXvhZjvFbFsK
 +HrScckUaH0IrJYVgvRSBwd4t1Me1cJNw+u5cIvruYefpS3y9EtY3i7vqeyI6tGyZwXv
 ZiNcNXEPZmFI0h0ajxWrcnla5q2pjE0TNvjwR3RxeEQfdOC+PTqTuZ93Isn/bcBuDLk3
 JPGX5Ohmccf6KzhcT4ox0Yp3I2B2OfWhz4CcBzyWFapU7/YTBzZlMtiBYLGUg+aGlkFH
 JeFkvEGHVZfCd3Zuojhy4MBvKB6AtnWx+l9RGovuRfjaRmEkNhlPJGBLo02/VZ1yObEk
 JQ1w==
X-Gm-Message-State: AOAM530h3o3zNfReOoWu/DMuuviv3MEXyWX9vZODL7C2FcwcfcbLnHk/
 eZzK94VOqI6uNlF7tSBc4hv/8g==
X-Google-Smtp-Source: ABdhPJyebaPnX28lc7q3BywNXjj3rvuiZJ1F6GkmSNSkR2O1IN5BvpQY/vXxHlwFRBvaW2aHhApXgw==
X-Received: by 2002:a50:cb83:: with SMTP id k3mr4462097edi.102.1629984530133; 
 Thu, 26 Aug 2021 06:28:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n2sm1896792edi.32.2021.08.26.06.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:28:49 -0700 (PDT)
Date: Thu, 26 Aug 2021 15:28:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: akpm@linux-foundation.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: Re: [PATCH 1/2] mm/vmscan: add sync_shrinkers function v2
Message-ID: <YSeXD55uhCo612LT@phenom.ffwll.local>
References: <20210820120528.81114-1-christian.koenig@amd.com>
 <20210820120528.81114-2-christian.koenig@amd.com>
 <YSeWwnokqMda+JJv@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YSeWwnokqMda+JJv@phenom.ffwll.local>
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

On Thu, Aug 26, 2021 at 03:27:30PM +0200, Daniel Vetter wrote:
> On Fri, Aug 20, 2021 at 02:05:27PM +0200, Christian König wrote:
> > From: Christian König <ckoenig.leichtzumerken@gmail.com>
> > 
> > While unplugging a device the TTM shrinker implementation
> > needs a barrier to make sure that all concurrent shrink
> > operations are done and no other CPU is referring to a
> > device specific pool any more.
> > 
> > Taking and releasing the shrinker semaphore on the write
> > side after unmapping and freeing all pages from the device
> > pool should make sure that no shrinker is running in
> > paralell.
> > 
> > This allows us to avoid the contented mutex in the TTM pool
> > implementation for every alloc/free operation.
> > 
> > v2: rework the commit message to make clear why we need this
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Acked-by: Huang Rui <ray.huang@amd.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  include/linux/shrinker.h |  1 +
> >  mm/vmscan.c              | 10 ++++++++++
> >  2 files changed, 11 insertions(+)
> > 
> > diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> > index 9814fff58a69..1de17f53cdbc 100644
> > --- a/include/linux/shrinker.h
> > +++ b/include/linux/shrinker.h
> > @@ -93,4 +93,5 @@ extern void register_shrinker_prepared(struct shrinker *shrinker);
> >  extern int register_shrinker(struct shrinker *shrinker);
> >  extern void unregister_shrinker(struct shrinker *shrinker);
> >  extern void free_prealloced_shrinker(struct shrinker *shrinker);
> > +extern void sync_shrinkers(void);
> >  #endif
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 4620df62f0ff..fde1aabcfa7f 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -638,6 +638,16 @@ void unregister_shrinker(struct shrinker *shrinker)
> >  }
> >  EXPORT_SYMBOL(unregister_shrinker);
> >  
> > +/**
> > + * sync_shrinker - Wait for all running shrinkers to complete.
> 
> I think it would be good to add a bit more text here maybe:
> 
> "This is equivalent to calling unregister_shrink() and
> register_shrinker(), but atomically and with less overhead. This is useful
> to guarantee that all shrinker invocations have seen an update, before
> freeing memory, similar to rcu."
> 
> Also a bit a bikeshed, but if we look at the equivalent in irq land it's
> called synchronize_irq() and synchronize_hardirq(). I think it'd be good
> to bikeshed that for more conceptual consistency.

Oh also synchronize_*rcu* also spells them all out, so even more reasons
to do the same.
-Daniel

> > + */
> > +void sync_shrinkers(void)
> > +{
> > +	down_write(&shrinker_rwsem);
> > +	up_write(&shrinker_rwsem);
> > +}
> > +EXPORT_SYMBOL(sync_shrinkers);
> > +
> >  #define SHRINK_BATCH 128
> >  
> >  static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
