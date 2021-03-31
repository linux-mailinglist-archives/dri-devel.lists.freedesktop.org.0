Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAEB350023
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702436EA82;
	Wed, 31 Mar 2021 12:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AF46EA79;
 Wed, 31 Mar 2021 12:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDFKrzxVqkxE/R9MQaLi4q2DHlMYxOyZpKl7yjEty5OOtCAtcfjmSgbsVegfK4x/xXDyBjeRHzPqD+KxKRwJpt8b4BxjJryO1K8lgGswvmD7rytJdUOLN8PtLuGQmurNu2ozZfdR9JtjJISkIKnWlCZ2DvJ7XpD1TLqOVfprw3J2oJ2UGY+PXMi/Xg6SOUtDvgCNdjvfVgCffBrEiWr9SQyJBa8fgEl9MhyIDca3+Qkx8swvntkAVUo7W3lIGiZEPtgF8t3SKwGBaCIgtr6e45jWHfE6DW6h7DX8CPeaunEYNvqW2CEmCxqqWLHkiZu2j2RfUFE7thNrSgM+cSfFIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA+8eV0D9JES+zslOcvLPrv8yXQ11q2pnDB1t8wxthQ=;
 b=Jr32gXriR+yIBmLpZZt2zp9A0EtqNxoh70ACFfNtIrJ3BtPRYeigeuIsyudW6YDZPm7ziu1pr+rn8t0j0kWQbo1ZUvLh5xoej/8ea7cMtwjUqWprjJUR1piRqz5bfj11A/+hRd9cH4s37Spcs4oV68UT0o6iNaGOBNMleVlVPXkBTNR6JxNZZq9UXHmohXZ/s6hPNPSW/PFn6A7q0G34WGl+9di60Ui/cVqg1omvzcx95mHeKhnp4NOvrV/IruSFJUkxngxXOs/vWPoc+w/MAxsGVSszjYEjW9kiBItcXX1qdHE5u51EuT+/KpZJtJnb0eawzVaRXEfepaOPjY2ldA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA+8eV0D9JES+zslOcvLPrv8yXQ11q2pnDB1t8wxthQ=;
 b=cBqyui7SKYGTr5V+CLLSpCyffADVIZUojG0wtL66/Z8PFW/GIAzB32ZQn1r8bdTQj/jfav7r8MFwBGco8+KACNAl8cX7OOgwEMoPLYpH8Zjfmc26Sdxf1nFvWjl1Bf3T4TTh92TpojzsBYbO10DMlUG1F1VPORxXnLtSpWOoVEw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB2937.namprd12.prod.outlook.com (2603:10b6:5:181::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Wed, 31 Mar 2021 12:25:23 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 12:25:23 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Zijlstra <peterz@infradead.org>,
 aric.cyr@amd.com
Subject: [PATCH 2/4] drm/amd/display: Add FPU event trace
Date: Wed, 31 Mar 2021 08:25:00 -0400
Message-Id: <20210331122502.1031073-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
References: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:1683:1bc7:ac8c:6a3]
X-ClientProxiedBy: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:1683:1bc7:ac8c:6a3)
 by YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend
 Transport; Wed, 31 Mar 2021 12:25:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 04171bf3-1afb-48ff-aa96-08d8f4400e51
X-MS-TrafficTypeDiagnostic: DM6PR12MB2937:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB293712B6BA639E071C14AE14987C9@DM6PR12MB2937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:264;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GbNCqrll0+hql5zMS0G7MEFL4R9HIEnEfjAMk8ZYyR1Jop+TbIEIzEgLw69pZBbSKZsbYuu8yMFnVpm4pVNUmEh9Oj8LtmIdk97yAftMyiTHxbv36Fs688zsLQ2BOkyiGw6lAfTwlZSR310E+iLHcn502sDF56GOHNEri7bTMa7vFFRtj/riLNGaSgkTPZgvmHEG9KCATsO1qbFDZFcAu+EaUAnD6/+OBkBhRWVMBdCQ9+0lIDkxcPQGAwKkNjsesdcUz2EKxFwhGMJYnX61N+jwse37PYkhnAUWvFRMhj6ONnllRQL0MilBJeznrlPRkP0dz6BB8116gpLsUdoCG4vQwhT2bWUGiQTxOPBij6Uo/0WW/WzIWMV8NHKETpv1IKS5rtSJ70WZo6+HV7H4YrsiKTw5DlVnMCNofOniMpaaNmXMnbl/fIPsBcjoIMtqw5koV3wme98YC7DsGLTlTj/Kym7PrrAawuPotsQqjUorqMC/C/27RwV2Vw+TtYtcPxincDyPUBdlnkGyfNZoZrXEsQp/i3RqZfYEzElXQL0dBw9n/ZhVC67mPXsa2BMatTHDDd6H74HgrmPPPiimZ04J/n9yIA1/+AA245kuQCRI/V/6/nN70xBWSM5ZsQxlloYGjUuT5e28OfhX2wqrGATJco38mwLvHH7uMR8cw8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(38100700001)(2906002)(6636002)(6666004)(4326008)(5660300002)(66946007)(36756003)(8936002)(83380400001)(478600001)(66556008)(66476007)(6486002)(8676002)(186003)(16526019)(6512007)(52116002)(1076003)(2616005)(110136005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?A0BTAer202wNdGHxULm0INu6LTXecl8TpU1PyYXd0fSVy7Lt7l3eUFtDPGAU?=
 =?us-ascii?Q?VlZKU84Obl5FGoCctJSUqVrS8BMjdYW48IZl6jEUxiAU+Oxp1F4mrQLhEua9?=
 =?us-ascii?Q?thujxIfdwXsxWozHAZONPSDBNywS7qk+jOq4o3thlVX3LXaHQFdXoatz/oBx?=
 =?us-ascii?Q?deHa99vJwjUcW+N3vOUYfq+5tSfqRiN0zFKL33loR/mlhyP7Lq4gV9gddHCA?=
 =?us-ascii?Q?mrALgMFLAyDwTsMvWoUf1H2OQRDfpO4amkAL7+uUmzogOreulRu9ICZsY9Oz?=
 =?us-ascii?Q?L4Ic/lp2Db4mihFcgaXn1734q4AlcyqCzCwjb3G0WlW7+avZT3ZdIjRligQD?=
 =?us-ascii?Q?mrhufdKQjFszfouaP4H8XwXsqiMP6+5YV3Bwsj5JoQZ2izUS/YZ5HKI1a3re?=
 =?us-ascii?Q?IKC3AzsWxHdGL/HaWIv4C8Cfex//csxUk6y3k60/uOnNaNO/VSPirm4ehMPO?=
 =?us-ascii?Q?+8rhs3KPdmuqlYCDjGm0PGraz5CLGHTEW2Wcnl4Un7qt0unrzuMby8+9utpw?=
 =?us-ascii?Q?vuAZNBnqr/nq/1FhzK73ag+bWfdal7uzXTBWQ9+pkaT8JnqSnwX5G9qziQp7?=
 =?us-ascii?Q?9Oz1M9A22tm0aeExxnuHkme5HsUlK+3IFoHzOAlg21KMJ84LnNeqcfmjaDQg?=
 =?us-ascii?Q?dQhfYBEmb3I68VEjnlHdxU4Ka2yjosySewnHILOrsmFwZPZuWPeERM7f3DPQ?=
 =?us-ascii?Q?75tBIM0EjDjB6yFmF4mMxbN9U8lXQAVTX+d/W+WB4MnsHBNv00u0eiKffci9?=
 =?us-ascii?Q?K+uGKNkiBYqVDkr9AcpxgnVeR3PHY5/Z5JPPywJf2gPLr0cHjgEx6v2XP75k?=
 =?us-ascii?Q?xIhr2jCubiGyod3FdBPlhrCsl7rP3WAuDuGQHtlFDAhXcw6A7mdf/urC+ida?=
 =?us-ascii?Q?YMMcAjypVU/cdINnYNKAtEd3uvzPikIGYZlzpNpzog40ghEA1aSAS1Z1jZO1?=
 =?us-ascii?Q?mp7Rc1hIC2qr5VQRG8rtee5o7fqzLIH+lCZemUgUBgKtXFohVw5bqjaWVq/z?=
 =?us-ascii?Q?9tZr1hNk6nQxdfZlYslyS/vKsyZb4KpDCrSkfB/3Z/qJnulQMLhSDc82t5iH?=
 =?us-ascii?Q?fBN87Jth6HDwVGm38eiZ9/ulWpkEr6SKOoq5usuxnlCsjULTB1jWkaXekmHW?=
 =?us-ascii?Q?QqJjfVq1qlaYjFednjnZIhs7GMMk+ZhhY02IBT+LZi33Mdajw3pYBESdGh5O?=
 =?us-ascii?Q?o0XEi0ZvpM/8KbhTBCqLSUuG5L2GoZcuOb6wkISxLPyQlftGtYLR4zesZVRY?=
 =?us-ascii?Q?6WIXGkLA5Y75ryeJi+M3BGC/j64JETiXIYPcrXgDA6cXAGehD9ERsW/kSV03?=
 =?us-ascii?Q?WGF9K72PIGnb9THRsuSWT5hCFZ1Q641UvxDnA9FlAcV75vKe3LR0nB/yfhQ7?=
 =?us-ascii?Q?Nh6o+C5wwSy+xyjBUyieUxSCm86o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04171bf3-1afb-48ff-aa96-08d8f4400e51
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:25:23.0191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5ymrA9E3WZNmDIbQYOB4tTQatAJKy2KniMr6c3LzCdwzPAB7aZwzhstSC8juc5w493wl30Fv/K9auQA/FKV0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2937
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't have any mechanism for tracing FPU operations inside the
display core, making the debug work a little bit tricky. For trying to
alleviate this problem, this commit introduces a trace mechanism inside
our DC_FP_START/END macros.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 21 +++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 61 +++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    | 33 ++++++++++
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |  3 +
 drivers/gpu/drm/amd/display/dc/os_types.h     |  6 +-
 6 files changed, 123 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 9a3b7bf8ab0b..7d3a7c6dbba3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -25,7 +25,8 @@
 
 
 
-AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o
+AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o \
+	dc_fpu.o
 
 ifneq ($(CONFIG_DRM_AMD_DC),)
 AMDGPUDM += amdgpu_dm_services.o amdgpu_dm_helpers.o amdgpu_dm_pp_smu.o
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index 46a33f64cf8e..230bb12c405e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -637,6 +637,27 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
 		  __entry->refresh_rate_ns)
 );
 
+TRACE_EVENT(dcn_fpu,
+	    TP_PROTO(bool begin, const char *function, const int line),
+	    TP_ARGS(begin, function, line),
+
+	    TP_STRUCT__entry(
+			     __field(bool, begin)
+			     __field(const char *, function)
+			     __field(int, line)
+	    ),
+	    TP_fast_assign(
+			   __entry->begin = begin;
+			   __entry->function = function;
+			   __entry->line = line;
+	    ),
+	    TP_printk("%s()+%d: %s",
+		      __entry->function,
+		      __entry->line,
+		      __entry->begin ? "begin" : "end"
+	    )
+);
+
 #endif /* _AMDGPU_DM_TRACE_H_ */
 
 #undef TRACE_INCLUDE_PATH
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
new file mode 100644
index 000000000000..ff34007509de
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dc_trace.h"
+
+#include <asm/fpu/api.h>
+
+/**
+ * dc_fpu_begin - Enables FPU protection
+ * @function_name: A string containing the function name for debug purposes
+ * @line: A-line number where DC_FP_START was invoked for debug purpose
+ *
+ * This function is responsible for managing the use of kernel_fpu_begin() with
+ * the advantage of providing an event trace for debugging.
+ *
+ * Note: Do not call this function directly; always use DC_FP_START().
+ */
+void dc_fpu_begin(const char *function_name, const int line)
+{
+	TRACE_DCN_FPU(true, function_name, line);
+	kernel_fpu_begin();
+}
+
+/**
+ * dc_fpu_end - Disable FPU protection
+ * @function_name: A string containing the function name for debug purposes
+ * @line: A-line number where DC_FP_END was invoked for debug purpose
+ *
+ * This function is responsible for managing the use of kernel_fpu_end() with
+ * the advantage of providing an event trace for debugging.
+ *
+ * Note: Do not call this function directly; always use DC_FP_END().
+ */
+void dc_fpu_end(const char *function_name, const int line)
+{
+	TRACE_DCN_FPU(false, function_name, line);
+	kernel_fpu_end();
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
new file mode 100644
index 000000000000..fb54983c5c60
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_FPU_H__
+#define __DC_FPU_H__
+
+void dc_fpu_begin(const char *function_name, const int line);
+void dc_fpu_end(const char *function_name, const int line);
+
+#endif /* __DC_FPU_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_trace.h b/drivers/gpu/drm/amd/display/dc/dc_trace.h
index d2615357269b..d598ba697e45 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_trace.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_trace.h
@@ -37,3 +37,6 @@
 
 #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
 	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
+
+#define TRACE_DCN_FPU(begin, function, line) \
+	trace_dcn_fpu(begin, function, line)
diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index 126c2f3a4dd3..2ba49aef370d 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -52,9 +52,9 @@
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #if defined(CONFIG_X86)
-#include <asm/fpu/api.h>
-#define DC_FP_START() kernel_fpu_begin()
-#define DC_FP_END() kernel_fpu_end()
+#include "amdgpu_dm/dc_fpu.h"
+#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
+#define DC_FP_END() dc_fpu_end(__func__, __LINE__)
 #elif defined(CONFIG_PPC64)
 #include <asm/switch_to.h>
 #include <asm/cputable.h>
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
