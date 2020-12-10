Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C337B2D7164
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92496ECA7;
	Fri, 11 Dec 2020 08:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6876EB17;
 Thu, 10 Dec 2020 19:42:18 +0000 (UTC)
Message-Id: <20201210194042.548936472@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=wCqGjbHBcSlcHWGOV/dAhxvR97JcFGNX9psmcROoCq0=;
 b=2Z0Q8lbqw2d3iK0lyMTfu6GGSIFMkE/mgVP/hAGnWOqxBRMxf5MtZTpRPSPBXz/boYfgYn
 ST6oe0NetpTwhOSarLLIdAuYLS1gydE77MQVYVcY3FouLrWnl5si1eWOJ4F95yCk0G9X60
 1VL1Pvt1tpdt2jzvXhHk1B3J4gqT2I16payytnnsVM1ae0GkKHVOkzm3mG/NvUjNMZDZ8b
 Y9sC2WWQtJSCM32DjS16A3YMAUHnAI48PATHpxuESAMuGdCfbbEW6ICvvlfOLWvLQ9S/jh
 Z+QD95xpqockzbshrRUV6G0e1FqEFRsR9IAhKZG5jK6CihEBgYA5K4ONks8gvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=wCqGjbHBcSlcHWGOV/dAhxvR97JcFGNX9psmcROoCq0=;
 b=7JxYxk/ThtDXDjNM4lO0Kv6ZI0VZ4wL2ccu9YMROMO3FB+Dn8roKKZsGAALM1EdgllUWzl
 ydzvbEXlvqdXI/CQ==
Date: Thu, 10 Dec 2020 20:25:37 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 01/30] genirq: Move irq_has_action() into core code
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

This function uses irq_to_desc() and is going to be used by modules to
replace the open coded irq_to_desc() (ab)usage. The final goal is to remove
the export of irq_to_desc() so driver cannot fiddle with it anymore.

Move it into the core code and fixup the usage sites to include the proper
header.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_jensen.c |    2 +-
 arch/x86/kernel/topology.c     |    1 +
 include/linux/interrupt.h      |    1 +
 include/linux/irqdesc.h        |    7 +------
 kernel/irq/manage.c            |   17 +++++++++++++++++
 5 files changed, 21 insertions(+), 7 deletions(-)

--- a/arch/alpha/kernel/sys_jensen.c
+++ b/arch/alpha/kernel/sys_jensen.c
@@ -7,7 +7,7 @@
  *
  * Code supporting the Jensen.
  */
-
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/mm.h>
--- a/arch/x86/kernel/topology.c
+++ b/arch/x86/kernel/topology.c
@@ -25,6 +25,7 @@
  *
  * Send feedback to <colpatch@us.ibm.com>
  */
+#include <linux/interrupt.h>
 #include <linux/nodemask.h>
 #include <linux/export.h>
 #include <linux/mmzone.h>
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -232,6 +232,7 @@ extern void devm_free_irq(struct device
 # define local_irq_enable_in_hardirq()	local_irq_enable()
 #endif
 
+bool irq_has_action(unsigned int irq);
 extern void disable_irq_nosync(unsigned int irq);
 extern bool disable_hardirq(unsigned int irq);
 extern void disable_irq(unsigned int irq);
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -179,12 +179,7 @@ int handle_domain_nmi(struct irq_domain
 /* Test to see if a driver has successfully requested an irq */
 static inline int irq_desc_has_action(struct irq_desc *desc)
 {
-	return desc->action != NULL;
-}
-
-static inline int irq_has_action(unsigned int irq)
-{
-	return irq_desc_has_action(irq_to_desc(irq));
+	return desc && desc->action != NULL;
 }
 
 /**
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2752,3 +2752,20 @@ int irq_set_irqchip_state(unsigned int i
 	return err;
 }
 EXPORT_SYMBOL_GPL(irq_set_irqchip_state);
+
+/**
+ * irq_has_action - Check whether an interrupt is requested
+ * @irq:	The linux irq number
+ *
+ * Returns: A snapshot of the current state
+ */
+bool irq_has_action(unsigned int irq)
+{
+	bool res;
+
+	rcu_read_lock();
+	res = irq_desc_has_action(irq_to_desc(irq));
+	rcu_read_unlock();
+	return res;
+}
+EXPORT_SYMBOL_GPL(irq_has_action);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
