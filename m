Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CA32E07FF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDF46E864;
	Tue, 22 Dec 2020 09:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA026E095
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 00:44:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608597896; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bYabydo/dXbRQkL5qXIuDQBWRKY+jGONTXRs3liUi6M=;
 b=lfSlHbLB3DE/YpyHfebYJm6sbGFtTcZbyfS3jt+o670t732Q8V5VUOSBn/NuzML1ESZUZapA
 7pVIuNop5yGd6w63chOvkOz1slkOBByJgMELLn92YVgSWUAQvpPJuqW48kWhLO2UgHGP74St
 OEbVIgh4Z32pfgS8o9tGbAfe+fM=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fe141826d2f42c6668cb61e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 00:44:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4823AC433ED; Tue, 22 Dec 2020 00:44:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F294C43464;
 Tue, 22 Dec 2020 00:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F294C43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/7] iommu/io-pgtable: Add refcounting for io-pgtable
 format modules
Date: Mon, 21 Dec 2020 16:44:31 -0800
Message-Id: <1608597876-32367-3-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:48 +0000
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, will@kernel.org,
 pdaly@codeaurora.org, kernel-team@android.com, joro@8bytes.org,
 robin.murphy@arm.com, pratikp@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for modularizing io-pgtable formats, add support
for reference counting the io-pgtable format modules to ensure
that the modules are not unloaded while they are in use.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/io-pgtable-arm-v7s.c |  1 +
 drivers/iommu/io-pgtable-arm.c     |  5 +++++
 drivers/iommu/io-pgtable.c         | 12 ++++++++++--
 include/linux/io-pgtable.h         |  2 ++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 89aad2f..a5cb755a 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -840,6 +840,7 @@ static struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns = {
 	.fmt	= ARM_V7S,
 	.alloc	= arm_v7s_alloc_pgtable,
 	.free	= arm_v7s_free_pgtable,
+	.owner	= THIS_MODULE,
 };
 
 #ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index ff0ea2f..e8b1e34 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1049,26 +1049,31 @@ static struct io_pgtable_init_fns io_pgtable_arm_lpae_init_fns[] = {
 		.fmt	= ARM_32_LPAE_S1,
 		.alloc	= arm_32_lpae_alloc_pgtable_s1,
 		.free	= arm_lpae_free_pgtable,
+		.owner	= THIS_MODULE,
 	},
 	{
 		.fmt	= ARM_32_LPAE_S2,
 		.alloc	= arm_32_lpae_alloc_pgtable_s2,
 		.free	= arm_lpae_free_pgtable,
+		.owner	= THIS_MODULE,
 	},
 	{
 		.fmt	= ARM_64_LPAE_S1,
 		.alloc	= arm_64_lpae_alloc_pgtable_s1,
 		.free	= arm_lpae_free_pgtable,
+		.owner	= THIS_MODULE,
 	},
 	{
 		.fmt	= ARM_64_LPAE_S2,
 		.alloc	= arm_64_lpae_alloc_pgtable_s2,
 		.free	= arm_lpae_free_pgtable,
+		.owner	= THIS_MODULE,
 	},
 	{
 		.fmt	= ARM_MALI_LPAE,
 		.alloc	= arm_mali_lpae_alloc_pgtable,
 		.free	= arm_lpae_free_pgtable,
+		.owner	= THIS_MODULE,
 	},
 };
 
diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
index 2c6eb2e..cc83542 100644
--- a/drivers/iommu/io-pgtable.c
+++ b/drivers/iommu/io-pgtable.c
@@ -10,6 +10,7 @@
 #include <linux/bug.h>
 #include <linux/io-pgtable.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/rwlock.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -52,9 +53,14 @@ struct io_pgtable_ops *alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
 	if (!fns)
 		return NULL;
 
+	if (!try_module_get(fns->owner))
+		return NULL;
+
 	iop = fns->alloc(cfg, cookie);
-	if (!iop)
+	if (!iop) {
+		module_put(fns->owner);
 		return NULL;
+	}
 
 	iop->fmt	= fmt;
 	iop->cookie	= cookie;
@@ -79,8 +85,10 @@ void free_io_pgtable_ops(struct io_pgtable_ops *ops)
 	iop = io_pgtable_ops_to_pgtable(ops);
 	io_pgtable_tlb_flush_all(iop);
 	fns = io_pgtable_get_init_fns(iop->fmt);
-	if (fns)
+	if (fns) {
 		fns->free(iop);
+		module_put(fns->owner);
+	}
 }
 EXPORT_SYMBOL_GPL(free_io_pgtable_ops);
 
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 45b367ce..a03b262 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -169,11 +169,13 @@ struct io_pgtable_ops {
  * @fmt:   The page table format.
  * @alloc: Allocate a set of page tables described by cfg.
  * @free:  Free the page tables associated with iop.
+ * @owner: Driver module providing these ops.
  */
 struct io_pgtable_init_fns {
 	enum io_pgtable_fmt fmt;
 	struct io_pgtable *(*alloc)(struct io_pgtable_cfg *cfg, void *cookie);
 	void (*free)(struct io_pgtable *iop);
+	struct module *owner;
 };
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
