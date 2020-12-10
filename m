Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABEE2D717C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811A56ECDC;
	Fri, 11 Dec 2020 08:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851416EB44;
 Thu, 10 Dec 2020 19:42:47 +0000 (UTC)
Message-Id: <20201210194045.065115500@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=tEVls3jI8V5LtEBTs0cm0Szr6SDBh3GYqdx/X7n2UZY=;
 b=bwVQ7gaQwvbfHTgP7MZDc/YhDLMbL2OEi1WnGDxUtEPa/zAOSNbqLaLeQTtD11Dg5082Qp
 Qz2zPtGhojJeSFokGiFaFmgg8DCDEwh1sTNplvk+ABtrVMp4PQqBe9MzYq5Rmcua4Vok7H
 MC3M8vw+sJGbud8ji2De2+9/N0C9SKASfhkEKBqszbBCF+wOvRW/V0B92szqDuXVqeCKre
 YRoIqIe820JAXb6fr66VrfJCEVfdlAwTC/JagtnRSgmfc3XazagnRYgk6a6iOnmsLRNX1p
 MVTREOpKae1E6DDuEk9FawkuR3E7r4E4WNu7go88D2q5JTNminPamGP01SwVTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=tEVls3jI8V5LtEBTs0cm0Szr6SDBh3GYqdx/X7n2UZY=;
 b=oavywJTHDWv3olwcxAvfm8NfynriH4GVMpKUR3SAwF8GgtSSOX9oqiCpUNJcYYnYuyj2zl
 2KDiXd1knCZbiIAw==
Date: Thu, 10 Dec 2020 20:26:01 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 25/30] xen/events: Remove disfunct affinity spreading
References: <20201210192536.118432146@linutronix.de>
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
 Jakub Kicinski <kuba@kernel.org>, Will Deacon <will@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Heiko Carstens <hca@linux.ibm.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-gpio@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 intel-gfx@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function can only ever work when the event channels:

  - are already established
  - interrupts assigned to them
  - the affinity has been set by user space already

because any newly set up event channel is forced to be bound to CPU0 and
the affinity mask of the interrupt is forced to contain cpumask_of(0).

As the CPU0 enforcement was in place _before_ this was implemented it's
entirely unclear how that can ever have worked at all.

Remove it as preparation for doing it proper.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/events/events_base.c |    9 ---------
 drivers/xen/evtchn.c             |   34 +---------------------------------
 2 files changed, 1 insertion(+), 42 deletions(-)

--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1696,15 +1696,6 @@ static int set_affinity_irq(struct irq_d
 	return ret;
 }
 
-/* To be called with desc->lock held. */
-int xen_set_affinity_evtchn(struct irq_desc *desc, unsigned int tcpu)
-{
-	struct irq_data *d = irq_desc_get_irq_data(desc);
-
-	return set_affinity_irq(d, cpumask_of(tcpu), false);
-}
-EXPORT_SYMBOL_GPL(xen_set_affinity_evtchn);
-
 static void enable_dynirq(struct irq_data *data)
 {
 	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
--- a/drivers/xen/evtchn.c
+++ b/drivers/xen/evtchn.c
@@ -421,36 +421,6 @@ static void evtchn_unbind_from_user(stru
 	del_evtchn(u, evtchn);
 }
 
-static DEFINE_PER_CPU(int, bind_last_selected_cpu);
-
-static void evtchn_bind_interdom_next_vcpu(evtchn_port_t evtchn)
-{
-	unsigned int selected_cpu, irq;
-	struct irq_desc *desc;
-	unsigned long flags;
-
-	irq = irq_from_evtchn(evtchn);
-	desc = irq_to_desc(irq);
-
-	if (!desc)
-		return;
-
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	selected_cpu = this_cpu_read(bind_last_selected_cpu);
-	selected_cpu = cpumask_next_and(selected_cpu,
-			desc->irq_common_data.affinity, cpu_online_mask);
-
-	if (unlikely(selected_cpu >= nr_cpu_ids))
-		selected_cpu = cpumask_first_and(desc->irq_common_data.affinity,
-				cpu_online_mask);
-
-	this_cpu_write(bind_last_selected_cpu, selected_cpu);
-
-	/* unmask expects irqs to be disabled */
-	xen_set_affinity_evtchn(desc, selected_cpu);
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-}
-
 static long evtchn_ioctl(struct file *file,
 			 unsigned int cmd, unsigned long arg)
 {
@@ -508,10 +478,8 @@ static long evtchn_ioctl(struct file *fi
 			break;
 
 		rc = evtchn_bind_to_user(u, bind_interdomain.local_port);
-		if (rc == 0) {
+		if (rc == 0)
 			rc = bind_interdomain.local_port;
-			evtchn_bind_interdom_next_vcpu(rc);
-		}
 		break;
 	}
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
