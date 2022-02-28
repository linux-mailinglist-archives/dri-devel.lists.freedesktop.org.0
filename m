Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3666E4C663A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 10:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1466210E30B;
	Mon, 28 Feb 2022 09:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id 56FCD10E29C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 09:57:20 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.51 with ESMTP; 28 Feb 2022 18:57:18 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 28 Feb 2022 18:57:18 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH v3 00/21] DEPT(Dependency Tracker)
Date: Mon, 28 Feb 2022 18:56:39 +0900
Message-Id: <1646042220-28952-1-git-send-email-byungchul.park@lge.com>
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
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
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

I didn't want to bother you so I was planning to send the next spin
after making more progress. However, PATCH v2 reports too many false
positives because Dept tracked the bit_wait_table[] wrong way - I
apologize for that. So I decided to send PATCH v3 first before going
further for those who want to run Dept for now.

There might still be some false positives but not overwhelming.

---

Hi Linus and folks,

I've been developing a tool for detecting deadlock possibilities by
tracking wait/event rather than lock(?) acquisition order to try to
cover all synchonization machanisms. It's done on v5.17-rc1 tag.

https://github.com/lgebyungchulpark/linux-dept/commits/dept1.14_on_v5.17-rc1

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

Changes from RFC:

	1. Prevent adding a wait tag at prepare_to_wait() but __schedule().
	   (feedback from Linus and Matthew)
	2. Use try version at lockdep_acquire_cpus_lock() annotation.
	3. Distinguish each syscall context from another.

Byungchul Park (21):
  llist: Move llist_{head,node} definition to types.h
  dept: Implement Dept(Dependency Tracker)
  dept: Embed Dept data in Lockdep
  dept: Add a API for skipping dependency check temporarily
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
  dept: Add nocheck version of init_completion()
  dept: Disable Dept on struct crypto_larval's completion for now

 crypto/api.c                       |    7 +-
 include/linux/completion.h         |   50 +-
 include/linux/dept.h               |  535 +++++++
 include/linux/dept_page.h          |   78 ++
 include/linux/dept_sdt.h           |   62 +
 include/linux/hardirq.h            |    3 +
 include/linux/irqflags.h           |   33 +-
 include/linux/llist.h              |    8 -
 include/linux/lockdep.h            |  158 ++-
 include/linux/lockdep_types.h      |    3 +
 include/linux/mutex.h              |   33 +
 include/linux/page-flags.h         |   45 +-
 include/linux/pagemap.h            |    7 +-
 include/linux/percpu-rwsem.h       |   10 +-
 include/linux/rtmutex.h            |    7 +
 include/linux/rwlock.h             |   52 +
 include/linux/rwlock_api_smp.h     |    8 +-
 include/linux/rwlock_types.h       |    7 +
 include/linux/rwsem.h              |   33 +
 include/linux/sched.h              |    7 +
 include/linux/seqlock.h            |   59 +-
 include/linux/spinlock.h           |   26 +
 include/linux/spinlock_types_raw.h |   13 +
 include/linux/swait.h              |    4 +
 include/linux/types.h              |    8 +
 include/linux/wait.h               |    6 +-
 init/init_task.c                   |    2 +
 init/main.c                        |    4 +
 kernel/Makefile                    |    1 +
 kernel/cpu.c                       |    2 +-
 kernel/dependency/Makefile         |    4 +
 kernel/dependency/dept.c           | 2712 ++++++++++++++++++++++++++++++++++++
 kernel/dependency/dept_hash.h      |   10 +
 kernel/dependency/dept_internal.h  |   26 +
 kernel/dependency/dept_object.h    |   13 +
 kernel/dependency/dept_proc.c      |   92 ++
 kernel/entry/common.c              |    3 +
 kernel/exit.c                      |    1 +
 kernel/fork.c                      |    2 +
 kernel/locking/lockdep.c           |   12 +-
 kernel/module.c                    |    2 +
 kernel/sched/completion.c          |   12 +-
 kernel/sched/core.c                |    3 +
 kernel/sched/swait.c               |   10 +
 kernel/sched/wait.c                |   16 +
 kernel/sched/wait_bit.c            |    5 +-
 kernel/softirq.c                   |    6 +-
 kernel/trace/trace_preemptirq.c    |   19 +-
 kernel/workqueue.c                 |    3 +
 lib/Kconfig.debug                  |   21 +
 mm/filemap.c                       |   68 +
 mm/page_ext.c                      |    5 +
 52 files changed, 4257 insertions(+), 59 deletions(-)
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

