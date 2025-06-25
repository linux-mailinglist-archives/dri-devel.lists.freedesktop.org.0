Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D78AE8E4B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 21:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524610E7D8;
	Wed, 25 Jun 2025 19:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gtUn0D7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827B810E7D8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 19:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750878982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpqiDklJzgWULvZMFzOAfWV7cE1oihT1BC+dqlQ/AhA=;
 b=gtUn0D7Dh0ToD31Rt3sFrAPqCii+TZPfARP+0ib1CpOQjx6hKLTtaSH1f3RSoY7/2y4Ymn
 2PSkLqP+miDJqelvMzdyr267Tam3NEBRdIKJ/JyFTDQL8D9PuHfICZzD+uQMNRWY+l8oOQ
 +7tJv7SfW9xJUG8tOiubWtbnfYbP71M=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-KgxQiOH1OjOrbqXV5PMyBg-1; Wed, 25 Jun 2025 15:16:19 -0400
X-MC-Unique: KgxQiOH1OjOrbqXV5PMyBg-1
X-Mimecast-MFC-AGG-ID: KgxQiOH1OjOrbqXV5PMyBg_1750878979
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3132e7266d3so110283a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 12:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750878978; x=1751483778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gpqiDklJzgWULvZMFzOAfWV7cE1oihT1BC+dqlQ/AhA=;
 b=tJ0mdPloSiMxDcPSGtYxh68q27firdkAwE/ZkicTrcVALYt6lJ2Jhg7B+2ALpDm003
 pubwRbZ9TrDxumfQePxRBG+VXDiIi5FZUAXHuPJd8N4ZSF9ChOqTI3vgimXfuiBjOU/V
 +zxKPhsnOghaBilYorwMjlWc5zPQO9jUxNxAZ9SRFj2sCD/uRGxJzvE7oarxNthWgUeB
 iJC3YPOH6gIpNtXmZyxyStN2Unb6/ZugUHvcYmZELdT5awUsOs5ion3tP5pN9DxXR21V
 cazj/RekInFjkCB9MWFMsRKxv2HBPW7riwKsvkmhvqtm74ugr6BEqdHiToV8xRFeyLQY
 CmCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc1m1dc5KU/5jcEiKn6EE3ToMk3G8sE4KqAROe7erzKzELtFJtRHrE+eWL8zwbJFiIg0XcJQdHrUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOC2ZHwielGh9R4Ud21zzULQ6lbl9EAhcdbmw6WNXzdmwgi3z6
 CpqNyqKa2tlbnDspMQO3WvW7CIKDouqf+6zsRu+FxfdSouL7Cg3c5TavFSgsiQ8Ine/lGyGFbTR
 nC2sYpPzGchuNWc7sL5m33+5vXxs5Vn2yv3QIKn9Y0lYIC45/kC/4MLI4YAo9mxJzyOb5I46Kud
 y78FmxEUGZ3UGIYdxfPPFU8DHAMdpN+wD4xufvJtdg9HwXuCSzjZia
X-Gm-Gg: ASbGncuDX8CSfiR6RdJPn4SHd7JkCgycK5Ofy7fKwBY2ZA8pfL1UgpiyXtnZBF5UTZE
 eHaUW+AvrtBpsSYjlOY2yvM17+oFsrEkl2f3mUxlcbHmMdYnUVvGqdhAgGFv4knolshT2JP/c3M
 43Hw==
X-Received: by 2002:a17:90b:5484:b0:312:1d2d:18e1 with SMTP id
 98e67ed59e1d1-315f2671e07mr5030265a91.22.1750878978134; 
 Wed, 25 Jun 2025 12:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHZD/XPD3yQ/dZWbIHGbhcw69O6AIEjELyv6bFlc3mSyV8vzDQ9y+y5V/0+aNpa/SpnAU2TPiQIFrrgnHox2k=
X-Received: by 2002:a17:90b:5484:b0:312:1d2d:18e1 with SMTP id
 98e67ed59e1d1-315f2671e07mr5030246a91.22.1750878977734; Wed, 25 Jun 2025
 12:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250619072026.635133-1-airlied@gmail.com>
 <724720cd-eb05-4fc0-85a1-f6b60649b1ad@amd.com>
 <CAMwc25ruHtW165VRuDv5_tjaZGcL5H9CWeTjcCstXK09bDPhdw@mail.gmail.com>
 <7dd0885a-7e7c-41a9-ae81-811fc344caf5@amd.com>
In-Reply-To: <7dd0885a-7e7c-41a9-ae81-811fc344caf5@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 26 Jun 2025 05:16:04 +1000
X-Gm-Features: AX0GCFsvgmfea4XXwkA6mXxr3Pik4knfndsTsYx45LSMbhTEVn0xQupC3ObxyRs
Message-ID: <CAMwc25ohBsMO=VUJzk+_DLdWLN448P63udwx0Zf0CktTgca4UA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Matthew Brost <matthew.brost@intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vx_c6J1Qzh6gtV6NzKMImOR729uDnHy_VK7hfXnCE8E_1750878979
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jun 25, 2025 at 9:55=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 24.06.25 03:12, David Airlie wrote:
> > On Mon, Jun 23, 2025 at 6:54=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 6/19/25 09:20, Dave Airlie wrote:
> >>> From: Dave Airlie <airlied@redhat.com>
> >>>
> >>> While discussing memcg intergration with gpu memory allocations,
> >>> it was pointed out that there was no numa/system counters for
> >>> GPU memory allocations.
> >>>
> >>> With more integrated memory GPU server systems turning up, and
> >>> more requirements for memory tracking it seems we should start
> >>> closing the gap.
> >>>
> >>> Add two counters to track GPU per-node system memory allocations.
> >>>
> >>> The first is currently allocated to GPU objects, and the second
> >>> is for memory that is stored in GPU page pools that can be reclaimed,
> >>> by the shrinker.
> >>>
> >>> Cc: Christian Koenig <christian.koenig@amd.com>
> >>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>> Cc: Johannes Weiner <hannes@cmpxchg.org>
> >>> Cc: linux-mm@kvack.org
> >>> Cc: Andrew Morton <akpm@linux-foundation.org>
> >>> Signed-off-by: Dave Airlie <airlied@redhat.com>
> >>>
> >>> ---
> >>>
> >>> v2: add more info to the documentation on this memory.
> >>>
> >>> I'd like to get acks to merge this via the drm tree, if possible,
> >>>
> >>> Dave.
> >>> ---
> >>>  Documentation/filesystems/proc.rst | 8 ++++++++
> >>>  drivers/base/node.c                | 5 +++++
> >>>  fs/proc/meminfo.c                  | 6 ++++++
> >>>  include/linux/mmzone.h             | 2 ++
> >>>  mm/show_mem.c                      | 9 +++++++--
> >>>  mm/vmstat.c                        | 2 ++
> >>>  6 files changed, 30 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/filesystems/proc.rst b/Documentation/files=
ystems/proc.rst
> >>> index 5236cb52e357..7cc5a9185190 100644
> >>> --- a/Documentation/filesystems/proc.rst
> >>> +++ b/Documentation/filesystems/proc.rst
> >>> @@ -1095,6 +1095,8 @@ Example output. You may not have all of these f=
ields.
> >>>      CmaFree:               0 kB
> >>>      Unaccepted:            0 kB
> >>>      Balloon:               0 kB
> >>> +    GPUActive:             0 kB
> >>> +    GPUReclaim:            0 kB
> >>
> >> Active certainly makes sense, but I think we should rather disable the=
 pool on newer CPUs than adding reclaimable memory here.
> >
> > I'm not just concerned about newer platforms though, even on Fedora 42
> > on my test ryzen1+7900xt machine, with a desktop session running
> >
> > nr_gpu_active 7473
> > nr_gpu_reclaim 6656
> >
> > It's not an insignificant amount of memory.
>
> That was not what I meant, that you have quite a bunch of memory allocate=
d to the GPU is correct.
>
> But the problem is more that we used the pool for way to many thinks whic=
h is actually not necessary.
>
> But granted this is orthogonal to that patch here.

At least here this is all WC allocations, probably from userspace, so
it feels like we are using it correctly, since we stopped pooling
cached pages.

>
> > I also think if we get to
> > some sort of discardable GTT objects with a shrinker they should
> > probably be accounted in reclaim.
>
> The problem is that this is extremely driver specific.
>
> On amdgpu we have some temporary buffers which can be reclaimed immediate=
ly, but the really big chunk is for example what XE does with it's shrinker=
.
>
> See Thomas TTM patches from a few month ago. If memory is active or recla=
imable does not depend on how it is allocated, but on how it is used.
>
> So the accounting need to be at the driver level if you really want to di=
stinct between the two states.

How the counters are used is fine to be done at the driver level on
top of this, though I think for discardable there is grounds for
ttm_tt having a discardable flag once we see a couple of drivers using
it, and then maybe the counters could be moved, but it's also fine to
use these counters in drivers outside TTM if they are done
appropriately, just so we can see the memory allocations as part of
the big picture.

Dave.

