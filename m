Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F477DC30
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911E210E303;
	Wed, 16 Aug 2023 08:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85CB10E2DF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:26:52 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G7djRT002497; Wed, 16 Aug 2023 09:26:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=zAzle0Kt6BmFmmuK1dFnoQ3ucucMEYFvlsrhuDSEIpc=; b=eik
 emk2HaZp76wTH/A0A60peN8L0HKJQCKZFEAzOVJPsnhh5t7vt/07k/oBhr+9jlr1
 bJFBd1TfgDfPO2959krzLGsxeEkiqgI+jG0FNCkgkD8X29c7I1uuSPZQfrB9g6YP
 r3fYKb2eFjVXbAqfdPl8KG0CA7VqgFUhmrEs7e6vtihzZqqPdlnSEnFkzDDDZGIE
 yAfawDN5ydBI1+4KQ9P40e9ZBiHVXNEmldjm7kgSOtZJXVLfg/c/w+RWR34ruwa/
 Ub+m6gPWD1wOoMgNPJ/b8gRbv7Olfw5Ke1WazZHsNfrdRoIdZkwDSQAsRdNHhgGe
 4P3e/tlPKXXYnMLwA3g==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3se25ttuts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Aug 2023 09:26:21 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:26:20 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.58) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 09:26:20 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilA6VEPf8ZsQj/KVqpYOAVkvWDeXWHDV7ZM8EbifLuEQxhPyatlYqEuOKvPUNs8c69cFadZJt14xyAvnicZbIK3yAHZjDZxP4iRWOQe9vhr+PsEIJQ2iHGwioXZn1tIG2ldcy9+1ik6NiR5yCpJcIwjcFnklESvsV7P8nQ2T7szxAThv2cuwtDep5Ok9GqtLHJs1ZIOlrvUO/piIGBRj8qGAA3Qyzk9QYn5w5d9gKtvORII5sYUuwCLcVx+xlu5EkJg7i4uj7nZ826ieBHdCvlbPgijig2rHckxppHlfl7oBQTrPpgvrqAhMPFDFFgY5gQHK1UknIaBwlEKF4MEHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAzle0Kt6BmFmmuK1dFnoQ3ucucMEYFvlsrhuDSEIpc=;
 b=ld+ScYxhhltBRbbmMcIAqvvOK8NaxvwrqwDsujvbGrKaJaGlluTBqeisvPBbnkAVidkG0ojFFqRE7MtXtXMIVV2+cPxsbRyKrzw0tZJ8dpL/5t7haUe7CQkOqSmLWP1iAnDrgXI7qJXNUDeuEKmlfrgg6zb4/daHOUEDGCWdpmPXa+zG3rxxB7tPxhgvJiV9WVOzyd4vd5twlLGI563fkgGWuk1K2BKJfSYzn43i4YqqlClD9HMWDR3oHabe4BADUyWp7+0XiA76yvurSDbsAEqt36Cx10uF5ij9TO49J4CwLAppaVyw9uqE0skO4yZnlCQKYAkk3D6z2uSMGpt2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAzle0Kt6BmFmmuK1dFnoQ3ucucMEYFvlsrhuDSEIpc=;
 b=LbLj092TrGK2dxH26nrwRaeDqEI+c0AGzeWwc5iD2PW9kZsehnjj0N1h7gXQyy3UtBgshNHZfLTY3opfwc599Yeq9NhFn+MFNMsOfcLyqkreIMtaM5tfZXB2OgKZFt5E7d5lzgMEbzNKfonWJpyO61z94UQUDpxvs+LW1+qLn+Y=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2491.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 08:26:19 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 08:26:19 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 05/17] drm/imagination: Get GPU resources
Date: Wed, 16 Aug 2023 09:25:20 +0100
Message-Id: <20230816082531.164695-6-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816082531.164695-1-sarah.walker@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::10) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2491:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc26a06-2c8b-44a9-43e9-08db9e327778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VNhCuU2RQ1LJB+2LpBFscm93Capgj5qUEwUI/aWwvD5vTZbDDDo1EIRvv6L3WTLF5HZh+CtGHGuP0FlBeDFRVkbPBv7YbIqdjai5yegIdYMojHSatazu19DLz1/gROzj7r9BPK+JvWfuDO1xds3Z1A01Ht9qB7TztZvP+DvflkTIPLe8l6P5si+AGno6hsCav54zuVc/8KH9q7H4NYhtbagezfkCxxeNAnYfgDztnQ4Udj0Xf0Mz8DrOZg0EkdS5Dmbc1MXZB0hIgJIDaGMm/FXg4ZVPRFgNFOS5yrziVN2ZhrQWjh/Grbc7MmOVGxyMqso+UbuLIPbEq3QjUj65NPABqBg5mCq9E7JSRJRvxyXjmS2bAH4MZiZL9l8jXxkP+Dy1OfqL2IhfFMr517pPciSJSN1jcuENOyFLWOFmQUEiCMF0bnA/qzy0f39JiGok7LhxgL0jACQNELWT3s15eoa32/3c9wCoOHSB+/QoHSi/SWWuvCv2UBihtdjxCQrI0deTCIprGBTw7GX1jAi70r+W6uyhT713hKWHi6Iyu0/L5LW1eSCRdY3LR9bbTz1ivWKlO87oNcUzWTmhLe5GoR3d4YM7Hb5LmAt7ixVSlCxU3ZSM1nDbnihDhm/HUYCiK8inBygNTUnVhF6ySMcvww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(6666004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(30864003)(2906002)(478600001)(1076003)(26005)(6916009)(7416002)(107886003)(5660300002)(2616005)(83380400001)(41300700001)(316002)(44832011)(52116002)(8936002)(4326008)(8676002)(38350700002)(38100700002)(36756003)(86362001)(134885004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nROD5Cme30FiJ8vp93y4xvENKwm6k/TM6Tvlmj+OF4JgiSl/Y4+BQT6v2JB0?=
 =?us-ascii?Q?ADNFa4vMNziGucyBXPlocbJ8Dzj9V0cTIwRGM2GY54pizfTjI4zjNzF8j63Z?=
 =?us-ascii?Q?SYox1FsjDxftMIpaRRBQh4Ji3tY05faRRggKuBgkrM4Y6oXKGVhpy/JBwSrZ?=
 =?us-ascii?Q?3L5sIr3xVpuzXgHWsfUGStyyQp8u9VC7tCDqWcOtRJx9QqwUHo2XbB6rGUHX?=
 =?us-ascii?Q?G/5a9Iu6cZi1yTIVqNnKinNVy/tyG8voNKQdJ/IKqVMtrh/+pG2Wa+mnwicN?=
 =?us-ascii?Q?OY0fKaFFR829n+8FrziDIywRGcQtQvpMgYJwFGm/ZZcozhyzw+SrxdFZHu4s?=
 =?us-ascii?Q?tjzRHrCRo1oCvmPN7VBhU1mS7GMxWw/mS+/fAjePt4RsejXmwNf/WIT1pDRf?=
 =?us-ascii?Q?ElYDaGcxxHUZWQw4MOS8LDXcQ+tUTpVEW2sjl53YSbp4JoiG56EkyNGIswtj?=
 =?us-ascii?Q?Tt6IpBhdjk1SqnlVGmvsBn4NxhGRj4knf67ulCvZqTDqUkPDbt5qpnuegime?=
 =?us-ascii?Q?juS1iQkvKi42rh1D6tmw2gFC7H+lX8J1jzsF3HtFOrWZ69A+53fT8OwuQPiN?=
 =?us-ascii?Q?M1ZgPsuXS6iitEdiyHU5RnTxbySJwrBkL57lkt7SdAvtNzdqh896Mboft0ul?=
 =?us-ascii?Q?GI+uO4zc6lGkpzxUa0pfom1RS6TuLLokVayVwumvgfVFXA0yF3sM9FYzA41t?=
 =?us-ascii?Q?lNJtWj4DrMf5yt0HZqNEqNlshTZKCrlyNHx2+sGzTKqg6Q6kbLkN0JknUTAZ?=
 =?us-ascii?Q?mL80pxFWWx4nyGxVn6kwvVYzK9EK0zphbVuwbPHzXML1IxjRtFcle/eA2HXs?=
 =?us-ascii?Q?N6iA+VHwwNB8rqR9TRKVpFTNniNGDHwk/pcQ4In5A5J8c2DwrAWzpsj5PDje?=
 =?us-ascii?Q?SwMFZdTwwWmHPCk4xuf4vbsIJ2P4QoCHmdOcoaQROWxIcZLbUMW/pa0lHm4o?=
 =?us-ascii?Q?lpfJzx2JY6k6Cq1LSr0ZnxkZ/gQUoLvnlzpTj5M1+70w4N5kOqW5CsdlbliF?=
 =?us-ascii?Q?2/d4auz8blssgG8xhVqH9SFE/mfR8gSLsC72QqU+YdXdZNKXoHQ+X3gTdpq0?=
 =?us-ascii?Q?zVVAmi/w2XHiMUNNF5uNVg2QHs7le9bubmOFrMlHdPC6FVWuZC2mN0neYNLH?=
 =?us-ascii?Q?N7z0EiSDHNgvXi94zZ1Ul7aTAqGtZdScqMZzys8brPBZxr1O9Y1gbP7CYSN3?=
 =?us-ascii?Q?3U+djdaDQUXnUPqrBEYmHuxusbYd4D3x6wilX6S/+P32kFiWNBtm3DFGrAAU?=
 =?us-ascii?Q?f4iZb1Aw+7pNswUK8vuCv6dTbtieyuFhiPqOn+oDLm7ySkuXB8HsHcmWnNIb?=
 =?us-ascii?Q?rgnnNRmoUadF6laMFf10wukNGiF02fFoKt7MWDXtIjVmazQdNTIKlwL9Ilbk?=
 =?us-ascii?Q?s6oluWzlOAliGlGS968ZjsYnH65VmvW4rM5qQcUgqs30Onw7aBWhlYBn/8CG?=
 =?us-ascii?Q?5RhHiP+cy44F1+a6n/DA+Vo+xAmIxEdVZBwSA+kDsIqG3ZABh1ka1nZY8QVG?=
 =?us-ascii?Q?wySK4Q+5TUXubHMlK7IOIOVfKhsFsC04t8QsYp4MSbObnm7EExVF+mZuXe13?=
 =?us-ascii?Q?Wg/bxPrLBvR5H7CHfUeh3CBWRcrP65JT6z7jZhmenyZ8rOxaYcVe8TYsvDbQ?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc26a06-2c8b-44a9-43e9-08db9e327778
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 08:26:19.4443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NviLVIb1qv7AX9k+VQGavmFXmh5JNSesKimprc6s/+yiKUX+Fs4MgPdVRRZu0ljfkKMKHSCioqcuH/44zGqZSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2491
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: x9k6A56QmWqgzyU9KSZFfT7FVKLdALSe
X-Proofpoint-GUID: x9k6A56QmWqgzyU9KSZFfT7FVKLdALSe
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
 Matt Coster <matt.coster@imgtec.com>, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, hns@goldelico.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
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
index 38e17448013f..41a00d3d8220 100644
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
index 87b5c34e67de..ebab8b477749 100644
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

