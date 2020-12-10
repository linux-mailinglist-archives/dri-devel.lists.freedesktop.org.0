Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5614A2D7160
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3A46ECB5;
	Fri, 11 Dec 2020 08:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F25F6EB27;
 Thu, 10 Dec 2020 19:42:26 +0000 (UTC)
Message-Id: <20201210194043.362094758@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=xI8ipC8kVjJGltjSHu5Mwub/dbA42XKOSuIg0xDxbuM=;
 b=D/de10U4HoG38vblr7IeySKjPU1LbUwG6rWRmeGYZrTiPhh//Hh7l/GxJreJ0rFcvzRPJy
 uoauNylV8dWf/MoltroGmVGhvJ2oJ5Y1i1Hdh3B/UY4mD9pwH+y7Dg4V+Vuar0V4FZXmUS
 6T9k0+65HYvYSEKNJ4TVXxdcFWWUmHXiCvk5q873lejGHd1ZF8kDnbNFZOuvndA/bZ6hqk
 upKi4g8D5MCEBYYTgyELzJKcRa+JlxwqpINFEbwiyouRus62LMleSD5uCsPspz8eEzaopF
 eLafHsQRj846r/5tje8mdg+dCV5YsColFl6docNWF4RiFgqrORcZz2o154ST/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=xI8ipC8kVjJGltjSHu5Mwub/dbA42XKOSuIg0xDxbuM=;
 b=uhk8uY0rFu42URnjai4w+dmeZE7ul5z78imfPTBVOwBrf5zNSXRAMP26aad4ZYcrnfPUQU
 IQRkkJ1oiqPOXJDw==
Date: Thu, 10 Dec 2020 20:25:44 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 08/30] genirq: Provide kstat_irqdesc_cpu()
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

Most users of kstat_irqs_cpu() have the irq descriptor already. No point in
calling into the core code and looking it up once more.

Use it in per_cpu_count_show() to start with.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/irqdesc.h |    6 ++++++
 kernel/irq/irqdesc.c    |    4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -113,6 +113,12 @@ static inline void irq_unlock_sparse(voi
 extern struct irq_desc irq_desc[NR_IRQS];
 #endif
 
+static inline unsigned int irq_desc_kstat_cpu(struct irq_desc *desc,
+					      unsigned int cpu)
+{
+	return desc->kstat_irqs ? *per_cpu_ptr(desc->kstat_irqs, cpu) : 0;
+}
+
 static inline struct irq_desc *irq_data_to_desc(struct irq_data *data)
 {
 	return container_of(data->common, struct irq_desc, irq_common_data);
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -147,12 +147,12 @@ static ssize_t per_cpu_count_show(struct
 				  struct kobj_attribute *attr, char *buf)
 {
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
-	int cpu, irq = desc->irq_data.irq;
 	ssize_t ret = 0;
 	char *p = "";
+	int cpu;
 
 	for_each_possible_cpu(cpu) {
-		unsigned int c = kstat_irqs_cpu(irq, cpu);
+		unsigned int c = irq_desc_kstat_cpu(desc, cpu);
 
 		ret += scnprintf(buf + ret, PAGE_SIZE - ret, "%s%u", p, c);
 		p = ",";

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
