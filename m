Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B986CAD7D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC2510E6D7;
	Mon, 27 Mar 2023 18:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AF710E6BD;
 Mon, 27 Mar 2023 18:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ewf9ToY94qUGWpKYuDK2w7asZhya7wWGggiqIAht5c1rdadt9lWA4aCacDt8rgMuL1InPS0nnDAtUKymC490sOWswnP82l/ceq6RKZKeCna8X0a9fijWSGXMlrrFUtuhNj/TmrRWsKW0hWuEiQQ8vUtVJOhgQb0Ch1CZKoEeYuHAZ/K/UiXR5erlr0JcfC4by0cJhVD9udrEzO6s6vpFCDnRcFG4oSPro79WfBr5S5bgA1GQRne5B5Em7FJneslt8hzZprO3Ko9DGJJNonKMiCxwuaUgYsk3vdgLrjQ8rBMbXNuQC2KYJ3OmkqAy+aSyI3o/UNnOeHq8xQVtStmweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fkzc/gdt20JMUJbgmt9wakkTuEp30ffWJd5U5ofa26o=;
 b=jGYixywqH8rp39LfCGG3iw4ykhJCWkfIE4GJxG9x6B8kD7m1wn31/sVR/noOKIhOp4rnv6zU/kQ4b6KUGRyqBPwEqD6qMB8/VkvXBQ07MlyyBK7/orXS/4WxN9M1sG3dvtrPU5g50pZZeZbIbe1AuMM4QvEf/ehMDHo9Qer3JWnbJHm17iezF7w7cuu2o+oYAnw9Lupy6fUtbA2Z8vDGCg2nKvRfDsusPdArecrP3msdOWDa0b4zL/D6xf33tpc3//q3G3pJxLWGvf7kyFIWOVslegiCf7s34OuDF9IA3PloHwT13xPEFUM75bnMXCbl+9T/AMyL0VEc/Cd2XWmD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fkzc/gdt20JMUJbgmt9wakkTuEp30ffWJd5U5ofa26o=;
 b=m6dbsd3HsJ3NCvhfFzc7bkoTdLcsYSIrj2fGANq7VTddw9mHDW+RRuKaM3sQWheZCS+P3LTQgbGP85rDEC5a9h2I04wWVWr7OsWxhHkwddOXG0eKxq692XCEHFxj/ctKB5GwFiF4OwhbWuWythxgunivsddvEPhyjhvxdGXMjkQ=
Received: from CY8PR02CA0006.namprd02.prod.outlook.com (2603:10b6:930:4d::11)
 by CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Mon, 27 Mar
 2023 18:43:54 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::71) by CY8PR02CA0006.outlook.office365.com
 (2603:10b6:930:4d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:54 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:51 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/34] drm/amdgpu: add gfx9.4.2 hw debug mode enable and
 disable calls
Date: Mon, 27 Mar 2023 14:43:15 -0400
Message-ID: <20230327184339.125016-10-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327184339.125016-1-jonathan.kim@amd.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 8afcc370-0e47-45e2-932f-08db2ef3374b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pN9uC4jyB+Z0Z2keD+sYzA8w/qW7liEp5MHhFZhExi2vZ1h829ZSmPPHr31mY1Zyh+Sr4Zv5ayVmioNs6AShbnk89Bg2WW9IPDiXRhFoCb3G8ik/XiWBToxWjgv5BEgK+OdyTdP9xbeLb/5ZzSkT2qDHXpW7RZ35K+uCMPCBaqxe9s/+ojGlPm9ohIdvF6uG+gVCAZuD4C4jMaw9JvAY+ddtXvM9vu1ep4r6E15Q2Eqr6mxRkKW9D8+DXKbo0GZCviwXC0co8ucc021upPAmUzI9F/MPJ8t70xw8UKKxS+cT/sqfhhQ1RJR5Qa4YJXEDcHuJvruPWPNAyke+PN7HQGrmUh1+BVCtr6UzITzzg4/rI2vjs1iDyu+MneO1+cz0v1FAzrr4TnwtQRvtSkmAb1dwfvYdP5FY8YB7xtRnBVeI6Gidex9WB5suLUTCR0w0Qd19CcPirgK1yeWQTmVZEk09KHPNvlUbpxm0BzYCefTGMGFq+3NdyT6OVebW6yWGaZBVcuRu4X8uq3sXXnjZEI0eqOBZuXjKo4pl3TWZO04pOukJ6najFv7PCv6bXR0XUumdzjxUEZt24yHcKTHGptZzauaDlr4yrilyAoSBappuayX3UIr9wBSZz8Tkdp86UbAdYdwAwG3vsGceZXNUrMle7JBqbrn4D8aZPxTg94/J8M9xwvZIeaGdrVg1gxQ2+k2twgWWbmE3ZPDD9F9Va7z0ihaC6Huq6I5EtRcXXTw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(7696005)(450100002)(70586007)(40480700001)(86362001)(110136005)(8936002)(44832011)(54906003)(8676002)(6666004)(82740400003)(40460700003)(2906002)(316002)(36756003)(478600001)(26005)(2616005)(5660300002)(4326008)(82310400005)(81166007)(41300700001)(186003)(356005)(36860700001)(16526019)(47076005)(70206006)(1076003)(336012)(426003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:54.1593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afcc370-0e47-45e2-932f-08db2ef3374b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177
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
Cc: Felix.Kuehling@amd.com, Jonathan.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GFX9.4.2 now supports per-VMID debug mode controls registers
(SPI_GDBG_PER_VMID_CNTL).

Because the KFD lets the HWS handle PASID-VMID mapping, the KFD will
forward all debug mode setting register writes to the HWS scheduler
using a new MAP_PROCESS API, so instead of writing to registers, return
the required register values that the HWS needs to write on debug enable
and disable.

v3: fix typo and comment format kern bot complaint.
add back cu occupancy that was removed by mistake.

v2: add commentary on unused restore_dbg_registers for debug enable.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
index 4485bb29bec9..a6f98141c29c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
@@ -23,6 +23,44 @@
 #include "amdgpu_amdkfd.h"
 #include "amdgpu_amdkfd_arcturus.h"
 #include "amdgpu_amdkfd_gfx_v9.h"
+#include "gc/gc_9_4_2_offset.h"
+#include "gc/gc_9_4_2_sh_mask.h"
+
+/*
+ * Returns TRAP_EN, EXCP_EN and EXCP_REPLACE.
+ *
+ * restore_dbg_registers is ignored here but is a general interface requirement
+ * for devices that support GFXOFF and where the RLC save/restore list
+ * does not support hw registers for debugging i.e. the driver has to manually
+ * initialize the debug mode registers after it has disabled GFX off during the
+ * debug session.
+ */
+static uint32_t kgd_aldebaran_enable_debug_trap(struct amdgpu_device *adev,
+					    bool restore_dbg_registers,
+					    uint32_t vmid)
+{
+	uint32_t data = 0;
+
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_EN, 0);
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_REPLACE, 0);
+
+	return data;
+}
+
+/* returns TRAP_EN, EXCP_EN and EXCP_REPLACE. */
+static uint32_t kgd_aldebaran_disable_debug_trap(struct amdgpu_device *adev,
+						bool keep_trap_enabled,
+						uint32_t vmid)
+{
+	uint32_t data = 0;
+
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, keep_trap_enabled);
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_EN, 0);
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_REPLACE, 0);
+
+	return data;
+}
 
 const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
@@ -42,5 +80,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 				kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
-	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings
+	.enable_debug_trap = kgd_aldebaran_enable_debug_trap,
+	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
+	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
 };
-- 
2.25.1

