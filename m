Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AEA2D7184
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F19A6ECB1;
	Fri, 11 Dec 2020 08:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517476EB1C;
 Thu, 10 Dec 2020 19:42:22 +0000 (UTC)
Message-Id: <20201210194043.067097663@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=an/0SlT10gC/rfGB9cofMBAbBc2y8gDRMVN0GHlSQuQ=;
 b=4P4kE5RTAFQxk4E9p2NZ5tVZaT/fVdqT6FUBVR+n0VlRr8uKLCY6ouByJWK/y9MigmPqnb
 tesyONzFlkjZdJe1WWdFvx3h+r+GXjLB7sIlmHBZwN8ZTN8764SDWmNv/29J0LI/juCzrG
 5AR2DIz8iI4y5+WrS2Gk+rZPh543USYMAHoeudVHDJ9Wges2zOPIJ3rC2brtEkqswFGEBV
 qoEKpCAHt2vMMptUuKRYjL5+zlSE91zw5P4yyaAjNJTKm8BCJhUlMmWxn/QqILbbs/4fJM
 zRFVwll3IxpXJvkmkahKFPnuLZWACJTleFizSON231iYySZCGseiBRgkWQqHew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=an/0SlT10gC/rfGB9cofMBAbBc2y8gDRMVN0GHlSQuQ=;
 b=0D9iZlJLFfBnhtOaF8MIaZu0T6LGBg7Mhm2UH/Vr6qq568TJA8295HDu2RHkjE+w+f0eVZ
 +xYpdmSgjdKynXCQ==
Date: Thu, 10 Dec 2020 20:25:41 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 05/30] genirq: Annotate irq stats data races
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

Both the per cpu stats and the accumulated count are accessed lockless and
can be concurrently modified. That's intentional and the stats are a rough
estimate anyway. Annotate them with data_race().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 kernel/irq/irqdesc.c |    4 ++--
 kernel/irq/proc.c    |    5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -943,10 +943,10 @@ unsigned int kstat_irqs(unsigned int irq
 	if (!irq_settings_is_per_cpu_devid(desc) &&
 	    !irq_settings_is_per_cpu(desc) &&
 	    !irq_is_nmi(desc))
-	    return desc->tot_count;
+		return data_race(desc->tot_count);
 
 	for_each_possible_cpu(cpu)
-		sum += *per_cpu_ptr(desc->kstat_irqs, cpu);
+		sum += data_race(*per_cpu_ptr(desc->kstat_irqs, cpu));
 	return sum;
 }
 
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -488,9 +488,10 @@ int show_interrupts(struct seq_file *p,
 	if (!desc || irq_settings_is_hidden(desc))
 		goto outsparse;
 
-	if (desc->kstat_irqs)
+	if (desc->kstat_irqs) {
 		for_each_online_cpu(j)
-			any_count |= *per_cpu_ptr(desc->kstat_irqs, j);
+			any_count |= data_race(*per_cpu_ptr(desc->kstat_irqs, j));
+	}
 
 	if ((!desc->action || irq_desc_is_chained(desc)) && !any_count)
 		goto outsparse;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
