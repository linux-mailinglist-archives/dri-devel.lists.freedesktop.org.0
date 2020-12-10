Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC72D717F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6575D6ECDA;
	Fri, 11 Dec 2020 08:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890626EB2C;
 Thu, 10 Dec 2020 19:42:52 +0000 (UTC)
Message-Id: <20201210194045.457218278@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=DeAXpsHXHZePk9yJlBEnvP07GAeQwVu3hbsEAC1KvV4=;
 b=1ftX1NujPl+Xx3UaWEfCXjp+Nmg07+hPgK1Itu5O9SNBHoe9yl+RQXJ/2O1zp6IsfiLibV
 HNI3oNJClnToZKNFBhedsy/3BepLS3TXsVRVkXB5G9+wE4lEck2qZ5nIFKfa87g0ab144q
 Y8XYj/VugkwqMCvECW/TpEV1x4HCWrFdBzkevGfKqOFN0SaDM1/ov3Gwx/TBks3pXmGNrv
 6QLKNAZhpAG6K+WVzFwjUhr3/uI//AlEz6mL833Dkg8c8/wOmAQ4fMPk7JfBTna6uA13Ka
 n+R9468jt6R90wHee6UQ35MxaJ9NecvbD7sk9TpDtngv50OniDJk+BnWh4ozJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=DeAXpsHXHZePk9yJlBEnvP07GAeQwVu3hbsEAC1KvV4=;
 b=RL8ukeyN4bqd9Ll57DRL2wfv9LwNl4AYd7GzKiPBhSvQTs7EEhPh2RseLXs/41XjAQfiFB
 9Mcn1n8WsG2pJ9Ag==
Date: Thu, 10 Dec 2020 20:26:05 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 29/30] xen/events: Implement irq distribution
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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

Keep track of the assignments of event channels to CPUs and select the
online CPU with the least assigned channels in the affinity mask which is
handed to irq_chip::irq_set_affinity() from the core code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/events/events_base.c |   72 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 8 deletions(-)

--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -96,6 +96,7 @@ struct irq_info {
 	struct list_head eoi_list;
 	short refcnt;
 	u8 spurious_cnt;
+	u8 is_accounted;
 	enum xen_irq_type type; /* type */
 	unsigned irq;
 	evtchn_port_t evtchn;   /* event channel */
@@ -161,6 +162,9 @@ static DEFINE_PER_CPU(int [NR_VIRQS], vi
 /* IRQ <-> IPI mapping */
 static DEFINE_PER_CPU(int [XEN_NR_IPIS], ipi_to_irq) = {[0 ... XEN_NR_IPIS-1] = -1};
 
+/* Event channel distribution data */
+static atomic_t channels_on_cpu[NR_CPUS];
+
 static int **evtchn_to_irq;
 #ifdef CONFIG_X86
 static unsigned long *pirq_eoi_map;
@@ -257,6 +261,32 @@ static void set_info_for_irq(unsigned in
 		irq_set_chip_data(irq, info);
 }
 
+/* Per CPU channel accounting */
+static void channels_on_cpu_dec(struct irq_info *info)
+{
+	if (!info->is_accounted)
+		return;
+
+	info->is_accounted = 0;
+
+	if (WARN_ON_ONCE(info->cpu >= nr_cpu_ids))
+		return;
+
+	WARN_ON_ONCE(!atomic_add_unless(&channels_on_cpu[info->cpu], -1 , 0));
+}
+
+static void channels_on_cpu_inc(struct irq_info *info)
+{
+	if (WARN_ON_ONCE(info->cpu >= nr_cpu_ids))
+		return;
+
+	if (WARN_ON_ONCE(!atomic_add_unless(&channels_on_cpu[info->cpu], 1,
+					    INT_MAX)))
+		return;
+
+	info->is_accounted = 1;
+}
+
 /* Constructors for packed IRQ information. */
 static int xen_irq_info_common_setup(struct irq_info *info,
 				     unsigned irq,
@@ -339,6 +369,7 @@ static void xen_irq_info_cleanup(struct
 {
 	set_evtchn_to_irq(info->evtchn, -1);
 	info->evtchn = 0;
+	channels_on_cpu_dec(info);
 }
 
 /*
@@ -449,7 +480,9 @@ static void bind_evtchn_to_cpu(evtchn_po
 
 	xen_evtchn_port_bind_to_cpu(evtchn, cpu, info->cpu);
 
+	channels_on_cpu_dec(info);
 	info->cpu = cpu;
+	channels_on_cpu_inc(info);
 }
 
 /**
@@ -622,11 +655,6 @@ static void xen_irq_init(unsigned irq)
 {
 	struct irq_info *info;
 
-#ifdef CONFIG_SMP
-	/* By default all event channels notify CPU#0. */
-	cpumask_copy(irq_get_affinity_mask(irq), cpumask_of(0));
-#endif
-
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (info == NULL)
 		panic("Unable to allocate metadata for IRQ%d\n", irq);
@@ -1691,10 +1719,34 @@ static int xen_rebind_evtchn_to_cpu(evtc
 	return 0;
 }
 
+/*
+ * Find the CPU within @dest mask which has the least number of channels
+ * assigned. This is not precise as the per cpu counts can be modified
+ * concurrently.
+ */
+static unsigned int select_target_cpu(const struct cpumask *dest)
+{
+	unsigned int cpu, best_cpu = UINT_MAX, minch = UINT_MAX;
+
+	for_each_cpu_and(cpu, dest, cpu_online_mask) {
+		unsigned int curch = atomic_read(&channels_on_cpu[cpu]);
+
+		if (curch < minch) {
+			minch = curch;
+			best_cpu = cpu;
+		}
+	}
+
+	/* If this happens accounting is screwed up */
+	if (WARN_ON_ONCE(best_cpu == UINT_MAX))
+		best_cpu = cpumask_first(dest);
+	return best_cpu;
+}
+
 static int set_affinity_irq(struct irq_data *data, const struct cpumask *dest,
 			    bool force)
 {
-	unsigned tcpu = cpumask_first_and(dest, cpu_online_mask);
+	unsigned int tcpu = select_target_cpu(dest);
 	int ret;
 
 	ret = xen_rebind_evtchn_to_cpu(evtchn_from_irq(data->irq), tcpu);
@@ -1922,8 +1974,12 @@ void xen_irq_resume(void)
 	xen_evtchn_resume();
 
 	/* No IRQ <-> event-channel mappings. */
-	list_for_each_entry(info, &xen_irq_list_head, list)
-		info->evtchn = 0; /* zap event-channel binding */
+	list_for_each_entry(info, &xen_irq_list_head, list) {
+		/* Zap event-channel binding */
+		info->evtchn = 0;
+		/* Adjust accounting */
+		channels_on_cpu_dec(info);
+	}
 
 	clear_evtchn_to_irq_all();
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
