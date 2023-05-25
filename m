Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8621271123D
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6C510E6ED;
	Thu, 25 May 2023 17:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060.outbound.protection.outlook.com [40.107.96.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375E010E4BB;
 Thu, 25 May 2023 17:28:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnBi4F1ksWmzs7csc20UcP1URtR50VyvA5jBXOdTC5iaoBY1zIPjxhGKZNObgJ3IO4b/Oj5tZVsLRmFJ9wB4SyZQDZo7LZ3FKHGRMS1oYqaP3DgRDg9H93G2QdeLdRVqEdYyBibnKtKGEmhN/fy/RrfMOTt0ZCw8mJiCWJVApMjhFWoR5+zFnYwJRDOClt3UZlnC3NIcTS3rW3q79kxYli9WS2nSB/eLTzxEmP6YpdG3AH40DZFEuVAxNvDqK49nbiLtH5iePtbuvJl6IDVdGIM5wI1M8LWTKGQRf9ruxrAnqK4U6HYgHZJiWlva/MQ45sdjGnxYq2cJM9YR0KVNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JH83a5kWoVboji8XOL63ZwKEiUK6Kh6ADL/VH98k1RI=;
 b=mF7tGYxlNH80k83dJrLCfTWj3df32NbTrgGHYy36QcB6cHDalhFSSOt5BnR9bj+MxTAhPHbzObblmgQdYXwQyrOcL5K2ZfOxakGNJSrz6Lq77GdL/xII4gWDV1K2XWqNqSVw+iaqzWxv7+on/GrH/IoP72fVZ4FqJjb5Ng8e4Li2y8u3JYJOmBrfm5M0YRJno6VQGQeHwx1KqBnIA6lTr4+oHhkqZO+dR+3Xa/MAq6Y++5v2h6DQgE62g3oQXD3J3mN8dn8vPpxdHGCv9wieV08vMWTeUp2HSJn8xlL3PXbxnwhKtVYJgIWy33OCYHgp8GklxhAQinesDBvv70y5Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JH83a5kWoVboji8XOL63ZwKEiUK6Kh6ADL/VH98k1RI=;
 b=WBlA9CpaFj4RWElo2sTc+vLJS1H0NzsqkiKCz2jKkOZMSMo47raaOkZk5fp9kxqwsGN2X1oAZ5ODkTZuYLj3LVTLwuy6xTiEJWWi+Th6XafqEa5xp+NQelKNciIq14avwpiVlhFOeUgCo4q3qgs3vpLNNMIHyvMuF1m9GM5ug8g=
Received: from MW4PR04CA0235.namprd04.prod.outlook.com (2603:10b6:303:87::30)
 by CH3PR12MB9217.namprd12.prod.outlook.com (2603:10b6:610:195::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:28:02 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::7f) by MW4PR04CA0235.outlook.office365.com
 (2603:10b6:303:87::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:01 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:27:58 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 10/33] drm/amdgpu: add gfx9.4.2 hw debug mode enable and
 disable calls
Date: Thu, 25 May 2023 13:27:22 -0400
Message-ID: <20230525172745.702700-10-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|CH3PR12MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6be36f-7503-4567-831f-08db5d456457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UIAnE1gUsF860o3R+4kfJJjm/dSP3drdJDEpZbwm0E+DkbM2Haq42Xgt9bWmxSs0AvrMO4ftiab9uXyW35blv4pavGxTtm5Zt7JnEWxkzZlD6feNo3e1MpgoJcVtDxdDbcopPVqbn2Emw2/i0OEhYgWIT8XKheip9fNIAxNayiUi5dOt27n81onBWKEhCXv5b1PF3eiYK8QzNs/24gylCjP8LufJp1oHW+Hhzi77QQT45Sg+ogO5U1dMW++bbluE0NIYB9KzirwpoPQDzTuSmMlZjBFYZtQ61dYe7ZUgogppXk86IIGgbTIuRkhw5/uonnT2QAwrubUnkeX8PvtWrVoUqAPKER0qzuGaM/r9kR92+c9krKafEOQGHC8zdcz8HI3iN4XRQwRiwL0ZdFCVJNff0V661wArnc3PAutAhCfx2wDP6xWMx5JTbEk7rsODMLbfCcTAI3+3hl+jn3G+lQX+5meO3hQztQMZ+usAH66umG5s++5NBTUt2dHyWw/nBBXA1I4k4diGB69kDx8jPmL9ow0UPpsud5d/KLhniZHn/yL1ovq9Ka03Kv6Sdb47j55vw0cohmZ+B6vWHWbMDxBZutWrC5e1/g1rSxaJbGWdfUysHmSkAnRH0v90CCZreL+g2kr3n1eC4KTfOy3RnaSIMv+FoTkbXx4h1xz3CNSGoTdRUfcdsCNLXo0j/RYZPWafB7hmontQlYzpz7o2njj5nOi8Jw/fBkH4RVg+sfQTjSzXXEpOMNzZmuhKVNVQvKv7J9tBUUP/HK5LpBFD3A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(7696005)(6666004)(82740400003)(82310400005)(16526019)(186003)(26005)(426003)(2616005)(47076005)(1076003)(336012)(36860700001)(83380400001)(40480700001)(36756003)(81166007)(40460700003)(70206006)(356005)(2906002)(70586007)(450100002)(4326008)(6636002)(316002)(86362001)(44832011)(8676002)(8936002)(5660300002)(41300700001)(478600001)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:01.9234 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6be36f-7503-4567-831f-08db5d456457
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9217
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

GFX9.4.2 now supports per-VMID debug mode controls registers
(SPI_GDBG_PER_VMID_CNTL).

Because the KFD lets the HWS handle PASID-VMID mapping, the KFD will
forward all debug mode setting register writes to the HWS scheduler
using a new MAP_PROCESS API, so instead of writing to registers, return
the required register values that the HWS needs to write on debug enable
and disable.

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

