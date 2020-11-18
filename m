Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4DB2B8D6B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB776E575;
	Thu, 19 Nov 2020 08:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680088.outbound.protection.outlook.com [40.107.68.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2316E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 23:48:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7ddRjjAxDJsq6cVUJDz9iVw1icYFrZOkHZyPm5UqRxStyhxkmOcr3hqjq9bz3L190FtYC5d9eOgvl7ldvRjSNoZCn1NdAlJZvPasOUH7IlQpdTYo2PAZnvjeC9ifDOyefdCVRnZm2Eq/TjgBe1UPuPAEa2byVT6ySaDTsjsDffwwHm9QpEx8KX9wXVYegIbijpSq5thVjYS/MyB1dWF4U9AhvSI2nfbPD/kK/jQwic8tUb78SWddaO8gPOfjsmdTeQNTz3V6MJQ8adKymOjdg4v8EaGIAtHWfuWSPeAfvPbgf67XQb/D+mKpUwMmA6+e48B+gTsqfzuKKojqB98AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9/IsjCOTiTkt0pSphdZ4YBLSL+jBXL0pj09EddTBEY=;
 b=Fmc1pGA6o95QqL4pMW5y6KYG/xgc3WhzWh61SAKnFQRW+JUX777vdRU/VgKyJKLFoWQPRK5InxG+M75wzA+erJf2H501ts4nQHtUoMWQLENaXTphnITwkI9EjgSa+oZ/nz4f12nogWpGt9Tk438cZU8y9s6jypPXf55eWz0YpUygLcjt/YF/tlI3neIc9AhIii3ExY2xW48PRU+Qziulzf+u7NCOF3NfevAipQBx+nKhoXv668DvduO89lJ6eWWIBxbexlnsQNWBaSD5l0q5frgUcjvJ5TfPMDkzxzGBRDBiSrSud71mKqqs8rhf40UsBFd2o7+wgqYYgM7iHKh84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9/IsjCOTiTkt0pSphdZ4YBLSL+jBXL0pj09EddTBEY=;
 b=tf2/XR1DF/9SrbUkCfPTQXnnO+0KKvITJoROt96bmvqXtUSungIMVOCRHMS05aFlD/egaOI53fzeAL7LUOdKpgYNH/SyLeZKDp/L3a3U74WLcTjAeunoG4Yh6ij67K+RyQvsjBZXCKzof4U6ou2AUZ19KcZUR3zdgjfDP19GrTk=
Received: from DM6PR12CA0012.namprd12.prod.outlook.com (2603:10b6:5:1c0::25)
 by BL0PR02MB6499.namprd02.prod.outlook.com (2603:10b6:208:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 23:48:26 +0000
Received: from CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::8a) by DM6PR12CA0012.outlook.office365.com
 (2603:10b6:5:1c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 23:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT052.mail.protection.outlook.com (10.152.74.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 23:48:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 15:48:11 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 15:48:11 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, nishad.saraf@xilinx.com,
 wendy.liang@xilinx.com, robh+dt@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=36324 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kfXBL-0000Wz-CW; Wed, 18 Nov 2020 15:48:11 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v2 7/9] misc: xilinx-ai-engine: Add support to request device
 management services
Date: Wed, 18 Nov 2020 15:48:07 -0800
Message-ID: <1605743289-26575-8-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
References: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5357e32-0bee-49d5-744c-08d88c1c7112
X-MS-TrafficTypeDiagnostic: BL0PR02MB6499:
X-Microsoft-Antispam-PRVS: <BL0PR02MB6499385D52A8A7AE4A339306B0E10@BL0PR02MB6499.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XA7RaO5NqxjzaVkKVvJi2WKddUJDLkhJuEMKTqI+5iahLRODMsfQwidnvF7r6XgBIAiEV7n/7VsPKStqgT2L+9Y7H1pSgBjCH9V5g7GCwqdAxXgkULXV2Ch6g9JGqGVWsTXS0X6pBfoLOac3F3CJYHiz4uMyacymJmC/T8Y/KyUezvM9ziW5XjN/K4l5HIisg3AKb746eBV0yQDacV4hk57RIsHFnSl67/FcRpE0WfvuGdBck5ty1SdNffoLg1eoVr+iuqNnL0sYihrPFXR2pTLmFNGWhpDZfYIorNRLrug9rZlmVMjNLmS/FHm7Q3ixcWybZrFi5xgaxFb1x5tPmkD3VDnlQ8hcoqwxgNpdscYQq0RnevfA6ys3/hbx5twKpfRqPjdsCFkbGKZQ17wzECN7ZGbsXNxd9roUEmf7wDP+pQ3YRN2/w0gAg/yngLi
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(6636002)(921005)(26005)(107886003)(7416002)(83380400001)(82740400003)(356005)(7636003)(36756003)(47076004)(82310400003)(70586007)(316002)(36906005)(478600001)(110136005)(5660300002)(44832011)(70206006)(2616005)(8676002)(54906003)(4326008)(8936002)(186003)(7696005)(426003)(6666004)(9786002)(336012)(2906002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 23:48:25.6293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5357e32-0bee-49d5-744c-08d88c1c7112
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6499
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
 Nishad Saraf <nishad.saraf@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nishad Saraf <nishad.saraf@xilinx.com>

Platform management services like device control, resets, power
management, etc. are provided by Platform, Loader and Manager(PLM)
through firmware driver APIs. For requesting some of these services,
this change reads AI Engine platform management node ID from DT node.
Some other features like clearing interrupts in the NoC interconnect
might only be valid for particular silicon revisions. For supporting
such silicon specific features, AI Engine driver will query and store
this information in device instance. While at it, this change makes
EEMI operations accessible to all the other source files in the
driver.

Signed-off-by: Nishad Saraf <nishad.saraf@xilinx.com>
Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
---
 drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 25 +++++++++++++++++++++-
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h |  6 ++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
index 7e69ff4..78eae90 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/file.h>
+#include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/list.h>
@@ -25,7 +26,8 @@
 
 #include "ai-engine-internal.h"
 
-#define AIE_DEV_MAX	(MINORMASK + 1)
+#define AIE_DEV_MAX			(MINORMASK + 1)
+#define VERSAL_SILICON_REV_MASK		GENMASK(31, 28)
 
 static dev_t aie_major;
 struct class *aie_class;
@@ -318,6 +320,7 @@ static int xilinx_ai_engine_probe(struct platform_device *pdev)
 {
 	struct aie_device *adev;
 	struct device *dev;
+	u32 idcode, version, pm_reg[2];
 	int ret;
 
 	adev = devm_kzalloc(&pdev->dev, sizeof(*adev), GFP_KERNEL);
@@ -345,6 +348,26 @@ static int xilinx_ai_engine_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/*
+	 * AI Engine platform management node ID is required for requesting
+	 * services from firmware driver.
+	 */
+	ret = of_property_read_u32_array(pdev->dev.of_node, "power-domains",
+					 pm_reg, ARRAY_SIZE(pm_reg));
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Failed to read power management information\n");
+		return ret;
+	}
+	adev->pm_node_id = pm_reg[1];
+
+	ret = zynqmp_pm_get_chipid(&idcode, &version);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get chip ID\n");
+		return ret;
+	}
+	adev->version = FIELD_GET(VERSAL_SILICON_REV_MASK, idcode);
+
 	dev = &adev->dev;
 	device_initialize(dev);
 	dev->class = aie_class;
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
index 131d22a..b21b7025 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
@@ -41,6 +41,10 @@
 #define AIE_REGS_ATTR_PERM_MASK		GENMASK(15, \
 						AIE_REGS_ATTR_PERM_SHIFT)
 
+/* Silicon Engineering Sample(ES) revision ID */
+#define VERSAL_ES1_REV_ID		0x0
+#define VERSAL_ES2_REV_ID		0x1
+
 /**
  * struct aie_tile_regs - contiguous range of AI engine register
  *			  within an AI engine tile
@@ -173,6 +177,7 @@ struct aie_resource {
  *	      while columns are occupied by partitions.
  * @num_kernel_regs: number of kernel only registers range
  * @version: AI engine device version
+ * @pm_node_id: AI Engine platform management node ID
  */
 struct aie_device {
 	struct list_head partitions;
@@ -193,6 +198,7 @@ struct aie_device {
 	u32 row_shift;
 	u32 num_kernel_regs;
 	int version;
+	u32 pm_node_id;
 };
 
 /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
