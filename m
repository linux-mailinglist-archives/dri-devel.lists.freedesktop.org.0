Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB3D6CADAF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B37B10E70A;
	Mon, 27 Mar 2023 18:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2F610E6BD;
 Mon, 27 Mar 2023 18:44:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQhUT1vggHioeB35ljQNnKwpZx+Ozib581S3t0p3tjgW5N/EvngWqOzzx9AIfuEVhtQ7/aiFbRu+kuXZDGc1+JJYreSf53Gui6cO9xFR8OxFjdmDI08myCaebIZ2s8ZQQ/baFaV4lMsfBjlbCWJnhChxanSlclbiC0HI25rQoLZKFZ5XGeg9vzjvqyvZlZ5zXIqyWtpuX3wSfWtkHh/2JI3u1GoOMmAsF7DI/dljtLkgc1kV8p1R8aBsxPMezfdbIvgHV678F3eQ/63ktD6rbTZhZuE26NnWuy+m0ySCWyYa9aHzFlRtGOCurBZixh25Pn308VOpmDyRwaS3BcAs5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvoHuHBU3+VWlSKSqjT2UflZII2A0EcktjRBrKweCEM=;
 b=PI9TTl24e4D32JruBqT01xFpTsm5eRUQHQfnuAyPgc7F21wwz+IlYb134ISIm3rfKr3sW2kyf0ElKjHD1ZE/hZcSzllQOZp/3BWwj1RqsbeAMQ8FaurgToRk9h10Ql77Nt6UNKExVCMt9lllxBK5/rY1WnWevrXhgKtqRZmx7iTJoOBEYCR1WO9nOKUrRNCzzx8+mYDXRkCa78irs74Wzo8k+yKth6yvf80mrPReFTlPD95UKM5FNi3oI7qdwrv3j5pc2ElsaKHF8l4iS5POVVRlH2BAmstyZhxozFhQqcMfZ6TDU3VAtKxYFmLiJXZUkqo/+fzWa8uHMmL58fw7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvoHuHBU3+VWlSKSqjT2UflZII2A0EcktjRBrKweCEM=;
 b=0CehQsmZCvbEMwV43Dv3P2OXZLRmDC9dwkVq+asQG0xTFEtsQZiSjLXqXMdAuIhcA/jIIT85D4pdbZ1FjKVeZq/Z/75fj7F8yLM1cxlmhrEJ7FteJgZ+tQ8rqmNXBmkjKIibPQYZOlWidyQ0kW/lvQWDr2JsXD1kBtpRHT9g8iQ=
Received: from CY5PR15CA0061.namprd15.prod.outlook.com (2603:10b6:930:18::24)
 by IA1PR12MB7568.namprd12.prod.outlook.com (2603:10b6:208:42c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:44:02 +0000
Received: from CY4PEPF0000C979.namprd02.prod.outlook.com
 (2603:10b6:930:18:cafe::8e) by CY5PR15CA0061.outlook.office365.com
 (2603:10b6:930:18::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:44:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C979.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:44:02 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:44:00 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 32/34] drm/amdkfd: add debug device snapshot operation
Date: Mon, 27 Mar 2023 14:43:37 -0400
Message-ID: <20230327184339.125016-32-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C979:EE_|IA1PR12MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: af1ffece-7dad-42e4-e4f4-08db2ef33c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bGmBsfOIf7WuzytZNFK5izaSCtSNe/3f9KSI/AQjL1DG6tPpsIZdIbFevQ5jZeps8wpXYMrvt2REoJTyfBJz/nh1H+qWjU4OoWfFJDWXb96YDbwifnUyb0u2EZZdP8uFETvxClPD28f/twYRr/4Z4YgZJZ0H95+Jd9OJwkpPUjnrOM3bXejd3ILKCudh+85B8mE6gvL3XEvmzEMG/+G0shfGNpU0Dconk0lropI8A/xc1Bo1OaxCAh/9N0eukZ2qMXVEYxsyPHUzCjVEU7DTy1cwZD3R8NszmAD2nFCU08SMrrE+fXCquLCaeCW+DuOHsugZwz559G/et7o1Dq+hHFySE4R1oUjmop4PwTUSY31wXmzo0+2XIjrWHHnMrgGtg8J5z5606KpWNG26pwYIyD5Mji5Sv53fNZBpjemOk67BZ87TffhousvabBI0EkxNkGGZWFFmXJdCHT9DdI6JLNtnlMHvN6VL7L2KkSUogDqiIrHfwseGcW0VWV8VXPgifgl3a6vbABVwuUCbRVp7X65N3hKcaZ/gykIzv//rgZwubFud1PJkGSkg9MOlLtZXxozp0td3sjpchwTXUC41wxiLmb7pHNUQbbc0h+8j3omid1Sw0KYmbsb2jIjaXWfSu0+5HvRWUyZDfPN9i48FphkUSwlSJtyokU/G7L/MB24M/7XJF4yZBOpgnDcy6pIUqWIBLROSB0RoO26ANsDGXBgkwxhtM7GoZsdMUmLRyIA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(110136005)(6666004)(316002)(478600001)(54906003)(26005)(1076003)(7696005)(8676002)(70206006)(70586007)(4326008)(16526019)(40460700003)(450100002)(81166007)(82740400003)(2616005)(41300700001)(8936002)(186003)(40480700001)(36860700001)(5660300002)(36756003)(2906002)(83380400001)(86362001)(82310400005)(356005)(336012)(47076005)(44832011)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:44:02.1896 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af1ffece-7dad-42e4-e4f4-08db2ef33c14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C979.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7568
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
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  7 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 72 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  5 ++
 3 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 7868a0aecc9f..3254274bcee0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3046,8 +3046,11 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 905182669559..0ea85afcffd3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -22,6 +22,7 @@
 
 #include "kfd_debug.h"
 #include "kfd_device_queue_manager.h"
+#include "kfd_topology.h"
 #include <linux/file.h>
 #include <uapi/linux/kfd_ioctl.h>
 
@@ -1010,6 +1011,77 @@ int kfd_dbg_trap_query_exception_info(struct kfd_process *target,
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

