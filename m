Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1D97BFDC9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B96610E37C;
	Tue, 10 Oct 2023 13:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D971510E378
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:38:55 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39A6eZgT030133; Tue, 10 Oct 2023 14:38:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=IrMG9VqREhgYbg2+mmV6aFgpFgwVguMbYmRuhluut9g=; b=AY2
 XAT47ZNSTh+NTKJLYhEdYdbGsUyxPVWc2VjV1d4MtrrY0oMBeFVcOrvcw1AiZ5Sg
 5DHu00QGk4GHoINyWVFjok900QLhwkuuE1JzaAXsLurFcm6ws35c1BVpD24d+2zq
 WL3Si/7RlX2zRQ9yNZAOkstVlIhuNRL8ILnm64tv2tgsLxXSoVb1vrfbBHqYus6e
 jD+8ijBtbw7/IJeWxXfAUXQhMchR8k+s0cpXkwKE1teR3Qd85ACACoX+6AjN1X9S
 Pv5Qvh53vcbhVCzZvBZYD416vK8Zs+0uclqmgDAwWOJzFy60rW/sUHNRa9RsD20e
 Kc2k2zVn00PzpKIA89A==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3tjydrt72g-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Oct 2023 14:38:13 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 14:38:11 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Tue, 10 Oct 2023 14:38:11 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQj8qQOmedPifx1QMq7mKTeQulDvu0b29xUEkJ35h2ebqanmmQonHWwQj29x9vmBHeBRUDNKmmt63dROY7Le4WxkzQKB5xBtZsHFA4Fv5zFebZRsxL5PJE9yWhvdCLUqJQ0nEWPJ281YsAzCmiUlVKMc5k39ZHfQeilcFfAg39yAN6d7NKTJFK3TTikJbNCH9yRvDcC+lXgkt6oK0iZdvFYgmPMjXZEuXb1l72bZYtFpFsjHgDEzefB3Qp564njf67yYOAtJSZmsDEAxnsaeNBjix1fsXOmBxcTm1Su/QT84g4YrmJh06LXg0A6hJXLa3y7HDrU+YURHc2AF2NDm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrMG9VqREhgYbg2+mmV6aFgpFgwVguMbYmRuhluut9g=;
 b=irx1WXcx4UN9rXW3w7LSqMJAI+wgFB6VTtscKGDZkvG1oX2sHkIVh0VBRZv5jKluq0zyra/ycijj5EiiUPSr0p55KHpftITgadf6h936NrIYuAThmVhZ9EkwA0pGT2xD3Dkvfahoji/c6DrulUFsmE+qFW+yctUUA5ibVsShfbmWnqLzCFDw8CmbLZJdElHw6at8/8FD5X2KqtOwBVNmm5BwVtUJNDUyfMFGXEU5SXWPxUVgYmY7Jyn9JUDj3rUyZvmAQYMPjVPvPkU9EbDCunpTE0JvdyOE7dq2LijNTC9yUOWpG+EeN71UxseB5IGAb9yYGXIw/wK7goshxDH4Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrMG9VqREhgYbg2+mmV6aFgpFgwVguMbYmRuhluut9g=;
 b=GhdHAqrPuSkLaSS9fEoh2uLdI7xRgzksW2CvJmvkvQWnTSEzc0RH8z6gTgHpnkiqhLvn2ndnxJKdiiw8TL/w7izp5En41/lkyuqTgpBUbHHFa3Cc0v8DHsQ4cVlRgEaUYW1PvCmbfUICzLITbBi/Ru4G9tSAqZMAxyVaEXpRsL8=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2442.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:38:10 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:38:10 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 06/20] drm/imagination: Get GPU resources
Date: Tue, 10 Oct 2023 14:37:24 +0100
Message-Id: <20231010133738.35274-7-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010133738.35274-1-sarah.walker@imgtec.com>
References: <20231010133738.35274-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2442:EE_
X-MS-Office365-Filtering-Correlation-Id: 4154031a-a201-4b12-a7d9-08dbc9962485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6DrFYHx86X/YEZfJ8SSeXhfyB/3M+7aSBoltfX/0s8BNfR5zcvNivBfU9EQX9H0Uyj+Wi7JwqQ622hVoQsUQIInvX0j+X8rKTFc5VmyXjVBgd4Cb6NcSI5h2lmx+NmhgiSEOKXEtFy4Gxa1IEl7FzivzCmmgNVOjXRhrqVbbZHaNVRrInpheKVTnRFso9MNqoanV/YC0bGmnHVXkNgpCQELzFZ+vwXVwpH0hyZxuJ1Fxvd2u9dzr8t1FAb4F4/aN+GXnVB2FG29Vcx4T0C6/kxp+hQ9morr8BG0w+hJ+g98WAig1/CI9j7raoNGswGc7Kpajg8EYXVI2tKGUfx1IOO5U90Hk8ue85hNgf1ehcrUfJUUud4hFFbB+5ZBjLBAAHg4l1kiLQ6M/XnmreqvKxwLBdOz3H9T72jrRdiyk+BZ/kbP+53Ayu7nEqvM/L8oISrQm2f47NpbSdK87Fo3P6hKN8voZJG3WDj1762ytprhnmRt6i1Vtq7LTbakCBC8LLjzr7M1SB3d5oAM6dhxL6NFZLV2XyFJvcnXGqDwckmCyn1cSSDbF5FaB07hfbojXqwUECuFJ6NvPHMTu18XQYcMNpJUa2IlmBcA5fDbOxonerrGu158Y0Zx3orZTqz+nIOAwSWEfKHGC6pMwfkcjYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39850400004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(107886003)(6512007)(52116002)(1076003)(6506007)(2616005)(478600001)(6486002)(6666004)(44832011)(26005)(83380400001)(7416002)(2906002)(30864003)(5660300002)(66556008)(66946007)(66476007)(8676002)(8936002)(6916009)(4326008)(41300700001)(316002)(36756003)(38350700002)(38100700002)(86362001)(134885004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SGRfIrlby3y06kUL/p558EgCc8/WN/N9C05YkxIZQCaWoYkxoPY6Lp87Cb3n?=
 =?us-ascii?Q?XPkmZVkVlPD1fpxhtRv5WPdOCHWhYgJdFXYbtZ9R1RVH6yGNV9n0n5hs8z8T?=
 =?us-ascii?Q?JTxyBiFW3zKG1ofyHh62EUDr14/u5rD93JNts8Ch+IeIeCBhaFpV5I7hexPs?=
 =?us-ascii?Q?HWN+LmGSmmwtOxuZnADkw9jw5hNtnI/s0vFElvkOUjkaQgd+D2Ip/u48ftWW?=
 =?us-ascii?Q?1CC4LMS4iDIobRlMAWmQY/f+y+cBONYqSLz4Nagdnqk9EcaYkq7YuNQSIYdT?=
 =?us-ascii?Q?6ZbNNnlGLVHGCUuj3z4eHaprv7obHOS49Q0rgtWoC60jWKuD2oyoy9tlN5et?=
 =?us-ascii?Q?ERHYxRI1P3r8ksVcyZssn4xK0oVRG52704WM7dUbNEMiXjgnDqC+pBoU5vEG?=
 =?us-ascii?Q?ZgogRZs9PZDG1a8SjX6PvWIoQUn8GXRt7EKL2hA4k+5Y5C6TPcSe2Nf13TA+?=
 =?us-ascii?Q?+t/RlL+9v5M4J6cAgxvQPtLgepsEDt1nDHL+M5obD1kHSrTNBd3cyw21ad9S?=
 =?us-ascii?Q?ZcGvaxS1fE4iSPPGFxIe1RwkMEB/umfPDa2d+KsHDLMPyLwudT/9UPuSrx+Z?=
 =?us-ascii?Q?ra3qE6yBdNzRKPLyQLsxA88+uPx+2FFPgaQlWDC7bcYstFHyp38RsAI5lo1v?=
 =?us-ascii?Q?fPZivULN97x9Rp9TmPgF9DoDdxc4g+hexQs7umQY2COPtMIzcp7wBGd+xRup?=
 =?us-ascii?Q?X6Ro13LyeAKhmUYYtzxURygt4MIezQPQ7AnKgyruNgGBt8Q/y+n+xp/zMgFH?=
 =?us-ascii?Q?iGQc7S6QqvSHpm89pfd4MahSE36EyZ75qY4AHiyuE/diEdh1KMOakzN8NaFI?=
 =?us-ascii?Q?op1+GZROIWVE97mJay0JQkAi6hYm0NjbVuB1m8PwS1LKJIPOhpZPTKZ61syZ?=
 =?us-ascii?Q?ks46Xh5IsK9sZzTnlomOhF0Qseg055ugRaAA+V7GUI5f8AxmuK63XEf0gyGP?=
 =?us-ascii?Q?ow9rFnEsA9jQVMGbra44DS0mD2yFG/Hpa7S2nOkAPUk05wyKFBfzVNGMZchT?=
 =?us-ascii?Q?yoTiglOmft4srmc+hMLFDppUbR4/A6tyjSMG50aNrksQhxdqhEVtxQMZ1EDT?=
 =?us-ascii?Q?5qMwA0/39fwha8L/Rq6m7fX2Tnq/xuZBghqcAJstDU24B0yiOG1IbUWVKJcE?=
 =?us-ascii?Q?rCDqguMIdQWcHzkdiPpFylBhfwWRM+uRUWjvye/HoiXqPWkzelgXm3GmgQHk?=
 =?us-ascii?Q?4+3GhM8Kh+a2iU0lXujQ46ep/gecdKyrUMGI6GYvwp0evzmiz965lzy29oje?=
 =?us-ascii?Q?ZfyqHVEPB+Z9f0Pf5fNY3esQDeCWLVKpr1hpiJ2HY50WVz8C96IkR3uVNyss?=
 =?us-ascii?Q?d3UbvSa2e7vgDdkvozvIAgZEa91FPnu5u3Ozx7cVjzkpfkAL/hkk9jJ+xduG?=
 =?us-ascii?Q?LIfeld7n7ER1obXuU2r2zZzzetToIV2EDN4w0AUwUgPVwMN3GbH2Wxcsv5Wb?=
 =?us-ascii?Q?GPzkwNArBhx4Q97BJDouEbYH4YCKuYbH23Pu1sn/lIldOkoGpNaQE0dD9QTZ?=
 =?us-ascii?Q?vfTOjUzstA6I6zEWqLUKOrUsp1dNbsjU2rKePM8qTLrBm/KbD7/YqErX26xI?=
 =?us-ascii?Q?UgRxEY1+D5ERE5+0trDO2OsPlOz7+aN7tJ1wBfgi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4154031a-a201-4b12-a7d9-08dbc9962485
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:38:09.9771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWS6TpTNQy8dGZMGSYaRK0P8mFaAs7OOFfIxEeRFdXzpGUGQivphcZt6YC+CSe7h+edeJ+N0uhShkmY7HdPsgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2442
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: kyrOjw9KxLENOKHaRWKpgvGcGZykoZoO
X-Proofpoint-ORIG-GUID: kyrOjw9KxLENOKHaRWKpgvGcGZykoZoO
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 Matt Coster <matt.coster@imgtec.com>, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
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

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c | 147 ++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h | 152 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c    |  18 ++-
 4 files changed, 317 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.c

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 19b40c2d7356..b4aa190c9d4a 100644
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
index 000000000000..cef3511c0c42
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
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
index 53b1cdb5a6a6..d61b3615b49f 100644
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
 
 #define to_pvr_file(file) ((file)->driver_priv)
 
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
index a23bef62b52b..e007d6946bdc 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -464,6 +464,7 @@ pvr_probe(struct platform_device *plat_dev)
 {
 	struct pvr_device *pvr_dev;
 	struct drm_device *drm_dev;
+	int err;
 
 	pvr_dev = devm_drm_dev_alloc(&plat_dev->dev, &pvr_drm_driver,
 				     struct pvr_device, base);
@@ -474,15 +475,30 @@ pvr_probe(struct platform_device *plat_dev)
 
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
2.42.0

