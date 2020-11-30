Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B472C7FB7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325B36E448;
	Mon, 30 Nov 2020 08:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513E76E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:48:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGL7tYBTNM71vvOmb/JPNM7czuNCTpep4Oc9SddJ142wL+8XzH2h75v7m430urQp6ODn9ujC3e7sor7dx0srNikL/4gwBvrm9gOSe6Jab3rd8l2K+0zXYuN29dWf/90tnbLDXWj/4ZnFwK8nHo8hjHzIc+mwD1zkrcumZSShISBWNEWMHxgVozrvuCyHtuojNeQAwesusvY15RHnYOorww3T00hG2AGJYIk0EZv8WfJBVVl8JfJPuthj4qS1/EXz0VnwN8QpkHFRlj2R9foZ6hICxplfiA6o3XXMxvE+HDvK+V2EuSsmv+yuFVXKh3h6+3GSf8yRRWeDcJD32rWUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXFSnrzUxbGFNY3WMQ8uNSDD2a4l5nIZ1U0M/z9Vbm0=;
 b=Mm49VjV88jYgMmlsHQqLVn46CkMzIPAyrnDEVQ4J0Ge+SiUl1Kn2K1c+YFt6xbES9db0RwEKz4Y23PLDOOKZGnR9oXo+/duO15GOQ7GmeRlhdDSLKHtZX6s56Cx/0v/Rl9Bdsc7MSIplfZLuWYfexijk77tUBS9L6A2BsydlOGyiprCBsa6DsV9dchNOo1ZL55mG1TXLhes2qYdTVgeRjzx5WATfglWOIJ1xwkU62xXHXYvyYD0QgTTjuVB7Gsa7tjiQYcQZ4I0U69AWZzUNLXk7ygEDCOvqUBA/Q0oRL6wkIGfjcxkMxamz7NQ+cDRpFUkhZb9roLGSKH/EbBmQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXFSnrzUxbGFNY3WMQ8uNSDD2a4l5nIZ1U0M/z9Vbm0=;
 b=gNxJLrVXFBKAk9TxPGH7IPf7Z7LK3bJKsN3yXOh99Y/taNYBsMDHlrZnSvo/a260p3f6Ja8RoWPPJFn1ypfzTo2itUKW6m+hhPVecAdgFH13n6M0njKI/KjO4B1XDigGAYIlMEz/we5iwXHGWCBypj6R0CXDIAAsjNtzR22N+vk=
Received: from CY4PR03CA0006.namprd03.prod.outlook.com (2603:10b6:903:33::16)
 by MW4PR02MB7332.namprd02.prod.outlook.com (2603:10b6:303:79::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Mon, 30 Nov
 2020 07:48:32 +0000
Received: from CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::2a) by CY4PR03CA0006.outlook.office365.com
 (2603:10b6:903:33::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 07:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT037.mail.protection.outlook.com (10.152.75.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Mon, 30 Nov 2020 07:48:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 29 Nov 2020 23:48:31 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 29 Nov 2020 23:48:31 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, wendy.liang@xilinx.com, robh+dt@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=48528 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kjdvC-0006Pm-Ur; Sun, 29 Nov 2020 23:48:30 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v3 3/9] misc: xilinx-ai-engine: Implement AI engine cleanup
 sequence
Date: Sun, 29 Nov 2020 23:48:19 -0800
Message-ID: <1606722505-16194-4-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f421ea26-113d-431d-11b7-08d89504559f
X-MS-TrafficTypeDiagnostic: MW4PR02MB7332:
X-Microsoft-Antispam-PRVS: <MW4PR02MB73321E74DEADD8CBF3F30BF7B0F50@MW4PR02MB7332.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5SAsY0p3v3q0g/IC/8FAmF04BrusR/2Av1M+6i++MbsNfnsIEGFZEKNxV7zxpkC8CC5gcdG1hp2UcX5XjzMma22AqRt2o0okT+EK4Md7t3heEOqlI1p9Lf3/hhtpAbzWoH4/L36l2RTunVGHYxd3BUsZCjraauFX4eyK5lfs0PixcF7mMWJFJ9+li6lmW+OO2GvrlaExHSKOKmYtWBrynC4yJMQ0QicZz5DdRY1Qa7qyRJnCM9wwPZXvCVckRNpcM8mJPd2LXtfsB5lgqp4jDwEU3fSC5edPHmo9ge7b2/5cixcx4VmCZNLG56z9ipWBtkJNvvb/FNWZW0SrMVvaxn/qEvIVLVECWeTA1xZr99tiKqfw46fB9OtDq4L7UtvbDA0NxX0fImyPH0RSZpZ6a26UdDdkkCtbzI0YH2cszqAsLPRqX4T3NZhOUw0DMhNW
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39850400004)(396003)(46966005)(8676002)(7416002)(107886003)(426003)(26005)(54906003)(2906002)(110136005)(70586007)(186003)(4326008)(36906005)(8936002)(316002)(7696005)(70206006)(2616005)(5660300002)(44832011)(82310400003)(478600001)(7636003)(6666004)(921005)(30864003)(356005)(36756003)(336012)(9786002)(83380400001)(6636002)(47076004)(82740400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 07:48:32.1131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f421ea26-113d-431d-11b7-08d89504559f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7332
X-Mailman-Approved-At: Mon, 30 Nov 2020 08:25:11 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wendy Liang <wendy.liang@xilinx.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When AI engine partition is released, that is if no one is using the AI
engine partition, by default, it will cleanup the partition by doing the
following:
* reset the columns
* reset the SHIMs
* clear data and program memory
* gate all the tiles

If user doesn't want the partition is reset when the partition is
released, user can set the control flag to indicate not to reset the
partition when the user requests the partition.

If partition the not to reset partition control flag is set, it will
not execute the above cleanup sequence when the partition is released.

Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
 drivers/misc/xilinx-ai-engine/Makefile             |   3 +-
 drivers/misc/xilinx-ai-engine/ai-engine-aie.c      |  92 ++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-dev.c      |   2 +
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h |  34 ++++++
 drivers/misc/xilinx-ai-engine/ai-engine-part.c     |   7 +-
 drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 121 +++++++++++++++++++++
 include/uapi/linux/xlnx-ai-engine.h                |   6 +
 7 files changed, 259 insertions(+), 6 deletions(-)
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-reset.c

diff --git a/drivers/misc/xilinx-ai-engine/Makefile b/drivers/misc/xilinx-ai-engine/Makefile
index 7827a0a..39bec61 100644
--- a/drivers/misc/xilinx-ai-engine/Makefile
+++ b/drivers/misc/xilinx-ai-engine/Makefile
@@ -8,4 +8,5 @@ obj-$(CONFIG_XILINX_AIE)	+= xilinx-aie.o
 xilinx-aie-$(CONFIG_XILINX_AIE) := ai-engine-aie.o \
 				   ai-engine-dev.o \
 				   ai-engine-part.o \
-				   ai-engine-res.o
+				   ai-engine-res.o \
+				   ai-engine-reset.o
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
index 319260f..36127f0 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
@@ -5,6 +5,9 @@
  * Copyright (C) 2020 Xilinx, Inc.
  */
 
+#include <linux/bitfield.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/io.h>
 #include <linux/slab.h>
 
 #include "ai-engine-internal.h"
@@ -24,9 +27,25 @@
 #define AIE_SHIMPL_L1INTR_MASK_A_REGOFF		0x00035000U
 #define AIE_SHIMPL_L1INTR_BLOCK_NORTH_B_REGOFF	0x00035050U
 #define AIE_SHIMPL_CLKCNTR_REGOFF		0x00036040U
+#define AIE_SHIMPL_COLRESET_REGOFF		0x00036048U
 #define AIE_SHIMPL_RESET_REGOFF			0x0003604cU
 #define AIE_TILE_CORE_CLKCNTR_REGOFF		0x00036040U
 
+/*
+ * Register masks
+ */
+#define AIE_SHIMPL_SHIMRST_MASK			0x1U
+#define AIE_SHIMPL_COLRST_MASK			0x1U
+#define AIE_SHIMPL_CLKCNTR_COLBUF_MASK		0x1U
+
+/*
+ * AI engine SHIM reset ID.
+ * TODO: it should follow the Linux reset framework. The ID should be in the
+ * device tree. However, as versal resets is not ready, we hardcode it in the
+ * driver.
+ */
+#define VERSAL_PM_RST_AIE_SHIM_ID			0xc10405fU
+
 static const struct aie_tile_regs aie_kernel_regs[] = {
 	/* SHIM AXI MM Config */
 	{.attribute = AIE_TILE_TYPE_SHIMNOC << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
@@ -49,6 +68,12 @@ static const struct aie_tile_regs aie_kernel_regs[] = {
 	 .soff = AIE_SHIMPL_L1INTR_MASK_A_REGOFF,
 	 .eoff = AIE_SHIMPL_L1INTR_BLOCK_NORTH_B_REGOFF,
 	},
+	/* SHIM column reset */
+	{.attribute = (AIE_TILE_TYPE_SHIMPL | AIE_TILE_TYPE_SHIMNOC) <<
+		      AIE_REGS_ATTR_TILE_TYPE_SHIFT,
+	 .soff = AIE_SHIMPL_COLRESET_REGOFF,
+	 .eoff = AIE_SHIMPL_COLRESET_REGOFF,
+	},
 	/* SHIM reset Enable */
 	{.attribute = (AIE_TILE_TYPE_SHIMPL | AIE_TILE_TYPE_SHIMNOC) <<
 		      AIE_REGS_ATTR_TILE_TYPE_SHIFT,
@@ -68,6 +93,16 @@ static const struct aie_tile_regs aie_kernel_regs[] = {
 	},
 };
 
+static const struct aie_single_reg_field aie_col_rst = {
+	.mask = AIE_SHIMPL_COLRST_MASK,
+	.regoff = AIE_SHIMPL_COLRESET_REGOFF,
+};
+
+static const struct aie_single_reg_field aie_col_clkbuf = {
+	.mask = AIE_SHIMPL_CLKCNTR_COLBUF_MASK,
+	.regoff = AIE_SHIMPL_CLKCNTR_REGOFF,
+};
+
 static u32 aie_get_tile_type(struct aie_location *loc)
 {
 	if (loc->row)
@@ -79,8 +114,63 @@ static u32 aie_get_tile_type(struct aie_location *loc)
 	return AIE_TILE_TYPE_SHIMNOC;
 }
 
+/**
+ * aie_set_shim_reset() - Set AI engine SHIM reset
+ * @adev: AI engine device
+ * @range: range of AI engine tiles
+ * @assert: true to set reset, false to unset reset
+ */
+static void aie_set_shim_reset(struct aie_device *adev,
+			       struct aie_range *range, bool assert)
+{
+	u32 c;
+	u32 val;
+	struct aie_location loc;
+
+	val = FIELD_PREP(AIE_SHIMPL_SHIMRST_MASK, (assert ? 1 : 0));
+	loc.row = 0;
+	for (c = range->start.col; c < range->start.col + range->size.col;
+	     c++) {
+		u32 regoff;
+
+		loc.col = c;
+		regoff = aie_cal_regoff(adev, loc, AIE_SHIMPL_RESET_REGOFF);
+		iowrite32(val, adev->base + regoff);
+	}
+}
+
+static int aie_reset_shim(struct aie_device *adev, struct aie_range *range)
+{
+	int ret;
+
+	/* Enable shim reset of each column */
+	aie_set_shim_reset(adev, range, true);
+
+	/* Assert shim reset of AI engine array */
+	ret = zynqmp_pm_reset_assert(VERSAL_PM_RST_AIE_SHIM_ID,
+				     PM_RESET_ACTION_ASSERT);
+	if (ret < 0) {
+		dev_err(&adev->dev, "failed to assert SHIM reset.\n");
+		return ret;
+	}
+
+	/* Release shim reset of AI engine array */
+	ret = zynqmp_pm_reset_assert(VERSAL_PM_RST_AIE_SHIM_ID,
+				     PM_RESET_ACTION_RELEASE);
+	if (ret < 0) {
+		dev_err(&adev->dev, "failed to release SHIM reset.\n");
+		return ret;
+	}
+
+	/* Disable shim reset of each column */
+	aie_set_shim_reset(adev, range, false);
+
+	return 0;
+}
+
 static const struct aie_tile_operations aie_ops = {
 	.get_tile_type = aie_get_tile_type,
+	.reset_shim = aie_reset_shim,
 };
 
 /**
@@ -104,6 +194,8 @@ int aie_device_init(struct aie_device *adev)
 	adev->ops = &aie_ops;
 	adev->num_kernel_regs = ARRAY_SIZE(aie_kernel_regs);
 	adev->kernel_regs = aie_kernel_regs;
+	adev->col_rst = &aie_col_rst;
+	adev->col_clkbuf = &aie_col_clkbuf;
 
 	/* Get the columns resource */
 	/* Get number of columns from AI engine memory resource */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
index 5a56a92..69f7216 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
@@ -212,6 +212,8 @@ struct aie_partition *aie_request_partition(struct aie_device *adev,
 		 * exported for user to access.
 		 */
 		apart->status = XAIE_PART_STATUS_INUSE;
+		apart->cntrflag = req->flag;
+
 		mutex_unlock(&apart->mlock);
 	}
 	mutex_unlock(&adev->mlock);
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
index 6a69946..2acd34f 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
@@ -53,18 +53,30 @@ struct aie_tile_regs {
 	u32 attribute;
 };
 
+/**
+ * struct aie_single_reg_field - AI engine single field register attribute
+ * @mask: field mask
+ * @regoff: register offset of the field
+ */
+struct aie_single_reg_field {
+	u32 mask;
+	u32 regoff;
+};
+
 struct aie_device;
 struct aie_partition;
 
 /**
  * struct aie_tile_operations - AI engine device operations
  * @get_tile_type: get type of tile based on tile operation
+ * @reset_shim: reset shim, it will assert and then release SHIM reset
  *
  * Different AI engine device version has its own device
  * operation.
  */
 struct aie_tile_operations {
 	u32 (*get_tile_type)(struct aie_location *loc);
+	int (*reset_shim)(struct aie_device *adev, struct aie_range *range);
 };
 
 /**
@@ -87,6 +99,8 @@ struct aie_resource {
  * @res: memory resource of AI engine device
  * @kernel_regs: array of kernel only registers
  * @ops: tile operations
+ * @col_rst: column reset attribute
+ * @col_clkbuf: column clock buffer attribute
  * @size: size of the AI engine address space
  * @array_shift: array address shift
  * @col_shift: column address shift
@@ -105,6 +119,8 @@ struct aie_device {
 	struct resource *res;
 	const struct aie_tile_regs *kernel_regs;
 	const struct aie_tile_operations *ops;
+	const struct aie_single_reg_field *col_rst;
+	const struct aie_single_reg_field *col_clkbuf;
 	size_t size;
 	struct aie_resource cols_res;
 	u32 array_shift;
@@ -124,6 +140,8 @@ struct aie_device {
  * @partition_id: partition id. Partition ID is the identifier
  *		  of the AI engine partition in the system.
  * @status: indicate if the partition is in use
+ * @cntrflag: partition control flag. e.g. whether to reset columns when
+ *	      the partition is released
  */
 struct aie_partition {
 	struct list_head node;
@@ -133,6 +151,7 @@ struct aie_partition {
 	struct device dev;
 	u32 partition_id;
 	u32 status;
+	u32 cntrflag;
 };
 
 extern struct class *aie_class;
@@ -168,6 +187,20 @@ extern const struct file_operations aie_part_fops;
 	aie_tile_reg_field_get(aie_tile_reg_mask(adev), 0, regoff))
 
 /**
+ * aie_get_field_val() - calculate value of an AI engine register field
+ * @field: a field in a register
+ * @val: value of the field
+ * @return: value of a register field
+ */
+static inline u32 aie_get_field_val(const struct aie_single_reg_field *field,
+				    u32 val)
+{
+	long long mask = (long long)field->mask & 0x00000000ffffffff;
+
+	return (val << __bf_shf(mask)) & field->mask;
+}
+
+/**
  * aie_cal_regoff() - calculate register offset to the whole AI engine
  *		      device start address
  * @adev: AI engine device
@@ -221,6 +254,7 @@ struct aie_partition *aie_request_partition(struct aie_device *adev,
 struct aie_partition *of_aie_part_probe(struct aie_device *adev,
 					struct device_node *nc);
 void aie_part_remove(struct aie_partition *apart);
+int aie_part_clean(struct aie_partition *apart);
 
 int aie_device_init(struct aie_device *adev);
 #endif /* AIE_INTERNAL_H */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-part.c b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
index fc8f9f5..98f125b 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-part.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
@@ -217,14 +217,12 @@ static int aie_part_release(struct inode *inode, struct file *filp)
 	struct aie_partition *apart = filp->private_data;
 	int ret;
 
-	/*
-	 * TODO: It will need to reset the SHIM columns and gate the
-	 * tiles of the partition.
-	 */
 	ret = mutex_lock_interruptible(&apart->mlock);
 	if (ret)
 		return ret;
 
+	aie_part_clean(apart);
+
 	apart->status = 0;
 	mutex_unlock(&apart->mlock);
 
@@ -413,7 +411,6 @@ static struct aie_partition *aie_create_partition(struct aie_device *adev,
 		put_device(dev);
 		return ERR_PTR(ret);
 	}
-
 	list_add_tail(&apart->node, &adev->partitions);
 	mutex_unlock(&adev->mlock);
 	get_device(&adev->dev);
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-reset.c b/drivers/misc/xilinx-ai-engine/ai-engine-reset.c
new file mode 100644
index 0000000..fc0262f7
--- /dev/null
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-reset.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx AI Engine device driver resets implementation
+ *
+ * Copyright (C) 2020 Xilinx, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+
+#include "ai-engine-internal.h"
+
+/**
+ * aie_part_set_col_reset() - set AI engine column reset
+ * @apart: AI engine partition
+ * @col: column to reset
+ * @reset: true to assert reset, false to release reset
+ */
+static void aie_part_set_col_reset(struct aie_partition *apart, u32 col,
+				   bool reset)
+{
+	struct aie_device *adev = apart->adev;
+	const struct aie_single_reg_field *col_rst = adev->col_rst;
+	struct aie_location loc;
+	u32 regoff, val;
+
+	loc.row = 0;
+	loc.col = col;
+
+	val = aie_get_field_val(col_rst, (reset ? 1 : 0));
+	regoff = aie_cal_regoff(adev, loc, col_rst->regoff);
+	iowrite32(val, adev->base + regoff);
+}
+
+/**
+ * aie_part_set_col_clkbuf() - set AI engine column clock buffer
+ * @apart: AI engine partition
+ * @col: column to reset
+ * @enable: true to enable, false to disable
+ */
+static void aie_part_set_col_clkbuf(struct aie_partition *apart, u32 col,
+				    bool enable)
+{
+	struct aie_device *adev = apart->adev;
+	const struct aie_single_reg_field *col_clkbuf = adev->col_clkbuf;
+	struct aie_location loc;
+	u32 regoff, val;
+
+	loc.row = 0;
+	loc.col = col;
+
+	val = aie_get_field_val(col_clkbuf, (enable ? 1 : 0));
+	regoff = aie_cal_regoff(adev, loc, col_clkbuf->regoff);
+	iowrite32(val, adev->base + regoff);
+}
+
+/**
+ * aie_part_set_cols_reset() - set column reset of every column in a partition
+ * @apart: AI engine partition
+ * @reset: bool to assert reset, false to release reset
+ */
+static void aie_part_set_cols_reset(struct aie_partition *apart, bool reset)
+{
+	struct aie_range *range = &apart->range;
+	u32 c;
+
+	for (c = range->start.col; c < range->start.col + range->size.col;
+	     c++)
+		aie_part_set_col_reset(apart, c, reset);
+}
+
+/**
+ * aie_part_set_cols_clkbuf() - set column clock buffer of every column in a
+ *				partition
+ * @apart: AI engine partition
+ * @enable: true to enable, false to disable
+ */
+static void aie_part_set_cols_clkbuf(struct aie_partition *apart, bool enable)
+{
+	struct aie_range *range = &apart->range;
+	u32 c;
+
+	for (c = range->start.col; c < range->start.col + range->size.col;
+	     c++)
+		aie_part_set_col_clkbuf(apart, c, enable);
+}
+
+/**
+ * aie_part_clean() - reset and clear AI engine partition
+ * @apart: AI engine partition
+ * @return: 0 for success and negative value for failure
+ *
+ * This function will:
+ *  * gate all the columns
+ *  * reset AI engine partition columns
+ *  * reset AI engine shims
+ *  * clear the memories
+ *  * gate all the tiles in a partition.
+ *
+ * This function will not validate the partition, the caller will need to
+ * provide a valid AI engine partition.
+ */
+int aie_part_clean(struct aie_partition *apart)
+{
+	struct aie_device *adev = apart->adev;
+	int ret;
+
+	if (apart->cntrflag & XAIE_PART_NOT_RST_ON_RELEASE)
+		return 0;
+
+	aie_part_set_cols_clkbuf(apart, false);
+	aie_part_set_cols_reset(apart, true);
+
+	ret = apart->adev->ops->reset_shim(adev, &apart->range);
+	if (ret < 0)
+		return ret;
+
+	aie_part_set_cols_clkbuf(apart, false);
+
+	return 0;
+}
diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
index 2a0239b..0f46151 100644
--- a/include/uapi/linux/xlnx-ai-engine.h
+++ b/include/uapi/linux/xlnx-ai-engine.h
@@ -15,6 +15,12 @@
 /* AI engine partition is in use */
 #define XAIE_PART_STATUS_INUSE		(1U << 0)
 
+/*
+ * AI engine partition control flags
+ */
+/* Not reset when release AI engine partition */
+#define XAIE_PART_NOT_RST_ON_RELEASE	0x00000001U
+
 /**
  * struct aie_location - AIE location information
  * @col: column id
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
