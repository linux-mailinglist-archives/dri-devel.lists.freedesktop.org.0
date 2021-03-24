Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653283477C3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 12:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DD36E9D5;
	Wed, 24 Mar 2021 11:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD266E9DA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 11:55:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so1024843wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=gO58uuS+0G4MQjeMAkSvwrYzYSPAbUNJctRACLjk0bg=;
 b=OUEbMbeV2XMtinhZQiQFhGWWPrSed8DGkee/j1abaY7+gjIBFDFq7gm3fIROxw/tv7
 Dl58YUKUlMglRAjIt3sVLQgrLCQcs/hHJrmpFuJ7HEnVuIQPDA+NJf1RmX88aFAJKAcK
 99SwnPEbjAWAiGXs+X73ja2KaaeiSNX+XXnag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=gO58uuS+0G4MQjeMAkSvwrYzYSPAbUNJctRACLjk0bg=;
 b=dBlnwrpQ/C7CYydY4DfVFP8GXI+IM/ssDk/tUDPVSZc+VPGVRxARDWIZHZLHe/3tSO
 CuESePHgDkAZ2bUUcx8l1V6ThwS6KPk/DscqYUw6SlvYyZWOYiG04YXi113EEt4b77hv
 A0LlpW2nE/LuXMBToMsibF6RU9T0Mz6Otcn+Crn4T2HhhiuESkGM91MfK2xDBlu15/Ky
 Sp8jwu9TDTC4PAQk7l/sDNHJerBLvSHF8t5HPofdcc+LKuZs1KUhg2oVEW6l9FmVuqOk
 VS/rBrqBboUZ7La19t+gyQ5E5yiX/FWRESWL4mNryCcHRLraN0e37VQqXdfxbZ6/A0DI
 lxFg==
X-Gm-Message-State: AOAM530FcN+wlwDFyIQJVsdSkesVtUmL2ff++eso9IZPt+qa7xh5V0Tw
 vYNp6SWtGh0b3qUhwuwz0omytw==
X-Google-Smtp-Source: ABdhPJwhiD7SOUBfRgkNdfO4JdgqIMVd2CqvBvssLjFmgEs3XWs421vPNE2H+yLnhmkR35AAzLxCiw==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr2527627wmq.141.1616586936320; 
 Wed, 24 Mar 2021 04:55:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q207sm2106956wme.36.2021.03.24.04.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 04:55:35 -0700 (PDT)
Date: Wed, 24 Mar 2021 12:55:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFsotY3HXmLNGF7p@phenom.ffwll.local>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?=
 <thomas_os@shipmail.org>, 
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Michal Hocko <mhocko@suse.com>,
 Matthew Wilcox <willy@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
References: <cd17d2ca-140e-1e69-37ac-c2726cc1ef9f@gmail.com>
 <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
 <75ff80c5-a054-d13d-85c1-0040addb45d2@gmail.com>
 <YFng9qXM3NdrGHTx@dhcp22.suse.cz>
 <20808d08-b66c-13c3-f672-ebce216b2fa2@gmail.com>
 <YFnwBTF0YntCXFeG@dhcp22.suse.cz>
 <e5659cd0-61b2-82bd-64c3-76bd631b4522@amd.com>
 <YFoFdOtYDAezpSLv@dhcp22.suse.cz>
 <03889c00-bb5d-ef20-12c6-7e77df073dd9@amd.com>
 <762c4597-e9bd-6d8d-51b5-16b04f913eb8@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <762c4597-e9bd-6d8d-51b5-16b04f913eb8@shipmail.org>
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
Cc: Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 11:19:13AM +0100, Thomas Hellstr=F6m (Intel) wrote:
> =

> On 3/23/21 4:45 PM, Christian K=F6nig wrote:
> > Am 23.03.21 um 16:13 schrieb Michal Hocko:
> > > On Tue 23-03-21 14:56:54, Christian K=F6nig wrote:
> > > > Am 23.03.21 um 14:41 schrieb Michal Hocko:
> > > [...]
> > > > > Anyway, I am wondering whether the overall approach is
> > > > > sound. Why don't
> > > > > you simply use shmem as your backing storage from the
> > > > > beginning and pin
> > > > > those pages if they are used by the device?
> > > > Yeah, that is exactly what the Intel guys are doing for their
> > > > integrated
> > > > GPUs :)
> > > > =

> > > > Problem is for TTM I need to be able to handle dGPUs and those have=
 all
> > > > kinds of funny allocation restrictions. In other words I need to
> > > > guarantee
> > > > that the allocated memory is coherent accessible to the GPU
> > > > without using
> > > > SWIOTLB.
> > > > =

> > > > The simple case is that the device can only do DMA32, but you also =
got
> > > > device which can only do 40bits or 48bits.
> > > > =

> > > > On top of that you also got AGP, CMA and stuff like CPU cache behav=
ior
> > > > changes (write back vs. write through, vs. uncached).
> > > OK, so the underlying problem seems to be that gfp mask (thus
> > > mapping_gfp_mask) cannot really reflect your requirements, right?=A0 =
Would
> > > it help if shmem would allow to provide an allocation callback to
> > > override alloc_page_vma which is used currently? I am pretty sure the=
re
> > > will be more to handle but going through shmem for the whole life time
> > > is just so much easier to reason about than some tricks to abuse shmem
> > > just for the swapout path.
> > =

> > Well it's a start, but the pages can have special CPU cache settings. So
> > direct IO from/to them usually doesn't work as expected.
> > =

> > Additional to that for AGP and CMA I need to make sure that I give those
> > pages back to the relevant subsystems instead of just dropping the page
> > reference.
> > =

> > So I would need to block for the swapio to be completed.
> > =

> > Anyway I probably need to revert those patches for now since this isn't
> > working as we hoped it would.
> > =

> > Thanks for the explanation how stuff works here.
> =

> Another alternative here that I've tried before without being successful
> would perhaps be to drop shmem completely and, if it's a normal page (no =
dma
> or funny caching attributes) just use add_to_swap_cache()? If it's someth=
ing
> else, try alloc a page with relevant gfp attributes, copy and
> add_to_swap_cache()? Or perhaps that doesn't work well from a shrinker
> either?

So before we toss everything and go an a great rewrite-the-world tour,
what if we just try to split up big objects. So for objects which are
bigger than e.g. 10mb

- move them to a special "under eviction" list
- keep a note how far we evicted thus far
- interleave allocating shmem pages, copying data and releasing the ttm
  backing store on a chunk basis (maybe 10mb or whatever, tuning tbh)

If that's not enough, occasionally break out of the shrinker entirely so
other parts of reclaim can reclaim the shmem stuff. But just releasing our
own pages as we go should help a lot I think.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
