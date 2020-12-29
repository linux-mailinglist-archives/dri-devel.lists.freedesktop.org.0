Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943112E6F6F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58271892DB;
	Tue, 29 Dec 2020 09:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389A789319
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 01:49:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609206564; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rpqI5hDm0c8EMztfmP5ol3o97td4NOlV5r9gOI8P84E=;
 b=vqAW1ub6JSpwj9F09ZwrEOsg/FWqgCMMPEZ5inlC8kiNndn32mRyUlDWRi8bAzsPNA3c2iau
 ItkvL7a2TQgNZ6vvhN22joG1Q/Hqwf4kj7bkyChzoV6+z9Vp02luzqMAl63u8NOS/n53xKvU
 mfo6/Lm6uYfGPjtokMHZif6I1PY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fea8b237bc801dc4f428003 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Dec 2020 01:49:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 482FBC43466; Tue, 29 Dec 2020 01:49:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B82BC43462;
 Tue, 29 Dec 2020 01:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B82BC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, robh@kernel.org,
 tomeu.vizoso@collabora.com
Subject: [PATCH 7/7] iommu/io-pgtable-arm: Allow building modular io-pgtable
 formats
Date: Mon, 28 Dec 2020 17:49:01 -0800
Message-Id: <1609206541-14562-8-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609206541-14562-1-git-send-email-isaacm@codeaurora.org>
References: <1609206541-14562-1-git-send-email-isaacm@codeaurora.org>
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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

Now that everything is in place for modular io-pgtable formats,
allow the ARM LPAE and ARMV7S io-pgtable formats to be built
as modules, and allow the io-pgtable framework to be enabled,
without having to explicitly enable an io-pgtable format.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/Kconfig              | 11 +++++++----
 drivers/iommu/io-pgtable-arm-v7s.c |  2 ++
 drivers/iommu/io-pgtable-arm.c     |  2 ++
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 192ef8f..d3c4e9a 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -25,12 +25,15 @@ if IOMMU_SUPPORT
 
 menu "Generic IOMMU Pagetable Support"
 
-# Selected by the actual pagetable implementations
 config IOMMU_IO_PGTABLE
-	bool
+	bool "IOMMU Pagetable support"
+	help
+	  Enable support for using IOMMU pagetables. This option enables
+	  the generic IOMMU pagetable framework for registering IOMMU
+	  pagetable formats, as well as managing IOMMU pagetable instances.
 
 config IOMMU_IO_PGTABLE_LPAE
-	bool "ARMv7/v8 Long Descriptor Format"
+	tristate "ARMv7/v8 Long Descriptor Format"
 	select IOMMU_IO_PGTABLE
 	depends on ARM || ARM64 || (COMPILE_TEST && !GENERIC_ATOMIC64)
 	help
@@ -49,7 +52,7 @@ config IOMMU_IO_PGTABLE_LPAE_SELFTEST
 	  If unsure, say N here.
 
 config IOMMU_IO_PGTABLE_ARMV7S
-	bool "ARMv7/v8 Short Descriptor Format"
+	tristate "ARMv7/v8 Short Descriptor Format"
 	select IOMMU_IO_PGTABLE
 	depends on ARM || ARM64 || COMPILE_TEST
 	help
diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 7e81135..69dbf86 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -1014,3 +1014,5 @@ static void __exit arm_v7s_exit(void)
 	io_pgtable_ops_unregister(ARM_V7S);
 }
 module_exit(arm_v7s_exit);
+
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 8ed52a0..8d4805f 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1306,3 +1306,5 @@ static void __exit arm_lpae_exit(void)
 		io_pgtable_ops_unregister(arm_lpae_init_fns_table[i].fmt);
 }
 module_exit(arm_lpae_exit);
+
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
