Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3973C71DF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 16:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB886E0CA;
	Tue, 13 Jul 2021 14:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D86F6E0B7;
 Tue, 13 Jul 2021 14:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSu0A6bQiKvUJaYy1h+trY2er4xbaUp3agpp7MV5RX3Qp8IS7z0Of+ZmvKzfMKUGaEfRe9h7GHjIRYiAuQnksNPfyobkHi8/93tX6hnaklpvfYXewS0UGeWKf+32lMe0KvZXV1IttrM/S6c/0iE4rXOuYrXapF610Bilc/pBrJXfr3ZW8pr1bmT8V59o4khq0WoBR+k9xczw/NywxeNv0Io0v+7jzksV0cnWfrbLJ/7jbEZPiMHHses0il1O3otiKMBKEBZXl8PMGFNyfVYenrSIZuxucgDFnyL408d9xEMqy+B8eSyrCiorOpX832z87HajXsYO5bsBvWPIDtRW4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y90Sy28KNue9RRZet17gSJishsREchQtf6BjvGLh67k=;
 b=K59nfE51X3LN9Mm/OkRY2oemEowYi8pnDKMmWBMWyDpwKJjkvy5oLSh415SaDw+Kg9JYoWzhRxgy7A5ElJ+4lbnYJTCn+AvlEI8jAFQiuORCPdDoXp2c4rkB+BebW/a3V8tYrJL/c7q8d9jVO25Wr0nWoceJow/NR40t3KyTdcaS3/sS3ZKrPUv1j/iRXnTdihRK6c8JeNY8H9Mefp63KyawAp+Wl83Dcg1EhTi9dY6H6owijMjcSsLcpmtcjOiT8cEm1Ywdo/DNfIfopFV3XBdx7z/4o94YQ7LhL7/GDFb3lw2+31ps5S4vByDhKQRyro28HI+tzLn6XN/CtDnlxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y90Sy28KNue9RRZet17gSJishsREchQtf6BjvGLh67k=;
 b=cTbJ0+bJ3WYbjKlYpMHX4/aGDp+E6777ZTteXHVHjALg7nFPzL2WRqBpNa4VVnXwco86yIhj0dxgYHcbzC5Bh/OasXfu7ZOy22Kna2zGdoB77lziIS0Ul4SIHgSukYgvQ+XDSfttK0Ex04g1S4vOPNbSsui15c41IxNoinjCM9Y=
Received: from MW4PR04CA0229.namprd04.prod.outlook.com (2603:10b6:303:87::24)
 by BN6PR1201MB0178.namprd12.prod.outlook.com (2603:10b6:405:55::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 14:06:42 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::37) by MW4PR04CA0229.outlook.office365.com
 (2603:10b6:303:87::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 14:06:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 14:06:42 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 13 Jul
 2021 09:06:40 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>, <christian.koenig@amd.com>,
 "Peter Zijlstra" <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 <roman.li@amd.com>, <anson.jacob@amd.com>, <hersenxs.wu@amd.com>,
 <jerry.zuo@amd.com>, <sunpeng.li@amd.com>, <aric.cyr@amd.com>
Subject: [PATCH v2 3/4] drm/amd/display: Add control mechanism for FPU
 utilization
Date: Tue, 13 Jul 2021 10:06:11 -0400
Message-ID: <20210713140612.2721113-4-Rodrigo.Siqueira@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8638e125-99d9-44bd-c7da-08d946077127
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0178:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0178E6F93871BB650A8D8ACA98149@BN6PR1201MB0178.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ylzlk1Ze4FSupBjMLsP7yNxboJYh8t3eus5jre1Gun61zGRVsuTMB7Pjwb7KIA24ajgeeUuCajxPxvlm01qeGZQ/W5sI9ARTBLzs99qthXRJfkjb73gyBZYx3LFiyt5GHA8QEzMkSUUxL65rgtKwfBn9kEhieF4uX+Q4r2oVcwyEu6jnpGGCiH7V1dFXHFDCfeYecjr/9SFXLAwwijPAFmFO2BMfkqlESRs36hzvYloYSGmLQfWoBeM3ByL3XTBqDI1Bbjjkw8Of5yBBClNch+GoXPq/488KB58v2T/M+vFFxzTPnI/KphZ7hJD772OvXdcrtqYxM2uZafsJkxd4hkoK/6Z+TNeZxLLTdjBwvbqLK6xx6N1jjHtOQGB+EITqKPoplAAZIeEEqg8f+4m2SxT9rJmIK/GAIfk1Hv5zIXkJ+7YLM74p0jEg7PCw+RvRdXjCAtWnSJytynk7Xg0bIeiDo7dnUauy4yTPKot5tUfYwKVh4EshxT1RGvZ5Y81fDZR2zxUp8rYD7UvKKJ7O9brwziKju1lqKmFrOgUWOgqRf2dIAW6T6Sgw42G7SgZySfenyKc24UqT01meSp8HjdT0VKipu1Zt7vRZD+/gkM30eZi0ZpTKBr0rm3Via7kI40C4JA0kdaQgJ5EtQKttaN0KcPv9a/qftaP/9UlnNp8S1ctsa31D3GGAvQ5vRpSTxiU1i1R07c8LQA4wA28UTU6rjdIsk3QGmuMJPLhJ87xYdz80GTIEL3H3ilw8jjQ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(46966006)(6666004)(54906003)(921005)(316002)(83380400001)(356005)(81166007)(6636002)(336012)(110136005)(4326008)(426003)(70586007)(8936002)(2906002)(2616005)(36756003)(86362001)(82740400003)(1076003)(5660300002)(47076005)(16526019)(36860700001)(26005)(478600001)(186003)(82310400003)(70206006)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 14:06:42.5094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8638e125-99d9-44bd-c7da-08d946077127
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0178
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

DC invokes DC_FPU_START/END in multiple parts of the code; this can
create a situation where we invoke this FPU operation in a nested way or
exit too early. For avoiding this situation, this commit adds a
mechanism where dc_fpu_begin/end manages the access to
kernel_fpu_begin/end.

Change since V1:
- Use a better variable names
- Use get_cpu_ptr and put_cpu_ptr to better balance preemption enable
and disable

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 13 ++++---
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 36 ++++++++++++++++---
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |  4 +--
 3 files changed, 42 insertions(+), 11 deletions(-)

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
index d5d156a4517e..73179e9e859a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -28,6 +28,19 @@
 
 #include <asm/fpu/api.h>
 
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
@@ -43,8 +56,16 @@
  */
 void dc_fpu_begin(const char *function_name, const int line)
 {
-	TRACE_DCN_FPU(true, function_name, line);
-	kernel_fpu_begin();
+	int *pcpu;
+
+	pcpu = get_cpu_ptr(&fpu_recursion_depth);
+	*pcpu = this_cpu_inc_return(fpu_recursion_depth);
+
+	if (*pcpu == 1)
+		kernel_fpu_begin();
+
+	TRACE_DCN_FPU(true, function_name, line, *pcpu);
+	put_cpu_ptr(&fpu_recursion_depth);
 }
 
 /**
@@ -59,6 +80,13 @@ void dc_fpu_begin(const char *function_name, const int line)
  */
 void dc_fpu_end(const char *function_name, const int line)
 {
-	TRACE_DCN_FPU(false, function_name, line);
-	kernel_fpu_end();
+	int *pcpu;
+
+	pcpu = get_cpu_ptr(&fpu_recursion_depth);
+	*pcpu = this_cpu_dec_return(fpu_recursion_depth);
+	if (*pcpu <= 0)
+		kernel_fpu_end();
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

