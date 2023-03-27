Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80966CAD83
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6C610E6DD;
	Mon, 27 Mar 2023 18:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A910E6CB;
 Mon, 27 Mar 2023 18:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkfDIa+Z85sV/0J4XqQB6ba+vrAd2ktzDFiAZ9aaKcr1T0Pnh++OACBmbqrMCTw/yF0N/1/iuTWHRDBh9LaQpHGKSaSFehKFBsGA+2lqah7UGImsnBDDEnNgNET1GzUwWUDj7Nrr8L+LQK0X6ZiBmosDQJtP+0/H0QMCf9idzQgsIAJ40gc/CemcZbHUC8tQbCr80BG+MJJRCFoFFoZXMPzKHiJuMwAOPkSf25CfL9d+83lfoE2gD5L0y3JTeA9sOuYrb7wMPFwbpPMUUrrnt805DrdG9Z8inQPrlTQN7wsPYWUkReOpnmunkbeHBvGnF3BRExkz8WmSvpVcKpbf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4e7d0NONHB98rFmTHMpgb162/99neQa5ysb25IxOdkQ=;
 b=AAybCHcfdnhegBMgbpm2BLhTtjGWIM6F0+Lc6KrC6ZWFoXPzl31cCTFwcYvnCdZruOOj+MQCAVZtpZ5jlm6Zr1/pHbxx+kpB4doV3L2E0i94EugEScmvccfnT9T+4HkJM3zsTLBTyd624giOk1dNoOmH6LYAW26cyp5cK06t+Z8/BA6CcKsnyYUd77XTP5ttmuFgCpsTx3ZsYQhSZVBB8LNF6dl1t40JWCQNmyP8eWXF0DIvyAoTGenOrMy9hZdcfIWp6rCO8WqtHcbjU6mMByVsEFis1pmHrUoChDZ3RVWQQGXB3Trnl11KSXu6P03fWefs6HQpoUWsnreQGHvYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4e7d0NONHB98rFmTHMpgb162/99neQa5ysb25IxOdkQ=;
 b=ioMR+THSRLqWJ0GyQqSee3Fd4y9suXCwNFAqybTUu0To/xjUUGxDUssvJGDo4HBYWCPAtAaXim0nedVcG4PPAMrrZSmbF+m59yN3N/Q4fxcbMUACt3q9VfhT2mzuWyrcBUQ7eXnJSphtPj94IRRQokNDNN4Y+xmF7u0qKnit7w0=
Received: from CY8PR02CA0018.namprd02.prod.outlook.com (2603:10b6:930:4d::15)
 by CY5PR12MB6528.namprd12.prod.outlook.com (2603:10b6:930:43::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:58 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::27) by CY8PR02CA0018.outlook.office365.com
 (2603:10b6:930:4d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:57 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:56 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 23/34] drm/amdkfd: add debug set exceptions enabled operation
Date: Mon, 27 Mar 2023 14:43:28 -0400
Message-ID: <20230327184339.125016-23-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|CY5PR12MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9dad93-f828-4833-efa4-08db2ef3398e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FzuJDKaTSy0gJ0s1IfIhny6T2GLnf/HSo6Ff8YD4tr2gCVC7V8W0ZiQr9EfHT3Em8LNxsSYQOImfU42PgPMtAy2VbDQUDRlY62Osxm7KN9646OV49BIoRgHRP5Do98dy+wjD4ru6zqDn98uGpF6gDsP7rRtfaIeslmfM3N9xRCGnEHIlenyzv15eflKJIl7GyWIKPA1PHI398OjwjXDBAZgNhbObxZtwoj5xILzvFwDUS1gHwYsS5Ez+dgxLMQS22URLt6eWzOGlvA4Scg+oAAtlTdyKedWh9h8yYBFjbpgteuOCY2tFywM5JreXsQqfTjHh6Fl/qybg+3/Vk5BoVozEDGZi29VtiByQY24muI/kSip74tSO3TEv8wcRk2/bR+y4h3JvgF9qNwceOlz3zej3O3WSMubFm7gW3pLZ16i5UNxZrKZLT2jDuLXwyL4D09Q09GueVscvk+kwsQr+BJFE6NE72gkJYfckY+QxNsnrrc4ITr1pKknj3L4hMSRZzFS8dJakCQoEVqOUaBc+fpZd7FL8ZVppqDtY+JFN1x+e7jy3qVBNpcGmUsdaSUlSTf90Iekc4IQVjg4NQ5qU/WIQhJhJlOn+XsA0nZPdnT7tPVDGSdlVOoQI1HC4acQMQG1myxAdJFD5Ks3qPLeGIJV8LWkfI/0xLyNCHmEE2sn4vlB7AS7BURKqBJXX4haCzmATGR7DPYQUS8D/IcnzZMxfE91Yq5W7DW1S+PxhcDI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(2616005)(47076005)(7696005)(82310400005)(83380400001)(356005)(40460700003)(86362001)(70586007)(26005)(1076003)(426003)(70206006)(6666004)(450100002)(36860700001)(16526019)(186003)(41300700001)(8676002)(110136005)(478600001)(316002)(54906003)(336012)(36756003)(4326008)(5660300002)(2906002)(81166007)(8936002)(82740400003)(44832011)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:57.9562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9dad93-f828-4833-efa4-08db2ef3398e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6528
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

The debugger subscibes to nofication for requested exceptions on attach.
Allow the debugger to change its subsciption later on.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  3 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 36 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  2 ++
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 2a8d30dbb3f6..aa90e5874ad2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2966,6 +2966,9 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				args->send_runtime_event.exception_mask);
 		break;
 	case KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED:
+		kfd_dbg_set_enabled_debug_exception_mask(target,
+				args->set_exceptions_enabled.exception_mask);
+		break;
 	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE:
 	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
 	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index eead93e7fdc6..9ed364a20398 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -521,3 +521,39 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 
 	return r;
 }
+
+void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
+					uint64_t exception_set_mask)
+{
+	uint64_t found_mask = 0;
+	struct process_queue_manager *pqm;
+	struct process_queue_node *pqn;
+	static const char write_data = '.';
+	loff_t pos = 0;
+	int i;
+
+	mutex_lock(&target->event_mutex);
+
+	found_mask |= target->exception_status;
+
+	pqm = &target->pqm;
+	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
+		if (!pqn)
+			continue;
+
+		found_mask |= pqn->q->properties.exception_status;
+	}
+
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		found_mask |= pdd->exception_status;
+	}
+
+	if (exception_set_mask & found_mask)
+		kernel_write(target->dbg_ev_file, &write_data, 1, &pos);
+
+	target->exception_enable_mask = exception_set_mask;
+
+	mutex_unlock(&target->event_mutex);
+}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index c71f1595fdc8..f25dcf539f7b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -56,6 +56,8 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
 
 void debug_event_write_work_handler(struct work_struct *work);
 
+void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
+					uint64_t exception_set_mask);
 /*
  * If GFX off is enabled, chips that do not support RLC restore for the debug
  * registers will disable GFX off temporarily for the entire debug session.
-- 
2.25.1

