Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB09C6CAD7E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDDF10E6D5;
	Mon, 27 Mar 2023 18:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C07910E6C4;
 Mon, 27 Mar 2023 18:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeYNa7jEQTvfC3fc2XYCG0OjztkXQlrWybLLlZXjdmlsRUJNRzvIKGFOxcVxhorIwZ/B53aTqJrlPy2Mi5VIW6TIFkT8xLwuN9WSMaCE195HiGFZmrszI2BEhyZuDM6fkuBllcoKKB5+yxAqTr7H8ooklt0ulUrugGY0ivWItzcT7X8E80lSBq6XYazzbXFXmwjlo4sANUghy6ivHvTq1d5+lX3OT1inujqEJOF3NUJhY3rJkuaJgnx6WpUnthN8Xq6xXOVQ1wSowwiMCfCP6yENLRTXvGnaTVqmm9cZ540uXScBJHmTI9fZ1tmEcrn6m2vglGjFn6FVQt5oTkrm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hj/27w73GsMSo33wMX33kzBmFj8HX0lhQlHuxPWeWoU=;
 b=Yuudfhcg8zG/kkiAMrNPL1c79eGM064kk3+5oAhGHDXCZl4D3RWwUVv0KQZ1M3q5Yu5bBPZViSuCtIhyZ1sVc6aL6prQeWvgyM/Uw/N3Xot6ZzDASdW0EH4nKgBsTS/Be2L+Fz3J+CVzO7wmi4xhQF0V3CKd0PAclePZvItAOB/j77p93mf6qSKY5EJGAmcIyNE4W7PLRQBlVbJBAIfFujpuJY9LcY5vFlJ+XULKEKs3VKI4DEogGJJkwQmU0XS3eGUcT42PvFeW2T8pXYOS/XM5sIFOIauHaDEXXHuU1sbpac0+lFt2WM/aR9RBmdwqw3Or2+yJXiJ6dVNsd7zl6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hj/27w73GsMSo33wMX33kzBmFj8HX0lhQlHuxPWeWoU=;
 b=vYCXo2+37qLs1HQeGxP87GwOckuueZXoa2TQ3BSmeD1CvfRpH6+YR4n3nc8k9MNsCuDsAsC+7ZADJ1mCdnJWHQvlny0u2KnJx1v47O3OfvW/YOQw8TH0sEgHhedjspuNRcFA+L63mo397j27JNITWO+T+ZrB88k751trFFCCQas=
Received: from CY8PR02CA0002.namprd02.prod.outlook.com (2603:10b6:930:4d::16)
 by PH7PR12MB5617.namprd12.prod.outlook.com (2603:10b6:510:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Mon, 27 Mar
 2023 18:43:54 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::fd) by CY8PR02CA0002.outlook.office365.com
 (2603:10b6:930:4d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
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
 2023 13:43:52 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/34] drm/amdgpu: add gfx11 hw debug mode enable and disable
 calls
Date: Mon, 27 Mar 2023 14:43:16 -0400
Message-ID: <20230327184339.125016-11-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|PH7PR12MB5617:EE_
X-MS-Office365-Filtering-Correlation-Id: a75be798-a465-4fa9-a5ba-08db2ef3377d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJEx0qKjBcaYSACEYUniWvIrUGnEr7GtSVLaOpMjGOEoKvoQj3eMySjrOh9RhBCJfPW38akD2Ud2QEjk84h6oisNJ3EgAeVBmEmI6P3roktIscP649STH8wY1WLTyczYkmlCe/s57b6u5X+vuWgj8I3OkxC60/E/ozvjofbtjcmCmBtX+C0Ryz4vus7VqaLCwdFBE+SwbkTO0AK/fyW46tITvQwriE8el6U/V0krvjviMcqXBIc9POr49hoJ5qYFh7MboZW75GXKXPb5pDFV98juoyxfQ7KHoZxlq/oS7gDCyLkeoRgq779KeJ4QDeaxK2iNyXz89e6U7NBpVX1I3L8qtwx472/ig8O7Q404g7zoIR3kE4ev+XkL/7+2iWKjpyuZfnEtkhiGzIk7o2k0wOt4CZx3qy2EvJTWrdvP+qM9wrH652ulGo4AjU+bHeTSioSg4kwQttYlQKOTCEZ6OTkiNVIXpfT0aKd8XPYsfakkBZrDZMVjp0BFnUAuz9Of8DEPEEEZb++gGtwIDE7ZRg1FeKpVNcHnDcs+44b7mzJr5IVGHclZiEktZkUoY055KNyUObsZ2ER3TKtRnrwUCNMQw7vfgF/fKcEYNT0hScOJTG5/ZME/rI2y0VXy1torJWLET0g6Caum/7P7Zcfs8EEAMGexwbE3tb7fgU9O2uBKQuhnESKNUz/LsqMetGd+OVWrh8HD0vnUSeEFgH3B55N6ZEQuZTKjBU/xWMLq1QA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(26005)(2616005)(16526019)(186003)(81166007)(336012)(1076003)(450100002)(41300700001)(8936002)(70586007)(478600001)(70206006)(6666004)(47076005)(426003)(44832011)(5660300002)(4326008)(36860700001)(356005)(2906002)(36756003)(7696005)(54906003)(110136005)(82740400003)(316002)(40480700001)(82310400005)(8676002)(40460700003)(83380400001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:54.4874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a75be798-a465-4fa9-a5ba-08db2ef3377d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5617
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

Implement the per-device calls to enable or disable HW debug mode
for GFX11.

v2: remove unneeded ioctl reference and fix types and comment formats.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index 7e80caa05060..dd282085d6c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -606,6 +606,42 @@ static void set_vm_context_page_table_base_v11(struct amdgpu_device *adev,
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
@@ -622,4 +658,6 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.wave_control_execute = wave_control_execute_v11,
 	.get_atc_vmid_pasid_mapping_info = NULL,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base_v11,
+	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
+	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap
 };
-- 
2.25.1

