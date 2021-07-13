Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4563C71DD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 16:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E2A6E0C8;
	Tue, 13 Jul 2021 14:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907926E0B8;
 Tue, 13 Jul 2021 14:06:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMRR8MK3n2jNphWSskLanwm1OmpErpA5+opdqLtKf5NNBnFJDieJSYdI+0zOchsCpyQAXUIblTRnRxg1NTaBHp9fF85gMlMKKeFBkDXbExqxQVjU6yIqeLZNAjoo6SVgI9nG7WJ8pOGPY2XzZNdNwq4mE17D8cAb28JWKQZzB+W1ZudFYMtsfbOJENLp+c8Ug0rcTgfvbVnR+5kAhhdYugvC58CeX42GWTbcLAv5EbzL53LUBsQ0lwPaO4g20RIF+neYnTrk3Iy9pB+6n7tD35+fO8LesvLhcvbRf86A1xAWnpDsnr8gTX0eD/pf6jaW6ylvf63cd7Es0R7cXs75bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbi4S8cwa/H4eScMt++pVDAuRLIx8pe05MKicru3Jg8=;
 b=QoCYuwMy7VnEkRc+xoQ62HgdfUOG+Vi/Om9wKb0eTNcoCYILnZTwFxqsfLwpxiB9LFZHzEoy8XA+om8380iQnKLAaE1S7h+5seJgZdxifJiIYkwM3j9ymL56PDXKcK31RHl2+bmTC0hxcG5zQhBXcqEyOR5KKGyWHI9UlbduAALyOzD02ffx+rs8ZUlFhrMRf9VbCFLOvP/rZMDOrubkOXX+v4TDwiDScFbNlcg+iJqKm3YjLG+xL57LmjJwvevPBNKxzBijxm+Lmg1lCG9r2kMatLwl0GfFXKNwDdyADyJGlUS5DnqcV5C6EThI/zsxXvb4t0lYczZkC8bVBKiWyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbi4S8cwa/H4eScMt++pVDAuRLIx8pe05MKicru3Jg8=;
 b=4oX5CwDJz8R6aWdrUs74BU+FvBrWPDYLzJMjWgFFlQtuGEr0tpXAEoyR28i7uEkGgLY/rx2UO1hGU1YEYCAzj/5Zc06PKtc5zUohqLEnSp15l5GVJXqBZ/qd72xi4KVxwe+WI7p2JHFiOfSF+3x5Z2oF/Yi0Tdh50ImgOKK58v0=
Received: from MW4PR04CA0214.namprd04.prod.outlook.com (2603:10b6:303:87::9)
 by DM5PR12MB2518.namprd12.prod.outlook.com (2603:10b6:4:b0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Tue, 13 Jul
 2021 14:06:43 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::e4) by MW4PR04CA0214.outlook.office365.com
 (2603:10b6:303:87::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 14:06:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 14:06:43 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 13 Jul
 2021 09:06:41 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>, <christian.koenig@amd.com>,
 "Peter Zijlstra" <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 <roman.li@amd.com>, <anson.jacob@amd.com>, <hersenxs.wu@amd.com>,
 <jerry.zuo@amd.com>, <sunpeng.li@amd.com>, <aric.cyr@amd.com>
Subject: [PATCH v2 4/4] drm/amd/display: Add DC_FP helper to check FPU state
Date: Tue, 13 Jul 2021 10:06:12 -0400
Message-ID: <20210713140612.2721113-5-Rodrigo.Siqueira@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 32db5d9f-66f9-43d2-1259-08d94607719b
X-MS-TrafficTypeDiagnostic: DM5PR12MB2518:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2518586FFE6A3795F0FCDC7B98149@DM5PR12MB2518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aoiLY+ej7BbixalEB6KGU8OCkRMu3qGUzHyMEmJBs7K8xC0C1EfZOWSzYMA9YMJh2Z+eegLWzpmS2rckDCnuY0bgfqr0bsIjjoiMYFaZkr+vixzqdBRGPQzGhO/g9s1BwRJ5SPDWRCfyCff9gE2Fac20/YN/vJNK1ZO5oPgSI4Pe3cnl0LCNqNrdewFtMQXF8taC7iP60tSx9SUtT87MpXrDqvd49vEbAHXhElGQL5kP7uvlpWo79Gf27fcxFAMEY8n5wLxI7vHugBmXZSHJzRXBmQvDNtLubP8gx3OufGIRbeF9C8swv5096A1gp0IdKCrymsI8WqhTHXCwVMl4LK1B0nsoJqYmIrGmqF0o5M93YQXz6vSHNvIvWhuxa+vKa6plRXLFTTXecyDRMjI3BKtb+gg1Gy5kejUKlbJgbs5ptb92kOZfZTs27/6bvUNm2w2MzGvTc7Bzk2vxlHVdRMwMu0YF5nGXyBav7uvYddKFVKQzvikKYuojNn32dUAMrlMzz1lzPrhpqnxiAR6ZE3HVeS7V8YmuFho2BjdUK323eWRhLmgRIrXd8cgwDhsJze/qUSqsoQEzYo7owSd0itHj8DyJNw9B2KvYdJ61AvIogVc+d1hIw7dzZOb4uGo65t+CfGz8a7ud29SpGNEJXXcCXL6mnpAtK8m5+ZmN5evGG3gdiTYdnsaDZqrYEErSRKudDhn8c9fnkCNvHdZP45wafHs5D6ofO3+kaZREDpZnAOiHsqBLIeQwlzG2keLJ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966006)(36840700001)(426003)(8936002)(2616005)(70586007)(1076003)(8676002)(54906003)(2906002)(4326008)(316002)(6666004)(70206006)(336012)(5660300002)(110136005)(82740400003)(6636002)(478600001)(82310400003)(83380400001)(36756003)(16526019)(186003)(356005)(26005)(81166007)(47076005)(86362001)(36860700001)(921005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 14:06:43.2650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32db5d9f-66f9-43d2-1259-08d94607719b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2518
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

To fully isolate FPU operations in a single place, we must avoid
situations where compilers spill FP values to registers due to FP enable
in a specific C file. Note that even if we isolate all FPU functions in
a single file and call its interface from other files, the compiler
might enable the use of FPU before we call DC_FP_START. Nevertheless, it
is the programmer's responsibility to invoke DC_FP_START/END in the
correct place. To highlight situations where developers forgot to use
the FP protection before calling the DC FPU interface functions, we
introduce a helper that checks if the function is invoked under FP
protection. If not, it will trigger a kernel warning.

Changes since V1:
- Remove fp_enable variables
- Rename dc_is_fp_enabled to dc_assert_fp_enabled
- Replace wrong variable type

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 22 +++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  1 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  2 ++
 .../drm/amd/display/dc/fpu_operations/dcn2x.c | 17 ++++++++++++++
 4 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 73179e9e859a..74153a2816f9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -41,6 +41,28 @@
 
 static DEFINE_PER_CPU(int, fpu_recursion_depth);
 
+/**
+ * dc_assert_fp_enabled - Check if FPU protection is enabled
+ *
+ * This function tells if the code is already under FPU protection or not. A
+ * function that works as an API for a set of FPU operations can use this
+ * function for checking if the caller invoked it after DC_FP_START(). For
+ * example, take a look at dcn2x.c file.
+ *
+ * Return:
+ * Return true if we already enabled FPU protection, otherwise return false.
+ */
+inline bool dc_assert_fp_enabled(void)
+{
+	int *pcpu, depth = 0;
+
+	pcpu = get_cpu_ptr(&fpu_recursion_depth);
+	depth = this_cpu_read(fpu_recursion_depth);
+	put_cpu_ptr(&fpu_recursion_depth);
+
+	return depth > 1;
+}
+
 /**
  * dc_fpu_begin - Enables FPU protection
  * @function_name: A string containing the function name for debug purposes
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
index fb54983c5c60..97941794b77c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
@@ -27,6 +27,7 @@
 #ifndef __DC_FPU_H__
 #define __DC_FPU_H__
 
+bool dc_assert_fp_enabled(void);
 void dc_fpu_begin(const char *function_name, const int line);
 void dc_fpu_end(const char *function_name, const int line);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index f99b09643a52..d0b34c7f99dc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2355,7 +2355,9 @@ int dcn20_populate_dml_pipes_from_context(
 	}
 
 	/* populate writeback information */
+	DC_FP_START();
 	dc->res_pool->funcs->populate_dml_writeback_from_context(dc, res_ctx, pipes);
+	DC_FP_END();
 
 	return pipe_cnt;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
index c815d6c01d64..d8183da0c2b0 100644
--- a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
@@ -41,6 +41,22 @@
  *    that deals with FP register is contained within this call.
  * 3. All function that needs to be accessed outside this file requires a
  *    public interface that not uses any FPU reference.
+ * 4. Developers should not use DC_FP_START/END in this file, but they need to
+ *    ensure that the caller invokes it before access any function available in
+ *    this file. For this reason, public API in this file must invoke
+ *    ASSERT(dc_assert_fp_enabled());
+ *
+ * Let's expand a little bit more the idea in the code pattern number for. To
+ * fully isolate FPU operations in a single place, we must avoid situations
+ * where compilers spill FP values to registers due to FP enable in a specific
+ * C file. Note that even if we isolate all FPU functions in a single file and
+ * call its interface from other files, the compiler might enable the use of
+ * FPU before we call DC_FP_START. Nevertheless, it is the programmer's
+ * responsibility to invoke DC_FP_START/END in the correct place. To highlight
+ * situations where developers forgot to use the FP protection before calling
+ * the DC FPU interface functions, we introduce a helper that checks if the
+ * function is invoked under FP protection. If not, it will trigger a kernel
+ * warning.
  */
 
 static noinline void _dcn20_populate_dml_writeback_from_context(struct dc *dc,
@@ -83,5 +99,6 @@ static noinline void _dcn20_populate_dml_writeback_from_context(struct dc *dc,
 void dcn20_populate_dml_writeback_from_context(struct dc *dc,
 	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
 {
+	ASSERT(dc_assert_fp_enabled());
 	_dcn20_populate_dml_writeback_from_context(dc, res_ctx, pipes);
 }
-- 
2.25.1

