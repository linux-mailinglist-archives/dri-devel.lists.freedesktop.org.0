Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51981DAC54
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44ED6E598;
	Wed, 20 May 2020 07:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1032 seconds by postgrey-1.36 at gabe;
 Tue, 19 May 2020 22:04:09 UTC
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68856E0C5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 22:04:09 +0000 (UTC)
Received: from [5.158.153.53] (helo=debian-buster-darwi.lab.linutronix.de.)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.80) (envelope-from <a.darwish@linutronix.de>)
 id 1jbA3Z-0002YP-5y; Tue, 19 May 2020 23:45:49 +0200
From: "Ahmed S. Darwish" <a.darwish@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v1 00/25] seqlock: Extend seqcount API with associated locks
Date: Tue, 19 May 2020 23:45:22 +0200
Message-Id: <20200519214547.352050-1-a.darwish@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 "Sebastian A. Siewior" <bigeasy@linutronix.de>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

A sequence counter write side critical section must be protected by some
form of locking to serialize writers. If the serialization primitive is
not disabling preemption implicitly, preemption has to be explicitly
disabled before entering the write side critical section.

There is no built-in debugging mechanism to verify that the lock used
for writer serialization is held and preemption is disabled. Some usage
sites like dma-buf have explicit lockdep checks for the writer-side
lock, but this covers only a small portion of the sequence counter usage
in the kernel.

Add new sequence counter types which allows to associate a lock to the
sequence counter at initialization time. The seqcount API functions are
extended to provide appropriate lockdep assertions depending on the
seqcount/lock type.

For sequence counters with associated locks that do not implicitly
disable preemption, preemption protection is enforced in the sequence
counter write side functions. This removes the need to explicitly add
preempt_disable/enable() around the write side critical sections: the
write_begin/end() functions for these new sequence counter types
automatically do this.

Extend the lockdep API with a macro asserting that preemption is
disabled.  Use it to verify that preemption is disabled for all sequence
counters write side critical sections.

If lockdep is disabled, these lock associations and non-preemptibility
checks are compiled out and have neither storage size nor runtime
overhead. If lockdep is enabled, a pointer to the lock is stored in the
seqcount and the write side API functions enable lockdep assertions.

The following seqcount types with associated locks are introduced:

     seqcount_spinlock_t
     seqcount_raw_spinlock_t
     seqcount_rwlock_t
     seqcount_mutex_t
     seqcount_ww_mutex_t

This lock association is not only useful for debugging purposes, it also
provides a mechanism for PREEMPT_RT to prevent writer starvation. On RT
kernels spinlocks and rwlocks are substituted with sleeping locks and
the code sections protected by these locks become preemptible, which has
the same problem as write side critical section with preemption enabled
on a non-RT kernel. RT utilizes this association by storing the provided
lock pointer and in case that a reader sees an active writer (seqcount
is odd), it does not spin, but blocks on the associated lock similar to
read_seqbegin_or_lock().

By using the lockdep debugging mechanisms added in this patch series, a
number of erroneous seqcount call-sites were discovered across the
kernel. The fixes are included at the beginning of the series.

Thanks,

8<--------------

Ahmed S. Darwish (25):
  net: core: device_rename: Use rwsem instead of a seqcount
  mm/swap: Don't abuse the seqcount latching API
  net: phy: fixed_phy: Remove unused seqcount
  block: nr_sects_write(): Disable preemption on seqcount write
  u64_stats: Document writer non-preemptibility requirement
  dma-buf: Remove custom seqcount lockdep class key
  lockdep: Add preemption disabled assertion API
  seqlock: lockdep assert non-preemptibility on seqcount_t write
  Documentation: locking: Describe seqlock design and usage
  seqlock: Add RST directives to kernel-doc code samples and notes
  seqlock: Add missing kernel-doc annotations
  seqlock: Extend seqcount API with associated locks
  dma-buf: Use sequence counter with associated wound/wait mutex
  sched: tasks: Use sequence counter with associated spinlock
  netfilter: conntrack: Use sequence counter with associated spinlock
  netfilter: nft_set_rbtree: Use sequence counter with associated rwlock
  xfrm: policy: Use sequence counters with associated lock
  timekeeping: Use sequence counter with associated raw spinlock
  vfs: Use sequence counter with associated spinlock
  raid5: Use sequence counter with associated spinlock
  iocost: Use sequence counter with associated spinlock
  NFSv4: Use sequence counter with associated spinlock
  userfaultfd: Use sequence counter with associated spinlock
  kvm/eventfd: Use sequence counter with associated spinlock
  hrtimer: Use sequence counter with associated raw spinlock

 Documentation/locking/index.rst               |   1 +
 Documentation/locking/seqlock.rst             | 239 +++++
 MAINTAINERS                                   |   2 +-
 block/blk-iocost.c                            |   5 +-
 block/blk.h                                   |   2 +
 drivers/dma-buf/dma-resv.c                    |  15 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   2 -
 drivers/md/raid5.c                            |   2 +-
 drivers/md/raid5.h                            |   2 +-
 drivers/net/phy/fixed_phy.c                   |  25 +-
 fs/dcache.c                                   |   2 +-
 fs/fs_struct.c                                |   4 +-
 fs/nfs/nfs4_fs.h                              |   2 +-
 fs/nfs/nfs4state.c                            |   2 +-
 fs/userfaultfd.c                              |   4 +-
 include/linux/dcache.h                        |   2 +-
 include/linux/dma-resv.h                      |   4 +-
 include/linux/fs_struct.h                     |   2 +-
 include/linux/hrtimer.h                       |   2 +-
 include/linux/kvm_irqfd.h                     |   2 +-
 include/linux/lockdep.h                       |   9 +
 include/linux/sched.h                         |   2 +-
 include/linux/seqlock.h                       | 882 +++++++++++++++---
 include/linux/seqlock_types_internal.h        | 187 ++++
 include/linux/u64_stats_sync.h                |  38 +-
 include/net/netfilter/nf_conntrack.h          |   2 +-
 init/init_task.c                              |   3 +-
 kernel/fork.c                                 |   2 +-
 kernel/locking/lockdep.c                      |  15 +
 kernel/time/hrtimer.c                         |  13 +-
 kernel/time/timekeeping.c                     |  19 +-
 lib/Kconfig.debug                             |   1 +
 mm/swap.c                                     |  57 +-
 net/core/dev.c                                |  30 +-
 net/netfilter/nf_conntrack_core.c             |   5 +-
 net/netfilter/nft_set_rbtree.c                |   4 +-
 net/xfrm/xfrm_policy.c                        |  10 +-
 virt/kvm/eventfd.c                            |   2 +-
 38 files changed, 1325 insertions(+), 277 deletions(-)
 create mode 100644 Documentation/locking/seqlock.rst
 create mode 100644 include/linux/seqlock_types_internal.h

base-commit: 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8
--
2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
