Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90E03C71D9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 16:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF766E0A2;
	Tue, 13 Jul 2021 14:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EAD6E0B6;
 Tue, 13 Jul 2021 14:06:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDd2SYFmVwDWc+VzbLY6KBAOWZVGVJzSgoodM+eljpecL49zG+G0N2nJr4ngCcBmYEZrHCiukofyHyCXtawFgGRAA9MxwyRGg1D859O1GNatHKJTrHh58Fi0TEa9/mJpzpCmjPTFb0vBDT9sWVq/zIz6MBgvI4KS4TPdoMCu377Uu/mqyn6F4bblXEBnzX27j6pz6EII6LagiC30xhBDX9CYKkK/xthTeIlI1f+qJf57Un7maneYQ7bPNnuw4XdE45211aMbxe6Xmr9laZwKp8uXm44pk/LaMDh7BqPWHyfdP6O62W83hn2G38AqLDCU+gngkO74CRt7ytD7KkG3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXQxw3CSjRKNMHagZU+grKOqKyMmvZmURNSmCjQqdEM=;
 b=JV9l3uOQVEHkDwegOq07bIvjoTVYAkrz62vTm5oGRj/yMk+tgqsRSL7UdlgcJSX2YnAB2D3iLjPFLGIvpMMBM7S/SbXYt+ymKXPvkhLassUHdAIjqv3d9VIIWuGe/TKxXeDqfc1kgYzTeCMxynaF4O1E6MutgPBrL2S6RUDc8NRyUWOGmi8d7Trxnd9yilQsOHJM4UIN7mct9qLZdBPNcGFaQqwOp0pF05az93cIq3j9oOZOcAHuGhkeDEfS8kuazb3LWpXF8A8L7ENrERFNh7kaTX1dHll4eFBLSaZZ+1vATeZLYcVG/3lvUr6sc2P4yv3LQ/uggpD3fDyhwP2XPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXQxw3CSjRKNMHagZU+grKOqKyMmvZmURNSmCjQqdEM=;
 b=R6KtA9B90W8Wfy5Fvg1Ww+yKGisLgbuNRtVMtJ9mtc2KatuX40wORG69nRvc6Y5THdHquczYF/PlsBoEMM/JBsLg830SCnamlNtqsapYvcbp/lt5NdgvSxPALlwCepGkrRwWvFsgbXBRNsoFPuLSRO3BAvdU6Rve/kq5JWWPHEw=
Received: from MW4PR04CA0227.namprd04.prod.outlook.com (2603:10b6:303:87::22)
 by MN2PR12MB3085.namprd12.prod.outlook.com (2603:10b6:208:c5::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 14:06:42 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::2d) by MW4PR04CA0227.outlook.office365.com
 (2603:10b6:303:87::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 13 Jul 2021 14:06:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 14:06:41 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 13 Jul
 2021 09:06:39 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>, <christian.koenig@amd.com>,
 "Peter Zijlstra" <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 <roman.li@amd.com>, <anson.jacob@amd.com>, <hersenxs.wu@amd.com>,
 <jerry.zuo@amd.com>, <sunpeng.li@amd.com>, <aric.cyr@amd.com>
Subject: [PATCH v2 2/4] drm/amd/display: Add FPU event trace
Date: Tue, 13 Jul 2021 10:06:10 -0400
Message-ID: <20210713140612.2721113-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713140612.2721113-1-Rodrigo.Siqueira@amd.com>
References: <20210713140612.2721113-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13e8e9e1-dc4d-4589-7984-08d9460770ad
X-MS-TrafficTypeDiagnostic: MN2PR12MB3085:
X-Microsoft-Antispam-PRVS: <MN2PR12MB30857E7AA02EC03AF1CF0B9F98149@MN2PR12MB3085.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:264;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQMeVQOVrK1ufFwJUTHJ0hcNt+S2R7nB4tC40DIuDcYfu7H/lAeVBy56Ci8PF63vg36S2YEjlJ4fQXGmbD724hLPWnMjbXY2Xw2Rp5nm117etqQ0PvrU681A3Tq7JnOYaPzySLVQIsO3F4avyuuyBc2pnz51v+BZzFhvMl3sGeTDUoFj/vF54SX2SvT8axaPhuFLsyRL6ifdog6BGeKjzYfn/lim8yzhnS1ejdzvwau5Gi07152FZgAEPO+gWGH4b+/9Tw4FtfQYBCutCfUSFz4i1Ja1hy8q7/6NWOyaRd32Pi5ZLDbhJhN7r/785C+CfFYb5wW1YNWjDXEW8+YSq81EtkxW6Ws0ufk2+sbbP0uBvibjEUhRLZTDEls3T6r9vYZO8bO91nO17cSKJ0HFK03gAXmGDGK1gExbbEdzdfsya7KR5OrFB8bK+Z+sbSNzm6/oYZm1lfIQIJTmhP1IjDSrxQoCdfggh9JtVvRbbwVpcsIq0JSZnPVZXhna+0ZnFtivBMTlWAEHHdOrIsLD8b9VmWkX4io0chmcW5Uf+Zf9wo08Cgu7F4zxA0m9ajEkBj35sZD5y9n/MppmBaymkuQmFlMe1BDuyrbp1PFjrSYG7XGP+ctUvLxMxITVUv51qypO7DAMeRE+hJmhi6qz6ymxrAru+iksrOWyD62x0wbFgLclXN4j4ChD/Yh1xhXhHdl0OCnAIAOk5BZzgGoBEEURt033fayJHoiJumOuGJGwaB/5KmkeGeMw/ncztvOb
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966006)(36840700001)(82310400003)(5660300002)(16526019)(356005)(186003)(478600001)(83380400001)(82740400003)(8936002)(316002)(2906002)(8676002)(4326008)(36756003)(1076003)(70586007)(86362001)(70206006)(26005)(54906003)(47076005)(426003)(36860700001)(6666004)(110136005)(2616005)(921005)(81166007)(6636002)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 14:06:41.7079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e8e9e1-dc4d-4589-7984-08d9460770ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3085
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't have any mechanism for tracing FPU operations inside the
display core, making the debug work a little bit tricky. This commit
introduces a trace mechanism inside our DC_FP_START/END macros for
trying to alleviate this problem.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 21 ++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 64 +++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    | 33 ++++++++++
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |  3 +
 drivers/gpu/drm/amd/display/dc/os_types.h     |  6 +-
 6 files changed, 126 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 91fb72c96545..5f7fd4474379 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -25,7 +25,8 @@
 
 
 
-AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o
+AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o \
+	dc_fpu.o
 
 ifneq ($(CONFIG_DRM_AMD_DC),)
 AMDGPUDM += amdgpu_dm_services.o amdgpu_dm_helpers.o amdgpu_dm_pp_smu.o amdgpu_dm_psr.o
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

