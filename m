Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD273CF0F0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 02:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6056E0A0;
	Tue, 20 Jul 2021 00:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD76C6E0A0;
 Tue, 20 Jul 2021 00:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDojE8eog/1Yptlk6nqWS2lNOQEDDsWhm8OxkZ+Z4cfdoICKXolHsNHYO9rQ7kJgf+YoduN6aIpShD3WsQDdN57PqdbK3r2aNT4L/DTji9XzqXNGa58pdl5qGE4TyLv796HDQNoF1eKIluY1X9LIyONeNYA4W5O07KCRCLCS6OUfvhX/l6dzBdgQCdCc/u64E7IGqWvIqBl8Ev8TIBxcw/QI9QLneBdyPqievInz5E/2vhdMkMjFIiaE9/9L/Yw7RAkDV/sd1TzArBdV7NqVXQeuFW/7HehkZnTkuuGXKZWWYxX3oakN/r38B9lDhEhLQk1/lYJIYosPd9PU35AQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbxQexAp6s8BslCHoQO0OW5MGb+pSV0h8hcm1x7opNk=;
 b=LQYz+5WjezCuKcSdam1d1ujH9l98aG8fs/gDCCLekxtWjum+hSX7E58CU8OLrF7VbKd0IEvdA/RiGiLWdepbKmBJ6GMO+34ZsJO0z6VryQTOjQf+RFhq2Wx1LRI1KBIDo+nfG9la4YW93VK9yFUpk+VVqBwUVQwzSSdIUuPYi8bJxXIItRDB4fKc1vcmf4a8eHpHdI8BtCi3dfBFX4XK2i8RRyV9TP5d+TjSGlOD/nBFIGh67r89bS+cQkhjETUr7cVyaAYr+1HpxfWfhGsAkNW/5txCZipdr3tuqttEvReR4G0BexlSdi5J/LL7aZ4BxQoZYs5xOHbKonb1QvFTsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbxQexAp6s8BslCHoQO0OW5MGb+pSV0h8hcm1x7opNk=;
 b=NzXrtorAs2x+QfG4DjP/fklxivNslAElp8o/0Qw9t8rDW2V/Md/mveRIBBZEudF795eOyL9v/GFFJ4To2tofY+wKUroc2gdVAGl2zwW3U6wXrph9Tr4ZLcxww6t5Rc6w5BbruKdv5P8/caPtyQY5CoGFXKIxIC7pjS6rF40tbMw=
Received: from BN0PR02CA0025.namprd02.prod.outlook.com (2603:10b6:408:e4::30)
 by MW2PR12MB2588.namprd12.prod.outlook.com (2603:10b6:907:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.31; Tue, 20 Jul
 2021 00:49:31 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::9f) by BN0PR02CA0025.outlook.office365.com
 (2603:10b6:408:e4::30) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH v3 3/4] drm/amd/display: Add control mechanism for FPU
 utilization
Date: Mon, 19 Jul 2021 20:49:13 -0400
Message-ID: <20210720004914.3060879-4-Rodrigo.Siqueira@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9f735936-2d5a-4309-214d-08d94b183c1a
X-MS-TrafficTypeDiagnostic: MW2PR12MB2588:
X-Microsoft-Antispam-PRVS: <MW2PR12MB25882EE378F60FADEB3CAB6798E29@MW2PR12MB2588.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ftzw7Fh7z4BNYpcVJe4cZEGMvxeKwKz8xUSMnSubmwoKcOrtWpcAUGH/kwbrS2JBb5aYemba8eOjt/SI7t20haSw2y/Lgx8g0NlRzTG5ODGa2+9cnU4TugR1FS9WCTG5Ge/we4NEtYpYv+ieuc8JpoGomyH7aAhPc3leD1ccyngZFAHe6qUpxIzm8cdEM8sf1cIs3idCi6MBqK/1ZAD5RN/kJd61UXD357abkviFkNI0oV3qlvHIDbC32ij8Hk7NX7OgZhCFwW7jeiGxUHvBUZtbQ54jvkc3c8EWTgrcWumSMPqml8R73d7p8tYUJ89pth64fKVFAXaVsv2HNylUP/xIONJd3gHl8RDw66E+axohf+Nwf+hDhGZ3S+8R9Zcky8LvYRQ4EKsnX5jvzeps5Grnd8syV3PVrTi0oyFQtX7eTMinuvG9Ld2t4YH106cMlDdy48yJfulFieG1npSkrTbN2c1qutPslzD9GZDbshTGyu3KxRsYPnlW4AElyrpt5QbAmB2Gak5N+SoQGszJKb0z155WB5yW8qL1QqdTvVkXGzyKilkVyGLdLKVMTwjBdJ3hV0rMKCuRIcstfw+nOj1HrE1YAX1pZ6zksX68FFNQnK9koxbb5CjE9EWRi/MR5Jn/YsZlbfze4OXXow+d2FrilPyplq1bCBDtFbUy84HqNqXD3wbCW0ixyUT/j6vsiYx7wz23AsVPcZIo085be844hmFYD26IKmIaQt8x2sU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(36840700001)(46966006)(47076005)(316002)(26005)(356005)(8676002)(336012)(8936002)(6636002)(86362001)(66574015)(54906003)(2616005)(36756003)(83380400001)(81166007)(82740400003)(82310400003)(2906002)(5660300002)(70206006)(36860700001)(4326008)(478600001)(186003)(426003)(1076003)(110136005)(6666004)(70586007)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 00:49:30.8549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f735936-2d5a-4309-214d-08d94b183c1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2588
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

DC invokes DC_FPU_START/END in multiple parts of the code; this can
create a situation where we invoke this FPU operation in a nested way or
exit too early. For avoiding this situation, this commit adds a
mechanism where dc_fpu_begin/end manages the access to
kernel_fpu_begin/end.

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
index d5d156a4517e..d0d3e8a34db5 100644
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
+	*pcpu += 1;
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
+	*pcpu -= 1;
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

