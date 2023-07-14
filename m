Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A78D753D67
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60FB10E8AD;
	Fri, 14 Jul 2023 14:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B688710E8A9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:29:57 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36ECVfNu003176; Fri, 14 Jul 2023 15:29:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=fxEerby2S+5MKrnHHvpe3
 hfxKtAmbu7681atzsVFlYI=; b=nSWVso2hRz6i1+5SevZ0hyORXqdYenvudR82j
 i24fh/tYhomIn8vQK+24WevLnbPo43ahsO+5w51VbD0bmwLKhAHDD52wxBum2wgE
 cmDoNhhsr/sS8rPHx91W9ilySiJTAVcnYF6hsZRzPyiGOU/MJes2KtesShN2IVgA
 1Gkb+jXwoi3TNHvb5zfp0Dvxp/vO2KQgZxnENsSq/EIZm7C+2M//a3JEifB1MZde
 270Z0kF3SH2Qug1Z67eTpWBmJWPD6j808rOw9JV4QiD8sBYFC9/wDE1tn1Kito7Z
 9IfUrkX6qrmDyyfjH1dNbh3fvHpiqgAGSbJGYj5xgBuA9amtQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu80m89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 15:29:25 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 15:29:24 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.55) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:29:24 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3FA7bz90zvmOiuHhU9WsYfEgxr2yfjTAORJkUiCNpF47jsQpPmq4Lg052cQA04qkoulCHPuw+slpnNba4BIxcQyhIUB5eQG9ARLzxWGICUYXnIE/39aLGfFz/TEpXJ3HsPPGuGR/CYKu/QB9PMZPPPA/xmyOC0145bHbi4Js5eqpbbugqjO99smp8T2Z5HDwMHizMArXMAPUEPiHkNryYgGPQHRU8SbILZaOixkZXE5PvGcGcZGhU1i1MBD1d3hARVgA81TOeLrY1ygRmSELHCVYMHgCpt7S1e5OvcICSpL+OdkJAmn33DsvMOco+aQiMCAifLc9CcRMe+n31elfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxEerby2S+5MKrnHHvpe3hfxKtAmbu7681atzsVFlYI=;
 b=Q4NjfaR3hMsSv+rUq4nUk8N4klCJAQao/H7yy6WWYzV9te8WH6QhFBmR6zbN9TR1brDrvzqy/HVBMBCSAuTmZfR23rHsTj8uJoGH1lx+w8IT+sSxwmJmOvCuCvtzxNn1G/r3pIPoW5OGRP5fQpTteOABQQ1f5UdIBuPpeYm+Gh4I2EfpoZ3GFpzqpDtHsW9jsVrI2jaGUG+FpsQLPlKeRgpr7TilUgTKG0As8/pbmi+xvClXUL5cgR/Ol6jXLN3GE8QUM0RF7Ex7NJFPGWPWvUe+zgmhrNRZJGNtl7mhF2J46h9k535+C82ulBCJq0YrZmG8o9R/ONx7tBRrY+fOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxEerby2S+5MKrnHHvpe3hfxKtAmbu7681atzsVFlYI=;
 b=ZCTh1jus97geIpM8E5W+KZ8a0m4gXcLlr7cqesGv8Zh5AWb9upyTCXQY6maoVmZ59vjCs6k/vyHYb6s+sVsrPvIotQsoK6jPz8CgLj19xk1tsHZrtFC0XE27PSkbmbgBikGy1Kpt2BF7046eZbyues5wLZGpn8/MernwQQ0gI4E=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO0P265MB5597.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:29:22 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:29:22 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 15/17] drm/imagination: Add firmware trace to debugfs
Date: Fri, 14 Jul 2023 15:29:13 +0100
Message-Id: <20230714142913.112440-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0425.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::16) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO0P265MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5a709b-5980-4dd5-f5dd-08db8476b7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vwsUl8YGPD+vSdcMX58b2IxEmC5ClaZObKaIutGz1NAW5jIPydJPn5UtNgO8JHN7l8AOpiaCwA89DIpJe43Eqb2ccvEPG/8puh3oWTBpIteazItp5dGsawZe2cqP8oGTg283EsRJTkAwZIFzWoenPmp3L/Ja8b32lOii6MHKaIHQPdKzuuIrMScCWDjgmBxpK1RF31qvUJ88sTupi8o7buBy1ZRIPN1J033uCn8FkCsASU9vpwFzkrLYv7nawnUM+7Ual14YswGL28WiN3H+cnvDNlY8vOYD9C/VWmi/eSapqfdZdssFu6/oloOoJ51j1ps2O4LDAcEh7r7ShKYnupazMLTK0piru1rH+YMDebs8UXv/OuyHzjXl4f4G5oLG2iraipJ+DS6POGHNYmLPHGckuuFjQdGH57HPgb1UesoghpkgwUU5PIaS0XvPMAUB+qWaf1W5kvxydxJ4aLTIGgMIThX25iYUiFQk88Ymcljum5tw+18dGnh6HNsbRvVbXfNRu9NIMvqzc55Bh9MwmLeOHcP66+UXdxSqbkD5v9/CmvsM/3cyvOTmofMZFTaNpmmw0R/V+/VJ5fkJaeqYQodXWtfy2WutTwj3p8uw8uPx7WdtYsZ2jCWn2ZIPvl7e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39850400004)(376002)(346002)(396003)(451199021)(316002)(8676002)(66946007)(7416002)(44832011)(8936002)(41300700001)(30864003)(6916009)(66476007)(66556008)(4326008)(5660300002)(2906002)(478600001)(6666004)(6512007)(52116002)(6486002)(86362001)(26005)(1076003)(6506007)(186003)(83380400001)(36756003)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?klSLnQifLGMsuAyDfqhiqTi9tdXOFnO4E+J56VOQ5Hqs4Tq5AloYMMEg0xzl?=
 =?us-ascii?Q?hvBklnrKQB2t7ZQSz+3SoXLQmPbwS5oPnMJZJDGMiQIKFeh3h4oq7BUhIxpW?=
 =?us-ascii?Q?YaT9x7CKMrG3Qc6xz0T5IH1emU6orvWppBAAheKXohBGqoeyEqlYvPkyA6W0?=
 =?us-ascii?Q?r33FaZ6YkTpq8+pNwapd08LfyB9M5ctnb0HgqGsVMrvOcDIFEAuXX0ihNkey?=
 =?us-ascii?Q?F6BX7ukiw9fexaBmVe7r23LqBQSt6Z9qnWDYRKHiHGbc2QkauOzF/Nw9KZkD?=
 =?us-ascii?Q?k7PqEDlwxNS2exSa/DuwGETPx+sTeQRSb5DJuKdoKzto9QgT4ntqV0D/V77b?=
 =?us-ascii?Q?Gwq3Hm6N2joo4om2mvjklKB4SYJbHR3UrdVS+w9mUasEo1w0h+Sj62FPn/IA?=
 =?us-ascii?Q?OXegLHRe7yilnikGh+mynoZwgT6z7YeFcuIHlP2FNFdClYJNWY0FYCNyxqDx?=
 =?us-ascii?Q?kHSfm6vqRI3hMIz2E5C3io02pPNJ5kBq/m+FMMoVFJa9XqGE/hVX+0cHwarQ?=
 =?us-ascii?Q?79SnJK2yjjTAwLjmAcEFYDPjjtV+NewTN67bK82AcUruQRy0n+cPgJ+LEqrI?=
 =?us-ascii?Q?0dWaFzSXjTUGn0hbV4gA07hn1Nno8OReeJRwUMpNo/cLTS4QUjx/Wewn9OhP?=
 =?us-ascii?Q?Cnzpz0A6dFYWIcgeM6UTNBW4SchNpfWe5maw83mSUyMIZPKgEHKt+qSR1c+k?=
 =?us-ascii?Q?fV2NPpYoHzAZJRoPNuGrLeTb8/8i8JTncYmnUwIUO/aGxtUTv32necYruJM3?=
 =?us-ascii?Q?iImoc3VtdjNpf/J8dBgfm5NnBEQvEVvlD//dr/6xnENlAoW91ULG6rzLXA8k?=
 =?us-ascii?Q?B+SC/Ucc/JbJvJP8PBdhP3tZGPV+c+7gQDhKgFi3dZ3CODJs7QosjI3hKFp+?=
 =?us-ascii?Q?ARMIrEInqz6RhuzCXAoqDVJdqa24I6OlZwSrRLIPCOb8r9ACrYLgphi5GbCB?=
 =?us-ascii?Q?C+7JHpGnNHC9Wn5vOpswTRWKhmRUG8Z6uavw2pygGzYFasLEE4dPmXERTqTs?=
 =?us-ascii?Q?Y34euRbok7n4lN7mlK+gHJayUz8a7rqCOxMUOUnARFDGW9YgMByyp9+W9Xwf?=
 =?us-ascii?Q?F/0cquOau35L4Xir26v1k9P7g9F//UGOzTVA+u+8OhLTFsX7deYbenuu6Znl?=
 =?us-ascii?Q?AgbT4rrKQZlcoIVW6cdCorERWJ5Msot1eA3M2KiWUzMYhmRyrt8i5kItDRkf?=
 =?us-ascii?Q?pFsiGSw6Tr7PKxEMz8bnPoxgfnKEiPHdjaaxzY9n7Nj/ob8hITpNMWbCLEbf?=
 =?us-ascii?Q?5BGNwhmi/LAleh4/QbxDo5l0iVmM0koSnrV7qQo3H/lQx3klOCF82JeN0b8r?=
 =?us-ascii?Q?hFGZhDHXO0bTBacwUcxG2jxcNrLI0r0Lagk+M4QyuqC+/hFGGakiW6w7D/eE?=
 =?us-ascii?Q?sUsuFs2i5Tdp3Eb2y+oL9hNmwbM8BlB04hUST0/409OKaMf4z+1B4KxN3cOR?=
 =?us-ascii?Q?vAcvuYPNWl51HaijViVds4bc/2+en10P1xs8djuPfi3JInZE6h8HFs+InKeq?=
 =?us-ascii?Q?VnhBwcIHzf1A02zcgK1isnf7QEf/OWlf+Add7bCl2sNLKYguottb78MEFklj?=
 =?us-ascii?Q?JrweN5Zhzn9h2ww5jRxdTbZ8hH0zRx+EvGNNNjN+RqUAnZXEcjjUrim3eBUh?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5a709b-5980-4dd5-f5dd-08db8476b7b0
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:29:22.7474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgTFm84rpYWbwoz0tqVLpRA8QS2v2Df4vriClHpWTPC6dtz7JLvZoFVpiQ3Frb6yNo6MHHl1vtAm8CALJMon+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5597
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: RuSR02ca-FlnyT0ajtOEwGhLbrEL9Fg4
X-Proofpoint-GUID: RuSR02ca-FlnyT0ajtOEwGhLbrEL9Fg4
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

Firmware trace is exposed at /sys/debug/dri/<dev_nr>/pvr_fw/trace_0.
Trace is enabled via the group mask at
/sys/debug/dri/<dev_nr>/pvr_params/fw_trace_mask.

Changes since v3:
- Use drm_dev_{enter,exit}

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile       |   4 +
 drivers/gpu/drm/imagination/pvr_debugfs.c  |  53 +++
 drivers/gpu/drm/imagination/pvr_debugfs.h  |  29 ++
 drivers/gpu/drm/imagination/pvr_device.c   |   9 +
 drivers/gpu/drm/imagination/pvr_device.h   |  10 +
 drivers/gpu/drm/imagination/pvr_drv.c      |   4 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 394 +++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_params.c   | 147 ++++++++
 drivers/gpu/drm/imagination/pvr_params.h   |  72 ++++
 9 files changed, 722 insertions(+)
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 7e8be9f1b37e..b14c855c6619 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -20,6 +20,7 @@ powervr-y := \
 	pvr_hwrt.o \
 	pvr_job.o \
 	pvr_mmu.o \
+	pvr_params.o \
 	pvr_power.o \
 	pvr_queue.o \
 	pvr_stream.o \
@@ -28,4 +29,7 @@ powervr-y := \
 	pvr_vm.o \
 	pvr_vm_mips.o
 
+powervr-$(CONFIG_DEBUG_FS) += \
+	pvr_debugfs.o
+
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_debugfs.c b/drivers/gpu/drm/imagination/pvr_debugfs.c
new file mode 100644
index 000000000000..02e44c070861
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_debugfs.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_debugfs.h"
+
+#include "pvr_device.h"
+#include "pvr_fw_trace.h"
+#include "pvr_params.h"
+
+#include <linux/dcache.h>
+#include <linux/debugfs.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_print.h>
+
+static const struct pvr_debugfs_entry pvr_debugfs_entries[] = {
+	{"pvr_params", pvr_params_debugfs_init},
+	{"pvr_fw", pvr_fw_trace_debugfs_init},
+};
+
+void
+pvr_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *drm_dev = minor->dev;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct dentry *root = minor->debugfs_root;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(pvr_debugfs_entries); ++i) {
+		const struct pvr_debugfs_entry *entry = &pvr_debugfs_entries[i];
+		struct dentry *dir;
+
+		dir = debugfs_create_dir(entry->name, root);
+		if (IS_ERR(dir)) {
+			drm_warn(drm_dev,
+				 "failed to create debugfs dir '%s' (err=%d)",
+				 entry->name, (int)PTR_ERR(dir));
+			continue;
+		}
+
+		entry->init(pvr_dev, dir);
+	}
+}
+
+/*
+ * Since all entries are created under &drm_minor->debugfs_root, there's no
+ * need for a pvr_debugfs_fini() as DRM will clean up everything under its root
+ * automatically.
+ */
diff --git a/drivers/gpu/drm/imagination/pvr_debugfs.h b/drivers/gpu/drm/imagination/pvr_debugfs.h
new file mode 100644
index 000000000000..b260a2b26ebd
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_debugfs.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_DEBUGFS_H
+#define PVR_DEBUGFS_H
+
+/* Forward declaration from <drm/drm_drv.h>. */
+struct drm_minor;
+
+#if defined(CONFIG_DEBUG_FS)
+/* Forward declaration from "pvr_device.h". */
+struct pvr_device;
+
+/* Forward declaration from <linux/dcache.h>. */
+struct dentry;
+
+struct pvr_debugfs_entry {
+	const char *name;
+	void (*init)(struct pvr_device *pvr_dev, struct dentry *dir);
+};
+
+void pvr_debugfs_init(struct drm_minor *minor);
+#else /* defined(CONFIG_DEBUG_FS) */
+#include <linux/compiler_attributes.h>
+
+static __always_inline void pvr_debugfs_init(struct drm_minor *minor) {}
+#endif /* defined(CONFIG_DEBUG_FS) */
+
+#endif /* PVR_DEBUGFS_H */
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index ea45757cc58e..2101693aaa7f 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -5,6 +5,7 @@
 #include "pvr_device_info.h"
 
 #include "pvr_fw.h"
+#include "pvr_params.h"
 #include "pvr_power.h"
 #include "pvr_queue.h"
 #include "pvr_rogue_cr_defs.h"
@@ -489,6 +490,14 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	struct device *dev = drm_dev->dev;
 	int err;
 
+	/*
+	 * Setup device parameters. We do this first in case other steps
+	 * depend on them.
+	 */
+	err = pvr_device_params_init(&pvr_dev->params);
+	if (err)
+		return err;
+
 	/* Enable and initialize clocks required for the device to operate. */
 	err = pvr_device_clk_init(pvr_dev);
 	if (err)
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 459304fd1627..7ffc6982344c 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -7,6 +7,7 @@
 #include "pvr_ccb.h"
 #include "pvr_device_info.h"
 #include "pvr_fw.h"
+#include "pvr_params.h"
 #include "pvr_rogue_fwif_stream.h"
 #include "pvr_stream.h"
 
@@ -148,6 +149,15 @@ struct pvr_device {
 	/** @fw_dev: Firmware related data. */
 	struct pvr_fw_device fw_dev;
 
+	/**
+	 * @params: Device-specific parameters.
+	 *
+	 *          The values of these parameters are initialized from the
+	 *          defaults specified as module parameters. They may be
+	 *          modified at runtime via debugfs (if enabled).
+	 */
+	struct pvr_device_params params;
+
 	/** @stream_musthave_quirks: Bit array of "must-have" quirks for stream commands. */
 	u32 stream_musthave_quirks[PVR_STREAM_TYPE_MAX][PVR_STREAM_EXTHDR_TYPE_MAX];
 
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index ea2d5ea1b947..8b554c8f7f56 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2022 Imagination Technologies Ltd. */
 
 #include "pvr_context.h"
+#include "pvr_debugfs.h"
 #include "pvr_device.h"
 #include "pvr_drv.h"
 #include "pvr_free_list.h"
@@ -1395,6 +1396,9 @@ static struct drm_driver pvr_drm_driver = {
 	.ioctls = pvr_drm_driver_ioctls,
 	.num_ioctls = ARRAY_SIZE(pvr_drm_driver_ioctls),
 	.fops = &pvr_drm_driver_fops,
+#if defined(CONFIG_DEBUG_FS)
+	.debugfs_init = pvr_debugfs_init,
+#endif
 
 	.name = PVR_DRIVER_NAME,
 	.desc = PVR_DRIVER_DESC,
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 3c6f16b0e1bd..f321041b317d 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -7,6 +7,7 @@
 #include "pvr_rogue_fwif_sf.h"
 #include "pvr_fw_trace.h"
 
+#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 
 #include <linux/build_bug.h>
@@ -121,3 +122,396 @@ void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
 	}
 	pvr_fw_object_unmap_and_destroy(fw_trace->tracebuf_ctrl_obj);
 }
+
+/**
+ * update_logtype() - Send KCCB command to trigger FW to update logtype
+ * @pvr_dev: Target PowerVR device
+ * @group_mask: New log group mask.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * Any error returned by pvr_kccb_send_cmd(), or
+ *  * -%EIO if the device is lost.
+ */
+static int
+update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
+{
+	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
+	struct rogue_fwif_kccb_cmd cmd;
+	int idx;
+	int err;
+
+	if (group_mask)
+		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_TRACE | group_mask;
+	else
+		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_NONE;
+
+	fw_trace->group_mask = group_mask;
+
+	down_read(&pvr_dev->reset_sem);
+	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
+		err = -EIO;
+		goto err_up_read;
+	}
+
+	cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_LOGTYPE_UPDATE;
+	cmd.kccb_flags = 0;
+
+	err = pvr_kccb_send_cmd(pvr_dev, &cmd, NULL);
+
+	drm_dev_exit(idx);
+
+err_up_read:
+	up_read(&pvr_dev->reset_sem);
+
+	return err;
+}
+
+#if defined(CONFIG_DEBUG_FS)
+
+static int fw_trace_group_mask_show(struct seq_file *m, void *data)
+{
+	struct pvr_device *pvr_dev = m->private;
+
+	seq_printf(m, "%08x\n", pvr_dev->fw_dev.fw_trace.group_mask);
+
+	return 0;
+}
+
+static int fw_trace_group_mask_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, fw_trace_group_mask_show, inode->i_private);
+}
+
+static ssize_t fw_trace_group_mask_write(struct file *file, const char __user *ubuf, size_t len,
+					 loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	struct pvr_device *pvr_dev = m->private;
+	u32 new_group_mask;
+	int err;
+
+	err = kstrtouint_from_user(ubuf, len, 0, &new_group_mask);
+	if (err)
+		return err;
+
+	err = update_logtype(pvr_dev, new_group_mask);
+	if (err)
+		return err;
+
+	pvr_dev->fw_dev.fw_trace.group_mask = new_group_mask;
+
+	return (ssize_t)len;
+}
+
+static const struct file_operations pvr_fw_trace_group_mask_fops = {
+	.owner = THIS_MODULE,
+	.open = fw_trace_group_mask_open,
+	.read = seq_read,
+	.write = fw_trace_group_mask_write,
+	.llseek = default_llseek,
+	.release = single_release,
+};
+
+struct pvr_fw_trace_seq_data {
+	/** @buffer: Pointer to copy of trace data. */
+	u32 *buffer;
+
+	/** @start_offset: Starting offset in trace data, as reported by FW. */
+	u32 start_offset;
+
+	/** @idx: Current index into trace data. */
+	u32 idx;
+
+	/** @assert_buf: Trace assert buffer, as reported by FW. */
+	struct rogue_fwif_file_info_buf assert_buf;
+};
+
+static u32 find_sfid(u32 id)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(stid_fmts); i++) {
+		if (stid_fmts[i].id == id)
+			return i;
+	}
+
+	return ROGUE_FW_SF_LAST;
+}
+
+static u32 read_fw_trace(struct pvr_fw_trace_seq_data *trace_seq_data, u32 offset)
+{
+	u32 idx;
+
+	idx = trace_seq_data->idx + offset;
+	if (idx >= ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS)
+		return 0;
+
+	idx = (idx + trace_seq_data->start_offset) % ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS;
+	return trace_seq_data->buffer[idx];
+}
+
+/**
+ * fw_trace_get_next() - Advance trace index to next entry
+ * @trace_seq_data: Trace sequence data.
+ *
+ * Returns:
+ *  * %true if trace index is now pointing to a valid entry, or
+ *  * %false if trace index is pointing to an invalid entry, or has hit the end
+ *    of the trace.
+ */
+static bool fw_trace_get_next(struct pvr_fw_trace_seq_data *trace_seq_data)
+{
+	u32 id, sf_id;
+
+	while (trace_seq_data->idx < ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS) {
+		id = read_fw_trace(trace_seq_data, 0);
+		trace_seq_data->idx++;
+		if (!ROGUE_FW_LOG_VALIDID(id))
+			continue;
+		if (id == ROGUE_FW_SF_MAIN_ASSERT_FAILED) {
+			/* Assertion failure marks the end of the trace. */
+			return false;
+		}
+
+		sf_id = find_sfid(id);
+		if (sf_id == ROGUE_FW_SF_FIRST)
+			continue;
+		if (sf_id == ROGUE_FW_SF_LAST) {
+			/*
+			 * Could not match with an ID in the SF table, trace is
+			 * most likely corrupt from this point.
+			 */
+			return false;
+		}
+
+		/* Skip over the timestamp, and any parameters. */
+		trace_seq_data->idx += 2 + ROGUE_FW_SF_PARAMNUM(id);
+
+		/* Ensure index is now pointing to a valid trace entry. */
+		id = read_fw_trace(trace_seq_data, 0);
+		if (!ROGUE_FW_LOG_VALIDID(id))
+			continue;
+
+		return true;
+	};
+
+	/* Hit end of trace data. */
+	return false;
+}
+
+/**
+ * fw_trace_get_first() - Find first valid entry in trace
+ * @trace_seq_data: Trace sequence data.
+ *
+ * Skips over invalid (usually zero) and ROGUE_FW_SF_FIRST entries.
+ *
+ * If the trace has no valid entries, this function will exit with the trace
+ * index pointing to the end of the trace. trace_seq_show() will return an error
+ * in this state.
+ */
+static void fw_trace_get_first(struct pvr_fw_trace_seq_data *trace_seq_data)
+{
+	trace_seq_data->idx = 0;
+
+	while (trace_seq_data->idx < ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS) {
+		u32 id = read_fw_trace(trace_seq_data, 0);
+
+		if (ROGUE_FW_LOG_VALIDID(id)) {
+			u32 sf_id = find_sfid(id);
+
+			if (sf_id != ROGUE_FW_SF_FIRST)
+				break;
+		}
+		trace_seq_data->idx++;
+	}
+}
+
+static void *fw_trace_seq_start(struct seq_file *s, loff_t *pos)
+{
+	struct pvr_fw_trace_seq_data *trace_seq_data = s->private;
+	u32 i;
+
+	/* Reset trace index, then advance to *pos. */
+	fw_trace_get_first(trace_seq_data);
+
+	for (i = 0; i < *pos; i++) {
+		if (!fw_trace_get_next(trace_seq_data))
+			return NULL;
+	}
+
+	return (trace_seq_data->idx < ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS) ? pos : NULL;
+}
+
+static void *fw_trace_seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct pvr_fw_trace_seq_data *trace_seq_data = s->private;
+
+	(*pos)++;
+	if (!fw_trace_get_next(trace_seq_data))
+		return NULL;
+
+	return (trace_seq_data->idx < ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS) ? pos : NULL;
+}
+
+static void fw_trace_seq_stop(struct seq_file *s, void *v)
+{
+}
+
+static int fw_trace_seq_show(struct seq_file *s, void *v)
+{
+	struct pvr_fw_trace_seq_data *trace_seq_data = s->private;
+	u64 timestamp;
+	u32 id;
+	u32 sf_id;
+
+	if (trace_seq_data->idx >= ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS)
+		return -EINVAL;
+
+	id = read_fw_trace(trace_seq_data, 0);
+	/* Index is not pointing at a valid entry. */
+	if (!ROGUE_FW_LOG_VALIDID(id))
+		return -EINVAL;
+
+	sf_id = find_sfid(id);
+	/* Index is not pointing at a valid entry. */
+	if (sf_id == ROGUE_FW_SF_LAST)
+		return -EINVAL;
+
+	timestamp = read_fw_trace(trace_seq_data, 1) |
+		((u64)read_fw_trace(trace_seq_data, 2) << 32);
+	timestamp = (timestamp & ~ROGUE_FWT_TIMESTAMP_TIME_CLRMSK) >>
+		ROGUE_FWT_TIMESTAMP_TIME_SHIFT;
+
+	seq_printf(s, "[%llu] : ", timestamp);
+	if (id == ROGUE_FW_SF_MAIN_ASSERT_FAILED) {
+		seq_printf(s, "ASSERTION %s failed at %s:%u",
+			   trace_seq_data->assert_buf.info,
+			   trace_seq_data->assert_buf.path,
+			   trace_seq_data->assert_buf.line_num);
+	} else {
+		seq_printf(s, stid_fmts[sf_id].name,
+			   read_fw_trace(trace_seq_data, 3),
+			   read_fw_trace(trace_seq_data, 4),
+			   read_fw_trace(trace_seq_data, 5),
+			   read_fw_trace(trace_seq_data, 6),
+			   read_fw_trace(trace_seq_data, 7),
+			   read_fw_trace(trace_seq_data, 8),
+			   read_fw_trace(trace_seq_data, 9),
+			   read_fw_trace(trace_seq_data, 10),
+			   read_fw_trace(trace_seq_data, 11),
+			   read_fw_trace(trace_seq_data, 12),
+			   read_fw_trace(trace_seq_data, 13),
+			   read_fw_trace(trace_seq_data, 14),
+			   read_fw_trace(trace_seq_data, 15),
+			   read_fw_trace(trace_seq_data, 16),
+			   read_fw_trace(trace_seq_data, 17),
+			   read_fw_trace(trace_seq_data, 18),
+			   read_fw_trace(trace_seq_data, 19),
+			   read_fw_trace(trace_seq_data, 20),
+			   read_fw_trace(trace_seq_data, 21),
+			   read_fw_trace(trace_seq_data, 22));
+	}
+	seq_puts(s, "\n");
+	return 0;
+}
+
+static const struct seq_operations pvr_fw_trace_seq_ops = {
+	.start = fw_trace_seq_start,
+	.next = fw_trace_seq_next,
+	.stop = fw_trace_seq_stop,
+	.show = fw_trace_seq_show
+};
+
+static int fw_trace_open(struct inode *inode, struct file *file)
+{
+	struct pvr_fw_trace_buffer *trace_buffer = inode->i_private;
+	struct rogue_fwif_tracebuf_space *tracebuf_space =
+		trace_buffer->tracebuf_space;
+	struct pvr_fw_trace_seq_data *trace_seq_data;
+	int err;
+
+	trace_seq_data = kzalloc(sizeof(*trace_seq_data), GFP_KERNEL);
+	if (!trace_seq_data)
+		return -ENOMEM;
+
+	trace_seq_data->buffer = kcalloc(ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS,
+					 sizeof(*trace_seq_data->buffer), GFP_KERNEL);
+	if (!trace_seq_data->buffer) {
+		err = -ENOMEM;
+		goto err_free_data;
+	}
+
+	/*
+	 * Take a local copy of the trace buffer, as firmware may still be
+	 * writing to it. This will exist as long as this file is open.
+	 */
+	memcpy(trace_seq_data->buffer, trace_buffer->buf,
+	       ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS * sizeof(u32));
+	trace_seq_data->start_offset = READ_ONCE(tracebuf_space->trace_pointer);
+	trace_seq_data->assert_buf = tracebuf_space->assert_buf;
+	fw_trace_get_first(trace_seq_data);
+
+	err = seq_open(file, &pvr_fw_trace_seq_ops);
+	if (err)
+		goto err_free_buffer;
+
+	((struct seq_file *)file->private_data)->private = trace_seq_data;
+
+	return 0;
+
+err_free_buffer:
+	kfree(trace_seq_data->buffer);
+
+err_free_data:
+	kfree(trace_seq_data);
+
+	return err;
+}
+
+static int fw_trace_release(struct inode *inode, struct file *file)
+{
+	struct pvr_fw_trace_seq_data *trace_seq_data =
+		((struct seq_file *)file->private_data)->private;
+
+	seq_release(inode, file);
+	kfree(trace_seq_data->buffer);
+	kfree(trace_seq_data);
+
+	return 0;
+}
+
+static const struct file_operations pvr_fw_trace_fops = {
+	.owner = THIS_MODULE,
+	.open = fw_trace_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = fw_trace_release,
+};
+
+void
+pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask, u32 new_mask)
+{
+	if (old_mask != new_mask)
+		update_logtype(pvr_dev, new_mask);
+}
+
+void
+pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir)
+{
+	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
+	u32 thread_nr;
+
+	static_assert(ARRAY_SIZE(fw_trace->buffers) <= 10,
+		      "The filename buffer is only large enough for a single-digit thread count");
+
+	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); ++thread_nr) {
+		char filename[8];
+
+		snprintf(filename, ARRAY_SIZE(filename), "trace_%u", thread_nr);
+		debugfs_create_file(filename, 0400, dir,
+				    &fw_trace->buffers[thread_nr],
+				    &pvr_fw_trace_fops);
+	}
+}
+#endif
diff --git a/drivers/gpu/drm/imagination/pvr_params.c b/drivers/gpu/drm/imagination/pvr_params.c
new file mode 100644
index 000000000000..20f2ba8915f4
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_params.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_params.h"
+
+#include <linux/cache.h>
+#include <linux/moduleparam.h>
+
+static struct pvr_device_params pvr_device_param_defaults __read_mostly = {
+#define X(type_, name_, value_, desc_, ...) .name_ = (value_),
+	PVR_DEVICE_PARAMS
+#undef X
+};
+
+#define PVR_DEVICE_PARAM_NAMED(name_, type_, desc_) \
+	module_param_named(name_, pvr_device_param_defaults.name_, type_, \
+			   0400);                                         \
+	MODULE_PARM_DESC(name_, desc_);
+
+/*
+ * This list of defines must contain every type specified in "pvr_params.h" as
+ * ``PVR_PARAM_TYPE_*_C``.
+ */
+#define PVR_PARAM_TYPE_X32_MODPARAM uint
+
+#define X(type_, name_, value_, desc_, ...) \
+	PVR_DEVICE_PARAM_NAMED(name_, PVR_PARAM_TYPE_##type_##_MODPARAM, desc_);
+PVR_DEVICE_PARAMS
+#undef X
+
+int
+pvr_device_params_init(struct pvr_device_params *params)
+{
+	/*
+	 * If heap-allocated parameters are added in the future (e.g.
+	 * modparam's charp type), they must be handled specially here (via
+	 * kstrdup() in the case of charp). Since that's not necessary yet,
+	 * a straight copy will do for now. This change will also require a
+	 * pvr_device_params_fini() function to free any heap-allocated copies.
+	 */
+
+	*params = pvr_device_param_defaults;
+
+	return 0;
+}
+
+#if defined(CONFIG_DEBUG_FS)
+#include "pvr_device.h"
+
+#include <linux/dcache.h>
+#include <linux/debugfs.h>
+#include <linux/export.h>
+#include <linux/fs.h>
+#include <linux/stddef.h>
+
+/*
+ * This list of defines must contain every type specified in "pvr_params.h" as
+ * ``PVR_PARAM_TYPE_*_C``.
+ */
+#define PVR_PARAM_TYPE_X32_FMT "0x%08llx"
+
+#define X_SET(name_, mode_) X_SET_##mode_(name_)
+#define X_SET_DEF(name_, update_, mode_) X_SET_DEF_##mode_(name_, update_)
+
+#define X_SET_RO(name_) NULL
+#define X_SET_RW(name_) __pvr_device_param_##name_##set
+
+#define X_SET_DEF_RO(name_, update_)
+#define X_SET_DEF_RW(name_, update_)                                    \
+	static int                                                      \
+	X_SET_RW(name_)(void *data, u64 val)                            \
+	{                                                               \
+		struct pvr_device *pvr_dev = data;                      \
+		/* This is not just (update_) to suppress -Waddress. */ \
+		if ((void *)(update_) != NULL)                          \
+			(update_)(pvr_dev, pvr_dev->params.name_, val); \
+		pvr_dev->params.name_ = val;                            \
+		return 0;                                               \
+	}
+
+#define X(type_, name_, value_, desc_, mode_, update_)                     \
+	static int                                                         \
+	__pvr_device_param_##name_##_get(void *data, u64 *val)             \
+	{                                                                  \
+		struct pvr_device *pvr_dev = data;                         \
+		*val = pvr_dev->params.name_;                              \
+		return 0;                                                  \
+	}                                                                  \
+	X_SET_DEF(name_, update_, mode_)                                   \
+	static int                                                         \
+	__pvr_device_param_##name_##_open(struct inode *inode,             \
+					  struct file *file)               \
+	{                                                                  \
+		__simple_attr_check_format(PVR_PARAM_TYPE_##type_##_FMT,   \
+					   0ull);                          \
+		return simple_attr_open(inode, file,                       \
+					__pvr_device_param_##name_##_get,  \
+					X_SET(name_, mode_),               \
+					PVR_PARAM_TYPE_##type_##_FMT);     \
+	}
+PVR_DEVICE_PARAMS
+#undef X
+
+#undef X_SET
+#undef X_SET_RO
+#undef X_SET_RW
+#undef X_SET_DEF
+#undef X_SET_DEF_RO
+#undef X_SET_DEF_RW
+
+static struct {
+#define X(type_, name_, value_, desc_, mode_, update_) \
+	const struct file_operations name_;
+	PVR_DEVICE_PARAMS
+#undef X
+} pvr_device_param_debugfs_fops = {
+#define X(type_, name_, value_, desc_, mode_, update_)     \
+	.name_ = {                                         \
+		.owner = THIS_MODULE,                      \
+		.open = __pvr_device_param_##name_##_open, \
+		.release = simple_attr_release,            \
+		.read = simple_attr_read,                  \
+		.write = simple_attr_write,                \
+		.llseek = generic_file_llseek,             \
+	},
+	PVR_DEVICE_PARAMS
+#undef X
+};
+
+void
+pvr_params_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir)
+{
+#define X_MODE(mode_) X_MODE_##mode_
+#define X_MODE_RO 0400
+#define X_MODE_RW 0600
+
+#define X(type_, name_, value_, desc_, mode_, update_)             \
+	debugfs_create_file(#name_, X_MODE(mode_), dir, pvr_dev,   \
+			    &pvr_device_param_debugfs_fops.name_);
+	PVR_DEVICE_PARAMS
+#undef X
+
+#undef X_MODE
+#undef X_MODE_RO
+#undef X_MODE_RW
+}
+#endif
diff --git a/drivers/gpu/drm/imagination/pvr_params.h b/drivers/gpu/drm/imagination/pvr_params.h
new file mode 100644
index 000000000000..1d8335246d27
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_params.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_PARAMS_H
+#define PVR_PARAMS_H
+
+#include "pvr_rogue_fwif.h"
+
+#include <linux/cache.h>
+#include <linux/compiler_attributes.h>
+
+/*
+ * This is the definitive list of types allowed in the definition of
+ * %PVR_DEVICE_PARAMS.
+ */
+#define PVR_PARAM_TYPE_X32_C u32
+
+/*
+ * This macro defines all device-specific parameters; that is parameters which
+ * are set independently per device.
+ *
+ * The X-macro accepts the following arguments. Arguments marked with [debugfs]
+ * are ignored when debugfs is disabled; values used for these arguments may
+ * safely be gated behind CONFIG_DEBUG_FS.
+ *
+ * @type_: The definitive list of allowed values is PVR_PARAM_TYPE_*_C.
+ * @name_: Name of the parameter. This is used both as the field name in C and
+ *         stringified as the parameter name.
+ * @value_: Initial/default value.
+ * @desc_: String literal used as help text to describe the usage of this
+ *         parameter.
+ * @mode_: [debugfs] One of {RO,RW}. The access mode of the debugfs entry for
+ *         this parameter.
+ * @update_: [debugfs] When debugfs support is enabled, parameters may be
+ *           updated at runtime. When this happens, this function will be
+ *           called to allow changes to propagate. The signature of this
+ *           function is:
+ *
+ *              void (*)(struct pvr_device *pvr_dev, T old_val, T new_val)
+ *
+ *           Where T is the C type associated with @type_.
+ *
+ *           If @mode_ does not allow write access, this function will never be
+ *           called. In this case, or if no update callback is required, you
+ *           should specify NULL for this argument.
+ */
+#define PVR_DEVICE_PARAMS                                                    \
+	X(X32, fw_trace_mask, ROGUE_FWIF_LOG_TYPE_NONE,                      \
+	  "Enable FW trace for the specified groups. Specifying 0 disables " \
+	  "all FW tracing.",                                                 \
+	  RW, pvr_fw_trace_mask_update)
+
+struct pvr_device_params {
+#define X(type_, name_, value_, desc_, ...) \
+	PVR_PARAM_TYPE_##type_##_C name_;
+	PVR_DEVICE_PARAMS
+#undef X
+};
+
+int pvr_device_params_init(struct pvr_device_params *params);
+
+#if defined(CONFIG_DEBUG_FS)
+/* Forward declaration from "pvr_device.h". */
+struct pvr_device;
+
+/* Forward declaration from <linux/dcache.h>. */
+struct dentry;
+
+void pvr_params_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir);
+#endif /* defined(CONFIG_DEBUG_FS) */
+
+#endif /* PVR_PARAMS_H */
-- 
2.41.0

