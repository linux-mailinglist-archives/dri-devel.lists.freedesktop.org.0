Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A97BC7B61
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 09:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF58110E931;
	Thu,  9 Oct 2025 07:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="EkdX5s2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com
 (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com
 [35.83.148.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDD910E843;
 Wed,  8 Oct 2025 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1759937409; x=1791473409;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6cTKEV+ZWAzAeKhYDhuZKam17XzSPB7XFB7f4qhxTuM=;
 b=EkdX5s2tLbOjIdVoBR/fdVIPdFmvTQ3HokleyTqmIIYAbQFb7xCp0EBS
 ToyPi1EjghnPvrsB0QYA7H1RD3x1nlutb+vK8PiEVpTaLZtHJiquwa3D7
 uASWKsPHvPteR9CD0Kq+pqP7GdThtycTgk+Yx93hqAxKKB1hyukWCF1L4
 dqQjwr66JDWab9yTMFxGRx+dVYO6f+4Gk7rix5/u0Oe2/TaScMZOjqs3s
 FBcL2iaJ26yWluRRSB2ITJJbHPtBU9k/Zqowjrj4/EqhxJyXXk0O/yqgs
 kXb4X1ttPos/wzZiRgUS69mvbAl0C9DmbAdfeh3NsngYP/BoXp1s2UtS5 g==;
X-CSE-ConnectionGUID: +r/ORJCDT3mdkeM9bLhVCA==
X-CSE-MsgGUID: 5xwXbkFvQYqm5UYp+BBs7A==
X-IronPort-AV: E=Sophos;i="6.19,213,1754956800"; 
   d="scan'208";a="4330400"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO
 smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
 by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 15:30:06 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.38.20:22420]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.27.3:2525] with
 esmtp (Farcaster)
 id 93ca9f84-9d14-4911-90f5-a97300a639c2; Wed, 8 Oct 2025 15:30:06 +0000 (UTC)
X-Farcaster-Flow-ID: 93ca9f84-9d14-4911-90f5-a97300a639c2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 8 Oct 2025 15:30:05 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Wed, 8 Oct 2025
 15:29:52 +0000
From: Eliav Farber <farbere@amazon.com>
To: <gregkh@linuxfoundation.org>, <jdike@addtoit.com>, <richard@nod.at>,
 <anton.ivanov@cambridgegreys.com>, <dave.hansen@linux.intel.com>,
 <luto@kernel.org>, <peterz@infradead.org>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>,
 <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>, <james.morse@arm.com>,
 <rric@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robdclark@gmail.com>, <sean@poorly.run>,
 <jdelvare@suse.com>, <linux@roeck-us.net>, <linus.walleij@linaro.org>,
 <dmitry.torokhov@gmail.com>, <maz@kernel.org>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <agk@redhat.com>, <snitzer@redhat.com>,
 <dm-devel@redhat.com>, <davem@davemloft.net>, <kuba@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@canonical.com>,
 <malattia@linux.it>, <hdegoede@redhat.com>, <mgross@linux.intel.com>,
 <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
 <sakari.ailus@linux.intel.com>, <clm@fb.com>, <josef@toxicpanda.com>,
 <dsterba@suse.com>, <jack@suse.com>, <tytso@mit.edu>,
 <adilger.kernel@dilger.ca>, <dushistov@mail.ru>,
 <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>, <pmladek@suse.com>,
 <senozhatsky@chromium.org>, <andriy.shevchenko@linux.intel.com>,
 <linux@rasmusvillemoes.dk>, <minchan@kernel.org>, <ngupta@vflare.org>,
 <akpm@linux-foundation.org>, <yoshfuji@linux-ipv6.org>, <dsahern@kernel.org>, 
 <pablo@netfilter.org>, <kadlec@netfilter.org>, <fw@strlen.de>,
 <jmaloy@redhat.com>, <ying.xue@windriver.com>, <shuah@kernel.org>,
 <willy@infradead.org>, <farbere@amazon.com>, <sashal@kernel.org>,
 <quic_akhilpo@quicinc.com>, <ruanjinjie@huawei.com>,
 <David.Laight@ACULAB.COM>, <herve.codina@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-um@lists.infradead.org>, <linux-edac@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>, <linux-media@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>,
 <linux-ext4@vger.kernel.org>, <linux-sparse@vger.kernel.org>,
 <linux-mm@kvack.org>, <netfilter-devel@vger.kernel.org>,
 <coreteam@netfilter.org>, <tipc-discussion@lists.sourceforge.net>,
 <linux-kselftest@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH v3 00/19 5.15.y] Backport minmax.h updates from v6.17-rc7
Date: Wed, 8 Oct 2025 15:29:25 +0000
Message-ID: <20251008152946.29285-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D032UWA001.ant.amazon.com (10.13.139.62) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Mailman-Approved-At: Thu, 09 Oct 2025 07:29:03 +0000
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

This series backports 19 patches to update minmax.h in the 5.15.y branch,
aligning it with v6.17-rc7.

The ultimate goal is to synchronize all longterm branches so that they
include the full set of minmax.h changes.

6.12.y was already backported and changes are part of v6.12.49.
6.6.y was already backported and changes are part of v6.6.109.
6.1.y was already backported and changes are currently in the 6.1-stable
tree.

The key motivation is to bring in commit d03eba99f5bf ("minmax: allow
min()/max()/clamp() if the arguments have the same signedness"), which
is missing in kernel 5.10.y.

In mainline, this change enables min()/max()/clamp() to accept mixed
argument types, provided both have the same signedness. Without it,
backported patches that use these forms may trigger compiler warnings,
which escalate to build failures when -Werror is enabled.

Changes in v3:
- Fix fs/erofs/zdata.h in patch 06/19 to use MIN_T instead of min_t to
  fix build on the following patch (07/19):
In file included from ./include/linux/kernel.h:16,
                 from ./include/linux/list.h:9,
                 from ./include/linux/wait.h:7,
                 from ./include/linux/wait_bit.h:8,
                 from ./include/linux/fs.h:6,
                 from fs/erofs/internal.h:10,
                 from fs/erofs/zdata.h:9,
                 from fs/erofs/zdata.c:6:
fs/erofs/zdata.c: In function ‘z_erofs_decompress_pcluster’:
fs/erofs/zdata.h:185:61: error: ISO C90 forbids variable length array ‘pages_onstack’ [-Werror=vla]
  185 |         min_t(unsigned int, THREAD_SIZE / 8 / sizeof(struct page *), 96U)
      |                                                             ^~~~
./include/linux/minmax.h:49:23: note: in definition of macro ‘__cmp_once_unique’
   49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
      |                       ^
./include/linux/minmax.h:164:27: note: in expansion of macro ‘__cmp_once’
  164 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
      |                           ^~~~~~~~~~
fs/erofs/zdata.h:185:9: note: in expansion of macro ‘min_t’
  185 |         min_t(unsigned int, THREAD_SIZE / 8 / sizeof(struct page *), 96U)
      |         ^~~~~
fs/erofs/zdata.c:847:36: note: in expansion of macro ‘Z_EROFS_VMAP_ONSTACK_PAGES’
  847 |         struct page *pages_onstack[Z_EROFS_VMAP_ONSTACK_PAGES];
      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

- Increase test coverage using `make allyesconfig` and
  `make allmodconfig` for arm64, arm, x86_64 and i386 architectures.

Changes in v2:
- Fix the order of patches 6 - 10 according to order in mainline branch.
- Use same style of [ Upstream commit <HASH> ] in all patches.

Andy Shevchenko (1):
  minmax: deduplicate __unconst_integer_typeof()

David Laight (8):
  minmax: fix indentation of __cmp_once() and __clamp_once()
  minmax.h: add whitespace around operators and after commas
  minmax.h: update some comments
  minmax.h: reduce the #define expansion of min(), max() and clamp()
  minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
  minmax.h: move all the clamp() definitions after the min/max() ones
  minmax.h: simplify the variants of clamp()
  minmax.h: remove some #defines that are only expanded once

Herve Codina (1):
  minmax: Introduce {min,max}_array()

Linus Torvalds (8):
  minmax: avoid overly complicated constant expressions in VM code
  minmax: add a few more MIN_T/MAX_T users
  minmax: simplify and clarify min_t()/max_t() implementation
  minmax: make generic MIN() and MAX() macros available everywhere
  minmax: don't use max() in situations that want a C constant
    expression
  minmax: simplify min()/max()/clamp() implementation
  minmax: improve macro expansion and type checking
  minmax: fix up min3() and max3() too

Matthew Wilcox (Oracle) (1):
  minmax: add in_range() macro

 arch/arm/mm/pageattr.c                        |   6 +-
 arch/um/drivers/mconsole_user.c               |   2 +
 arch/x86/mm/pgtable.c                         |   2 +-
 drivers/edac/sb_edac.c                        |   4 +-
 drivers/edac/skx_common.h                     |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 .../drm/amd/display/modules/hdcp/hdcp_ddc.c   |   2 +
 .../drm/amd/pm/powerplay/hwmgr/ppevvmath.h    |  14 +-
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |   2 +
 .../drm/arm/display/include/malidp_utils.h    |   2 +-
 .../display/komeda/komeda_pipeline_state.c    |  24 +-
 drivers/gpu/drm/drm_color_mgmt.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   6 -
 drivers/gpu/drm/radeon/evergreen_cs.c         |   2 +
 drivers/hwmon/adt7475.c                       |  24 +-
 drivers/input/touchscreen/cyttsp4_core.c      |   2 +-
 drivers/irqchip/irq-sun6i-r.c                 |   2 +-
 drivers/md/dm-integrity.c                     |   4 +-
 drivers/media/dvb-frontends/stv0367_priv.h    |   3 +
 .../net/ethernet/chelsio/cxgb3/cxgb3_main.c   |  18 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   2 +-
 drivers/net/fjes/fjes_main.c                  |   4 +-
 drivers/nfc/pn544/i2c.c                       |   2 -
 drivers/platform/x86/sony-laptop.c            |   1 -
 drivers/scsi/isci/init.c                      |   6 +-
 .../pci/hive_isp_css_include/math_support.h   |   5 -
 drivers/virt/acrn/ioreq.c                     |   4 +-
 fs/btrfs/misc.h                               |   2 -
 fs/btrfs/tree-checker.c                       |   2 +-
 fs/erofs/zdata.h                              |   2 +-
 fs/ext2/balloc.c                              |   2 -
 fs/ext4/ext4.h                                |   2 -
 fs/ufs/util.h                                 |   6 -
 include/linux/compiler.h                      |   9 +
 include/linux/minmax.h                        | 264 +++++++++++++-----
 kernel/trace/preemptirq_delay_test.c          |   2 -
 lib/btree.c                                   |   1 -
 lib/decompress_unlzma.c                       |   2 +
 lib/logic_pio.c                               |   3 -
 lib/vsprintf.c                                |   2 +-
 lib/zstd/zstd_internal.h                      |   2 -
 mm/zsmalloc.c                                 |   1 -
 net/ipv4/proc.c                               |   2 +-
 net/ipv6/proc.c                               |   2 +-
 net/netfilter/nf_nat_core.c                   |   6 +-
 net/tipc/core.h                               |   2 +-
 net/tipc/link.c                               |  10 +-
 tools/testing/selftests/vm/mremap_test.c      |   2 +
 48 files changed, 290 insertions(+), 184 deletions(-)

-- 
2.47.3

