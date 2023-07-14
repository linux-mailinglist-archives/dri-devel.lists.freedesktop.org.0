Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DFA753D43
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A763A10E89E;
	Fri, 14 Jul 2023 14:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB95810E8A7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:26:57 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36ECMOmq024604; Fri, 14 Jul 2023 15:26:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=QOCfjJmJD2WeI/Qg66gQ9
 3fpT4QFyGfCo7xC0UImk4Y=; b=xZ1VZgkOCHk21s25k+lqe0SE99G7Yww6MM0qt
 KNOinr26HecZ/AnTuFxFUjzczkPXZOze4QRyHwrr9qfWosDHkF7uDzfURBO/VchS
 k2eUzSP6ZbNDkQcHV/jR0VSXQN7UCwFFoIJpnJ4Z+4ISuRUiGfhOZMp7XYKy8t/x
 VtBHhF0ZjcjtJtrJu+fuB3ti1E5zXeEwJLmzrCd46ZVhTFl3pSeK7JU2D/hjQ2lc
 2pEfCxfgq2KKeCcd1wB17XaymcVCi6RzkWZ8uuURctzC+w7vtxoqqB332jfJZGaE
 37ClcktMBRDFlavZSVjuknEB8Mdb+FqJwbv8zqM4S3GfD3kDw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu80m5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 15:26:30 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 15:26:30 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.55) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:26:30 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNrNMzIzfvyCwU0piMB6rGRMDCMbXnL5GzEp1DS1yhdlSmzboU65/+beRFCblg6cmwft3p1ioYZQwe6bmJ0PF9xXQc3XDi00m4jGtakSsaCsJDA4ihW44uRTqTeLW0IidbP2kR9+lPD47h/3BJE+vC9W8xKGcZK2cO7Rfm7fNBwGe6qy1Lry1FST2UvpwR+pYpug0T6CjJyqsIITXHElqdrITZs67IaR1kkgV3Ar9NT4P2aEohJtR3ZxXcps9SeKna4PY9S5HdaltN8T4R1lqhUPO3jjWwTygOVqI7ePjyFrQJ8Jls0NbV0YKizqtsB6ff1EvnXHON0hfusO8yHgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOCfjJmJD2WeI/Qg66gQ93fpT4QFyGfCo7xC0UImk4Y=;
 b=XzxLNCmScKG6cMng0qe7Yx8yCKJa73fKJYIy0fPCPJY6FjvAt4upcCTOd8Xi4QosZB1j3f3WMeBUZlxXyTxDnSK13Kjzib2faQ0dbZLZBLbvkLKA5vQi8TO7Q8jqbc3TGcEXVxfrjQNUOrUK/o7+1qcm31VMRrPQn6OIuXx8ncxu46shOdPlRfDmwtiEajGa8d8DoSm8evVnd01zryb2bEhiEc2w++ft6sbwTcKwtpw9xlpDY2Qg7pazz7OPzLoK+rNoDHXwN7L8MoYKVl8smdeMOI7Lp7/wfkzdRBbsUQgG9f3TZBrtqenyIw0RdKTJPy8eNbs0CHsRiqrbYFwIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOCfjJmJD2WeI/Qg66gQ93fpT4QFyGfCo7xC0UImk4Y=;
 b=dlSDIxkbPmb9+AMKXblrbZMofz8ZzHL3xzZDf+c2PKge0/8QxqIuE3Z0/h4QAKBLyshqkRu5bG7fPjQ2gbJO+P0JzqQMUGuQX9HLfGCHuvehmnXZKlG1MYmHRvcWkoYJ7V3IaDjOz8dh3063zndCot9YsP1lpfiD1yfaN2cyb9k=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LOYP265MB2077.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:26:28 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:26:28 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 05/17] drm/imagination: Get GPU resources
Date: Fri, 14 Jul 2023 15:26:18 +0100
Message-Id: <20230714142618.111746-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0045.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::20) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LOYP265MB2077:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c319b75-65e8-4d86-e017-08db84764fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sv/zheh3kM4poDEbRbSEbt4NQfGh7uaSCI+zJl7eEhmuJBiygSTdn00xCWgCTvLCcomSgQ33hBhJS97AxwITsLeMYYPhb6MLbLwR7IeiDlEeUbpyBxmtaFulVy9aKRLBuw2OYG+7lAc9zypLZ5+GVuYMD4l6EBCEZHsTeehX/4NcGygJ87p+i7nDl3Wfn0KUFONMx4TsepKxCC2Zi/CWqblKMHG7c8axBfOMprvWeg+ZWXz/NItfZmcKGqlu7gupbo8BA4uzdujcYQKpXCrASCO4xIXOB6Lt7LtC/LyKk66Rr/ZiM9Ki10Gy1zTu4wR9mT8aJTylBbtQVedqbsOZ414nLFJgi+zl7UYJC7QxLHFv4ii1JgCkbuOnVqOF4VoNefz9XWP4XL56QjW4Qc2+tbY06f0lDXDkgg6qTOWkyqDv9+O/yUHqZyvpZa0rBeHz/LoKAlRXtABejp74HOSwfmFUgEHkPl6UQokEf3BKOo5VX6FxnH/CS3A0qOWHLlUe0uMqOLfdsGYh8gb+tJNZJgP+uQwjUfTLMaZAHb77hNrtd2PIBfcCAOCPFRH2EzN6XOleliTDeF3cYOCGgvfBS/qBayvgHGSAzlkahVDUFXyYQxB/yRFjLItgkilP6x7Mdrz9Y0GKZy+4gyQu+JwVAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39850400004)(451199021)(41300700001)(44832011)(66476007)(7416002)(4326008)(66946007)(66556008)(6916009)(478600001)(30864003)(5660300002)(2906002)(316002)(8936002)(8676002)(6666004)(6486002)(52116002)(6512007)(86362001)(1076003)(26005)(6506007)(186003)(83380400001)(36756003)(38350700002)(2616005)(38100700002)(134885004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dr8BOCwHPNdVyhcLuc13Z0NMob9oPqrEttWpXSwJholkN6rHWy76VsyGDXdf?=
 =?us-ascii?Q?oaUncAJx96qq2Ws29zrMf+Hp9UAtoVBTonoCzHqDLhguOtMYTeSVsqR4wFfY?=
 =?us-ascii?Q?43kTwkG66otE8ykgiaAJ+jNFtIiqhdUYI4n4tEa5kufhqiDH+FExZn53E6/h?=
 =?us-ascii?Q?7qwOtFLBP6CnjgOj+5m629W4yFQzuq6gsttWjKf8S0wNtZKNXo1vIlOzSsyh?=
 =?us-ascii?Q?/5QQkMfEDvBOaOILP3OhwBcIC7rHwexTSuizjb7+czjCnzqhTmL0CKd3wBCl?=
 =?us-ascii?Q?QTbMgvAJkWaN1fK//NBrAe2CXeFSGdLF93eDbuUSM2H80/QiLaziQXEy4iPh?=
 =?us-ascii?Q?ZXgxMwghQZNtekedTonrHSSva2Ktap/tmYXad/7IojSmK3evGooIWlWJGeQU?=
 =?us-ascii?Q?9QChfSVaV/+5on77pRcbtIylVzv230teh93V+lPZt5bEf0OJ45o/AX18bcjk?=
 =?us-ascii?Q?nhUoz8MtXdZfjvSY/KEK31ou0VRO2P3p2bx2wAp35o4V9Dz5RpM3AFouj4or?=
 =?us-ascii?Q?G+9/okAA+dIAXPKiJUG/oUeR6NZYxwQZHf2IlgF/81GdXNqv6ni+2VeN6SRr?=
 =?us-ascii?Q?AUk+L2ybATjz7Jnpkm4p3JWXZ2TI0e3+0jrTKAa+1+3MqiuW5ZwGSmCz1vH2?=
 =?us-ascii?Q?dRIDkFRuadz0MEiF5igwVnOGIb+Wz2SUYxoDwkSdDTjKM/OouX4fPTiq+Agj?=
 =?us-ascii?Q?LN8xVfvio+/3WgWftGyuF63FJVEXJrWGwwhVO1Dy5qAGE3uUDToGRg2vWFWJ?=
 =?us-ascii?Q?2NBkTS3YKQu/+x1Gs2rml47ykt/YbnSSrAjVgL/cy8M99ZtpceUjPlkS/msb?=
 =?us-ascii?Q?TvVvqciZCe+/UnighKGhybdpG3reU/mfAG37Ay3blUHfvXFzkcVtPz/F6zX3?=
 =?us-ascii?Q?W887geVvHibfixgKMjCm1/hBNX4bD8JromotuQ1XViBwzMVjGhanWxBZsLTg?=
 =?us-ascii?Q?Crsq5yk1VJbGfiGLOW2OboTzq+S5qM6WSNxR0sY8iD7SF2B+U8mUrHT488uh?=
 =?us-ascii?Q?mDFpghJVILEHkLuXRmw7dSEb3DvRlHRSPelAfGkyR0zy82aaOixHQhcGwEYk?=
 =?us-ascii?Q?z7sjyJB0zztUr/PIJHPGmjwHdHYdAGKnC0UwnZ+kWOGH//kUC+IK+gw+ZP5p?=
 =?us-ascii?Q?eDGugrAQ46UU3MeF/j3lbViiEBs2YCrjqjcjOf8k7oyV7bVIa4dLgeJkV4cS?=
 =?us-ascii?Q?oZqvqj+uPVNnevCibw8QmtnytuFrChvb8kTc+mBLZ7jPg+mORPNr89j8i7Vz?=
 =?us-ascii?Q?gpmMUgxXbRFmKp+AM1bBxAhgdnSXU6TrWob0rFtXkKzQmHiX4x1hRmQQCEhQ?=
 =?us-ascii?Q?dCs0KTA7IpNzl60hu5TtZkTPzNTfmTRex5oyMzK1NaVwCCGrVEsP/wkZKBjn?=
 =?us-ascii?Q?WIBDX/fA6uRDL5Oy4W/3lYGgbEJmH1EyDgpVImNvF6DEaPUGG/iAVZCcWiwF?=
 =?us-ascii?Q?HB7jsdasP+LEMV5awCDI9gGke3LyjyN0aYcq3PGcJPOw6pLpHc33jNzM1YT0?=
 =?us-ascii?Q?ZP/01gcuaSo2RAvQ1OECFYS+pLSor/d3icWJoS8ug7M9e+8yY+2CDiHDV/Lu?=
 =?us-ascii?Q?Hk8TW8Qz+z1kq6OdCYsgdEqJGZe+03wpyUMe2GtRbBavYgICOZXQ+nNZSfpg?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c319b75-65e8-4d86-e017-08db84764fdb
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:26:28.6428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SS1kyO2YN4EwaOzCycdxe5rUoENQfORyDAbHYfxnk7aHExQ7oQ+5he6cKdtaSdpoY1FSvopnnIiSwITvCs7uTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2077
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: rbN6Ld3Mk-gMAu-beti6DN_QL6-deNH5
X-Proofpoint-GUID: rbN6Ld3Mk-gMAu-beti6DN_QL6-deNH5
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 hns@goldelico.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acquire clock and register resources, and enable/map as appropriate.

Changes since v3:
- Remove regulator resource (not used on supported platform)
- Use devm helpers
- Use devm_clk_get_optional() for optional clocks
- Don't prepare clocks on resource acquisition
- Drop pvr_device_clk_core_get_freq() helper
- Drop pvr_device_reg_fini()
- Drop NULLing of clocks in pvr_device_clk_init()
- Use dev_err_probe() on clock acquisition failure
- Remove PVR_CR_READ/WRITE helper macros
- Improve documentation for GPU clocks
- Remove regs resource (not used in this commit)

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c | 147 ++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h | 152 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c    |  18 ++-
 4 files changed, 317 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.c

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 62ccf0ccbd51..186f920d615b 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -4,6 +4,7 @@
 subdir-ccflags-y := -I$(srctree)/$(src)
 
 powervr-y := \
+	pvr_device.o \
 	pvr_drv.o \
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
new file mode 100644
index 000000000000..9c838c15a987
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+
+#include <drm/drm_print.h>
+
+#include <linux/clk.h>
+#include <linux/compiler_attributes.h>
+#include <linux/compiler_types.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/gfp.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/stddef.h>
+#include <linux/types.h>
+
+/**
+ * pvr_device_reg_init() - Initialize kernel access to a PowerVR device's
+ * control registers.
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Sets struct pvr_device->regs.
+ *
+ * This method of mapping the device control registers into memory ensures that
+ * they are unmapped when the driver is detached (i.e. no explicit cleanup is
+ * required).
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by devm_platform_ioremap_resource().
+ */
+static int
+pvr_device_reg_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
+	void __iomem *regs;
+
+	pvr_dev->regs = NULL;
+
+	regs = devm_platform_ioremap_resource(plat_dev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(regs),
+				     "failed to ioremap gpu registers\n");
+
+	pvr_dev->regs = regs;
+
+	return 0;
+}
+
+/**
+ * pvr_device_clk_init() - Initialize clocks required by a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Sets struct pvr_device->core_clk, struct pvr_device->sys_clk and
+ * struct pvr_device->mem_clk.
+ *
+ * Three clocks are required by the PowerVR device: core, sys and mem. On
+ * return, this function guarantees that the clocks are in one of the following
+ * states:
+ *
+ *  * All successfully initialized,
+ *  * Core errored, sys and mem uninitialized,
+ *  * Core deinitialized, sys errored, mem uninitialized, or
+ *  * Core and sys deinitialized, mem errored.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by devm_clk_get(), or
+ *  * Any error returned by devm_clk_get_optional().
+ */
+static int pvr_device_clk_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct clk *core_clk;
+	struct clk *sys_clk;
+	struct clk *mem_clk;
+
+	core_clk = devm_clk_get(drm_dev->dev, "core");
+	if (IS_ERR(core_clk))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+				     "failed to get core clock\n");
+
+	sys_clk = devm_clk_get_optional(drm_dev->dev, "sys");
+	if (IS_ERR(sys_clk))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+				     "failed to get sys clock\n");
+
+	mem_clk = devm_clk_get_optional(drm_dev->dev, "mem");
+	if (IS_ERR(mem_clk))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+				     "failed to get mem clock\n");
+
+	pvr_dev->core_clk = core_clk;
+	pvr_dev->sys_clk = sys_clk;
+	pvr_dev->mem_clk = mem_clk;
+
+	return 0;
+}
+
+/**
+ * pvr_device_init() - Initialize a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * If this function returns successfully, the device will have been fully
+ * initialized. Otherwise, any parts of the device initialized before an error
+ * occurs will be de-initialized before returning.
+ *
+ * NOTE: The initialization steps currently taken are the bare minimum required
+ *       to read from the control registers. The device is unlikely to function
+ *       until further initialization steps are added. [This note should be
+ *       removed when that happens.]
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by pvr_device_reg_init(),
+ *  * Any error returned by pvr_device_clk_init(), or
+ *  * Any error returned by pvr_device_gpu_init().
+ */
+int
+pvr_device_init(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	/* Enable and initialize clocks required for the device to operate. */
+	err = pvr_device_clk_init(pvr_dev);
+	if (err)
+		return err;
+
+	/* Map the control registers into memory. */
+	return pvr_device_reg_init(pvr_dev);
+}
+
+/**
+ * pvr_device_fini() - Deinitialize a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_device_fini(struct pvr_device *pvr_dev)
+{
+	/*
+	 * Deinitialization stages are performed in reverse order compared to
+	 * the initialization stages in pvr_device_init().
+	 */
+}
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 42224b5247df..a85a2d7192d9 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -11,9 +11,22 @@
 #include <linux/bits.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
+#include <linux/mutex.h>
+#include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <linux/xarray.h>
+
+/* Forward declaration from <linux/clk.h>. */
+struct clk;
+
+/* Forward declaration from <linux/firmware.h>. */
+struct firmware;
 
 /**
  * struct pvr_device - powervr-specific wrapper for &struct drm_device
@@ -26,6 +39,37 @@ struct pvr_device {
 	 * from_pvr_device().
 	 */
 	struct drm_device base;
+
+	/**
+	 * @regs: Device control registers.
+	 *
+	 * These are mapped into memory when the device is initialized; that
+	 * location is where this pointer points.
+	 */
+	void __iomem *regs;
+
+	/**
+	 * @core_clk: General core clock.
+	 *
+	 * This is the primary clock used by the entire GPU core.
+	 */
+	struct clk *core_clk;
+
+	/**
+	 * @sys_clk: Optional system bus clock.
+	 *
+	 * This may be used on some platforms to provide an independent clock to the SoC Interface
+	 * (SOCIF). If present, this needs to be enabled/disabled together with @core_clk.
+	 */
+	struct clk *sys_clk;
+
+	/**
+	 * @mem_clk: Optional memory clock.
+	 *
+	 * This may be used on some platforms to provide an independent clock to the Memory
+	 * Interface (MEMIF). If present, this needs to be enabled/disabled together with @core_clk.
+	 */
+	struct clk *mem_clk;
 };
 
 /**
@@ -56,6 +100,114 @@ struct pvr_file {
 
 #define to_pvr_file(file) (file->driver_priv)
 
+int pvr_device_init(struct pvr_device *pvr_dev);
+void pvr_device_fini(struct pvr_device *pvr_dev);
+
+/**
+ * PVR_CR_FIELD_GET() - Extract a single field from a PowerVR control register
+ * @val: Value of the target register.
+ * @field: Field specifier, as defined in "pvr_rogue_cr_defs.h".
+ *
+ * Return: The extracted field.
+ */
+#define PVR_CR_FIELD_GET(val, field) FIELD_GET(~ROGUE_CR_##field##_CLRMSK, val)
+
+/**
+ * pvr_cr_read32() - Read a 32-bit register from a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ *
+ * Return: The value of the requested register.
+ */
+static __always_inline u32
+pvr_cr_read32(struct pvr_device *pvr_dev, u32 reg)
+{
+	return ioread32(pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_read64() - Read a 64-bit register from a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ *
+ * Return: The value of the requested register.
+ */
+static __always_inline u64
+pvr_cr_read64(struct pvr_device *pvr_dev, u32 reg)
+{
+	return ioread64(pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_write32() - Write to a 32-bit register in a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ * @val: Value to write.
+ */
+static __always_inline void
+pvr_cr_write32(struct pvr_device *pvr_dev, u32 reg, u32 val)
+{
+	iowrite32(val, pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_write64() - Write to a 64-bit register in a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ * @val: Value to write.
+ */
+static __always_inline void
+pvr_cr_write64(struct pvr_device *pvr_dev, u32 reg, u64 val)
+{
+	iowrite64(val, pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_poll_reg32() - Wait for a 32-bit register to match a given value by
+ *                       polling
+ * @pvr_dev: Target PowerVR device.
+ * @reg_addr: Address of register.
+ * @reg_value: Expected register value (after masking).
+ * @reg_mask: Mask of bits valid for comparison with @reg_value.
+ * @timeout_usec: Timeout length, in us.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ETIMEDOUT on timeout.
+ */
+static __always_inline int
+pvr_cr_poll_reg32(struct pvr_device *pvr_dev, u32 reg_addr, u32 reg_value,
+		  u32 reg_mask, u64 timeout_usec)
+{
+	u32 value;
+
+	return readl_poll_timeout(pvr_dev->regs + reg_addr, value,
+		(value & reg_mask) == reg_value, 0, timeout_usec);
+}
+
+/**
+ * pvr_cr_poll_reg64() - Wait for a 64-bit register to match a given value by
+ *                       polling
+ * @pvr_dev: Target PowerVR device.
+ * @reg_addr: Address of register.
+ * @reg_value: Expected register value (after masking).
+ * @reg_mask: Mask of bits valid for comparison with @reg_value.
+ * @timeout_usec: Timeout length, in us.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ETIMEDOUT on timeout.
+ */
+static __always_inline int
+pvr_cr_poll_reg64(struct pvr_device *pvr_dev, u32 reg_addr, u64 reg_value,
+		  u64 reg_mask, u64 timeout_usec)
+{
+	u64 value;
+
+	return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
+		(value & reg_mask) == reg_value, 0, timeout_usec);
+}
+
 /**
  * DOC: IOCTL validation helpers
  *
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 2035131e6177..5e079ad46441 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -465,6 +465,7 @@ pvr_probe(struct platform_device *plat_dev)
 {
 	struct pvr_device *pvr_dev;
 	struct drm_device *drm_dev;
+	int err;
 
 	pvr_dev = devm_drm_dev_alloc(&plat_dev->dev, &pvr_drm_driver,
 				     struct pvr_device, base);
@@ -475,15 +476,30 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
-	return drm_dev_register(drm_dev, 0);
+	err = pvr_device_init(pvr_dev);
+	if (err)
+		return err;
+
+	err = drm_dev_register(drm_dev, 0);
+	if (err)
+		goto err_device_fini;
+
+	return 0;
+
+err_device_fini:
+	pvr_device_fini(pvr_dev);
+
+	return err;
 }
 
 static int
 pvr_remove(struct platform_device *plat_dev)
 {
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
 	drm_dev_unplug(drm_dev);
+	pvr_device_fini(pvr_dev);
 
 	return 0;
 }
-- 
2.41.0

