Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DDE26DCAC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 15:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8706EC7D;
	Thu, 17 Sep 2020 13:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC57D6EC6E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 13:19:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m6so2071625wrn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 06:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=OJz3dROXwZ4H9FjplYiHUh7ta1dm2pPiZx++Qm+gMOk=;
 b=Ol8zdtYKra8OqwKcXQZPTIzAIAjrxl7EnGA/qptW05V0voGayUZTJ1UOmlJx84mWcm
 0r1ALbQGydxydvFM37pyuB+FPcNQJYGFXrs30Uy4uBKXsTI9vDopq0psqSt8WIVbv/3m
 SL42by4B46k89IfXDFWI+V95drUdRSPKiXLkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=OJz3dROXwZ4H9FjplYiHUh7ta1dm2pPiZx++Qm+gMOk=;
 b=T+Y4v3XZv5O05o9HxrXPxMjV1CzmL86VvckJeM02dD2kpDbBevim74EshCeKXcEVY2
 nUNaTnd4kk2QGu+S+dPX9Cv+wha9FWj3SXeshykv7+4A3os19zvoKEpronHl981E7T88
 H+YG0Yk+HqirfhD9n4u2fzJJ9qxPvoYBTsHdE1fS0e4mcJqtqOAiw0TAXsCVTPQwyiX4
 h8IvZ960KjD29QcWbEU3THejMai7QYdGJJS3tiQPsFSQID7JItMhFsMrEU37bBJHjBqB
 SW5+Wqpde70vwwDEkURLvC7H1qO4tMsIIhQ5sJw7/nUHDzT/GN65ZTOeFTfNKJAxY0gs
 bkMw==
X-Gm-Message-State: AOAM532oT8LjmJM0cRFW0vv6U2DxCnLAjxwzbNZcOUQ6LPTpurL+9DKT
 EvcMiHXSnvg5qmFT+jhjirTp9g==
X-Google-Smtp-Source: ABdhPJwWrq6ZejmimL/ybiemi2sN/GPynbFDqZKwAC87Lkhqkhgx8buF3bHZlQuU+GRDRVJVnJpavA==
X-Received: by 2002:a5d:6b84:: with SMTP id n4mr34531077wrx.55.1600348785370; 
 Thu, 17 Sep 2020 06:19:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d2sm39644798wro.34.2020.09.17.06.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 06:19:44 -0700 (PDT)
Date: Thu, 17 Sep 2020 15:19:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH] dma-resv: lockdep-prime address_space->i_mmap_rwsem for
 dma-resv
Message-ID: <20200917131942.GX438822@phenom.ffwll.local>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?=
 <thomas_os@shipmail.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Dave Chinner <david@fromorbit.com>, Qian Cai <cai@lca.pw>,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@mellanox.com>, Linux MM <linux-mm@kvack.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20200728135839.1035515-1-daniel.vetter@ffwll.ch>
 <38cbc4fb-3a88-47c4-2d6c-4d90f9be42e7@shipmail.org>
 <CAKMK7uFe-70DE5qOBJ6FwD8d_A0yZt+h5bCqA=e9QtYE1qwASQ@mail.gmail.com>
 <60f2b14f-8cef-f515-9cf5-bdbc02d9c63c@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60f2b14f-8cef-f515-9cf5-bdbc02d9c63c@shipmail.org>
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
Cc: linux-xfs@vger.kernel.org, linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Chinner <david@fromorbit.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Qian Cai <cai@lca.pw>, linux-fsdevel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 06:45:14PM +0200, Thomas Hellstr=F6m (Intel) wrote:
> =

> On 7/30/20 3:17 PM, Daniel Vetter wrote:
> > On Thu, Jul 30, 2020 at 2:17 PM Thomas Hellstr=F6m (Intel)
> > <thomas_os@shipmail.org> wrote:
> > > =

> > > On 7/28/20 3:58 PM, Daniel Vetter wrote:
> > > > GPU drivers need this in their shrinkers, to be able to throw out
> > > > mmap'ed buffers. Note that we also need dma_resv_lock in shrinkers,
> > > > but that loop is resolved by trylocking in shrinkers.
> > > > =

> > > > So full hierarchy is now (ignore some of the other branches we alre=
ady
> > > > have primed):
> > > > =

> > > > mmap_read_lock -> dma_resv -> shrinkers -> i_mmap_lock_write
> > > > =

> > > > I hope that's not inconsistent with anything mm or fs does, adding
> > > > relevant people.
> > > > =

> > > Looks OK to me. The mapping_dirty_helpers run under the i_mmap_lock, =
but
> > > don't allocate any memory AFAICT.
> > > =

> > > Since huge page-table-entry splitting may happen under the i_mmap_lock
> > > from unmap_mapping_range() it might be worth figuring out how new page
> > > directory pages are allocated, though.
> > ofc I'm not an mm expert at all, but I did try to scroll through all
> > i_mmap_lock_write/read callers. Found the following:
> > =

> > - kernel/events/uprobes.c in build_map_info:
> > =

> >              /*
> >               * Needs GFP_NOWAIT to avoid i_mmap_rwsem recursion through
> >               * reclaim. This is optimistic, no harm done if it fails.
> >               */
> > =

> > - I got lost in the hugetlb.c code and couldn't convince myself it's
> > not allocating page directories at various levels with something else
> > than GFP_KERNEL.
> > =

> > So looks like the recursion is clearly there and known, but the
> > hugepage code is too complex and flying over my head.
> > -Daniel
> =

> OK, so I inverted your annotation and ran a memory hog, and got the below
> splat. So clearly your proposed reclaim->i_mmap_lock locking order is an
> already established one.
> =

> So
> =

> Reviewed-by: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>

No one complaining that this is a terrible idea and two reviews from
people who know stuff, so I went ahead and pushed this to drm-misc-next.

Thanks for taking a look at this.
-Daniel

> =

> 8<-----------------------------------------------------------------------=
----------------------
> =

> [=A0 308.324654] WARNING: possible circular locking dependency detected
> [=A0 308.324655] 5.8.0-rc2+ #16 Not tainted
> [=A0 308.324656] ------------------------------------------------------
> [=A0 308.324657] kswapd0/98 is trying to acquire lock:
> [=A0 308.324658] ffff92a16f758428 (&mapping->i_mmap_rwsem){++++}-{3:3}, a=
t:
> rmap_walk_file+0x1c0/0x2f0
> [=A0 308.324663]
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 but task is already holding lo=
ck:
> [=A0 308.324664] ffffffffb0960240 (fs_reclaim){+.+.}-{0:0}, at:
> __fs_reclaim_acquire+0x5/0x30
> [=A0 308.324666]
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 which lock already depends on =
the new lock.
> =

> [=A0 308.324667]
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 the existing dependency chain =
(in reverse order) is:
> [=A0 308.324667]
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -> #1 (fs_reclaim){+.+.}-{0:0}:
> [=A0 308.324670]=A0=A0=A0=A0=A0=A0=A0 fs_reclaim_acquire+0x34/0x40
> [=A0 308.324672]=A0=A0=A0=A0=A0=A0=A0 dma_resv_lockdep+0x186/0x224
> [=A0 308.324675]=A0=A0=A0=A0=A0=A0=A0 do_one_initcall+0x5d/0x2c0
> [=A0 308.324676]=A0=A0=A0=A0=A0=A0=A0 kernel_init_freeable+0x222/0x288
> [=A0 308.324678]=A0=A0=A0=A0=A0=A0=A0 kernel_init+0xa/0x107
> [=A0 308.324679]=A0=A0=A0=A0=A0=A0=A0 ret_from_fork+0x1f/0x30
> [=A0 308.324680]
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -> #0 (&mapping->i_mmap_rwsem)=
{++++}-{3:3}:
> [=A0 308.324682]=A0=A0=A0=A0=A0=A0=A0 __lock_acquire+0x119f/0x1fc0
> [=A0 308.324683]=A0=A0=A0=A0=A0=A0=A0 lock_acquire+0xa4/0x3b0
> [=A0 308.324685]=A0=A0=A0=A0=A0=A0=A0 down_read+0x2d/0x110
> [=A0 308.324686]=A0=A0=A0=A0=A0=A0=A0 rmap_walk_file+0x1c0/0x2f0
> [=A0 308.324687]=A0=A0=A0=A0=A0=A0=A0 page_referenced+0x133/0x150
> [=A0 308.324689]=A0=A0=A0=A0=A0=A0=A0 shrink_active_list+0x142/0x610
> [=A0 308.324690]=A0=A0=A0=A0=A0=A0=A0 balance_pgdat+0x229/0x620
> [=A0 308.324691]=A0=A0=A0=A0=A0=A0=A0 kswapd+0x200/0x470
> [=A0 308.324693]=A0=A0=A0=A0=A0=A0=A0 kthread+0x11f/0x140
> [=A0 308.324694]=A0=A0=A0=A0=A0=A0=A0 ret_from_fork+0x1f/0x30
> [=A0 308.324694]
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 other info that might help us =
debug this:
> =

> [=A0 308.324695]=A0 Possible unsafe locking scenario:
> =

> [=A0 308.324695]=A0=A0=A0=A0=A0=A0=A0 CPU0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 CPU1
> [=A0 308.324696]=A0=A0=A0=A0=A0=A0=A0 ----=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ----
> [=A0 308.324696]=A0=A0 lock(fs_reclaim);
> [=A0 308.324697] lock(&mapping->i_mmap_rwsem);
> [=A0 308.324698]=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 lock(fs_reclaim);
> [=A0 308.324699]=A0=A0 lock(&mapping->i_mmap_rwsem);
> [=A0 308.324699]
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *** DEADLOCK ***
> =

> [=A0 308.324700] 1 lock held by kswapd0/98:
> [=A0 308.324701]=A0 #0: ffffffffb0960240 (fs_reclaim){+.+.}-{0:0}, at:
> __fs_reclaim_acquire+0x5/0x30
> [=A0 308.324702]
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 stack backtrace:
> [=A0 308.324704] CPU: 1 PID: 98 Comm: kswapd0 Not tainted 5.8.0-rc2+ #16
> [=A0 308.324705] Hardware name: VMware, Inc. VMware Virtual Platform/440BX
> Desktop Reference Platform, BIOS 6.00 07/29/2019
> [=A0 308.324706] Call Trace:
> [=A0 308.324710]=A0 dump_stack+0x92/0xc8
> [=A0 308.324711]=A0 check_noncircular+0x12d/0x150
> [=A0 308.324713]=A0 __lock_acquire+0x119f/0x1fc0
> [=A0 308.324715]=A0 lock_acquire+0xa4/0x3b0
> [=A0 308.324716]=A0 ? rmap_walk_file+0x1c0/0x2f0
> [=A0 308.324717]=A0 ? __lock_acquire+0x394/0x1fc0
> [=A0 308.324719]=A0 down_read+0x2d/0x110
> [=A0 308.324720]=A0 ? rmap_walk_file+0x1c0/0x2f0
> [=A0 308.324721]=A0 rmap_walk_file+0x1c0/0x2f0
> [=A0 308.324722]=A0 page_referenced+0x133/0x150
> [=A0 308.324724]=A0 ? __page_set_anon_rmap+0x70/0x70
> [=A0 308.324725]=A0 ? page_get_anon_vma+0x190/0x190
> [=A0 308.324726]=A0 shrink_active_list+0x142/0x610
> [=A0 308.324728]=A0 balance_pgdat+0x229/0x620
> [=A0 308.324730]=A0 kswapd+0x200/0x470
> [=A0 308.324731]=A0 ? lockdep_hardirqs_on_prepare+0xf5/0x170
> [=A0 308.324733]=A0 ? finish_wait+0x80/0x80
> [=A0 308.324734]=A0 ? balance_pgdat+0x620/0x620
> [=A0 308.324736]=A0 kthread+0x11f/0x140
> [=A0 308.324737]=A0 ? kthread_create_worker_on_cpu+0x40/0x40
> [=A0 308.324739]=A0 ret_from_fork+0x1f/0x30
> =

> =

> =

> > > /Thomas
> > > =

> > > =

> > > =

> > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
