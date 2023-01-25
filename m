Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901467BB70
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1665910E84B;
	Wed, 25 Jan 2023 19:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EC910E81D;
 Wed, 25 Jan 2023 19:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbkgUFTCWHLJB627VF6ycxC0LTJaSq6XZEBSe3TNQstxoxETj6qvsG+AsnVgctnuvk5X0895akwVtHeRzviPDPj1gXSv5Me2fIzTtiqFOoQ5/kOHQRJpu+wOvoq6txvelo8h3IlI4+dxIpz/9ZDFDn1cZ7hbChYy2wjdfUUCtwSG4vlJTvN4CKN7wuPpVxsyyj+FZ1eXoTc0y+hbtlkwR0w8Vbj4NOmitkEca+oCo4bYYohShYJMTrrsD+5RFPpLpPIPyMAd841FoRg6m8X8psgh/Skeo/VkricPbK9w5q7PDOzJiqBJ5GyVjAQGaoMonWNJp5lkuJLSigVlswpcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkzXa/X1uDznhTakxAjAPVxsnTJtg3E7LVhHMJfQCXI=;
 b=FsSYZKNU6B5pZ6eeGSlT9brZzb0PlhZqWZCIR6uwknHQ7WJvlW+QSj7F4mppeB70YW3QzsyHfmWp5EZXfkky/mp8/lXrnGrgG80mGzktyQmTqE0qmjdmfFzxeBtx61g4bCfnE4GZGL5UQXf0zuZr0ys6M5aoWd5tG2q8WXkzXo/kdoURaqCF9hO07BeiguKSTy0NptY7bEhTl7EAeCfiCy209yiBXJYySZ+OsVbN/0BHVL2yaJSRBh2dq6SONwmUYY2tzGKaSXBmg5gR05Xg/EBhNB/SvZth132hSOIYs+6aY3o7Qea1P7jMuHT3LOcKH5JBRkoc7+2ExQqLpr7nAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkzXa/X1uDznhTakxAjAPVxsnTJtg3E7LVhHMJfQCXI=;
 b=Lc05ld1AkuL+7xrfwUHhP3Paz+HKTTnMzJmf8kwYCY/yMMjtNEgigHp86CRoOSqRLIyKSGQDH0TwUvqDWW0wXOtvaL5jp5q5t6fNvhx+rbQsiYU6FhRJwQEIe2ROhGzCKRfsZgCXtv2J8A4RWrY1JvYLe+VG20VZeavwadlNmfw=
Received: from BN9PR03CA0714.namprd03.prod.outlook.com (2603:10b6:408:ef::29)
 by DS0PR12MB8343.namprd12.prod.outlook.com (2603:10b6:8:fd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 19:54:27 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::25) by BN9PR03CA0714.outlook.office365.com
 (2603:10b6:408:ef::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
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
 2023 13:54:26 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 30/32] drm/amdkfd: add debug queue snapshot operation
Date: Wed, 25 Jan 2023 14:53:59 -0500
Message-ID: <20230125195401.4183544-31-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|DS0PR12MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: fc8cd2ab-ee67-42c5-da4d-08daff0df729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g1bDDmV+S6hrjztANduzektxQFUHteQZ4Lt3fIc4GI3IQ8kBVwapC+JbcaPFvgb0vhMxj3aZQqvpvOh2pBzAIYyDsNqjeaIcDGoG1G3Ln759iTgVZoch5OYLez+zUm2MIKRjur/qSDexhZH1u6H2ZxVyvh7R3h0zHLf3m9p41/3tg2QHCLhpddsPvVPmkVsj68whtshxAK8S9z5Dm4ZbhZUM5DWFnkbNQ24IXWQNkcO31LroeNxM2Zbz7ltfD7aVT/AoCfZ0724Cfnh40fCgcUrCqaS3/37UQl4Ib407TC7NIBfFPwZQyHyTtJKijfrGbmyISnXezl+65wI12ltsUm32gW57ZEPd31vBIofKdIi9vuuhPYwO6OiwcYg+GyRIgwIcJs8nudK2+V5QRSjO3AJgd8tU8304RJ6Gj54NMShCWpjSmh3v9nmX2TE9FIsc8eoABlUnQc7oLdwzDLBnbQMYWej2nkHe0Y4dyX0w2JrhGW/StlaBsiY2scLVWFYhJg/dD6BOksqNVSSW5dsARY/Tf0/tTb49Mthng67m6fhKfZ2TvbemHZHSKFGlVBNFca6b7PtX1QFYHM32BecisXT5QeUxmLt2vabNA5HTFmzekJf52R7qjap/Db8ATwa5hCvuvQwuyDz+IWVDxwiTXU6Sr6z/nZM8ROnWTu51c4h0bi06LnifRUNMJ6CWNnuoX1UbmWfiy72Gh+bcISRKoSiVRPKCliHZBsKdMkYDXKo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(1076003)(336012)(2616005)(2906002)(81166007)(36756003)(450100002)(7696005)(26005)(316002)(83380400001)(40480700001)(478600001)(356005)(41300700001)(8936002)(44832011)(5660300002)(40460700003)(82310400005)(426003)(6666004)(82740400003)(110136005)(54906003)(16526019)(8676002)(70586007)(186003)(47076005)(4326008)(70206006)(86362001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:27.2250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8cd2ab-ee67-42c5-da4d-08daff0df729
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8343
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

v3: fix uninitialized return and change queue snapshot to type void for
proper increment on buffer copy.
use memset 0 to init snapshot entry to clear struct padding.

v2: change buf_size arg to num_queues for clarity.
fix minimum entry size calculation.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  6 +++
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 36 ++++++++++++++++
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  3 ++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 +++
 .../amd/amdkfd/kfd_process_queue_manager.c    | 41 +++++++++++++++++++
 5 files changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index d3d2026b6e65..93b288233577 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2965,6 +2965,12 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 7792fe9491c5..5ae504a512f0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -3000,6 +3000,42 @@ int suspend_queues(struct kfd_process *p,
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
index cfc50d1690c7..cc7816db60eb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1302,6 +1302,11 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
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
index 0ae6026c7d69..221cd4b03f1c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -576,6 +576,47 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 						       save_area_used_size);
 }
 
+int pqm_get_queue_snapshot(struct process_queue_manager *pqm,
+			   uint64_t exception_clear_mask,
+			   void __user *buf,
+			   int *num_qss_entries,
+			   uint32_t *entry_size)
+{
+	struct process_queue_node *pqn;
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
+	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
+		if (!pqn->q)
+			continue;
+
+		if (*num_qss_entries < tmp_qss_entries) {
+			struct kfd_queue_snapshot_entry src;
+
+			memset(&src, 0, sizeof(src));
+
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

