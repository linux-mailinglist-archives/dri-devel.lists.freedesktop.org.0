Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BF9519A6A
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BF010FB2A;
	Wed,  4 May 2022 08:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D56D10FB22
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:49:20 +0000 (UTC)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.53 with ESMTP; 4 May 2022 17:19:19 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.125 with ESMTP; 4 May 2022 17:19:19 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Date: Wed,  4 May 2022 17:17:28 +0900
Message-Id: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 linux-mm@kvack.org, ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus and folks,

I've been developing a tool for detecting deadlock possibilities by
tracking wait/event rather than lock(?) acquisition order to try to
cover all synchonization machanisms. It's done on v5.18-rc3 tag.

https://github.com/lgebyungchulpark/linux-dept/commits/dept1.20_on_v5.18-rc3

Benifit:

	0. Works with all lock primitives.
	1. Works with wait_for_completion()/complete().
	2. Works with 'wait' on PG_locked.
	3. Works with 'wait' on PG_writeback.
	4. Works with swait/wakeup.
	5. Works with waitqueue.
	6. Multiple reports are allowed.
	7. Deduplication control on multiple reports.
	8. Withstand false positives thanks to 6.
	9. Easy to tag any wait/event.

Future work:

	0. To make it more stable.
	1. To separates Dept from Lockdep.
	2. To improves performance in terms of time and space.
	3. To use Dept as a dependency engine for Lockdep.
	4. To add any missing tags of wait/event in the kernel.
	5. To deduplicate stack trace.

How to interpret reports:

	1. E(event) in each context cannot be triggered because of the
	   W(wait) that cannot be woken.
	2. The stack trace helping find the problematic code is located
	   in each conext's detail.

Thanks,
Byungchul

---

Changes from v5:

	1. Use just pr_warn_once() rather than WARN_ONCE() on the lack
	   of internal resources because WARN_*() printing stacktrace is
	   too much for informing the lack. (feedback from Ted, Hyeonggon)
	2. Fix trivial bugs like missing initializing a struct before
	   using it.
	3. Assign a different class per task when handling onstack
	   variables for waitqueue or the like. Which makes Dept
	   distinguish between onstack variables of different tasks so
	   as to prevent false positives. (reported by Hyeonggon)
	4. Make Dept aware of even raw_local_irq_*() to prevent false
	   positives. (reported by Hyeonggon)
	5. Don't consider dependencies between the events that might be
	   triggered within __schedule() and the waits that requires
	    __schedule(), real ones. (reported by Hyeonggon)
	6. Unstage the staged wait that has prepare_to_wait_event()'ed
	   *and* yet to get to __schedule(), if we encounter __schedule()
	   in-between for another sleep, which is possible if e.g. a
	   mutex_lock() exists in 'condition' of ___wait_event().
	7. Turn on CONFIG_PROVE_LOCKING when CONFIG_DEPT is on, to rely
	   on the hardirq and softirq entrance tracing to make Dept more
	   portable for now.

Changes from v4:

	1. Fix some bugs that produce false alarms.
	2. Distinguish each syscall context from another *for arm64*.
	3. Make it not warn it but just print it in case Dept ring
	   buffer gets exhausted. (feedback from Hyeonggon)
	4. Explicitely describe "EXPERIMENTAL" and "Dept might produce
	   false positive reports" in Kconfig. (feedback from Ted)

Changes from v3:

	1. Dept shouldn't create dependencies between different depths
	   of a class that were indicated by *_lock_nested(). Dept
	   normally doesn't but it does once another lock class comes
	   in. So fixed it. (feedback from Hyeonggon)
	2. Dept considered a wait as a real wait once getting to
	   __schedule() even if it has been set to TASK_RUNNING by wake
	   up sources in advance. Fixed it so that Dept doesn't consider
	   the case as a real wait. (feedback from Jan Kara)
	3. Stop tracking dependencies with a map once the event
	   associated with the map has been handled. Dept will start to
	   work with the map again, on the next sleep.

Changes from v2:

	1. Disable Dept on bit_wait_table[] in sched/wait_bit.c
	   reporting a lot of false positives, which is my fault.
	   Wait/event for bit_wait_table[] should've been tagged in a
	   higher layer for better work, which is a future work.
	   (feedback from Jan Kara)
	2. Disable Dept on crypto_larval's completion to prevent a false
	   positive.

Changes from v1:

	1. Fix coding style and typo. (feedback from Steven)
	2. Distinguish each work context from another in workqueue.
	3. Skip checking lock acquisition with nest_lock, which is about
	   correct lock usage that should be checked by Lockdep.

Changes from RFC(v0):

	1. Prevent adding a wait tag at prepare_to_wait() but __schedule().
	   (feedback from Linus and Matthew)
	2. Use try version at lockdep_acquire_cpus_lock() annotation.
	3. Distinguish each syscall context from another.

Byungchul Park (21):
  llist: Move llist_{head,node} definition to types.h
  dept: Implement Dept(Dependency Tracker)
  dept: Apply Dept to spinlock
  dept: Apply Dept to mutex families
  dept: Apply Dept to rwlock
  dept: Apply Dept to wait_for_completion()/complete()
  dept: Apply Dept to seqlock
  dept: Apply Dept to rwsem
  dept: Add proc knobs to show stats and dependency graph
  dept: Introduce split map concept and new APIs for them
  dept: Apply Dept to wait/event of PG_{locked,writeback}
  dept: Apply SDT to swait
  dept: Apply SDT to wait(waitqueue)
  locking/lockdep, cpu/hotplus: Use a weaker annotation in AP thread
  dept: Distinguish each syscall context from another
  dept: Distinguish each work from another
  dept: Disable Dept within the wait_bit layer by default
  dept: Disable Dept on struct crypto_larval's completion for now
  dept: Differentiate onstack maps from others of different tasks in
    class
  dept: Do not add dependencies between events within scheduler and
    sleeps
  dept: Unstage wait when tagging a normal sleep wait

 arch/arm64/kernel/syscall.c        |    2 +
 arch/x86/entry/common.c            |    4 +
 crypto/api.c                       |    7 +-
 include/linux/completion.h         |   44 +-
 include/linux/dept.h               |  596 ++++++++
 include/linux/dept_page.h          |   78 +
 include/linux/dept_sdt.h           |   67 +
 include/linux/hardirq.h            |    3 +
 include/linux/irqflags.h           |   71 +-
 include/linux/llist.h              |    8 -
 include/linux/lockdep.h            |  186 ++-
 include/linux/lockdep_types.h      |    3 +
 include/linux/mutex.h              |   22 +
 include/linux/page-flags.h         |   45 +-
 include/linux/pagemap.h            |    7 +-
 include/linux/percpu-rwsem.h       |    4 +-
 include/linux/rtmutex.h            |    1 +
 include/linux/rwlock.h             |   42 +
 include/linux/rwlock_api_smp.h     |    8 +-
 include/linux/rwlock_types.h       |    1 +
 include/linux/rwsem.h              |   22 +
 include/linux/sched.h              |    7 +
 include/linux/seqlock.h            |   60 +-
 include/linux/spinlock.h           |   21 +
 include/linux/spinlock_types_raw.h |    3 +
 include/linux/swait.h              |    4 +
 include/linux/types.h              |    8 +
 include/linux/wait.h               |    6 +-
 init/init_task.c                   |    2 +
 init/main.c                        |    4 +
 kernel/Makefile                    |    1 +
 kernel/cpu.c                       |    2 +-
 kernel/dependency/Makefile         |    4 +
 kernel/dependency/dept.c           | 2938 ++++++++++++++++++++++++++++++++++++
 kernel/dependency/dept_hash.h      |   10 +
 kernel/dependency/dept_internal.h  |   26 +
 kernel/dependency/dept_object.h    |   13 +
 kernel/dependency/dept_proc.c      |   92 ++
 kernel/exit.c                      |    7 +
 kernel/fork.c                      |    2 +
 kernel/locking/lockdep.c           |   28 +-
 kernel/locking/spinlock_rt.c       |   24 +-
 kernel/module.c                    |    2 +
 kernel/sched/completion.c          |   12 +-
 kernel/sched/core.c                |   10 +
 kernel/sched/swait.c               |   10 +
 kernel/sched/wait.c                |   16 +
 kernel/sched/wait_bit.c            |    5 +-
 kernel/workqueue.c                 |    3 +
 lib/Kconfig.debug                  |   28 +
 mm/filemap.c                       |   68 +
 mm/page_ext.c                      |    5 +
 52 files changed, 4558 insertions(+), 84 deletions(-)
 create mode 100644 include/linux/dept.h
 create mode 100644 include/linux/dept_page.h
 create mode 100644 include/linux/dept_sdt.h
 create mode 100644 kernel/dependency/Makefile
 create mode 100644 kernel/dependency/dept.c
 create mode 100644 kernel/dependency/dept_hash.h
 create mode 100644 kernel/dependency/dept_internal.h
 create mode 100644 kernel/dependency/dept_object.h
 create mode 100644 kernel/dependency/dept_proc.c

-- 
1.9.1

