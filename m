Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571926CAD81
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5E810E6DA;
	Mon, 27 Mar 2023 18:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE8A10E6C9;
 Mon, 27 Mar 2023 18:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3d7q6vT+/E+dCoWwPCtGVSMYG1GRot0sBvjMW3+o7Bo6rj5UlYa0eHP5sy9LNMXHI8xXXe5L8/ttvFoI8eM8aMNpI7VLF7v256m83jsWDgAP59Mks4lzo6QlWeT1dEeaBnrQbuVe4jT3XSOHZNyPP3oxM1/mQt2dBjAt4GXxyCH4HjJt3Anf0z1TzJ4dzToXnWJQ+rNAkPUfNcG3zookoTeX+b9Up+G8U6Iixxe5cvrWdWN+bW6VeVmxW/RGw81RKQuu+NKvW4gYtPyZJ42/tgYq2IiR2JbThtL96G1q9WwkVu1cgWMK9QBvE4Z+NlGL679Wan8THg+5g/HOnsjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7LP7mfFchPscM8z6VHmjZtccGniiSOWe1YR6u6YfeQ=;
 b=D1f2WqsIkHeQvuMatY726pK+qyEvYzMmTo3Yc0gqbDIGh58YQRrT/N1Jj9/c5qbs2rSqATGsfL7efl11IQJXbZa2spUgLK+gJFQgDtcM8SzPrVCb2zQEe/+PEwsIUFXggCfDeM4TOabU2wWq7lsBkLAg7sbY3PG80bzVREx2XoqIbtvve7oNo7BhiVA27J+tyimEeNWB5e5AG2X8ShJJ1+ejawC/Tr3btAf5XRi95j7loJcfg0zQWmnSuHMU22DRakwBXYGNI39FD+OyezzgzQsk9Ygvo9bP1yyH6Vsme6cJaHJW+AdyAlzHki3kYesi5SwV9gvAE7sT+UK6RzRoag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7LP7mfFchPscM8z6VHmjZtccGniiSOWe1YR6u6YfeQ=;
 b=0C6nmyuHUNxOpvHceKAWqNccCI4zFoLo4S6RZLxeXyA8iHgYGUnFclY8BchYGui81kh+OYGlA1YdxQA/tOGDdiOOfmqfc6dJ32k0W/C3iuvhryXA9auZuKI4WM/SYFpi8Jlf6zQx1OQYBQ9t1lFnghHZjf8CxSFSFMx0vY14Hoo=
Received: from CY5PR15CA0073.namprd15.prod.outlook.com (2603:10b6:930:18::21)
 by CH2PR12MB5516.namprd12.prod.outlook.com (2603:10b6:610:6b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:44:01 +0000
Received: from CY4PEPF0000C979.namprd02.prod.outlook.com
 (2603:10b6:930:18:cafe::2d) by CY5PR15CA0073.outlook.office365.com
 (2603:10b6:930:18::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
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
Subject: [PATCH 31/34] drm/amdkfd: add debug queue snapshot operation
Date: Mon, 27 Mar 2023 14:43:36 -0400
Message-ID: <20230327184339.125016-31-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C979:EE_|CH2PR12MB5516:EE_
X-MS-Office365-Filtering-Correlation-Id: 063879f8-a6db-45e2-e777-08db2ef33bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qPPO6FcawMDSb/CaFGETtW1gNFuTeHxRYYtw2UG/zHd4E7KlaT29B4JSmbbtHJjfhGnwxLOsK3qqUKfF53V0Ekvx+i+l/2ZupzlcRWdDvABhGAD4uUoJMw7G1q5L5GUHQK1rGnSz15zZ+4IfuzLhdKpQk+v6Kqs1Q/teyiS/ujGECLwwmCU7f5IWsrk8c+Zb8uReIBu5lxO/jRN9F6YL+FwYajYOv52TW46cnamSGf2T9B1XitkqK9XRB5IHtq2C6oM671AZqekqxwQM4NaoNBEyuaL+Ld3snWn94mUG2UMo8L2R1XsGn0HEVZs4X1ttdoguuRI0/Nojv9XmKbpfj0L1P+vEL2tLPRxVJ/18C/O0AYjwXABkEELi1ejNPUlAu1LyE0IZk5QoZnuCSnemHqTG+MvR2OKSjaGfOSw/2vhJqWPJlwoKV6M2FyJfBVHfjeqfC6/l/PlIXwHg+Y7aqnG0N6zQAnHZOICH6J8zSPufGjuOLYnbw+aRyRxYyIuaXc8PkfNe5+8A0oRCMN2bu7+UMoT3k8rfUDGpstogO3qcJo93ulraBhKOJr0nPPHH1gMDl7jwKtxcpXqYbJgV1mFtndHbDO93t0tAbXZnBLdI0wJa3feSaR1+pejQQnwNMpUTwcYpOIYPf/tl/clQm1HmNUE4AL+DNzo8x451URhAvTczCB+ib05nF+lfmFXoMOrkbbvXRgFg/e2ywE6ucR2M/cu0f0sfP0L1feQ07pI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(36860700001)(478600001)(316002)(54906003)(110136005)(81166007)(82310400005)(8936002)(5660300002)(86362001)(36756003)(2906002)(44832011)(356005)(70206006)(70586007)(450100002)(8676002)(40480700001)(41300700001)(4326008)(336012)(16526019)(186003)(2616005)(426003)(1076003)(26005)(83380400001)(82740400003)(6666004)(7696005)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:44:01.7833 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 063879f8-a6db-45e2-e777-08db2ef33bd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C979.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5516
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

Allow the debugger to get a snapshot of a specified number of queues
containing various queue property information that is copied to the
debugger.

Since the debugger doesn't know how many queues exist at any given time,
allow the debugger to pass the requested number of snapshots as 0 to get
the actual number of potential snapshots to use for a subsequent snapshot
request for actual information.

To prevent future ABI breakage, pass in the requested entry_size.
The KFD will return it's own entry_size in case the debugger still wants
log the information in a core dump on sizing failure.

Also allow the debugger to clear exceptions when doing a snapshot.

v4: declare and memset 0 snapshot struct out of loop

v3: fix uninitialized return and change queue snapshot to type void for
proper increment on buffer copy.
use memset 0 to init snapshot entry to clear struct padding.

v2: change buf_size arg to num_queues for clarity.
fix minimum entry size calculation.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  6 +++
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 36 +++++++++++++++++
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  3 ++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 +++
 .../amd/amdkfd/kfd_process_queue_manager.c    | 40 +++++++++++++++++++
 5 files changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 1f7e57abefb4..7868a0aecc9f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3039,6 +3039,12 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				&args->query_exception_info.info_size);
 		break;
 	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
+		r = pqm_get_queue_snapshot(&target->pqm,
+				args->queue_snapshot.exception_mask,
+				(void __user *)args->queue_snapshot.snapshot_buf_ptr,
+				&args->queue_snapshot.num_queues,
+				&args->queue_snapshot.entry_size);
+		break;
 	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
 		pr_warn("Debug op %i not supported yet\n", args->op);
 		r = -EACCES;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index f79c26e02417..ce0a1483606e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -3004,6 +3004,42 @@ int suspend_queues(struct kfd_process *p,
 	return total_suspended;
 }
 
+static uint32_t set_queue_type_for_user(struct queue_properties *q_props)
+{
+	switch (q_props->type) {
+	case KFD_QUEUE_TYPE_COMPUTE:
+		return q_props->format == KFD_QUEUE_FORMAT_PM4
+					? KFD_IOC_QUEUE_TYPE_COMPUTE
+					: KFD_IOC_QUEUE_TYPE_COMPUTE_AQL;
+	case KFD_QUEUE_TYPE_SDMA:
+		return KFD_IOC_QUEUE_TYPE_SDMA;
+	case KFD_QUEUE_TYPE_SDMA_XGMI:
+		return KFD_IOC_QUEUE_TYPE_SDMA_XGMI;
+	default:
+		WARN_ONCE(true, "queue type not recognized!");
+		return 0xffffffff;
+	};
+}
+
+void set_queue_snapshot_entry(struct queue *q,
+			      uint64_t exception_clear_mask,
+			      struct kfd_queue_snapshot_entry *qss_entry)
+{
+	qss_entry->ring_base_address = q->properties.queue_address;
+	qss_entry->write_pointer_address = (uint64_t)q->properties.write_ptr;
+	qss_entry->read_pointer_address = (uint64_t)q->properties.read_ptr;
+	qss_entry->ctx_save_restore_address =
+				q->properties.ctx_save_restore_area_address;
+	qss_entry->ctx_save_restore_area_size =
+				q->properties.ctx_save_restore_area_size;
+	qss_entry->exception_status = q->properties.exception_status;
+	qss_entry->queue_id = q->properties.queue_id;
+	qss_entry->gpu_id = q->device->id;
+	qss_entry->ring_size = (uint32_t)q->properties.queue_size;
+	qss_entry->queue_type = set_queue_type_for_user(&q->properties);
+	q->properties.exception_status &= ~exception_clear_mask;
+}
+
 int debug_lock_and_unmap(struct device_queue_manager *dqm)
 {
 	int r;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 7ccf8d0d1867..89d4a5b293a5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -296,6 +296,9 @@ int suspend_queues(struct kfd_process *p,
 int resume_queues(struct kfd_process *p,
 		uint32_t num_queues,
 		uint32_t *usr_queue_id_array);
+void set_queue_snapshot_entry(struct queue *q,
+			      uint64_t exception_clear_mask,
+			      struct kfd_queue_snapshot_entry *qss_entry);
 int debug_lock_and_unmap(struct device_queue_manager *dqm);
 int debug_map_and_unlock(struct device_queue_manager *dqm);
 int debug_refresh_runlist(struct device_queue_manager *dqm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index dd084888258d..d82964851f86 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1303,6 +1303,11 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 		       void __user *ctl_stack,
 		       u32 *ctl_stack_used_size,
 		       u32 *save_area_used_size);
+int pqm_get_queue_snapshot(struct process_queue_manager *pqm,
+			   uint64_t exception_clear_mask,
+			   void __user *buf,
+			   int *num_qss_entries,
+			   uint32_t *entry_size);
 
 int amdkfd_fence_wait_timeout(uint64_t *fence_addr,
 			      uint64_t fence_value,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index c5afa33fc9ef..6167135dbd23 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -576,6 +576,46 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 						       save_area_used_size);
 }
 
+int pqm_get_queue_snapshot(struct process_queue_manager *pqm,
+			   uint64_t exception_clear_mask,
+			   void __user *buf,
+			   int *num_qss_entries,
+			   uint32_t *entry_size)
+{
+	struct process_queue_node *pqn;
+	struct kfd_queue_snapshot_entry src;
+	uint32_t tmp_entry_size = *entry_size, tmp_qss_entries = *num_qss_entries;
+	int r = 0;
+
+	*num_qss_entries = 0;
+	if (!(*entry_size))
+		return -EINVAL;
+
+	*entry_size = min_t(size_t, *entry_size, sizeof(struct kfd_queue_snapshot_entry));
+	mutex_lock(&pqm->process->event_mutex);
+
+	memset(&src, 0, sizeof(src));
+
+	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
+		if (!pqn->q)
+			continue;
+
+		if (*num_qss_entries < tmp_qss_entries) {
+			set_queue_snapshot_entry(pqn->q, exception_clear_mask, &src);
+
+			if (copy_to_user(buf, &src, *entry_size)) {
+				r = -EFAULT;
+				break;
+			}
+			buf += tmp_entry_size;
+		}
+		*num_qss_entries += 1;
+	}
+
+	mutex_unlock(&pqm->process->event_mutex);
+	return r;
+}
+
 static int get_queue_data_sizes(struct kfd_process_device *pdd,
 				struct queue *q,
 				uint32_t *mqd_size,
-- 
2.25.1

