Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495392D7185
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952C26ECDF;
	Fri, 11 Dec 2020 08:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457466EB3E;
 Thu, 10 Dec 2020 19:42:36 +0000 (UTC)
Message-Id: <20201210194044.157283633@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=4K6qItYlSe7EBUp3WfMEzcI2y69yZ4OdOhSokF1HvFw=;
 b=dopfjz4hp6A4Xryu0tbdegM/v0YL6lWYdnP3XlIYCgQ9pjXx9ZT1p3TI0zk4elgm5gPd+q
 FURWbMd/ftse0CXn8TWD7Lf/LMt29YyfqJkuoxwIq2zLBOhpU5N1uQ9NTcofTSPiRoKfTO
 PEbzx4Og6n9n+3PdfyA3eCON82LOBsb5cz2c2++JdWXn2zeffzgZ5twz3L2T1NgK3Sr/6E
 z4hGHNQPL1mjIDXhMbZMKcry3IqKzOm1XwkJ497HBo+O7rAGzJagP8Bz95WOHjr107cL1M
 F3z7vCp/PgmQ7w0NfOrec8JvWkd2Glw3/TrHKxQy3AjIzKLFjQ11edATiOjGMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=4K6qItYlSe7EBUp3WfMEzcI2y69yZ4OdOhSokF1HvFw=;
 b=K3Wur5e2Woy0OzRxLAAmfcCZIUuOyHlagbFXs1H4WET0hQYXgya6h4ah4Fheh+nueTyzzX
 ONj+v+orSFGMaLBQ==
Date: Thu, 10 Dec 2020 20:25:52 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 16/30] mfd: ab8500-debugfs: Remove the racy fiddling with
 irq_desc
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
 netdev@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, intel-gfx@lists.freedesktop.org,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>, Will Deacon <will@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-gpio@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Airlie <airlied@linux.ie>,
 linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Saeed Mahameed <saeedm@nvidia.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First of all drivers have absolutely no business to dig into the internals
of an irq descriptor. That's core code and subject to change. All of this
information is readily available to /proc/interrupts in a safe and race
free way.

Remove the inspection code which is a blatant violation of subsystem
boundaries and racy against concurrent modifications of the interrupt
descriptor.

Print the irq line instead so the information can be looked up in a sane
way in /proc/interrupts.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/mfd/ab8500-debugfs.c |   16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

--- a/drivers/mfd/ab8500-debugfs.c
+++ b/drivers/mfd/ab8500-debugfs.c
@@ -1513,24 +1513,14 @@ static int ab8500_interrupts_show(struct
 {
 	int line;
 
-	seq_puts(s, "name: number:  number of: wake:\n");
+	seq_puts(s, "name: number: irq: number of: wake:\n");
 
 	for (line = 0; line < num_interrupt_lines; line++) {
-		struct irq_desc *desc = irq_to_desc(line + irq_first);
-
-		seq_printf(s, "%3i:  %6i %4i",
+		seq_printf(s, "%3i:  %6i %4i %4i\n",
 			   line,
+			   line + irq_first,
 			   num_interrupts[line],
 			   num_wake_interrupts[line]);
-
-		if (desc && desc->name)
-			seq_printf(s, "-%-8s", desc->name);
-		if (desc && desc->action) {
-			struct irqaction *action = desc->action;
-
-			seq_printf(s, "  %s", action->name);
-			while ((action = action->next) != NULL)
-				seq_printf(s, ", %s", action->name);
 		}
 		seq_putc(s, '\n');
 	}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
