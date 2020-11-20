Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301732BB176
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 18:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA806E8D8;
	Fri, 20 Nov 2020 17:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453516E8D8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 17:31:53 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id f11so11284616oij.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 09:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8e4wI0bZkx7vL4ZNjNtbjWVMpWuuSKoV5XC8ZjlhW7s=;
 b=HccBEp+o8ETH4Up44ZRai+3YCDp9ZccG/73PRJf6l8P+2CSniNIKgzDRc27ybuIOvR
 IIsOfywoVBFSGx1Qv7sDxfm4sSmrQlSiigm0wYSweoIK2JSHh+CJnJrDkOciZn38yhj0
 aSga/Z7C/8a9/MwtRVQ0bNGZZBwYGOLWIM6AA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8e4wI0bZkx7vL4ZNjNtbjWVMpWuuSKoV5XC8ZjlhW7s=;
 b=XToQTe7DiaqgwH2175b0hTvU9IT8MELjMOqycN24s1E/CKyY2cFdCxTQzNS8k7Fbpp
 M3ZJb1t2PD+gblsaGh40G7WYLEd2xb+Zq2zQjMWw6Lmig2sVONzk5gwFZHxijeY6axP8
 eBOjFgyTHYXU4CETfenFsFhmoNetSlCScIX614bPIPT9PHl2KSSj3IQM1DJ2WpdKRVyV
 x3mZA9bsna6otlbN2mmLA9fRFMqq3uA2mSFfirRBkGKI399Ply0AjuQ5xrOJoozzn9jP
 9aaxBh5kCFyELj9aF1UFUv0Ht1AS1ZNB3y+o/U67Ekz1tDSUgxoS2vDx1dqyeCc2PA69
 1pag==
X-Gm-Message-State: AOAM533UyueWkN6s0qEqbe4XKd/F0fcHbsyCqffJC2BEzh9X0xQNxjc3
 KHeT9cd5m5QlKCSYaBj60pQcTFdS4BC3DVLPUz6IFg==
X-Google-Smtp-Source: ABdhPJx/L8V6caZCi2etf09pugpqxuriDzOj95Aq3JU3B7KOKGDyXyFPWC3ezSK49DgmKXY+U4gQxivRIffbahFPXew=
X-Received: by 2002:aca:1713:: with SMTP id j19mr6618133oii.101.1605893512499; 
 Fri, 20 Nov 2020 09:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20201120095445.1195585-1-daniel.vetter@ffwll.ch>
 <20201120095445.1195585-3-daniel.vetter@ffwll.ch>
 <bfe3b1a4-9cc0-358f-a62e-b6d9a68e735a@infradead.org>
In-Reply-To: <bfe3b1a4-9cc0-358f-a62e-b6d9a68e735a@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 20 Nov 2020 18:31:41 +0100
Message-ID: <CAKMK7uH1NAU1KLNzeYeB=Ri9S8A9UGcHSufh5iCtwUoTChvP2A@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm: Extract might_alloc() debug check
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Chinner <david@fromorbit.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Lameter <cl@linux.com>, Michel Lespinasse <walken@google.com>,
 Ingo Molnar <mingo@kernel.org>, linux-xfs@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 David Rientjes <rientjes@google.com>, Waiman Long <longman@redhat.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Qian Cai <cai@lca.pw>, Thomas Gleixner <tglx@linutronix.de>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>,
 linux-fsdevel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 6:20 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> On 11/20/20 1:54 AM, Daniel Vetter wrote:
> > diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> > index d5ece7a9a403..f94405d43fd1 100644
> > --- a/include/linux/sched/mm.h
> > +++ b/include/linux/sched/mm.h
> > @@ -180,6 +180,22 @@ static inline void fs_reclaim_acquire(gfp_t gfp_mask) { }
> >  static inline void fs_reclaim_release(gfp_t gfp_mask) { }
> >  #endif
> >
> > +/**
> > + * might_alloc - Marks possible allocation sites
>
>                     Mark
>
> > + * @gfp_mask: gfp_t flags that would be use to allocate
>
>                                            used
>
> > + *
> > + * Similar to might_sleep() and other annotations this can be used in functions
>
>                                          annotations,
>
> > + * that might allocate, but often dont. Compiles to nothing without
>
>                                      don't.
>
> > + * CONFIG_LOCKDEP. Includes a conditional might_sleep() if @gfp allows blocking.
>
> ?                                            might_sleep_if() if

That's one if too many, I'll do the others for next round. Thanks for
taking a look.
-Daniel

>
> > + */
> > +static inline void might_alloc(gfp_t gfp_mask)
> > +{
> > +     fs_reclaim_acquire(gfp_mask);
> > +     fs_reclaim_release(gfp_mask);
> > +
> > +     might_sleep_if(gfpflags_allow_blocking(gfp_mask));
> > +}
>
>
> --
> ~Randy
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
