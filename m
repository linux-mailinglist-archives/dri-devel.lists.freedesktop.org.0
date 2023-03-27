Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C116CADA6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A2B10E6FE;
	Mon, 27 Mar 2023 18:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E96C10E6C9;
 Mon, 27 Mar 2023 18:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YK4DUJPizYZ6OpNvWXvaM0ZJ0KOSn1tbAZ89N26/HHT8fmRM24qYtbzRWKQUBUDjpIzMmS+E0MhVG+lC4l3zjKr7wGhZO5/4Pj5g+kL6RDspWfAb6uYKkvHhkJn3w4GxQvK6OXhC8bnDo7/hEzFyrqiMChtw99t19SI1dgtleVUXZo7w6m1Ek/REdyssKjNvQs/w9SDnGwuLUH7qr5TRMH+5dsAInvh5B+PM8Ehe5cyloCZdwRdqc24x3NcddaxqNVNe7KoNUpQ55+wZkXyyO+ZrIkJae3cIdEB7J8ooVt6S0dXRim8FG6gbpolDKv94wo9TfFvZuH2DzDXUUOngBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=capQmuHYwC5MWJaVzGL1TlRaACwvQPLUQHEPdpFyONg=;
 b=Tr7Le9Xy22xiw90acJH8F9QgPjDqB1/UJVjx+hjvQgeZ5nP2xL32h0cEDl0pnDCIl3t0f4WX/Cqu+5NXGca53tpTv9uxiOszwa1No9Q1dg26CqbaanOxpWyQ3la8nHLZVbHa1gC2DjhYyAqf8sTVWJFFJAruJRcfsABz3l4JdJgaKWHFsnD/nbvg4revqAMt61ySxMPjyRGrWJyNiz6C0Hq8aq3MVKS/kAyQmPXGCI4sKRtn98VIt9nnY32ZnFmQMRpd7Kw2eUEBdXj2tBM7gyk1BXevnWJ+uZrZo4JGeNYEcp8JwYkeLtsSxA3LcIA+OHb6VjIOW8d7NUnUWfPh8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=capQmuHYwC5MWJaVzGL1TlRaACwvQPLUQHEPdpFyONg=;
 b=Z0DWz8VGIQ3D2v6Wl6Wwk/K/Uwhw8WE+lqNNj1fZpDSTyM8+as/kRua7uB2P0e1YA1f6wguvF7+MZmNzHlBBnN1N2XDyzOSpDDhvmaAfTYvOzoGT2K6+9dNoe5Jf6nUUzPo6VTpRKPHnOkqS2w8jGlomNuiM9bNxymuKGeJX/Y4=
Received: from CY8PR02CA0022.namprd02.prod.outlook.com (2603:10b6:930:4d::26)
 by PH0PR12MB5420.namprd12.prod.outlook.com (2603:10b6:510:e8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 18:44:00 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::ce) by CY8PR02CA0022.outlook.office365.com
 (2603:10b6:930:4d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
 Transport; Mon, 27 Mar 2023 18:44:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:59 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:58 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/34] drm/amdkfd: add debug query event operation
Date: Mon, 27 Mar 2023 14:43:34 -0400
Message-ID: <20230327184339.125016-29-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|PH0PR12MB5420:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b37bd2-d0dd-423b-7cbe-08db2ef33ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wP4cnTaSci72ZteW3YpiwAzp1CEHFYYiKGiVDMWDQoPymrAMlJxiW8dFH9BjbjKkjYoDfDiasqqRpi0GMUeVjq1jrs7c9/xsOMuI6MEuEkkzPAKEhEF4aFO343LvDGRD2SUil2N1Za2Nn6SjG/rCoZv9KpU0fYVH1tcy8QSgEFoqAx/4rYf/vnC9iIl5Hf9fx2dP3mv+xmfnX0DY69MoYdBAWH2Skrl4wOQ8k53vjBwGzg0pCNMthO4zZFkz7WoCSWXOn4aZ+Maz+KfltjHGoGJHw9xXMHbmSTAcWtfHBrLRsbtkALgmKh9ova8s1lR3ULsFVyh9nHxwKyOkrZzBUlNzFKKf3z+ARnbwJOOKynSIwW22cTrTj/g0/CWew2tpJkKkzx2Sd3yihFBtGqo7VIVqGd30vsbVfAwMJn95p36V0JIZRNEI7c7awK/t0xwDY1sMlUxLCmHKFma7TbDwY2TIlgF1L4IyQ/tGrdlxe2Kc9e7UEMTw8LNNwlVgvZNh390gJ6D30XAQSTq251ikWkYo3jPyWibIdLkT75lV6tK2U6ojmIwpZb3WvvhlehdmlSJjRrFP4TIdHsOWdmbSCt/jeVKL85yKwiglomR6FSGLQJTTo8tOVj5kC0fMUh7NuTFhHVlG/94gwCkncIrRDEzduEvAUoIGc+gxZjK/w3UIuB3/fCSJYptuEEjPTT3wwq0BAEEoA4X7PEsrkGqrgI/lq4hTqXWZ/rp+7ywrI0w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(16526019)(26005)(426003)(1076003)(40480700001)(41300700001)(186003)(6666004)(7696005)(83380400001)(336012)(2616005)(47076005)(478600001)(54906003)(110136005)(316002)(36860700001)(40460700003)(4326008)(70206006)(450100002)(44832011)(2906002)(70586007)(8676002)(81166007)(82740400003)(356005)(36756003)(82310400005)(86362001)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:59.9718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b37bd2-d0dd-423b-7cbe-08db2ef33ac2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5420
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
index da3478b133bd..593ede6b2af5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3024,6 +3024,12 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 5d3193ae71e3..e7f1521ac593 100644
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

