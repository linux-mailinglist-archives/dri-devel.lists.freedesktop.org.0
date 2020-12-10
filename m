Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373262D7152
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9236ECA0;
	Fri, 11 Dec 2020 08:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5C46EB37;
 Thu, 10 Dec 2020 19:42:37 +0000 (UTC)
Message-Id: <20201210194044.255887860@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607629356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=jUTg4Los1VXz05PCBCDed5HfB12tsGaOsCncsAJwQxU=;
 b=FXhZkYaxbEPy5U+kiVcqwCILOgmOw0n9WJerjpKGSfIyXXxkGyaPiRB5bUJw5/1GbQgK84
 3A3wne9ZskCGrHeBheov/UfaaJAXbhd6XuPaKkHQLZx3IXEKB8JWAfbiz9XVlErPWxhUds
 +BYgAnfA922lpGMT6q/hi+YidzMFXq4opliKvrzDffBcg9VA3r5bNxQxfXyUW8GfN7ZxEw
 tJHtK1YV9651CgrvRnAV+LL92Mn76NESJ20TqtKaDrLgHsHJdq2p3Erxm3ONWn5WeohH8D
 ygiFGZbw1MfYSBaQqVR0RpRK1HywIevKDTa8/tVw8wl8XT4OGsw2hu9prW3gNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607629356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=jUTg4Los1VXz05PCBCDed5HfB12tsGaOsCncsAJwQxU=;
 b=jZYO6UEfS1fO8jTBQSg6h2JwtIawA4Pop19pbpdb83G7Islx2MDh7VNX5bpTao8FSicjDK
 BnzPlnU4fVkD+gBg==
Date: Thu, 10 Dec 2020 20:25:53 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 17/30] NTB/msi: Use irq_has_action()
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

Use the proper core function.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jon Mason <jdmason@kudzu.us>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Allen Hubbe <allenbh@gmail.com>
Cc: linux-ntb@googlegroups.com
---
 drivers/ntb/msi.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- a/drivers/ntb/msi.c
+++ b/drivers/ntb/msi.c
@@ -282,15 +282,13 @@ int ntbm_msi_request_threaded_irq(struct
 				  struct ntb_msi_desc *msi_desc)
 {
 	struct msi_desc *entry;
-	struct irq_desc *desc;
 	int ret;
 
 	if (!ntb->msi)
 		return -EINVAL;
 
 	for_each_pci_msi_entry(entry, ntb->pdev) {
-		desc = irq_to_desc(entry->irq);
-		if (desc->action)
+		if (irq_has_action(entry->irq))
 			continue;
 
 		ret = devm_request_threaded_irq(&ntb->dev, entry->irq, handler,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
