Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1317C67BB50
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D1910E822;
	Wed, 25 Jan 2023 19:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E42B10E391;
 Wed, 25 Jan 2023 19:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbwOEQoWZFLgin19Q9vTPcA/IZTfunnLPaSg/X6eg4dCNvm+qtklHO3uO3Lp6VBYrm17d0fpDZ6c06E12Zixzpw24xOkZtI5Kwzpm6mVOF9CozOLoGMdTIRULsgVd0AEbqmvDw4Bbc+Bf+8XQcEQh3oCvnHbXX20I+5baXxzisUyi00TVYMugaIPJzyg2+o3vcfFfPi7JOFj/30ULRTdOBrRbIUSnBQblZNYcvvg6wYoQ5rgxjNNcBeLqP1g1kAm1FkThtR0Uq9KWz5kwjGgStVgUdnXrLymAN/kM1hV/kl5LGEPa+yVcUlnQyaANryVoYwRnOvtXU8UbJg66ef1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HgrKnOpD/doJ2MhrMxteev9rbFKEo4cS7OU7Y9ho9c=;
 b=Hl4Xo7xJ+4/iyfZePbDiL5Rri/YvYBhhSwHyQ+V2Xl2wc89h+rVxSq+LL9LHjbxezW1Ux41F4Y7rsv0k4KJXsLaJk+Lqzc5R3g2wbnVeB2+AT0HJWISz8K2mado4+BJkq+NGpWqgsaEZXA6ge2rceO9GZFH+L59op0Bt1UTBBxxcqZJRBA721X0Nsxhxe5B0cSCeboAS5nbKcwnIZ5i7op7G1v+8op8wZp1Z4sDmce9EYzKCgWk+0dzi47kXVls5VVBMHAu5AtyXKq5R+KC2UmbV4OFhv/vEY8nxpS+A8zxj0DckkYDCwQDtudswlCcpkYo7vFoDosGTBha4m54AxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HgrKnOpD/doJ2MhrMxteev9rbFKEo4cS7OU7Y9ho9c=;
 b=5jPIJY/AK6FuVLbf9ZAks36uXBPrrfUGj7y9g5WMbExcAn6ggMrHfamZ9760dWJWhrCffVlDoh/X1TsvSxDCUFhmMtLxE+9Qq95e0vEy/8kGhQ3NcY9xz6SBLt4fnaKIZYNZYKwX9b/LXarJ67cmYcqtx5aeuYSRhhLtN1a3IBE=
Received: from BN9PR03CA0706.namprd03.prod.outlook.com (2603:10b6:408:ef::21)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 19:54:24 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::6e) by BN9PR03CA0706.outlook.office365.com
 (2603:10b6:408:ef::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:24 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:23 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 22/32] drm/amdkfd: add debug set exceptions enabled operation
Date: Wed, 25 Jan 2023 14:53:51 -0500
Message-ID: <20230125195401.4183544-23-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 936e00d5-4725-4c9f-cc3c-08daff0df5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l3lRh28BECWHYgVhBNWUsJfMQC4Htj01JBbiNsQtNRoIc87m5IYAMAptZ6GV5XfkZj0O55qv6zlzlsmFtQf/owaT6f7SEf04wkYeeD3aj6E9/d+C7Ds5NDooNZpH4gIyBIBinxY3dK2DQd+Tvu6JkVLsT1sOVCIrbpIxGduUoCQdTxmfrbypKzTIz2WCM9JjYAczzY4Z0nFKz6NOhHIkgzmaUBX8I0Mwffo9tAvzdTw2RgoNGIT2tteAe2P00y85CG7b2ZsIOkQ9f0p6l58dpujHMabM/bfohuoKoA/b0Bfgf8g4qn6iW9jDGHvsBi/Z4QFGEjcVkNdkoAvKG87j69xgbf3owlRNtdPHh0TQaaUc2t13LdS15DNX2+UWnHV7xEzg0rnFhC68J3Gd/KbQ+YuOj8kv/1nBRU7tWKqWFcgGZulJcIEdYrAzKVd2pPep4+rMSgmnPr0fXegRWRRxPkGHHxdFKiD5zkazQKvPI5Jo/0J+s6jG53+Gj84sO4x8pKTz+40RED3umaLqXzykOM6mlx4JAxHZPDYw49McyRz4fBEWAhPX/8G/3hyU238sngqxok6DKoFpEHkjdUmCLGzb95PgFmp0sux7mFmrKY2ppmWHp9A1xVmOtnkOBPXP1RvxazMNfaa51xKh4I2Qv8qMKHGr22OeYorLSeu2d3WhfAXB1PcV/FRCOU+KoppReXd6Kzt1xgZDzHOqdV1OdkqrypZnldudfp3sBw2iR0Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(36756003)(8676002)(26005)(7696005)(316002)(110136005)(478600001)(82740400003)(1076003)(5660300002)(6666004)(44832011)(70586007)(2906002)(450100002)(41300700001)(4326008)(8936002)(70206006)(36860700001)(356005)(81166007)(40480700001)(83380400001)(54906003)(426003)(82310400005)(86362001)(336012)(16526019)(2616005)(47076005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:24.7408 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 936e00d5-4725-4c9f-cc3c-08daff0df5ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584
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
index 46f9d453dc5e..9b87ba351eff 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2892,6 +2892,9 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 0c876172db4b..3ea53aaa776b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -529,3 +529,39 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 
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
index 43284243b2c4..81557579ab04 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -59,6 +59,8 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
 
 void debug_event_write_work_handler(struct work_struct *work);
 
+void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
+					uint64_t exception_set_mask);
 /*
  * If GFX off is enabled, chips that do not support RLC restore for the debug
  * registers will disable GFX off temporarily for the entire debug session.
-- 
2.25.1

