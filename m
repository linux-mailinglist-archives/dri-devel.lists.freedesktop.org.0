Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B0D20303D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC586E56D;
	Mon, 22 Jun 2020 07:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611D96E17E
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 17:01:07 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r22so12062740qke.13
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 10:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4IW0tXR/mpDYC4NFvk1L+/PIhxOlHSqhtHjHb8hvbaI=;
 b=hVLhkOJkp0Fk5aGFzHR+ThgT0CBzNawLXlLM72wKP0YRQwpCqKZ1N9rnWKn64RdTxJ
 dAhvAxyqc7ROQXd2615zDI6mW9/2Y+YxhID/+TyxZW+5Y0ydVnPuZSzwMeiColKV8BRg
 iLfvZh1wfayW/h6mJ3ojFVTgcuuEaG2UuZNDUnzI6ANezenUyYA2lSd8HQivzWcTqGKH
 E9vMEimR5InrG70jcN+75796gLxZDaYxAQGAhecdWf+4Z9VE3GxVeRLPydZwRpb+7PtK
 o1khaXKPM5l3sjtemmPsBG1cve865OpFfqY6MuMpeWS04WIPFMdcjZaNGDJBhZ7bALu1
 dYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4IW0tXR/mpDYC4NFvk1L+/PIhxOlHSqhtHjHb8hvbaI=;
 b=VWgncvUzaldAzU6wc9N6/kl1H8o5uneLUXcI0HmsYjGI9jeHAfmwJMsaAIs9T1golx
 KJql8p17zVpmoGo0RvkVbEr9jVdWgL6tIphPljBZNUQ0w0EVXW+1Ps23gmhPS5WjSxhg
 bDhRzrtgP38jRQaYqtwTchoUZodo1nwId7rK6WxmnA8LuRr9LSYI1AvH5iKVmwzhL5zi
 J8/tBRCoZMNZQ2tJAVF44heQVuAsUoRpPkJGBhysamkRXLdvn1PLTP+BJn0GHhVC1Nko
 bxDAMP8u69uJhLBvCrEz3H16IlXQOW58QkFC4trOynoip6xEV6fjHDrJoCBQ006U841+
 ej2w==
X-Gm-Message-State: AOAM532AyJFkdv8iythyvJ+P2W+AYH364s7jkLkS3j1i5ZppA6Z1TuyL
 kSKTDDnzG5VKroOQQ6vMJlNbUg==
X-Google-Smtp-Source: ABdhPJyJ12ne6jqTc576YVDylh9jKcdn5VQZV8bqr/CrO/FfglTpnxIYrYwzLzykjZd4oTCNCC3rzg==
X-Received: by 2002:a37:5c7:: with SMTP id 190mr85321qkf.479.1592758865784;
 Sun, 21 Jun 2020 10:01:05 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id l2sm14249673qtc.80.2020.06.21.10.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 10:01:05 -0700 (PDT)
Date: Sun, 21 Jun 2020 13:00:54 -0400
From: Qian Cai <cai@lca.pw>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 01/18] mm: Track mmu notifiers in
 fs_reclaim_acquire/release
Message-ID: <20200621170054.GA1398@lca.pw>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604081224.863494-2-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 04, 2020 at 10:12:07AM +0200, Daniel Vetter wrote:
> fs_reclaim_acquire/release nicely catch recursion issues when
> allocating GFP_KERNEL memory against shrinkers (which gpu drivers tend
> to use to keep the excessive caches in check). For mmu notifier
> recursions we do have lockdep annotations since 23b68395c7c7
> ("mm/mmu_notifiers: add a lockdep map for invalidate_range_start/end").
> =

> But these only fire if a path actually results in some pte
> invalidation - for most small allocations that's very rarely the case.
> The other trouble is that pte invalidation can happen any time when
> __GFP_RECLAIM is set. Which means only really GFP_ATOMIC is a safe
> choice, GFP_NOIO isn't good enough to avoid potential mmu notifier
> recursion.
> =

> I was pondering whether we should just do the general annotation, but
> there's always the risk for false positives. Plus I'm assuming that
> the core fs and io code is a lot better reviewed and tested than
> random mmu notifier code in drivers. Hence why I decide to only
> annotate for that specific case.
> =

> Furthermore even if we'd create a lockdep map for direct reclaim, we'd
> still need to explicit pull in the mmu notifier map - there's a lot
> more places that do pte invalidation than just direct reclaim, these
> two contexts arent the same.
> =

> Note that the mmu notifiers needing their own independent lockdep map
> is also the reason we can't hold them from fs_reclaim_acquire to
> fs_reclaim_release - it would nest with the acquistion in the pte
> invalidation code, causing a lockdep splat. And we can't remove the
> annotations from pte invalidation and all the other places since
> they're called from many other places than page reclaim. Hence we can
> only do the equivalent of might_lock, but on the raw lockdep map.
> =

> With this we can also remove the lockdep priming added in 66204f1d2d1b
> ("mm/mmu_notifiers: prime lockdep") since the new annotations are
> strictly more powerful.
> =

> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@mellanox.com>
> Cc: linux-mm@kvack.org
> Cc: linux-rdma@vger.kernel.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reverting this commit fixed the lockdep splat below while applying some
memory pressure,

[  190.455003][  T369] WARNING: possible circular locking dependency detect=
ed
[  190.487291][  T369] 5.8.0-rc1-next-20200621 #1 Not tainted
[  190.512363][  T369] ----------------------------------------------------=
--
[  190.543354][  T369] kswapd3/369 is trying to acquire lock:
[  190.568523][  T369] ffff889fcf694528 (&xfs_nondir_ilock_class){++++}-{3:=
3}, at: xfs_reclaim_inode+0xdf/0x860
spin_lock at include/linux/spinlock.h:353
(inlined by) xfs_iflags_test_and_set at fs/xfs/xfs_inode.h:166
(inlined by) xfs_iflock_nowait at fs/xfs/xfs_inode.h:249
(inlined by) xfs_reclaim_inode at fs/xfs/xfs_icache.c:1127
[  190.614359][  T369]
[  190.614359][  T369] but task is already holding lock:
[  190.647763][  T369] ffffffffb50ced00 (fs_reclaim){+.+.}-{0:0}, at: __fs_=
reclaim_acquire+0x0/0x30
__fs_reclaim_acquire at mm/page_alloc.c:4200
[  190.687845][  T369]
[  190.687845][  T369] which lock already depends on the new lock.
[  190.687845][  T369]
[  190.734890][  T369]
[  190.734890][  T369] the existing dependency chain (in reverse order) is:
[  190.775991][  T369]
[  190.775991][  T369] -> #1 (fs_reclaim){+.+.}-{0:0}:
[  190.808150][  T369]        fs_reclaim_acquire+0x77/0x80
[  190.832152][  T369]        slab_pre_alloc_hook.constprop.52+0x20/0x120
slab_pre_alloc_hook at mm/slab.h:507
[  190.862173][  T369]        kmem_cache_alloc+0x43/0x2a0
[  190.885602][  T369]        kmem_zone_alloc+0x113/0x3ef
kmem_zone_alloc at fs/xfs/kmem.c:129
[  190.908702][  T369]        xfs_inode_item_init+0x1d/0xa0
xfs_inode_item_init at fs/xfs/xfs_inode_item.c:639
[  190.934461][  T369]        xfs_trans_ijoin+0x96/0x100
xfs_trans_ijoin at fs/xfs/libxfs/xfs_trans_inode.c:34
[  190.961530][  T369]        xfs_setattr_nonsize+0x1a6/0xcd0
xfs_setattr_nonsize at fs/xfs/xfs_iops.c:716
[  190.987331][  T369]        xfs_vn_setattr+0x133/0x160
xfs_vn_setattr at fs/xfs/xfs_iops.c:1081
[  191.010476][  T369]        notify_change+0x6c5/0xba1
notify_change at fs/attr.c:336
[  191.033317][  T369]        chmod_common+0x19b/0x390
[  191.055770][  T369]        ksys_fchmod+0x28/0x60
[  191.077957][  T369]        __x64_sys_fchmod+0x4e/0x70
[  191.102767][  T369]        do_syscall_64+0x5f/0x310
[  191.125090][  T369]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  191.153749][  T369]
[  191.153749][  T369] -> #0 (&xfs_nondir_ilock_class){++++}-{3:3}:
[  191.191267][  T369]        __lock_acquire+0x2efc/0x4da0
[  191.215974][  T369]        lock_acquire+0x1ac/0xaf0
[  191.238953][  T369]        down_write_nested+0x92/0x150
[  191.262955][  T369]        xfs_reclaim_inode+0xdf/0x860
[  191.287149][  T369]        xfs_reclaim_inodes_ag+0x505/0xb00
[  191.313291][  T369]        xfs_reclaim_inodes_nr+0x93/0xd0
[  191.338357][  T369]        super_cache_scan+0x2fd/0x430
[  191.362354][  T369]        do_shrink_slab+0x317/0x990
[  191.385341][  T369]        shrink_slab+0x3a8/0x4b0
[  191.407214][  T369]        shrink_node+0x49c/0x17b0
[  191.429841][  T369]        balance_pgdat+0x59c/0xed0
[  191.455041][  T369]        kswapd+0x5a4/0xc40
[  191.477524][  T369]        kthread+0x358/0x420
[  191.499285][  T369]        ret_from_fork+0x22/0x30
[  191.521107][  T369]
[  191.521107][  T369] other info that might help us debug this:
[  191.521107][  T369]
[  191.567490][  T369]  Possible unsafe locking scenario:
[  191.567490][  T369]
[  191.600947][  T369]        CPU0                    CPU1
[  191.624808][  T369]        ----                    ----
[  191.649236][  T369]   lock(fs_reclaim);
[  191.667607][  T369]                                lock(&xfs_nondir_iloc=
k_class);
[  191.702096][  T369]                                lock(fs_reclaim);
[  191.731243][  T369]   lock(&xfs_nondir_ilock_class);
[  191.754025][  T369]
[  191.754025][  T369]  *** DEADLOCK ***
[  191.754025][  T369]
[  191.791126][  T369] 4 locks held by kswapd3/369:
[  191.812198][  T369]  #0: ffffffffb50ced00 (fs_reclaim){+.+.}-{0:0}, at: =
__fs_reclaim_acquire+0x0/0x30
[  191.854319][  T369]  #1: ffffffffb5074c50 (shrinker_rwsem){++++}-{3:3}, =
at: shrink_slab+0x219/0x4b0
[  191.896043][  T369]  #2: ffff8890279b40e0 (&type->s_umount_key#27){++++}=
-{3:3}, at: trylock_super+0x11/0xb0
[  191.940538][  T369]  #3: ffff889027a73a28 (&pag->pag_ici_reclaim_lock){+=
.+.}-{3:3}, at: xfs_reclaim_inodes_ag+0x135/0xb00
[  191.995314][  T369]
[  191.995314][  T369] stack backtrace:
[  192.022934][  T369] CPU: 42 PID: 369 Comm: kswapd3 Not tainted 5.8.0-rc1=
-next-20200621 #1
[  192.060546][  T369] Hardware name: HP ProLiant BL660c Gen9, BIOS I38 10/=
17/2018
[  192.094518][  T369] Call Trace:
[  192.109005][  T369]  dump_stack+0x9d/0xe0
[  192.127468][  T369]  check_noncircular+0x347/0x400
[  192.149526][  T369]  ? print_circular_bug+0x360/0x360
[  192.172584][  T369]  ? freezing_slow_path.cold.2+0x2a/0x2a
[  192.197251][  T369]  __lock_acquire+0x2efc/0x4da0
[  192.218737][  T369]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[  192.246736][  T369]  ? __lock_acquire+0x3541/0x4da0
[  192.269673][  T369]  lock_acquire+0x1ac/0xaf0
[  192.290192][  T369]  ? xfs_reclaim_inode+0xdf/0x860
[  192.313158][  T369]  ? rcu_read_unlock+0x50/0x50
[  192.335057][  T369]  down_write_nested+0x92/0x150
[  192.358409][  T369]  ? xfs_reclaim_inode+0xdf/0x860
[  192.380890][  T369]  ? rwsem_down_write_slowpath+0xf50/0xf50
[  192.406891][  T369]  ? find_held_lock+0x33/0x1c0
[  192.427925][  T369]  ? xfs_ilock+0x2ef/0x370
[  192.447496][  T369]  ? xfs_reclaim_inode+0xdf/0x860
[  192.472315][  T369]  xfs_reclaim_inode+0xdf/0x860
[  192.496649][  T369]  ? xfs_inode_clear_reclaim_tag+0xa0/0xa0
[  192.524188][  T369]  ? do_raw_spin_unlock+0x4f/0x250
[  192.546852][  T369]  xfs_reclaim_inodes_ag+0x505/0xb00
[  192.570473][  T369]  ? xfs_reclaim_inode+0x860/0x860
[  192.592692][  T369]  ? mark_held_locks+0xb0/0x110
[  192.614287][  T369]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[  192.640800][  T369]  ? _raw_spin_unlock_irqrestore+0x39/0x40
[  192.666695][  T369]  ? try_to_wake_up+0xcf/0xf40
[  192.688265][  T369]  ? migrate_swap_stop+0xc10/0xc10
[  192.711966][  T369]  ? do_raw_spin_unlock+0x4f/0x250
[  192.735032][  T369]  xfs_reclaim_inodes_nr+0x93/0xd0
xfs_reclaim_inodes_nr at fs/xfs/xfs_icache.c:1399
[  192.757674][  T369]  ? xfs_reclaim_inodes+0x90/0x90
[  192.780028][  T369]  ? list_lru_count_one+0x177/0x300
[  192.803010][  T369]  super_cache_scan+0x2fd/0x430
super_cache_scan at fs/super.c:115
[  192.824491][  T369]  do_shrink_slab+0x317/0x990
do_shrink_slab at mm/vmscan.c:514
[  192.845160][  T369]  shrink_slab+0x3a8/0x4b0
shrink_slab_memcg at mm/vmscan.c:584
(inlined by) shrink_slab at mm/vmscan.c:662
[  192.864722][  T369]  ? do_shrink_slab+0x990/0x990
[  192.886137][  T369]  ? rcu_is_watching+0x2c/0x80
[  192.907289][  T369]  ? mem_cgroup_protected+0x228/0x470
[  192.931166][  T369]  ? vmpressure+0x25/0x290
[  192.950595][  T369]  shrink_node+0x49c/0x17b0
[  192.972332][  T369]  balance_pgdat+0x59c/0xed0
kswapd_shrink_node at mm/vmscan.c:3521
(inlined by) balance_pgdat at mm/vmscan.c:3670
[  192.994918][  T369]  ? __node_reclaim+0x950/0x950
[  193.018625][  T369]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[  193.046566][  T369]  ? _raw_spin_unlock_irq+0x1f/0x30
[  193.070214][  T369]  ? _raw_spin_unlock_irq+0x1f/0x30
[  193.093176][  T369]  ? finish_task_switch+0x129/0x650
[  193.116225][  T369]  ? finish_task_switch+0xf2/0x650
[  193.138809][  T369]  ? rcu_read_lock_bh_held+0xc0/0xc0
[  193.163323][  T369]  kswapd+0x5a4/0xc40
[  193.182690][  T369]  ? __kthread_parkme+0x4d/0x1a0
[  193.204660][  T369]  ? balance_pgdat+0xed0/0xed0
[  193.225776][  T369]  ? _raw_spin_unlock_irqrestore+0x39/0x40
[  193.252306][  T369]  ? finish_wait+0x270/0x270
[  193.272473][  T369]  ? __kthread_parkme+0x4d/0x1a0
[  193.294476][  T369]  ? __kthread_parkme+0xcc/0x1a0
[  193.316704][  T369]  ? balance_pgdat+0xed0/0xed0
[  193.337808][  T369]  kthread+0x358/0x420
[  193.355666][  T369]  ? kthread_create_worker_on_cpu+0xc0/0xc0
[  193.381884][  T369]  ret_from_fork+0x22/0x30

> ---
> This is part of a gpu lockdep annotation series simply because it
> really helps to catch issues where gpu subsystem locks and primitives
> can deadlock with themselves through allocations and mmu notifiers.
> But aside from that motivation it should be completely free-standing,
> and can land through -mm/-rdma/-hmm or any other tree really whenever.
> -Daniel
> ---
>  mm/mmu_notifier.c |  7 -------
>  mm/page_alloc.c   | 23 ++++++++++++++---------
>  2 files changed, 14 insertions(+), 16 deletions(-)
> =

> diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> index 06852b896fa6..5d578b9122f8 100644
> --- a/mm/mmu_notifier.c
> +++ b/mm/mmu_notifier.c
> @@ -612,13 +612,6 @@ int __mmu_notifier_register(struct mmu_notifier *sub=
scription,
>  	lockdep_assert_held_write(&mm->mmap_sem);
>  	BUG_ON(atomic_read(&mm->mm_users) <=3D 0);
>  =

> -	if (IS_ENABLED(CONFIG_LOCKDEP)) {
> -		fs_reclaim_acquire(GFP_KERNEL);
> -		lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
> -		lock_map_release(&__mmu_notifier_invalidate_range_start_map);
> -		fs_reclaim_release(GFP_KERNEL);
> -	}
> -
>  	if (!mm->notifier_subscriptions) {
>  		/*
>  		 * kmalloc cannot be called under mm_take_all_locks(), but we
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 13cc653122b7..f8a222db4a53 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -57,6 +57,7 @@
>  #include <trace/events/oom.h>
>  #include <linux/prefetch.h>
>  #include <linux/mm_inline.h>
> +#include <linux/mmu_notifier.h>
>  #include <linux/migrate.h>
>  #include <linux/hugetlb.h>
>  #include <linux/sched/rt.h>
> @@ -4124,7 +4125,7 @@ should_compact_retry(struct alloc_context *ac, unsi=
gned int order, int alloc_fla
>  static struct lockdep_map __fs_reclaim_map =3D
>  	STATIC_LOCKDEP_MAP_INIT("fs_reclaim", &__fs_reclaim_map);
>  =

> -static bool __need_fs_reclaim(gfp_t gfp_mask)
> +static bool __need_reclaim(gfp_t gfp_mask)
>  {
>  	gfp_mask =3D current_gfp_context(gfp_mask);
>  =

> @@ -4136,10 +4137,6 @@ static bool __need_fs_reclaim(gfp_t gfp_mask)
>  	if (current->flags & PF_MEMALLOC)
>  		return false;
>  =

> -	/* We're only interested __GFP_FS allocations for now */
> -	if (!(gfp_mask & __GFP_FS))
> -		return false;
> -
>  	if (gfp_mask & __GFP_NOLOCKDEP)
>  		return false;
>  =

> @@ -4158,15 +4155,23 @@ void __fs_reclaim_release(void)
>  =

>  void fs_reclaim_acquire(gfp_t gfp_mask)
>  {
> -	if (__need_fs_reclaim(gfp_mask))
> -		__fs_reclaim_acquire();
> +	if (__need_reclaim(gfp_mask)) {
> +		if (!(gfp_mask & __GFP_FS))
> +			__fs_reclaim_acquire();
> +
> +		lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
> +		lock_map_release(&__mmu_notifier_invalidate_range_start_map);
> +
> +	}
>  }
>  EXPORT_SYMBOL_GPL(fs_reclaim_acquire);
>  =

>  void fs_reclaim_release(gfp_t gfp_mask)
>  {
> -	if (__need_fs_reclaim(gfp_mask))
> -		__fs_reclaim_release();
> +	if (__need_reclaim(gfp_mask)) {
> +		if (!(gfp_mask & __GFP_FS))
> +			__fs_reclaim_release();
> +	}
>  }
>  EXPORT_SYMBOL_GPL(fs_reclaim_release);
>  #endif
> -- =

> 2.26.2
> =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
