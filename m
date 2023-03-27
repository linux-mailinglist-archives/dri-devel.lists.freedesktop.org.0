Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233516CADAB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA35410E70F;
	Mon, 27 Mar 2023 18:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D160C10E6CF;
 Mon, 27 Mar 2023 18:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIsyj3fMcSxpMxqL7xX+VwcoGasMcLz4DLzAzj74+H1wevHwWapSHDPijRMxa3MrTiU4cXjZZusSjG3hv4TStMbWN11orQwKRF+55mb3zzIg5vT1lDl0JLsSRe2xNBwmw9y67mTDGUPUmECI5XPW/NQ9u/9ztF8lSpaVg5cWKvh5rJWM77ZPlxXoNs578IMSauybpwi+eHzRCKnEMaIjU8mF0knmPRfWLfh3bMnsGCfmwh0LxAZzo2CkQHj+JxYUIZaA8S2XHvSSo8Fzld5sngBFzDbVXzW9eawuqsnTo3jmQGO8QkU/a+QBP2ENMgsb/gJ6zVnpaw9yR9Qby6g55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zuapuMM1VpgW2Ek2XjUZy1rGvI/2uEJfrbFLhFH3r0=;
 b=dTU1LoFLeFpLrB+r50rEAlEKURzMVCdJ63cSze2/v0obOHsoHxtNrJErmAB1Ak8S4gGMkdA3CKqU8olDQpOErVsDrtVmzERVAXnchNobvUY9U3ImxDccxKynvw4AbljXqk13z2C1kaKDDyYhGauGS9sBWKXRPAki6HqYKVgY8hwWkC8l2u321m8ceGQ6sHWLTmb+D1C86etpsfGmfKPIi8Ok78tRbeP+cJS/qmI/Q2yTAoQSAcYhMSgUP6OlInf5Mo84QnoJEAWqkEH+0a9eRRs2/NOif0F2pwu1tVup+4w3jS2Q/Bw9MtrSmBUAQD4rSCaCNgbZby75x4DA+xatZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zuapuMM1VpgW2Ek2XjUZy1rGvI/2uEJfrbFLhFH3r0=;
 b=mP2sh6+vG0Px/caA6pEDdQZw6kXx2BsWnIz+8axaFPjhCsSnfa2fwl7a+hVBKv/I9iz9LPXby24F1jhv0Ra5wyfoJPmcyYKaXGXIzeXXJuYqUBYKMGzW9QckfNCsCj+H9XajAs0RhmxKdJQXsAdPWSnJ8wCjDfyvm0Ca2nOHI1o=
Received: from CY5PR15CA0070.namprd15.prod.outlook.com (2603:10b6:930:18::6)
 by SN7PR12MB8172.namprd12.prod.outlook.com (2603:10b6:806:352::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 18:44:01 +0000
Received: from CY4PEPF0000C979.namprd02.prod.outlook.com
 (2603:10b6:930:18:cafe::2a) by CY5PR15CA0070.outlook.office365.com
 (2603:10b6:930:18::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C979.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:44:01 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:59 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 30/34] drm/amdkfd: add debug query exception info operation
Date: Mon, 27 Mar 2023 14:43:35 -0400
Message-ID: <20230327184339.125016-30-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C979:EE_|SN7PR12MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 66683269-37d2-4f5b-b193-08db2ef33b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7vat2hQ4eCjROE9vXc3PHD8ePrKyVJ3w3Kyb9YXUvLlE2XZG2QjLhZX3ndb45Qb9A2tuas/xHdhSoe18vpCY5rsnwYJIcKATegvbXSDnYVZSwnJRQIR8n6tfOOo0rVehMjRnxdAzudugDsNEh2xLQjW32KsaSHOOL19noLiVuRsa5ETgd9EuPhqTYmvuaGb9jm9bTJRgGSnhVbOVmwXnt0YryGvVEl4LxdzpaqJYYQ80CHJdFdYlkTdrUE0yAGTI9tJ4+0yf4+J+kkxM+D7oi3soygceoBw4297sx5NlbnZhQH4pzmB+77QtINXaZqcaIXXD1gPRsNakF2M+zf2QleVnlCm4MtA4i+JV+/M0rPS+DiP+GBBCJxCsznVeOloY3ObAOKHynDR5QnKWppmza7ZVNYiGUm46sYlfiM7NJM3FTq5HBWCZcd10BItY7fFMxjmH4jl1KpXckv3kkECySUW+qgkoIQfw+gYsYvfRP18LpCK0ii9O6FB1s3Q7SiwuSDErB4IwAAnjqIJflnLsgSbqwbuimEqdA4JWWh+luWrOocdlq+jT+rwxCZCXaALW07u6ywMJnx5UimOzN5fTTYNLOMLXYNcB7UJGbWrM8U9+bGRUSlDEbPKv+nqW2fZaVtkPpxaGVDGJMxGfHKjqX18/pui6+xtdK9ayXL3MIaSfnYHUWlKIEKjk6zACeiQM94NC/rbXrrGfmkcCSQM5yvADlo2vhkXo/YlaFaJ6qc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(86362001)(82310400005)(36756003)(2906002)(40480700001)(40460700003)(478600001)(426003)(83380400001)(6666004)(336012)(26005)(2616005)(1076003)(7696005)(47076005)(110136005)(54906003)(4326008)(36860700001)(70586007)(70206006)(316002)(81166007)(8676002)(450100002)(41300700001)(186003)(82740400003)(16526019)(356005)(5660300002)(44832011)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:44:01.0021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66683269-37d2-4f5b-b193-08db2ef33b5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C979.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8172
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

Allow the debugger to query additional info based on an exception code.
For device exceptions, it's currently only memory violation information.
For process exceptions, it's currently only runtime information.
Queue exception only report the queue exception status.

The debugger has the option of clearing the target exception on query.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   7 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 120 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |   6 ++
 3 files changed, 133 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 593ede6b2af5..1f7e57abefb4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3031,6 +3031,13 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				&args->query_debug_event.exception_mask);
 		break;
 	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
+		r = kfd_dbg_trap_query_exception_info(target,
+				args->query_exception_info.source_id,
+				args->query_exception_info.exception_code,
+				args->query_exception_info.clear_exception,
+				(void __user *)args->query_exception_info.info_ptr,
+				&args->query_exception_info.info_size);
+		break;
 	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
 	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
 		pr_warn("Debug op %i not supported yet\n", args->op);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index e7f1521ac593..905182669559 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -890,6 +890,126 @@ int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
 	return r;
 }
 
+int kfd_dbg_trap_query_exception_info(struct kfd_process *target,
+		uint32_t source_id,
+		uint32_t exception_code,
+		bool clear_exception,
+		void __user *info,
+		uint32_t *info_size)
+{
+	bool found = false;
+	int r = 0;
+	uint32_t copy_size, actual_info_size = 0;
+	uint64_t *exception_status_ptr = NULL;
+
+	if (!target)
+		return -EINVAL;
+
+	if (!info || !info_size)
+		return -EINVAL;
+
+	mutex_lock(&target->event_mutex);
+
+	if (KFD_DBG_EC_TYPE_IS_QUEUE(exception_code)) {
+		/* Per queue exceptions */
+		struct queue *queue = NULL;
+		int i;
+
+		for (i = 0; i < target->n_pdds; i++) {
+			struct kfd_process_device *pdd = target->pdds[i];
+			struct qcm_process_device *qpd = &pdd->qpd;
+
+			list_for_each_entry(queue, &qpd->queues_list, list) {
+				if (!found && queue->properties.queue_id == source_id) {
+					found = true;
+					break;
+				}
+			}
+			if (found)
+				break;
+		}
+
+		if (!found) {
+			r = -EINVAL;
+			goto out;
+		}
+
+		if (!(queue->properties.exception_status & KFD_EC_MASK(exception_code))) {
+			r = -ENODATA;
+			goto out;
+		}
+		exception_status_ptr = &queue->properties.exception_status;
+	} else if (KFD_DBG_EC_TYPE_IS_DEVICE(exception_code)) {
+		/* Per device exceptions */
+		struct kfd_process_device *pdd = NULL;
+		int i;
+
+		for (i = 0; i < target->n_pdds; i++) {
+			pdd = target->pdds[i];
+			if (pdd->dev->id == source_id) {
+				found = true;
+				break;
+			}
+		}
+
+		if (!found) {
+			r = -EINVAL;
+			goto out;
+		}
+
+		if (!(pdd->exception_status & KFD_EC_MASK(exception_code))) {
+			r = -ENODATA;
+			goto out;
+		}
+
+		if (exception_code == EC_DEVICE_MEMORY_VIOLATION) {
+			copy_size = min((size_t)(*info_size), pdd->vm_fault_exc_data_size);
+
+			if (copy_to_user(info, pdd->vm_fault_exc_data, copy_size)) {
+				r = -EFAULT;
+				goto out;
+			}
+			actual_info_size = pdd->vm_fault_exc_data_size;
+			if (clear_exception) {
+				kfree(pdd->vm_fault_exc_data);
+				pdd->vm_fault_exc_data = NULL;
+				pdd->vm_fault_exc_data_size = 0;
+			}
+		}
+		exception_status_ptr = &pdd->exception_status;
+	} else if (KFD_DBG_EC_TYPE_IS_PROCESS(exception_code)) {
+		/* Per process exceptions */
+		if (!(target->exception_status & KFD_EC_MASK(exception_code))) {
+			r = -ENODATA;
+			goto out;
+		}
+
+		if (exception_code == EC_PROCESS_RUNTIME) {
+			copy_size = min((size_t)(*info_size), sizeof(target->runtime_info));
+
+			if (copy_to_user(info, (void *)&target->runtime_info, copy_size)) {
+				r = -EFAULT;
+				goto out;
+			}
+
+			actual_info_size = sizeof(target->runtime_info);
+		}
+
+		exception_status_ptr = &target->exception_status;
+	} else {
+		pr_debug("Bad exception type [%i]\n", exception_code);
+		r = -EINVAL;
+		goto out;
+	}
+
+	*info_size = actual_info_size;
+	if (clear_exception)
+		*exception_status_ptr &= ~KFD_EC_MASK(exception_code);
+out:
+	mutex_unlock(&target->event_mutex);
+	return r;
+}
+
 void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
 					uint64_t exception_set_mask)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 4f2195d57ff0..ee12de5f7adf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -63,6 +63,12 @@ int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
 					uint32_t *watch_id,
 					uint32_t watch_mode);
 int kfd_dbg_trap_set_flags(struct kfd_process *target, uint32_t *flags);
+int kfd_dbg_trap_query_exception_info(struct kfd_process *target,
+		uint32_t source_id,
+		uint32_t exception_code,
+		bool clear_exception,
+		void __user *info,
+		uint32_t *info_size);
 int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
 					unsigned int dev_id,
 					unsigned int queue_id,
-- 
2.25.1

