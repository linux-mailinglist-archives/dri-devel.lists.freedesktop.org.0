Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E8B7DD001
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC1610E52D;
	Tue, 31 Oct 2023 15:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C228010E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 15:14:06 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39VCA1wE001257; Tue, 31 Oct 2023 15:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=sYoo4haio8wbyitB6JJhiXyE4EYzftUZvfRse3A1S3s=; b=S0N
 rEBcvXq6CZ2iyDMoazp8IgbdQP9rPIrrA0PerwmHJMPqTQv7enwgvAh/H+D5arEG
 cAxKz4hxve4b4EaOclmgSJRss1UW+35B+wU6LyokLV3nN9Ja5RqzQYAD3Bkn3DZT
 8M4GTnZzIlePstuIPPI6WwVPXlD5I7ZFh9nom5xkuf6GoXCImi9VUZ2vVYtmNTjY
 tF/vksC2PQjCXmE8S+KWR1DTB1UEuqYKXEeINRfiuFmF4wQfkgxpXUVvbptrSvms
 NSZtUT1XLVav8upUKdry6x3v+R9JY+gp2p/rr6AzdUinl9dqsvap8LeG//Boq/ai
 Q4YxNZpIEJU6egkz1DA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Oct 2023 15:13:26 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:13:25 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.51) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:13:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXFfpB7H6Q+cpYC2ceCebCmE/OHPe1gy4iAQqL7d5gbnu2k3hl3DiCewrE+U1AlH9X4f3lloMj7EazmzTsr3+iXMITSkPOE6M+sKLeyEk8KodJHhbcGm0G6A7ph8s8USuD2yxvtHhOdbAnnkInm+a9mHO7uxq9w4UUvXBLPWnOXoYEHZ+kCe6bNdSBOzqkjnBkh3oYjqqjtcvLd0meI2lgKPqCCYGfNqj6M/9k3ZVY6hcpfUs3JZ61gByQCgKvBR8btDccEQoBfBpQRFlKaxI6Vp5VdYULLQEIG47eje52HbAssfkq5+f7BDIhLrsQiYhD9bklAjeC0EL40goHHE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYoo4haio8wbyitB6JJhiXyE4EYzftUZvfRse3A1S3s=;
 b=Qy/Qqbu9tJ+M28cML28N2kI/RBUZl7O3A0+KpFtU/KViHukD8i1u2rs+fiDN4i3f+A5W4FxW71qxB+JnBVeNX00uylbRRztY76qYfjSLG/nR4me+Ori6P1N0rr6n0AGqq0gPrt+O3FbcK7cD7Oy3Aqs4tSXk2tv2yrjaxcO9lYI1m67pRIRmdq5Q3B9xMzSMlNZZRc7LsECkG3WeRhPdEhMDjqBsaIWrhM4hU23U2I2uMkFyvSzX1rbnW2ANiuf2trw+Fn7rJTgqMAy2ZM5S5Lj9uWaQaPZvFAOAOyFbd+OHPhzNK3qYL0DqL1/sJiOzvy2RhMcZ0jKzclaEgl7mzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYoo4haio8wbyitB6JJhiXyE4EYzftUZvfRse3A1S3s=;
 b=iXEx7mQfJnXZcb5EBEZHF04Ssi00lT1feMPCHlnQbxKS/ju98cQxxlgOWzUbPhCpNzK4I/nydzsDDhJLjHobhILSoJEfTAly3zg6SVeoH6RhrQXmfSDyk4dbWv0pgQoKNOt0Oxnxh9e0GQx4AuqjP5Xzd01LFAJ+LCIP1YJ2a+Y=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Tue, 31 Oct
 2023 15:13:18 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:13:18 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 08/20] drm/imagination: Add firmware and MMU related headers
Date: Tue, 31 Oct 2023 15:12:45 +0000
Message-Id: <20231031151257.90350-9-sarah.walker@imgtec.com>
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
X-MS-Office365-Filtering-Correlation-Id: e4254a85-4752-4b41-41c5-08dbda23e9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: veCabJ4N9VfDzNoD/O1Sf3n+pCbF9RuCtIxtWdtqfwb/Mr5/mrHoW1talfOvJK/p6uW/LuS+agzpF4fbFLXYEFYdqMcGvPJ+WHJCH9bOx7x1tNYOpK+mXNUyJBz3t2pmfxtZHYyXe3z+QwllZ1ZpRS20AvKZZDf78z5A4dNaugeDzD5Pa+Ccea0s8FjXeY6z9XZApOioMjCX5VjExrCxBL5wCt0d2IL6mEoGuFinMWgO73IbckqKcZYfM0Bjf2VVdC89ELp0vJo02BBkfVLz9JxgXyVvnldaPmwWq/iweyA8HbNTHCNq5ceDoLfDKPKODubmHKP7/fNA8Y6ZfcNVs57MNAyTgNTF+SD7XeWdsjTnUBrrR2hPjR7UpQ2aEWvr2D2foZD4x9tpH3vBfQTYRjhqA/xnQhwarmGZoI2HCLfj1O5gfhyVaVAy0vkEhfnpDY9pU1pJTteqgazpphXE0Ee+E4QEhZ4uCwoNUNYknI+tkkmmqyA7DLEkbufOtB319g93ojYZckWMtgf+NiOpokCQfkt4F405gbVXFoh87k0IqhvzrrApChxKIwvin6LcyxAEU6ovlWN+OIiWad7CnJlw71uQ1pcrUGlUpYEicvRPRIuuRiosZxvDImHb3QRw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39850400004)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(30864003)(7416002)(41300700001)(5660300002)(44832011)(8676002)(4326008)(8936002)(38350700005)(36756003)(86362001)(38100700002)(1076003)(316002)(6916009)(66946007)(66476007)(66556008)(2616005)(83380400001)(478600001)(6666004)(26005)(6512007)(6506007)(52116002)(6486002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/+gfpEr4Y3wAZND/ScfiuD2AEcSPOlpbPh/udGUur/yqE57zFEmhI9B4nAzW?=
 =?us-ascii?Q?MxGfU117zQPU3m8x1qYuytLr4AlyA/mLuL/bz/efhS3neuHTqc89c/m4cbMC?=
 =?us-ascii?Q?bNUkQ++p92bdyUkqH6QKHf2IfbZGszrTRjmNwkKsYvxOQWlLMo1KXpUCtXUW?=
 =?us-ascii?Q?iSE7lvw6gOj+GkhYyuairv8RswjQb/cStGJbC+mpjokgxORHAfKkMMuFUd4c?=
 =?us-ascii?Q?MO6stbE1gVbxhOhCN1n7J8CWEYiZlj81okdOtl7ABQMfP1H7IUeBAVlcOk/t?=
 =?us-ascii?Q?mOsKl/JzivhnKLF5yGIHRHAwnQo8eZ5St5REW3jVK8AIY462gNtbZHpt1nqI?=
 =?us-ascii?Q?/+RWLhlDBBIdGqgBSX3Ml35lES4xOVgrkaumdRmZL2/9E+Wkbm1NOFWRw/Zh?=
 =?us-ascii?Q?gzZWYX9e9D/nUICPilajj5vEWkCyTD7lfTlZPb9bu8Rh9PK+zaZ2wUSJkseN?=
 =?us-ascii?Q?8/deOTE2IRVtrm7EJ4USpDrSHpP0BKN/eBO98vyDHpMD2lB4oikJxLQg8iAv?=
 =?us-ascii?Q?gVqAqrn9K7xr9dS7jzqVU8fYA+/G84o2LN5vLUWcqRUOFfiQmKXr6mbGyEqi?=
 =?us-ascii?Q?sK7btalGu+2CxhvO9GccuAL3PZSNSci5pJufoQP5oRlAqFkd1YGmGHu2FRQb?=
 =?us-ascii?Q?72friscwW4e+RfvpQE/UKy++or1PHoVGeJyktIgLZ6lYOiCp/NZwN4zNEA+B?=
 =?us-ascii?Q?wy2UiETvKrBX/z2lxA3qPSuVn6uut/mohIAmGfZyRKGbT8y3O/Hrc8VzQiqb?=
 =?us-ascii?Q?QDRE/0Ln4lo8yadzaB5XeGw7Az8+93PQVCMopaMFgNFs5TpNWIx1kQLT/33d?=
 =?us-ascii?Q?ptjkm2kGevwes+7VuaUt+yzIumRZjIRHoaNbm3k6T/n23Z3J8Q8gfMg28dBX?=
 =?us-ascii?Q?leZPl+v8HAD0D9nsMjN0A25lBqlWdGLR4Ib3rPs9vncR7sU5e6qRZDqHiufN?=
 =?us-ascii?Q?lXL974aday64QO8Uf6gex9BhSAKH6nKPL2N0pkXqDj51Ua/hculuwZYHDVld?=
 =?us-ascii?Q?XCKRz73BQRS8uD43/pCSdAcWjvcoM1pulxjl1a4cuIujV54J5EiCgUFN76Bm?=
 =?us-ascii?Q?043tx3xigM3Uadm98FXx//03ajpHurPM+DbBAEkjr4+6gPZPxq7g16GMvssb?=
 =?us-ascii?Q?XXk2G296YNZWGkD9ob93LckGpydsDEB9pUvNMwIgy9WREdGcDA3tHV/QPCF9?=
 =?us-ascii?Q?k8TXRYzjrZ06r5rNmg8OA8KUuOFqTCuyvg5OL5bgWuh4JRapfgiABKX3U+Za?=
 =?us-ascii?Q?tjnzy/lS1PiZ9vMMEhLeepfUKpmkSXTQY2y1yHIJk/x1U21QXWe5Go2a2CL9?=
 =?us-ascii?Q?mpIII8Wp1Avg/RD+Uzh6yQA8ylycecU0FKwdo1l/eXnlSKFzNKe5C3QdQiUo?=
 =?us-ascii?Q?W/QK58h0OgXMlUlqyr8TerCUSuhbwvwalRiRFNeqUeVy9hoOweceMgO+Qu6e?=
 =?us-ascii?Q?xcO3QBpizagZQItW8pvcyqKo68/lASzRJG4d1Jp3WvqdTqhzJUiQ/tto3Y0F?=
 =?us-ascii?Q?aVtG+BrA8d1Q9+w/ARz3v9zF7qUBBsZ6myTWLbjAqihKanUCW+Q375vReV1u?=
 =?us-ascii?Q?UHgcnIX5TcJ02Mckb2gEKG6qhyzuCsD9Y3SWaIqNzKhNmVARCiexd89bD+QI?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4254a85-4752-4b41-41c5-08dbda23e9ba
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:18.5219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUTZu2gD3FRlE0qheyPs9IPyckH7+DTtQ8oHvLgYRspapWFfoSSw0x/EW/UJJyGuFLjdjxneQ+ObAkRbymIplw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2018
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: Jjyvy7Bfhnx01gGCxp0Ux9N1M9le8JSp
X-Proofpoint-ORIG-GUID: Jjyvy7Bfhnx01gGCxp0Ux9N1M9le8JSp
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
 robh+dt@kernel.org, faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org,
 afd@ti.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v5:
- Split up header commit due to size

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 .../drm/imagination/pvr_rogue_heap_config.h   | 113 ++++++
 drivers/gpu/drm/imagination/pvr_rogue_meta.h  | 356 ++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_rogue_mips.h  | 335 ++++++++++++++++
 .../drm/imagination/pvr_rogue_mips_check.h    |  58 +++
 .../gpu/drm/imagination/pvr_rogue_mmu_defs.h  | 136 +++++++
 5 files changed, 998 insertions(+)
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h

diff --git a/drivers/gpu/drm/imagination/pvr_rogue_heap_config.h b/drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
new file mode 100644
index 000000000000..632221b88281
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_ROGUE_HEAP_CONFIG_H
+#define PVR_ROGUE_HEAP_CONFIG_H
+
+#include <linux/sizes.h>
+
+/*
+ * ROGUE Device Virtual Address Space Definitions
+ *
+ * This file defines the ROGUE virtual address heaps that are used in
+ * application memory contexts. It also shows where the Firmware memory heap
+ * fits into this, but the firmware heap is only ever created in the
+ * kernel driver and never exposed to userspace.
+ *
+ * ROGUE_PDSCODEDATA_HEAP_BASE and ROGUE_USCCODE_HEAP_BASE will be programmed,
+ * on a global basis, into ROGUE_CR_PDS_EXEC_BASE and ROGUE_CR_USC_CODE_BASE_*
+ * respectively. Therefore if client drivers use multiple configs they must
+ * still be consistent with their definitions for these heaps.
+ *
+ * Base addresses have to be a multiple of 4MiB.
+ * Heaps must not start at 0x0000000000, as this is reserved for internal
+ * use within the driver.
+ * Range comments, those starting in column 0 below are a section heading of
+ * sorts and are above the heaps in that range. Often this is the reserved
+ * size of the heap within the range.
+ */
+
+/* 0x00_0000_0000 ************************************************************/
+
+/* 0x00_0000_0000 - 0x00_0040_0000 */
+/* 0 MiB to 4 MiB, size of 4 MiB : RESERVED */
+
+/* 0x00_0040_0000 - 0x7F_FFC0_0000 **/
+/* 4 MiB to 512 GiB, size of 512 GiB less 4 MiB : RESERVED **/
+
+/* 0x80_0000_0000 ************************************************************/
+
+/* 0x80_0000_0000 - 0x9F_FFFF_FFFF **/
+/* 512 GiB to 640 GiB, size of 128 GiB : GENERAL_HEAP **/
+#define ROGUE_GENERAL_HEAP_BASE 0x8000000000ull
+#define ROGUE_GENERAL_HEAP_SIZE SZ_128G
+
+/* 0xA0_0000_0000 - 0xAF_FFFF_FFFF */
+/* 640 GiB to 704 GiB, size of 64 GiB : FREE */
+
+/* B0_0000_0000 - 0xB7_FFFF_FFFF */
+/* 704 GiB to 736 GiB, size of 32 GiB : FREE */
+
+/* 0xB8_0000_0000 - 0xBF_FFFF_FFFF */
+/* 736 GiB to 768 GiB, size of 32 GiB : RESERVED */
+
+/* 0xC0_0000_0000 ************************************************************/
+
+/* 0xC0_0000_0000 - 0xD9_FFFF_FFFF */
+/* 768 GiB to 872 GiB, size of 104 GiB : FREE */
+
+/* 0xDA_0000_0000 - 0xDA_FFFF_FFFF */
+/* 872 GiB to 876 GiB, size of 4 GiB : PDSCODEDATA_HEAP */
+#define ROGUE_PDSCODEDATA_HEAP_BASE 0xDA00000000ull
+#define ROGUE_PDSCODEDATA_HEAP_SIZE SZ_4G
+
+/* 0xDB_0000_0000 - 0xDB_FFFF_FFFF */
+/* 876 GiB to 880 GiB, size of 256 MiB (reserved 4GiB) : BRN **/
+/*
+ * The BRN63142 quirk workaround requires Region Header memory to be at the top
+ * of a 16GiB aligned range. This is so when masked with 0x03FFFFFFFF the
+ * address will avoid aliasing PB addresses. Start at 879.75GiB. Size of 256MiB.
+ */
+#define ROGUE_RGNHDR_HEAP_BASE 0xDBF0000000ull
+#define ROGUE_RGNHDR_HEAP_SIZE SZ_256M
+
+/* 0xDC_0000_0000 - 0xDF_FFFF_FFFF */
+/* 880 GiB to 896 GiB, size of 16 GiB : FREE */
+
+/* 0xE0_0000_0000 - 0xE0_FFFF_FFFF */
+/* 896 GiB to 900 GiB, size of 4 GiB : USCCODE_HEAP */
+#define ROGUE_USCCODE_HEAP_BASE 0xE000000000ull
+#define ROGUE_USCCODE_HEAP_SIZE SZ_4G
+
+/* 0xE1_0000_0000 - 0xE1_BFFF_FFFF */
+/* 900 GiB to 903 GiB, size of 3 GiB : RESERVED */
+
+/* 0xE1_C000_000 - 0xE1_FFFF_FFFF */
+/* 903 GiB to 904 GiB, reserved 1 GiB, : FIRMWARE_HEAP */
+#define ROGUE_FW_HEAP_BASE 0xE1C0000000ull
+
+/* 0xE2_0000_0000 - 0xE3_FFFF_FFFF */
+/* 904 GiB to 912 GiB, size of 8 GiB : FREE */
+
+/* 0xE4_0000_0000 - 0xE7_FFFF_FFFF */
+/* 912 GiB to 968 GiB, size of 16 GiB : TRANSFER_FRAG */
+#define ROGUE_TRANSFER_FRAG_HEAP_BASE 0xE400000000ull
+#define ROGUE_TRANSFER_FRAG_HEAP_SIZE SZ_16G
+
+/* 0xE8_0000_0000 - 0xF1_FFFF_FFFF */
+/* 928 GiB to 968 GiB, size of 40 GiB : RESERVED */
+
+/* 0xF2_0000_0000 - 0xF2_001F_FFFF **/
+/* 968 GiB to 969 GiB, size of 2 MiB : VISTEST_HEAP */
+#define ROGUE_VISTEST_HEAP_BASE 0xF200000000ull
+#define ROGUE_VISTEST_HEAP_SIZE SZ_2M
+
+/* 0xF2_4000_0000 - 0xF2_FFFF_FFFF */
+/* 969 GiB to 972 GiB, size of 3 GiB : FREE */
+
+/* 0xF3_0000_0000 - 0xFF_FFFF_FFFF */
+/* 972 GiB to 1024 GiB, size of 52 GiB : FREE */
+
+/* 0xFF_FFFF_FFFF ************************************************************/
+
+#endif /* PVR_ROGUE_HEAP_CONFIG_H */
diff --git a/drivers/gpu/drm/imagination/pvr_rogue_meta.h b/drivers/gpu/drm/imagination/pvr_rogue_meta.h
new file mode 100644
index 000000000000..736e94618832
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_rogue_meta.h
@@ -0,0 +1,356 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_ROGUE_META_H
+#define PVR_ROGUE_META_H
+
+/***** The META HW register definitions in the file are updated manually *****/
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+/*
+ ******************************************************************************
+ * META registers and MACROS
+ *****************************************************************************
+ */
+#define META_CR_CTRLREG_BASE(t) (0x04800000U + (0x1000U * (t)))
+
+#define META_CR_TXPRIVEXT (0x048000E8)
+#define META_CR_TXPRIVEXT_MINIM_EN BIT(7)
+
+#define META_CR_SYSC_JTAG_THREAD (0x04830030)
+#define META_CR_SYSC_JTAG_THREAD_PRIV_EN (0x00000004)
+
+#define META_CR_PERF_COUNT0 (0x0480FFE0)
+#define META_CR_PERF_COUNT1 (0x0480FFE8)
+#define META_CR_PERF_COUNT_CTRL_SHIFT (28)
+#define META_CR_PERF_COUNT_CTRL_MASK (0xF0000000)
+#define META_CR_PERF_COUNT_CTRL_DCACHEHITS (8 << META_CR_PERF_COUNT_CTRL_SHIFT)
+#define META_CR_PERF_COUNT_CTRL_ICACHEHITS (9 << META_CR_PERF_COUNT_CTRL_SHIFT)
+#define META_CR_PERF_COUNT_CTRL_ICACHEMISS \
+	(0xA << META_CR_PERF_COUNT_CTRL_SHIFT)
+#define META_CR_PERF_COUNT_CTRL_ICORE (0xD << META_CR_PERF_COUNT_CTRL_SHIFT)
+#define META_CR_PERF_COUNT_THR_SHIFT (24)
+#define META_CR_PERF_COUNT_THR_MASK (0x0F000000)
+#define META_CR_PERF_COUNT_THR_0 (0x1 << META_CR_PERF_COUNT_THR_SHIFT)
+#define META_CR_PERF_COUNT_THR_1 (0x2 << META_CR_PERF_COUNT_THR_1)
+
+#define META_CR_TxVECINT_BHALT (0x04820500)
+#define META_CR_PERF_ICORE0 (0x0480FFD0)
+#define META_CR_PERF_ICORE1 (0x0480FFD8)
+#define META_CR_PERF_ICORE_DCACHEMISS (0x8)
+
+#define META_CR_PERF_COUNT(ctrl, thr)                                        \
+	((META_CR_PERF_COUNT_CTRL_##ctrl << META_CR_PERF_COUNT_CTRL_SHIFT) | \
+	 ((thr) << META_CR_PERF_COUNT_THR_SHIFT))
+
+#define META_CR_TXUXXRXDT_OFFSET (META_CR_CTRLREG_BASE(0U) + 0x0000FFF0U)
+#define META_CR_TXUXXRXRQ_OFFSET (META_CR_CTRLREG_BASE(0U) + 0x0000FFF8U)
+
+/* Poll for done. */
+#define META_CR_TXUXXRXRQ_DREADY_BIT (0x80000000U)
+/* Set for read. */
+#define META_CR_TXUXXRXRQ_RDnWR_BIT (0x00010000U)
+#define META_CR_TXUXXRXRQ_TX_S (12)
+#define META_CR_TXUXXRXRQ_RX_S (4)
+#define META_CR_TXUXXRXRQ_UXX_S (0)
+
+/* Internal ctrl regs. */
+#define META_CR_TXUIN_ID (0x0)
+/* Data unit regs. */
+#define META_CR_TXUD0_ID (0x1)
+/* Data unit regs. */
+#define META_CR_TXUD1_ID (0x2)
+/* Address unit regs. */
+#define META_CR_TXUA0_ID (0x3)
+/* Address unit regs. */
+#define META_CR_TXUA1_ID (0x4)
+/* PC registers. */
+#define META_CR_TXUPC_ID (0x5)
+
+/* Macros to calculate register access values. */
+#define META_CR_CORE_REG(thr, reg_num, unit)          \
+	(((u32)(thr) << META_CR_TXUXXRXRQ_TX_S) |     \
+	 ((u32)(reg_num) << META_CR_TXUXXRXRQ_RX_S) | \
+	 ((u32)(unit) << META_CR_TXUXXRXRQ_UXX_S))
+
+#define META_CR_THR0_PC META_CR_CORE_REG(0, 0, META_CR_TXUPC_ID)
+#define META_CR_THR0_PCX META_CR_CORE_REG(0, 1, META_CR_TXUPC_ID)
+#define META_CR_THR0_SP META_CR_CORE_REG(0, 0, META_CR_TXUA0_ID)
+
+#define META_CR_THR1_PC META_CR_CORE_REG(1, 0, META_CR_TXUPC_ID)
+#define META_CR_THR1_PCX META_CR_CORE_REG(1, 1, META_CR_TXUPC_ID)
+#define META_CR_THR1_SP META_CR_CORE_REG(1, 0, META_CR_TXUA0_ID)
+
+#define SP_ACCESS(thread) META_CR_CORE_REG(thread, 0, META_CR_TXUA0_ID)
+#define PC_ACCESS(thread) META_CR_CORE_REG(thread, 0, META_CR_TXUPC_ID)
+
+#define META_CR_COREREG_ENABLE (0x0000000U)
+#define META_CR_COREREG_STATUS (0x0000010U)
+#define META_CR_COREREG_DEFR (0x00000A0U)
+#define META_CR_COREREG_PRIVEXT (0x00000E8U)
+
+#define META_CR_T0ENABLE_OFFSET \
+	(META_CR_CTRLREG_BASE(0U) + META_CR_COREREG_ENABLE)
+#define META_CR_T0STATUS_OFFSET \
+	(META_CR_CTRLREG_BASE(0U) + META_CR_COREREG_STATUS)
+#define META_CR_T0DEFR_OFFSET (META_CR_CTRLREG_BASE(0U) + META_CR_COREREG_DEFR)
+#define META_CR_T0PRIVEXT_OFFSET \
+	(META_CR_CTRLREG_BASE(0U) + META_CR_COREREG_PRIVEXT)
+
+#define META_CR_T1ENABLE_OFFSET \
+	(META_CR_CTRLREG_BASE(1U) + META_CR_COREREG_ENABLE)
+#define META_CR_T1STATUS_OFFSET \
+	(META_CR_CTRLREG_BASE(1U) + META_CR_COREREG_STATUS)
+#define META_CR_T1DEFR_OFFSET (META_CR_CTRLREG_BASE(1U) + META_CR_COREREG_DEFR)
+#define META_CR_T1PRIVEXT_OFFSET \
+	(META_CR_CTRLREG_BASE(1U) + META_CR_COREREG_PRIVEXT)
+
+#define META_CR_TXENABLE_ENABLE_BIT (0x00000001U) /* Set if running */
+#define META_CR_TXSTATUS_PRIV (0x00020000U)
+#define META_CR_TXPRIVEXT_MINIM (0x00000080U)
+
+#define META_MEM_GLOBAL_RANGE_BIT (0x80000000U)
+
+#define META_CR_TXCLKCTRL (0x048000B0)
+#define META_CR_TXCLKCTRL_ALL_ON (0x55111111)
+#define META_CR_TXCLKCTRL_ALL_AUTO (0xAA222222)
+
+#define META_CR_MMCU_LOCAL_EBCTRL (0x04830600)
+#define META_CR_MMCU_LOCAL_EBCTRL_ICWIN (0x3 << 14)
+#define META_CR_MMCU_LOCAL_EBCTRL_DCWIN (0x3 << 6)
+#define META_CR_SYSC_DCPART(n) (0x04830200 + (n) * 0x8)
+#define META_CR_SYSC_DCPARTX_CACHED_WRITE_ENABLE (0x1 << 31)
+#define META_CR_SYSC_ICPART(n) (0x04830220 + (n) * 0x8)
+#define META_CR_SYSC_XCPARTX_LOCAL_ADDR_OFFSET_TOP_HALF (0x8 << 16)
+#define META_CR_SYSC_XCPARTX_LOCAL_ADDR_FULL_CACHE (0xF)
+#define META_CR_SYSC_XCPARTX_LOCAL_ADDR_HALF_CACHE (0x7)
+#define META_CR_MMCU_DCACHE_CTRL (0x04830018)
+#define META_CR_MMCU_ICACHE_CTRL (0x04830020)
+#define META_CR_MMCU_XCACHE_CTRL_CACHE_HITS_EN (0x1)
+
+/*
+ ******************************************************************************
+ * META LDR Format
+ ******************************************************************************
+ */
+/* Block header structure. */
+struct rogue_meta_ldr_block_hdr {
+	u32 dev_id;
+	u32 sl_code;
+	u32 sl_data;
+	u16 pc_ctrl;
+	u16 crc;
+};
+
+/* High level data stream block structure. */
+struct rogue_meta_ldr_l1_data_blk {
+	u16 cmd;
+	u16 length;
+	u32 next;
+	u32 cmd_data[4];
+};
+
+/* High level data stream block structure. */
+struct rogue_meta_ldr_l2_data_blk {
+	u16 tag;
+	u16 length;
+	u32 block_data[4];
+};
+
+/* Config command structure. */
+struct rogue_meta_ldr_cfg_blk {
+	u32 type;
+	u32 block_data[4];
+};
+
+/* Block type definitions */
+#define ROGUE_META_LDR_COMMENT_TYPE_MASK (0x0010U)
+#define ROGUE_META_LDR_BLK_IS_COMMENT(x) (((x) & ROGUE_META_LDR_COMMENT_TYPE_MASK) != 0U)
+
+/*
+ * Command definitions
+ *  Value   Name            Description
+ *  0       LoadMem         Load memory with binary data.
+ *  1       LoadCore        Load a set of core registers.
+ *  2       LoadMMReg       Load a set of memory mapped registers.
+ *  3       StartThreads    Set each thread PC and SP, then enable threads.
+ *  4       ZeroMem         Zeros a memory region.
+ *  5       Config          Perform a configuration command.
+ */
+#define ROGUE_META_LDR_CMD_MASK (0x000FU)
+
+#define ROGUE_META_LDR_CMD_LOADMEM (0x0000U)
+#define ROGUE_META_LDR_CMD_LOADCORE (0x0001U)
+#define ROGUE_META_LDR_CMD_LOADMMREG (0x0002U)
+#define ROGUE_META_LDR_CMD_START_THREADS (0x0003U)
+#define ROGUE_META_LDR_CMD_ZEROMEM (0x0004U)
+#define ROGUE_META_LDR_CMD_CONFIG (0x0005U)
+
+/*
+ * Config Command definitions
+ *  Value   Name        Description
+ *  0       Pause       Pause for x times 100 instructions
+ *  1       Read        Read a value from register - No value return needed.
+ *                      Utilises effects of issuing reads to certain registers
+ *  2       Write       Write to mem location
+ *  3       MemSet      Set mem to value
+ *  4       MemCheck    check mem for specific value.
+ */
+#define ROGUE_META_LDR_CFG_PAUSE (0x0000)
+#define ROGUE_META_LDR_CFG_READ (0x0001)
+#define ROGUE_META_LDR_CFG_WRITE (0x0002)
+#define ROGUE_META_LDR_CFG_MEMSET (0x0003)
+#define ROGUE_META_LDR_CFG_MEMCHECK (0x0004)
+
+/*
+ ******************************************************************************
+ * ROGUE FW segmented MMU definitions
+ ******************************************************************************
+ */
+/* All threads can access the segment. */
+#define ROGUE_FW_SEGMMU_ALLTHRS (0xf << 8U)
+/* Writable. */
+#define ROGUE_FW_SEGMMU_WRITEABLE (0x1U << 1U)
+/* All threads can access and writable. */
+#define ROGUE_FW_SEGMMU_ALLTHRS_WRITEABLE \
+	(ROGUE_FW_SEGMMU_ALLTHRS | ROGUE_FW_SEGMMU_WRITEABLE)
+
+/* Direct map region 10 used for mapping GPU memory - max 8MB. */
+#define ROGUE_FW_SEGMMU_DMAP_GPU_ID (10U)
+#define ROGUE_FW_SEGMMU_DMAP_GPU_ADDR_START (0x07000000U)
+#define ROGUE_FW_SEGMMU_DMAP_GPU_MAX_SIZE (0x00800000U)
+
+/* Segment IDs. */
+#define ROGUE_FW_SEGMMU_DATA_ID (1U)
+#define ROGUE_FW_SEGMMU_BOOTLDR_ID (2U)
+#define ROGUE_FW_SEGMMU_TEXT_ID (ROGUE_FW_SEGMMU_BOOTLDR_ID)
+
+/*
+ * SLC caching strategy in S7 and volcanic is emitted through the segment MMU.
+ * All the segments configured through the macro ROGUE_FW_SEGMMU_OUTADDR_TOP are
+ * CACHED in the SLC.
+ * The interface has been kept the same to simplify the code changes.
+ * The bifdm argument is ignored (no longer relevant) in S7 and volcanic.
+ */
+#define ROGUE_FW_SEGMMU_OUTADDR_TOP_VIVT_SLC(pers, slc_policy, mmu_ctx)  \
+	((((u64)((pers) & 0x3)) << 52) | (((u64)((mmu_ctx) & 0xFF)) << 44) | \
+	 (((u64)((slc_policy) & 0x1)) << 40))
+#define ROGUE_FW_SEGMMU_OUTADDR_TOP_VIVT_SLC_CACHED(mmu_ctx) \
+	ROGUE_FW_SEGMMU_OUTADDR_TOP_VIVT_SLC(0x3, 0x0, mmu_ctx)
+#define ROGUE_FW_SEGMMU_OUTADDR_TOP_VIVT_SLC_UNCACHED(mmu_ctx) \
+	ROGUE_FW_SEGMMU_OUTADDR_TOP_VIVT_SLC(0x0, 0x1, mmu_ctx)
+
+/*
+ * To configure the Page Catalog and BIF-DM fed into the BIF for Garten
+ * accesses through this segment.
+ */
+#define ROGUE_FW_SEGMMU_OUTADDR_TOP_SLC(pc, bifdm) \
+	(((u64)((u64)(pc) & 0xFU) << 44U) | ((u64)((u64)(bifdm) & 0xFU) << 40U))
+
+#define ROGUE_FW_SEGMMU_META_BIFDM_ID (0x7U)
+
+/* META segments have 4kB minimum size. */
+#define ROGUE_FW_SEGMMU_ALIGN (0x1000U)
+
+/* Segmented MMU registers (n = segment id). */
+#define META_CR_MMCU_SEGMENT_N_BASE(n) (0x04850000U + ((n) * 0x10U))
+#define META_CR_MMCU_SEGMENT_N_LIMIT(n) (0x04850004U + ((n) * 0x10U))
+#define META_CR_MMCU_SEGMENT_N_OUTA0(n) (0x04850008U + ((n) * 0x10U))
+#define META_CR_MMCU_SEGMENT_N_OUTA1(n) (0x0485000CU + ((n) * 0x10U))
+
+/*
+ * The following defines must be recalculated if the Meta MMU segments used
+ * to access Host-FW data are changed
+ * Current combinations are:
+ * - SLC uncached, META cached,   FW base address 0x70000000
+ * - SLC uncached, META uncached, FW base address 0xF0000000
+ * - SLC cached,   META cached,   FW base address 0x10000000
+ * - SLC cached,   META uncached, FW base address 0x90000000
+ */
+#define ROGUE_FW_SEGMMU_DATA_BASE_ADDRESS (0x10000000U)
+#define ROGUE_FW_SEGMMU_DATA_META_CACHED (0x0U)
+#define ROGUE_FW_SEGMMU_DATA_META_UNCACHED (META_MEM_GLOBAL_RANGE_BIT)
+#define ROGUE_FW_SEGMMU_DATA_META_CACHE_MASK (META_MEM_GLOBAL_RANGE_BIT)
+/*
+ * For non-VIVT SLCs the cacheability of the FW data in the SLC is selected in
+ * the PTEs for the FW data, not in the Meta Segment MMU, which means these
+ * defines have no real effect in those cases.
+ */
+#define ROGUE_FW_SEGMMU_DATA_VIVT_SLC_CACHED (0x0U)
+#define ROGUE_FW_SEGMMU_DATA_VIVT_SLC_UNCACHED (0x60000000U)
+#define ROGUE_FW_SEGMMU_DATA_VIVT_SLC_CACHE_MASK (0x60000000U)
+
+/*
+ ******************************************************************************
+ * ROGUE FW Bootloader defaults
+ ******************************************************************************
+ */
+#define ROGUE_FW_BOOTLDR_META_ADDR (0x40000000U)
+#define ROGUE_FW_BOOTLDR_DEVV_ADDR_0 (0xC0000000U)
+#define ROGUE_FW_BOOTLDR_DEVV_ADDR_1 (0x000000E1)
+#define ROGUE_FW_BOOTLDR_DEVV_ADDR                     \
+	((((u64)ROGUE_FW_BOOTLDR_DEVV_ADDR_1) << 32) | \
+	 ROGUE_FW_BOOTLDR_DEVV_ADDR_0)
+#define ROGUE_FW_BOOTLDR_LIMIT (0x1FFFF000)
+#define ROGUE_FW_MAX_BOOTLDR_OFFSET (0x1000)
+
+/* Bootloader configuration offset is in dwords (512 bytes) */
+#define ROGUE_FW_BOOTLDR_CONF_OFFSET (0x80)
+
+/*
+ ******************************************************************************
+ * ROGUE META Stack
+ ******************************************************************************
+ */
+#define ROGUE_META_STACK_SIZE (0x1000U)
+
+/*
+ ******************************************************************************
+ * ROGUE META Core memory
+ ******************************************************************************
+ */
+/* Code and data both map to the same physical memory. */
+#define ROGUE_META_COREMEM_CODE_ADDR (0x80000000U)
+#define ROGUE_META_COREMEM_DATA_ADDR (0x82000000U)
+#define ROGUE_META_COREMEM_OFFSET_MASK (0x01ffffffU)
+
+#define ROGUE_META_IS_COREMEM_CODE(a, b)                                \
+	({                                                              \
+		u32 _a = (a), _b = (b);                                 \
+		((_a) >= ROGUE_META_COREMEM_CODE_ADDR) &&               \
+			((_a) < (ROGUE_META_COREMEM_CODE_ADDR + (_b))); \
+	})
+#define ROGUE_META_IS_COREMEM_DATA(a, b)                                \
+	({                                                              \
+		u32 _a = (a), _b = (b);                                 \
+		((_a) >= ROGUE_META_COREMEM_DATA_ADDR) &&               \
+			((_a) < (ROGUE_META_COREMEM_DATA_ADDR + (_b))); \
+	})
+/*
+ ******************************************************************************
+ * 2nd thread
+ ******************************************************************************
+ */
+#define ROGUE_FW_THR1_PC (0x18930000)
+#define ROGUE_FW_THR1_SP (0x78890000)
+
+/*
+ ******************************************************************************
+ * META compatibility
+ ******************************************************************************
+ */
+
+#define META_CR_CORE_ID (0x04831000)
+#define META_CR_CORE_ID_VER_SHIFT (16U)
+#define META_CR_CORE_ID_VER_CLRMSK (0XFF00FFFFU)
+
+#define ROGUE_CR_META_MTP218_CORE_ID_VALUE 0x19
+#define ROGUE_CR_META_MTP219_CORE_ID_VALUE 0x1E
+#define ROGUE_CR_META_LTP218_CORE_ID_VALUE 0x1C
+#define ROGUE_CR_META_LTP217_CORE_ID_VALUE 0x1F
+
+#define ROGUE_FW_PROCESSOR_META "META"
+
+#endif /* PVR_ROGUE_META_H */
diff --git a/drivers/gpu/drm/imagination/pvr_rogue_mips.h b/drivers/gpu/drm/imagination/pvr_rogue_mips.h
new file mode 100644
index 000000000000..fe5167bf7fba
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_rogue_mips.h
@@ -0,0 +1,335 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_ROGUE_MIPS_H
+#define PVR_ROGUE_MIPS_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+/* Utility defines for memory management. */
+#define ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K (12)
+#define ROGUE_MIPSFW_PAGE_SIZE_4K (0x1 << ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K)
+#define ROGUE_MIPSFW_PAGE_MASK_4K (ROGUE_MIPSFW_PAGE_SIZE_4K - 1)
+#define ROGUE_MIPSFW_LOG2_PAGE_SIZE_64K (16)
+#define ROGUE_MIPSFW_PAGE_SIZE_64K (0x1 << ROGUE_MIPSFW_LOG2_PAGE_SIZE_64K)
+#define ROGUE_MIPSFW_PAGE_MASK_64K (ROGUE_MIPSFW_PAGE_SIZE_64K - 1)
+#define ROGUE_MIPSFW_LOG2_PAGE_SIZE_256K (18)
+#define ROGUE_MIPSFW_PAGE_SIZE_256K (0x1 << ROGUE_MIPSFW_LOG2_PAGE_SIZE_256K)
+#define ROGUE_MIPSFW_PAGE_MASK_256K (ROGUE_MIPSFW_PAGE_SIZE_256K - 1)
+#define ROGUE_MIPSFW_LOG2_PAGE_SIZE_1MB (20)
+#define ROGUE_MIPSFW_PAGE_SIZE_1MB (0x1 << ROGUE_MIPSFW_LOG2_PAGE_SIZE_1MB)
+#define ROGUE_MIPSFW_PAGE_MASK_1MB (ROGUE_MIPSFW_PAGE_SIZE_1MB - 1)
+#define ROGUE_MIPSFW_LOG2_PAGE_SIZE_4MB (22)
+#define ROGUE_MIPSFW_PAGE_SIZE_4MB (0x1 << ROGUE_MIPSFW_LOG2_PAGE_SIZE_4MB)
+#define ROGUE_MIPSFW_PAGE_MASK_4MB (ROGUE_MIPSFW_PAGE_SIZE_4MB - 1)
+#define ROGUE_MIPSFW_LOG2_PTE_ENTRY_SIZE (2)
+/* log2 page table sizes dependent on FW heap size and page size (for each OS). */
+#define ROGUE_MIPSFW_LOG2_PAGETABLE_SIZE_4K(pvr_dev) ((pvr_dev)->fw_dev.fw_heap_info.log2_size - \
+						      ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K +    \
+						      ROGUE_MIPSFW_LOG2_PTE_ENTRY_SIZE)
+#define ROGUE_MIPSFW_LOG2_PAGETABLE_SIZE_64K(pvr_dev) ((pvr_dev)->fw_dev.fw_heap_info.log2_size - \
+						       ROGUE_MIPSFW_LOG2_PAGE_SIZE_64K +   \
+						       ROGUE_MIPSFW_LOG2_PTE_ENTRY_SIZE)
+/* Maximum number of page table pages (both Host and MIPS pages). */
+#define ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES (4)
+/* Total number of TLB entries. */
+#define ROGUE_MIPSFW_NUMBER_OF_TLB_ENTRIES (16)
+/* "Uncached" caching policy. */
+#define ROGUE_MIPSFW_UNCACHED_CACHE_POLICY (2)
+/* "Write-back write-allocate" caching policy. */
+#define ROGUE_MIPSFW_WRITEBACK_CACHE_POLICY (3)
+/* "Write-through no write-allocate" caching policy. */
+#define ROGUE_MIPSFW_WRITETHROUGH_CACHE_POLICY (1)
+/* Cached policy used by MIPS in case of physical bus on 32 bit. */
+#define ROGUE_MIPSFW_CACHED_POLICY (ROGUE_MIPSFW_WRITEBACK_CACHE_POLICY)
+/* Cached policy used by MIPS in case of physical bus on more than 32 bit. */
+#define ROGUE_MIPSFW_CACHED_POLICY_ABOVE_32BIT (ROGUE_MIPSFW_WRITETHROUGH_CACHE_POLICY)
+/* Total number of Remap entries. */
+#define ROGUE_MIPSFW_NUMBER_OF_REMAP_ENTRIES (2 * ROGUE_MIPSFW_NUMBER_OF_TLB_ENTRIES)
+
+/* MIPS EntryLo/PTE format. */
+
+#define ROGUE_MIPSFW_ENTRYLO_READ_INHIBIT_SHIFT (31U)
+#define ROGUE_MIPSFW_ENTRYLO_READ_INHIBIT_CLRMSK (0X7FFFFFFF)
+#define ROGUE_MIPSFW_ENTRYLO_READ_INHIBIT_EN (0X80000000)
+
+#define ROGUE_MIPSFW_ENTRYLO_EXEC_INHIBIT_SHIFT (30U)
+#define ROGUE_MIPSFW_ENTRYLO_EXEC_INHIBIT_CLRMSK (0XBFFFFFFF)
+#define ROGUE_MIPSFW_ENTRYLO_EXEC_INHIBIT_EN (0X40000000)
+
+/* Page Frame Number */
+#define ROGUE_MIPSFW_ENTRYLO_PFN_SHIFT (6)
+#define ROGUE_MIPSFW_ENTRYLO_PFN_ALIGNSHIFT (12)
+/* Mask used for the MIPS Page Table in case of physical bus on 32 bit. */
+#define ROGUE_MIPSFW_ENTRYLO_PFN_MASK (0x03FFFFC0)
+#define ROGUE_MIPSFW_ENTRYLO_PFN_SIZE (20)
+/* Mask used for the MIPS Page Table in case of physical bus on more than 32 bit. */
+#define ROGUE_MIPSFW_ENTRYLO_PFN_MASK_ABOVE_32BIT (0x3FFFFFC0)
+#define ROGUE_MIPSFW_ENTRYLO_PFN_SIZE_ABOVE_32BIT (24)
+#define ROGUE_MIPSFW_ADDR_TO_ENTRYLO_PFN_RSHIFT (ROGUE_MIPSFW_ENTRYLO_PFN_ALIGNSHIFT - \
+						 ROGUE_MIPSFW_ENTRYLO_PFN_SHIFT)
+
+#define ROGUE_MIPSFW_ENTRYLO_CACHE_POLICY_SHIFT (3U)
+#define ROGUE_MIPSFW_ENTRYLO_CACHE_POLICY_CLRMSK (0XFFFFFFC7)
+
+#define ROGUE_MIPSFW_ENTRYLO_DIRTY_SHIFT (2U)
+#define ROGUE_MIPSFW_ENTRYLO_DIRTY_CLRMSK (0XFFFFFFFB)
+#define ROGUE_MIPSFW_ENTRYLO_DIRTY_EN (0X00000004)
+
+#define ROGUE_MIPSFW_ENTRYLO_VALID_SHIFT (1U)
+#define ROGUE_MIPSFW_ENTRYLO_VALID_CLRMSK (0XFFFFFFFD)
+#define ROGUE_MIPSFW_ENTRYLO_VALID_EN (0X00000002)
+
+#define ROGUE_MIPSFW_ENTRYLO_GLOBAL_SHIFT (0U)
+#define ROGUE_MIPSFW_ENTRYLO_GLOBAL_CLRMSK (0XFFFFFFFE)
+#define ROGUE_MIPSFW_ENTRYLO_GLOBAL_EN (0X00000001)
+
+#define ROGUE_MIPSFW_ENTRYLO_DVG (ROGUE_MIPSFW_ENTRYLO_DIRTY_EN | \
+				  ROGUE_MIPSFW_ENTRYLO_VALID_EN | \
+				  ROGUE_MIPSFW_ENTRYLO_GLOBAL_EN)
+#define ROGUE_MIPSFW_ENTRYLO_UNCACHED (ROGUE_MIPSFW_UNCACHED_CACHE_POLICY << \
+				       ROGUE_MIPSFW_ENTRYLO_CACHE_POLICY_SHIFT)
+#define ROGUE_MIPSFW_ENTRYLO_DVG_UNCACHED (ROGUE_MIPSFW_ENTRYLO_DVG | \
+					   ROGUE_MIPSFW_ENTRYLO_UNCACHED)
+
+/* Remap Range Config Addr Out. */
+/* These defines refer to the upper half of the Remap Range Config register. */
+#define ROGUE_MIPSFW_REMAP_RANGE_ADDR_OUT_MASK (0x0FFFFFF0)
+#define ROGUE_MIPSFW_REMAP_RANGE_ADDR_OUT_SHIFT (4) /* wrt upper half of the register. */
+#define ROGUE_MIPSFW_REMAP_RANGE_ADDR_OUT_ALIGNSHIFT (12)
+#define ROGUE_MIPSFW_ADDR_TO_RR_ADDR_OUT_RSHIFT (ROGUE_MIPSFW_REMAP_RANGE_ADDR_OUT_ALIGNSHIFT - \
+						 ROGUE_MIPSFW_REMAP_RANGE_ADDR_OUT_SHIFT)
+
+/*
+ * Pages to trampoline problematic physical addresses:
+ *   - ROGUE_MIPSFW_BOOT_REMAP_PHYS_ADDR_IN : 0x1FC0_0000
+ *   - ROGUE_MIPSFW_DATA_REMAP_PHYS_ADDR_IN : 0x1FC0_1000
+ *   - ROGUE_MIPSFW_CODE_REMAP_PHYS_ADDR_IN : 0x1FC0_2000
+ *   - (benign trampoline)               : 0x1FC0_3000
+ * that would otherwise be erroneously remapped by the MIPS wrapper.
+ * (see "Firmware virtual layout and remap configuration" section below)
+ */
+
+#define ROGUE_MIPSFW_TRAMPOLINE_LOG2_NUMPAGES (2)
+#define ROGUE_MIPSFW_TRAMPOLINE_NUMPAGES BIT(ROGUE_MIPSFW_TRAMPOLINE_LOG2_NUMPAGES)
+#define ROGUE_MIPSFW_TRAMPOLINE_SIZE (ROGUE_MIPSFW_TRAMPOLINE_NUMPAGES << \
+				      ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K)
+#define ROGUE_MIPSFW_TRAMPOLINE_LOG2_SEGMENT_SIZE (ROGUE_MIPSFW_TRAMPOLINE_LOG2_NUMPAGES + \
+						   ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K)
+
+#define ROGUE_MIPSFW_TRAMPOLINE_TARGET_PHYS_ADDR (ROGUE_MIPSFW_BOOT_REMAP_PHYS_ADDR_IN)
+#define ROGUE_MIPSFW_TRAMPOLINE_OFFSET(a) ((a) - ROGUE_MIPSFW_BOOT_REMAP_PHYS_ADDR_IN)
+
+#define ROGUE_MIPSFW_SENSITIVE_ADDR(a) (ROGUE_MIPSFW_BOOT_REMAP_PHYS_ADDR_IN == \
+					(~((1 << ROGUE_MIPSFW_TRAMPOLINE_LOG2_SEGMENT_SIZE) - 1) \
+					 & (a)))
+
+/* Firmware virtual layout and remap configuration. */
+/*
+ * For each remap region we define:
+ * - the virtual base used by the Firmware to access code/data through that region
+ * - the microAptivAP physical address correspondent to the virtual base address,
+ *   used as input address and remapped to the actual physical address
+ * - log2 of size of the region remapped by the MIPS wrapper, i.e. number of bits from
+ *   the bottom of the base input address that survive onto the output address
+ *   (this defines both the alignment and the maximum size of the remapped region)
+ * - one or more code/data segments within the remapped region.
+ */
+
+/* Boot remap setup. */
+#define ROGUE_MIPSFW_BOOT_REMAP_VIRTUAL_BASE (0xBFC00000)
+#define ROGUE_MIPSFW_BOOT_REMAP_PHYS_ADDR_IN (0x1FC00000)
+#define ROGUE_MIPSFW_BOOT_REMAP_LOG2_SEGMENT_SIZE (12)
+#define ROGUE_MIPSFW_BOOT_NMI_CODE_VIRTUAL_BASE (ROGUE_MIPSFW_BOOT_REMAP_VIRTUAL_BASE)
+
+/* Data remap setup. */
+#define ROGUE_MIPSFW_DATA_REMAP_VIRTUAL_BASE (0xBFC01000)
+#define ROGUE_MIPSFW_DATA_CACHED_REMAP_VIRTUAL_BASE (0x9FC01000)
+#define ROGUE_MIPSFW_DATA_REMAP_PHYS_ADDR_IN (0x1FC01000)
+#define ROGUE_MIPSFW_DATA_REMAP_LOG2_SEGMENT_SIZE (12)
+#define ROGUE_MIPSFW_BOOT_NMI_DATA_VIRTUAL_BASE (ROGUE_MIPSFW_DATA_REMAP_VIRTUAL_BASE)
+
+/* Code remap setup. */
+#define ROGUE_MIPSFW_CODE_REMAP_VIRTUAL_BASE (0x9FC02000)
+#define ROGUE_MIPSFW_CODE_REMAP_PHYS_ADDR_IN (0x1FC02000)
+#define ROGUE_MIPSFW_CODE_REMAP_LOG2_SEGMENT_SIZE (12)
+#define ROGUE_MIPSFW_EXCEPTIONS_VIRTUAL_BASE (ROGUE_MIPSFW_CODE_REMAP_VIRTUAL_BASE)
+
+/* Permanent mappings setup. */
+#define ROGUE_MIPSFW_PT_VIRTUAL_BASE (0xCF000000)
+#define ROGUE_MIPSFW_REGISTERS_VIRTUAL_BASE (0xCF800000)
+#define ROGUE_MIPSFW_STACK_VIRTUAL_BASE (0xCF600000)
+
+/* Bootloader configuration data. */
+/*
+ * Bootloader configuration offset (where ROGUE_MIPSFW_BOOT_DATA lives)
+ * within the bootloader/NMI data page.
+ */
+#define ROGUE_MIPSFW_BOOTLDR_CONF_OFFSET (0x0)
+
+/* NMI shared data. */
+/* Base address of the shared data within the bootloader/NMI data page. */
+#define ROGUE_MIPSFW_NMI_SHARED_DATA_BASE (0x100)
+/* Size used by Debug dump data. */
+#define ROGUE_MIPSFW_NMI_SHARED_SIZE (0x2B0)
+/* Offsets in the NMI shared area in 32-bit words. */
+#define ROGUE_MIPSFW_NMI_SYNC_FLAG_OFFSET (0x0)
+#define ROGUE_MIPSFW_NMI_STATE_OFFSET (0x1)
+#define ROGUE_MIPSFW_NMI_ERROR_STATE_SET (0x1)
+
+/* MIPS boot stage. */
+#define ROGUE_MIPSFW_BOOT_STAGE_OFFSET (0x400)
+
+/*
+ * MIPS private data in the bootloader data page.
+ * Memory below this offset is used by the FW only, no interface data allowed.
+ */
+#define ROGUE_MIPSFW_PRIVATE_DATA_OFFSET (0x800)
+
+struct rogue_mipsfw_boot_data {
+	u64 stack_phys_addr;
+	u64 reg_base;
+	u64 pt_phys_addr[ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES];
+	u32 pt_log2_page_size;
+	u32 pt_num_pages;
+	u32 reserved1;
+	u32 reserved2;
+};
+
+#define ROGUE_MIPSFW_GET_OFFSET_IN_DWORDS(offset) ((offset) / sizeof(u32))
+#define ROGUE_MIPSFW_GET_OFFSET_IN_QWORDS(offset) ((offset) / sizeof(u64))
+
+/* Used for compatibility checks. */
+#define ROGUE_MIPSFW_ARCHTYPE_VER_CLRMSK (0xFFFFE3FFU)
+#define ROGUE_MIPSFW_ARCHTYPE_VER_SHIFT (10U)
+#define ROGUE_MIPSFW_CORE_ID_VALUE (0x001U)
+#define ROGUE_FW_PROCESSOR_MIPS "MIPS"
+
+/* microAptivAP cache line size. */
+#define ROGUE_MIPSFW_MICROAPTIVEAP_CACHELINE_SIZE (16U)
+
+/*
+ * The SOCIF transactions are identified with the top 16 bits of the physical address emitted by
+ * the MIPS.
+ */
+#define ROGUE_MIPSFW_WRAPPER_CONFIG_REGBANK_ADDR_ALIGN (16U)
+
+/* Values to put in the MIPS selectors for performance counters. */
+/* Icache accesses in COUNTER0. */
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_ICACHE_ACCESSES_C0 (9U)
+/* Icache misses in COUNTER1. */
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_ICACHE_MISSES_C1 (9U)
+
+/* Dcache accesses in COUNTER0. */
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_DCACHE_ACCESSES_C0 (10U)
+/* Dcache misses in COUNTER1. */
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_DCACHE_MISSES_C1 (11U)
+
+/* ITLB instruction accesses in COUNTER0. */
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_ITLB_INSTR_ACCESSES_C0 (5U)
+/* JTLB instruction accesses misses in COUNTER1. */
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_JTLB_INSTR_MISSES_C1 (7U)
+
+  /* Instructions completed in COUNTER0. */
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_INSTR_COMPLETED_C0 (1U)
+/* JTLB data misses in COUNTER1. */
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_JTLB_DATA_MISSES_C1 (8U)
+
+/* Shift for the Event field in the MIPS perf ctrl registers. */
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_EVENT_SHIFT (5U)
+
+/* Additional flags for performance counters. See MIPS manual for further reference. */
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_COUNT_USER_MODE (8U)
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_COUNT_KERNEL_MODE (2U)
+#define ROGUE_MIPSFW_PERF_COUNT_CTRL_COUNT_EXL (1U)
+
+#define ROGUE_MIPSFW_C0_NBHWIRQ	8
+
+/* Macros to decode C0_Cause register. */
+#define ROGUE_MIPSFW_C0_CAUSE_EXCCODE(cause) (((cause) & 0x7c) >> 2)
+#define ROGUE_MIPSFW_C0_CAUSE_EXCCODE_FWERROR 9
+/* Use only when Coprocessor Unusable exception. */
+#define ROGUE_MIPSFW_C0_CAUSE_UNUSABLE_UNIT(cause) (((cause) >> 28) & 0x3)
+#define ROGUE_MIPSFW_C0_CAUSE_PENDING_HWIRQ(cause) (((cause) & 0x3fc00) >> 10)
+#define ROGUE_MIPSFW_C0_CAUSE_FDCIPENDING BIT(21)
+#define ROGUE_MIPSFW_C0_CAUSE_IV BIT(23)
+#define ROGUE_MIPSFW_C0_CAUSE_IC BIT(25)
+#define ROGUE_MIPSFW_C0_CAUSE_PCIPENDING BIT(26)
+#define ROGUE_MIPSFW_C0_CAUSE_TIPENDING BIT(30)
+#define ROGUE_MIPSFW_C0_CAUSE_BRANCH_DELAY BIT(31)
+
+/* Macros to decode C0_Debug register. */
+#define ROGUE_MIPSFW_C0_DEBUG_EXCCODE(debug) (((debug) >> 10) & 0x1f)
+#define ROGUE_MIPSFW_C0_DEBUG_DSS BIT(0)
+#define ROGUE_MIPSFW_C0_DEBUG_DBP BIT(1)
+#define ROGUE_MIPSFW_C0_DEBUG_DDBL BIT(2)
+#define ROGUE_MIPSFW_C0_DEBUG_DDBS BIT(3)
+#define ROGUE_MIPSFW_C0_DEBUG_DIB BIT(4)
+#define ROGUE_MIPSFW_C0_DEBUG_DINT BIT(5)
+#define ROGUE_MIPSFW_C0_DEBUG_DIBIMPR BIT(6)
+#define ROGUE_MIPSFW_C0_DEBUG_DDBLIMPR BIT(18)
+#define ROGUE_MIPSFW_C0_DEBUG_DDBSIMPR BIT(19)
+#define ROGUE_MIPSFW_C0_DEBUG_IEXI BIT(20)
+#define ROGUE_MIPSFW_C0_DEBUG_DBUSEP BIT(21)
+#define ROGUE_MIPSFW_C0_DEBUG_CACHEEP BIT(22)
+#define ROGUE_MIPSFW_C0_DEBUG_MCHECKP BIT(23)
+#define ROGUE_MIPSFW_C0_DEBUG_IBUSEP BIT(24)
+#define ROGUE_MIPSFW_C0_DEBUG_DM BIT(30)
+#define ROGUE_MIPSFW_C0_DEBUG_DBD BIT(31)
+
+/* Macros to decode TLB entries. */
+#define ROGUE_MIPSFW_TLB_GET_MASK(page_mask) (((page_mask) >> 13) & 0XFFFFU)
+/* Page size in KB. */
+#define ROGUE_MIPSFW_TLB_GET_PAGE_SIZE(page_mask) ((((page_mask) | 0x1FFF) + 1) >> 11)
+/* Page size in KB. */
+#define ROGUE_MIPSFW_TLB_GET_PAGE_MASK(page_size) ((((page_size) << 11) - 1) & ~0x7FF)
+#define ROGUE_MIPSFW_TLB_GET_VPN2(entry_hi) ((entry_hi) >> 13)
+#define ROGUE_MIPSFW_TLB_GET_COHERENCY(entry_lo) (((entry_lo) >> 3) & 0x7U)
+#define ROGUE_MIPSFW_TLB_GET_PFN(entry_lo) (((entry_lo) >> 6) & 0XFFFFFU)
+/* GET_PA uses a non-standard PFN mask for 36 bit addresses. */
+#define ROGUE_MIPSFW_TLB_GET_PA(entry_lo) (((u64)(entry_lo) & \
+					    ROGUE_MIPSFW_ENTRYLO_PFN_MASK_ABOVE_32BIT) << 6)
+#define ROGUE_MIPSFW_TLB_GET_INHIBIT(entry_lo) (((entry_lo) >> 30) & 0x3U)
+#define ROGUE_MIPSFW_TLB_GET_DGV(entry_lo) ((entry_lo) & 0x7U)
+#define ROGUE_MIPSFW_TLB_GLOBAL BIT(0)
+#define ROGUE_MIPSFW_TLB_VALID BIT(1)
+#define ROGUE_MIPSFW_TLB_DIRTY BIT(2)
+#define ROGUE_MIPSFW_TLB_XI BIT(30)
+#define ROGUE_MIPSFW_TLB_RI BIT(31)
+
+#define ROGUE_MIPSFW_REMAP_GET_REGION_SIZE(region_size_encoding) (1 << (((region_size_encoding) \
+									+ 1) << 1))
+
+struct rogue_mips_tlb_entry {
+	u32 tlb_page_mask;
+	u32 tlb_hi;
+	u32 tlb_lo0;
+	u32 tlb_lo1;
+};
+
+struct rogue_mips_remap_entry {
+	u32 remap_addr_in;  /* Always 4k aligned. */
+	u32 remap_addr_out; /* Always 4k aligned. */
+	u32 remap_region_size;
+};
+
+struct rogue_mips_state {
+	u32 error_state; /* This must come first in the structure. */
+	u32 error_epc;
+	u32 status_register;
+	u32 cause_register;
+	u32 bad_register;
+	u32 epc;
+	u32 sp;
+	u32 debug;
+	u32 depc;
+	u32 bad_instr;
+	u32 unmapped_address;
+	struct rogue_mips_tlb_entry tlb[ROGUE_MIPSFW_NUMBER_OF_TLB_ENTRIES];
+	struct rogue_mips_remap_entry remap[ROGUE_MIPSFW_NUMBER_OF_REMAP_ENTRIES];
+};
+
+#include "pvr_rogue_mips_check.h"
+
+#endif /* PVR_ROGUE_MIPS_H */
diff --git a/drivers/gpu/drm/imagination/pvr_rogue_mips_check.h b/drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
new file mode 100644
index 000000000000..efad38039cae
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_ROGUE_MIPS_CHECK_H
+#define PVR_ROGUE_MIPS_CHECK_H
+
+#include <linux/build_bug.h>
+
+static_assert(offsetof(struct rogue_mips_tlb_entry, tlb_page_mask) == 0,
+	      "offsetof(struct rogue_mips_tlb_entry, tlb_page_mask) incorrect");
+static_assert(offsetof(struct rogue_mips_tlb_entry, tlb_hi) == 4,
+	      "offsetof(struct rogue_mips_tlb_entry, tlb_hi) incorrect");
+static_assert(offsetof(struct rogue_mips_tlb_entry, tlb_lo0) == 8,
+	      "offsetof(struct rogue_mips_tlb_entry, tlb_lo0) incorrect");
+static_assert(offsetof(struct rogue_mips_tlb_entry, tlb_lo1) == 12,
+	      "offsetof(struct rogue_mips_tlb_entry, tlb_lo1) incorrect");
+static_assert(sizeof(struct rogue_mips_tlb_entry) == 16,
+	      "struct rogue_mips_tlb_entry is incorrect size");
+
+static_assert(offsetof(struct rogue_mips_remap_entry, remap_addr_in) == 0,
+	      "offsetof(struct rogue_mips_remap_entry, remap_addr_in) incorrect");
+static_assert(offsetof(struct rogue_mips_remap_entry, remap_addr_out) == 4,
+	      "offsetof(struct rogue_mips_remap_entry, remap_addr_out) incorrect");
+static_assert(offsetof(struct rogue_mips_remap_entry, remap_region_size) == 8,
+	      "offsetof(struct rogue_mips_remap_entry, remap_region_size) incorrect");
+static_assert(sizeof(struct rogue_mips_remap_entry) == 12,
+	      "struct rogue_mips_remap_entry is incorrect size");
+
+static_assert(offsetof(struct rogue_mips_state, error_state) == 0,
+	      "offsetof(struct rogue_mips_state, error_state) incorrect");
+static_assert(offsetof(struct rogue_mips_state, error_epc) == 4,
+	      "offsetof(struct rogue_mips_state, error_epc) incorrect");
+static_assert(offsetof(struct rogue_mips_state, status_register) == 8,
+	      "offsetof(struct rogue_mips_state, status_register) incorrect");
+static_assert(offsetof(struct rogue_mips_state, cause_register) == 12,
+	      "offsetof(struct rogue_mips_state, cause_register) incorrect");
+static_assert(offsetof(struct rogue_mips_state, bad_register) == 16,
+	      "offsetof(struct rogue_mips_state, bad_register) incorrect");
+static_assert(offsetof(struct rogue_mips_state, epc) == 20,
+	      "offsetof(struct rogue_mips_state, epc) incorrect");
+static_assert(offsetof(struct rogue_mips_state, sp) == 24,
+	      "offsetof(struct rogue_mips_state, sp) incorrect");
+static_assert(offsetof(struct rogue_mips_state, debug) == 28,
+	      "offsetof(struct rogue_mips_state, debug) incorrect");
+static_assert(offsetof(struct rogue_mips_state, depc) == 32,
+	      "offsetof(struct rogue_mips_state, depc) incorrect");
+static_assert(offsetof(struct rogue_mips_state, bad_instr) == 36,
+	      "offsetof(struct rogue_mips_state, bad_instr) incorrect");
+static_assert(offsetof(struct rogue_mips_state, unmapped_address) == 40,
+	      "offsetof(struct rogue_mips_state, unmapped_address) incorrect");
+static_assert(offsetof(struct rogue_mips_state, tlb) == 44,
+	      "offsetof(struct rogue_mips_state, tlb) incorrect");
+static_assert(offsetof(struct rogue_mips_state, remap) == 300,
+	      "offsetof(struct rogue_mips_state, remap) incorrect");
+static_assert(sizeof(struct rogue_mips_state) == 684,
+	      "struct rogue_mips_state is incorrect size");
+
+#endif /* PVR_ROGUE_MIPS_CHECK_H */
diff --git a/drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h b/drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h
new file mode 100644
index 000000000000..cd28cded2741
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+/*  *** Autogenerated C -- do not edit ***  */
+
+#ifndef PVR_ROGUE_MMU_DEFS_H
+#define PVR_ROGUE_MMU_DEFS_H
+
+#define ROGUE_MMU_DEFS_REVISION 0
+
+#define ROGUE_BIF_DM_ENCODING_VERTEX (0x00000000U)
+#define ROGUE_BIF_DM_ENCODING_PIXEL (0x00000001U)
+#define ROGUE_BIF_DM_ENCODING_COMPUTE (0x00000002U)
+#define ROGUE_BIF_DM_ENCODING_TLA (0x00000003U)
+#define ROGUE_BIF_DM_ENCODING_PB_VCE (0x00000004U)
+#define ROGUE_BIF_DM_ENCODING_PB_TE (0x00000005U)
+#define ROGUE_BIF_DM_ENCODING_META (0x00000007U)
+#define ROGUE_BIF_DM_ENCODING_HOST (0x00000008U)
+#define ROGUE_BIF_DM_ENCODING_PM_ALIST (0x00000009U)
+
+#define ROGUE_MMUCTRL_VADDR_PC_INDEX_SHIFT (30U)
+#define ROGUE_MMUCTRL_VADDR_PC_INDEX_CLRMSK (0xFFFFFF003FFFFFFFULL)
+#define ROGUE_MMUCTRL_VADDR_PD_INDEX_SHIFT (21U)
+#define ROGUE_MMUCTRL_VADDR_PD_INDEX_CLRMSK (0xFFFFFFFFC01FFFFFULL)
+#define ROGUE_MMUCTRL_VADDR_PT_INDEX_SHIFT (12U)
+#define ROGUE_MMUCTRL_VADDR_PT_INDEX_CLRMSK (0xFFFFFFFFFFE00FFFULL)
+
+#define ROGUE_MMUCTRL_ENTRIES_PC_VALUE (0x00000400U)
+#define ROGUE_MMUCTRL_ENTRIES_PD_VALUE (0x00000200U)
+#define ROGUE_MMUCTRL_ENTRIES_PT_VALUE (0x00000200U)
+
+#define ROGUE_MMUCTRL_ENTRY_SIZE_PC_VALUE (0x00000020U)
+#define ROGUE_MMUCTRL_ENTRY_SIZE_PD_VALUE (0x00000040U)
+#define ROGUE_MMUCTRL_ENTRY_SIZE_PT_VALUE (0x00000040U)
+
+#define ROGUE_MMUCTRL_PAGE_SIZE_MASK (0x00000007U)
+#define ROGUE_MMUCTRL_PAGE_SIZE_4KB (0x00000000U)
+#define ROGUE_MMUCTRL_PAGE_SIZE_16KB (0x00000001U)
+#define ROGUE_MMUCTRL_PAGE_SIZE_64KB (0x00000002U)
+#define ROGUE_MMUCTRL_PAGE_SIZE_256KB (0x00000003U)
+#define ROGUE_MMUCTRL_PAGE_SIZE_1MB (0x00000004U)
+#define ROGUE_MMUCTRL_PAGE_SIZE_2MB (0x00000005U)
+
+#define ROGUE_MMUCTRL_PAGE_4KB_RANGE_SHIFT (12U)
+#define ROGUE_MMUCTRL_PAGE_4KB_RANGE_CLRMSK (0xFFFFFF0000000FFFULL)
+
+#define ROGUE_MMUCTRL_PAGE_16KB_RANGE_SHIFT (14U)
+#define ROGUE_MMUCTRL_PAGE_16KB_RANGE_CLRMSK (0xFFFFFF0000003FFFULL)
+
+#define ROGUE_MMUCTRL_PAGE_64KB_RANGE_SHIFT (16U)
+#define ROGUE_MMUCTRL_PAGE_64KB_RANGE_CLRMSK (0xFFFFFF000000FFFFULL)
+
+#define ROGUE_MMUCTRL_PAGE_256KB_RANGE_SHIFT (18U)
+#define ROGUE_MMUCTRL_PAGE_256KB_RANGE_CLRMSK (0xFFFFFF000003FFFFULL)
+
+#define ROGUE_MMUCTRL_PAGE_1MB_RANGE_SHIFT (20U)
+#define ROGUE_MMUCTRL_PAGE_1MB_RANGE_CLRMSK (0xFFFFFF00000FFFFFULL)
+
+#define ROGUE_MMUCTRL_PAGE_2MB_RANGE_SHIFT (21U)
+#define ROGUE_MMUCTRL_PAGE_2MB_RANGE_CLRMSK (0xFFFFFF00001FFFFFULL)
+
+#define ROGUE_MMUCTRL_PT_BASE_4KB_RANGE_SHIFT (12U)
+#define ROGUE_MMUCTRL_PT_BASE_4KB_RANGE_CLRMSK (0xFFFFFF0000000FFFULL)
+
+#define ROGUE_MMUCTRL_PT_BASE_16KB_RANGE_SHIFT (10U)
+#define ROGUE_MMUCTRL_PT_BASE_16KB_RANGE_CLRMSK (0xFFFFFF00000003FFULL)
+
+#define ROGUE_MMUCTRL_PT_BASE_64KB_RANGE_SHIFT (8U)
+#define ROGUE_MMUCTRL_PT_BASE_64KB_RANGE_CLRMSK (0xFFFFFF00000000FFULL)
+
+#define ROGUE_MMUCTRL_PT_BASE_256KB_RANGE_SHIFT (6U)
+#define ROGUE_MMUCTRL_PT_BASE_256KB_RANGE_CLRMSK (0xFFFFFF000000003FULL)
+
+#define ROGUE_MMUCTRL_PT_BASE_1MB_RANGE_SHIFT (5U)
+#define ROGUE_MMUCTRL_PT_BASE_1MB_RANGE_CLRMSK (0xFFFFFF000000001FULL)
+
+#define ROGUE_MMUCTRL_PT_BASE_2MB_RANGE_SHIFT (5U)
+#define ROGUE_MMUCTRL_PT_BASE_2MB_RANGE_CLRMSK (0xFFFFFF000000001FULL)
+
+#define ROGUE_MMUCTRL_PT_DATA_PM_META_PROTECT_SHIFT (62U)
+#define ROGUE_MMUCTRL_PT_DATA_PM_META_PROTECT_CLRMSK (0xBFFFFFFFFFFFFFFFULL)
+#define ROGUE_MMUCTRL_PT_DATA_PM_META_PROTECT_EN (0x4000000000000000ULL)
+#define ROGUE_MMUCTRL_PT_DATA_VP_PAGE_HI_SHIFT (40U)
+#define ROGUE_MMUCTRL_PT_DATA_VP_PAGE_HI_CLRMSK (0xC00000FFFFFFFFFFULL)
+#define ROGUE_MMUCTRL_PT_DATA_PAGE_SHIFT (12U)
+#define ROGUE_MMUCTRL_PT_DATA_PAGE_CLRMSK (0xFFFFFF0000000FFFULL)
+#define ROGUE_MMUCTRL_PT_DATA_VP_PAGE_LO_SHIFT (6U)
+#define ROGUE_MMUCTRL_PT_DATA_VP_PAGE_LO_CLRMSK (0xFFFFFFFFFFFFF03FULL)
+#define ROGUE_MMUCTRL_PT_DATA_ENTRY_PENDING_SHIFT (5U)
+#define ROGUE_MMUCTRL_PT_DATA_ENTRY_PENDING_CLRMSK (0xFFFFFFFFFFFFFFDFULL)
+#define ROGUE_MMUCTRL_PT_DATA_ENTRY_PENDING_EN (0x0000000000000020ULL)
+#define ROGUE_MMUCTRL_PT_DATA_PM_SRC_SHIFT (4U)
+#define ROGUE_MMUCTRL_PT_DATA_PM_SRC_CLRMSK (0xFFFFFFFFFFFFFFEFULL)
+#define ROGUE_MMUCTRL_PT_DATA_PM_SRC_EN (0x0000000000000010ULL)
+#define ROGUE_MMUCTRL_PT_DATA_SLC_BYPASS_CTRL_SHIFT (3U)
+#define ROGUE_MMUCTRL_PT_DATA_SLC_BYPASS_CTRL_CLRMSK (0xFFFFFFFFFFFFFFF7ULL)
+#define ROGUE_MMUCTRL_PT_DATA_SLC_BYPASS_CTRL_EN (0x0000000000000008ULL)
+#define ROGUE_MMUCTRL_PT_DATA_CC_SHIFT (2U)
+#define ROGUE_MMUCTRL_PT_DATA_CC_CLRMSK (0xFFFFFFFFFFFFFFFBULL)
+#define ROGUE_MMUCTRL_PT_DATA_CC_EN (0x0000000000000004ULL)
+#define ROGUE_MMUCTRL_PT_DATA_READ_ONLY_SHIFT (1U)
+#define ROGUE_MMUCTRL_PT_DATA_READ_ONLY_CLRMSK (0xFFFFFFFFFFFFFFFDULL)
+#define ROGUE_MMUCTRL_PT_DATA_READ_ONLY_EN (0x0000000000000002ULL)
+#define ROGUE_MMUCTRL_PT_DATA_VALID_SHIFT (0U)
+#define ROGUE_MMUCTRL_PT_DATA_VALID_CLRMSK (0xFFFFFFFFFFFFFFFEULL)
+#define ROGUE_MMUCTRL_PT_DATA_VALID_EN (0x0000000000000001ULL)
+
+#define ROGUE_MMUCTRL_PD_DATA_ENTRY_PENDING_SHIFT (40U)
+#define ROGUE_MMUCTRL_PD_DATA_ENTRY_PENDING_CLRMSK (0xFFFFFEFFFFFFFFFFULL)
+#define ROGUE_MMUCTRL_PD_DATA_ENTRY_PENDING_EN (0x0000010000000000ULL)
+#define ROGUE_MMUCTRL_PD_DATA_PT_BASE_SHIFT (5U)
+#define ROGUE_MMUCTRL_PD_DATA_PT_BASE_CLRMSK (0xFFFFFF000000001FULL)
+#define ROGUE_MMUCTRL_PD_DATA_PAGE_SIZE_SHIFT (1U)
+#define ROGUE_MMUCTRL_PD_DATA_PAGE_SIZE_CLRMSK (0xFFFFFFFFFFFFFFF1ULL)
+#define ROGUE_MMUCTRL_PD_DATA_PAGE_SIZE_4KB (0x0000000000000000ULL)
+#define ROGUE_MMUCTRL_PD_DATA_PAGE_SIZE_16KB (0x0000000000000002ULL)
+#define ROGUE_MMUCTRL_PD_DATA_PAGE_SIZE_64KB (0x0000000000000004ULL)
+#define ROGUE_MMUCTRL_PD_DATA_PAGE_SIZE_256KB (0x0000000000000006ULL)
+#define ROGUE_MMUCTRL_PD_DATA_PAGE_SIZE_1MB (0x0000000000000008ULL)
+#define ROGUE_MMUCTRL_PD_DATA_PAGE_SIZE_2MB (0x000000000000000aULL)
+#define ROGUE_MMUCTRL_PD_DATA_VALID_SHIFT (0U)
+#define ROGUE_MMUCTRL_PD_DATA_VALID_CLRMSK (0xFFFFFFFFFFFFFFFEULL)
+#define ROGUE_MMUCTRL_PD_DATA_VALID_EN (0x0000000000000001ULL)
+
+#define ROGUE_MMUCTRL_PC_DATA_PD_BASE_SHIFT (4U)
+#define ROGUE_MMUCTRL_PC_DATA_PD_BASE_CLRMSK (0x0000000FU)
+#define ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGNSHIFT (12U)
+#define ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGNSIZE (4096U)
+#define ROGUE_MMUCTRL_PC_DATA_ENTRY_PENDING_SHIFT (1U)
+#define ROGUE_MMUCTRL_PC_DATA_ENTRY_PENDING_CLRMSK (0xFFFFFFFDU)
+#define ROGUE_MMUCTRL_PC_DATA_ENTRY_PENDING_EN (0x00000002U)
+#define ROGUE_MMUCTRL_PC_DATA_VALID_SHIFT (0U)
+#define ROGUE_MMUCTRL_PC_DATA_VALID_CLRMSK (0xFFFFFFFEU)
+#define ROGUE_MMUCTRL_PC_DATA_VALID_EN (0x00000001U)
+
+#endif /* PVR_ROGUE_MMU_DEFS_H */
-- 
2.42.0

