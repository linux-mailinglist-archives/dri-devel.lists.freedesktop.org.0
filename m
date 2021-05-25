Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313C4390114
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 14:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DF6896DD;
	Tue, 25 May 2021 12:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E752189BF4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 12:38:31 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id a25so36007480edr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zBEiKpRcza4+UUoUkpqLLzhIDiglvAIkVdMBz/+b4n4=;
 b=LpdUhiUmdVOgZ8bKR43/dceWFPhVsIwoXSt2uboO/5bTo2s3O5tCgsSTASNpNa35wU
 CNCtWreNdhq+iyKmmJeNwNXDgpC8PH3HaOi2FG6CM5xqnP9Rum2Phm5ywz2ay6uy/jMU
 Xj9/0ruH6Gqt1e74RxhigdHCEWIMcyVPwrs+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zBEiKpRcza4+UUoUkpqLLzhIDiglvAIkVdMBz/+b4n4=;
 b=X26FVEZCe7rAYyhxon9JgXWsE2n3+KIQ0cSaQrLtW84zN1QZF3nyas6SME/747DgC1
 rW6Z6Iqr3q7Uw1LguMrioBZCHiB5CYMY+2UlL3x0/wVLhMjCzwh0eryywgYTIGMezeGf
 kORc3SdciUQZ6QvgiRT3fx7YVuGadnzwzXVRdFpa34sGHUsOsvvXPgzfy2jcFqEtB0+m
 oH8bSEaD82ngP2F2cQ1IwooeXIyRJGfRSpFa/I5H/viQzt+0/kJqIzb7B7kEH6u/FT7X
 STRaCDKZ8QeKofEyqmTB3BTgVAT6NH7EPhjH7ufvfHRSmzb2H/FwBNZ+yIsdXYQ4lHlX
 GGIg==
X-Gm-Message-State: AOAM533GVlLl4Tou7CctCLYK2I9oM3hJY68evbvbBLgEn537oa933jRp
 NprMPbv8G1ValhK6N01+MNTLntK2+whLRA==
X-Google-Smtp-Source: ABdhPJxvW7B55O7vP1IoF4biWm4ow9s2K2jbPhaSLYATVC/+jUEFCsFEE5aM06OfSTTN01zPxCu5XQ==
X-Received: by 2002:aa7:d50e:: with SMTP id y14mr31063169edq.346.1621946309896; 
 Tue, 25 May 2021 05:38:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id di7sm10737387edb.34.2021.05.25.05.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 05:38:29 -0700 (PDT)
Date: Tue, 25 May 2021 14:38:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/4] dma-buf: add dma_resv_get_singleton_rcu (v4)
Message-ID: <YKzvw3iQxiiI8964@phenom.ffwll.local>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-3-jason@jlekstrand.net>
 <YKfyestsJvKeS4k9@phenom.ffwll.local>
 <CAOFGe94YLYDUwLE4_S_vBnJqLm6RKV8eOBcPw8pz3b7EVOFFjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOFGe94YLYDUwLE4_S_vBnJqLm6RKV8eOBcPw8pz3b7EVOFFjg@mail.gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 03:04:35PM -0500, Jason Ekstrand wrote:
> On Fri, May 21, 2021 at 12:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, May 20, 2021 at 02:00:05PM -0500, Jason Ekstrand wrote:
> > > Add a helper function to get a single fence representing
> > > all fences in a dma_resv object.
> > >
> > > This fence is either the only one in the object or all not
> > > signaled fences of the object in a flatted out dma_fence_array.
> > >
> > > v2 (Jason Ekstrand):
> > >  - Take reference of fences both for creating the dma_fence_array and in
> > >    the case where we return one fence.
> > >  - Handle the case where dma_resv_get_list() returns NULL
> > >
> > > v3 (Jason Ekstrand):
> > >  - Add an _rcu suffix because it is read-only
> > >  - Rewrite to use dma_resv_get_fences_rcu so it's RCU-safe
> > >  - Add an EXPORT_SYMBOL_GPL declaration
> > >  - Re-author the patch to Jason since very little is left of Christian
> > >    König's original patch
> > >  - Remove the extra fence argument
> > >
> > > v4 (Jason Ekstrand):
> > >  - Restore the extra fence argument
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > >
> > > get_singleton
> >
> > Spurious thing here.
> 
> Fixed.
> 
> > > ---
> > >  drivers/dma-buf/dma-resv.c | 122 +++++++++++++++++++++++++++++++++++++
> > >  include/linux/dma-resv.h   |   3 +
> > >  2 files changed, 125 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > > index 6ddbeb5dfbf65..25995fc15c370 100644
> > > --- a/drivers/dma-buf/dma-resv.c
> > > +++ b/drivers/dma-buf/dma-resv.c
> > > @@ -33,6 +33,8 @@
> > >   */
> > >
> > >  #include <linux/dma-resv.h>
> > > +#include <linux/dma-fence-chain.h>
> > > +#include <linux/dma-fence-array.h>
> > >  #include <linux/export.h>
> > >  #include <linux/mm.h>
> > >  #include <linux/sched/mm.h>
> > > @@ -49,6 +51,19 @@
> > >   * write-side updates.
> > >   */
> > >
> > > +/**
> > > + * dma_fence_deep_dive_for_each - deep dive into the fence containers
> > > + * @fence: resulting fence
> > > + * @chain: variable for a dma_fence_chain
> > > + * @index: index into a dma_fence_array
> > > + * @head: starting point
> > > + *
> > > + * Helper to deep dive into the fence containers for flattening them.
> > > + */
> > > +#define dma_fence_deep_dive_for_each(fence, chain, index, head)      \
> > > +     dma_fence_chain_for_each(chain, head)                   \
> > > +             dma_fence_array_for_each(fence, index, chain)
> >
> > Since this is is just internal helper in the .c file we generally don't
> > document it. Maybe small comment if you feel it's worth it.
> 
> Sure, I can write LESS documentation. :-P
> 
> > > +
> > >  DEFINE_WD_CLASS(reservation_ww_class);
> > >  EXPORT_SYMBOL(reservation_ww_class);
> > >
> > > @@ -517,6 +532,113 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
> > >  }
> > >  EXPORT_SYMBOL_GPL(dma_resv_get_fences_rcu);
> > >
> > > +/**
> > > + * dma_resv_get_singleton - get a single fence for the dma_resv object
> >
> > Name doesn't match here.
> 
> Fixed.
> 
> > > + * @obj: the reservation object
> > > + * @extra: extra fence to add to the resulting array
> > > + * @result: resulting dma_fence
> > > + *
> > > + * Get a single fence representing all unsignaled fences in the dma_resv object
> > > + * plus the given extra fence. If we got only one fence return a new
> > > + * reference to that, otherwise return a dma_fence_array object.
> > > + *
> > > + * RETURNS
> > > + * Returns -NOMEM if allocations fail, zero otherwise.
> >
> > Kernel often encodes this in ERR_PTR so that you don't have to pass a
> > pointer to store the result. Would feel more kerenl-y I think that way. So
> > no result parameter, and on alloc failure you'd return
> 
> Done.
> 
> >         return ERR_PTR(-ENOMEM);
> >
> > > + */
> > > +int dma_resv_get_singleton_rcu(struct dma_resv *obj, struct dma_fence *extra,
> >
> > tbh the _rcu here is confusing. I think _unlocked is the better suffix,
> > maybe we should rename dma_resv_get_fences_rcu too for consistency. The
> > rcu-ness of the lookup isn't leaked to callers at all, so no point giving
> > them a panic.
> 
> I can make that change.  I'll also include a patch in the next re-send
> that renames all the _rcu helpers to _unlocked for consistency.

Maybe double-check with Christian König whether he's on board with this
bikeshed, but the current _rcu postfix we have in some dma_resv functions
really confuses me.
-Daniel

> 
> --Jason
> 
> > > +                            struct dma_fence **result)
> > > +{
> > > +     struct dma_fence **resv_fences, *fence, *chain, **fences;
> > > +     struct dma_fence_array *array;
> > > +     unsigned int num_resv_fences, num_fences;
> > > +     unsigned int ret, i, j;
> > > +
> > > +     ret = dma_resv_get_fences_rcu(obj, NULL, &num_resv_fences, &resv_fences);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     num_fences = 0;
> > > +     *result = NULL;
> > > +
> > > +     if (num_resv_fences == 0 && !extra)
> > > +             return 0;
> > > +
> > > +     for (i = 0; i < num_resv_fences; ++i) {
> > > +             dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
> > > +                     if (dma_fence_is_signaled(fence))
> > > +                             continue;
> > > +
> > > +                     *result = fence;
> > > +                     ++num_fences;
> > > +             }
> > > +     }
> > > +
> > > +     if (extra) {
> > > +             dma_fence_deep_dive_for_each(fence, chain, j, extra) {
> > > +                     if (dma_fence_is_signaled(fence))
> > > +                             continue;
> > > +
> > > +                     *result = fence;
> > > +                     ++num_fences;
> > > +             }
> > > +     }
> > > +
> > > +     if (num_fences <= 1) {
> > > +             *result = dma_fence_get(*result);
> > > +             goto put_resv_fences;
> > > +     }
> > > +
> > > +     fences = kmalloc_array(num_fences, sizeof(struct dma_fence*),
> > > +                            GFP_KERNEL);
> > > +     if (!fences) {
> > > +             *result = NULL;
> > > +             ret = -ENOMEM;
> > > +             goto put_resv_fences;
> > > +     }
> > > +
> > > +     num_fences = 0;
> > > +     for (i = 0; i < num_resv_fences; ++i) {
> > > +             dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
> > > +                     if (!dma_fence_is_signaled(fence))
> > > +                             fences[num_fences++] = dma_fence_get(fence);
> > > +             }
> > > +     }
> > > +
> > > +     if (extra) {
> > > +             dma_fence_deep_dive_for_each(fence, chain, j, extra) {
> > > +                     if (dma_fence_is_signaled(fence))
> > > +                             fences[num_fences++] = dma_fence_get(fence);
> > > +             }
> > > +     }
> > > +
> > > +     if (num_fences <= 1) {
> > > +             *result = num_fences ? fences[0] : NULL;
> > > +             kfree(fences);
> > > +             goto put_resv_fences;
> > > +     }
> > > +
> > > +     array = dma_fence_array_create(num_fences, fences,
> > > +                                    dma_fence_context_alloc(1),
> > > +                                    1, false);
> > > +     if (array) {
> > > +             *result = &array->base;
> > > +     } else {
> > > +             *result = NULL;
> > > +             while (num_fences--)
> > > +                     dma_fence_put(fences[num_fences]);
> > > +             kfree(fences);
> > > +             ret = -ENOMEM;
> > > +     }
> > > +
> > > +put_resv_fences:
> > > +     while (num_resv_fences--)
> > > +             dma_fence_put(resv_fences[num_resv_fences]);
> > > +     kfree(resv_fences);
> > > +
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(dma_resv_get_singleton_rcu);
> >
> > With the nits addressed:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > > +
> > >  /**
> > >   * dma_resv_wait_timeout_rcu - Wait on reservation's objects
> > >   * shared and/or exclusive fences.
> > > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > > index d44a77e8a7e34..d49ca263e78b4 100644
> > > --- a/include/linux/dma-resv.h
> > > +++ b/include/linux/dma-resv.h
> > > @@ -285,6 +285,9 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
> > >
> > >  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> > >
> > > +int dma_resv_get_singleton_rcu(struct dma_resv *obj, struct dma_fence *extra,
> > > +                            struct dma_fence **result);
> > > +
> > >  long dma_resv_wait_timeout_rcu(struct dma_resv *obj, bool wait_all, bool intr,
> > >                              unsigned long timeout);
> > >
> > > --
> > > 2.31.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
