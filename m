Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399EAF0D51
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0C610E317;
	Wed,  2 Jul 2025 07:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XWCBd5Zi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE46510E317
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 07:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751443070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OfPLBKDe8EU3XxeW8mh2NCDA+Lizl7DxzxAYDXs1JWY=;
 b=XWCBd5Zi4dgvv2aSKhKR775Pntv7ncp45JDtIztaSgX49NyBeR3tf3WxhcWUBqtVqOFE9Z
 2+KADep3z4InmoT6ILQl9LtmEiZbUULai1mUZ0d/qyXhCt2txI4d51kzy0u0khffKMPPwu
 k07tJpb6PwxqqaBKe9AY52MD6r1S8S8=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-TIEANpobPD6N_mwn4pe7Rg-1; Wed, 02 Jul 2025 03:57:48 -0400
X-MC-Unique: TIEANpobPD6N_mwn4pe7Rg-1
X-Mimecast-MFC-AGG-ID: TIEANpobPD6N_mwn4pe7Rg_1751443068
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3141a9a6888so6262962a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 00:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751443068; x=1752047868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OfPLBKDe8EU3XxeW8mh2NCDA+Lizl7DxzxAYDXs1JWY=;
 b=S0vKGkf9wwZljCNNOGwEQzphHf8+L5hPw/nKQQwDqevf1MRG+N1/UQ6h/ldXtm9AK8
 7fyjyzLwAUC+q7d7j98SEcyLJp4NSVYdifYwEyZ3g2C8AUHgiyU7a/1tO1rp96rCk4YB
 O6qZJyzXH+VkWv1gTF5jnHBDFIk81KwiD+hLRVMn4aGkW5sKKqQXzZZkc9ZsN6+A+YCb
 7MGUBL683Lb7HWMhAe8vZrGPjVR7+iJj2LYEIEFpdl2Jin4UX37vFWZP84vbxv7uxG2Z
 jyX9ZNJX2IT7kHPiNVvDXY/ScnQBFzkSYyLvwP7CJLS7aL6cJDGmsBoKyg9ItxLyQE8v
 zF4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjC9OKfHieL52whBS0hxZPOQ32JtXszlCQnhIxx4nVlnYwLt+16gEuHh5wcejF1ftbd8a+LrDtpag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9JlT6ILyzjYZAbfDFICKl4yhuD/jlDoXi+9YV4vMiqR5bov4k
 619PmOG3d0DMlbwAMo6ACHSBDgxxT5hH3pUcgMH15mR1/Cq9cSS8DeSSu6U9YyaF3WCf57l5nje
 HhgqX029mWpL+lzCqWm21clQkaTqmj64yz1S9nrSZLBOyiEIA7X4PSVgbBuu698FMlnacgYz/16
 kqxwovgo6OKuNp4bSUK9MpaW//gJV4xfisBukD8IzqwHOm
X-Gm-Gg: ASbGnculrRucgkJf9eU5ZFjL5Y+wp8LllkplBpR2pk7d9s+HlGrftB5GgFeuYn5Iuoc
 4oxO/gElzknp2+yWn7peda+VjizpJ35Q66SlnYJosdEDPTphwev6QwRSVXu3mBfxPaRVeYAttPZ
 0FpQ==
X-Received: by 2002:a17:90b:5844:b0:313:2768:3f6b with SMTP id
 98e67ed59e1d1-31a90befadamr3106737a91.27.1751443067645; 
 Wed, 02 Jul 2025 00:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+tmvi2ZG1IKLySgeOPzNugQgi+u+maGqZVxXa0m5YrXq0nlRoXUsw7waqcb525dM1Qlica7yPCS3/i+DDcnQ=
X-Received: by 2002:a17:90b:5844:b0:313:2768:3f6b with SMTP id
 98e67ed59e1d1-31a90befadamr3106697a91.27.1751443067214; Wed, 02 Jul 2025
 00:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-13-airlied@gmail.com>
 <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
 <CAMwc25ok0Q93+EeyyoR-S0Ffvi-GswDiUGA8rPBwZ+C+5Y8HVA@mail.gmail.com>
 <cf6cb95f-df79-40ae-95d5-dc5a7620a136@amd.com>
 <CAMwc25q-kBRGDrphU+iAyqENZhgdRtEnSrR9z6b5bQ_JFzzK2g@mail.gmail.com>
 <26c79b1e-0f7f-4efa-9040-92df8c5bdf1f@amd.com>
 <CAMwc25oMQ_=Hagb9N6SN3pFFPwZ8+8ZBOGvziCPhUypMpPeKUQ@mail.gmail.com>
 <54b2ee4a-0f2f-49a1-a680-8dc1193e2d30@amd.com>
In-Reply-To: <54b2ee4a-0f2f-49a1-a680-8dc1193e2d30@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Wed, 2 Jul 2025 17:57:35 +1000
X-Gm-Features: Ac12FXwEKrnZKFtu_lF4lWMgEowFRDunTAfIDi8ktHDO7KX9M8OY2S7SJQe78SQ
Message-ID: <CAMwc25oYx1L9H+GCE95ZAxXAwqCDQVjpJfre_Ndv=Z8j8KOyYw@mail.gmail.com>
Subject: Re: [PATCH 12/17] ttm: add objcg pointer to bo and tt
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N2JjmXpIWElWm-yMAYaTzy22ICfLgwkikNEqyBp654c_1751443068
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

> >
> > It makes it easier now, but when we have to solve swapping, step one
> > will be moving all this code around to what I have now, and starting
> > from there.
> >
> > This just raises the bar to solving the next problem.
> >
> > We need to find incremental approaches to getting all the pieces of
> > the puzzle solved, or else we will still be here in 10 years.
> >
> > The steps I've formulated (none of them are perfect, but they all seem
> > better than status quo)
> >
> > 1. add global counters for pages - now we can at least see things in
> > vmstat and per-node
> > 2. add numa to the pool lru - we can remove our own numa code and
> > align with core kernel - probably doesn't help anything
>
> So far no objections from my side to that.
>
> > 3. add memcg awareness to the pool and pool shrinker.
> >     if you are on a APU with no swap configured - you have a lot better time.
> >     if you are on a dGPU or APU with swap - you have a moderately
> > better time, but I can't see you having a worse time.
>
> Well that's what I'm strongly disagreeing on.
>
> Adding memcg to the pool has no value at all and complicates things massively when moving forward.
>
> What exactly should be the benefit of that?

I'm already showing the benefit of the pool moving to memcg, we've
even talked about it multiple times on the list, it's not a OMG change
the world benefit, but it definitely provides better alignment between
the pool and memcg allocations.

We expose userspace API to allocate write combined memory, we do this
for all currently supported CPU/GPUs. We might think in the future we
don't want to continue to do this, but we do it now. My Fedora 42
desktop uses it, even if you say there is no need.

If I allocate 100% of my memcg budget to WC memory, free it, then
allocate 100% of my budget to non-WC memory, we break container
containment as we can force other cgroups to run out of memory budget
and have to call the global shrinker. With this in place, the
container that allocates the WC memory also pays the price to switch
it back. Again this is just correctness, it's not going to fix any
major workloads, but I also don't think it should cause any
regressions, since it won't be worse than current worst case
expectation for most workloads.

I'm not just adding memcg awareness to the pool though, that is just
completeness, I'm adding memcg awareness to all GPU system memory
allocations, and making sure swapout works (which it does), swapin
probably needs more work.

The future work is integerating ttm swap mechanisms with memcg to get it right.
> >
> > Accounting at the resource level makes stuff better, but I don't
> > believe after implementing it that it is consistent with solving the
> > overall problem.
>
> Exactly that's my point. See accounting is no problem at all, that can be done on any possible level.
>
> What is tricky is shrinking, e.g. either core MM or memcg asking to reduce the usage of memory and moving things into swap.
>
> And that can only be done either on the resource level or the tt object, but not the pool level.

I understand we have to add more code to the tt level and that's fine,
I just don't see why you think starting at the bottom level is wrong?
it clearly has a use, and it's just cleaning up and preparing the
levels, so we can move up and solve the next problem.

> The whole TTM pool is to aid a 28 year old HW design which has no practical relevance on modern systems and we should really not touch that in any way possible.

Modern systems are still using it, I'm still seeing WC allocations,
they still seem to have some cost associated with them on x86-64, they
certainly aren't free. I don't care if they aren't practical, but if
they are a way to route around container containment, they need to be
fixed.

Dave.

