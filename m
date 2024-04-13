Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8468A3E12
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 20:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D79710E252;
	Sat, 13 Apr 2024 18:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="brHNpSgq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A59F10E10A;
 Sat, 13 Apr 2024 18:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeOYYfO5VQE7wTehqw0ntu9fG16XSA0ZpJpZ0WKh5Igw8O5UFdA8XVg3WdxmYbGjQaAa2z66JcV45DpBldA5P3wDhJltmWAgkbC9uoIhXuHUB+xw8Mjgo3g9tvpgeCbnRbxM2bHmWZQ+mzE8yCosGUeftbPn7iMU9uVSwBV2gLiqQ+L8GRNLsruq8ZalpwA4N+ak/0uY/Rl9aT6Z/4QLTwZq2zttJSxm1k9ddVekNVmOVfeWcnFkbPrTgpDWogpuNx/I0NWD3djIZh3+N4lKb69zfaTBpW1gPE1QNA+30S5Jcbr19E3/t33XzV5By/X8AHu1w58BkL6vfQbodiEw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nRY74qpWw05NuY7WmQxDeK9krWlp4Jjt2eyqOHcmOA=;
 b=Lp+HKS98PAK4NUzcuAUzjuNa0H9KUk7YsrT1Yb47sP/SR/jQ7QSF9/6/deg6uUdP4T0++CS9mKBg1kNZ/Xzi4qgQI114sAMHGi05YlL6s48YO0coXsxPZgTLFgBpoV4VgO85c6dY/qtyOZ8fy8Es8dp4snRd4P0jz6BmukdYcOxsxZAbcIODdrb4o2jfUq8S70QizAeq0sB55nmb2lGzy8fJKhhb6EUwO7WfS6o/ru6r0GgLFMa0AsAR6xmXMm3jm0cflizSJ5TG4jwCQADcdObk99crr6KOsg0rTOul1NOhhcsnTg8hX1Qx2433nYKMW91xdLKQ300IeXmra+x2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nRY74qpWw05NuY7WmQxDeK9krWlp4Jjt2eyqOHcmOA=;
 b=brHNpSgqnKrquZy7taGZhBA6VkDjtzvobB8+MHEq7pv9Az/tVkkyWG6kjs3pqDm7kJRLii44fbTjafHL+lDu9RZ/lP2LJaqJpncLoP1Oy7Zk/q5v0DdCn1V3X9pSt9gvawX26HWAhwXe/FLgbj4zFr36PFKy8aH+rHaonOcz7n0=
Received: from MN2PR16CA0033.namprd16.prod.outlook.com (2603:10b6:208:134::46)
 by PH7PR12MB7113.namprd12.prod.outlook.com (2603:10b6:510:1ec::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Sat, 13 Apr
 2024 18:07:21 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:134:cafe::20) by MN2PR16CA0033.outlook.office365.com
 (2603:10b6:208:134::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31 via Frontend
 Transport; Sat, 13 Apr 2024 18:07:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Sat, 13 Apr 2024 18:07:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 13 Apr
 2024 13:07:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 13 Apr
 2024 13:07:20 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sat, 13 Apr 2024 13:07:20 -0500
From: <vitaly.prosyak@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Xiaogang Chen <xiaogang.chen@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>
Subject: [PATCH] drm/amdkfd: fix NULL pointer dereference
Date: Sat, 13 Apr 2024 14:07:06 -0400
Message-ID: <20240413180706.232041-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|PH7PR12MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e035ce0-b261-446d-b87d-08dc5be4908f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxl9qT4vVwckxo1WF03vsMDqjSuLn2wxUzwC0THNHpF7FY4OlkNxSz0o+EMBJzw74QCQddMHYrDuEk4SaKetAGko9G3Ayqq+WKlmvcLTdkOMZ3DREPSzejM5uSJ9sH5xFIQJMiZ4t7OLq26uX6B3DvwyXSN5LCHvQS+qIqk605Y/UxeEewAp6ZmRK8nVBgzm42To35+8aqOceTbCzjTWTdUqsDfDpeQ16IQ7iGmPJcBNP5Gaq8c96RfAl3P78fx/Q0vPFztsN1mxC7gpF2XD8guuWXpDEhYQhmjL/P22xfyocnBV+wOKADawwAESEzRFnuXqeDJJrf2reMQg0mMgAl9HBuQnTRKkFWMvzrvIvwqm0Qn2xWAbZiM/I5h5UjelwdvWptY5CnQLJeF7rUytY7v2b+oIOfT+bkzvspLO7P3RpdK6fS01BQOHUjG90ggslg5CUVOWXPwU9M5Xe5qF67/ajYdiX7xCRAwHB8a78Ackt0VJRmN24rG9JSQSV4Fwhfqx8qkDuT/P0fOoZuDLn/Aa15DVvvT9+RZMoTSLim70Zp3MHTKRVTUKxeaUz4LyTf+bspXe7iaJ2pdAO4F9AUxNTcQzT8nszc7JbEVhBp3gSs0ZZgt1ZKzswaFWCqqqdHLc4HGWzfLghnwyIzpGd9qfYoUmT76OHW3IQQGt/p/8ARKGDM3+6Ug1D8ZRhJWsqWLGjMQI/7f7bdKI/pF+p+3QWOuPwuQbdeJi/Zjym6kFOxemOtHkPPPpTeTl8A1w
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2024 18:07:21.5308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e035ce0-b261-446d-b87d-08dc5be4908f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7113
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

[  +0.006038] BUG: kernel NULL pointer dereference, address: 0000000000000028
[  +0.006969] #PF: supervisor read access in kernel mode
[  +0.005139] #PF: error_code(0x0000) - not-present page
[  +0.005139] PGD 0 P4D 0
[  +0.002530] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  +0.004356] CPU: 11 PID: 12625 Comm: kworker/11:0 Tainted: G        W          6.7.0+ #2
[  +0.008097] Hardware name: ASUS System Product Name/Pro WS WRX80E-SAGE SE WIFI II, BIOS 1302 12/08/2023
[  +0.009398] Workqueue: events evict_process_worker [amdgpu]
[  +0.005750] RIP: 0010:evict_process_worker+0x2f/0x460 [amdgpu]
[  +0.005991] Code: 55 48 89 e5 41 57 41 56 4c 8d b7 a8 fc ff ff 41 55 41 54 53 48 89 fb 48 83 ec 10 0f 1f 44 00 00 48 8b 43 f8 8b 93 b0 00 00 00 <48> 3b 50 28 0f 85 50 03 00 00 48 8d 7b 58 e8 ee be cb bf 48 8b 05
[  +0.018791] RSP: 0018:ffffc90009a2be10 EFLAGS: 00010282
[  +0.005226] RAX: 0000000000000000 RBX: ffff888197ffc358 RCX: 0000000000000000
[  +0.007140] RDX: 0000000000000a1b RSI: 0000000000000000 RDI: ffff888197ffc358
[  +0.007139] RBP: ffffc90009a2be48 R08: 0000000000000000 R09: 0000000000000000
[  +0.007139] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888197ffc358
[  +0.007139] R13: ffff888100153a00 R14: ffff888197ffc000 R15: ffff888100153a05
[  +0.007137] FS:  0000000000000000(0000) GS:ffff889facac0000(0000) knlGS:0000000000000000
[  +0.008094] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.005747] CR2: 0000000000000028 CR3: 000000010d1fc001 CR4: 0000000000770ef0
[  +0.007138] PKRU: 55555554
[  +0.002702] Call Trace:
[  +0.002443]  <TASK>
[  +0.002096]  ? show_regs+0x72/0x90
[  +0.003402]  ? __die+0x25/0x80
[  +0.003052]  ? page_fault_oops+0x154/0x4c0
[  +0.004099]  ? do_user_addr_fault+0x30e/0x6e0
[  +0.004357]  ? psi_group_change+0x237/0x520
[  +0.004185]  ? exc_page_fault+0x84/0x1b0
[  +0.003926]  ? asm_exc_page_fault+0x27/0x30
[  +0.004187]  ? evict_process_worker+0x2f/0x460 [amdgpu]
[  +0.005377]  process_one_work+0x17b/0x360
[  +0.004011]  ? __pfx_worker_thread+0x10/0x10
[  +0.004269]  worker_thread+0x307/0x430
[  +0.003748]  ? __pfx_worker_thread+0x10/0x10
[  +0.004268]  kthread+0xf7/0x130
[  +0.003142]  ? __pfx_kthread+0x10/0x10
[  +0.003749]  ret_from_fork+0x46/0x70
[  +0.003573]  ? __pfx_kthread+0x10/0x10
[  +0.003747]  ret_from_fork_asm+0x1b/0x30
[  +0.003924]  </TASK>

When we run stressful tests, the eviction fence could be zero and not match
to last_eviction_seqno.

Avoid calling dma_fence_signal and dma_fence_put with zero fences to rely
on checking parameters in DMA API.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Xiaogang Chen <xiaogang.chen@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index eb380296017d..a15fae1c398a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -2118,7 +2118,7 @@ static void evict_process_worker(struct work_struct *work)
 	 */
 	p = container_of(dwork, struct kfd_process, eviction_work);
 	trace_kfd_evict_process_worker_start(p);
-	WARN_ONCE(p->last_eviction_seqno != p->ef->seqno,
+	WARN_ONCE(p->ef && p->last_eviction_seqno != p->ef->seqno,
 		  "Eviction fence mismatch\n");
 
 	/* Narrow window of overlap between restore and evict work
@@ -2134,9 +2134,11 @@ static void evict_process_worker(struct work_struct *work)
 	pr_debug("Started evicting pasid 0x%x\n", p->pasid);
 	ret = kfd_process_evict_queues(p, false, KFD_QUEUE_EVICTION_TRIGGER_TTM);
 	if (!ret) {
-		dma_fence_signal(p->ef);
-		dma_fence_put(p->ef);
-		p->ef = NULL;
+		if (p->ef) {
+			dma_fence_signal(p->ef);
+			dma_fence_put(p->ef);
+			p->ef = NULL;
+		}
 
 		if (!kfd_process_unmap_doorbells_if_idle(p))
 			kfd_process_schedule_restore(p);
-- 
2.25.1

