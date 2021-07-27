Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ADB3D6B51
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A1772E7F;
	Tue, 27 Jul 2021 00:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BB96EB88;
 Tue, 27 Jul 2021 00:53:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsVtlXpy357UfO3a2gZbW1FXRG3mI0a7tQP6xw5Rv+MQ1jrjFLfvSxDMJOt83aM4/ycyFPN0dqQJ4lJbp1Xp39XVhU7Tc89HthmLl46ehFBmc/pe6jRiYK1abxrpTEsJP0RI79teUdhgb1UtbsS8DZVk7OkLu5zAOcyL5TVEWv+zIRZT+AWX9414vvkQ+6bmiG9/xqdGLRb0cHwodz2wRf+GNfCnS6I/fdQfS6gx3gSMTEcCdHoAKlANgf9vjbpi0MOno1cMzrkqlLtsQP1RuyE5ISZcHCO65kCmPkKGMpXxfRgQBAhwXDLfDgyEAGmeJhjI0x2JMDbFAaHcC0fNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lk4egyIKcjvBaFY4mvCuAqi0rpWDBk9OAvkyznT7x0I=;
 b=I1aMWXSU0akvcualrMz312g1r27GmSR591km01NDsR5GUtpKipptlyPXmYyJVnwdKJkYby8eAiSiQat2xCbIT3ELUrDLrXvIPylZwS+2RHqDQPSXngZ5EKOHeGzyQjJEfOlmjwnM3AqLxpek1mTYoSPuFn+geMX37hk5gtK24mZSe5SLm/z1UkYDhC9E66ZRTTQNsn6+T0TF6gW9UqTta8b3CuqyKmeU01VwhkDRwylbWerzA89dcSU5z2tIMVTSVWi8yTETTXN8j0d1cMGAwZPt8pGCFCzAbjTT9djgHXb2CAr+y+QQVcc4fkXvhFDqWrDmB2UVvF25PieFjn3bew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lk4egyIKcjvBaFY4mvCuAqi0rpWDBk9OAvkyznT7x0I=;
 b=g6LEohQmImPnXhPR5wfaW5SE8Khz8SICMAsgWjlZrYJL4aGd8nmNICEGA8HgOD9WHfG4tBIvyFjntnsW0WTdiRwpojRHjlUbYJ8/sFGuLfKuq9PJ6Xn2zHLX6hjHERF0mYRpIJkOv1LwR6X0hKLC3f/MVp9ct+ZLUo7qpy+6u2I=
Received: from DM5PR07CA0153.namprd07.prod.outlook.com (2603:10b6:3:ee::19) by
 DM6PR12MB2971.namprd12.prod.outlook.com (2603:10b6:5:118::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.29; Tue, 27 Jul 2021 00:53:07 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::6c) by DM5PR07CA0153.outlook.office365.com
 (2603:10b6:3:ee::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Tue, 27 Jul 2021 00:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 00:53:06 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 26 Jul
 2021 19:53:05 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <sunpeng.li@amd.com>, <roman.li@amd.com>
Subject: [PATCH v4 3/4] drm/amd/display: Add control mechanism for FPU
 utilization
Date: Mon, 26 Jul 2021 20:52:47 -0400
Message-ID: <20210727005248.1827411-4-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
References: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0a7c56d-d0be-45f5-eec7-08d95098e5ca
X-MS-TrafficTypeDiagnostic: DM6PR12MB2971:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2971D7F3FAA6C805E985781F98E99@DM6PR12MB2971.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WzhmdymUq5xytOhnIFWalqM6yr5+FhrtSjxWJIuv/Ipg00AwUGV6xcYkwnICEoBhbGZ4brLZSNwsrhOv1alR/bLhxEi0zRzKZUVNCtn2MJUeGSipGFldGIoiZrL/G7F17in5xN/2TYh/4YJHPDKELqDW47uGPBhkhaH4QqCHbnsLFSGPzmEbZb+dCcVliR9VNKY3FtqYahI4Pg/b/DtlitDln/okMIuyRU3KlJmnuGzHlWh2bHnwpqs/VJ8a8cmkDOU8FUMUqOliQ9clzVokOyziEOLfqvJv2oMXMwr5gJtvPZXhFAihFwAT1oNOq56JWlXOrRQk/LwbC+avfmUG51+EYbXT/JbL7HvZpHGzF4oioEJhgUmEx3Sl4prxu+3+rTy3Rhl1Bc9uRt5YlVDEk4MmuAY/LNrniY/WticMxyqozk3gu5hVbvcm15hmk3YX+9d6fNg/TZZOcaxp7VmbLVSevEVRKO2bzlT1Pr5rCyBnyvsH+zVlyIr50pUH7TLwX092G2Ndz/ouhuzPiNbRm8/5BiPC8aB+v6Qc2mcgZ14D4mRW6tMEraEKiRj6Wxs7nX2ygxr2hYygtYmiq3dVtseN0k0DpQMb1J06fVwRBBRnGyAfqq47nmRYa29dSqkUXFnaifI3Rn+C37ZqaGe3RUTsMOC+SpO7s/68kSHddYWpzgAarV291VYC/6TEL4IDTriS6pKjuAFDV2aDb/5fHUWHv9P/TXv+KjMRYhcJad8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(36840700001)(2906002)(16526019)(356005)(47076005)(81166007)(186003)(1076003)(336012)(2616005)(5660300002)(8936002)(66574015)(8676002)(426003)(36860700001)(6666004)(82310400003)(26005)(4326008)(110136005)(70586007)(82740400003)(86362001)(83380400001)(54906003)(316002)(36756003)(478600001)(70206006)(6636002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 00:53:06.9189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a7c56d-d0be-45f5-eec7-08d95098e5ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2971
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
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jun Lei <jun.lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DC invokes DC_FPU_START/END in multiple parts of the code; this can
create a situation where we invoke this FPU operation in a nested way or
exit too early. For avoiding this situation, this commit adds a
mechanism where dc_fpu_begin/end manages the access to
kernel_fpu_begin/end.

Change since V3:
- Rebase

Change since V2:
- Christian: Do not use this_cpu_* between get/put_cpu_ptr().

Change since V1:
- Use a better variable names
- Use get_cpu_ptr and put_cpu_ptr to better balance preemption enable
and disable

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Aric Cyr <aric.cyr@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 13 ++--
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 77 +++++++++++++------
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |  4 +-
 3 files changed, 63 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index 230bb12c405e..fdcaea22b456 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -638,23 +638,26 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
 );
 
 TRACE_EVENT(dcn_fpu,
-	    TP_PROTO(bool begin, const char *function, const int line),
-	    TP_ARGS(begin, function, line),
+	    TP_PROTO(bool begin, const char *function, const int line, const int recursion_depth),
+	    TP_ARGS(begin, function, line, recursion_depth),
 
 	    TP_STRUCT__entry(
 			     __field(bool, begin)
 			     __field(const char *, function)
 			     __field(int, line)
+			     __field(int, recursion_depth)
 	    ),
 	    TP_fast_assign(
 			   __entry->begin = begin;
 			   __entry->function = function;
 			   __entry->line = line;
+			   __entry->recursion_depth = recursion_depth;
 	    ),
-	    TP_printk("%s()+%d: %s",
+	    TP_printk("%s: recursion_depth: %d: %s()+%d:",
+		      __entry->begin ? "begin" : "end",
+		      __entry->recursion_depth,
 		      __entry->function,
-		      __entry->line,
-		      __entry->begin ? "begin" : "end"
+		      __entry->line
 	    )
 );
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index d4ab27bf8d04..33807d746e76 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -33,6 +33,19 @@
 #include <asm/cputable.h>
 #endif
 
+/**
+ * DOC: DC FPU manipulation overview
+ *
+ * DC core uses FPU operations in multiple parts of the code, which requires a
+ * more specialized way to manage these areas' entrance. To fulfill this
+ * requirement, we created some wrapper functions that encapsulate
+ * kernel_fpu_begin/end to better fit our need in the display component. In
+ * summary, in this file, you can find functions related to FPU operation
+ * management.
+ */
+
+static DEFINE_PER_CPU(int, fpu_recursion_depth);
+
 /**
  * dc_fpu_begin - Enables FPU protection
  * @function_name: A string containing the function name for debug purposes
@@ -48,22 +61,30 @@
  */
 void dc_fpu_begin(const char *function_name, const int line)
 {
-	TRACE_DCN_FPU(true, function_name, line);
+	int *pcpu;
+
+	pcpu = get_cpu_ptr(&fpu_recursion_depth);
+	*pcpu += 1;
 
+	if (*pcpu == 1) {
 #if defined(CONFIG_X86)
-	kernel_fpu_begin();
+		kernel_fpu_begin();
 #elif defined(CONFIG_PPC64)
-	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
-		preempt_disable();
-		enable_kernel_vsx();
-	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
-		preempt_disable();
-		enable_kernel_altivec();
-	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
-		preempt_disable();
-		enable_kernel_fp();
-	}
+		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
+			preempt_disable();
+			enable_kernel_vsx();
+		} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
+			preempt_disable();
+			enable_kernel_altivec();
+		} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
+			preempt_disable();
+			enable_kernel_fp();
+		}
 #endif
+	}
+
+	TRACE_DCN_FPU(true, function_name, line, *pcpu);
+	put_cpu_ptr(&fpu_recursion_depth);
 }
 
 /**
@@ -78,19 +99,27 @@ void dc_fpu_begin(const char *function_name, const int line)
  */
 void dc_fpu_end(const char *function_name, const int line)
 {
-	TRACE_DCN_FPU(false, function_name, line);
+	int *pcpu;
+
+	pcpu = get_cpu_ptr(&fpu_recursion_depth);
+	*pcpu -= 1;
+	if (*pcpu <= 0) {
 #if defined(CONFIG_X86)
-	kernel_fpu_end();
+		kernel_fpu_end();
 #elif defined(CONFIG_PPC64)
-	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
-		disable_kernel_vsx();
-		preempt_enable();
-	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
-		disable_kernel_altivec();
-		preempt_enable();
-	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
-		disable_kernel_fp();
-		preempt_enable();
-	}
+		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
+			disable_kernel_vsx();
+			preempt_enable();
+		} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
+			disable_kernel_altivec();
+			preempt_enable();
+		} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
+			disable_kernel_fp();
+			preempt_enable();
+		}
 #endif
+	}
+
+	TRACE_DCN_FPU(false, function_name, line, *pcpu);
+	put_cpu_ptr(&fpu_recursion_depth);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc_trace.h b/drivers/gpu/drm/amd/display/dc/dc_trace.h
index d598ba697e45..c711797e5c9e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_trace.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_trace.h
@@ -38,5 +38,5 @@
 #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
 	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
 
-#define TRACE_DCN_FPU(begin, function, line) \
-	trace_dcn_fpu(begin, function, line)
+#define TRACE_DCN_FPU(begin, function, line, ref_count) \
+	trace_dcn_fpu(begin, function, line, ref_count)
-- 
2.25.1

