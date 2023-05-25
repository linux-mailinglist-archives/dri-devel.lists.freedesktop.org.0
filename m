Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E04711223
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D333810E4B1;
	Thu, 25 May 2023 17:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F231B10E49C;
 Thu, 25 May 2023 17:27:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWd4mDRJDxIqIUwqp86HMr0RvNfe9DcrYjosFo40Ms8KHZj7qCl7hdILnKwxugZDMJuJtGOhKoVb+uNqu0MYhlsdqfVAe2y/8sBgpvWBkHbHzZkBQcCHobXSIIzPYgr8VSEsUpxbz10WrwyyIVr5+Ixjqpy09oc/5KV06+jI39+3sGjyNotnfsaRS2Vpkudz5PgM6xpj/Oq5jnMHqPaG3EaSkq2EjDTBQOsOiClqv1gOJIH+VXVHvYW7qwW+S9LCYjrbQ4wzMAPgqicm4nv+c6MtV6853zLw/0O6g9rlRdb6IEmXQGnQUThDvriI9ixjhjSS4rwTieu16nmgI+Ar8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4lebG6IlUsfXDxJUvqzFGMwz4bdJ1OHbF9VU3mTdxs=;
 b=KxQR9/g/KJZwnd/mhKF6FCMV2Wr8pJsIoptydBxgBseD34DwPujP1YncKIUBomwGeAH8aMUP7dDpsG0UQJoRcoE91Vzm+UVhy5NVW/Jo81MzylCZDDgxYs7JkAm8+o8X/zC5BPcFEk+ZgSBK0JkZAE1hhqTM0JtPdVhf1IpwApHodM+H5+af7q+M5TS36b6L5f1rEUrav0ZL0Q0gU48YbGNxMH5mzt3BM1nTQRDzmUjqaAL4uyRiTt96z3JTouGwn0/X1Nx8se8q+t1UQO0YODjPd0Tab6CJXCRD1bRIly5AkG1ppAzcMH7QXDo1Nu1NXtQ1JllXOtmy4moz5oClEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4lebG6IlUsfXDxJUvqzFGMwz4bdJ1OHbF9VU3mTdxs=;
 b=wdrzpllSo1Vm7QWZsRoMBGf20QLH1X2nHsTyvsMwanV646Xr5WOXPk9n/f/N9QiVTaLj+F0znl62tJcx4KG0TnGXj8/IPDnQj2Dh9m3sxBextZWQ3iBGsQdSNz0bLpzk2zMWj1bmVHhfaZJKYmJCgIma9YhbizcfTuzdV/zT6EA=
Received: from MW4PR03CA0124.namprd03.prod.outlook.com (2603:10b6:303:8c::9)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 17:27:56 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::f4) by MW4PR03CA0124.outlook.office365.com
 (2603:10b6:303:8c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:27:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:27:55 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:27:54 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 02/33] drm/amdkfd: display debug capabilities
Date: Thu, 25 May 2023 13:27:14 -0400
Message-ID: <20230525172745.702700-2-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c331a0f-3225-4ba1-af4f-08db5d4560a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZGFQtn6SSXz90UYqKsXoaw1eWrh9Hk3uz4WQHHfx7jEEQK3kBLGhtAwhGRQ8c9oozFdGunhT6AKSHHAw5AKalMGqbz03Ag1xnvCQZum/rqJSMP534NboK96ZiCykOOrGbi6lUPJAnnTT12BRhVbZSRx7Uqhga+28aiSN1hD0gkakD2/JYkP0odlbrlVZj4GHunSZctsqzYLThALQ9PmixrtmDW5ThtPUxD4hKIWXRQhbOWBbFX84+u7D2mzzDcALfSOnS7XzzRKtM0+ggb1K6Uspxa55PP0Al7ORmJM0TZixZnXNwdvXDQ1a74czMHIALu8Hs618s5Kf5cZSlLesceAEXEBgwAAGhzFz2DJA7SY504IrYB0AbU0N2aP8y6AmixOzMKe1WZvd8zR/cdlmJpxHIluoPjcaGk7VIMVA7dZn3FnpVihbqiT77eVwGjawSALq653GI9P2wFB19LrJSDB5M1vLSB0DCudJN18O1i2sIcon3d7zhwlsj0+8fCKII8B0ajqCu1DleIov1kli+uUkmSefuGXQE0x/he5LeJZ07foAL24YQ6u5pGYskDpK+iAEX0OX9eA5qDex5Ks2Trblp+4QFXJJuhr3npNxG8xGY+lh/PE+I1JoVVUSmcRXUGeZCkVTjkCgQds6iO73AoK4prImS7afocmk2d86FWV5Sg+5k0os+/5vdD7aRl6sVAVL2Xv0fWyMW6kyuqoBdZbdewKQTMF424ZJhuCpO8JMMviKygEIAZ/44kGsDC1PCLNYJ1FVPVF3t7Wq2o9TPw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(426003)(41300700001)(82310400005)(110136005)(70586007)(316002)(6636002)(4326008)(450100002)(7696005)(70206006)(6666004)(8676002)(8936002)(5660300002)(86362001)(478600001)(44832011)(186003)(82740400003)(356005)(81166007)(40460700003)(26005)(1076003)(2906002)(40480700001)(16526019)(2616005)(83380400001)(336012)(36756003)(47076005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:27:55.7052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c331a0f-3225-4ba1-af4f-08db5d4560a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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

Expose debug capabilities in the KFD topology node's HSA capabilities and
debug properties flags.

Ensure correct capabilities are exposed based on firmware support.

Flag definitions can be referenced in uapi/linux/kfd_sysfs.h.

v2: rebase topology fw check fix with kfd_node struct update

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 101 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h |   6 ++
 include/uapi/linux/kfd_sysfs.h            |  15 ++++
 3 files changed, 117 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 8302d8967158..3def25b2bdbb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -535,6 +535,8 @@ static ssize_t node_show(struct kobject *kobj, struct attribute *attr,
 				      dev->gpu->kfd->mec_fw_version);
 		sysfs_show_32bit_prop(buffer, offs, "capability",
 				      dev->node_props.capability);
+		sysfs_show_64bit_prop(buffer, offs, "debug_prop",
+				      dev->node_props.debug_prop);
 		sysfs_show_32bit_prop(buffer, offs, "sdma_fw_version",
 				      dev->gpu->kfd->sdma_fw_version);
 		sysfs_show_64bit_prop(buffer, offs, "unique_id",
@@ -1857,6 +1859,97 @@ static int kfd_topology_add_device_locked(struct kfd_node *gpu, uint32_t gpu_id,
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
+		firmware_supported = dev->gpu->kfd->mec_fw_version >= 459 + 32768;
+		break;
+	case IP_VERSION(9, 1, 0):
+	case IP_VERSION(9, 2, 1):
+	case IP_VERSION(9, 2, 2):
+	case IP_VERSION(9, 3, 0):
+	case IP_VERSION(9, 4, 0):
+		firmware_supported = dev->gpu->kfd->mec_fw_version >= 459;
+		break;
+	case IP_VERSION(9, 4, 1):
+		firmware_supported = dev->gpu->kfd->mec_fw_version >= 60;
+		break;
+	case IP_VERSION(9, 4, 2):
+		firmware_supported = dev->gpu->kfd->mec_fw_version >= 51;
+		break;
+	case IP_VERSION(10, 1, 10):
+	case IP_VERSION(10, 1, 2):
+	case IP_VERSION(10, 1, 1):
+		firmware_supported = dev->gpu->kfd->mec_fw_version >= 144;
+		break;
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+		firmware_supported = dev->gpu->kfd->mec_fw_version >= 89;
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
 int kfd_topology_add_device(struct kfd_node *gpu)
 {
 	uint32_t gpu_id;
@@ -1967,13 +2060,11 @@ int kfd_topology_add_device(struct kfd_node *gpu)
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
index 3b8afb6aba79..cba2cd5ed9d1 100644
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

