Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00866BB4C3B
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 20:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C1810E831;
	Thu,  2 Oct 2025 18:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="ifOX4dUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 (fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 [52.28.197.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3252110E831;
 Thu,  2 Oct 2025 18:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1759428068; x=1790964068;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=epU/uuRCc6FYveB1XcTu+0zfQVVGTvdnWiBQH/N2XKE=;
 b=ifOX4dUtJIhTrl2yrP126dexft5DtHXGu50OaTxfaRkefWlEU+A68X9n
 l4XAWHvEe9Gj11NvBwF+o3dI3SHBt8nVmdKlTyRGlDd/K18Ntf42nElCo
 3D9I98U5Ca2BExji2Ur/mqd0qPU8g7hQknhgylh09Z8gjw8AfKq8Ibo7r
 atDYBwNQwHGIOczNrOYN1qtF8/+uNdNqeqPCPKiXjyJjaiPQcrlWUoAvA
 Rbxn0z69mTR0usoZSszfKyjlj+1T4hoAciOqdREYbSAgVVATAk3iuu56h
 9qAlbljfIFelpIzAR3JMm0Qvkefl0Zhp3JZjAsGOQSkoXaMFOnlwPRioV Q==;
X-CSE-ConnectionGUID: 4wc7erOoTsG+zcDi3lQiWg==
X-CSE-MsgGUID: 2gKb5OADRGepv9G3AIxECQ==
X-IronPort-AV: E=Sophos;i="6.18,310,1751241600"; 
   d="scan'208";a="2922661"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 18:00:57 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:16626]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.22.27:2525]
 with esmtp (Farcaster)
 id 6ebc8389-d59d-4539-8dfb-efa782bd8e1d; Thu, 2 Oct 2025 18:00:57 +0000 (UTC)
X-Farcaster-Flow-ID: 6ebc8389-d59d-4539-8dfb-efa782bd8e1d
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Thu, 2 Oct 2025 18:00:52 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Thu, 2 Oct 2025
 18:00:42 +0000
From: Eliav Farber <farbere@amazon.com>
To: <gregkh@linuxfoundation.org>, <kenneth.feng@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <linus.walleij@linaro.org>, <dmitry.torokhov@gmail.com>,
 <tglx@linutronix.de>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>,
 <mpatocka@redhat.com>, <clm@fb.com>, <dsterba@suse.com>,
 <luc.vanoostenryck@gmail.com>, <pmladek@suse.com>, <rostedt@goodmis.org>,
 <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>,
 <senozhatsky@chromium.org>, <akpm@linux-foundation.org>,
 <lijo.lazar@amd.com>, <asad.kamal@amd.com>, <kevinyang.wang@amd.com>,
 <David.Laight@ACULAB.COM>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <dm-devel@lists.linux.dev>,
 <linux-btrfs@vger.kernel.org>, <linux-sparse@vger.kernel.org>,
 <stable@vger.kernel.org>, <farbere@amazon.com>
Subject: [PATCH v3 00/11 6.1.y] Backport minmax.h updates from v6.17-rc7
Date: Thu, 2 Oct 2025 18:00:18 +0000
Message-ID: <20251002180036.33738-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D036UWC003.ant.amazon.com (10.13.139.214) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
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

This series backports 13 patches to update minmax.h in the 6.1.y branch,
aligning it with v6.17-rc7.

The ultimate goal is to synchronize all longterm branches so that they
include the full set of minmax.h changes (6.12.y and 6.6.y were already
backported by me and are now ligned).

The key motivation is to bring in commit d03eba99f5bf ("minmax: allow
min()/max()/clamp() if the arguments have the same signedness"), which
is missing in older kernels.

In mainline, this change enables min()/max()/clamp() to accept mixed
argument types, provided both have the same signedness. Without it,
backported patches that use these forms may trigger compiler warnings,
which escalate to build failures when -Werror is enabled.

Changes in v3:
- v2 included 13 patches:
  https://lore.kernel.org/stable/20250929183358.18982-1-farbere@amazon.com/
- First 2 were accepted and are part of 6.1.155.
- 3rd caused build in drivers/md/ to fail:

In file included from ./include/linux/container_of.h:5,
                 from ./include/linux/list.h:5,
                 from ./include/linux/wait.h:7,
                 from ./include/linux/mempool.h:8,
                 from ./include/linux/bio.h:8,
                 from drivers/md/dm-bio-record.h:10,
                 from drivers/md/dm-integrity.c:9:
drivers/md/dm-integrity.c: In function ‘integrity_metadata’:
drivers/md/dm-integrity.c:131:105: error: ISO C90 forbids variable length array ‘checksums_onstack’ [-Werror=vla]
  131 | #define MAX_TAG_SIZE                    (JOURNAL_SECTOR_DATA - JOURNAL_MAC_PER_SECTOR - offsetof(struct journal_entry, last_bytes[MAX_SECTORS_PER_BLOCK]))
      |                                                                                                         ^~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/minmax.h:56:9: note: in expansion of macro ‘static_assert’
   56 |         static_assert(__types_ok(x, y, ux, uy),         \
      |         ^~~~~~~~~~~~~
./include/linux/minmax.h:41:31: note: in expansion of macro ‘__is_noneg_int’
   41 |          __is_noneg_int(x) || __is_noneg_int(y))
      |                               ^~~~~~~~~~~~~~
./include/linux/minmax.h:56:23: note: in expansion of macro ‘__types_ok’
   56 |         static_assert(__types_ok(x, y, ux, uy),         \
      |                       ^~~~~~~~~~
./include/linux/minmax.h:61:9: note: in expansion of macro ‘__careful_cmp_once’
   61 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/minmax.h:92:25: note: in expansion of macro ‘__careful_cmp’
   92 | #define max(x, y)       __careful_cmp(max, x, y)
      |                         ^~~~~~~~~~~~~
drivers/md/dm-integrity.c:1797:40: note: in expansion of macro ‘max’
 1797 |                 char checksums_onstack[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
      |                                        ^~~
drivers/md/dm-integrity.c:131:89: note: in expansion of macro ‘offsetof’
  131 | #define MAX_TAG_SIZE                    (JOURNAL_SECTOR_DATA - JOURNAL_MAC_PER_SECTOR - offsetof(struct journal_entry, last_bytes[MAX_SECTORS_PER_BLOCK]))
      |                                                                                         ^~~~~~~~
drivers/md/dm-integrity.c:1797:73: note: in expansion of macro ‘MAX_TAG_SIZE’
 1797 |                 char checksums_onstack[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
      |                                                                         ^~~~~~~~~~~~

- The build was fixed in the second patch of this series.

Changes in v2:
- v1 included 19 patches:
  https://lore.kernel.org/stable/20250924202320.32333-1-farbere@amazon.com/
- First 6 were pushed to the stable-tree.
- 7th cauded amd driver's build to fail.
- This change fixes it.
- Modified files:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h
   drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
   drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
   drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c

David Laight (7):
  minmax.h: add whitespace around operators and after commas
  minmax.h: update some comments
  minmax.h: reduce the #define expansion of min(), max() and clamp()
  minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
  minmax.h: move all the clamp() definitions after the min/max() ones
  minmax.h: simplify the variants of clamp()
  minmax.h: remove some #defines that are only expanded once

Linus Torvalds (4):
  minmax: simplify min()/max()/clamp() implementation
  minmax: don't use max() in situations that want a C constant
    expression
  minmax: improve macro expansion and type checking
  minmax: fix up min3() and max3() too

 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c   |   2 +-
 drivers/input/touchscreen/cyttsp4_core.c |   2 +-
 drivers/irqchip/irq-sun6i-r.c            |   2 +-
 drivers/md/dm-integrity.c                |   2 +-
 fs/btrfs/tree-checker.c                  |   2 +-
 include/linux/compiler.h                 |   9 +
 include/linux/minmax.h                   | 222 +++++++++++++----------
 lib/vsprintf.c                           |   2 +-
 8 files changed, 143 insertions(+), 100 deletions(-)

-- 
2.47.3

