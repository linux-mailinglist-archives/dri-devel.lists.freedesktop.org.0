Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2E42EA66A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D456E08C;
	Tue,  5 Jan 2021 08:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FB389F73
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 07:37:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609832224; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0B3zKdf9FkvtJgpXxelylee2gJybjJX9T1Q1FeVXnR0=;
 b=gYB93RNWnmm7Arbq4quxRDcHI/ufFQOrdsb2LTsqaNQfUOvDe0zfutZZl0J3Tr76rK/eBHjv
 lGIbOgXy+5nx2cBt9EbVkboREA1gB7IQ1cwoQrjp7phLqokq3li5i8H0ILrSrCvHkUMyT2oH
 zqW6xJZJqM8kM4E22X8Ot3Q47NY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5ff4171b1f36cf41dfa2be08 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Jan 2021 07:36:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 079A2C43463; Tue,  5 Jan 2021 07:36:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D8EAC433CA;
 Tue,  5 Jan 2021 07:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8D8EAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, robh@kernel.org,
 tomeu.vizoso@collabora.com
Subject: [PATCH RESEND 1/7] iommu/io-pgtable: Introduce dynamic io-pgtable
 format registration
Date: Mon,  4 Jan 2021 23:36:39 -0800
Message-Id: <1609832205-10055-2-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609832205-10055-1-git-send-email-isaacm@codeaurora.org>
References: <1609832205-10055-1-git-send-email-isaacm@codeaurora.org>
X-Mailman-Approved-At: Tue, 05 Jan 2021 08:21:09 +0000
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno@lists.freedesktop.org, pdaly@codeaurora.org, pratikp@codeaurora.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The io-pgtable code constructs an array of init functions for each
page table format at compile time. This is not ideal, as it prevents
io-pgtable formats from being built as kernel modules.

In preparation for modularizing the io-pgtable formats, switch to a
dynamic registration scheme, where each io-pgtable format can register
their init functions with the io-pgtable code at boot or module
insertion time.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 33 ++++++++++++-
 drivers/iommu/io-pgtable-arm.c     | 97 ++++++++++++++++++++++++++++----------
 drivers/iommu/io-pgtable.c         | 44 +++++++++++------
 include/linux/io-pgtable.h         | 50 ++++++++++++--------
 4 files changed, 164 insertions(+), 60 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 1d92ac9..080881b 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -28,6 +28,7 @@
 #include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/kmemleak.h>
+#include <linux/module.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -835,7 +836,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	return NULL;
 }
 
-struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns = {
+static struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns = {
 	.alloc	= arm_v7s_alloc_pgtable,
 	.free	= arm_v7s_free_pgtable,
 };
@@ -982,5 +983,33 @@ static int __init arm_v7s_do_selftests(void)
 	pr_info("self test ok\n");
 	return 0;
 }
-subsys_initcall(arm_v7s_do_selftests);
+#else
+static int arm_v7s_do_selftests(void)
+{
+	return 0;
+}
 #endif
+
+static int __init arm_v7s_init(void)
+{
+	int ret;
+
+	ret = io_pgtable_ops_register(ARM_V7S, &io_pgtable_arm_v7s_init_fns);
+	if (ret < 0) {
+		pr_err("Failed to register ARM v7s fmt ret = %d\n", ret);
+		return ret;
+	}
+
+	ret = arm_v7s_do_selftests();
+	if (ret < 0)
+		io_pgtable_ops_unregister(ARM_V7S);
+
+	return ret;
+}
+core_initcall(arm_v7s_init);
+
+static void __exit arm_v7s_exit(void)
+{
+	io_pgtable_ops_unregister(ARM_V7S);
+}
+module_exit(arm_v7s_exit);
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 87def58..e1f8d54 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -13,6 +13,7 @@
 #include <linux/bitops.h>
 #include <linux/io-pgtable.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -145,6 +146,11 @@ struct arm_lpae_io_pgtable {
 	void			*pgd;
 };
 
+struct arm_lpae_io_pgtable_init_fns {
+	enum io_pgtable_fmt fmt;
+	struct io_pgtable_init_fns init_fns;
+};
+
 typedef u64 arm_lpae_iopte;
 
 static inline bool iopte_leaf(arm_lpae_iopte pte, int lvl,
@@ -1043,29 +1049,32 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	return NULL;
 }
 
-struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns = {
-	.alloc	= arm_64_lpae_alloc_pgtable_s1,
-	.free	= arm_lpae_free_pgtable,
-};
-
-struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns = {
-	.alloc	= arm_64_lpae_alloc_pgtable_s2,
-	.free	= arm_lpae_free_pgtable,
-};
-
-struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s1_init_fns = {
-	.alloc	= arm_32_lpae_alloc_pgtable_s1,
-	.free	= arm_lpae_free_pgtable,
-};
-
-struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s2_init_fns = {
-	.alloc	= arm_32_lpae_alloc_pgtable_s2,
-	.free	= arm_lpae_free_pgtable,
-};
-
-struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns = {
-	.alloc	= arm_mali_lpae_alloc_pgtable,
-	.free	= arm_lpae_free_pgtable,
+static struct arm_lpae_io_pgtable_init_fns arm_lpae_init_fns_table[] = {
+	{
+		.fmt		= ARM_32_LPAE_S1,
+		.init_fns.alloc	= arm_32_lpae_alloc_pgtable_s1,
+		.init_fns.free	= arm_lpae_free_pgtable,
+	},
+	{
+		.fmt		= ARM_32_LPAE_S2,
+		.init_fns.alloc	= arm_32_lpae_alloc_pgtable_s2,
+		.init_fns.free	= arm_lpae_free_pgtable,
+	},
+	{
+		.fmt		= ARM_64_LPAE_S1,
+		.init_fns.alloc	= arm_64_lpae_alloc_pgtable_s1,
+		.init_fns.free	= arm_lpae_free_pgtable,
+	},
+	{
+		.fmt		= ARM_64_LPAE_S2,
+		.init_fns.alloc	= arm_64_lpae_alloc_pgtable_s2,
+		.init_fns.free	= arm_lpae_free_pgtable,
+	},
+	{
+		.fmt		= ARM_MALI_LPAE,
+		.init_fns.alloc	= arm_mali_lpae_alloc_pgtable,
+		.init_fns.free	= arm_lpae_free_pgtable,
+	},
 };
 
 #ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
@@ -1250,5 +1259,45 @@ static int __init arm_lpae_do_selftests(void)
 	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
 	return fail ? -EFAULT : 0;
 }
-subsys_initcall(arm_lpae_do_selftests);
+#else
+static int __init arm_lpae_do_selftests(void)
+{
+	return 0;
+}
 #endif
+
+static int __init arm_lpae_init(void)
+{
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(arm_lpae_init_fns_table); i++) {
+		ret = io_pgtable_ops_register(arm_lpae_init_fns_table[i].fmt,
+					      &arm_lpae_init_fns_table[i].init_fns);
+		if (ret < 0) {
+			pr_err("Failed to register ARM LPAE fmt: %d ret: %d\n",
+			       arm_lpae_init_fns_table[i].fmt, ret);
+			goto err_io_pgtable_register;
+		}
+	}
+
+	ret = arm_lpae_do_selftests();
+	if (ret < 0)
+		goto err_io_pgtable_register;
+
+	return 0;
+
+err_io_pgtable_register:
+	while (i--)
+		io_pgtable_ops_unregister(arm_lpae_init_fns_table[i].fmt);
+	return ret;
+}
+core_initcall(arm_lpae_init);
+
+static void __exit arm_lpae_exit(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(arm_lpae_init_fns_table); i++)
+		io_pgtable_ops_unregister(arm_lpae_init_fns_table[i].fmt);
+}
+module_exit(arm_lpae_exit);
diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
index 94394c8..95e872d 100644
--- a/drivers/iommu/io-pgtable.c
+++ b/drivers/iommu/io-pgtable.c
@@ -12,26 +12,14 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 
-static const struct io_pgtable_init_fns *
-io_pgtable_init_table[IO_PGTABLE_NUM_FMTS] = {
-#ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE
-	[ARM_32_LPAE_S1] = &io_pgtable_arm_32_lpae_s1_init_fns,
-	[ARM_32_LPAE_S2] = &io_pgtable_arm_32_lpae_s2_init_fns,
-	[ARM_64_LPAE_S1] = &io_pgtable_arm_64_lpae_s1_init_fns,
-	[ARM_64_LPAE_S2] = &io_pgtable_arm_64_lpae_s2_init_fns,
-	[ARM_MALI_LPAE] = &io_pgtable_arm_mali_lpae_init_fns,
-#endif
-#ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S
-	[ARM_V7S] = &io_pgtable_arm_v7s_init_fns,
-#endif
-};
+static struct io_pgtable_init_fns *io_pgtable_init_table[IO_PGTABLE_NUM_FMTS];
 
 struct io_pgtable_ops *alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
 					    struct io_pgtable_cfg *cfg,
 					    void *cookie)
 {
 	struct io_pgtable *iop;
-	const struct io_pgtable_init_fns *fns;
+	struct io_pgtable_init_fns *fns;
 
 	if (fmt >= IO_PGTABLE_NUM_FMTS)
 		return NULL;
@@ -59,12 +47,38 @@ EXPORT_SYMBOL_GPL(alloc_io_pgtable_ops);
 void free_io_pgtable_ops(struct io_pgtable_ops *ops)
 {
 	struct io_pgtable *iop;
+	struct io_pgtable_init_fns *fns;
 
 	if (!ops)
 		return;
 
 	iop = io_pgtable_ops_to_pgtable(ops);
 	io_pgtable_tlb_flush_all(iop);
-	io_pgtable_init_table[iop->fmt]->free(iop);
+	fns = io_pgtable_init_table[iop->fmt];
+	if (fns)
+		fns->free(iop);
 }
 EXPORT_SYMBOL_GPL(free_io_pgtable_ops);
+
+int io_pgtable_ops_register(enum io_pgtable_fmt fmt,
+			    struct io_pgtable_init_fns *init_fns)
+{
+	if (fmt >= IO_PGTABLE_NUM_FMTS || !init_fns || !init_fns->alloc ||
+	    !init_fns->free)
+		return -EINVAL;
+	else if (io_pgtable_init_table[fmt])
+		return -EEXIST;
+
+	io_pgtable_init_table[fmt] = init_fns;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(io_pgtable_ops_register);
+
+void io_pgtable_ops_unregister(enum io_pgtable_fmt fmt)
+{
+	if (fmt >= IO_PGTABLE_NUM_FMTS)
+		return;
+
+	io_pgtable_init_table[fmt] = NULL;
+}
+EXPORT_SYMBOL_GPL(io_pgtable_ops_unregister);
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index ea727eb..a460ae1 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -163,6 +163,37 @@ struct io_pgtable_ops {
 };
 
 /**
+ * struct io_pgtable_init_fns - Alloc/free a set of page tables for a
+ *                              particular format.
+ *
+ * @alloc: Allocate a set of page tables described by cfg.
+ * @free:  Free the page tables associated with iop.
+ */
+struct io_pgtable_init_fns {
+	struct io_pgtable *(*alloc)(struct io_pgtable_cfg *cfg, void *cookie);
+	void (*free)(struct io_pgtable *iop);
+};
+
+/**
+ * io_pgtable_ops_register() - Register the page table routines for a page table
+ *                             format.
+ *
+ * @fmt:      The page table format for which we are registering ops for.
+ * @init_fns: The functions for allocating and freeing the page tables of
+ *            a particular format.
+ */
+int io_pgtable_ops_register(enum io_pgtable_fmt fmt,
+			    struct io_pgtable_init_fns *init_fns);
+
+/**
+ * io_pgtable_ops_unregister() - Unregister the page table routines for a page
+ *                               table format.
+ *
+ * @fmt: The format for which we are unregistering ops for.
+ */
+void io_pgtable_ops_unregister(enum io_pgtable_fmt fmt);
+
+/**
  * alloc_io_pgtable_ops() - Allocate a page table allocator for use by an IOMMU.
  *
  * @fmt:    The page table format.
@@ -233,23 +264,4 @@ io_pgtable_tlb_add_page(struct io_pgtable *iop,
 		iop->cfg.tlb->tlb_add_page(gather, iova, granule, iop->cookie);
 }
 
-/**
- * struct io_pgtable_init_fns - Alloc/free a set of page tables for a
- *                              particular format.
- *
- * @alloc: Allocate a set of page tables described by cfg.
- * @free:  Free the page tables associated with iop.
- */
-struct io_pgtable_init_fns {
-	struct io_pgtable *(*alloc)(struct io_pgtable_cfg *cfg, void *cookie);
-	void (*free)(struct io_pgtable *iop);
-};
-
-extern struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s1_init_fns;
-extern struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s2_init_fns;
-extern struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns;
-extern struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns;
-extern struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns;
-extern struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns;
-
 #endif /* __IO_PGTABLE_H */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
