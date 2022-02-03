Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB40A4A8106
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A30110E9F4;
	Thu,  3 Feb 2022 09:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2059.outbound.protection.outlook.com [40.107.96.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED8010EA31;
 Thu,  3 Feb 2022 09:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DL/SAq5NO6LY6roZYqMv/ukaBZpk3if8XTkAx+Acdx2ISgqnOPH9Bj90CN8ciDJqYHyLVOZuxhFPBW+k3XiVeNuku+HBp6rQvrw9RcRsDQmKua9mwCiNVzk6k0GcruxXdHRw7d0CWG5fX8GTWYAW3x56V6dFXihFl9Ca2EEn6ZKB5kN5n31zSiG5eXEqI//xiWkrc8lWuMsu2EodLIvUXCtl2zuaJiEX2Uuk0vMp9rhncWYYwZL0LmA7R2Qz+ICD6dQAIOQPaOYMuivtwISKECRhO0xT9axHxjlHxPmLNvlfJBuy+5I85Z0BEBB46sElCgiI37mUkW72yew5LOhLMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpOIzq+5USAoiA//ee1CAmZpB9saY1tdijOt5gZsgAg=;
 b=W+fvEPKAIYdQiLP1I71H+Bg+N2sWsmHMKcd7IHRqtw7FT6PlQdQowdow82wAJNOKc/QtJMReS9BxsYakwjMInNHOJD7+3eySS51snarvbYd9wqDmc2AUakh/NbcuyOwwSvqS/g7MJwbNWR+eGl6fGb/iwnamlDuK8kol+TbDl21X3BwatDq1UlOpqXHYEfUKOqECWOkKx27sA0MZrQzEkkogLfPT9U4mdY+HZ//ee3z4uQaHSGGbeVf7Gc3/GRyOs2BpyyKTBJuFcfHJCVY40ydxewIfrF4790HlI5QXYru8EvxNJCGR9Q1eGuwH21XWwCk0qRAX/A+MnARebp2PLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpOIzq+5USAoiA//ee1CAmZpB9saY1tdijOt5gZsgAg=;
 b=f4DBxpFaC4FqbFUJkOx41AVbUd7S18uwVYKaA7p1e4iTd4z/Zo5Ek1+hb1Sfwk9cPxp32hvuSvxurQrM7b+lGDNx8B/FkNJ3TgubAFKSND7lPsEWwtCZg6tB2KUFBfntrrP/Z6i/XeSu8FkiZ+2iWnxYeaWOL8LlM6HKnAKYtjw=
Received: from BN9PR03CA0375.namprd03.prod.outlook.com (2603:10b6:408:f7::20)
 by MWHPR12MB1200.namprd12.prod.outlook.com (2603:10b6:300:9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:39 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::8e) by BN9PR03CA0375.outlook.office365.com
 (2603:10b6:408:f7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:38 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:36 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 07/24] drm/amdkfd: CRIU Implement KFD unpause operation
Date: Thu, 3 Feb 2022 04:09:01 -0500
Message-ID: <20220203090918.11520-8-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85f40e86-926e-48c9-65c8-08d9e6f4e818
X-MS-TrafficTypeDiagnostic: MWHPR12MB1200:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1200AB02DB71010EB6952124FE289@MWHPR12MB1200.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x3UMR9DAMrE9BxqIAwHP0A5iX83/ygd4UWVAtkfZjoMEPWSLH/7mRKiAleQw/IaX7xJz7Aq/0PFY595COlTSKZo01UDuN+WpgjwHsT7CxcZHxpSYJ81pH7OSnYk78oxJCvCNZh9RH9vZ0YWAgR3pl8oWmzWecv+ivRQzBtGEGu+2gL/56A/jU86HcU62dE+6vGnB4bDhBWD9u9rwR0mqlx/F7C1ymzJsFSdA0omsuAk0PXfnsZeXPu7qSxcrCAr4ytD1kRWgwRTcAjkGWpX1DaS+leh0PD91LNZp7G/Xee6ZfjNsRR1d+Ciq8rto9dO8wbGESZiU84oizq6W3JqC5pP/A0+ACfFtlo2WKGqIRe6o11mQ/cqRgfGY9OwAeIpuY8riq8CzRRpuJ3c5K10S/FQ1B083pPhsUVUE/Wuu9pR7KlCz0uji/9g6j6SSEw7XwPSzoq5RWdmkX4iTvtBVQKnLsiWm0YNSauAQZxk9UAmvQ5F6dzysQRUdS1MCIxD/S3KMNi6a17Cn7pKflPyYoYRRfCPvhCf9QWgxknzCkZ651RvWbW58mldDSmxQ071PD/OBPXHoJe0cI9rHm7MUnjsvfuhRv1TZIt+f2uNLTgkFIHxA3trtx4NWdE53qF8fkd94xJtJ7uHXFUJGXEYc7Dzro5ZVSPs9lAVbUYDu/P4csMIXHtdWNezK4UK3HdNHrF4fqfs7JdBd7FdeiLcLiQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(54906003)(44832011)(83380400001)(6916009)(36756003)(86362001)(7696005)(2616005)(186003)(1076003)(16526019)(26005)(336012)(426003)(47076005)(36860700001)(8936002)(8676002)(81166007)(2906002)(70206006)(70586007)(356005)(40460700003)(4326008)(6666004)(450100002)(508600001)(82310400004)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:38.9332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f40e86-926e-48c9-65c8-08d9e6f4e818
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1200
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

Introducing UNPAUSE op. After CRIU amdgpu plugin performs a PROCESS_INFO
op the queues will be stay in an evicted state. Once the plugin is done
draining BO contents, it is safe to perform an UNPAUSE op for the queues
to resume.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 37 +++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 95fc5668195c..6af6deeda523 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2049,6 +2049,14 @@ static int criu_checkpoint(struct file *filep,
 		goto exit_unlock;
 	}
 
+	/* Confirm all process queues are evicted */
+	if (!p->queues_paused) {
+		pr_err("Cannot dump process when queues are not in evicted state\n");
+		/* CRIU plugin did not call op PROCESS_INFO before checkpointing */
+		ret = -EINVAL;
+		goto exit_unlock;
+	}
+
 	criu_get_process_object_info(p, &num_bos, &priv_size);
 
 	if (num_bos != args->num_bos ||
@@ -2388,7 +2396,24 @@ static int criu_unpause(struct file *filep,
 			struct kfd_process *p,
 			struct kfd_ioctl_criu_args *args)
 {
-	return 0;
+	int ret;
+
+	mutex_lock(&p->mutex);
+
+	if (!p->queues_paused) {
+		mutex_unlock(&p->mutex);
+		return -EINVAL;
+	}
+
+	ret = kfd_process_restore_queues(p);
+	if (ret)
+		pr_err("Failed to unpause queues ret:%d\n", ret);
+	else
+		p->queues_paused = false;
+
+	mutex_unlock(&p->mutex);
+
+	return ret;
 }
 
 static int criu_resume(struct file *filep,
@@ -2440,6 +2465,12 @@ static int criu_process_info(struct file *filep,
 		goto err_unlock;
 	}
 
+	ret = kfd_process_evict_queues(p);
+	if (ret)
+		goto err_unlock;
+
+	p->queues_paused = true;
+
 	args->pid = task_pid_nr_ns(p->lead_thread,
 					task_active_pid_ns(p->lead_thread));
 
@@ -2447,6 +2478,10 @@ static int criu_process_info(struct file *filep,
 
 	dev_dbg(kfd_device, "Num of bos:%u\n", args->num_bos);
 err_unlock:
+	if (ret) {
+		kfd_process_restore_queues(p);
+		p->queues_paused = false;
+	}
 	mutex_unlock(&p->mutex);
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 9b347247055c..677f21447112 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -877,6 +877,8 @@ struct kfd_process {
 	bool xnack_enabled;
 
 	atomic_t poison;
+	/* Queues are in paused stated because we are in the process of doing a CRIU checkpoint */
+	bool queues_paused;
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index b3198e186622..0649064b8e95 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1384,6 +1384,7 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	process->mm = thread->mm;
 	process->lead_thread = thread->group_leader;
 	process->n_pdds = 0;
+	process->queues_paused = false;
 	INIT_DELAYED_WORK(&process->eviction_work, evict_process_worker);
 	INIT_DELAYED_WORK(&process->restore_work, restore_process_worker);
 	process->last_restore_timestamp = get_jiffies_64();
-- 
2.17.1

