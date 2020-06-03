Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5471EDDC1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4CC6E279;
	Thu,  4 Jun 2020 07:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710408981D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 14:50:06 +0000 (UTC)
Received: from [5.158.153.53] (helo=debian-buster-darwi.lab.linutronix.de.)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.80) (envelope-from <a.darwish@linutronix.de>)
 id 1jgUiE-0001uB-Jj; Wed, 03 Jun 2020 16:49:50 +0200
From: "Ahmed S. Darwish" <a.darwish@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v2 0/6] seqlock: seqcount_t call sites bugfixes
Date: Wed,  3 Jun 2020 16:49:43 +0200
Message-Id: <20200603144949.1122421-1-a.darwish@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
Cc: Jens Axboe <axboe@kernel.dk>, "Paul E. McKenney" <paulmck@kernel.org>,
 David Airlie <airlied@linux.ie>,
 "Sebastian A. Siewior" <bigeasy@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-block@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Vivek Goyal <vgoyal@redhat.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Since patch #7 and #8 from the series:

   [PATCH v1 00/25] seqlock: Extend seqcount API with associated locks
   https://lore.kernel.org/lkml/20200519214547.352050-1-a.darwish@linutronix.de

are now pending on the lockdep/x86 IRQ state tracking patch series:

   [PATCH 00/14] x86/entry: disallow #DB more and x86/entry lockdep/nmi
   https://lkml.kernel.org/r/20200529212728.795169701@infradead.org

   [PATCH v3 0/5] lockdep: Change IRQ state tracking to use per-cpu variables
   https://lkml.kernel.org/r/20200529213550.683440625@infradead.org

This is a repost only of the seqcount_t call sites bugfixes that were on
top of the seqlock patch series.

These fixes are independent, and can thus be merged on their own. I'm
reposting them now so they can at least hit -rc2 or -rc3.

Changelog-v2:

  - patch #1: Add a missing up_read() on netdev_get_name() error path
              exit. Thanks to Dan/kbuild-bot report.

  - patch #4: new patch, invalid preemptible context found by the new
              lockdep checks added in the seqlock series + kbuild-bot.

Thanks,

8<--------------

Ahmed S. Darwish (6):
  net: core: device_rename: Use rwsem instead of a seqcount
  net: phy: fixed_phy: Remove unused seqcount
  u64_stats: Document writer non-preemptibility requirement
  net: mdiobus: Disable preemption upon u64_stats update
  block: nr_sects_write(): Disable preemption on seqcount write
  dma-buf: Remove custom seqcount lockdep class key

 block/blk.h                    |  2 ++
 drivers/dma-buf/dma-resv.c     |  9 +------
 drivers/net/phy/fixed_phy.c    | 26 ++++++++------------
 drivers/net/phy/mdio_bus.c     |  2 ++
 include/linux/dma-resv.h       |  2 --
 include/linux/u64_stats_sync.h | 43 ++++++++++++++++++----------------
 net/core/dev.c                 | 40 ++++++++++++++-----------------
 7 files changed, 56 insertions(+), 68 deletions(-)

base-commit: 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
--
2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
