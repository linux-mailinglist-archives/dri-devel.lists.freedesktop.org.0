Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29EC2D7166
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C714C6ECBC;
	Fri, 11 Dec 2020 08:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1425A6EB17;
 Thu, 10 Dec 2020 19:42:17 +0000 (UTC)
Message-Id: <20201210192536.118432146@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dqmaBUU1aX3t41xhFMZZXhwmlvXhIHW8LZkxAL3qIuw=;
 b=h/TAwStAiTk4XvWiKPBPyDEOx218hZJC1vmF2rxVMRIvmco9q+UXf8EllPz4AjaFdOly7G
 LH+a53gOb/6x23hHUexy7zt6RJrXCLvlfH0RT7UmulMioZYuYNOHYckgeF+NjT2uTUeh+Y
 x4QOtIuHWxwLs6LKhedv+5hufAepZeedXGgORll6jDA+oynwB+JjiqXx/tgkxTCP8dbJ6L
 eWUOoe8IS6Z7h2dgCBQQBehNHm1Tfe56GXWt3TBc5qz2bsl6Xo6wT+1/DTPysSy3XD7/6K
 p0j9T2Hw/f1US+iZCI2FQmyJpu2ijKWYz9OMLgGwEfvXwTDnGAF9V1bHZmS/0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dqmaBUU1aX3t41xhFMZZXhwmlvXhIHW8LZkxAL3qIuw=;
 b=njYD6xBoyWobXQbQRXgtO58qqL+V8jLaqaWB6hUvHzVko4O9Y0w527+7oT5RC78ucYDSLL
 sPAJGjvbV9zCgIAw==
Date: Thu, 10 Dec 2020 20:25:36 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 00/30] genirq: Treewide hunt for irq descriptor abuse and
 assorted fixes
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:07 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>, David Airlie <airlied@linux.ie>,
 linux-gpio@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 intel-gfx@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A recent request to export kstat_irqs() pointed to a copy of the same in
the i915 code, which made me look for further usage of irq descriptors in
drivers.

The usage in drivers ranges from creative to broken in all colours.

irqdesc.h clearly says that this is core functionality and the fact C does
not allow full encapsulation is not a justification to fiddle with it just
because. It took us a lot of effort to make the core functionality provide
what drivers need.

If there is a shortcoming, it's not asked too much to talk to the relevant
maintainers instead of going off and fiddling with the guts of interrupt
descriptors and often enough without understanding lifetime and locking
rules.

As people insist on not respecting boundaries, this series cleans up the
(ab)use and at the end removes the export of irq_to_desc() to make it at
least harder. All legitimate users of this are built in.

While at it I stumbled over some other oddities related to interrupt
counting and cleaned them up as well.

The series applies on top of

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core

and is also available from git:

  git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git genirq

Thanks,

	tglx
---
 arch/alpha/kernel/sys_jensen.c                       |    2 
 arch/arm/kernel/smp.c                                |    2 
 arch/parisc/kernel/irq.c                             |    7 
 arch/s390/kernel/irq.c                               |    2 
 arch/x86/kernel/topology.c                           |    1 
 arch/arm64/kernel/smp.c                              |    2 
 drivers/gpu/drm/i915/display/intel_lpe_audio.c       |    4 
 drivers/gpu/drm/i915/i915_irq.c                      |   34 +++
 drivers/gpu/drm/i915/i915_pmu.c                      |   18 -
 drivers/gpu/drm/i915/i915_pmu.h                      |    8 
 drivers/mfd/ab8500-debugfs.c                         |   16 -
 drivers/net/ethernet/mellanox/mlx4/en_cq.c           |    8 
 drivers/net/ethernet/mellanox/mlx4/en_rx.c           |    6 
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h         |    3 
 drivers/net/ethernet/mellanox/mlx5/core/en.h         |    2 
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c    |    2 
 drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c    |    6 
 drivers/ntb/msi.c                                    |    4 
 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c |    8 
 drivers/pci/controller/pcie-xilinx-nwl.c             |    8 
 drivers/pinctrl/nomadik/pinctrl-nomadik.c            |    3 
 drivers/xen/events/events_base.c                     |  172 +++++++++++--------
 drivers/xen/evtchn.c                                 |   34 ---
 include/linux/interrupt.h                            |    1 
 include/linux/irq.h                                  |    7 
 include/linux/irqdesc.h                              |   40 +---
 include/linux/kernel_stat.h                          |    1 
 kernel/irq/irqdesc.c                                 |   42 ++--
 kernel/irq/manage.c                                  |   37 ++++
 kernel/irq/proc.c                                    |    5 
 30 files changed, 263 insertions(+), 222 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
