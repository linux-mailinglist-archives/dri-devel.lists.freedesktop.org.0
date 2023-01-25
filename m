Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086C667BB3F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8C410E38F;
	Wed, 25 Jan 2023 19:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C869610E13F;
 Wed, 25 Jan 2023 19:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPflQqg3cBIdzzye7AOJUJmmTg3pG4/j1uH7YTN7nhhKjIujVFzqtKNRupzAh5lRQEzYN3rIDGdvSTBxFAfPhfaycEgZ9yBrZyS2VHkM/JBJqgb77WIKtdjCR9DDMGQpm1CN6F03zg6wCVzhPGuPymDt/TzRmtGB6ig13j//XiXXRdrnEwa8oSjOUP5QVE6HHLf0ght4zLNuFAsttg1RztIJCsK8FUIBJdheZkWgYnlldNgl7pRi82Ld1nS96Gkqrx1FZxARhC7+ThVjZYyGhu7OA+gh1cwj9iTk6E69UYPB8j5b/6xg5zmzaN1ZaQLDSni/j54TKmuzWYcqU8RvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXiK7Qd8TDq0my8EK/jQDwULr6pEjIzyWrlEJeKPf8c=;
 b=XAhdVLCaUcVXoLgXxhOEXgcrlfqCvo8B/cW0AMviiAVq20esIcs4nqKJLxJ9xmLEhuP8PWW4QgjbGUdEF9kA6rIUOyVtXpw7T83y/Kn8h+EtXH2DrcwmvHTWvfNxSzg/zZmbHBRfkRUeYWR+7Dmrd6T/yomlHIxu7r7rMnwJ6lfIIRE47eUd6Sb2zbzU98UjzQB8Ka/7KTksLHEJq5rbyaHznflIBGiAN+OL/rahEgp/1BeJztv7lJzHmXz8m+spvEDzavyE0Q+NI8odXx72Rh8m4fBp8ER2Oo3NeNO+VzAcHpx30o7evV43G30QtpwLYTYtrUuVELdUF+TFZcosLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiK7Qd8TDq0my8EK/jQDwULr6pEjIzyWrlEJeKPf8c=;
 b=kf5sfQXz0azkMHtoM6SAiT1a50xMjlclwa4K+QKWxFrvESUxcQNq5b0niJLxXlRJi1ARF4EKsjA5lnRDmJq/0Ls7qjFON/utxkbprSyOCdE349GFwhXIeO3mHKg0eG0oJCj3mfviO6XPCj7lUhbI7Qkvp5EYcfjP2RBapVqNju8=
Received: from BN9PR03CA0797.namprd03.prod.outlook.com (2603:10b6:408:13f::22)
 by DM6PR12MB4880.namprd12.prod.outlook.com (2603:10b6:5:1bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:16 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::58) by BN9PR03CA0797.outlook.office365.com
 (2603:10b6:408:13f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:16 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:14 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/32] drm/amdkfd: display debug capabilities
Date: Wed, 25 Jan 2023 14:53:31 -0500
Message-ID: <20230125195401.4183544-3-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|DM6PR12MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f519d7-5202-4d32-ecb0-08daff0df0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hl0fmeVNWsb6ayWCoUGS7gN6etbcGDS2cEttseuqxR0xAn1+lUUAUuHqiZ1/Wv6TBISvnAmZbs2jCxDU9jcVK5yWybkbvud8ADS1SHv7INCWBt8HTXPE3KWnS8VA4mzAaODVb/OeyfteP/LEx9gIiNb+arFNP30XLO2VCQx2+TuISToXLCh9rmoFChsr/5+oFNCKkcriWCqgMyFQvEuD5mzGSizjlcXmCpfVqLaJa2ZXUEBuSL5Z0hXrCLJHTXvcMifT/gC5Oog8YhDXsLWxawAd70oZY+ju8AWtIpjI8x//4dd/wA7L+YVjN7nJB7dqASyDwjvWkFi3ipMNaWWtyUlrfz9aJvgYKKP6y/JyJo08CUPKg2fW3MaLVAU2k/6fbBPgY4ElyxMDRzp++TBNy5OQRVM/DnOi6s3mj/HukENCH005sBlTW5KlNZskIUr3w4CJCF8kzypf6sgm7TUpo2Yli1YrPc61z5FlPRVdTno7mgzsO1BTgX127x9CptBaOQ3Bl0OjOuk+ZQRAAE4sjEW94fSDij5KQ6iEK3Mw91us/yzFpcq88tAZAS2BE2TufVsS/rJ8PwkNs8cVz0emVcC10Pgqs+xIvFgkY8zKzSgqXLl1E8gKesBXE4UZlvxdc2tOv67qNN9SUDxs72bDcNJIAshdTRTJ/2TTdilRMgo5NDs7tGuJlCCLc/BI7VrpXColTsrSPya0RWaMJRWdeh8LgjkwrGuNIyvIqgXZPmk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199018)(36840700001)(40470700004)(46966006)(36860700001)(70586007)(4326008)(8676002)(54906003)(450100002)(110136005)(316002)(26005)(70206006)(41300700001)(336012)(2616005)(8936002)(356005)(81166007)(1076003)(40480700001)(44832011)(82310400005)(5660300002)(40460700003)(426003)(2906002)(16526019)(36756003)(478600001)(86362001)(6666004)(47076005)(82740400003)(83380400001)(7696005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:16.3793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f519d7-5202-4d32-ecb0-08daff0df0b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4880
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

Expose debug capabilities in the KFD topology node's HSA capabilities and
debug properties flags.

Ensure correct capabilities are exposed based on firmware support.

Flag definitions can be referenced in uapi/linux/kfd_sysfs.h.

v2: v1 was reviewed but re-requesting review for the following.
- remove asic family code name comments in firmware support checking
- add gfx11 requirements in fw support checks and debug props and caps

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 101 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h |   6 ++
 include/uapi/linux/kfd_sysfs.h            |  15 ++++
 3 files changed, 117 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 3fdaba56be6f..647a14142da9 100644
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

