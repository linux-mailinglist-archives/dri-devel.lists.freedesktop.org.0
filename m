Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CD640C13
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 18:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B6D10E70E;
	Fri,  2 Dec 2022 17:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D272010E70E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 17:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIILRZXIYFYqr4oZTRGLOee6aJkI8QNk4Dtn+rQaccyk9pK9qRZRNDvHsdlk3FwkgrVMdqURNhQg15Eo0R6Al9Zt+dBW9gPYH8/PJRJ2vgWIywLT/1COms63OXg4Oqo+eO4Tv0hgSf6z6+fWY0RyQBdA8EXwGgWMb6pUrTSeWEMuV9xI/VYzI1MdUiH5QKDEZoLn047rDR/56NJcK/S3YDqhkcFTTWbBp7uElra2q00sgK3eU8+u00HzBRQNyF6dGb6kSVx2oQbUpg1ptBbkaxf/5BFfyhbtop5Fdr9vEkPgy6XUyxd6TZPT58y1mFoNNP57dObVgxolVvvsacyB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj5R92d1VScQBsI4MzbumSWqvp09L+1YIvMd8iWAKJ0=;
 b=Dv/oSIzicC6zhLvNEBpoX63jl/YUQR4TPPO72BLEOvNGr2+wXmp686MexCz6Nm9ecznytLPpp7X9qvDWymY1r+4m/cgZKYdz5/zBXYoIicJDTiTEg0ZU6ur7ONXJj8ENMxydSgT2iBxH/DW3lDlJlOcnAK1k25vMQwcUhS6bfoYEzQgw4u15D2V/aNXcwq/vJEgiUc728Izm3MPsDeMjtPv/wjScdb+ZlO8KAGuBzzE+B/+cpk6Tkd1AhlQQSV6u/zW0dDQULAQ3V8SPCeilXRmRkzb3AEUH0K1qil8jcTo0BgOYHzmuyq+nwmvXtbhITWDb59b1kKq2e4Z+qnK1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aj5R92d1VScQBsI4MzbumSWqvp09L+1YIvMd8iWAKJ0=;
 b=ge3S2QW/vdAjlOVldfpNBquvloaP/q60HO38ZGJJdwEUvZlCwvTSdr3dZSAQspuyL+F89yN3UdSd84xUnKtQhqLK/ddSDW4OTiVGngGZS3VY98j09SXcUtLzq6FpvAmdfOD/+Sqcv0EecjWwmRN8JFVxm+V7lNm9961oFkFKQag=
Received: from DM6PR03CA0083.namprd03.prod.outlook.com (2603:10b6:5:333::16)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 17:23:53 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::4d) by DM6PR03CA0083.outlook.office365.com
 (2603:10b6:5:333::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Fri, 2 Dec 2022 17:23:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.10 via Frontend Transport; Fri, 2 Dec 2022 17:23:53 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 2 Dec 2022 11:23:50 -0600
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <Andy.Dong@amd.com>
Subject: [PATCH] Revert "drm/sched: Use parent fence instead of finished"
Date: Fri, 2 Dec 2022 22:53:30 +0530
Message-ID: <20221202172330.39219-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: d090805a-cb24-4ad9-10ba-08dad489fc7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjOnGYlOBoymxPzX2YHEvEOKRDmazq0ARgjou+sCiyGs/WxVf3LhU54RVdc/IjgxTMrcxs1QOEFJzHsx56YqpmRqylTuubOEu8qHZGphAETWCpPJKVuiY4OgbbchiGbKFwayQky9qaK0N2xNvZ89sQv9a3dt6wHXUEK8b55f/T10v4ZLY2pO2GlZProdNVxISgkszjB/1YDk8KeaUy7S0xLDefdwi/Axh5I8r/51Wcv9jGEpdKE4NYsJ4efS0PE7ZwHzJM4yjhquiRq2eHvVt4/cp2yzdKqWMiYXdgm57QSN1OTkMkqexqFFSAD2QXpXK4yKDWUdIvy+0VvgMy5E27RNh7yxbFKQHE+e4SghWZVUynP91ZfYeac+pHdQt2WYqbBPE1u/mddEqnEOMWZsXZuCXMqflOlKLovwLoVysr+nTqxntznwVIz/aeNJjZ72l7gH9+E5DkZnEPgsmxoYa2lmmk4inzAL7SPybOPGDEd+dXsx1UqmTIu2R5R63oaINIEPiwL9F1Xmmh+b3Qx71TZmBXzyleoOBuI1qRnJBn1aUPdJv+w2/lPBIaaCrJBpWxKq9h0RqgTWoePU38sYPR2IOXkuPT1tDPzEmxONLGbvu8OAmO5YKxpYEPOdkpPKTb0hJLiuubopiLTH2hQWxr/+GjdGCDXFGfXrpuRmyZyqLmS67DcqygudqR1ateFErr9GrPDYKTkOuQ/hlGdglblu79BuT5HgvaC6K8i8d+9hU3G9gp6FGRNGnlD+aas3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(478600001)(2906002)(83380400001)(86362001)(36756003)(356005)(81166007)(6636002)(5660300002)(110136005)(40460700003)(426003)(47076005)(82310400005)(82740400003)(1076003)(8936002)(41300700001)(4326008)(8676002)(7696005)(2616005)(6666004)(26005)(336012)(316002)(70206006)(40480700001)(16526019)(70586007)(186003)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 17:23:53.7031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d090805a-cb24-4ad9-10ba-08dad489fc7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit e4dc45b1848bc6bcac31eb1b4ccdd7f6718b3c86.

    This is causing instability on Linus' desktop, and Observed System
    hung  when running MesaGL benchmark or VK CTS runs.

    netconsole got me the following oops:
    [ 1234.778760] BUG: kernel NULL pointer dereference, address: 0000000000000088
    [ 1234.778782] #PF: supervisor read access in kernel mode
    [ 1234.778787] #PF: error_code(0x0000) - not-present page
    [ 1234.778791] PGD 0 P4D 0
    [ 1234.778798] Oops: 0000 [#1] PREEMPT SMP NOPTI
    [ 1234.778803] CPU: 7 PID: 805 Comm: systemd-journal Not tainted 6.0.0+ #2
    [ 1234.778809] Hardware name: System manufacturer System Product
    Name/PRIME X370-PRO, BIOS 5603 07/28/2020
    [ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sched]
    [ 1234.778828] Code: aa 0f 1d ce e9 57 ff ff ff 48 89 d7 e8 9d 8f 3f
    ce e9 4a ff ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 54 55 53
    48 89 fb <48> 8b af 88 00 00 00 f0 ff 8d f0 00 00 00 48 8b 85 80 01 00
    00 f0
    [ 1234.778834] RSP: 0000:ffffabe680380de0 EFLAGS: 00010087
    [ 1234.778839] RAX: ffffffffc04e9230 RBX: 0000000000000000 RCX: 0000000000000018
    [ 1234.778897] RDX: 00000ba278e8977a RSI: ffff953fb288b460 RDI: 0000000000000000
    [ 1234.778901] RBP: ffff953fb288b598 R08: 00000000000000e0 R09: ffff953fbd98b808
    [ 1234.778905] R10: 0000000000000000 R11: ffffabe680380ff8 R12: ffffabe680380e00
    [ 1234.778908] R13: 0000000000000001 R14: 00000000ffffffff R15: ffff953fbd9ec458
    [ 1234.778912] FS:  00007f35e7008580(0000) GS:ffff95428ebc0000(0000)
    knlGS:0000000000000000
    [ 1234.778916] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [ 1234.778919] CR2: 0000000000000088 CR3: 000000010147c000 CR4: 00000000003506e0
    [ 1234.778924] Call Trace:
    [ 1234.778981]  <IRQ>
    [ 1234.778989]  dma_fence_signal_timestamp_locked+0x6a/0xe0
    [ 1234.778999]  dma_fence_signal+0x2c/0x50
    [ 1234.779005]  amdgpu_fence_process+0xc8/0x140 [amdgpu]
    [ 1234.779234]  sdma_v3_0_process_trap_irq+0x70/0x80 [amdgpu]
    [ 1234.779395]  amdgpu_irq_dispatch+0xa9/0x1d0 [amdgpu]
    [ 1234.779609]  amdgpu_ih_process+0x80/0x100 [amdgpu]
    [ 1234.779783]  amdgpu_irq_handler+0x1f/0x60 [amdgpu]
    [ 1234.779940]  __handle_irq_event_percpu+0x46/0x190
    [ 1234.779946]  handle_irq_event+0x34/0x70
    [ 1234.779949]  handle_edge_irq+0x9f/0x240
    [ 1234.779954]  __common_interrupt+0x66/0x100
    [ 1234.779960]  common_interrupt+0xa0/0xc0
    [ 1234.779965]  </IRQ>
    [ 1234.779968]  <TASK>
    [ 1234.779971]  asm_common_interrupt+0x22/0x40
    [ 1234.779976] RIP: 0010:finish_mkwrite_fault+0x22/0x110
    [ 1234.779981] Code: 1f 84 00 00 00 00 00 90 0f 1f 44 00 00 41 55 41
    54 55 48 89 fd 53 48 8b 07 f6 40 50 08 0f 84 eb 00 00 00 48 8b 45 30
    48 8b 18 <48> 89 df e8 66 bd ff ff 48 85 c0 74 0d 48 89 c2 83 e2 01 48
    83 ea
    [ 1234.779985] RSP: 0000:ffffabe680bcfd78 EFLAGS: 00000202

    Revert it for now and figure it out later.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 820c0c5544e1..ea7bfa99d6c9 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -790,7 +790,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 
-	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
+	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
 
@@ -802,7 +802,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 
 		if (next) {
 			next->s_fence->scheduled.timestamp =
-				job->s_fence->parent->timestamp;
+				job->s_fence->finished.timestamp;
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
-- 
2.25.1

