Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C95C67BC39
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081FA10E397;
	Wed, 25 Jan 2023 20:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87CC10E115;
 Wed, 25 Jan 2023 20:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeMflyGrwRbooxkiMTpuvFdde8JurZ1BueLk6J9iTcBohkkv+Ivc3hTmt9CgRkX8qwMiHtd1z8BMaqGhnWHjOsALBHM2l1z069t+wkpBJO7mqphRuGoTozirp5YUzKa8XP8Mf7gZUiHjK12Em4DmJgX74GqqmkX2bvPpo1yNTof/Y9mzZBHXeYfFh14gtpzjRW5efQN3b00tPDuXNMBU6/V9/3secbo1C9jVOpZpAVHLLnW1LlwVgeNC0ETWAv7MKZb32vkd7ldxAeKwfcMyBBKWeFdglIGyYlosZwWNk24ojV4vjx6lZsIKeas/jcUjyndjco5iKfLc6hNaweLy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9cATgF0l59xpKsxNWOh1sgzq3oysPGNyFmgzkWJ1tA=;
 b=GFtUgpwNsXdi3T+bjWfP0Fly/6J+5ejmfBdvhHhfl8VmuLCQmcholmuOvk3vxHUgiTw2coGN9tg48h02V8LJI6twKENrx71c6TUk13AQicwwXdFxKwo4VIb8t3qH94ZsDDGcQxw6SpiOFzjZmQM4LG2w+1lfU1FSTuxd2ewm4kPgZ6wEVPBtXEjOL6XYh+3yxWmJMDnwgwkLzl5MlSynsHtfXe8kAeOgrMo7ElCs/hs3/z5RhVC4BSGtxYhzMQLrcaXEybWBJk1FbdkxFTaw435KJMXIS2w2hdVAO8wLoj+yWhQpIIRthAx+Z3go2HTvAFGqRLpmPK67vpOYcmYLFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9cATgF0l59xpKsxNWOh1sgzq3oysPGNyFmgzkWJ1tA=;
 b=PxDhRxf7iA1KTOF6caxGhPbAezvOrku7WGrcQs9LhpnosHzGAxvp4aeyQ3r6cXQv9tE5i+lTlsGL5WVNjFPX8+IUhm50MyWCSK5q9+AvzWf6Mo6nCkwkYVp/k9Hh3f0Jkw2D8yRasTpUhET/dfr1R0XaD8dUXeeLwtTV6zHIqBM=
Received: from BN9PR03CA0809.namprd03.prod.outlook.com (2603:10b6:408:13f::34)
 by BL1PR12MB5272.namprd12.prod.outlook.com (2603:10b6:208:319::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 20:09:22 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::43) by BN9PR03CA0809.outlook.office365.com
 (2603:10b6:408:13f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 20:09:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 20:09:22 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:17 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/32] drm/amdgpu: add gfx9.4.2 hw debug mode enable and
 disable calls
Date: Wed, 25 Jan 2023 14:53:38 -0500
Message-ID: <20230125195401.4183544-10-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT031:EE_|BL1PR12MB5272:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3cfe3c-1532-4c0b-149f-08daff100cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIdgGe+p+QO3+SOxG3h9XO6vIzsCDg/w1hqCdYfQuGDKTzhXSVi77uglgfk8bOFRZlidI9R99ulcc87iPExOi23gtikkNjsWYagNAkWbqhkRa2DxhRZdkTKU7glDsO8LRQ4lBVk18P+y9JBihmsn43XYIRoySv7xxcB1mScoqc2Ham4ya0kmFRPJ9GXmp+FM0Q8RwyrlkSSBiiFQ8rwp9gQKspXl5wLqJzGePrmeFptcklGvU5C0DgR/3wrwrdc+Z7MCg6hmezCRWR9e6ua+eIUiT0x3nBZX9fnVpfX0muVckAh5J89irwbQz7+y0eiyGTRxFMLZWrNcv3Xj8YjjQ+sK4LP3pvS4Geh/UcpfF+slFdg23UKkPYbz/ujXxU+2/eNHGt405Ln8rG7+yXJWWuX3PSHSf5YmzfEAMK3s7GoMT6RiPsHuf/xrV/yuPrPcG9OmIrBX7pC07MwhXoRVV6JnFueH5izU85mi1kDcKhXNmTr7pnDUsbWt6bhshXdysNKkAcfVVtfHzuJWRoJZxldI0wCr6b8Wuf+1HwuCaUZdnWL2wkuZsFkLhKr8fN+GURi/ywhi1ZCiavh0Kc42ktj+wlxrS0CeAIZt3XezIuQiEuB8nrsj5/FtwLmEhpCI2SW5p6gIz+F4RNuR+i0ocDDgcr00SiXjU+o/z96q5CdnuOUG3qXbItRFPfh4irMu10jVQ8cKKwhb4YkRHv2Po04DlaGne6frj7KGQ/jCdjc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199018)(36840700001)(46966006)(40470700004)(36860700001)(83380400001)(26005)(5660300002)(81166007)(7696005)(2906002)(82740400003)(356005)(41300700001)(86362001)(4326008)(8936002)(44832011)(82310400005)(16526019)(40480700001)(316002)(40460700003)(6666004)(186003)(8676002)(47076005)(2616005)(426003)(336012)(478600001)(54906003)(110136005)(36756003)(450100002)(70586007)(1076003)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 20:09:22.5007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3cfe3c-1532-4c0b-149f-08daff100cca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5272
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

GFX9.4.2 now supports per-VMID debug mode controls registers
(SPI_GDBG_PER_VMID_CNTL).

Because the KFD lets the HWS handle PASID-VMID mapping, the KFD will
forward all debug mode setting register writes to the HWS scheduler
using a new MAP_PROCESS API, so instead of writing to registers, return
the required register values that the HWS needs to write on debug enable
and disable.

v2: add commentary on unused restore_dbg_registers for debug enable.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 43 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
index 4485bb29bec9..89868f9927ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
@@ -23,6 +23,44 @@
 #include "amdgpu_amdkfd.h"
 #include "amdgpu_amdkfd_arcturus.h"
 #include "amdgpu_amdkfd_gfx_v9.h"
+#include "gc/gc_9_4_2_offset.h"
+#include "gc/gc_9_4_2_sh_mask.h"
+
+/**
+ * Returns TRAP_EN, EXCP_EN and EXCP_REPLACE.
+ *
+ * restore_dbg_reisters is ignored here but is a general interface requirement
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
@@ -41,6 +79,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.get_atc_vmid_pasid_mapping_info =
 				kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
-	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
-	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings
+	.enable_debug_trap = kgd_aldebaran_enable_debug_trap,
+	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
+	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
 };
-- 
2.25.1

