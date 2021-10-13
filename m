Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826442C2C5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9476E85C;
	Wed, 13 Oct 2021 14:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7098F6E85C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:19:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r18so8981388wrg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rqU/dmK8rMWcEtsgaBLNzDP806G75d0eV2L5USY78fM=;
 b=CIYkYXAy4JpmzOW6g9gA0zNKwRGBbSvFuljk1DL1L2ywvH1FCvtnW2S65eaX6DNgyJ
 HWqxlyvCYyze/QHURQcl3FSsBpdQjI7kXVcFkl6gPZ/TgUlF/Hy+yrL4UecoYx0qgCHJ
 UR7iyCL6EhiOQl1BjS0N/r3zORjxFyJjw8lyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rqU/dmK8rMWcEtsgaBLNzDP806G75d0eV2L5USY78fM=;
 b=P0Ob4Zod1nNKoDoWJJpkqKgB0oeyqQKpJQ+aeNupMxyv1akPRsBJ5VZz00nT3f+VvU
 Ou+Zf+LzDguqFYhz9HD60vEC0/5DJY61LXrH8yg7+g1xHiB5DsdFWWTc1TtXWu0KqA95
 ZPjrzZmXOE0HsJOLzrFO8Uu8bD0kpEGea7Fvhpuno9bX6qosLyCjNdUQlkcZYPzKtHoV
 jJMTVWuK2YcLKnZZI5xb1VM1Fm/8ftIjdqZ88U/Kdgo9iKTQhDoGW3envMc3eBd3GXr6
 0xZ39EfMEl65DZkgJiwYVTQ06wcz8kzFmrYWe7GyfUpcgZfxI0I9tEqjn3M+nScR3UPC
 oxtg==
X-Gm-Message-State: AOAM5326lmTVQt1VPu6SnJj69uuN63xNAU5oAJWX6cM/ahy0ip2FLx0X
 lvVvSSA7wXffwS+BRbzmomuX8g==
X-Google-Smtp-Source: ABdhPJzsIIepLiJRjWr2jRRia7cpMVxh1CP0AxQBHtVpdv22ieiys1yU6Zib4paL8MeS0L0xXtDVsw==
X-Received: by 2002:adf:f481:: with SMTP id l1mr39278119wro.411.1634134765952; 
 Wed, 13 Oct 2021 07:19:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r8sm13456121wrv.61.2021.10.13.07.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 07:19:25 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:19:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: Re: [PATCH 17/28] drm/i915: use the new iterator in
 i915_gem_busy_ioctl v2
Message-ID: <YWbq6yXUVayXTntI@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-18-christian.koenig@amd.com>
 <50b8ffb7-2720-619d-3140-af2f90450a21@linux.intel.com>
 <65e28697-6f0a-7f97-d49b-ebf8d0b8d23f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65e28697-6f0a-7f97-d49b-ebf8d0b8d23f@gmail.com>
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

On Tue, Oct 05, 2021 at 02:44:50PM +0200, Christian König wrote:
> Am 05.10.21 um 14:40 schrieb Tvrtko Ursulin:
> > 
> > On 05/10/2021 12:37, Christian König wrote:
> > > This makes the function much simpler since the complex
> > > retry logic is now handled else where.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Reminder - r-b was retracted until at least more text is added to commit
> > message about pros and cons. But really some discussion had inside the
> > i915 team on the topic.
> 
> Sure, going to move those to a different branch.
> 
> But I really only see the following options:
> 1. Grab the lock.
> 2. Use the _unlocked variant with get/put.
> 3. Add another _rcu iterator just for this case.
> 
> I'm fine with either, but Daniel pretty much already rejected #3 and #2/#1
> has more overhead then the original one.

Anything that removes open-code rcu/lockless magic from i915 gets my ack,
there's way too much of this everywhere. So on this:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I've asked Maarten to review the i915 ones for you, please pester him if
it's not happening :-)
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
> > >   1 file changed, 14 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> > > index 6234e17259c1..dc72b36dae54 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> > > @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void
> > > *data,
> > >   {
> > >       struct drm_i915_gem_busy *args = data;
> > >       struct drm_i915_gem_object *obj;
> > > -    struct dma_resv_list *list;
> > > -    unsigned int seq;
> > > +    struct dma_resv_iter cursor;
> > > +    struct dma_fence *fence;
> > >       int err;
> > >         err = -ENOENT;
> > > @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev,
> > > void *data,
> > >        * to report the overall busyness. This is what the wait-ioctl
> > > does.
> > >        *
> > >        */
> > > -retry:
> > > -    seq = raw_read_seqcount(&obj->base.resv->seq);
> > > -
> > > -    /* Translate the exclusive fence to the READ *and* WRITE engine */
> > > -    args->busy =
> > > busy_check_writer(dma_resv_excl_fence(obj->base.resv));
> > > -
> > > -    /* Translate shared fences to READ set of engines */
> > > -    list = dma_resv_shared_list(obj->base.resv);
> > > -    if (list) {
> > > -        unsigned int shared_count = list->shared_count, i;
> > > -
> > > -        for (i = 0; i < shared_count; ++i) {
> > > -            struct dma_fence *fence =
> > > -                rcu_dereference(list->shared[i]);
> > > -
> > > +    args->busy = 0;
> > > +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
> > > +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
> > > +        if (dma_resv_iter_is_restarted(&cursor))
> > > +            args->busy = 0;
> > > +
> > > +        if (dma_resv_iter_is_exclusive(&cursor))
> > > +            /* Translate the exclusive fence to the READ *and*
> > > WRITE engine */
> > > +            args->busy |= busy_check_writer(fence);
> > > +        else
> > > +            /* Translate shared fences to READ set of engines */
> > >               args->busy |= busy_check_reader(fence);
> > > -        }
> > >       }
> > > -
> > > -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
> > > -        goto retry;
> > > +    dma_resv_iter_end(&cursor);
> > >         err = 0;
> > >   out:
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
