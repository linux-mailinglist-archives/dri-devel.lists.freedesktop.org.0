Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB424A929B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 04:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1803110E825;
	Fri,  4 Feb 2022 03:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77E810E82A;
 Fri,  4 Feb 2022 03:12:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oB/KoVSytQuFnQ747p+0Q7KElVUtSULf0Ri4O3IZWNi48HOto42ZCSemUVXKv0v+0qzq7czrmq5fLqZupGOAjYn5hUsTVX6HyqHl+RI7G1AVdjEBtvyn6z0EiXBPOQjwhuNAe/a1iB8swKVZu0aA3DpBtQ1tkIHRJ7c1KvLdgwaI2g0VQEHrjFI9SfwVsw4Sc47dFkiD+oQ1Z2urZQefY7zeqKhv2yFCTCzWrYuSbYaeovu34xUXJBYIcblM4dqwU5f1r39X9ahEWJeJS3W7NKa/TjzZNb8prx1U41ZjvKWp9Yvdn3vdoizQyJWyu+f7JpDjKmRJbWkw4W8yzPTopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9NGLwoD5IS4JnjDojWRG60EvOGkVWEJcad+hQPmhDc=;
 b=EJX6v5UnwnCffI70RdY4lKo27R5QVs+6GWLUgsbIW1JSMZYH9Hd+yCs+A14Z28zBKLMOXKtWN+KfUAlBrbXmgo8U8r3JxerzEmCxoB4uVTlJYt9kc5g1kRbAj8Bjfil9W+fkyBDxoyHvoIvnYWoo+oIQUTbUpWrjhk5C+2Ny9X/aVzbD8nwZUedsMTnYZozkf7ly0fIEM/OJG4GJwWATa1heU/l/ZgtkZdvMObF/prGGpWijdBwOx/dOcJ+CRM9qoPXh0yXgNkZ93VVngtNaV2mYCM622pLCnQcilYtSM/tWrknBIx5i7EAoHMO0fS3PiIfatfPGc5J5slC3EnBcDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9NGLwoD5IS4JnjDojWRG60EvOGkVWEJcad+hQPmhDc=;
 b=kODWKCSKRerVpN/nhaW191bQnDvN5GO4sP8IaPs2XM9k1a4w7bGG6V/ZHL+2cApW13ac+3H8i1rlGIuvrG73EvIdI/bc0xSDiSK1YFIGiF8XnS9viiwT32Wry+9jRZLqN2NbJkMAqjk8+Khv6ASuK1tq85Exe51xaG6nOT22UXM=
Received: from MWHPR17CA0096.namprd17.prod.outlook.com (2603:10b6:300:c2::34)
 by SJ0PR12MB5485.namprd12.prod.outlook.com (2603:10b6:a03:305::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 03:12:07 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::6e) by MWHPR17CA0096.outlook.office365.com
 (2603:10b6:300:c2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14 via Frontend
 Transport; Fri, 4 Feb 2022 03:12:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Fri, 4 Feb 2022 03:12:07 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 21:12:05 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix recursive locking warning
Date: Thu, 3 Feb 2022 22:11:39 -0500
Message-ID: <20220204031139.24717-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72b20eed-a1a0-41e7-5f1c-08d9e78c206c
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5485:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB54858D245CACEC4446A44A4AFE299@SJ0PR12MB5485.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fV/dMemYoLEv2i8VDNcOzX2YaG5/Zz3ibrHQxKVmON/xmNxdS8gSjJDbi3oD1I11Z7dKUAU56vrBLWP7gRLIwQT5IFE/9Fk4Bwsh7meF1V1g9eqFqg9v4CZ9fTRbjs4h8Ezp+BhlSC06AnQN5POvDS5hsFebzk5k1sp28PSD/JkUV3lEm6IV35FJhK/44NCCdj1OPPe4MxyLts2tgp8wZ5Bc/ElC5E9+vs+lDrJypDq07KOpQFkzGhZY6gvRhxzO7+8fTyk+fnyyQBxxgPX3wglnlthj17EofqzXlIK24uUWo+WG3lhLzTysHGR8/mIBKa0OD2VoiuTBj0NI8342oeJ4tS2HWsG0X4MLhozEdycgXJt3TfsLLb1l/E3gi+1iflf8Eml9KTPfYekhAzcte0FktCqV92Z11EYk9kfMp/IWY++llQqWfnfsy0hGAzKrJDupdIvRzFMw/WEkprYvKbI4uwAbNGm6BrTg+K72KMhFp3/KKemtR1Lg4b54SX8/50UWC5gkFGfkd3fUZEc8N8+dTFuSjnVh1iGQFlynnECM3rk5Ma20i2VEABRn4nKoEr8lvU2/t4uI8VaU6EbfcN7ObnqRb4SwgdFJGz0oa6JxqqqGq6kXwk3g+prgHMghtUww/9lHWj7vbue53DDG7M5Mrp1X5IYqaUwlSFzK9vGq7SGjsb4JJ4dN2lKNIQ/xLgPZcNgMDE53BHOhYdE2HA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(356005)(83380400001)(16526019)(1076003)(6916009)(26005)(54906003)(186003)(81166007)(316002)(36756003)(44832011)(7696005)(82310400004)(86362001)(450100002)(2906002)(36860700001)(47076005)(2616005)(66574015)(40460700003)(6666004)(8676002)(426003)(4326008)(508600001)(336012)(70586007)(70206006)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 03:12:07.3171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b20eed-a1a0-41e7-5f1c-08d9e78c206c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5485
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
Cc: Alex
 Deucher <Alexander.Deucher@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed the below warning while running a pytorch workload on vega10
GPUs. Change to trylock to avoid conflicts with already held reservation
locks.

[  +0.000003] WARNING: possible recursive locking detected
[  +0.000003] 5.13.0-kfd-rajneesh #1030 Not tainted
[  +0.000004] --------------------------------------------
[  +0.000002] python/4822 is trying to acquire lock:
[  +0.000004] ffff932cd9a259f8 (reservation_ww_class_mutex){+.+.}-{3:3},
at: amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
[  +0.000203]
              but task is already holding lock:
[  +0.000003] ffff932cbb7181f8 (reservation_ww_class_mutex){+.+.}-{3:3},
at: ttm_eu_reserve_buffers+0x270/0x470 [ttm]
[  +0.000017]
              other info that might help us debug this:
[  +0.000002]  Possible unsafe locking scenario:

[  +0.000003]        CPU0
[  +0.000002]        ----
[  +0.000002]   lock(reservation_ww_class_mutex);
[  +0.000004]   lock(reservation_ww_class_mutex);
[  +0.000003]
               *** DEADLOCK ***

[  +0.000002]  May be due to missing lock nesting notation

[  +0.000003] 7 locks held by python/4822:
[  +0.000003]  #0: ffff932c4ac028d0 (&process->mutex){+.+.}-{3:3}, at:
kfd_ioctl_map_memory_to_gpu+0x10b/0x320 [amdgpu]
[  +0.000232]  #1: ffff932c55e830a8 (&info->lock#2){+.+.}-{3:3}, at:
amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x64/0xf60 [amdgpu]
[  +0.000241]  #2: ffff932cc45b5e68 (&(*mem)->lock){+.+.}-{3:3}, at:
amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0xdf/0xf60 [amdgpu]
[  +0.000236]  #3: ffffb2b35606fd28
(reservation_ww_class_acquire){+.+.}-{0:0}, at:
amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x232/0xf60 [amdgpu]
[  +0.000235]  #4: ffff932cbb7181f8
(reservation_ww_class_mutex){+.+.}-{3:3}, at:
ttm_eu_reserve_buffers+0x270/0x470 [ttm]
[  +0.000015]  #5: ffffffffc045f700 (*(sspp++)){....}-{0:0}, at:
drm_dev_enter+0x5/0xa0 [drm]
[  +0.000038]  #6: ffff932c52da7078 (&vm->eviction_lock){+.+.}-{3:3},
at: amdgpu_vm_bo_update_mapping+0xd5/0x4f0 [amdgpu]
[  +0.000195]
              stack backtrace:
[  +0.000003] CPU: 11 PID: 4822 Comm: python Not tainted
5.13.0-kfd-rajneesh #1030
[  +0.000005] Hardware name: GIGABYTE MZ01-CE0-00/MZ01-CE0-00, BIOS F02
08/29/2018
[  +0.000003] Call Trace:
[  +0.000003]  dump_stack+0x6d/0x89
[  +0.000010]  __lock_acquire+0xb93/0x1a90
[  +0.000009]  lock_acquire+0x25d/0x2d0
[  +0.000005]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
[  +0.000184]  ? lock_is_held_type+0xa2/0x110
[  +0.000006]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
[  +0.000184]  __ww_mutex_lock.constprop.17+0xca/0x1060
[  +0.000007]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
[  +0.000183]  ? lock_release+0x13f/0x270
[  +0.000005]  ? lock_is_held_type+0xa2/0x110
[  +0.000006]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
[  +0.000183]  amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
[  +0.000185]  ttm_bo_release+0x4c6/0x580 [ttm]
[  +0.000010]  amdgpu_bo_unref+0x1a/0x30 [amdgpu]
[  +0.000183]  amdgpu_vm_free_table+0x76/0xa0 [amdgpu]
[  +0.000189]  amdgpu_vm_free_pts+0xb8/0xf0 [amdgpu]
[  +0.000189]  amdgpu_vm_update_ptes+0x411/0x770 [amdgpu]
[  +0.000191]  amdgpu_vm_bo_update_mapping+0x324/0x4f0 [amdgpu]
[  +0.000191]  amdgpu_vm_bo_update+0x251/0x610 [amdgpu]
[  +0.000191]  update_gpuvm_pte+0xcc/0x290 [amdgpu]
[  +0.000229]  ? amdgpu_vm_bo_map+0xd7/0x130 [amdgpu]
[  +0.000190]  amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x912/0xf60
[amdgpu]
[  +0.000234]  kfd_ioctl_map_memory_to_gpu+0x182/0x320 [amdgpu]
[  +0.000218]  kfd_ioctl+0x2b9/0x600 [amdgpu]
[  +0.000216]  ? kfd_ioctl_unmap_memory_from_gpu+0x270/0x270 [amdgpu]
[  +0.000216]  ? lock_release+0x13f/0x270
[  +0.000006]  ? __fget_files+0x107/0x1e0
[  +0.000007]  __x64_sys_ioctl+0x8b/0xd0
[  +0.000007]  do_syscall_64+0x36/0x70
[  +0.000004]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  +0.000007] RIP: 0033:0x7fbff90a7317
[  +0.000004] Code: b3 66 90 48 8b 05 71 4b 2d 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 41 4b 2d 00 f7 d8 64 89 01 48
[  +0.000005] RSP: 002b:00007fbe301fe648 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  +0.000006] RAX: ffffffffffffffda RBX: 00007fbcc402d820 RCX:
00007fbff90a7317
[  +0.000003] RDX: 00007fbe301fe690 RSI: 00000000c0184b18 RDI:
0000000000000004
[  +0.000003] RBP: 00007fbe301fe690 R08: 0000000000000000 R09:
00007fbcc402d880
[  +0.000003] R10: 0000000002001000 R11: 0000000000000246 R12:
00000000c0184b18
[  +0.000003] R13: 0000000000000004 R14: 00007fbf689593a0 R15:
00007fbcc402d820

Cc: Christian König <christian.koenig@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>

Fixes: 627b92ef9d7c ("drm/amdgpu: Wipe all VRAM on free when RAS is
enabled")
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 36bb41b027ec..6ccd2be685f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1306,7 +1306,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
 		return;
 
-	dma_resv_lock(bo->base.resv, NULL);
+	if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
+		return;
 
 	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence);
 	if (!WARN_ON(r)) {
-- 
2.17.1

