Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA282D715B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB7F6ECB4;
	Fri, 11 Dec 2020 08:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071AA6EB37;
 Thu, 10 Dec 2020 19:42:35 +0000 (UTC)
Message-Id: <20201210194044.065003856@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=fEH7SfFXgNBjB2KnJKxA/TzRUtcjVN/8Utn6le7GAgY=;
 b=jLhcNWAI6/f0h7r8+rFxJO/huD0wZGw+D4hiyZeoGMMj1an/mYZLtmxjGnZ/aSu9ajxbNk
 p75pL7pZYF9lDXL6k6cLxjzZOwC5q8ecIjJ39xF/dSPObsyqM+yudoL9yN0v7780Bn5yyF
 /Ve3t66EmBeMbc9BsRyBF2dkjfBuqeDKx8lYvDouLXZuAf0vFtIPH5zU4jlfdixs/IVdOS
 vmsr5U63fIVzglTEhwYSxzXESekgTuzdOHcprErKfUMwbSexx9oDdfFa+4Z1VcZaNX5rSu
 6l8HXwdp3e4RNwPr1pyTZfpMenA4zfmUQEoZ4/oyxWsRJm8zIR/y6ojvGi9aNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=fEH7SfFXgNBjB2KnJKxA/TzRUtcjVN/8Utn6le7GAgY=;
 b=vcq9ylrl3bvEPVRyLq7+7uNgnxo0i4JU/giqH4jOxFiIi2uv7Mz1SZNae4Tgp0yDwrMR2T
 GgsHxKk5w8TyzfBQ==
Date: Thu, 10 Dec 2020 20:25:51 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 15/30] pinctrl: nomadik: Use irq_has_action()
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
 netdev@vger.kernel.org, Will Deacon <will@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, intel-gfx@lists.freedesktop.org,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>,
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

Let the core code do the fiddling with irq_desc.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -948,7 +948,6 @@ static void nmk_gpio_dbg_show_one(struct
 			   (mode < 0) ? "unknown" : modes[mode]);
 	} else {
 		int irq = chip->to_irq(chip, offset);
-		struct irq_desc	*desc = irq_to_desc(irq);
 		const int pullidx = pull ? 1 : 0;
 		int val;
 		static const char * const pulls[] = {
@@ -969,7 +968,7 @@ static void nmk_gpio_dbg_show_one(struct
 		 * This races with request_irq(), set_irq_type(),
 		 * and set_irq_wake() ... but those are "rare".
 		 */
-		if (irq > 0 && desc && desc->action) {
+		if (irq > 0 && irq_has_action(irq)) {
 			char *trigger;
 
 			if (nmk_chip->edge_rising & BIT(offset))

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
