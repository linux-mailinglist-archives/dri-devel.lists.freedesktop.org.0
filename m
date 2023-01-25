Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C467BB63
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8247610E83F;
	Wed, 25 Jan 2023 19:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E998910E391;
 Wed, 25 Jan 2023 19:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWPoyon5Vl4TE4F9fSO08y4fXt3LAH2vnuEoET7Ey9xd+1C0RuTR7gGFIdpqJj835yAFCGenOsVhRI1SeV2fDOfFkDSWfUgVgOrCTmfVN/29HrssUf3UMmohybMy9ysHBr2a1uNsLmAb/J4/1QISvu/BVyB1OQf8pzn9ExCtiiKuNOcPm/n5EAL/FxWk+R8hxGaEf7W/Fy2uNyQ5SOawJ9cLRWgDUg3njthOf2gf/FFJ/nP8jceIDJRZPteDwYFVdzIKElR7SmZ7IvNS6VSBO2Fnuqn3cw8/k+yUs9F7SLy6O/DsTm6SGkRL3hVwMqeRMSDeftCgI4GcU9jOntcW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rH29NGc6YG3Z64wlnI//THWNuLjWual2UP4lbBVnPE=;
 b=l1kuvbpmF999oDvOL1cq1d/d5WAgRTLDNaLrBVXAaWGvUz0lcaj88JGBOBXaS3m+t3cLhLSJ/rV8kv0h0AYyMgqbEswNYjGy+3oQSQtn2hp8hVorH6GRv5YV18M/7UlqWiByrdo+gpzmnwLlYdXrdn575MMzLDrTcd3Oi/hlorcuqdhQmsUZUWSLLs+iIssyvWcYC770oF5T4LloK0DKN1t4CGNd7MQRTVAW/q4ReXI4mai1/0E9p/8+do4wiZGQzgXmgJ6baH9Fv78HONEXEA3auZ4sklH4DzbK3PAs4ZDvuEd/nqZGRqipG96UKvqO1qwSzwn5sGIu0tghMfgGZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rH29NGc6YG3Z64wlnI//THWNuLjWual2UP4lbBVnPE=;
 b=EnHps7DqRoU5KjKdRYJIpxytgMnRbTbdz604HYGzYqhb7x58nksGBs226FS1U/y1Uq76UckkiR+SoyAviM5lOGnj6Le0WbZsjqJAymyBXJPF4irbtec8zqIBpRbKzp/ddl65ZoPtiIBcc2sd2goQHxPooUpbsM1ffD4tc495IZE=
Received: from BN9PR03CA0702.namprd03.prod.outlook.com (2603:10b6:408:ef::17)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 19:54:26 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::97) by BN9PR03CA0702.outlook.office365.com
 (2603:10b6:408:ef::17) with Microsoft SMTP Server (version=TLS1_2,
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
 2023 13:54:25 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 28/32] drm/amdkfd: add debug query event operation
Date: Wed, 25 Jan 2023 14:53:57 -0500
Message-ID: <20230125195401.4183544-29-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3715dd-19fa-4eeb-42d3-08daff0df6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVdLS7xZORu9cDF1m+6bnur9qe7Hds+XVrV3DiTzxWl8c5mQ9VVkZLOIVAQwJ5huuNfTjV/1BYJtfy0pHoEs7376CnzJkRFT2ODA+WLXh/VHVMh5/gf93a2BLCc9StQDd8b+9d1FVqz4JxUlefKsR39kbb3d14lvVF94tqXP528ClxykUHmFYAZ3queCedECDNhRVq8c70CjkcGm6/15Poqtl2B993Q9PCE8+bn4eJMQf1AHTXircUfkq6W5ySUxD55guWRL7UCEnr0su8X0+ArmCbKe3zTVxqHebMx3XTJwLdHG7XAoFy2+HpGUUj5oyDEQtQ6DeuR/nk1R7MxP/RSdYcjb+0ok5f8CArVvFT5RNQfDwYRk+Twn3o+hAH7usE4eIVIzQCa59Y9Zpm+ilLq/ElS2RNSNJ7fjjZaBUiwRm2YVcRsC2cY+rfuNh4UOFYW8qFXuhHTZjdQOuUkij8UVgxvcihbtI+1zE0/ngayY9EIfhGLmdgQu5C1ZC74iu9dBEz3ao05Qc7htOjx8yV9tWjFnPqBv1y3KqggcBLuRjH3j2CiuFd6WQZp9t6KHJ/JfNrGOS/BrI2AbrmNKZ5xlp60Ch7sNWwJFJ+wZCnf7Cmw5f5zuIvvhGXj9ZMMrElD627oC5nccQSDxBzCpoTPgrN6pybwPvoJ80IRyguar89M6NRYpdSrxmJakX8kFfKRFEUjR/ijZSPsn++uMhlXdO+4/SwxIdWM0ouYUNKE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(36756003)(8676002)(7696005)(110136005)(82740400003)(316002)(1076003)(478600001)(5660300002)(6666004)(44832011)(2906002)(70586007)(4326008)(450100002)(70206006)(41300700001)(8936002)(36860700001)(54906003)(40480700001)(356005)(81166007)(86362001)(2616005)(426003)(83380400001)(336012)(82310400005)(186003)(26005)(47076005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:26.6313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3715dd-19fa-4eeb-42d3-08daff0df6cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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

Allow the debugger to query a single queue, device and process
exception.
The KFD should also return the GPU or Queue id of the exception.
The debugger also has the option of clearing exceptions after
being queried.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  6 +++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 64 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  5 ++
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index c34caa14b84e..0ae1237fa193 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2950,6 +2950,12 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		r = kfd_dbg_trap_set_flags(target, &args->set_flags.flags);
 		break;
 	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
+		r = kfd_dbg_ev_query_debug_event(target,
+				&args->query_debug_event.queue_id,
+				&args->query_debug_event.gpu_id,
+				args->query_debug_event.exception_mask,
+				&args->query_debug_event.exception_mask);
+		break;
 	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
 	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
 	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 77ba7da2bb9d..032207efef15 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -27,6 +27,70 @@
 
 #define MAX_WATCH_ADDRESSES	4
 
+int kfd_dbg_ev_query_debug_event(struct kfd_process *process,
+		      unsigned int *queue_id,
+		      unsigned int *gpu_id,
+		      uint64_t exception_clear_mask,
+		      uint64_t *event_status)
+{
+	struct process_queue_manager *pqm;
+	struct process_queue_node *pqn;
+	int i;
+
+	if (!(process && process->debug_trap_enabled))
+		return -ENODATA;
+
+	mutex_lock(&process->event_mutex);
+	*event_status = 0;
+	*queue_id = 0;
+	*gpu_id = 0;
+
+	/* find and report queue events */
+	pqm = &process->pqm;
+	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
+		uint64_t tmp = process->exception_enable_mask;
+
+		if (!pqn->q)
+			continue;
+
+		tmp &= pqn->q->properties.exception_status;
+
+		if (!tmp)
+			continue;
+
+		*event_status = pqn->q->properties.exception_status;
+		*queue_id = pqn->q->properties.queue_id;
+		*gpu_id = pqn->q->device->id;
+		pqn->q->properties.exception_status &= ~exception_clear_mask;
+		goto out;
+	}
+
+	/* find and report device events */
+	for (i = 0; i < process->n_pdds; i++) {
+		struct kfd_process_device *pdd = process->pdds[i];
+		uint64_t tmp = process->exception_enable_mask
+						& pdd->exception_status;
+
+		if (!tmp)
+			continue;
+
+		*event_status = pdd->exception_status;
+		*gpu_id = pdd->dev->id;
+		pdd->exception_status &= ~exception_clear_mask;
+		goto out;
+	}
+
+	/* report process events */
+	if (process->exception_enable_mask & process->exception_status) {
+		*event_status = process->exception_status;
+		process->exception_status &= ~exception_clear_mask;
+	}
+
+out:
+	mutex_unlock(&process->event_mutex);
+	return *event_status ? 0 : -EAGAIN;
+}
+
 void debug_event_write_work_handler(struct work_struct *work)
 {
 	struct kfd_process *process;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 782362d82890..4f2195d57ff0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -27,6 +27,11 @@
 
 void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count);
 int kfd_dbg_trap_activate(struct kfd_process *target);
+int kfd_dbg_ev_query_debug_event(struct kfd_process *process,
+			unsigned int *queue_id,
+			unsigned int *gpu_id,
+			uint64_t exception_clear_mask,
+			uint64_t *event_status);
 bool kfd_set_dbg_ev_from_interrupt(struct kfd_dev *dev,
 				   unsigned int pasid,
 				   uint32_t doorbell_id,
-- 
2.25.1

