Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CD7DCFF6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B9410E524;
	Tue, 31 Oct 2023 15:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50A610E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 15:13:49 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39V7NESW029243; Tue, 31 Oct 2023 15:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=GiTGrgyTcxoTne1TGiGrEydJN1DrQJuD+4s3paRBaZs=; b=k5t
 GbeLY2KIHYM4HRElkTM1quJdUgU6utqT1F4kMx5reshHup/RuZy5BDzz+cQjNXB3
 NBqM2pNQbZ2UEgwPgK+dD24m2f2d61zByZt8zGv5TZgRQtrphXlVoXwRHZ2E8WZf
 fHdaBCwMq1nD1EKRxGKUgZX9U0KOxlK9+qhXOmNSDrSxC6UzQGvTyqeL4/XPVy94
 4hT7hQdS1PRDhTWklZDES8CXlEC4dKJgH7HLtzGC195FOS/X/xoLiCkn320jCerr
 lBd2OSj2Q8K5WdN7zm6Qs+mnVq8Wb7Jh1xE9/k5SB5rcgSG1vO0DHwsb8jkCJbZm
 A7aR4+mNbXV2VpFNTWg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf3w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Oct 2023 15:13:18 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:13:18 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:13:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDVyg/YwQkHjkC4ja8+1LqdVRKotMcwuozdDxDDs9vvqfDLw9S0cOjGKEVXrc712A8tAGGUJ88oHphu4qg29CeJcvE9wyLc7XXNgATU0Nc6BG0L4wnlOp/lkR0/02ryST/+Q5Gc2fNGQzfl/Uhk4GAtP8ohgWePbypnDVHEpCDoMQTZSZqeJS2WdE2+qrYRnSsJr/c2he6ESbaUSWSL7o1TJ9TTUWcToQyB0r30Vteyyte5Lp41vudkz9mrrnN69Db0GzCXPGNLNdJtj47XkeAvIK/Hsr8Y/0ZsxmuWi/3IVmeb4k7MVhyB0t7uCJg4Xk5H88B/hsumEvgSIt3OtPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiTGrgyTcxoTne1TGiGrEydJN1DrQJuD+4s3paRBaZs=;
 b=mlgFQzXDuVJ01lUMZ3Bau2U2sfMCZNUNmH3D7eTNQgFbzGpjLxwTNFL04ul3dWHq9yi1rNgynfRuV3znZQdUF0xp3X/C9BtkvxAaFzyuhu8AEhE/iTxvdg+PaN2oH5jX/RF4CBfZt36HV7KUWo00yPZTgCi5xNMfviEOAHsW5IMQszFe6OThZhao3/Uy7XijpWJ0YxZL0+tBP++sRrKOQLIMV1fmpBUbCRY0hSgmDlHL+H7yJSvyT3cduphsHZTHX80iqUbZte8aUCk2fi+huiidkilBdFrb82UB40nehCXnA83wSidkwblAY1oGZsSaAx3gAD9K4YnRdzykGGmoug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiTGrgyTcxoTne1TGiGrEydJN1DrQJuD+4s3paRBaZs=;
 b=YvAiqRlttwiwDRAscKU8hlBclYktlyEyNH9PbfrNeyPUDSifg3IykCM6tn01VEMvrywWKukKILqdnskvBVE4P8h/xWyeQ4xk8DN2hRbO1piux7SYsy54Qmlz/lWF7pp6AsyOHttbGkQ1doeObfSNiOIMuwaK1KYxzfee6PiZxxQ=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Tue, 31 Oct
 2023 15:13:17 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:13:17 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 06/20] drm/imagination: Get GPU resources
Date: Tue, 31 Oct 2023 15:12:43 +0000
Message-Id: <20231031151257.90350-7-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031151257.90350-1-sarah.walker@imgtec.com>
References: <20231031151257.90350-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB2018:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b771527-7513-4945-beac-08dbda23e8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HnOB11vfLsgscl32ojM27WT+KJLgLXgSG9uCWQaEw32cvn287kXpH3MIMoVZZMMcF8wFu2NAv0pkR4mrDO/320sazuo/rlFZAyqTTfZ0rqOXCY6FWWkBvOwZUuxSmxyIsEwYZDR/riw+BWpcefia/+XVW1wdXpirpeyMbgarYAyr4PwhZgCgMpnppfzlb7XQ1/z9CS8L8vyuHW5dQ2CVpY/Z3zvH/c3HslkDmcFzWV61mXH/F+lzgo48VpGCzhjjJ8GHjFAXSIePar/x9IxajudJo//CmbaX6tVxFnr9l2mpiLcGshgTuSd9XaeKdUkTfhjUkOlkpt6Wx8IAiH6oCmF2f9C3xWcOOo07ye1MrB3p/TjoEsBQpxmu6w061xtO78v1el6OmvXxmccmbt16BKrOBDGRG6w9yGkdH5qS3zGaAsrqhqL6UsHPyFGXRykR0d/+OTY5rPwE7MKD/KwkwQvPOn1cR3Q+Re+u+7H5GUQgGZp22EAaQOElp0Wol6sesWH8sYjz5L9p/w4X6dSnN1303ou8t9g75ozMKRm2hUZw2rcTwmR1HFnTuHIUCa0RMuorZySgB4Lho2hqO4Mod3O6paumslPQnUIJ/mANu/rLuoBF4D6KVa4FEkReLxvW6N9c+t6vV6nbw3BFel99sA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39850400004)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(30864003)(7416002)(41300700001)(5660300002)(44832011)(8676002)(4326008)(8936002)(38350700005)(36756003)(86362001)(38100700002)(107886003)(1076003)(316002)(6916009)(66946007)(66476007)(66556008)(2616005)(83380400001)(478600001)(6666004)(26005)(6512007)(6506007)(52116002)(6486002)(134885004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LWbvJcLwN9iWdcgb57esliRQcagYe1dvzbOsxlpY1MAOmDOoVk/i9Klnk2Sl?=
 =?us-ascii?Q?DTELJwTWKdeK39FACD4IOO/cv5zGveNHAFwuNJ4C8YNV22JKnNS/9+rQtroi?=
 =?us-ascii?Q?PXxXNp3WPkBUJZ+z+/clsCsUQ4jAYdqozV8sFhuH3QTt7uamRy9a/r4P40Aw?=
 =?us-ascii?Q?lu5XSfBwOAC6dNbaXun2Py7UQgST6sawSLT1L0I2L5Kkol+ECy5oW3ATOBRj?=
 =?us-ascii?Q?RbeuYUqWa+r3xL9xioWbvpuj0OoLzbdr9YxMsV7OeVQ5g/AE9/SjsUih9mfE?=
 =?us-ascii?Q?6u463I9aBF1JvxMAZFoqUrW7RsxUjlWy0lPbeDhC2Iejquglaua4bneq4DKR?=
 =?us-ascii?Q?m/LtFc+7WnmSYJYQ2Xs0IAAQIyVbvIDWLV1PpL9mE6aNwaSjWQIgymEk2G72?=
 =?us-ascii?Q?ULIBtpJ3F+3wCX7BJQn/wCp3vzBatFM/zO/DiYla6qoJdUkpRd8mJRU0yYsm?=
 =?us-ascii?Q?a4i3Na3Ub4rLfLaJZjwcTsSzZd6WGk8n6lg/yvRW1XyjlbarOxoDfZxW3vDV?=
 =?us-ascii?Q?OGHot6Pv97T9RmA+t8KobiTew/xjayte7eCetBL9B630/ve28iOV2xMCMr/D?=
 =?us-ascii?Q?npjW1ycxpCJ3Vsj29k3pg+RoFeW2Ucr2JG5Kt7KlcGH7qPSZevYiNvTlyhT8?=
 =?us-ascii?Q?Z52EDrSSVewVEs4TLOVp9jhbuApA5lalWbMbkDGwhEiOUOagqGlIiqmUPQuW?=
 =?us-ascii?Q?ggcBpmDuqg9x381zMyUaIGoDJo1/XvQ9HEaZWPkg+62vI5viohIf4rX4KWGP?=
 =?us-ascii?Q?pKmpAR4QkWaNBTXTw5ZZBPT6KYgt/9PG9QSqLQqk3b5In4NDT1+UwQ6vbOlz?=
 =?us-ascii?Q?yZrM7UvIHrZ0dODifDxXZzOlHhJXy9zDYxOnFMviwtugJ1XECKXUZ2VDSJKs?=
 =?us-ascii?Q?+vVSHIEpQIK3WuqMnd34JMnDeIbHh8JGW4W0htTFDjtJScts5eQXhD5e5AFL?=
 =?us-ascii?Q?urAOZ5RPG3QpD7nf8bhijWHEYwTvyjwWQd9CyxzlzTk0wsLJYhexHCU6FXOg?=
 =?us-ascii?Q?mzUCPATsUqa9LhNlkRotaYIUKfmM/C6W9kUyBLqbC3O0/EVyg7zOu3cQXfSy?=
 =?us-ascii?Q?CbCoO7nZ/N7pLrMPBJ2raS99TrRcWOiUozCuWgXB8UOfCYhSS57Vyk3mxx2X?=
 =?us-ascii?Q?shl3fjObLMsK0hMBN+8YSJ9n0kzoEmD0rzD/yOZ6Og/1BytpzvcQpFqqnITy?=
 =?us-ascii?Q?1Nx2MKc7GI7ViQ64PHqGPnQCm5S1yDs7NCwrp21xZ7QLFhKT+7aupOSUokrC?=
 =?us-ascii?Q?BRvaeKlCMvZanswqs8BPJmjYLhp5ZtLJJH/GfVtwoe0i3hRGUEOsDbdTFLJ4?=
 =?us-ascii?Q?s+oZdLyLmrCUNKN1vBi3hsf0x3dQaqPxZu/Y8ruKARWHZKNYyNwqRX3rgB1Y?=
 =?us-ascii?Q?JBA15pUx8WzvCGk5bfKTAyo4wBQVYWQSt3k1CCa0bgQH6jf+8NT6F79RDORK?=
 =?us-ascii?Q?ztCUDLRaxVFBvqKCPAn4ewxN0JzHEhC052gi0/HP9qoVz+k9uvIqXH65o6/e?=
 =?us-ascii?Q?m8Dr6qcBfSwYlqGh9Rc1tGMPwvCuvq4FQAAb3d4dLdW76nnWcoHc9KvihID4?=
 =?us-ascii?Q?D8RAkrmiGRJDqaCXHbJGNP+BJVKtPlyQl5BNLwiyJodMHV6GI9/DK6SClre/?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b771527-7513-4945-beac-08dbda23e8d7
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:17.0085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpu8V8sFKTVB8vjwqu53S/LHB5Hhv4g6p3YvN9sHxdZZRTHDJeOaZJDChtpJxulCB4kwxWPDZOPMhE3C7f9GxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2018
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: kSMxUVroEAZ0omMGdzxHLpVo8SFmskMb
X-Proofpoint-ORIG-GUID: kSMxUVroEAZ0omMGdzxHLpVo8SFmskMb
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
index a23bef62b52b..a4c871f58fa4 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -464,6 +464,7 @@ pvr_probe(struct platform_device *plat_dev)
 {
 	struct pvr_device *pvr_dev;
 	struct drm_device *drm_dev;
+	int err;
 
 	pvr_dev = devm_drm_dev_alloc(&plat_dev->dev, &pvr_drm_driver,
 				     struct pvr_device, base);
@@ -474,14 +475,29 @@ pvr_probe(struct platform_device *plat_dev)
 
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
 
+	pvr_device_fini(pvr_dev);
 	drm_dev_unplug(drm_dev);
 
 	return 0;
-- 
2.42.0

