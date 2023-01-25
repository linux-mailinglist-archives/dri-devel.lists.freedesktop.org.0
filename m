Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F867BB6E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E3C10E84A;
	Wed, 25 Jan 2023 19:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0EF10E391;
 Wed, 25 Jan 2023 19:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpeQqs3Gky7L1nLFvNpWsg4807GLjK8p4SuoDANdEbEqX0fgbQk1Id/uUOyidI/aEXACpEs3tJi/Jff4M04m9jgfHy03hhwrHTV4cq1keitE56w0RLaeMwF0TsXCldxrnEYM6j9TDogjSmcmNOsACyTXXszjYWy7ZoVP8Z2v/KVWNEvmaQLZbHpTf94dTO/2ZIPWdwhZbzhp7qDiaUkPQa2DuRSZptkexalzd184U/arRx81i5gBzpGu0DVXQy1qGVxj03txqUUhbYLX4my6hYAwuA28lump0guVs6LICfzaEfehIBSSnOR7eUVY6PDD0pjcueYS26sYQzkBjvHSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AuQ9pJdvu5KsjraaRZaGB+X8L97WqCpfM8DSzjkT7Y=;
 b=FQmTo5lEMWtQ7aYZ6wTrPH6HiQ64gyD26fG8LX2ZoRMcsKQ5kAgcIBzcB9lv39wHRsSRq5GayUz8dNhw0DsSKmGM7VN71vZrlFGN4BEJbcRFuB4wCwlP6qVFbjBC4S85N4R0zemGH6q/7PSQxH/4xe5uVC4eb6C1JBKqBlV8yxD9VZnA6JJYBhrssiH47xNpQQKSoQLEC8Ml4krnzd0Tn88dnvdfgc1y4VtpxAap4J83snqDt2exo2Uk5kyQPmFW45qn3F4G6FhsyWIqQ0hsDJu1yq5r/H6F3XwLSSZFqeJRFm2W8imtXi5QcnOZ2Uo91rZ7tkAXIJOVDQJg9p95iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AuQ9pJdvu5KsjraaRZaGB+X8L97WqCpfM8DSzjkT7Y=;
 b=WzwAlMTwZVJ/JsT54Y2LlIWcwlm6uB0t+i2FDCbUx/TcVEof6HtdNL3IsrsHXsqf++lz6ztSlgnXNphm+OE2+FWUdmMlfuAL27LsM6q9UM1Z6scP/gBxn/8vShtuQFgZn+EkOcb+Kb/07RxZK+daUF/BFflIKk+Eq3B7lOvKQl8=
Received: from BN9PR03CA0694.namprd03.prod.outlook.com (2603:10b6:408:ef::9)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 19:54:28 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::5a) by BN9PR03CA0694.outlook.office365.com
 (2603:10b6:408:ef::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:27 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:27 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 31/32] drm/amdkfd: add debug device snapshot operation
Date: Wed, 25 Jan 2023 14:54:00 -0500
Message-ID: <20230125195401.4183544-32-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7d5c68-9a38-4305-ad31-08daff0df77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2mGBZToE+TCeoT+Sci4kWPCUrTtcmCFqObNKBD9+NLzR92iMGasJF9VpIkPbVyX5m0CvGNpoCRbh8/Tid2c9kn2XCMkbwOFKIk11YZcmSaUDpyMKJ5Kw7lZNpaUX8Z412PksTp8NB9MDskiN7nn2v2xo90bG4g1RHjnFOJKDBLoqP6uUf3H1H9l4McthQcOithmZ9El2ZpQYu3kF4930/L+rgZn6gEsBA6GNaYvpochhp256JFIj3fciu338tah0QGOC6Lz8pK+bRJhEDKsZGa85vVSqGQSYJu13Kl92CItdUbxOY3Pki1doVisAdRg7HQuUMgkPWLiy9IWgnen9OxaLKcFx4TOcWbB6O/bcGjncxsn7N6RMNiohqtOIWYmD/KtlG0GTtPOeOIQzc/Abt6gpbJsg9pPl0/b4QOA4yny0KgodCaDwLd1jkZb3/N0Bpf+/Hvqexp35IGTj8y4Lh/LXYlUi+5r6BWVcAceyINc/an+eaaT6MqbK0px0d3vbhJMgoh9nsiVcq5xQ7od0gJyrgjNRCnd1cT6ntTkDgQ+qAWKrXnBk/8kH6e/J/jBJKqhEtm1IPCrBIl/1LGas+/wlRE3r0JZNOYhtMNrPoQg3LCX6HKrWNfnG6FZ5yd3lS5/3/zBexleWwSsIrXneMrsgMmen6QE9q9kd1G4QhFXFbFZD/GTWzLFq1fajVV1DqZqVy/HWWlQBb53o3GUPs2mR2s4aELP3O20VNn7CDNQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(47076005)(186003)(36756003)(8676002)(40460700003)(16526019)(81166007)(40480700001)(356005)(36860700001)(54906003)(2616005)(336012)(86362001)(83380400001)(426003)(26005)(82310400005)(41300700001)(478600001)(5660300002)(6666004)(316002)(44832011)(7696005)(1076003)(70206006)(82740400003)(8936002)(70586007)(2906002)(450100002)(4326008)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:27.7875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7d5c68-9a38-4305-ad31-08daff0df77f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
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

Similar to queue snapshot, return an array of device information using
an entry_size check and return.
Unlike queue snapshots, the debugger needs to pass to correct number of
devices that exist.  If it fails to do so, the KFD will return the
number of actual devices so that the debugger can make a subsequent
successful call.

v3: was reviewed but re-requesting review with new revision and
subvendor information.
memset 0 device info entry to clear padding.

v2: change buf_size are to num_devices for more clarity.
expand device entry new members on copy.
fix minimum entry size calculation for queue and device snapshot.
change device snapshot implementation to match queue snapshot
implementation.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  7 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 72 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  5 ++
 3 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 93b288233577..da74a6ef4d9b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2972,8 +2972,11 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				&args->queue_snapshot.entry_size);
 		break;
 	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
-		pr_warn("Debug op %i not supported yet\n", args->op);
-		r = -EACCES;
+		r = kfd_dbg_trap_device_snapshot(target,
+				args->device_snapshot.exception_mask,
+				(void __user *)args->device_snapshot.snapshot_buf_ptr,
+				&args->device_snapshot.num_devices,
+				&args->device_snapshot.entry_size);
 		break;
 	default:
 		pr_err("Invalid option: %i\n", args->op);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index db316f0625f8..d1c4eb9652fd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -22,6 +22,7 @@
 
 #include "kfd_debug.h"
 #include "kfd_device_queue_manager.h"
+#include "kfd_topology.h"
 #include <linux/file.h>
 #include <uapi/linux/kfd_ioctl.h>
 
@@ -998,6 +999,77 @@ int kfd_dbg_trap_query_exception_info(struct kfd_process *target,
 	return r;
 }
 
+int kfd_dbg_trap_device_snapshot(struct kfd_process *target,
+		uint64_t exception_clear_mask,
+		void __user *user_info,
+		uint32_t *number_of_device_infos,
+		uint32_t *entry_size)
+{
+	struct kfd_dbg_device_info_entry device_info;
+	uint32_t tmp_entry_size = *entry_size, tmp_num_devices;
+	int i, r = 0;
+
+	if (!(target && user_info && number_of_device_infos && entry_size))
+		return -EINVAL;
+
+	tmp_num_devices = min_t(size_t, *number_of_device_infos, target->n_pdds);
+	*number_of_device_infos = target->n_pdds;
+	*entry_size = min_t(size_t, *entry_size, sizeof(device_info));
+
+	if (!tmp_num_devices)
+		return 0;
+
+	memset(&device_info, 0, sizeof(device_info));
+
+	mutex_lock(&target->event_mutex);
+
+	/* Run over all pdd of the process */
+	for (i = 0; i < tmp_num_devices; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+		struct kfd_topology_device *topo_dev = kfd_topology_device_by_id(pdd->dev->id);
+
+		device_info.gpu_id = pdd->dev->id;
+		device_info.exception_status = pdd->exception_status;
+		device_info.lds_base = pdd->lds_base;
+		device_info.lds_limit = pdd->lds_limit;
+		device_info.scratch_base = pdd->scratch_base;
+		device_info.scratch_limit = pdd->scratch_limit;
+		device_info.gpuvm_base = pdd->gpuvm_base;
+		device_info.gpuvm_limit = pdd->gpuvm_limit;
+		device_info.location_id = topo_dev->node_props.location_id;
+		device_info.vendor_id = topo_dev->node_props.vendor_id;
+		device_info.device_id = topo_dev->node_props.device_id;
+		device_info.revision_id = pdd->dev->adev->pdev->revision;
+		device_info.subsystem_vendor_id = pdd->dev->adev->pdev->subsystem_vendor;
+		device_info.subsystem_device_id = pdd->dev->adev->pdev->subsystem_device;
+		device_info.fw_version = pdd->dev->mec_fw_version;
+		device_info.gfx_target_version =
+			topo_dev->node_props.gfx_target_version;
+		device_info.simd_count = topo_dev->node_props.simd_count;
+		device_info.max_waves_per_simd =
+			topo_dev->node_props.max_waves_per_simd;
+		device_info.array_count = topo_dev->node_props.array_count;
+		device_info.simd_arrays_per_engine =
+			topo_dev->node_props.simd_arrays_per_engine;
+		device_info.capability = topo_dev->node_props.capability;
+		device_info.debug_prop = topo_dev->node_props.debug_prop;
+
+		if (exception_clear_mask)
+			pdd->exception_status &= ~exception_clear_mask;
+
+		if (copy_to_user(user_info, &device_info, *entry_size)) {
+			r = -EFAULT;
+			break;
+		}
+
+		user_info += tmp_entry_size;
+	}
+
+	mutex_unlock(&target->event_mutex);
+
+	return r;
+}
+
 void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
 					uint64_t exception_set_mask)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index ee12de5f7adf..b31e453704fc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -81,6 +81,11 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
 }
 
 void debug_event_write_work_handler(struct work_struct *work);
+int kfd_dbg_trap_device_snapshot(struct kfd_process *target,
+		uint64_t exception_clear_mask,
+		void __user *user_info,
+		uint32_t *number_of_device_infos,
+		uint32_t *entry_size);
 
 void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
 					uint64_t exception_set_mask);
-- 
2.25.1

