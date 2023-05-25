Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0148711257
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E667010E715;
	Thu, 25 May 2023 17:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F0B10E6E1;
 Thu, 25 May 2023 17:28:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S16QQNmpK+mxOLyyKQvsW/KQevt77ahlM7ldLynsB55NDGlh1PWQL7mHuFWFHF7+ZmcQ2lLIo5xR/5hGhxaLXzLvY+mmWCK5GZaY2E4kaWgEYIrgrVG/bwE5yKQIlVifnjLDO3bCRYQdQLIfi4LVNZykQK004RNGSGkTYPk1FUMsHgnyqfz7on7dLDBNAQ3a9+A8DvQotq/TR+a37b64o3DDctJgH1X6sLE4qjyUymOZErtySjHbOo5kpCTlTeRIi5znKft9F/5gGMNNIQMwZbAGXdm9kaPVEUB73cGEMFHpNMyTfrdcUCCTWWpbXc2Bfihu0maWUVXb9gzcQbZS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrGPRGm0a+MLkvaF0QFs6Zey1FuyfhQwHQAGMfacaBQ=;
 b=EnWoS3DYvyb9+E7WV2xdZ/F/zaef95YKKjtnDNvPgSAQp5pUlTpI7E2LaT3Yuci0WKnN6H2vRcs6bky7v3py5he/bkpcGQdiXW3oSqjcEe6CgMeGj0lyAvFh5Firo3FrglYzRIPWSrWQmZB6XmULogPR1SfX86uj8IUUHmcSjflTB06dud569333mjyPuJSwEwwhHmCKxtw85MphCrUKcEhyj5ILOsRt+4f9PkvDKWug8HV19dFupODAzjR2q7kJaGgBl4H+c/ipdDjVLxAy+IUcyjUyVRSV7Ox5uyAtECScWFu3iEXqZT5Yol+OCO7OyBqhlt+kainwTjBD+GB9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrGPRGm0a+MLkvaF0QFs6Zey1FuyfhQwHQAGMfacaBQ=;
 b=y4hq0b3c6nY/Bu2ESxCJuQSiYXaRufCUztwhbpknG6X40+iWTLFIGscmTQbH3ONCkeaWYG6kueQwS/MzY2Fp0KISc0ujSj56VXiCxzHpryHlu3AwFam52/v+9/sXLynsE2vtAfVHvjHVPwY6ByVwKTWm8hK6xZ8M/ZXjvhheIJU=
Received: from MW4PR03CA0150.namprd03.prod.outlook.com (2603:10b6:303:8c::35)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 17:28:06 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::e5) by MW4PR03CA0150.outlook.office365.com
 (2603:10b6:303:8c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:06 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:04 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 23/33] drm/amdkfd: add debug set exceptions enabled operation
Date: Thu, 25 May 2023 13:27:35 -0400
Message-ID: <20230525172745.702700-23-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5b6adc-b065-4d5e-44df-08db5d45670d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HlDWyza6Ff7Z7lo/YetdAp9ZwzQbCACOcAD/SMqjMU3z5A/4HI+x5rMIjm8zM29HYIUt/nP7jJt/8Ks/7PgnDI0LnWPrP/wiDcZuh4ed03R5VpdSfdw9DsKBxeoyWpAiu9rUvW1mMRxYxu7Mq5ITbj4gdhLtQGluOKbCeTOuuePH+IShQjMai5o2FyB7hbwELqd9WZxQdIYjG4YL8ZEJu5AVAVB9nQKJoMI3gfApms154iuz2yrT8DGVomnO+CRshrsJdm8gH8TfXxV796/waWp5PU1rvoXVyY8LqXYX/3Yk0NlJw6oKDr+4vpDV2/KD3TLyMItpy2FIaYXZe7kdReY0DZ35GUZk/hYhd2TJVjkxL4ey8ZxJZQOLwdpdoFJwd5NMMaJmgZqsxyEbLwuByKF9JADGaRCply8q09zg3ag14MPTH2Re7wflxcCjxn86sh8pDh1JU1KPh/J1LW8Bq5SsdaaosCTdVLFhto0Oxn/EnqU7JlvQ1Ur00ECCjjJQrd9h3r6+Uvy6QqV/hMoABbNOp83nS/IlkP7ARtfNOs54HzpPfO9QhBSz0EQL1b59e+5rNLd88bN+B3MT6Eqo3ld6bMoOldWE1Z5CnN/n6MMEty9ODi4TL+AeEGM285NPMgpfkfjdCyewNYvyN3MB04+UFC19/cKHqpz557SFFOPY1f2CObocXiv3KnO+6vsnri4+xuCVLI1+uAS6bAbz9ZFvxIg++3UBrXQ+27lSaZuAOnJAR3w77acKEVfNhnJG2clobYV213yu+91TFd7/Eg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(82310400005)(86362001)(356005)(81166007)(40480700001)(36756003)(40460700003)(44832011)(26005)(1076003)(16526019)(186003)(5660300002)(83380400001)(336012)(426003)(47076005)(2906002)(2616005)(70206006)(450100002)(70586007)(110136005)(8676002)(8936002)(4326008)(6636002)(7696005)(41300700001)(6666004)(478600001)(316002)(82740400003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:06.4700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5b6adc-b065-4d5e-44df-08db5d45670d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604
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
index 73cb5abce431..80d354eade35 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2980,6 +2980,9 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 68b657398d41..48a4e3cc2234 100644
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
index 5153ccbd7fd1..6c1054a08872 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -56,6 +56,8 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
 
 void debug_event_write_work_handler(struct work_struct *work);
 
+void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
+					uint64_t exception_set_mask);
 /*
  * If GFX off is enabled, chips that do not support RLC restore for the debug
  * registers will disable GFX off temporarily for the entire debug session.
-- 
2.25.1

