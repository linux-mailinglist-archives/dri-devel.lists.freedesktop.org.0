Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0301B6CAD72
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5744010E6C5;
	Mon, 27 Mar 2023 18:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659E10E385;
 Mon, 27 Mar 2023 18:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCCDqyCpF1HDAWBHZipimKvKRpQQe7N1ffw/JzkIf+904ZEm9Aaqv831/+Gc9IKjtDtC6hC/t2/PUS+dnVe2T8QDbcNuZa/Jb8Ai9ifkr/fKXqvLinFKWPUtH20h8Yypg2MCBfrAZ0FB2ApqYdce0KqTiPEm1/k+9tEcFtPSNLT0zF7lresM1y3ZE0QkLZZxpoZD0IVRjjztTtzz70mseO/3sx/jKuT9d3E9LYjEynpZiUT1Q9wG0LUGadOI+So+hgcp1JUjmakh0hjvAXyaFQFeKjNppNLN4VNDK/hrLWVgMzwtsgKLFxyYf85Ja9zVavi9apcdODsE5j25eqpcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hi1W1Vq7qFKco9GJovyGZm33R3xq9bUH3NzlN2LUyoI=;
 b=XtWTHNVnZn64wwYGKDkrbseZkPOjLKRvJ+XY29WlFUirKwUm3L3BD7eIvycqjGY1QKPe3xaDdNcJldGsyc5zd5cRPChPefKrGfVSg064YeyX57HdYlU2eNuTM24UCYn5ZPFgv04X+aG8b+Xt5oOfvO3hNSJ8Y50h241IDrxOT8QJz+WVlF6EAtI3EhytBnFeKG9lHRUyp9vihU2OD4bK26bJXbsUNAnFZBpmy/0j8Gt1EPp1JCizhHrQy8TWF6sjO58BzXViibhKLAqOZfYM26JPYndsHuLA+WIPxGmiCE8K1qQrHDodzXGN9I35dMd7e0QM8Y7REcw9lUCY8y+gnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi1W1Vq7qFKco9GJovyGZm33R3xq9bUH3NzlN2LUyoI=;
 b=pBMNafHBTDceIuUePguXYYYpHJ3VJedWsJyl/rSjzwT2pmjDTSX/jGfPUSNgob+SMG/770dtqAgRSXbjpqhGmBwnQdiM0XCMq0GwmY3CxY4S5CnOLJrNCKzuCPMKiYyCzwkbZo8gbBVIUMDdBCRv7lfGzQoO8RJ+GJ2wLdguHu4=
Received: from CY8PR02CA0006.namprd02.prod.outlook.com (2603:10b6:930:4d::11)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:52 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::d5) by CY8PR02CA0006.outlook.office365.com
 (2603:10b6:930:4d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:51 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:49 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/34] drm/amdgpu: setup hw debug registers on driver
 initialization
Date: Mon, 27 Mar 2023 14:43:10 -0400
Message-ID: <20230327184339.125016-5-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: 69963e46-bbf7-465f-1dc5-08db2ef335ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hLbUZrC2ei/Qx+PhSV/W5Y9F13vXCaXBHf4EcPnFIMaXTxTmPF7LA8ccb6R8R7IhMwN2QEKvU8wMFrIDGIGRZ4RUrQwciXcixbImGfUH2sC2QAWsP97Km4AfPkTL6nkx+ii54OjgC8ZgvDYzM+JiatbVsbQBlgzBcLLst9/02Q5lrAKn8jEc+mNElRl9QOR7BQKhOxYNIlLn94HeOdFsGdFuODHYMzDK3Cq13NHwM+JMnVKv+ngK8+Y17nMwOWVzWkihFxyZmuiZ05IOX0bZmN9HsGf99Ri8dJUb9FFTmmr+MJmKESTtQh6ix38NNoOfuW1jgGfLbZX2YmkiByObF2btTiXpy2aO4NJor9NhZ12PiSpI484cCs83Vt2QhjWYGoA10hltaW/lE0ybRWWM8ueQnbuYoEGp/FC7OX3987M0V22TMa91QLSgGSYvG19ksyypIur2KFwcAuLLy872TpMOlvzBrhbvk0smzmhXJgc7RLe8npcMZlfDB1yiGcpRIRpCf7PK1o3Yof8n/7Bw+kxAmfXGF6KQEj7ayCh7emZmkgY0CfDu4GdxX/v9e/jN85xDRm9fgH0liKnTGi0owxsGJMWIcNMfO2zvzQxcbTEeSfuuEtoYGwkJnSjuSL2c0B7xb9c2Xm+YB6xosPRK4wMQQafTWKcqTebDuWnjVNuWB/BmrlxstvGhcu8baeaPY0ZoslKoE/saN5u6G5kxhBBg2ANEMX2P1vdqRyLEB8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(426003)(86362001)(83380400001)(47076005)(2616005)(336012)(4326008)(356005)(16526019)(40460700003)(70586007)(40480700001)(186003)(82740400003)(81166007)(8676002)(26005)(36860700001)(5660300002)(41300700001)(36756003)(70206006)(8936002)(1076003)(30864003)(44832011)(82310400005)(316002)(6666004)(450100002)(110136005)(7696005)(54906003)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:51.6594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69963e46-bbf7-465f-1dc5-08db2ef335ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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

Add missing debug trap registers references and initialize all debug
registers on boot by clearing the hardware exception overrides and the
wave allocation ID index.

The debugger requires that TTMPs 6 & 7 save the dispatch ID to map
waves onto dispatch during compute context inspection.
In order to correctly set this up, set the special reserved CP bit by
default whenever the MQD is initailized.

v2: leave TRAP_EN set for multi-process debugging as per process disable
will be taken care of in later patches.
fixup typo in description.
enable ttmp setup for dispatch boundary in mqd init for gfx11.
add trap on wave start and end registers for gfx11.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 26 +++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |  1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 30 ++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  5 ++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  |  5 ++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  5 ++
 .../include/asic_reg/gc/gc_10_1_0_offset.h    | 14 ++++
 .../include/asic_reg/gc/gc_10_1_0_sh_mask.h   | 69 +++++++++++++++++++
 .../include/asic_reg/gc/gc_10_3_0_offset.h    | 10 +++
 .../include/asic_reg/gc/gc_10_3_0_sh_mask.h   |  4 ++
 .../include/asic_reg/gc/gc_11_0_0_sh_mask.h   |  4 ++
 11 files changed, 173 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 516409989235..b62596140db4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4823,6 +4823,29 @@ static u32 gfx_v10_0_init_pa_sc_tile_steering_override(struct amdgpu_device *ade
 
 #define DEFAULT_SH_MEM_BASES	(0x6000)
 
+static void gfx_v10_0_debug_trap_config_init(struct amdgpu_device *adev,
+				uint32_t first_vmid,
+				uint32_t last_vmid)
+{
+	uint32_t data;
+	uint32_t trap_config_vmid_mask = 0;
+	int i;
+
+	/* Calculate trap config vmid mask */
+	for (i = first_vmid; i < last_vmid; i++)
+		trap_config_vmid_mask |= (1 << i);
+
+	data = REG_SET_FIELD(0, SPI_GDBG_TRAP_CONFIG,
+			VMID_SEL, trap_config_vmid_mask);
+	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
+			TRAP_EN, 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_CONFIG), data);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA0), 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA1), 0);
+}
+
 static void gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
 {
 	int i;
@@ -4854,6 +4877,9 @@ static void gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
 		WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, i, 0);
 		WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, i, 0);
 	}
+
+	gfx_v10_0_debug_trap_config_init(adev, adev->vm_manager.first_kfd_vmid,
+					AMDGPU_NUM_VMID);
 }
 
 static void gfx_v10_0_init_gds_vmid(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index ecf8ceb53311..56c211b790db 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1603,6 +1603,7 @@ static void gfx_v11_0_init_compute_vmid(struct amdgpu_device *adev)
 		/* Enable trap for each kfd vmid. */
 		data = RREG32_SOC15(GC, 0, regSPI_GDBG_PER_VMID_CNTL);
 		data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
+		WREG32_SOC15(GC, 0, regSPI_GDBG_PER_VMID_CNTL, data);
 	}
 	soc21_grbm_select(adev, 0, 0, 0, 0);
 	mutex_unlock(&adev->srbm_mutex);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index ae09fc1cfe6b..d3ad9e9d4133 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2289,6 +2289,29 @@ static void gfx_v9_0_setup_rb(struct amdgpu_device *adev)
 	adev->gfx.config.num_rbs = hweight32(active_rbs);
 }
 
+static void gfx_v9_0_debug_trap_config_init(struct amdgpu_device *adev,
+				uint32_t first_vmid,
+				uint32_t last_vmid)
+{
+	uint32_t data;
+	uint32_t trap_config_vmid_mask = 0;
+	int i;
+
+	/* Calculate trap config vmid mask */
+	for (i = first_vmid; i < last_vmid; i++)
+		trap_config_vmid_mask |= (1 << i);
+
+	data = REG_SET_FIELD(0, SPI_GDBG_TRAP_CONFIG,
+			VMID_SEL, trap_config_vmid_mask);
+	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
+			TRAP_EN, 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_CONFIG), data);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA0), 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA1), 0);
+}
+
 #define DEFAULT_SH_MEM_BASES	(0x6000)
 static void gfx_v9_0_init_compute_vmid(struct amdgpu_device *adev)
 {
@@ -4565,6 +4588,13 @@ static int gfx_v9_0_late_init(void *handle)
 	if (r)
 		return r;
 
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
+		gfx_v9_4_2_debug_trap_config_init(adev,
+			adev->vm_manager.first_kfd_vmid, AMDGPU_NUM_VMID);
+	else
+		gfx_v9_0_debug_trap_config_init(adev,
+			adev->vm_manager.first_kfd_vmid, AMDGPU_NUM_VMID);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index d3e2b6a599a4..cb484ace17de 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -117,6 +117,11 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
 			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
 
+	/* Set cp_hqd_hq_scheduler0 bit 14 to 1 to have the CP set up the
+	 * DISPATCH_PTR.  This is required for the kfd debugger
+	 */
+	m->cp_hqd_hq_scheduler0 = 1 << 14;
+
 	if (q->format == KFD_QUEUE_FORMAT_AQL) {
 		m->cp_hqd_aql_control =
 			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
index 4a9af800b1f1..61147f5532ef 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
@@ -143,6 +143,11 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
 			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
 
+	/* Set cp_hqd_hq_scheduler0 bit 14 to 1 to have the CP set up the
+	 * DISPATCH_PTR.  This is required for the kfd debugger
+	 */
+	m->cp_hqd_hq_status0 = 1 << 14;
+
 	if (q->format == KFD_QUEUE_FORMAT_AQL) {
 		m->cp_hqd_aql_control =
 			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 0778e587a2d6..86f1cf090246 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -164,6 +164,11 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
 			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
 
+	/* Set cp_hqd_hq_scheduler0 bit 14 to 1 to have the CP set up the
+	 * DISPATCH_PTR.  This is required for the kfd debugger
+	 */
+	m->cp_hqd_hq_status0 = 1 << 14;
+
 	if (q->format == KFD_QUEUE_FORMAT_AQL) {
 		m->cp_hqd_aql_control =
 			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
index 79c41004c0b6..4908044f7409 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
@@ -5194,6 +5194,20 @@
 #define mmSPI_WCL_PIPE_PERCENT_CS6_BASE_IDX                                                            0
 #define mmSPI_WCL_PIPE_PERCENT_CS7                                                                     0x1f70
 #define mmSPI_WCL_PIPE_PERCENT_CS7_BASE_IDX                                                            0
+#define mmSPI_GDBG_WAVE_CNTL                                                                           0x1f71
+#define mmSPI_GDBG_WAVE_CNTL_BASE_IDX                                                                  0
+#define mmSPI_GDBG_TRAP_CONFIG                                                                         0x1f72
+#define mmSPI_GDBG_TRAP_CONFIG_BASE_IDX                                                                0
+#define mmSPI_GDBG_TRAP_MASK                                                                           0x1f73
+#define mmSPI_GDBG_TRAP_MASK_BASE_IDX                                                                  0
+#define mmSPI_GDBG_WAVE_CNTL2                                                                          0x1f74
+#define mmSPI_GDBG_WAVE_CNTL2_BASE_IDX                                                                 0
+#define mmSPI_GDBG_WAVE_CNTL3                                                                          0x1f75
+#define mmSPI_GDBG_WAVE_CNTL3_BASE_IDX                                                                 0
+#define mmSPI_GDBG_TRAP_DATA0                                                                          0x1f78
+#define mmSPI_GDBG_TRAP_DATA0_BASE_IDX                                                                 0
+#define mmSPI_GDBG_TRAP_DATA1                                                                          0x1f79
+#define mmSPI_GDBG_TRAP_DATA1_BASE_IDX                                                                 0
 #define mmSPI_COMPUTE_QUEUE_RESET                                                                      0x1f7b
 #define mmSPI_COMPUTE_QUEUE_RESET_BASE_IDX                                                             0
 #define mmSPI_RESOURCE_RESERVE_CU_0                                                                    0x1f7c
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
index 52043e143067..9b7d219e7954 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
@@ -19700,6 +19700,75 @@
 //SPI_WCL_PIPE_PERCENT_CS7
 #define SPI_WCL_PIPE_PERCENT_CS7__VALUE__SHIFT                                                                0x0
 #define SPI_WCL_PIPE_PERCENT_CS7__VALUE_MASK                                                                  0x7FL
+//SPI_GDBG_WAVE_CNTL
+#define SPI_GDBG_WAVE_CNTL__STALL_RA__SHIFT                                                                   0x0
+#define SPI_GDBG_WAVE_CNTL__STALL_VMID__SHIFT                                                                 0x1
+#define SPI_GDBG_WAVE_CNTL__STALL_RA_MASK                                                                     0x00000001L
+#define SPI_GDBG_WAVE_CNTL__STALL_VMID_MASK                                                                   0x0001FFFEL
+//SPI_GDBG_TRAP_CONFIG
+#define SPI_GDBG_TRAP_CONFIG__ME_SEL__SHIFT                                                                   0x0
+#define SPI_GDBG_TRAP_CONFIG__PIPE_SEL__SHIFT                                                                 0x2
+#define SPI_GDBG_TRAP_CONFIG__QUEUE_SEL__SHIFT                                                                0x4
+#define SPI_GDBG_TRAP_CONFIG__ME_MATCH__SHIFT                                                                 0x7
+#define SPI_GDBG_TRAP_CONFIG__PIPE_MATCH__SHIFT                                                               0x8
+#define SPI_GDBG_TRAP_CONFIG__QUEUE_MATCH__SHIFT                                                              0x9
+#define SPI_GDBG_TRAP_CONFIG__TRAP_EN__SHIFT                                                                  0xf
+#define SPI_GDBG_TRAP_CONFIG__VMID_SEL__SHIFT                                                                 0x10
+#define SPI_GDBG_TRAP_CONFIG__ME_SEL_MASK                                                                     0x00000003L
+#define SPI_GDBG_TRAP_CONFIG__PIPE_SEL_MASK                                                                   0x0000000CL
+#define SPI_GDBG_TRAP_CONFIG__QUEUE_SEL_MASK                                                                  0x00000070L
+#define SPI_GDBG_TRAP_CONFIG__ME_MATCH_MASK                                                                   0x00000080L
+#define SPI_GDBG_TRAP_CONFIG__PIPE_MATCH_MASK                                                                 0x00000100L
+#define SPI_GDBG_TRAP_CONFIG__QUEUE_MATCH_MASK                                                                0x00000200L
+#define SPI_GDBG_TRAP_CONFIG__TRAP_EN_MASK                                                                    0x00008000L
+#define SPI_GDBG_TRAP_CONFIG__VMID_SEL_MASK                                                                   0xFFFF0000L
+//SPI_GDBG_TRAP_MASK
+#define SPI_GDBG_TRAP_MASK__EXCP_EN__SHIFT                                                                    0x0
+#define SPI_GDBG_TRAP_MASK__REPLACE__SHIFT                                                                    0x9
+#define SPI_GDBG_TRAP_MASK__EXCP_EN_MASK                                                                      0x01FFL
+#define SPI_GDBG_TRAP_MASK__REPLACE_MASK                                                                      0x0200L
+//SPI_GDBG_WAVE_CNTL2
+#define SPI_GDBG_WAVE_CNTL2__VMID_MASK__SHIFT                                                                 0x0
+#define SPI_GDBG_WAVE_CNTL2__MODE__SHIFT                                                                      0x10
+#define SPI_GDBG_WAVE_CNTL2__VMID_MASK_MASK                                                                   0x0000FFFFL
+#define SPI_GDBG_WAVE_CNTL2__MODE_MASK                                                                        0x00030000L
+//SPI_GDBG_WAVE_CNTL3
+#define SPI_GDBG_WAVE_CNTL3__STALL_PS__SHIFT                                                                  0x0
+#define SPI_GDBG_WAVE_CNTL3__STALL_VS__SHIFT                                                                  0x1
+#define SPI_GDBG_WAVE_CNTL3__STALL_GS__SHIFT                                                                  0x2
+#define SPI_GDBG_WAVE_CNTL3__STALL_HS__SHIFT                                                                  0x3
+#define SPI_GDBG_WAVE_CNTL3__STALL_CSG__SHIFT                                                                 0x4
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS0__SHIFT                                                                 0x5
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS1__SHIFT                                                                 0x6
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS2__SHIFT                                                                 0x7
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS3__SHIFT                                                                 0x8
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS4__SHIFT                                                                 0x9
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS5__SHIFT                                                                 0xa
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS6__SHIFT                                                                 0xb
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS7__SHIFT                                                                 0xc
+#define SPI_GDBG_WAVE_CNTL3__STALL_DURATION__SHIFT                                                            0xd
+#define SPI_GDBG_WAVE_CNTL3__STALL_MULT__SHIFT                                                                0x1c
+#define SPI_GDBG_WAVE_CNTL3__STALL_PS_MASK                                                                    0x00000001L
+#define SPI_GDBG_WAVE_CNTL3__STALL_VS_MASK                                                                    0x00000002L
+#define SPI_GDBG_WAVE_CNTL3__STALL_GS_MASK                                                                    0x00000004L
+#define SPI_GDBG_WAVE_CNTL3__STALL_HS_MASK                                                                    0x00000008L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CSG_MASK                                                                   0x00000010L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS0_MASK                                                                   0x00000020L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS1_MASK                                                                   0x00000040L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS2_MASK                                                                   0x00000080L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS3_MASK                                                                   0x00000100L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS4_MASK                                                                   0x00000200L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS5_MASK                                                                   0x00000400L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS6_MASK                                                                   0x00000800L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS7_MASK                                                                   0x00001000L
+#define SPI_GDBG_WAVE_CNTL3__STALL_DURATION_MASK                                                              0x0FFFE000L
+#define SPI_GDBG_WAVE_CNTL3__STALL_MULT_MASK                                                                  0x10000000L
+//SPI_GDBG_TRAP_DATA0
+#define SPI_GDBG_TRAP_DATA0__DATA__SHIFT                                                                      0x0
+#define SPI_GDBG_TRAP_DATA0__DATA_MASK                                                                        0xFFFFFFFFL
+//SPI_GDBG_TRAP_DATA1
+#define SPI_GDBG_TRAP_DATA1__DATA__SHIFT                                                                      0x0
+#define SPI_GDBG_TRAP_DATA1__DATA_MASK                                                                        0xFFFFFFFFL
 //SPI_COMPUTE_QUEUE_RESET
 #define SPI_COMPUTE_QUEUE_RESET__RESET__SHIFT                                                                 0x0
 #define SPI_COMPUTE_QUEUE_RESET__RESET_MASK                                                                   0x01L
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
index a734abaa91a5..5e15ac14b63c 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
@@ -26,6 +26,8 @@
 #define mmSQ_DEBUG_STS_GLOBAL_BASE_IDX                                                                 0
 #define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x10B0
 #define mmSQ_DEBUG_STS_GLOBAL2_BASE_IDX                                                                0
+#define mmSQ_DEBUG                                                                                     0x10B1
+#define mmSQ_DEBUG_BASE_IDX                                                                            0
 
 // addressBlock: gc_sdma0_sdma0dec
 // base address: 0x4980
@@ -4853,10 +4855,18 @@
 #define mmSPI_WCL_PIPE_PERCENT_CS3_BASE_IDX                                                            0
 #define mmSPI_GDBG_WAVE_CNTL                                                                           0x1f71
 #define mmSPI_GDBG_WAVE_CNTL_BASE_IDX                                                                  0
+#define mmSPI_GDBG_TRAP_CONFIG                                                                         0x1f72
+#define mmSPI_GDBG_TRAP_CONFIG_BASE_IDX                                                                0
 #define mmSPI_GDBG_TRAP_MASK                                                                           0x1f73
 #define mmSPI_GDBG_TRAP_MASK_BASE_IDX                                                                  0
 #define mmSPI_GDBG_WAVE_CNTL2                                                                          0x1f74
 #define mmSPI_GDBG_WAVE_CNTL2_BASE_IDX                                                                 0
+#define mmSPI_GDBG_WAVE_CNTL3                                                                          0x1f75
+#define mmSPI_GDBG_WAVE_CNTL3_BASE_IDX                                                                 0
+#define mmSPI_GDBG_TRAP_DATA0                                                                          0x1f78
+#define mmSPI_GDBG_TRAP_DATA0_BASE_IDX                                                                 0
+#define mmSPI_GDBG_TRAP_DATA1                                                                          0x1f79
+#define mmSPI_GDBG_TRAP_DATA1_BASE_IDX                                                                 0
 #define mmSPI_COMPUTE_QUEUE_RESET                                                                      0x1f7b
 #define mmSPI_COMPUTE_QUEUE_RESET_BASE_IDX                                                             0
 #define mmSPI_RESOURCE_RESERVE_CU_0                                                                    0x1f7c
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
index d7a17bae2584..e4ecd6c2d20e 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
@@ -47907,6 +47907,10 @@
 
 
 // addressBlock: sqind
+//SQ_DEBUG
+#define SQ_DEBUG__SINGLE_MEMOP_MASK 0x00000001L
+#define SQ_DEBUG__SINGLE_MEMOP__SHIFT 0x00000000
+
 //SQ_DEBUG_STS_GLOBAL
 #define SQ_DEBUG_STS_GLOBAL2__FIFO_LEVEL_GFX0_MASK 0x000000ffL
 #define SQ_DEBUG_STS_GLOBAL2__FIFO_LEVEL_GFX0__SHIFT 0x00000000
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h
index 4f08f90856fc..3088a4a13cb5 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h
@@ -17216,11 +17216,15 @@
 #define SPI_GDBG_PER_VMID_CNTL__TRAP_EN__SHIFT                                                                0x3
 #define SPI_GDBG_PER_VMID_CNTL__EXCP_EN__SHIFT                                                                0x4
 #define SPI_GDBG_PER_VMID_CNTL__EXCP_REPLACE__SHIFT                                                           0xd
+#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_START__SHIFT                                                          0xe
+#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_END__SHIFT                                                            0xf
 #define SPI_GDBG_PER_VMID_CNTL__STALL_VMID_MASK                                                               0x00000001L
 #define SPI_GDBG_PER_VMID_CNTL__LAUNCH_MODE_MASK                                                              0x00000006L
 #define SPI_GDBG_PER_VMID_CNTL__TRAP_EN_MASK                                                                  0x00000008L
 #define SPI_GDBG_PER_VMID_CNTL__EXCP_EN_MASK                                                                  0x00001FF0L
 #define SPI_GDBG_PER_VMID_CNTL__EXCP_REPLACE_MASK                                                             0x00002000L
+#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_START_MASK                                                            0x00004000L
+#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_END_MASK                                                              0x00008000L
 //SPI_COMPUTE_QUEUE_RESET
 #define SPI_COMPUTE_QUEUE_RESET__RESET__SHIFT                                                                 0x0
 #define SPI_COMPUTE_QUEUE_RESET__RESET_MASK                                                                   0x01L
-- 
2.25.1

