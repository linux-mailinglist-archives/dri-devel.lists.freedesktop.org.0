Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2692711250
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DE610E710;
	Thu, 25 May 2023 17:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC04D10E6ED;
 Thu, 25 May 2023 17:28:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+Vnm2gL8XqVU7f099FajsKq3dugvdsK1uDIqanvZc1GSm33W+GYGLB0Up+4Dzv//6lCVWSMYh0oEox9jbOC4gYGu9xAdwyHcdgxqXwqiUIqa1mQIj3oQLk8PIn6Iz3qYcDPGWvj4aX/ryNmBw15i2Rlb3qXVe+n/1BMpg/T9gKAqGKxyi2N9YUjXgblTPT0zYOUBrGNaplr3OOZ9Hyf2PSHGgKcejJYzRz81Wnh03eVV6EQNgw13K7r1Rh7iF91p2gHjdLhbXwJ7+WErU4qLSxKCT/xrstRAVg/VHP+h/5qha+7NBRG7728R7y9bw4PBwDBU+XkdtggvePsNINXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1L76lD8Qb2h7B4whoSdPrMKoZX/26Deiy+7QJ6f1Nk=;
 b=i+lqtWrCK7yURHqQR9mr9tlL9WVEgAlVNHNXCcUWbLDJ7W6zLHTxDahx4Akfnrz8+P6iyLJH79Ogn9mXyaBdXFlu/PUGoV/KQEJ9ia9Ys07YVIxhDEoaviHCsZPb9ykWMaIwH19PIHSTGgaMxJejJOP9aBdMWGpo/sWtu0McwjxVSKUsMw1RjB+5CLpVqGNbb5W2iAf+ZI9Myuj4JhkZCHzxFD5ji8/gGeQWIZ992CBNQtzFY40NKaK+ezRd5Rk/OluT9+vUOmywJKpsMxgx02aKLC3NvTydjePQVCyAAkBg9IXrfsxAhsEaNVHrYQxomEhgbb2enhIQqoBI35Q3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1L76lD8Qb2h7B4whoSdPrMKoZX/26Deiy+7QJ6f1Nk=;
 b=llqGlaqQuXELTE/eCOLDJ4CJs8LfyIqcP4wtT3iK9oZ90jdv8bUr7aztGM8l3u47QqhCtNxRxxR/WxVsIWOsHY2qRlqWTljdSrHutaa62q9ehnjMAkt0gO9+bD8ddb/+Ccq0i3/5ierWLwG7AagIpiUvMCg+7bXFojjPyrAzbak=
Received: from MW4PR03CA0142.namprd03.prod.outlook.com (2603:10b6:303:8c::27)
 by BL3PR12MB6427.namprd12.prod.outlook.com (2603:10b6:208:3b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:28:08 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::67) by MW4PR03CA0142.outlook.office365.com
 (2603:10b6:303:8c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:08 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:07 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 31/33] drm/amdkfd: add debug queue snapshot operation
Date: Thu, 25 May 2023 13:27:43 -0400
Message-ID: <20230525172745.702700-31-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|BL3PR12MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa4e959-87a7-4804-57bd-08db5d45684a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4jAH8DSFzQrPJev+ma9FbNu/IPC4+P7kdrI29GV2NT/JhuIgsKx7ClcWhO1QVCt6SnDW1u5X9qLQCnqn+/Lx94ol+/UTr50u+qS8Z3GF+iwkRjPwjGyJC2E/bD05pO8lW9wQ692wv810wuR1Wl6fVERe/SzVl/8Zt4KXEdUwJNjqsppGRYr0rqxJEn1HxmSep5VfFuAn2QMC3cAcA9ynPYcp2MoayBf8GYxHplGGo5EVjwjHA6dm/cfOCl4MSTiJO6o02xApGdjloH28F3b4UMe+3ngKKPER6uNR1s8bMsDQXObAqyN15F3GEhrUmjv2NM8wjaBAEUZqteR/djg+4FKortTtJEN2cHxmoR2nz8hqVuG77xWDSKepi4T3RYVC/b5PptqU+IHJ1YV0t0fhId8hdoszAQ4jW2SqP1qocf8c8RlA8SzGnR4gwl9DIv9oRKfDqHZt5+OEQcVD22AJUXoVW7OSAY2usxJNgS9muEXSnOYiQrWbg6pndE8MljSUfEBvHHO0MZTpY5/t212zQlvfreuiKF/ixwxZ49L5N6rrx8CkxjcW8IwDULv5KwZozL8WnQPJa5y2i7eu7mJr2pECM4FtNiWVJlX+2nd8Qz09TVp19UXXoFQHr3dFBfwF1NnGR1FHyOC82mBPxnQIlk0enjN9uWGP8wleszJDmhKWNJV/iWYr8VqyGnaDk3RTjXJrVIuQtEYIpzYj60JIjyzEI0j+ttX3rHQanHiMxHSW94wG8JcfZ4triC/4YgkAl/auA4zs0GaVkUbTbYgJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(40470700004)(46966006)(36840700001)(110136005)(478600001)(8676002)(8936002)(41300700001)(7696005)(1076003)(26005)(44832011)(450100002)(316002)(6666004)(4326008)(70586007)(6636002)(5660300002)(70206006)(186003)(16526019)(336012)(2616005)(426003)(47076005)(2906002)(40460700003)(83380400001)(36860700001)(40480700001)(82740400003)(356005)(81166007)(82310400005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:08.5480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa4e959-87a7-4804-57bd-08db5d45684a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6427
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
index 00aa844762b0..b24a73fd53af 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3053,6 +3053,12 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 03fabe6e9cdb..9f52f8426ed1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -3040,6 +3040,42 @@ int suspend_queues(struct kfd_process *p,
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
index d4e6dbffe8c2..7dd4b177219d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -300,6 +300,9 @@ int suspend_queues(struct kfd_process *p,
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
index 8ec87bc8ba82..023b17e0116b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1355,6 +1355,11 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
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
index 01ccab607a69..9ad1a2186a24 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -585,6 +585,46 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
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

