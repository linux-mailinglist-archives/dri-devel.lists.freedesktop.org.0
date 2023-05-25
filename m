Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3A0711238
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB6410E6FD;
	Thu, 25 May 2023 17:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F5010E4BB;
 Thu, 25 May 2023 17:28:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cn5Zd4Z/enfx5bVmclg+XWx9iGGiyDVIjyHRDZN39sBqtkq7QudkOlW5Gvks+7/pklBsRJdpFdq1zFL6JZX1v8roFmh6fUd7J0KZ87uCg+R5Mr+rhpCJrru5rTCZEmFxPiloBUkMp+UzWFlKOm/jgrFgVNemdRCU8GOi1IxLnpKItCSdBl9wqBIv4eyv7ETv875dJkii2ZrOHlUAewCBfqcGnhWEpZa1IoY4phdFqRvEjvTSHEUM2VRJw3djMxN4Hrfy+JSxX/wC9Waig6vbEdg2R2rM3ouZsn1qYxVMxUyY7I25p7C+he6SPBFlO1wG5Ift0bWy7dKPwdvHd5zizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uTFFOX4r3cIDxLa0nIzyMZYK42xJ6LOeVjhFVc2YUM=;
 b=ktyZXND2nKW5JCVD8RqBmQA62YkSmgrLXQ29dl2/M/0pL7s6yjnCSTg7u6DaQEzUULakELm4lcDK1ZsYhNPPOqkGEMS/hjHksusF7jRN6S0fAA2RKLDadcjd5tsr5NUNw0zFYHL1VTvM4N00WI+WwQhRMcYrWRWER5rDOiX+mxdeOS2xSpzVNVYHNetmuhqkWpZNG5eruZB6RUSupxEEFcbibdhF6JEfm6lM6Bqy5MNlIGHq96oGBcYqDMsGycJEytyppzF7ojO9uLGf8Q/TvS6HY+EUUcwEaiWunI9Bzatbes/QH9Ny0XQMj2t+3DNYu2bFQSLtK/NWYzX0ltK83A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uTFFOX4r3cIDxLa0nIzyMZYK42xJ6LOeVjhFVc2YUM=;
 b=XrWVi/Nh4R4JiBe6dp8LJv/ZMjW02Dor+ffg0heWJdhT8b914NAWWMQ42NdtT9fXeZCtS3oshNqHOfYIKmwqltPrfRkiI+8F7CtARMvXcdojaywL4DUs4vnB0iA9YDqEja36/JIwCyvmGWXLz/Yb+fQxMakt2r8neeJjDa/Dkn4=
Received: from MW4PR03CA0131.namprd03.prod.outlook.com (2603:10b6:303:8c::16)
 by SJ2PR12MB8111.namprd12.prod.outlook.com (2603:10b6:a03:4fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 17:28:02 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::96) by MW4PR03CA0131.outlook.office365.com
 (2603:10b6:303:8c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:02 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:27:58 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 11/33] drm/amdgpu: add gfx11 hw debug mode enable and disable
 calls
Date: Thu, 25 May 2023 13:27:23 -0400
Message-ID: <20230525172745.702700-11-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525172745.702700-1-jonathan.kim@amd.com>
References: <20230525172745.702700-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|SJ2PR12MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 8208d20c-5b3e-42f5-bae0-08db5d4564af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MqBoh1hdDRTln1U3QWYTddhcgZc52weylPr44uXMLtaGWZrMt/d07NsJVmJqC1sGbkkjC5dc4EizQINeLJhvb9WHn39HmmEI2gjWRdubginj15Lwg9vyWMiubJLyMVOLgN0x4ZVT/iQFB++F2bHUG6LoOxzsCQrfR0ETm54yhZnkSbaM0hiukidZurZOMqmqcebd92C/Dp5icDdSFS9+4lmUS6VVL0ZkRV2WHIGqE50Kd4weJVPTcqGpepooBzQz5JK9dW8H1DGjvz+5mfGAdG2NwuzFcUI6y1vcPiFdGgW0SBCp05wk3XXbPKL2PcFumkhZWO6ydbMVeu/xvs9bhXnz1lpIqzHsPiN+K5pmK+REcdvkLrBaTs23WOp15qvapmEgtEQYHv+zTbgcWjfNS8XOoUxPCXGbvlWkw3jOf1qLV8ZolPVGhpRXJX4aRzcQxsPGlpO225ZbGqkIqnOjoCgJaHuyUDsFmKotCDGEUNt2K6VbvTDYjs6havqcZxmTL493Barvinh/U5xaKNnYkrDn1VUN/a9x3jWIzWQn2GLJyI2htWQx6iKjdpuAb/t6t7ftOMLMDnCpL60yP4JM3vBDO+K2LyC7P115Us2BweZOYgxsXMds6RvQAKRAniyCbGnxoKyHnJAVyoYGGb5PN9GFtNpQiI0mfd6OwDeobKY4zsdH8Iqb4qS96hJjHqsmaGzpjVyNR24uLlfCskaFajhhcSltifHJXSKoNIt2FRaOYLKxeMRnEJjsfKc3vqCLK4vAE5Gs/7Wi02fObUVRPA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(1076003)(44832011)(26005)(478600001)(40460700003)(2616005)(336012)(41300700001)(426003)(86362001)(4326008)(36860700001)(6636002)(70206006)(316002)(70586007)(36756003)(47076005)(6666004)(450100002)(83380400001)(82310400005)(40480700001)(7696005)(356005)(81166007)(82740400003)(110136005)(8676002)(8936002)(5660300002)(2906002)(16526019)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:02.5015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8208d20c-5b3e-42f5-bae0-08db5d4564af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8111
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the per-device calls to enable or disable HW debug mode
for GFX11.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index 7deff8a547fb..cc954cf248ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -607,6 +607,42 @@ static void set_vm_context_page_table_base_v11(struct amdgpu_device *adev,
 	adev->gfxhub.funcs->setup_vm_pt_regs(adev, vmid, page_table_base);
 }
 
+/*
+ * Returns TRAP_EN, EXCP_EN and EXCP_REPLACE.
+ *
+ * restore_dbg_registers is ignored here but is a general interface requirement
+ * for devices that support GFXOFF and where the RLC save/restore list
+ * does not support hw registers for debugging i.e. the driver has to manually
+ * initialize the debug mode registers after it has disabled GFX off during the
+ * debug session.
+ */
+static uint32_t kgd_gfx_v11_enable_debug_trap(struct amdgpu_device *adev,
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
+/* Returns TRAP_EN, EXCP_EN and EXCP_REPLACE. */
+static uint32_t kgd_gfx_v11_disable_debug_trap(struct amdgpu_device *adev,
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
+
 const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.program_sh_mem_settings = program_sh_mem_settings_v11,
 	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
@@ -623,4 +659,6 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.wave_control_execute = wave_control_execute_v11,
 	.get_atc_vmid_pasid_mapping_info = NULL,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base_v11,
+	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
+	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap
 };
-- 
2.25.1

