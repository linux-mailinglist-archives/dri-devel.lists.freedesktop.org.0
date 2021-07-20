Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF83CF0F6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 02:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473EC6E20F;
	Tue, 20 Jul 2021 00:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FAF6E15E;
 Tue, 20 Jul 2021 00:49:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jD7AVWcqu3YVDcQetkO+h5cqoyNQcJEhJfXeQonsc6GA2MjimPOTCa6u/4Jdc4D90FPE45vzVyDrwC2a0UYvlfOOU+ZFv3PGnlTLlLnKveBw+qDaNjhE/br7Xl0dB4yhMk9iKTpdNwbb3NDimDM8DhdCgSkUhX3GVaCpSYHBCMoi5ISAWDWI86YAHqFb9KIy+Id2xZtfvCpH67o7AzwphsvUIxaJFAp3SN6vSezcCmrnrzG4YwsFqB50C+2aB9i1t7xcH8tDengD32X223yxKESM+q6sPfONozDMpo3LUJSFpupBmrvw3/dWlBAZMu92BarGvdVrcAvDx5kXuPe92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvrH1WHRK8AgPOcH6JScW4Ks26VP/JFOAcEhmpUgEr8=;
 b=JcgH4lznCVoXqegLAUhaY179plI7dbRtOa4ZXstQs0m0wZ0lbOAKvyOqxq0p6uyjuDaaLoCew+icDubaoODmF0t70R4DoekgS7c6S9rQWlGW+CPfsH7JGqnDnc2B25ppwH14rJyLA6wSnrY47vrkU/RIFEWc8Kc+qIYLxZ43C/BItBkzA4KTw6ydh+bRIPUWvZUUtOLJ7XMla5yFpZaFegOlArQ68sxHYnSE5QkO29OcHk+8KkrHqID99ACmPrSQQmNKeBQuCR3flbbmO2G0nTWXWcFh+2qR9BWQOwCqEOzj09aA8PYHNPfVGdafdyEw/SjQRTUxgNEVRkVvRMqp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvrH1WHRK8AgPOcH6JScW4Ks26VP/JFOAcEhmpUgEr8=;
 b=so6BM1QVJyqhyPt7R/FfT7i24aovd1WWIRSxrCq/EhEHdV5ehgNu1Sxkfx9Yolys4Zp+4NKkIEZS4YvVwXP1OSfSd5JOXhYhPVL0ud1qu6T5kY0hR4ok4B9WIVKtM6sD77eEEX/yqBw2etIFX7KhDPdBR4CIzwbxeuncvcwsWwY=
Received: from BN0PR02CA0002.namprd02.prod.outlook.com (2603:10b6:408:e4::7)
 by BYAPR12MB3576.namprd12.prod.outlook.com (2603:10b6:a03:d8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 00:49:30 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::2f) by BN0PR02CA0002.outlook.office365.com
 (2603:10b6:408:e4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 00:49:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 00:49:30 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 19:49:29 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 <roman.li@amd.com>, <sunpeng.li@amd.com>
Subject: [PATCH v3 2/4] drm/amd/display: Add FPU event trace
Date: Mon, 19 Jul 2021 20:49:12 -0400
Message-ID: <20210720004914.3060879-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
References: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3c9a033-3b20-4b2d-612f-08d94b183baf
X-MS-TrafficTypeDiagnostic: BYAPR12MB3576:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3576FC806C70210C4AA88DD498E29@BYAPR12MB3576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3JMOogzcNUb8NAxXg7qc5DpZFAcxSFpaM0sHwYC7xo6NEthbCiVk0zwSYkkXrbt9p2PKB/YnOyfyf0irvs5UWSK6IRcoAy0NBraheworeA6X4O5ymA6JTz8q/OwPuHmWubZPf3RZaCqkE+bRuGQHn7XqrdZQXDpYJgmFsmo0FluJF98WdyihExdg3Vvgp/i3R16SomyCFjiIoOtlJhDPnLZm4udbYGiWQ7Q5GFSn/9FNtcG1i3mZKyb9mWwjqCQN7RnopCyc2aFGkp8B9vyUuGEK+oa10+gRkZzDqomtzBaPnmeUXt4njlVKAk4o9rzcaB4QUSV43BVN0CxBa/TsxsaPOx/2fpNxrimy1RI5SF1fBBI06zP0wqzc4CTbfmptgexP/TdEax6mfEafLeFG4knB3Mig2R8zHS2BDQpSr81LMxwcMDBgo6F/ExX3QF2RhIySvkopCvwrZqD3i3AdMJEoShMyvsxnatyAZi7v6XacBfdTaf6VbZVHWWbFWzlcwM4rV32e+dL9d92zKscbjN8s/ocNztiDWYuk6QGA3YPCVzinviwmUcVQO+vwGKISx4LSfcbck5itkGh2puRiXzbNxoEvNXAFVSbnzollk0CcbmWdocHHxgInh2wQTF7BgElf9Bi9+6h2cRL1tNNZkwkbh6pWiNAHuNLxreyihQtjqdjJqPL3tIGO9mlAArdTZpFs/b6x6fUVssaMf4zNGDMA1pM3dTHsUpO52tYYDMQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(81166007)(8676002)(6666004)(110136005)(47076005)(86362001)(356005)(8936002)(6636002)(82310400003)(2906002)(336012)(54906003)(70206006)(1076003)(4326008)(70586007)(186003)(36860700001)(36756003)(2616005)(5660300002)(508600001)(426003)(316002)(83380400001)(66574015)(16526019)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 00:49:30.1044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c9a033-3b20-4b2d-612f-08d94b183baf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3576
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, dri-devel@lists.freedesktop.org,
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't have any mechanism for tracing FPU operations inside the
display core, making the debug work a little bit tricky. This commit
introduces a trace mechanism inside our DC_FP_START/END macros for
trying to alleviate this problem.

Changes since V2:
- Make sure that we compile FPU operation only in the context that DCN
  is enabled.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Aric Cyr <aric.cyr@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  4 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 21 ++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 64 +++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    | 33 ++++++++++
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |  3 +
 drivers/gpu/drm/amd/display/dc/os_types.h     |  6 +-
 6 files changed, 128 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 91fb72c96545..718e123a3230 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -27,6 +27,10 @@
 
 AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o
 
+ifdef CONFIG_DRM_AMD_DC_DCN
+AMDGPUDM += dc_fpu.o
+endif
+
 ifneq ($(CONFIG_DRM_AMD_DC),)
 AMDGPUDM += amdgpu_dm_services.o amdgpu_dm_helpers.o amdgpu_dm_pp_smu.o amdgpu_dm_psr.o
 endif
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
index 000000000000..d5d156a4517e
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -0,0 +1,64 @@
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
+ *   (usually __func__)
+ *
+ * @line: A line number where DC_FP_START was invoked for debug purpose
+ *   (usually __LINE__)
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

