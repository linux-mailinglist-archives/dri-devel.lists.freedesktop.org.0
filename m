Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82367BB54
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0CD10E821;
	Wed, 25 Jan 2023 19:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B734110E395;
 Wed, 25 Jan 2023 19:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIJX5GQpuO54ZT1BEF9xIV4Sx7mzADkrcZD/hqJylKwb+DWBPr4NdmWuSisuGDAQ6o6+2O3eId3xi2YvY8auku2X7m5kBJ9uvpL7S9UoeH0VRqbeyFdmHUIjqOhGGVr6MQzycd7/j2ftBkX4GTZSqy164a7cQFhay8YzPM+BZ0Nqw1KnnrTGpH9ck1gJ6afyjFybfFSSjikAVf/Z3WN0/p6Nk1cQb+Q56gptIpQI41YfXZiHQh5Jzm7PmyGY2JjhfnWH6QdH3swSB130pvEr6StzA/h8oBY9mlVYAgAXDcNbx/CXoDv50Y/v6tAO5mtTHzfIIvFFFM038qM8+XqSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb9x/MY68lCCc/IIAM+cs7ejzEp+SNCyNH8qoYcJBgc=;
 b=YQf0kkF0uPwQA7Lc6q78wgQoEwgl2v80KC6T1p1yIDJnEY6SnJ/NqMy7I8hhJAfCnb3VannOb/WF6ewpm40Jq8wnvubh9E84Twj6IQPWYTOozmOSgUuXlZrvEiNATZ5UGZ5bcBnQ0pPobqIpOX9lrQDB4631Zk3DR4GisJgmp6FaHzBszDsxMbOQd/uh65RkbCVfTjAPmLaCy4HMCZSAIYWD6hZtB/IEfMP92cCAJh1Fadgu1Nz5WI+IaLc1GB6rpdw41hnEvPOLE1o/pvFg6Q46BjAb/FD8qrMiyVch4akSFTIW5nOQWbohUu0L91IMA5HekjEmbHPsuJ21i424Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb9x/MY68lCCc/IIAM+cs7ejzEp+SNCyNH8qoYcJBgc=;
 b=BRme8GBicNko2aSuSZ5tlC1OUDNDcDLhszGChYEtLSoVduWIKM1PgOD732sG8SMPkW0aApIUXVHuXfDEhmzIRc1mVH1oQN+l2rL8N7mtbWFLzM2cn85hjUZf+z4gNNwyMCZDRR9POUVPGBWFWpW0Y9CZuWLNm0yNDDZoVOgBzXw=
Received: from BN9PR03CA0693.namprd03.prod.outlook.com (2603:10b6:408:ef::8)
 by PH0PR12MB7840.namprd12.prod.outlook.com (2603:10b6:510:28a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:21 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::3e) by BN9PR03CA0693.outlook.office365.com
 (2603:10b6:408:ef::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:21 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:17 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/32] drm/amdgpu: add gfx11 hw debug mode enable and disable
 calls
Date: Wed, 25 Jan 2023 14:53:39 -0500
Message-ID: <20230125195401.4183544-11-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|PH0PR12MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c9263c-d450-48b9-8f29-08daff0df37e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QySKxthjcjFrhJ3vbLfTpx2X0JGa1OB4nYKx9NxYkuB0N28idAFlOzEjrSMfpxVd9BgGi8SR3+fFwSrD0LpbXFceSW81Dvjyq7liNL0okSvsUX0et/MbX5Xpt39ZK6Ta7ErER21Uv4DXxyTpayacrGpmBU2XSJifoWiPaEhRTn6RN8+esfL6HORSNxg0oRAMxbWSno45gkOHBcgvofUGwuuoKLFib742gyM53JyG8FhfaLVSoWs0sOYVYPHf3BTUqvgzNxQxjWDhsdcPedY75ioZzObA4zfTBrHuKjNnqmjHt0GP6udQ17LTYJjCW41/QytWIwoPtJCV2+R7NNY0SSGWexMdFzQ8lrJPSJSqxImr7wAz9Zdti/EtCYv7Cvx+/U3Ho2WFm+AuJDw8S2rqyllHLjVDlGaUxEd7E1WNo3IUNtI8DYxGvVE37P+P2UUr8AEji43sqtmODcHlCr8FfBYq4wsg2D/+19QXGeVE9Kuw8bRAXStMnTID/mEYSN/Un34peOAjiXWQMNzt/PVrZMKQvyS3YB3o7wD6SYC7MxGoZniYCQJ02oU3xnACrRVsNJ+VOCtPDIovPOzghHjjGZVMw+IECKD64WhxHiMhCVTAhhNypayL/uxvpw1fC+SiL6NY2tUpeXiuwx1Eori8M5cLjIDUcCeJ6bvcltURgz5dlXktux06HrAZPR4PfwtyXoEEsXqrjDsu+HlDZy0cLtC6BeO+1xVJA5Jl2sh+8Xg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199018)(46966006)(36840700001)(40470700004)(450100002)(40480700001)(40460700003)(81166007)(110136005)(70206006)(6666004)(1076003)(36860700001)(8936002)(44832011)(5660300002)(186003)(41300700001)(83380400001)(26005)(82310400005)(70586007)(478600001)(316002)(2616005)(86362001)(7696005)(2906002)(82740400003)(36756003)(336012)(8676002)(4326008)(54906003)(356005)(16526019)(426003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:21.0693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c9263c-d450-48b9-8f29-08daff0df37e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7840
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the per-device calls to enable or disable HW debug mode
for GFX11.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index 7e80caa05060..34aeff692eba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -30,6 +30,7 @@
 #include "soc15d.h"
 #include "v11_structs.h"
 #include "soc21.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 enum hqd_dequeue_request_type {
 	NO_ACTION = 0,
@@ -606,6 +607,42 @@ static void set_vm_context_page_table_base_v11(struct amdgpu_device *adev,
 	adev->gfxhub.funcs->setup_vm_pt_regs(adev, vmid, page_table_base);
 }
 
+/**
+ * Returns TRAP_EN, EXCP_EN and EXCP_REPLACE.
+ *
+ * restore_dbg_reisters is ignored here but is a general interface requirement
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
@@ -622,4 +659,6 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.wave_control_execute = wave_control_execute_v11,
 	.get_atc_vmid_pasid_mapping_info = NULL,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base_v11,
+	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
+	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap
 };
-- 
2.25.1

