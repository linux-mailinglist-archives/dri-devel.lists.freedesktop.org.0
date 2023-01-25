Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6867BB79
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA5510E858;
	Wed, 25 Jan 2023 19:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537E310E81E;
 Wed, 25 Jan 2023 19:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0GXyTQIZijTCXJFBR56Mjg1+CMVgT2lUUI1radJm54zsqkOjYZbr254QAPXGqDrM9x4UQMur2vMX5HCrDsvIQB0coiZenn948T+0mvOsP4+1pUysNlFnXYOa0zzKe6ymSmhCQjxB0O5eAgfZtn5GKdzwGBEdIjCMqSUfHzV+IHGyvWSmMRBmaY/7G6piAFnIaWR3r1c2TA8tJ9E5tt1eaj1h9mSrKGoe6UkVJGpdRMiA9Q8zWo9Ran3gxsTHnfZ68/vzG3/94ycvgONgMAL7mwcnMvb1jxmeMeIYcLmCdLzoBMyZuuG5AINNHanYPSLhL0yguztKhWnryisf4vTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPQvAchn7a94AYTSuxEtiEUdDU7fdZqEW1tahc0f8uA=;
 b=aHEHlBN4fVCitu7+SKFnFIdoGRYJJX6vwaxYGFM0hHyRzeHo6GG7dqvodqWxT9GJkNeMfAEo8aIGr/5eOyTnesqSj5A84sf0Wz1zSBsl6l/peDk7vaVOv3V3mjjj/X18WX3nAPJWL5jrqjj1dkxz/AnDQoFOx3JEuWBQvCCGVkbC+wSVd6GvaIEaLgK6IGSnizy3IzuOrcK23P6s11uuQIZQD42pMRRJNXPOTsauWmFWA1OSzgNns0NK20duMFJvoI3lJPmASbngpoCTCSLPzb2lf89xpZK/LI1aoCmdy5fzTbqwHd/aF4gJAZU/Hi10ddUKwLiOwGl7+zcEQ9bX0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPQvAchn7a94AYTSuxEtiEUdDU7fdZqEW1tahc0f8uA=;
 b=iTYXIoQmx+0XQTo2G1xubIgbghj6t1AmyUtj+reoMa6xxk+hx3VhcW5xwAy7xl7lrC3SAHwHZi8K9ERaz5lay/BAH6oX9IIwrlRBRkkG7JlsE6rDmLYVWCrLcOIbcULPy0z//vsJu6bJrH4ZnXqpLmZJkukkpPfJNURlXYYV7HQ=
Received: from BN9PR03CA0704.namprd03.prod.outlook.com (2603:10b6:408:ef::19)
 by CH0PR12MB5345.namprd12.prod.outlook.com (2603:10b6:610:d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:27 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::44) by BN9PR03CA0704.outlook.office365.com
 (2603:10b6:408:ef::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:26 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:26 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/32] drm/amdkfd: add debug query exception info operation
Date: Wed, 25 Jan 2023 14:53:58 -0500
Message-ID: <20230125195401.4183544-30-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|CH0PR12MB5345:EE_
X-MS-Office365-Filtering-Correlation-Id: df827292-a7b9-4c7b-c9f3-08daff0df6f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7NDjVDCjGJlkacdsjMb+6qyM/YQx2hvAaqM7wOUuxEVdOTVvnR5J4J9NDPv4PrRXy92pdQ/aI4fhB3ToYyNgYPKPl5yKvzhfWAC6R7Xy/kd9Xco2L6kSHjcV4Mczg9Q2fzUOrxyPIi2Qy8HN4Qm6cP+YNNNXSuLKvazYYQ9VigSGFaO+XLayftfBMdawFcQHXo3ojL0jtDIaR0AWakV/Q9raxmAP96un4OGmLIwLrIqKsj65Q+runU50ol/sBYETaWjhjrDirrg0XvGdl1aRQfLU9dK93ZCkxfjjOr9lkuK/Iwc8SRA8hBcoVmB3QHRGtlo97NP6GJj7eIroGe9vaICzOQgzmZCdSd6PI2dauDOR9to+kYNarJkIgDoT5XE98PAWIuhJwdI/NEuphVxdIQenD16+WKs1zmi7u39nLvSqJOyEqr11TsH8rzdMhcdJQ4P6nwvgB9iV9nsmPrd+ezj3401LyF1lsXbUr5galExv3x8dFhA9UZ0/JIHof/pyVzvlgRFHsKY+wbKy+imGenQCeZWyWimNO5UiF63I6Zmrv3Zp3kcqMriOLV7OFCcyO04yyQgsthUEJAKPEOjnSyax1cp47u0e7A3Ncs/KqCXsxpeiK1b2UPOlJMJhNaplcgQv1PJRNjP6FBEQ+dLSqzPtRK8FvqdR6jNgUEpShNltVlqji6HmA6yQ9hPQg10Q0bl1o5A3dIurUleeRn2anSgXvF3Cf7BdmFpASCWvmU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199018)(46966006)(36840700001)(40470700004)(8936002)(336012)(450100002)(47076005)(54906003)(426003)(41300700001)(86362001)(83380400001)(2616005)(6666004)(5660300002)(4326008)(478600001)(1076003)(26005)(82740400003)(186003)(36756003)(82310400005)(16526019)(316002)(7696005)(2906002)(40460700003)(81166007)(40480700001)(70206006)(110136005)(70586007)(8676002)(36860700001)(356005)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:26.8969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df827292-a7b9-4c7b-c9f3-08daff0df6f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5345
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
index 0ae1237fa193..d3d2026b6e65 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2957,6 +2957,13 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 032207efef15..db316f0625f8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -878,6 +878,126 @@ int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
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

