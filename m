Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6328B3F8B18
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 17:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAA96E029;
	Thu, 26 Aug 2021 15:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621436E029
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 15:34:25 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id u14so7105790ejf.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ot8y+i5PwbCb6N4bWTGhu1nwLx1HX+FelyB2FE+61x0=;
 b=c2dMPU6QAjhh7EeZMfvLHFZHpEHondC5PUC/s0GMUvgBRZJZrCPh5OQdnSX15R94ds
 6McQy3ZAuWxAfThhU9y9m1RRGPmdT5TTwbE2Bb7F9NXbDjmFVXsy/tgON8aYSIJfeI+k
 K8AbpMK+MCrgT+qKEvotEEjWH8/Gm5qDCBhN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ot8y+i5PwbCb6N4bWTGhu1nwLx1HX+FelyB2FE+61x0=;
 b=Pgwy4Kcw96jro5wipLTAsMa+r8DXUNsJdOHqoyb1dCzH3V/OyHZwc3tkjcgSEptzKZ
 Gc12MMUvWBUSREJDFmx3OnMyv7FkPCV+3nm+0fkQcNUnrLefA+meJUt1tDWUOuwElrAX
 USHufu0fN+ZxloZSZcv0HCdAb0UiEcDa83SlArPCjxwx7r028yvIeOPhqR06vfMQN2n2
 e9oWM20zfDoQaZ8ZQSanjYrphkAMKnigNnYly7sPsDt9hMoUOZVwEgSuYdABjlcxRKYp
 z2ZAzkklY2TnU6xGxMElR1vrIcr0sTxIjepUkqsEFghXVb8+dc+FeOC02+hG5sZ1nr+p
 FU5A==
X-Gm-Message-State: AOAM5329cA10PGgFsgd5e3+YrgeT1UswyHFQTr+nQUGRONObsuTktjYd
 /4Al9e74trozoE2tGPc1Ymbl7A==
X-Google-Smtp-Source: ABdhPJybFdSF24onZtpMmho5tzeAqH01cbZHcj/nAmwacbEKxurcuMR4y2HFP6JYDbsoxhfLxTYUUA==
X-Received: by 2002:a17:906:c416:: with SMTP id
 u22mr4904764ejz.543.1629992063933; 
 Thu, 26 Aug 2021 08:34:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o6sm1607251eju.91.2021.08.26.08.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 08:34:22 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:34:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] mm/vmscan: add sync_shrinkers function v2
Message-ID: <YSe0fZI86K0lbDR5@phenom.ffwll.local>
References: <20210820120528.81114-1-christian.koenig@amd.com>
 <20210820120528.81114-2-christian.koenig@amd.com>
 <YSeWwnokqMda+JJv@phenom.ffwll.local>
 <YSeXD55uhCo612LT@phenom.ffwll.local>
 <abffde95-da1b-a387-e81b-10269f2e6ede@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abffde95-da1b-a387-e81b-10269f2e6ede@gmail.com>
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

On Thu, Aug 26, 2021 at 04:58:06PM +0200, Christian König wrote:
> Am 26.08.21 um 15:28 schrieb Daniel Vetter:
> > On Thu, Aug 26, 2021 at 03:27:30PM +0200, Daniel Vetter wrote:
> > > On Fri, Aug 20, 2021 at 02:05:27PM +0200, Christian König wrote:
> > > > From: Christian König <ckoenig.leichtzumerken@gmail.com>
> > > > 
> > > > While unplugging a device the TTM shrinker implementation
> > > > needs a barrier to make sure that all concurrent shrink
> > > > operations are done and no other CPU is referring to a
> > > > device specific pool any more.
> > > > 
> > > > Taking and releasing the shrinker semaphore on the write
> > > > side after unmapping and freeing all pages from the device
> > > > pool should make sure that no shrinker is running in
> > > > paralell.
> > > > 
> > > > This allows us to avoid the contented mutex in the TTM pool
> > > > implementation for every alloc/free operation.
> > > > 
> > > > v2: rework the commit message to make clear why we need this
> > > > 
> > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > Acked-by: Huang Rui <ray.huang@amd.com>
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > ---
> > > >   include/linux/shrinker.h |  1 +
> > > >   mm/vmscan.c              | 10 ++++++++++
> > > >   2 files changed, 11 insertions(+)
> > > > 
> > > > diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> > > > index 9814fff58a69..1de17f53cdbc 100644
> > > > --- a/include/linux/shrinker.h
> > > > +++ b/include/linux/shrinker.h
> > > > @@ -93,4 +93,5 @@ extern void register_shrinker_prepared(struct shrinker *shrinker);
> > > >   extern int register_shrinker(struct shrinker *shrinker);
> > > >   extern void unregister_shrinker(struct shrinker *shrinker);
> > > >   extern void free_prealloced_shrinker(struct shrinker *shrinker);
> > > > +extern void sync_shrinkers(void);
> > > >   #endif
> > > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > > index 4620df62f0ff..fde1aabcfa7f 100644
> > > > --- a/mm/vmscan.c
> > > > +++ b/mm/vmscan.c
> > > > @@ -638,6 +638,16 @@ void unregister_shrinker(struct shrinker *shrinker)
> > > >   }
> > > >   EXPORT_SYMBOL(unregister_shrinker);
> > > > +/**
> > > > + * sync_shrinker - Wait for all running shrinkers to complete.
> > > I think it would be good to add a bit more text here maybe:
> > > 
> > > "This is equivalent to calling unregister_shrink() and
> > > register_shrinker(), but atomically and with less overhead. This is useful
> > > to guarantee that all shrinker invocations have seen an update, before
> > > freeing memory, similar to rcu."
> > > 
> > > Also a bit a bikeshed, but if we look at the equivalent in irq land it's
> > > called synchronize_irq() and synchronize_hardirq(). I think it'd be good
> > > to bikeshed that for more conceptual consistency.
> > Oh also synchronize_*rcu* also spells them all out, so even more reasons
> > to do the same.
> 
> I will just go with the explanation above.
> 
> The synchronize_rcu() explanation is so extensive that most people will
> probably stop reading after the first paragraph.

Ack, my comment was only about the function name (spelled out instead of
abbreviated), not about pulling the entire kerneldoc in from these.
-Daniel

> 
> Thanks,
> Christian.
> 
> > -Daniel
> > 
> > > > + */
> > > > +void sync_shrinkers(void)
> > > > +{
> > > > +	down_write(&shrinker_rwsem);
> > > > +	up_write(&shrinker_rwsem);
> > > > +}
> > > > +EXPORT_SYMBOL(sync_shrinkers);
> > > > +
> > > >   #define SHRINK_BATCH 128
> > > >   static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
> > > > -- 
> > > > 2.25.1
> > > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
