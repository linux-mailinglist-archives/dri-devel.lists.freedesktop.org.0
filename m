Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA63A672162
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFC310E76C;
	Wed, 18 Jan 2023 15:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89B210E76C;
 Wed, 18 Jan 2023 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674056149; x=1705592149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V+7w/6DVh6oOTj/5Q6BI82PHATnPnRgB/JN4Ard83Dk=;
 b=Gz57egnTY6YYvqlojEwpjGrMBhV4JoVeqKWN6u8gYUt037QbG2cfm5L4
 GnscKpY2cJlEC+u0BFtiv5lTlyH05XcpZeIGFBtX3mWP5QgiAVrijE7H0
 yBRkLQsBmy7y396IZuGRu0Qz/89PlSDT9PHKJDoYna47pdBzTi3aL6KQH
 HdQPVFUsdVwDoKmTwZ/gHuwg55DllH6h8lTEFSJgyQIbrji8tBzrmVZEm
 lVQ2QCb8uEJvcp1+GlGS5aOJzQ/OYg+65HXarOgZbUt92144zIdo6oq66
 MsPYvODbjMjuNlfX8veHhn4BA77mS/+JPU13yj6/ufzu5hdD/ElZyMC83 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="305381645"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="305381645"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:35:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833614590"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="833614590"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:35:41 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
Date: Wed, 18 Jan 2023 16:35:22 +0100
Message-Id: <20230118153529.57695-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The helper is tiny and there are advices we can live without it, so
I want to present few arguments why it would be good to have it:

1. Code readability/simplification/number of lines:
  - decreases number of lines,
  - it often eliminates local variables,
  - for real examples see patches 3+.

2. Presence of similar helpers in other somehow related languages/libs:

a) Rust[1]: 'replace' from std::mem module, there is also 'take'
    helper (__xchg(&x, 0)), which is the same as private helper in
    i915 - fetch_and_zero, see latest patch.
b) C++ [2]: 'exchange' from utility header.

If the idea is OK there are still 2 questions to answer:

1. Name of the helper, __xchg follows kernel conventions,
    but for me Rust names are also OK.
2. Where to put the helper:
a) as in this patchset include/linux/non-atomic/xchg.h,
    proposed by Andy Shevchenko,
b) include/linux/utils.h ? any better name? Some kind
    of container for simple helpers.

All __xchg conversions were performed using cocci script,
then manually adjusted if necessary.

There is lot of places it can be used in, I have just chosen
some of them. I can provide cocci script to detect others (not all),
if necessary.

Changes:
v2: squashed all __xchg -> __arch_xchg t one patch (Arnd)
v3: fixed alpha/xchg_local (lkp@intel.com)
v4: adjusted indentation (Heiko)
v5: added more __xchg conversions - patches 3-6, added tags

[1]: https://doc.rust-lang.org/std/mem/index.html
[2]: https://en.cppreference.com/w/cpp/header/utility

Regards
Andrzej

Andrzej Hajda (7):
  arch: rename all internal names __xchg to __arch_xchg
  linux/include: add non-atomic version of xchg
  arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
  llist: simplify __llist_del_all
  io_uring: use __xchg if possible
  qed: use __xchg if possible
  drm/i915/gt: use __xchg instead of internal helper

 arch/alpha/include/asm/cmpxchg.h              | 10 +++++-----
 arch/arc/include/asm/cmpxchg.h                |  4 ++--
 arch/arm/include/asm/cmpxchg.h                |  7 ++++---
 arch/arm/probes/uprobes/core.c                |  8 ++------
 arch/arm64/include/asm/cmpxchg.h              |  7 +++----
 arch/arm64/kernel/probes/uprobes.c            |  9 ++-------
 arch/csky/kernel/probes/uprobes.c             |  9 ++-------
 arch/hexagon/include/asm/cmpxchg.h            | 10 +++++-----
 arch/ia64/include/asm/cmpxchg.h               |  2 +-
 arch/ia64/include/uapi/asm/cmpxchg.h          |  4 ++--
 arch/loongarch/include/asm/cmpxchg.h          |  4 ++--
 arch/m68k/include/asm/cmpxchg.h               |  6 +++---
 arch/mips/include/asm/cmpxchg.h               |  4 ++--
 arch/mips/kernel/uprobes.c                    | 10 ++--------
 arch/openrisc/include/asm/cmpxchg.h           | 10 +++++-----
 arch/parisc/include/asm/cmpxchg.h             |  4 ++--
 arch/powerpc/include/asm/cmpxchg.h            |  4 ++--
 arch/powerpc/kernel/uprobes.c                 | 10 ++--------
 arch/riscv/include/asm/atomic.h               |  2 +-
 arch/riscv/include/asm/cmpxchg.h              |  4 ++--
 arch/riscv/kernel/probes/uprobes.c            |  9 ++-------
 arch/s390/include/asm/cmpxchg.h               |  8 ++++----
 arch/s390/kernel/uprobes.c                    |  7 ++-----
 arch/sh/include/asm/cmpxchg.h                 |  4 ++--
 arch/sparc/include/asm/cmpxchg_32.h           |  4 ++--
 arch/sparc/include/asm/cmpxchg_64.h           |  6 +++---
 arch/sparc/kernel/uprobes.c                   |  7 ++-----
 arch/xtensa/include/asm/cmpxchg.h             |  4 ++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |  4 ++--
 .../drm/i915/gt/intel_execlists_submission.c  |  4 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gsc.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  6 +++---
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |  2 +-
 .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  2 +-
 drivers/gpu/drm/i915/i915_utils.h             |  1 +
 include/linux/llist.h                         |  6 ++----
 include/linux/non-atomic/xchg.h               | 19 +++++++++++++++++++
 include/linux/qed/qed_chain.h                 | 19 +++++++------------
 io_uring/io_uring.c                           |  7 ++-----
 io_uring/slist.h                              |  6 ++----
 51 files changed, 126 insertions(+), 155 deletions(-)
 create mode 100644 include/linux/non-atomic/xchg.h

-- 
2.34.1

