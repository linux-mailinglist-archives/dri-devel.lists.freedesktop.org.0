Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260FD359696
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 09:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5556EB85;
	Fri,  9 Apr 2021 07:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C24E6EB85
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 07:41:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id f12so4665654wro.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 00:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AeubinY2+5WaKpZfl4ijjCdK0lOpBbFPpjuiHAPr45E=;
 b=C5r6K9ZBAgbJ1z7ux6nokZDgzubJJOn88IX1ZzTDh5OdrWVQVGYyqxP7bn2Vwgfaj9
 xU223wSp0il7WQtHP/d8yMUhVVxzWdyxtbs15GF0foPEQ3hAoXw0w43n4cRA59Sbhf7e
 hckNVE/nvl5y+T28q3kGRb94t59h1H/L1jFtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AeubinY2+5WaKpZfl4ijjCdK0lOpBbFPpjuiHAPr45E=;
 b=NWiD0j5Ir6WAHElCpJKAp/fKeqbABSSv+l7ejWT9ovAZt99k+udK9kYEQGQwXQ565q
 rAoOytJBalEWRHg1LiES98V0FHUK5XitmJy0KfmCd86LyMAavxkyrGcQne3NgcIyLlD8
 rDWgJ+dazFMom8FR/5xdblYti5DxX1jUYtU16mqKKA26pknXCpSxR+YvJQGnySgq2v0+
 2SunW/Pw1om2qeU2bo+XYA9DBU4yUEm6Zf7ukvYHEJTnkKo/xacadklgj7mb3L7kWbyo
 TTD3FDTS1WAccf5NE5nRYlbXG9DxvfqSew10a2h1y8phF5n9KXVMrpWB/QPJWEfmIE1h
 qTkw==
X-Gm-Message-State: AOAM530dxcubp/TyyPn+/FcWGTvmo8/FbS0XoCzPa2af2T9KlyVORR1d
 nFPB8ocZPltSjpOGgrNIxvFg/Q==
X-Google-Smtp-Source: ABdhPJyu20tG0+8IcWl8IxbkMWVbpJ3h/sGHy8bLzgKnzsSyki2AHbce5OTxFjoQ2DXEzjV3hoTcqA==
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr16557227wrt.210.1617954103074; 
 Fri, 09 Apr 2021 00:41:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a65sm2672956wme.17.2021.04.09.00.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 00:41:42 -0700 (PDT)
Date: Fri, 9 Apr 2021 09:41:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: optimize the pool shrinker a bit
Message-ID: <YHAFNDp81oK8QHnP@phenom.ffwll.local>
References: <20210401135413.1416-1-christian.koenig@amd.com>
 <YG7kNLwYbDPkyGKx@phenom.ffwll.local>
 <8f38a064-8afa-492d-251f-4ff715d9f9bf@gmail.com>
 <YG7pqs50QXkLQUz3@phenom.ffwll.local>
 <ede33f9c-e86d-7859-74d6-b28067080573@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ede33f9c-e86d-7859-74d6-b28067080573@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 02:44:16PM +0200, Christian K=F6nig wrote:
> Am 08.04.21 um 13:31 schrieb Daniel Vetter:
> > On Thu, Apr 08, 2021 at 01:17:32PM +0200, Christian K=F6nig wrote:
> > > Am 08.04.21 um 13:08 schrieb Daniel Vetter:
> > > > On Thu, Apr 01, 2021 at 03:54:13PM +0200, Christian K=F6nig wrote:
> > > > > [SNIP]
> > > > >    EXPORT_SYMBOL(unregister_shrinker);
> > > > > +/**
> > > > > + * sync_shrinker - Wait for all running shrinkers to complete.
> > > > > + */
> > > > > +void sync_shrinkers(void)
> > > > This one should probably be in its own patch, with a bit more commit
> > > > message about why we need it and all that. I'd assume that just
> > > > unregistering the shrinker should sync everything we needed to sync
> > > > already, and for other sync needs we can do locking within our own
> > > > shrinker?
> > > Correct. Reason why we need the barrier is that we need to destroy the
> > > device (during hotplug) before the shrinker is unregistered (during m=
odule
> > > unload).
> > > =

> > > Going to separate that, write something up in the commit message and =
send it
> > > to the appropriate audience.
> > Hm why do we need that?
> =

> When the shrinker runs in parallel with (for example) a hotplug event and
> unmaps pages from the devices IOMMU I must make sure that you can't destr=
oy
> the device or pool structure at the same time.
> =

> Previously holding the mutex while updating the IOMMU would take care of
> that, but now we need to prevent this otherwise.
> =

> Could be that this is also handled somewhere else, but I'm better save th=
an
> sorry here and grabbing/releasing write side of the shrinker_rwsem is rat=
her
> lightweight.

I forgot that we don't have a per-pool (or at least per-device) shrinker,
but one global one for all ttm device. So yeah with that design a
sync_shrinker is needed.
-Daniel

> =

> > Either way sounds like an orthogonal series for
> > the hotunplug work, not just shrinker optimization.
> =

> It is unrelated to the hotplug work in general.
> =

> Regards,
> Christian.
> =

> > -Daniel
> > =

> > > Thanks,
> > > Christian.
> > > =

> > > > -Daniel
> > > > =

> > > > > +{
> > > > > +	down_write(&shrinker_rwsem);
> > > > > +	up_write(&shrinker_rwsem);
> > > > > +}
> > > > > +EXPORT_SYMBOL(sync_shrinkers);
> > > > > +
> > > > >    #define SHRINK_BATCH 128
> > > > >    static unsigned long do_shrink_slab(struct shrink_control *shr=
inkctl,
> > > > > -- =

> > > > > 2.25.1
> > > > > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
