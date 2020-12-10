Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953802D715F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1D56ECA5;
	Fri, 11 Dec 2020 08:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC78B6EB1C;
 Thu, 10 Dec 2020 19:42:19 +0000 (UTC)
Message-Id: <20201210194042.860029489@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=yFPV7W+/QqCKeqQACSJL6sxoKPc89zwgLkkLw3CK5Qw=;
 b=b4xfy4bgyikTmVvFd1ABIiZ73tEfKizLVhR+VIJlwT2XXEhpCUYmv0T35kedPEaKJQVpyL
 EZ6ZpzGOZ5IxdHU/m0CyhJdifeVKmZv6VHKNE7HVl9gYcZmfYEhjmMcUyrjO41XASIxwkE
 9klGh5JDf3wOEU5Ed3lPXcLem5zy/i2BIvrR40gIEa/OR0IKxYWPTy1L0gdW4vYnASDXBG
 oPlb3Y/UTUmNePPkOPES/7lQTGxRfLrcgjzM1Sg3uuPGxXkbOxvSMK9KGVtjMA1XVdJV0t
 Q4ytattWGMjEx0ecdLFwT7qCkSF6HEiYjaunGW+F6+YzwXCTRCwunCHjVGEGUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=yFPV7W+/QqCKeqQACSJL6sxoKPc89zwgLkkLw3CK5Qw=;
 b=QKWQOIKE0SKfWygdsF0p53UAxVkxHrZRTXTSBAi/APvw0tfKjTWt41c59REi77MGE+SbMx
 F6+minehzWx00+CA==
Date: Thu, 10 Dec 2020 20:25:39 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 03/30] genirq: Move irq_set_lockdep_class() to core
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

irq_set_lockdep_class() is used from modules and requires irq_to_desc() to
be exported. Move it into the core code which lifts another requirement for
the export.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/irqdesc.h |   10 ++++------
 kernel/irq/irqdesc.c    |   14 ++++++++++++++
 2 files changed, 18 insertions(+), 6 deletions(-)

--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -240,16 +240,14 @@ static inline bool irq_is_percpu_devid(u
 	return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
 }
 
+void __irq_set_lockdep_class(unsigned int irq, struct lock_class_key *lock_class,
+			     struct lock_class_key *request_class);
 static inline void
 irq_set_lockdep_class(unsigned int irq, struct lock_class_key *lock_class,
 		      struct lock_class_key *request_class)
 {
-	struct irq_desc *desc = irq_to_desc(irq);
-
-	if (desc) {
-		lockdep_set_class(&desc->lock, lock_class);
-		lockdep_set_class(&desc->request_mutex, request_class);
-	}
+	if (IS_ENABLED(CONFIG_LOCKDEP))
+		__irq_set_lockdep_class(irq, lock_class, request_class);
 }
 
 #endif
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -968,3 +968,17 @@ unsigned int kstat_irqs_usr(unsigned int
 	rcu_read_unlock();
 	return sum;
 }
+
+#ifdef CONFIG_LOCKDEP
+void __irq_set_lockdep_class(unsigned int irq, struct lock_class_key *lock_class,
+			     struct lock_class_key *request_class)
+{
+	struct irq_desc *desc = irq_to_desc(irq);
+
+	if (desc) {
+		lockdep_set_class(&desc->lock, lock_class);
+		lockdep_set_class(&desc->request_mutex, request_class);
+	}
+}
+EXPORT_SYMBOL_GPL(irq_set_lockdep_class);
+#endif

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
