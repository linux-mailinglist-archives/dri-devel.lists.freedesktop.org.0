Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B22087C7A0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 03:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E1110E0B1;
	Fri, 15 Mar 2024 02:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3vh987aN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A81B10E0B1;
 Fri, 15 Mar 2024 02:39:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFpqXQdjUHJCEDyOuAkkerKM0UbokAoLbjPO2bjQk0d/y0KOo0GvYYtBL+lA2uIWMCLqCfCg/KKsdPSm49nL+uvwBR+Ej52/LhqW020gPWXXd0XmifGJqIyhdOLDmtLnh8KnwSpJPNqNewCNs95ckD6jmpKxlonQXt894EsRA0MJhfvyadwXwZ9vdKFSlN/E3jazqPx4gSyGYlTofwqTVqCs/m7gG4ozHdJB5ZPkKH5/epLn+MFsVt/NU8TbfC7YVnFhf1M8HUxecSOqyw9fVd49ly/klVIk5Eky+rXx17CsMTQABpMtpK25+wVY282OcT2xEBDReO7Za9+lbQ2hvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WalW9tam96DFNhJBId1wRFgmXkaSmxkWI3RX539JXJM=;
 b=WPmKwxAQlRoP5KD28pbBAjC1HmbmUru52/2BS7dFabTUZIa98cZL7jzFa42bm5oV0w/BD7xwaXPDvWIIa/FNMoBFaTyL+GlxNe+t4HPCTF/G0KM8whH+6llgYZLgmIHPXpeGg057d3CNuthAm0b36N9BGuu4jcYymoiD/WrJcavfPRsdHqo35kMSpKDE47wYV7WNzXpLiRe9E0lGHPyBvMt2LKR1tImlY+2tTBFxG9mABrx4dAW5vZABAeAvBK9rL1KeKKc533uj/VqvXmBQnH9m/dov7WomZHSPnHHmaW6XsZXGiUQ3EHUaxEedfQifu6Wql3vIzKghbOqOVWZWjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WalW9tam96DFNhJBId1wRFgmXkaSmxkWI3RX539JXJM=;
 b=3vh987aNE3+QfUGCjL5PWI6cbf8PbSqb9Q93fUaASINqmQckEPq9RF4eSfN6dMT3XEuzb8i/gZCN4sh7djzEHvQWgoJDE1jRrNm+GDgyOFIgws6z9vhNDvrUX71DJo0+T0H/iO5g1tkYICKD3ZLY8Nv08+uuRIZW/Ezyfqdt3q4=
Received: from MN2PR13CA0013.namprd13.prod.outlook.com (2603:10b6:208:160::26)
 by CH2PR12MB4246.namprd12.prod.outlook.com (2603:10b6:610:a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Fri, 15 Mar
 2024 02:39:38 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:160:cafe::9) by MN2PR13CA0013.outlook.office365.com
 (2603:10b6:208:160::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.8 via Frontend
 Transport; Fri, 15 Mar 2024 02:39:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Fri, 15 Mar 2024 02:39:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 21:39:32 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 14 Mar 2024 21:39:32 -0500
From: <vitaly.prosyak@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Luben
 Tuikov" <ltuikov89@gmail.com>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Dokyung Song <dokyungs@yonsei.ac.kr>,
 <jisoo.jang@yonsei.ac.kr>, <yw9865@yonsei.ac.kr>
Subject: [PATCH] drm/sched: fix null-ptr-deref in init entity
Date: Thu, 14 Mar 2024 22:39:26 -0400
Message-ID: <20240315023926.343164-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|CH2PR12MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: 779cde0d-08cd-498c-ecd1-08dc4499287c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2/EL197Re/qtjbmp54Yx15LFzk9z5HB9l2OAAKseNb7wf6QwUK3ZDODKWwnMZbCkWp7kGkDWVa5y8FE3CF3BEdXEKiyE8wluHWGN76ubd8QTCjMwb1AUTsFjHFKC1LFo8Cjl12nCDWst5RMHCA6FndGZ6Bx3nC5/US+9t+jtQ8kAcQTMPlhi5MDEvLHUd2Iru3i0eYLtbnT9G9BB0ptSPYOXSl/K5zRgWevdDB1jPX7UezPlGOLu+haU6cEzinJCTKmHey+wRdHhdpYXubln3dUbAxDRCcLGD2aacBr0ju9oPgeSMHpaILafjYcQmuExcn8UOGY/SKysCIQTixJvcfGVIWaRKYYZWarK8gYqM5yqp/ecaSpgT/cJVOkFw3T4I2EgEcT6w7APZeoOdrtslZokCgvbd2qfblo5KoAFYb0xim+dS94y+8xo82VmsFQp1MhKZ0AOWf/eDvFRBa6+Z6VJLMi8tmbTsbJtgbAItK48myRAid5OR/OjWEwEHK5QZyNzSvSBq1W+THZUJujvciIfaqOY1akSshmcDV93jq9NoU5kGtiWjuCjyy4WqpeuUJgGU4dy6fqU4byw0/5UIG6X2Hxrq/OztmhowVMvz5P0GEcOgjskfsJxeQSEUph9LfKLhq1RmSjOuB+/CSZDkU5JjsbSprtwlfmFbDDL7j/yjaF83TbK8Hq3MLmww7iWE98XBBG+rtHZkeZgZ4p7oSzqeBqyJQpm/fR0yE/Z971m1ojRuyHC0/DrVYrW5m4
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 02:39:37.9259 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 779cde0d-08cd-498c-ecd1-08dc4499287c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4246
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

The bug can be triggered by sending an amdgpu_cs_wait_ioctl
to the AMDGPU DRM driver on any ASICs with valid context.
The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
For example the following code:

    static void Syzkaller2(int fd)
    {
	union drm_amdgpu_ctx arg1;
	union drm_amdgpu_wait_cs arg2;

	arg1.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
	ret = drmIoctl(fd, 0x140106442 /* amdgpu_ctx_ioctl */, &arg1);

	arg2.in.handle = 0x0;
	arg2.in.timeout = 0x2000000000000;
	arg2.in.ip_type = AMD_IP_VPE /* 0x9 */;
	arg2->in.ip_instance = 0x0;
	arg2.in.ring = 0x0;
	arg2.in.ctx_id = arg1.out.alloc.ctx_id;

	drmIoctl(fd, 0xc0206449 /* AMDGPU_WAIT_CS * /, &arg2);
    }

The ioctl AMDGPU_WAIT_CS without previously submitted job could be assumed that
the error should be returned, but the following commit 1decbf6bb0b4dc56c9da6c5e57b994ebfc2be3aa
modified the logic and allowed to have sched_rq equal to NULL.

As a result when there is no job the ioctl AMDGPU_WAIT_CS returns success.
The change fixes null-ptr-deref in init entity and the stack below demonstrates
the error condition:

[  +0.000007] BUG: kernel NULL pointer dereference, address: 0000000000000028
[  +0.007086] #PF: supervisor read access in kernel mode
[  +0.005234] #PF: error_code(0x0000) - not-present page
[  +0.005232] PGD 0 P4D 0
[  +0.002501] Oops: 0000 [#1] PREEMPT SMP KASAN NOPTI
[  +0.005034] CPU: 10 PID: 9229 Comm: amd_basic Tainted: G    B   W    L     6.7.0+ #4
[  +0.007797] Hardware name: ASUS System Product Name/ROG STRIX B550-F GAMING (WI-FI), BIOS 1401 12/03/2020
[  +0.009798] RIP: 0010:drm_sched_entity_init+0x2d3/0x420 [gpu_sched]
[  +0.006426] Code: 80 00 00 00 00 00 00 00 e8 1a 81 82 e0 49 89 9c 24 c0 00 00 00 4c 89 ef e8 4a 80 82 e0 49 8b 5d 00 48 8d 7b 28 e8 3d 80 82 e0 <48> 83 7b 28 00 0f 84 28 01 00 00 4d 8d ac 24 98 00 00 00 49 8d 5c
[  +0.019094] RSP: 0018:ffffc90014c1fa40 EFLAGS: 00010282
[  +0.005237] RAX: 0000000000000001 RBX: 0000000000000000 RCX: ffffffff8113f3fa
[  +0.007326] RDX: fffffbfff0a7889d RSI: 0000000000000008 RDI: ffffffff853c44e0
[  +0.007264] RBP: ffffc90014c1fa80 R08: 0000000000000001 R09: fffffbfff0a7889c
[  +0.007266] R10: ffffffff853c44e7 R11: 0000000000000001 R12: ffff8881a719b010
[  +0.007263] R13: ffff88810d412748 R14: 0000000000000002 R15: 0000000000000000
[  +0.007264] FS:  00007ffff7045540(0000) GS:ffff8883cc900000(0000) knlGS:0000000000000000
[  +0.008236] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.005851] CR2: 0000000000000028 CR3: 000000011912e000 CR4: 0000000000350ef0
[  +0.007175] Call Trace:
[  +0.002561]  <TASK>
[  +0.002141]  ? show_regs+0x6a/0x80
[  +0.003473]  ? __die+0x25/0x70
[  +0.003124]  ? page_fault_oops+0x214/0x720
[  +0.004179]  ? preempt_count_sub+0x18/0xc0
[  +0.004093]  ? __pfx_page_fault_oops+0x10/0x10
[  +0.004590]  ? srso_return_thunk+0x5/0x5f
[  +0.004000]  ? vprintk_default+0x1d/0x30
[  +0.004063]  ? srso_return_thunk+0x5/0x5f
[  +0.004087]  ? vprintk+0x5c/0x90
[  +0.003296]  ? drm_sched_entity_init+0x2d3/0x420 [gpu_sched]
[  +0.005807]  ? srso_return_thunk+0x5/0x5f
[  +0.004090]  ? _printk+0xb3/0xe0
[  +0.003293]  ? __pfx__printk+0x10/0x10
[  +0.003735]  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
[  +0.005482]  ? do_user_addr_fault+0x345/0x770
[  +0.004361]  ? exc_page_fault+0x64/0xf0
[  +0.003972]  ? asm_exc_page_fault+0x27/0x30
[  +0.004271]  ? add_taint+0x2a/0xa0
[  +0.003476]  ? drm_sched_entity_init+0x2d3/0x420 [gpu_sched]
[  +0.005812]  amdgpu_ctx_get_entity+0x3f9/0x770 [amdgpu]
[  +0.009530]  ? finish_task_switch.isra.0+0x129/0x470
[  +0.005068]  ? __pfx_amdgpu_ctx_get_entity+0x10/0x10 [amdgpu]
[  +0.010063]  ? __kasan_check_write+0x14/0x20
[  +0.004356]  ? srso_return_thunk+0x5/0x5f
[  +0.004001]  ? mutex_unlock+0x81/0xd0
[  +0.003802]  ? srso_return_thunk+0x5/0x5f
[  +0.004096]  amdgpu_cs_wait_ioctl+0xf6/0x270 [amdgpu]
[  +0.009355]  ? __pfx_amdgpu_cs_wait_ioctl+0x10/0x10 [amdgpu]
[  +0.009981]  ? srso_return_thunk+0x5/0x5f
[  +0.004089]  ? srso_return_thunk+0x5/0x5f
[  +0.004090]  ? __srcu_read_lock+0x20/0x50
[  +0.004096]  drm_ioctl_kernel+0x140/0x1f0 [drm]
[  +0.005080]  ? __pfx_amdgpu_cs_wait_ioctl+0x10/0x10 [amdgpu]
[  +0.009974]  ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
[  +0.005618]  ? srso_return_thunk+0x5/0x5f
[  +0.004088]  ? __kasan_check_write+0x14/0x20
[  +0.004357]  drm_ioctl+0x3da/0x730 [drm]
[  +0.004461]  ? __pfx_amdgpu_cs_wait_ioctl+0x10/0x10 [amdgpu]
[  +0.009979]  ? __pfx_drm_ioctl+0x10/0x10 [drm]
[  +0.004993]  ? srso_return_thunk+0x5/0x5f
[  +0.004090]  ? __kasan_check_write+0x14/0x20
[  +0.004356]  ? srso_return_thunk+0x5/0x5f
[  +0.004090]  ? _raw_spin_lock_irqsave+0x99/0x100
[  +0.004712]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  +0.005063]  ? __pfx_arch_do_signal_or_restart+0x10/0x10
[  +0.005477]  ? srso_return_thunk+0x5/0x5f
[  +0.004000]  ? preempt_count_sub+0x18/0xc0
[  +0.004237]  ? srso_return_thunk+0x5/0x5f
[  +0.004090]  ? _raw_spin_unlock_irqrestore+0x27/0x50
[  +0.005069]  amdgpu_drm_ioctl+0x7e/0xe0 [amdgpu]
[  +0.008912]  __x64_sys_ioctl+0xcd/0x110
[  +0.003918]  do_syscall_64+0x5f/0xe0
[  +0.003649]  ? noist_exc_debug+0xe6/0x120
[  +0.004095]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[  +0.005150] RIP: 0033:0x7ffff7b1a94f
[  +0.003647] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
[  +0.019097] RSP: 002b:00007fffffffe0a0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  +0.007708] RAX: ffffffffffffffda RBX: 000055555558b360 RCX: 00007ffff7b1a94f
[  +0.007176] RDX: 000055555558b360 RSI: 00000000c0206449 RDI: 0000000000000003
[  +0.007326] RBP: 00000000c0206449 R08: 000055555556ded0 R09: 000000007fffffff
[  +0.007176] R10: 0000000000000000 R11: 0000000000000246 R12: 00007fffffffe5d8
[  +0.007238] R13: 0000000000000003 R14: 000055555555cba8 R15: 00007ffff7ffd040
[  +0.007250]  </TASK>

v2: Reworked check to guard against null ptr deref and added helpful comments
    (Christian)

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
Cc: Dokyung Song <dokyungs@yonsei.ac.kr>
Cc: <jisoo.jang@yonsei.ac.kr>
Cc: <yw9865@yonsei.ac.kr>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 3c4f5a392b06..58c8161289fe 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -71,13 +71,19 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
+	/*
+	 * It's perfectly valid to initialize an entity without having a valid
+	 * scheduler attached. It's just not valid to use the scheduler before it
+	 * is initialized itself.
+	 */
 	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if (!sched_list[0]->sched_rq) {
-		/* Warn drivers not to do this and to fix their DRM
-		 * calling order.
+	if (num_sched_list && !sched_list[0]->sched_rq) {
+		/* Since every entry covered by num_sched_list
+		 * should be non-NULL and therefore we warn drivers
+		 * not to do this and to fix their DRM calling order.
 		 */
 		pr_warn("%s: called with uninitialized scheduler\n", __func__);
 	} else if (num_sched_list) {
-- 
2.25.1

