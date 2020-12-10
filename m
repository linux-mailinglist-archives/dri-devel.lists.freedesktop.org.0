Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26032D7183
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B646EC9A;
	Fri, 11 Dec 2020 08:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06EE6EB17;
 Thu, 10 Dec 2020 19:42:18 +0000 (UTC)
Message-Id: <20201210194042.703779349@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=xNUoZoBVroF7IJy3X8hhV7V+S/ANMxwK+r48iZvHH7k=;
 b=SuZCyt4zlNSkg7Jh6xjd5t+bljnkIDhiuE1rhn/qKeMG+ite6vJEiEbNofXy6Jc8tYg+0b
 IECvv2LjnWcGzCS6R2c2tg4sgQpGcjXByKLBZPL7Xs4OwNUUaKF820w3Ic1JKPFWbxYaV/
 zQxlwp4rnzD+WzTiaw91J+4L7iQQ+SR32KSqZT854CLAJKIIUHqBcwUh01vq4gYJysHS9U
 2YuIdbPutXAYf6qxYXI8k/N2s6EcL8OojQbYBV3yqFeMwoY5o0cLfzqE9P8/gw+P+igDVq
 lKj3W3wk7xu1ziy9h34ybqOITt3G9Oy0XdV3S2Ut5Fvm8NWwxziMLNP2XRk3vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=xNUoZoBVroF7IJy3X8hhV7V+S/ANMxwK+r48iZvHH7k=;
 b=VHoSRskFC2dXgfT8CV99ZHE5BpRPUfLU6nfE7o3PMPrsIEKWqDmtgbLpWFRMlRZjjTeINe
 qsFjW8cMZ9WikxCw==
Date: Thu, 10 Dec 2020 20:25:38 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 02/30] genirq: Move status flag checks to core
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

These checks are used by modules and prevent the removal of the export of
irq_to_desc(). Move the accessor into the core.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/irqdesc.h |   17 +++++------------
 kernel/irq/manage.c     |   17 +++++++++++++++++
 2 files changed, 22 insertions(+), 12 deletions(-)

--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -223,28 +223,21 @@ irq_set_chip_handler_name_locked(struct
 	data->chip = chip;
 }
 
+bool irq_check_status_bit(unsigned int irq, unsigned int bitmask);
+
 static inline bool irq_balancing_disabled(unsigned int irq)
 {
-	struct irq_desc *desc;
-
-	desc = irq_to_desc(irq);
-	return desc->status_use_accessors & IRQ_NO_BALANCING_MASK;
+	return irq_check_status_bit(irq, IRQ_NO_BALANCING_MASK);
 }
 
 static inline bool irq_is_percpu(unsigned int irq)
 {
-	struct irq_desc *desc;
-
-	desc = irq_to_desc(irq);
-	return desc->status_use_accessors & IRQ_PER_CPU;
+	return irq_check_status_bit(irq, IRQ_PER_CPU);
 }
 
 static inline bool irq_is_percpu_devid(unsigned int irq)
 {
-	struct irq_desc *desc;
-
-	desc = irq_to_desc(irq);
-	return desc->status_use_accessors & IRQ_PER_CPU_DEVID;
+	return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
 }
 
 static inline void
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2769,3 +2769,23 @@ bool irq_has_action(unsigned int irq)
 	return res;
 }
 EXPORT_SYMBOL_GPL(irq_has_action);
+
+/**
+ * irq_check_status_bit - Check whether bits in the irq descriptor status are set
+ * @irq:	The linux irq number
+ * @bitmask:	The bitmask to evaluate
+ *
+ * Returns: True if one of the bits in @bitmask is set
+ */
+bool irq_check_status_bit(unsigned int irq, unsigned int bitmask)
+{
+	struct irq_desc *desc;
+	bool res = false;
+
+	rcu_read_lock();
+	desc = irq_to_desc(irq);
+	if (desc)
+		res = !!(desc->status_use_accessors & bitmask);
+	rcu_read_unlock();
+	return res;
+}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
