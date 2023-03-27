Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF76CAD6E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97FE10E6C3;
	Mon, 27 Mar 2023 18:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F60D10E3D8;
 Mon, 27 Mar 2023 18:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kavliymgsqd8bjYHg/921NtKc5VIJcB7Gj2oQn+3Qq7up8S0nwiGDqBZw4qYoNogUkFg2Rzwd1CNauceWGepSCnOPqLCrnNXz1P5AbXyXwNo5WEbvqBosPDB2THXJzjoMM46MZpOrRgRXerVrYFv8IC5YTiQkXfFPg/VlZutyLqsAfUHY0sPpIAlZWBfEIAFENgibgPawH1lsUWB/uK37Sgd64tjv0ek12iNXGEI7s7Jl00Ifcz3HVN8iV4Mvm9R1uWCkor2XQaqYDdrWdSVzryykKldNvEIzVvZJIVHk63KRjPaaFXxBasNQCT9a5XTWluoePy4SzDGsJ/Ug/9eIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o1k+JxJSt+Gmyg8ebKfIO4aq5WuOCQSDGIH04aLeg4=;
 b=JEJaoLWnkWL3Qc0E66OvXPZ7aKzNSWouuHgEJdJiwoWR/yykAoghUP8Xve7Rmx5FAen8HhsJiEcq+J8nE+tl5XhxgwfIzQy4+UTjMuu0dyflZfKtsnzMNtCRL0baVZnYzAQovvTRGXQVVLZH0WJh+QE7/ekEv+lUwamIu9SwOIkMKpsWzX9PqYljg4COv+0q1V+6fUx7xDQVgesU1mmVz7ttmWQ5SshppHVCD3cSOeE1idIo/1TLYlZJaxtqrIoU+/aMkn5Z0TTw+Z3q2MqidBU44u/voK8Lg0fYpxN2KKerYJBe1otte2IsN8uoNVWBYunGjZk9VR0pob4HAD82ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4o1k+JxJSt+Gmyg8ebKfIO4aq5WuOCQSDGIH04aLeg4=;
 b=klGw3bsiWcNu+gCim6n5CKmwokAn5wI9HUoq49hUdPExS45UyKHCc0WVfYTYzT3fJaEoZYn6ZrBk9edWuz9JxrVOwEVYOVZVqm7IbUVTILBMPWXIn3cuJ6jx1dQ20jbOTCPTWeqEnrhHXab3nZLg0sdh8+kbCCY5pEv2l8/6bzk=
Received: from CY8PR02CA0019.namprd02.prod.outlook.com (2603:10b6:930:4d::12)
 by BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 18:43:50 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::6f) by CY8PR02CA0019.outlook.office365.com
 (2603:10b6:930:4d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:50 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:48 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/34] drm/amdkfd: display debug capabilities
Date: Mon, 27 Mar 2023 14:43:07 -0400
Message-ID: <20230327184339.125016-2-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: 144f6607-f9c6-4ac0-6365-08db2ef334d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T3IgI+9FycnYECoN9J7L2AM9ItZ7yQuaxOW/SVV6jRTFy+4IdGxl6/0vaXlXxidqzbrpa/hYTUyhJux0N8l5Du3FiFSe5+9DiwZkAv0aiBwZhetC1eDGSC00qWiLYn7fwQNtZ8d/XMScURwmohrkT2cxkGyo5EY7OToW8W6a9vrCFScisFMx+8qsphN2AeRhN4RI1YiZHf06JfGuzrWh9Q4gTKwTXoKtBz9L2aT12vC2k1fhpUw6ilgnjh3fRuKLjv2oUduD1KqxnP8H4WB80gVrOJfhn4aD6PEY8ngTcWs/BpSjxKX0MlGXEfaXRm3hE1WRlULmx6zPZtpkbzYCn0XGYRHvlZipZ9Bz4rdCEeaNbHE8nSO3bSN0e/HxXvdjYxS1gK9CfCVAhM8gJN4r/9jZVSHFrvPqOsKGnOOZGW9fiRwV5gDQBwvUksiDgNoUCo5huSUdeyhcqKfGP4vE5FGiqmU7+vEnoU3U4IX/8Kbpz6B/qPbB73QM4/tPkMHzQQjFjNBfVvbFRvYu7IxD7h/5YwpXAzHcO/saGlSmgkDXYzxbwH/xc/Bt1Zzi2OSiUvxj8xyINT5pyoTBOgdqcgj+ZN2KhoGiEP4e+Yr2fWfeGgbVF1DFbuleOqUd3iekbZXndSU/0gq3WBqkgVxnxSQDnVZMmTtcvp5/kkH/pM/aRpN0AyYkC51cYIbTNfH7BCZHqsdgScBw5zdNw5WLNF0S8KPvgglzNaMiQpRcYIU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(16526019)(26005)(426003)(1076003)(40480700001)(41300700001)(186003)(6666004)(7696005)(83380400001)(336012)(2616005)(47076005)(478600001)(54906003)(110136005)(316002)(36860700001)(40460700003)(4326008)(70206006)(450100002)(44832011)(2906002)(70586007)(8676002)(81166007)(82740400003)(356005)(36756003)(82310400005)(86362001)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:50.0031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 144f6607-f9c6-4ac0-6365-08db2ef334d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
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

Expose debug capabilities in the KFD topology node's HSA capabilities and
debug properties flags.

Ensure correct capabilities are exposed based on firmware support.

Flag definitions can be referenced in uapi/linux/kfd_sysfs.h.

v2: v1 was reviewed but re-requesting review for the following.
- remove asic family code name comments in firmware support checking
- add gfx11 requirements in fw support checks and debug props and caps

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 101 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h |   6 ++
 include/uapi/linux/kfd_sysfs.h            |  15 ++++
 3 files changed, 117 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 8e4124dcb6e4..0deeb87e5a2d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -551,6 +551,8 @@ static ssize_t node_show(struct kobject *kobj, struct attribute *attr,
 				      dev->gpu->mec_fw_version);
 		sysfs_show_32bit_prop(buffer, offs, "capability",
 				      dev->node_props.capability);
+		sysfs_show_64bit_prop(buffer, offs, "debug_prop",
+				      dev->node_props.debug_prop);
 		sysfs_show_32bit_prop(buffer, offs, "sdma_fw_version",
 				      dev->gpu->sdma_fw_version);
 		sysfs_show_64bit_prop(buffer, offs, "unique_id",
@@ -1865,6 +1867,97 @@ static int kfd_topology_add_device_locked(struct kfd_dev *gpu, uint32_t gpu_id,
 	return res;
 }
 
+static void kfd_topology_set_dbg_firmware_support(struct kfd_topology_device *dev)
+{
+	bool firmware_supported = true;
+
+	if (KFD_GC_VERSION(dev->gpu) >= IP_VERSION(11, 0, 0) &&
+			KFD_GC_VERSION(dev->gpu) < IP_VERSION(12, 0, 0)) {
+		firmware_supported =
+			(dev->gpu->adev->mes.sched_version & AMDGPU_MES_VERSION_MASK) >= 9;
+		goto out;
+	}
+
+	/*
+	 * Note: Any unlisted devices here are assumed to support exception handling.
+	 * Add additional checks here as needed.
+	 */
+	switch (KFD_GC_VERSION(dev->gpu)) {
+	case IP_VERSION(9, 0, 1):
+		firmware_supported = dev->gpu->mec_fw_version >= 459 + 32768;
+		break;
+	case IP_VERSION(9, 1, 0):
+	case IP_VERSION(9, 2, 1):
+	case IP_VERSION(9, 2, 2):
+	case IP_VERSION(9, 3, 0):
+	case IP_VERSION(9, 4, 0):
+		firmware_supported = dev->gpu->mec_fw_version >= 459;
+		break;
+	case IP_VERSION(9, 4, 1):
+		firmware_supported = dev->gpu->mec_fw_version >= 60;
+		break;
+	case IP_VERSION(9, 4, 2):
+		firmware_supported = dev->gpu->mec_fw_version >= 51;
+		break;
+	case IP_VERSION(10, 1, 10):
+	case IP_VERSION(10, 1, 2):
+	case IP_VERSION(10, 1, 1):
+		firmware_supported = dev->gpu->mec_fw_version >= 144;
+		break;
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+		firmware_supported = dev->gpu->mec_fw_version >= 89;
+		break;
+	case IP_VERSION(10, 1, 3):
+	case IP_VERSION(10, 3, 3):
+		firmware_supported = false;
+		break;
+	default:
+		break;
+	}
+
+out:
+	if (firmware_supported)
+		dev->node_props.capability |= HSA_CAP_TRAP_DEBUG_FIRMWARE_SUPPORTED;
+}
+
+static void kfd_topology_set_capabilities(struct kfd_topology_device *dev)
+{
+	dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_2_0 <<
+				HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
+				HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
+
+	dev->node_props.capability |= HSA_CAP_TRAP_DEBUG_SUPPORT |
+			HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_TRAP_OVERRIDE_SUPPORTED |
+			HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_MODE_SUPPORTED;
+
+	if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(10, 0, 0)) {
+		dev->node_props.debug_prop |= HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX9 |
+						HSA_DBG_WATCH_ADDR_MASK_HI_BIT;
+
+		if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(9, 4, 2))
+			dev->node_props.debug_prop |=
+				HSA_DBG_DISPATCH_INFO_ALWAYS_VALID;
+		else
+			dev->node_props.capability |=
+				HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED;
+	} else {
+		dev->node_props.debug_prop |= HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX10 |
+					HSA_DBG_WATCH_ADDR_MASK_HI_BIT;
+
+		if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(11, 0, 0))
+			dev->node_props.debug_prop |= HSA_DBG_DISPATCH_INFO_ALWAYS_VALID;
+		else
+			dev->node_props.capability |=
+				HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED;
+	}
+
+	kfd_topology_set_dbg_firmware_support(dev);
+}
+
 int kfd_topology_add_device(struct kfd_dev *gpu)
 {
 	uint32_t gpu_id;
@@ -1966,13 +2059,11 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 			HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
 		break;
 	default:
-		if (KFD_GC_VERSION(dev->gpu) >= IP_VERSION(9, 0, 1))
-			dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_2_0 <<
-				HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
-				HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
-		else
+		if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(9, 0, 1))
 			WARN(1, "Unexpected ASIC family %u",
 			     dev->gpu->adev->asic_type);
+		else
+			kfd_topology_set_capabilities(dev);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
index fca30d00a9bb..53b9b7bf52ee 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
@@ -31,6 +31,11 @@
 
 #define KFD_TOPOLOGY_PUBLIC_NAME_SIZE 32
 
+#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX9	6
+#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX10	7
+#define HSA_DBG_WATCH_ADDR_MASK_HI_BIT  \
+			(29 << HSA_DBG_WATCH_ADDR_MASK_HI_BIT_SHIFT)
+
 struct kfd_node_properties {
 	uint64_t hive_id;
 	uint32_t cpu_cores_count;
@@ -42,6 +47,7 @@ struct kfd_node_properties {
 	uint32_t cpu_core_id_base;
 	uint32_t simd_id_base;
 	uint32_t capability;
+	uint64_t debug_prop;
 	uint32_t max_waves_per_simd;
 	uint32_t lds_size_in_kb;
 	uint32_t gds_size_in_kb;
diff --git a/include/uapi/linux/kfd_sysfs.h b/include/uapi/linux/kfd_sysfs.h
index 3e330f368917..a51b7331e0b4 100644
--- a/include/uapi/linux/kfd_sysfs.h
+++ b/include/uapi/linux/kfd_sysfs.h
@@ -43,6 +43,11 @@
 #define HSA_CAP_DOORBELL_TYPE_2_0		0x2
 #define HSA_CAP_AQL_QUEUE_DOUBLE_MAP		0x00004000
 
+#define HSA_CAP_TRAP_DEBUG_SUPPORT              0x00008000
+#define HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_TRAP_OVERRIDE_SUPPORTED  0x00010000
+#define HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_MODE_SUPPORTED           0x00020000
+#define HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED  0x00040000
+
 /* Old buggy user mode depends on this being 0 */
 #define HSA_CAP_RESERVED_WAS_SRAM_EDCSUPPORTED	0x00080000
 
@@ -53,8 +58,18 @@
 #define HSA_CAP_SRAM_EDCSUPPORTED		0x04000000
 #define HSA_CAP_SVMAPI_SUPPORTED		0x08000000
 #define HSA_CAP_FLAGS_COHERENTHOSTACCESS	0x10000000
+#define HSA_CAP_TRAP_DEBUG_FIRMWARE_SUPPORTED   0x20000000
 #define HSA_CAP_RESERVED			0xe00f8000
 
+/* debug_prop bits in node properties */
+#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_MASK     0x0000000f
+#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_SHIFT    0
+#define HSA_DBG_WATCH_ADDR_MASK_HI_BIT_MASK     0x000003f0
+#define HSA_DBG_WATCH_ADDR_MASK_HI_BIT_SHIFT    4
+#define HSA_DBG_DISPATCH_INFO_ALWAYS_VALID      0x00000400
+#define HSA_DBG_WATCHPOINTS_EXCLUSIVE           0x00000800
+#define HSA_DBG_RESERVED                0xfffffffffffff000ull
+
 /* Heap types in memory properties */
 #define HSA_MEM_HEAP_TYPE_SYSTEM	0
 #define HSA_MEM_HEAP_TYPE_FB_PUBLIC	1
-- 
2.25.1

