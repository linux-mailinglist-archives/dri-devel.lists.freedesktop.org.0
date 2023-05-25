Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1550D711261
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA71C10E724;
	Thu, 25 May 2023 17:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632DD10E6F7;
 Thu, 25 May 2023 17:28:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQrLS1PCrtMylVmz24apCdptoBRlBPM4SSUVhpJCEGtzI7wTu5rLOrwWmy0cbA7OWlG06kIeGJ1DD+DERtaX/ly5ZuN6zpZy1Gg1mmQXrRcjhm16bxDHy42fqXi3iiONeUQW5X+wPMiDxS2hJc2X0aZn3Ha8puQGIIwLYwGhMI5zD8tdiTiCA7mlzzK1HxeAVmILfjO+ZrUDSrAAGwJHnDGbrF1JeEoigNEuHAgHxdNjF3uUuMLuNezrIkmuGNRXCVBVZiNKi0WunGBL8TaYAnWlbbcjcyUa9IEyQYqr/ykKxlNQyWKq3yU6I0meLGLTYESTgCQdnXB13HXKueIg4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6IXquDzBJBjrhQFVCSYTrfZafus6GoUwSUr0O8lqL8=;
 b=kv6vixXxwhpSuCjBOko7w7WHYFArNkPxTGXjSpp8x0ka/QUGAYHDoxYqraDaA6iKfZIEHSxZb7AUHJEVq/7WVg/HjrBVyV3wTpPyI4KiHtqOZplrHhwDVxLqcYjtUk6Io0lzDwpOwYB3ML3eTtC+eVVKZr90ciaCZOM+OhGPsdFLBDPPzDl3NT7CaNA8Sv7TMicRkbFo+pUKqGVJHBs5758ogG3DZuRLwraShqV+5usbwNxzw2Nr/Hd1qRfC/LVfKAOcXo4SU+31bBrcclsZX0GJ7YQ+fuS+ve++t1Ct7QDsgvizkwHvsFMtMlG2DP14yrv2QjHyDJM572iBCYckow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6IXquDzBJBjrhQFVCSYTrfZafus6GoUwSUr0O8lqL8=;
 b=mQ0QrpHeaVcEFQj2KBFl2BKEkXKtMi7sYcGzXfG5CYdwyiXRJH5ytyEfZzNi1uqiQjdk+g+MX9xk9c1OibdDjNfuwwZnrfQrlcujEt2jW4rhWSdR6bS5J8H0/fvq+6mNWw3LyfqtuNZYbZohy963NowuSBqxatbKnYhcSz5hclg=
Received: from MW4PR04CA0214.namprd04.prod.outlook.com (2603:10b6:303:87::9)
 by LV8PR12MB9153.namprd12.prod.outlook.com (2603:10b6:408:185::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:28:09 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::ad) by MW4PR04CA0214.outlook.office365.com
 (2603:10b6:303:87::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:08 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:07 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 30/33] drm/amdkfd: add debug query exception info operation
Date: Thu, 25 May 2023 13:27:42 -0400
Message-ID: <20230525172745.702700-30-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|LV8PR12MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 26780341-1fa6-4615-cd17-08db5d456840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sIUd19pW1/9gpllDawqgi7TVhLid9EkqmKixLrjL7RjfDEnpIF17qwK4A3PPZA3AySKVK0qrORvNMtthRPRpXvW7Lk/Ys0V5LaXG2sm3T6uuaxaNlruog8TtCjZ3938e/saDQ2V1oPwIihhCDetJyoVRyFBM5QFUED2h4XoCNjN4GVO2V4gVcEVVXgb7GwZ5OjRyWWtZMJmLdJYwygznYL2zENEHD0+LirqDS+9xW+bflRy1XrfDx/CucNOt6zRHzTKv9lsUzRk/FK0IvpzPMNbcS/7Kxw8Yor1zNwCP/1MN/XaWGe8Lhke4eqw9SDl1bZSMNrzzj0zF8jbBE7Bc8yVWreDby5+ZJIyCnfMHYZw8qvwtP1wyZOMh222MJPRSP7qkLl+yzMuW+GONHwH82qS7EEiXb9mqpOELIyCdDcMWQY89/N/8kqzy9oKiTW3gZmhQdYcYVs0xrbsfE6QBPAEGs7MfsRY4894ASps3vKLEngidC8VAvAVkRfMGBiDckZzk/3ddBjqHC6aRFmVWJbw/Xq7MfsZeFBv7bH4LKGHR55fYbjzDf7oldfzf9Mv4e2j3KZVnIuAdETSzBLUKRYZHqA0+z2jaQhYwLmLUXYEZxP2wODyloWkI7QMQh/XhnkyJmPgArQfT0uDZuUkaDVzmuMmevZYdUxt2a8v8qV9nZxuFl+M4a2wwvAPhMSP2A/Fv0/1pt9avU7BaLM/Lelo3MuLq6wmilX6BUre3MCS049TYyC0XQNMJ+cXuuWN8K5HRMG6QE+EV/Ftnm7jA9g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(40470700004)(46966006)(36840700001)(450100002)(41300700001)(7696005)(70206006)(8676002)(8936002)(5660300002)(70586007)(110136005)(1076003)(44832011)(4326008)(6636002)(6666004)(316002)(478600001)(26005)(40480700001)(186003)(16526019)(40460700003)(83380400001)(2616005)(2906002)(426003)(47076005)(336012)(36860700001)(356005)(82740400003)(81166007)(82310400005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:08.4854 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26780341-1fa6-4615-cd17-08db5d456840
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9153
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
index ebb2088d12fa..00aa844762b0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3045,6 +3045,13 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index e9530e682e85..24e2b285448a 100644
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
index e78f954c0684..234e2ccafa87 100644
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

