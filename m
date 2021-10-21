Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC369436643
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 17:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56F06E43F;
	Thu, 21 Oct 2021 15:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69BF6E43F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 15:30:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl6qfBnkQwephbNQvMtkRN9pRLUCDwk01jy1OKk01qGZFu7bbJfBCZQJAfU3VYQ4+YpwvHBZpfgQkSm71qHwYJkSqi4Hw8Tub8Cj06RI5xXvFtW2DuDH9S1jNnbmYppe/X+p7sCRQXUs9VNQIeqAtU2apVb21V6OiY4TCJaes6Zr3Ec2s7DSVtr52zGg4u9Fg2A6BP6nkUFmupsu6/1pFT9BLrjftpGTtxFIbzPshVPc30EDuhuYPDSdR9C5JTtvyHsfNTl9gctEx0BMIopChGH311L+/5eWVQjrtp7CM4lzEspWwUmuvsvXIsJ+xrcsPnlXulzMkJm017MfQ+1dpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6casjYgshgoMv7C8Udwns8lMskgbmz0Feha11gjiLCU=;
 b=new7sTalvg9tWxDVRb/ObHzYgmW3fDfEzxDJaiQLGpQRcXUfq7tXCMUmMXkSH3YTYYXV2vuKkX99rWrj45WzuQoRzpFb09h1hcNDD+i3H56QBpD3sAGSnlys1yf+/683QRvfTx+LC1/NPa6J++KVrHCBatJ6Isr4t6Vpk4WQ+6ZLsEkExM45svqIi5c2o0/T+1TH+0oRvIEJQDaOuTj+f/zGhKiOE/Af9ZZDrIpp6j15U6fi4f63U5uJazYXJ1msK29yz5wDDFYCZf0/IgP6tBKT1Kr7gwDyen7QhmV7HTieRHZzqTw10BK9fbHoGXW6eonpfSZwsICQIA8s6qOGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6casjYgshgoMv7C8Udwns8lMskgbmz0Feha11gjiLCU=;
 b=v15Z03BayhR34DWyYDfVN7Pc+pWDS0ikUaHbvnbnkyPCN4Xqry82MYIKDaNWWfHNsb7y6JOUQZA5P9IXkO2UUoaBPn3V53BBVnjmAlgEXI2ALz/Jg1UBuqykFDj8GiGMtC2VLyvcogTc8euYhK4udNmXvSmd/lxNTQ/yzJTXOeM=
Received: from DM5PR2001CA0019.namprd20.prod.outlook.com (2603:10b6:4:16::29)
 by MWHPR12MB1904.namprd12.prod.outlook.com (2603:10b6:300:114::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 15:30:17 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::aa) by DM5PR2001CA0019.outlook.office365.com
 (2603:10b6:4:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 15:30:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Thu, 21 Oct 2021 15:30:16 +0000
Received: from fritz.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Thu, 21 Oct
 2021 10:30:14 -0500
From: Kim Phillips <kim.phillips@amd.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Ainux <ainux.wang@gmail.com>
CC: Kim Phillips <kim.phillips@amd.com>, David Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <sterlingteng@gmail.com>, <chenhuacai@kernel.org>, Chuck Lever III
 <chuck.lever@oracle.com>, Borislav Petkov <bp@alien8.de>, Borislav Petkov
 <bp@suse.de>, Jon Grimm <jon.grimm@amd.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] Revert "drm/ast: Add detect function support"
Date: Thu, 21 Oct 2021 10:30:06 -0500
Message-ID: <20211021153006.92983-1-kim.phillips@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0cb24da-415a-40e8-313e-08d994a7af0d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1904:
X-Microsoft-Antispam-PRVS: <MWHPR12MB19042776D15C3804F8E4445487BF9@MWHPR12MB1904.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RYu5QfXKo/XlHrQ14ufZYUsz9Px0jroTDSPby/qVRoSHxTMfDJqrBRCbRg4q+nWYI3okeoEEv3yJJQxIsfZaXK7EWBlP5GlpN3iw2bAC4KLDa7xio+3l90U6Xyy63XSvXCWWkmHIiJMW+lDG5/sNJGBpZRZ1m0o8C6AHvg7svtOth1ioMLz6Xj4C8S7EVqi89SW4Z5seXpiiMtp8yegvZE+AVti8iXf1Qyzs0Gq3hq7oi9HIHSUnyVLC0JFjrOHf4qMtKYKrt0jE/TDIIsLMIDyFs1WLGR36A0gHvuy5eBlm4ruf0EetX7Wvyxu4hJnte9RAQSsWjlvdCW4bWb80P8s8hbf1vgqlwpSHk/fbnz631kGV5Fr2DrlUqT4tN7q+11c1W6bV7EXdf+2rMTLfoMocG/KXFmxv2QJHUjoqF/uJnSlO3nqt4lw2aiNrANuui3T868JatxCFqd01lt1PcFBsKCBaaP9o7wSccz/iC1y1ptzCb8SbtoL/fa5ITm38u/o60yCifLIgDbvfSFkSfHKYTzkeCOhAu1+6o+39LCIrdzMouRa4sk48GcLXZUtO8c8ZEdpJeqxpXZFgi9I36SGamhJQLkx6p6sGQdCowijAhLPd+TAmgXKbjvm4hn9JXLd3B9Uym+GWkNeMPWZlI/iZCJyTZNEznjOWfPWri5X+YOxD5XBuVj4A/TmC5xbZEEhFlVlVImAPJwSe+l+R8PCnh3CuUbfRE2E/jfh4Rv2rtAbufN9/AErudiLO3aIdtn8UzVlaSvtipvxtXzneyzA8T2bu7o05351QQOEvgfRR9KXW+DaHg0RpdecfLjJH
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(86362001)(81166007)(82310400003)(356005)(1076003)(44832011)(36860700001)(83380400001)(47076005)(36756003)(2616005)(4326008)(8936002)(6666004)(7696005)(70586007)(70206006)(2906002)(16526019)(426003)(336012)(8676002)(316002)(54906003)(5660300002)(966005)(110136005)(7416002)(186003)(45080400002)(508600001)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 15:30:16.6063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cb24da-415a-40e8-313e-08d994a7af0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1904
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

This reverts commit aae74ff9caa8de9a45ae2e46068c417817392a26,
since it prevents my AMD Milan system from booting, with:

[   27.189558] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   27.197506] #PF: supervisor write access in kernel mode
[   27.203333] #PF: error_code(0x0002) - not-present page
[   27.209064] PGD 0 P4D 0
[   27.211885] Oops: 0002 [#1] PREEMPT SMP NOPTI
[   27.216744] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.15.0-rc6+ #15
[   27.223928] Hardware name: AMD Corporation ETHANOL_X/ETHANOL_X, BIOS RXM1006B 08/20/2021
[   27.232955] RIP: 0010:run_timer_softirq+0x38b/0x4a0
[   27.238397] Code: 4c 89 f7 e8 37 27 ac 00 49 c7 46 08 00 00 00 00 49 8b 04 24 48 85 c0 74 71 4d 8b 3c 24 4d 89 7e 08 66 90 49 8b 07 49 8b 57 08 <48> 89 02 48 85 c0 74 04 48 89 50 08 49 8b 77 18 41 f6 47 22 20 4c
[   27.259350] RSP: 0018:ffffc42d00003ee8 EFLAGS: 00010086
[   27.265176] RAX: dead000000000122 RBX: 0000000000000000 RCX: 0000000000000101
[   27.273134] RDX: 0000000000000000 RSI: 0000000000000087 RDI: 0000000000000001
[   27.281084] RBP: ffffc42d00003f70 R08: 0000000000000000 R09: 00000000000003eb
[   27.289043] R10: ffffa0860cb300d0 R11: ffffa0c44de290b0 R12: ffffc42d00003ef8
[   27.297002] R13: 00000000fffef200 R14: ffffa0c44de18dc0 R15: ffffa0867a882350
[   27.304961] FS:  0000000000000000(0000) GS:ffffa0c44de00000(0000) knlGS:0000000000000000
[   27.313988] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.320396] CR2: 0000000000000000 CR3: 000000014569c001 CR4: 0000000000770ef0
[   27.328346] PKRU: 55555554
[   27.331359] Call Trace:
[   27.334073]  <IRQ>
[   27.336314]  ? __queue_work+0x420/0x420
[   27.340589]  ? lapic_next_event+0x21/0x30
[   27.345060]  ? clockevents_program_event+0x8f/0xe0
[   27.350402]  __do_softirq+0xfb/0x2db
[   27.354388]  irq_exit_rcu+0x98/0xd0
[   27.358275]  sysvec_apic_timer_interrupt+0xac/0xd0
[   27.363620]  </IRQ>
[   27.365955]  asm_sysvec_apic_timer_interrupt+0x12/0x20
[   27.371685] RIP: 0010:cpuidle_enter_state+0xcc/0x390
[   27.377292] Code: 3d 01 79 0a 50 e8 44 ed 77 ff 49 89 c6 0f 1f 44 00 00 31 ff e8 f5 f8 77 ff 80 7d d7 00 0f 85 e6 01 00 00 fb 66 0f 1f 44 00 00 <45> 85 ff 0f 88 17 01 00 00 49 63 c7 4c 2b 75 c8 48 8d 14 40 48 8d
[   27.398243] RSP: 0018:ffffffffb0e03dc8 EFLAGS: 00000246
[   27.404069] RAX: ffffa0c44de00000 RBX: 0000000000000001 RCX: 000000000000001f
[   27.412028] RDX: 0000000000000000 RSI: ffffffffb0bafc1f RDI: ffffffffb0bbdb81
[   27.419986] RBP: ffffffffb0e03e00 R08: 00000006549f8f3f R09: ffffffffb1065200
[   27.427935] R10: ffffa0c44de27ae4 R11: ffffa0c44de27ac4 R12: ffffa0c5634cb000
[   27.435894] R13: ffffffffb1065200 R14: 00000006549f8f3f R15: 0000000000000001
[   27.443854]  ? cpuidle_enter_state+0xbb/0x390
[   27.448712]  cpuidle_enter+0x2e/0x40
[   27.452695]  call_cpuidle+0x23/0x40
[   27.456584]  do_idle+0x1f0/0x270
[   27.460181]  cpu_startup_entry+0x20/0x30
[   27.464553]  rest_init+0xd4/0xe0
[   27.468149]  arch_call_rest_init+0xe/0x1b
[   27.472619]  start_kernel+0x6bc/0x6e2
[   27.476764]  x86_64_start_reservations+0x24/0x26
[   27.481912]  x86_64_start_kernel+0x75/0x79
[   27.486477]  secondary_startup_64_no_verify+0xb0/0xbb
[   27.492111] Modules linked in: kvm_amd(+) kvm ipmi_si(+) ipmi_devintf rapl wmi_bmof ipmi_msghandler input_leds ccp k10temp mac_hid sch_fq_codel msr ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath linear ast i2c_algo_bit drm_vram_helper drm_ttm_helper ttm drm_kms_helper crct10dif_pclmul crc32_pclmul ghash_clmulni_intel syscopyarea aesni_intel sysfillrect crypto_simd sysimgblt fb_sys_fops cryptd hid_generic cec nvme ahci usbhid drm e1000e nvme_core hid libahci i2c_piix4 wmi
[   27.551789] CR2: 0000000000000000
[   27.555482] ---[ end trace 897987dfe93dccc6 ]---
[   27.560630] RIP: 0010:run_timer_softirq+0x38b/0x4a0
[   27.566069] Code: 4c 89 f7 e8 37 27 ac 00 49 c7 46 08 00 00 00 00 49 8b 04 24 48 85 c0 74 71 4d 8b 3c 24 4d 89 7e 08 66 90 49 8b 07 49 8b 57 08 <48> 89 02 48 85 c0 74 04 48 89 50 08 49 8b 77 18 41 f6 47 22 20 4c
[   27.587021] RSP: 0018:ffffc42d00003ee8 EFLAGS: 00010086
[   27.592848] RAX: dead000000000122 RBX: 0000000000000000 RCX: 0000000000000101
[   27.600808] RDX: 0000000000000000 RSI: 0000000000000087 RDI: 0000000000000001
[   27.608765] RBP: ffffc42d00003f70 R08: 0000000000000000 R09: 00000000000003eb
[   27.616716] R10: ffffa0860cb300d0 R11: ffffa0c44de290b0 R12: ffffc42d00003ef8
[   27.624673] R13: 00000000fffef200 R14: ffffa0c44de18dc0 R15: ffffa0867a882350
[   27.632624] FS:  0000000000000000(0000) GS:ffffa0c44de00000(0000) knlGS:0000000000000000
[   27.641650] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.648159] CR2: 0000000000000000 CR3: 000000014569c001 CR4: 0000000000770ef0
[   27.656119] PKRU: 55555554
[   27.659133] Kernel panic - not syncing: Fatal exception in interrupt
[   29.030411] Shutting down cpus with NMI
[   29.034699] Kernel Offset: 0x2e600000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[   29.046790] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

Since unreliable, found by bisecting for KASAN's use-after-free in
enqueue_timer+0x4f/0x1e0, where the timer callback is called.

Reported-by: Kim Phillips <kim.phillips@amd.com>
Signed-off-by: Kim Phillips <kim.phillips@amd.com>
Fixes: aae74ff9caa8 ("drm/ast: Add detect function support")
Link: https://lore.kernel.org/lkml/0f7871be-9ca6-5ae4-3a40-5db9a8fb2365@amd.com/
Cc: Ainux <ainux.wang@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: sterlingteng@gmail.com
Cc: chenhuacai@kernel.org
Cc: Chuck Lever III <chuck.lever@oracle.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Borislav Petkov <bp@suse.de>
Cc: Jon Grimm <jon.grimm@amd.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>
---
 drivers/gpu/drm/ast/ast_mode.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 6bfaefa01818..1e30eaeb0e1b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1300,18 +1300,6 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 	return flags;
 }
 
-static enum drm_connector_status ast_connector_detect(struct drm_connector
-						   *connector, bool force)
-{
-	int r;
-
-	r = ast_get_modes(connector);
-	if (r <= 0)
-		return connector_status_disconnected;
-
-	return connector_status_connected;
-}
-
 static void ast_connector_destroy(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
@@ -1327,7 +1315,6 @@ static const struct drm_connector_helper_funcs ast_connector_helper_funcs = {
 
 static const struct drm_connector_funcs ast_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
-	.detect = ast_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = ast_connector_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -1355,8 +1342,7 @@ static int ast_connector_init(struct drm_device *dev)
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
-						DRM_CONNECTOR_POLL_DISCONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
 
 	drm_connector_attach_encoder(connector, encoder);
 
@@ -1425,8 +1411,6 @@ int ast_mode_config_init(struct ast_private *ast)
 
 	drm_mode_config_reset(dev);
 
-	drm_kms_helper_poll_init(dev);
-
 	return 0;
 }
 
-- 
2.32.0

