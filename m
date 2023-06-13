Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09472E6F0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFED310E3B0;
	Tue, 13 Jun 2023 15:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6E910E392
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:20:27 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35D6uk00011744; Tue, 13 Jun 2023 15:48:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=M8Wwqfe30TD9RIz6BNzLwf0/bqD+PmGbK9tA+TlODwg=; b=wcc
 jbRJHJ0S8g/8qsqTKEb8rZURjN/sPdsZCPVuqvrZ452kVvl32Sm+i0ycwF3kJT5a
 9BkkBgVtxl7ayAJ1bOH3bc5n9cM5ziq0OXp/G5f9ty9era2GX7XC/AATl6PgOdIK
 McM5Nn7vcn1tQMkx/gX9f/L5KvALuOgjaD5qrcZr1lqItVXtF2oDxKjHDLb4j6YH
 5iEa5vipDoEp4dFTeg9KNB1p55k8QUp483eVJs/cAWxmpWn75LRKMUROrBHquIol
 TLd82488NlvnvT8YJlFCV70MhCanxBpppuhIf+XE1+C5FovLRkobp6kPz0KyBCtv
 ups9DHdYjuONK0tJJMQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbt0kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:22 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:21 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:21 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLUUvW80f8BzW55nexUsxWg0L1bZxSWmayMtF24wwsV0k/L7fTjSlvchKs6fWxIvhiiSRgkSEngCTSMOUeVQ5ji7e7FQU07K/T7OonDdT2uuJxyyu5wxehhoc3ydc/FdcNzotJm43iQVI3Zkbf/3uDnj1tX3/cHt/3VycXjdKJnX8MlEfNpCTRnYSKbaSASXgRLDp9JaGh+MTLAPfLKQPG2KLS5WWdUFuHYNokVKbRn8rN6QctgLsezKn6yuNVtgEqKtuefcYeOmfjcJmsWRfdMuU3ambkv6MqdUjsO6mekpcN4E37t5lr60fabBDYDtcmHspr4ZlQdxgQtlwuwUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8Wwqfe30TD9RIz6BNzLwf0/bqD+PmGbK9tA+TlODwg=;
 b=BztkvyVGa7Q4122bmPj8cWfe1RjU1QAdUH9YF5M09HYBlCqKRr9AGS24hVzQwFnXfSRJmCLJnt/TXPGfkT/GncKVvqZ02YONLYlYpzNiO8YJf66rPzq8gkIPLi6PnTvPmMlpLHLmqMmLYBtoT3keR1EzQycBbKha4F5AMdzYjEnzq2aZO5SsWh8uYpiThQ1VkQ2GlVxH6F85KivscSeIhNuwp2Jef5SEpiDUdv8T2FfXB6oL2NN85RV2PNDLGKnVHZMR+g9QegPrGQK+ok8xWmMBck9irWLTYIuThF7VVZWhDug8WVt8i/IFBYvimkmNBM7bha4rxlFBLeg7PQBPjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8Wwqfe30TD9RIz6BNzLwf0/bqD+PmGbK9tA+TlODwg=;
 b=SdUJ6uhZsF/BL29KBnkVijA+0+NwoBmBQ5PO67Frtn9Hf8eG90JMREiJ7+hiJbMnH5+x1HGRZXY++X5rOIiN4QByyBMV9CFzRv+FVbB3hs6O/7Qr5x8iv+e20HisD5GGm9QnJ0bgjnFWSn7yanpEbnXMlwXF4OYDnraUuVgZtZ0=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:18 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:18 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 11/17] drm/imagination: Implement MIPS firmware processor
 and MMU support
Date: Tue, 13 Jun 2023 15:47:54 +0100
Message-Id: <20230613144800.52657-12-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613144800.52657-1-sarah.walker@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0375.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::20) To CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:155::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWXP265MB4826:EE_|LO3P265MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: ad33e8c4-c1ef-4d68-298e-08db6c1d3a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOaZOWwE238ttmxz5B8oaH6R/Bpo/HEgS9gMfwzkoso9i8Gf/6jMkNpm2TDXZFD9JrtwS9yQ1QoHc6M28icEVFgYSD+cb3IzDFoA6VP6B1pDCIwl3zpBEAJVq8ESRGrwjZxGX4DQPbH7t8ug8mWowYEyvSycw0ACyFyKn9JHckqHe+22gARG2enHutKUX5/N6ugsD7A+P/Cc8OmQcW8HSFUr8FWkwclspC/KVWnJlfQBckGWJxBtaKQ7uPZFc5YZ+mzaBEtMSl2SeN8hXw7E+nQSp7RM1p8pCmBNM+QacsFM62l5h+AsJBsFIrx2nkQRlcES5aCazQ8r520Vo/m2zj7WUEWwSKa9izEFl3ZabLF52bZbmSjKAhqs6j5/kIuERsK1kkKeOK/vzPc0YmvgpMwTBikRGeLegcmi/ZVGB1VjHzAPNh/QT32CAEJWwYDNWTOR2PW0tyDRhrk6gSDuaxKJZeVgjrbY14y3wHQV1L+qHg5DJP8bFcDU9zSWBtLJHYfoxB4rtqyMrZq0pVyav+rdZoctgsS1PGz3JkPQA1Tzb4jM5YqVRdaDaFNSKOaL0KtyQf5DiM0qxSqF+HIhNTAdQaJlJzNq1NEq4uIiCgqiBp7T2s/yBdh8WVn4dMD5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39840400004)(451199021)(44832011)(4326008)(8936002)(316002)(7416002)(66946007)(6916009)(66476007)(41300700001)(186003)(2906002)(30864003)(66556008)(478600001)(8676002)(5660300002)(6666004)(52116002)(6486002)(6512007)(1076003)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KnClMHlprEJeWq2Zw7/xWGUwGmcLlGUz6p4j/UQJJuVwoTB19BVWA7lqGBT3?=
 =?us-ascii?Q?SqZPllTmnFAwsISzieqGfk9LDnmWA2YMo2ZtRmDX3VMdPI9n07AGUvRgFTQw?=
 =?us-ascii?Q?BsM3u+uDF9bZmlsR7VKONJDRdlX5ePXRtwbKfC7vcgsj9UciIeu6+mayMd9E?=
 =?us-ascii?Q?z0XNUZc3ajn+uk+ApcFZ3PGkdQPbWo5hic49YOsFdhg3FwkgTd8FIToWt7NG?=
 =?us-ascii?Q?MTb2ppuiSQgiivkht5EN3QwsvzM9GXEfpiVsp340iPgOHaO/UkDoTxxq2WYH?=
 =?us-ascii?Q?QhEnJ6GSBIOqbGMbkfnVYDmVkTA903vWTYTPhGW6Hh1JnbU67BhsbzizfTcz?=
 =?us-ascii?Q?QrZb6GX9A4Qu7vMtB+DnTMYXad8/WMec6Ev+STNkYUUDtHzIEXe/vMYn/ZiB?=
 =?us-ascii?Q?soSSq/hSFtigFChnCThlxWG3HuN39sho89PLfctd1HbkWmaDp2CfVMfW+qVu?=
 =?us-ascii?Q?6srIFDKenbinbqNNDJz2AWCDOLTA5Ih3BjTBKu1juQz5JdSyrny5aZteW0Ke?=
 =?us-ascii?Q?sXe16MaafPrQsA21T61cMLlJ+1esOHQeKitoHTsoiraKep7nSwT1WCZqGYqe?=
 =?us-ascii?Q?Mzkzgs6tuvgwslXajoDoshOCh3U6yMH+j+tEz6lvIUCqyzyJ20wfDZTHDasA?=
 =?us-ascii?Q?hMkfQDc8Nd6LzaQ0+4IEL/US80MBIOglHA5OF7m+tQFEhl/0lJBgIQfWfi7P?=
 =?us-ascii?Q?k0CpkjCygt+kk8N+sjW91RqR7tGKGEcueKEpO6hP3aVCVZBdkPeXSWjrdGns?=
 =?us-ascii?Q?45awJoE6F6nQK58jEYOy7DjNHyr9Q1oc6IybRovCfvmEgurHx8UTSRtSDnWy?=
 =?us-ascii?Q?HOc5FJdrnMZaev7Po37jfcuAC6iOg4IfsrDRNc8XpsSfuYjCjhdqAZLKf5k/?=
 =?us-ascii?Q?0CaL0s3kGWJ3tMaBnCUQlexlBdD/OxhlQBqDzeBhPcU8pxTO8izOlLPi4lnr?=
 =?us-ascii?Q?WBTCdrFRGwOVAaDqKXi33SqdXbavMC/sGAsF3zWl04HnTOY7ZHo67k6d4qtk?=
 =?us-ascii?Q?G1g52yEJNhSoAwmfnu/EF4/n6uS928VI0XOzBN9jEmPwuIBZNtWUIiHQcqX5?=
 =?us-ascii?Q?R3ht9eEu4VAleLZE/oKcYtYCvauiG5Gy7CkLDKCsPidNo5YEn0CqKT6+xOtW?=
 =?us-ascii?Q?ePPJO8V1V5M4i5yu5a/V2scpSF6E8M+//FDbhOxQ4LIh4dVf8EyuQ+dURABc?=
 =?us-ascii?Q?V+gnCgQ4AlKjlTys8EZ5o0C3JcNw3pFv32F5pSJcRhl6/XrDz3mWzBLKSVFQ?=
 =?us-ascii?Q?XYI9nXAQ24PA9fyME3Zk3IUIxSzVKDAdGZdPE6LHvsMs3kawa+NU0dSGEduW?=
 =?us-ascii?Q?4ELXg+QE1RvXKPQ2+/eFxNTJN3pnFX74EHs2BXaUzMjYoTay17VzTBQPeXwk?=
 =?us-ascii?Q?LWSc3p6xzmGerm3E9EQTxFgfKRP1FozWuo6tezm169bgDL+gbWWUFDV5iMs6?=
 =?us-ascii?Q?Uoe1KETl2vcQgJN/fuOfbfb7IDW4AEW/3XW4lK/CQrb8TJ7C6Q8HxOcUUaiz?=
 =?us-ascii?Q?sDi6Ou7M9k7q1sS1bGPVlUZNvYtbXSvG8F4rAaBp6oSypaUre0yMCS4AWI70?=
 =?us-ascii?Q?J9awDBlbW7Q1pMOkOK81FEm5OFoThjtGATTeQbj/S9qihHT7VIlqQSVR6UyL?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad33e8c4-c1ef-4d68-298e-08db6c1d3a0b
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:18.8347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJP5dul/PvKUsCfDu6Zb5r7ym0hFAZM12fmuPFefcuVxr80LAI9eoSrtmV8PaAcZokr7/B2udyLmbM/OfGzJhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2282
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 7zbjZUvh6nH1bcwqh-BejP3Km0WOVCFu
X-Proofpoint-GUID: 7zbjZUvh6nH1bcwqh-BejP3Km0WOVCFu
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, sumit.semwal@linaro.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MIPS firmware processor, used in the Series AXE GPU.
The MIPS firmware processor uses a separate MMU to the rest of the GPU, so
this patch adds support for that as well.

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile      |   4 +-
 drivers/gpu/drm/imagination/pvr_fw.c      |   2 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c | 280 ++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_mips.h |  38 +++
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 222 +++++++++++++++++
 drivers/gpu/drm/imagination/pvr_vm_mips.h |  22 ++
 6 files changed, 567 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index f6fe9fbea094..89a101dfb7f3 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -10,10 +10,12 @@ powervr-y := \
 	pvr_drv.o \
 	pvr_fw.o \
 	pvr_fw_meta.o \
+	pvr_fw_mips.o \
 	pvr_fw_startstop.o \
 	pvr_fw_trace.o \
 	pvr_gem.o \
 	pvr_power.o \
-	pvr_vm.o
+	pvr_vm.o \
+	pvr_vm_mips.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 304d9bdebfe3..97740733f2b0 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -842,6 +842,8 @@ pvr_fw_init(struct pvr_device *pvr_dev)
 
 	if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_META) {
 		fw_dev->funcs = &pvr_fw_funcs_meta;
+	} else if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_MIPS) {
+		fw_dev->funcs = &pvr_fw_funcs_mips;
 	} else {
 		err = -EINVAL;
 		goto err_out;
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
new file mode 100644
index 000000000000..36188e8a86ac
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_fw_mips.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_mips.h"
+#include "pvr_vm_mips.h"
+
+#include <linux/elf.h>
+#include <linux/err.h>
+#include <linux/types.h>
+
+#define ROGUE_FW_HEAP_MIPS_BASE 0xC0000000
+#define ROGUE_FW_HEAP_MIPS_SHIFT 24 /* 16 MB */
+#define ROGUE_FW_HEAP_MIPS_RESERVED_SIZE SZ_1M
+
+/**
+ * process_elf_command_stream() - Process ELF firmware image and populate
+ *                                firmware sections
+ * @pvr_dev: Device pointer.
+ * @fw: Pointer to firmware image.
+ * @layout_entries: Pointer to layout table.
+ * @num_layout_entries: Number of entries in layout table.
+ * @fw_code_ptr: Pointer to FW code section.
+ * @fw_data_ptr: Pointer to FW data section.
+ * @fw_core_code_ptr: Pointer to FW coremem code section.
+ * @fw_core_data_ptr: Pointer to FW coremem data section.
+ *
+ * Returns :
+ *  * 0 on success, or
+ *  * -EINVAL on any error in ELF command stream.
+ */
+static int
+process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw,
+			   const struct pvr_fw_layout_entry *layout_entries,
+			   u32 num_layout_entries, u8 *fw_code_ptr,
+			   u8 *fw_data_ptr, u8 *fw_core_code_ptr,
+			   u8 *fw_core_data_ptr)
+{
+	struct elf32_hdr *header = (struct elf32_hdr *)fw;
+	struct elf32_phdr *program_header = (struct elf32_phdr *)(fw + header->e_phoff);
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	u32 entry;
+	int err;
+
+	for (entry = 0; entry < header->e_phnum; entry++, program_header++) {
+		void *write_addr;
+
+		/* Only consider loadable entries in the ELF segment table */
+		if (program_header->p_type != PT_LOAD)
+			continue;
+
+		err = pvr_fw_find_mmu_segment(program_header->p_vaddr, program_header->p_memsz,
+					      layout_entries, num_layout_entries, fw_code_ptr,
+					      fw_data_ptr, fw_core_code_ptr, fw_core_data_ptr,
+					      &write_addr);
+		if (err) {
+			drm_err(drm_dev,
+				"Addr 0x%x (size: %d) not found in any firmware segment",
+				program_header->p_vaddr, program_header->p_memsz);
+			goto err_out;
+		}
+
+		/* Write to FW allocation only if available */
+		if (write_addr) {
+			memcpy(write_addr, fw + program_header->p_offset,
+			       program_header->p_filesz);
+
+			memset((u8 *)write_addr + program_header->p_filesz, 0,
+			       program_header->p_memsz - program_header->p_filesz);
+		}
+	}
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static int
+pvr_mips_init(struct pvr_device *pvr_dev)
+{
+	pvr_fw_heap_info_init(pvr_dev, ROGUE_FW_HEAP_MIPS_SHIFT, ROGUE_FW_HEAP_MIPS_RESERVED_SIZE);
+
+	return pvr_vm_mips_init(pvr_dev);
+}
+
+static void
+pvr_mips_fini(struct pvr_device *pvr_dev)
+{
+	pvr_vm_mips_fini(pvr_dev);
+}
+
+static int
+pvr_mips_fw_process(struct pvr_device *pvr_dev, const u8 *fw,
+		    const struct pvr_fw_layout_entry *layout_entries, u32 num_layout_entries,
+		    u8 *fw_code_ptr, u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr,
+		    u32 core_code_alloc_size)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	const struct pvr_fw_layout_entry *boot_code_entry;
+	const struct pvr_fw_layout_entry *boot_data_entry;
+	const struct pvr_fw_layout_entry *exception_code_entry;
+	const struct pvr_fw_layout_entry *stack_entry;
+	struct rogue_mipsfw_boot_data *boot_data;
+	dma_addr_t dma_addr;
+	u32 page_nr;
+	int err;
+
+	err = process_elf_command_stream(pvr_dev, fw, layout_entries, num_layout_entries,
+					 fw_code_ptr, fw_data_ptr, fw_core_code_ptr,
+					 fw_core_data_ptr);
+	if (err)
+		goto err_out;
+
+	boot_code_entry = pvr_fw_find_layout_entry(layout_entries, num_layout_entries,
+						   MIPS_BOOT_CODE);
+	boot_data_entry = pvr_fw_find_layout_entry(layout_entries, num_layout_entries,
+						   MIPS_BOOT_DATA);
+	exception_code_entry = pvr_fw_find_layout_entry(layout_entries, num_layout_entries,
+							MIPS_EXCEPTIONS_CODE);
+	if (!boot_code_entry || !boot_data_entry || !exception_code_entry) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.code_obj->gem, boot_code_entry->alloc_offset,
+				     &mips_data->boot_code_dma_addr));
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.data_obj->gem, boot_data_entry->alloc_offset,
+				     &mips_data->boot_data_dma_addr));
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.code_obj->gem,
+				     exception_code_entry->alloc_offset,
+				     &mips_data->exception_code_dma_addr));
+
+	stack_entry = pvr_fw_find_layout_entry(layout_entries, num_layout_entries, MIPS_STACK);
+	if (!stack_entry) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	boot_data = (struct rogue_mipsfw_boot_data *)(fw_data_ptr + boot_data_entry->alloc_offset +
+						      ROGUE_MIPSFW_BOOTLDR_CONF_OFFSET);
+
+	WARN_ON(pvr_fw_object_get_dma_addr(fw_dev->mem.data_obj, stack_entry->alloc_offset,
+					   &dma_addr));
+	boot_data->stack_phys_addr = dma_addr;
+
+	boot_data->reg_base = pvr_dev->regs_resource->start;
+
+	for (page_nr = 0; page_nr < ARRAY_SIZE(boot_data->pt_phys_addr); page_nr++) {
+		WARN_ON(pvr_gem_get_dma_addr(mips_data->pt_obj,
+					     page_nr << ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K, &dma_addr));
+
+		boot_data->pt_phys_addr[page_nr] = dma_addr;
+	}
+
+	boot_data->pt_log2_page_size = ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	boot_data->pt_num_pages = ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES;
+	boot_data->reserved1 = 0;
+	boot_data->reserved2 = 0;
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static int
+pvr_mips_wrapper_init(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_mips_data *mips_data = pvr_dev->fw_dev.processor_data.mips_data;
+	const u64 remap_settings = ROGUE_MIPSFW_BOOT_REMAP_LOG2_SEGMENT_SIZE;
+	u32 phys_bus_width;
+
+	int err = PVR_FEATURE_VALUE(pvr_dev, phys_bus_width, &phys_bus_width);
+
+	if (WARN_ON(err))
+		return err;
+
+	/* Currently MIPS FW only supported with physical bus width > 32 bits. */
+	if (WARN_ON(phys_bus_width <= 32))
+		return -EINVAL;
+
+	PVR_CR_WRITE32(pvr_dev, MIPS_WRAPPER_CONFIG,
+		       (ROGUE_MIPSFW_REGISTERS_VIRTUAL_BASE >>
+			ROGUE_MIPSFW_WRAPPER_CONFIG_REGBANK_ADDR_ALIGN) |
+		       ROGUE_CR_MIPS_WRAPPER_CONFIG_BOOT_ISA_MODE_MICROMIPS);
+
+	/* Configure remap for boot code, boot data and exceptions code areas. */
+	PVR_CR_WRITE64(pvr_dev, MIPS_ADDR_REMAP1_CONFIG1,
+		       ROGUE_MIPSFW_BOOT_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG1_MODE_ENABLE_EN);
+	PVR_CR_WRITE64(pvr_dev, MIPS_ADDR_REMAP1_CONFIG2,
+		       (mips_data->boot_code_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	if (PVR_HAS_QUIRK(pvr_dev, 63553)) {
+		/*
+		 * WA always required on 36 bit cores, to avoid continuous unmapped memory accesses
+		 * to address 0x0.
+		 */
+		WARN_ON(phys_bus_width != 36);
+
+		PVR_CR_WRITE64(pvr_dev, MIPS_ADDR_REMAP5_CONFIG1,
+			       ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG1_MODE_ENABLE_EN);
+		PVR_CR_WRITE64(pvr_dev, MIPS_ADDR_REMAP5_CONFIG2,
+			       (mips_data->boot_code_dma_addr &
+				~ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG2_ADDR_OUT_CLRMSK) |
+			       remap_settings);
+	}
+
+	PVR_CR_WRITE64(pvr_dev, MIPS_ADDR_REMAP2_CONFIG1,
+		       ROGUE_MIPSFW_DATA_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG1_MODE_ENABLE_EN);
+	PVR_CR_WRITE64(pvr_dev, MIPS_ADDR_REMAP2_CONFIG2,
+		       (mips_data->boot_data_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	PVR_CR_WRITE64(pvr_dev, MIPS_ADDR_REMAP3_CONFIG1,
+		       ROGUE_MIPSFW_CODE_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG1_MODE_ENABLE_EN);
+	PVR_CR_WRITE64(pvr_dev, MIPS_ADDR_REMAP3_CONFIG2,
+		       (mips_data->exception_code_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	/* Garten IDLE bit controlled by MIPS. */
+	PVR_CR_WRITE64(pvr_dev, MTS_GARTEN_WRAPPER_CONFIG,
+		       ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_IDLE_CTRL_META);
+
+	/* Turn on the EJTAG probe. */
+	PVR_CR_WRITE32(pvr_dev, MIPS_DEBUG_CONFIG, 0);
+
+	return 0;
+}
+
+static u32
+pvr_mips_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
+{
+	struct pvr_device *pvr_dev = to_pvr_device(gem_from_pvr_gem(fw_obj->gem)->dev);
+
+	/* MIPS cacheability is determined by page table. */
+	return ((fw_obj->fw_addr_offset + offset) & pvr_dev->fw_dev.fw_heap_info.offset_mask) |
+	       ROGUE_FW_HEAP_MIPS_BASE;
+}
+
+static bool
+pvr_mips_check_and_ack_irq(struct pvr_device *pvr_dev)
+{
+	u32 irq_status = PVR_CR_READ32(pvr_dev, MIPS_WRAPPER_IRQ_STATUS);
+
+	if (!(irq_status & ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN))
+		return false; /* Spurious IRQ - ignore. */
+
+	/* Acknowledge IRQ. */
+	PVR_CR_WRITE32(pvr_dev, MIPS_WRAPPER_IRQ_CLEAR,
+		       ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR_EVENT_EN);
+
+	return true;
+}
+
+static bool
+pvr_mips_has_fixed_data_addr(void)
+{
+	return true;
+}
+
+const struct pvr_fw_funcs pvr_fw_funcs_mips = {
+	.init = pvr_mips_init,
+	.fini = pvr_mips_fini,
+	.fw_process = pvr_mips_fw_process,
+	.vm_map = pvr_vm_mips_map,
+	.vm_unmap = pvr_vm_mips_unmap,
+	.get_fw_addr_with_offset = pvr_mips_get_fw_addr_with_offset,
+	.wrapper_init = pvr_mips_wrapper_init,
+	.check_and_ack_irq = pvr_mips_check_and_ack_irq,
+	.has_fixed_data_addr = pvr_mips_has_fixed_data_addr,
+};
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.h b/drivers/gpu/drm/imagination/pvr_fw_mips.h
new file mode 100644
index 000000000000..6e54e603d481
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_MIPS_H
+#define PVR_FW_MIPS_H
+
+#include <linux/types.h>
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_gem_object;
+
+/**
+ * struct pvr_fw_mips_data - MIPS-specific data
+ */
+struct pvr_fw_mips_data {
+	/** @pt_obj: Object representing MIPS pagetable. */
+	struct pvr_gem_object *pt_obj;
+
+	/** @pt: Pointer to CPU mapping of MIPS pagetable. */
+	u32 *pt;
+
+	/** @boot_code_dma_addr: DMA address of MIPS boot code. */
+	dma_addr_t boot_code_dma_addr;
+
+	/** @boot_data_dma_addr: DMA address of MIPS boot data. */
+	dma_addr_t boot_data_dma_addr;
+
+	/** @exception_code_dma_addr: DMA address of MIPS exception code. */
+	dma_addr_t exception_code_dma_addr;
+
+	/** @cache_policy: Cache policy for this processor. */
+	u32 cache_policy;
+
+	/** @pfn_mask: PFN mask for MIPS pagetable. */
+	u32 pfn_mask;
+};
+
+#endif /* PVR_FW_MIPS_H */
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
new file mode 100644
index 000000000000..11bcccb336ea
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw_mips.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_mips.h"
+#include "pvr_vm.h"
+#include "pvr_vm_mips.h"
+
+#include <drm/drm_managed.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/**
+ * pvr_vm_mips_init() - Initialise MIPS FW pagetable
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EINVAL,
+ *  * Any error returned by pvr_gem_object_create(), or
+ *  * And error returned by pvr_gem_object_vmap().
+ */
+int
+pvr_vm_mips_init(struct pvr_device *pvr_dev)
+{
+	u32 pt_size = 1 << ROGUE_MIPSFW_LOG2_PAGETABLE_SIZE_4K(pvr_dev);
+	struct pvr_fw_mips_data *mips_data;
+	u32 phys_bus_width;
+	int err;
+
+	/* Page table size must be at most ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * 4k pages. */
+	if (pt_size > ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * SZ_4K) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	if (PVR_FEATURE_VALUE(pvr_dev, phys_bus_width, &phys_bus_width)) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	mips_data = drmm_kzalloc(from_pvr_device(pvr_dev), sizeof(*mips_data), GFP_KERNEL);
+	if (!mips_data) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+
+	mips_data->pt_obj = pvr_gem_object_create(pvr_dev, pt_size,
+						  DRM_PVR_BO_DEVICE_PM_FW_PROTECT |
+						  DRM_PVR_BO_CREATE_ZEROED);
+	if (IS_ERR(mips_data->pt_obj)) {
+		err = PTR_ERR(mips_data->pt_obj);
+		goto err_out;
+	}
+
+	mips_data->pt = pvr_gem_object_vmap(mips_data->pt_obj);
+	if (IS_ERR(mips_data->pt)) {
+		err = PTR_ERR(mips_data->pt);
+		goto err_put_obj;
+	}
+
+	mips_data->pfn_mask = (phys_bus_width > 32) ? ROGUE_MIPSFW_ENTRYLO_PFN_MASK_ABOVE_32BIT :
+						      ROGUE_MIPSFW_ENTRYLO_PFN_MASK;
+
+	mips_data->cache_policy = (phys_bus_width > 32) ? ROGUE_MIPSFW_CACHED_POLICY_ABOVE_32BIT :
+							  ROGUE_MIPSFW_CACHED_POLICY;
+
+	pvr_dev->fw_dev.processor_data.mips_data = mips_data;
+
+	return 0;
+
+err_put_obj:
+	pvr_gem_object_put(mips_data->pt_obj);
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_vm_mips_fini() - Release MIPS FW pagetable
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_vm_mips_fini(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+
+	pvr_gem_object_vunmap(mips_data->pt_obj);
+	pvr_gem_object_put(mips_data->pt_obj);
+	fw_dev->processor_data.mips_data = NULL;
+}
+
+static u32
+get_mips_pte_flags(bool read, bool write, u32 cache_policy)
+{
+	u32 flags = 0;
+
+	if (read && write) /* Read/write. */
+		flags |= ROGUE_MIPSFW_ENTRYLO_DIRTY_EN;
+	else if (write)    /* Write only. */
+		flags |= ROGUE_MIPSFW_ENTRYLO_READ_INHIBIT_EN;
+	else
+		WARN_ON(!read);
+
+	flags |= cache_policy << ROGUE_MIPSFW_ENTRYLO_CACHE_POLICY_SHIFT;
+
+	flags |= ROGUE_MIPSFW_ENTRYLO_VALID_EN | ROGUE_MIPSFW_ENTRYLO_GLOBAL_EN;
+
+	return flags;
+}
+
+/**
+ * pvr_vm_mips_map() - Map a FW object into MIPS address space
+ * @pvr_dev: Target PowerVR device.
+ * @fw_obj: FW object to map.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EINVAL if object does not reside within FW address space, or
+ *  * Any error returned by pvr_fw_object_get_dma_addr().
+ */
+int
+pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	u64 start = fw_obj->fw_mm_node.start;
+	u64 size = fw_obj->fw_mm_node.size;
+	u64 end;
+	u32 cache_policy;
+	u32 pte_flags;
+	u32 start_pfn;
+	u32 end_pfn;
+	u32 pfn;
+	int err;
+
+	if (check_add_overflow(start, size - 1, &end)) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	if (start < ROGUE_FW_HEAP_BASE ||
+	    start >= ROGUE_FW_HEAP_BASE + fw_dev->fw_heap_info.raw_size ||
+	    end < ROGUE_FW_HEAP_BASE ||
+	    end >= ROGUE_FW_HEAP_BASE + fw_dev->fw_heap_info.raw_size ||
+	    (start & ROGUE_MIPSFW_PAGE_MASK_4K) ||
+	    ((end + 1) & ROGUE_MIPSFW_PAGE_MASK_4K)) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	start_pfn = (start & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	end_pfn = (end & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+
+	if (pvr_obj->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED)
+		cache_policy = ROGUE_MIPSFW_UNCACHED_CACHE_POLICY;
+	else
+		cache_policy = mips_data->cache_policy;
+
+	pte_flags = get_mips_pte_flags(true, true, cache_policy);
+
+	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
+		dma_addr_t dma_addr;
+		u32 pte;
+
+		err = pvr_fw_object_get_dma_addr(fw_obj,
+						 (pfn - start_pfn) <<
+						 ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K,
+						 &dma_addr);
+		if (err)
+			goto err_unmap_pages;
+
+		pte = ((dma_addr >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K)
+		       << ROGUE_MIPSFW_ENTRYLO_PFN_SHIFT) & mips_data->pfn_mask;
+		pte |= pte_flags;
+
+		WRITE_ONCE(mips_data->pt[pfn], pte);
+	}
+
+	pvr_vm_mmu_flush(pvr_dev);
+
+	return 0;
+
+err_unmap_pages:
+	for (; pfn >= start_pfn; pfn--)
+		WRITE_ONCE(mips_data->pt[pfn], 0);
+
+	pvr_vm_mmu_flush(pvr_dev);
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_vm_mips_unmap() - Unmap a FW object into MIPS address space
+ * @pvr_dev: Target PowerVR device.
+ * @fw_obj: FW object to unmap.
+ */
+void
+pvr_vm_mips_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	u64 start = fw_obj->fw_mm_node.start;
+	u64 size = fw_obj->fw_mm_node.size;
+	u64 end = start + size;
+
+	u32 start_pfn = (start & fw_dev->fw_heap_info.offset_mask) >>
+			ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	u32 end_pfn = (end & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	u32 pfn;
+
+	for (pfn = start_pfn; pfn < end_pfn; pfn++)
+		WRITE_ONCE(mips_data->pt[pfn], 0);
+
+	pvr_vm_mmu_flush(pvr_dev);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.h b/drivers/gpu/drm/imagination/pvr_vm_mips.h
new file mode 100644
index 000000000000..05bfb0565209
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_VM_MIPS_H
+#define PVR_VM_MIPS_H
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_fw_object;
+
+int
+pvr_vm_mips_init(struct pvr_device *pvr_dev);
+void
+pvr_vm_mips_fini(struct pvr_device *pvr_dev);
+int
+pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+void
+pvr_vm_mips_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+
+#endif /* PVR_VM_MIPS_H */
-- 
2.40.1

