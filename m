Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16814CC6F9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC99810EF0F;
	Thu,  3 Mar 2022 20:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD7710EED5;
 Thu,  3 Mar 2022 20:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUScYDPsm2n09UAkqSBBb1HjeH0oZzph/KfdaNEyGWQbeaorObYZOBrZtKhijqn+qAKwfWg1jkG+18a43VzuqYwDTwlGkbLtqtFj7B08tpvdjEmBYqzla0edL5N+2TqCtLyTjn4CV7+fWeGgaFCstiYuS7eU3FuFX7Ie5iekqQA70OwBnrSAKtPZqYoNymyMOq0BHitKvpmySemBwC/LEZZSG7JB3R42qhCtPRn52iL9Fc1428yOClXxi0/mMMytCrBNX25NRhpuF3tBKUV2nKg2cyevO1xQsJXsusdsXtA+OfIUyMgoyMcv3iAxqX4UFH5+QCuqIrV6bJ4n7zpV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOUznqNyw70tVbIykbbYMxOARQqgeGFLkNGTa4T6w9w=;
 b=TvteiahhB53sfD7aIEAEYqnuXmc42pY1iH5Xw2zg4qSdycrIWHyOLDAAk6P8C3fkMk2xe/fv7F9247LgSZcqTOJ0XZyD5Khe3ARDmBehNXtVIUVToYQWdz5fda9JL55z5wYrAgB9YhiELe25wtwyIKo29pPE7wVvhb+PBepzBIPv3wyK5NpY8e3Zb8cFVxuJ/N3V9qa1WcMQER6JwL7BDOmUAQZ4P3OIcgI28xGFmpFsONxE4kWGdX2LnmeqibLCz0dgH/qfJQ+mMqVCbW8RK8FS5FGDs9CRb6sazPG8BLs6neMaOS5g3goT7zmfoYr2D5v0mkyPgpuD7NsWcWyCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOUznqNyw70tVbIykbbYMxOARQqgeGFLkNGTa4T6w9w=;
 b=m/PC13us+rK7HXbFfbGsy2PyiQpzF6EspoFjhlu9BE3EtRmIJ9+fmH7p5wa4FupzHZ1LEDETb1c++X+prglqmmOr8lPETQMdVpPKffHjLQUDsTk86cX3pe/U+S/+wYeoROQkCEdpPs8jSVCRoXlKR2jioEvs8yAMRWmoAawv9T4=
Received: from DM6PR08CA0033.namprd08.prod.outlook.com (2603:10b6:5:80::46) by
 MWHPR12MB1440.namprd12.prod.outlook.com (2603:10b6:300:13::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Thu, 3 Mar 2022 20:16:39 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::f3) by DM6PR08CA0033.outlook.office365.com
 (2603:10b6:5:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 20:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 20:16:38 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 14:16:34 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/selftests: fix a shift-out-of-bounds bug
Date: Fri, 4 Mar 2022 01:46:02 +0530
Message-ID: <20220303201602.2365-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f2a5e9f-b338-4e7f-0039-08d9fd52b906
X-MS-TrafficTypeDiagnostic: MWHPR12MB1440:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB14405A1ACB2E44C93EE6919CE4049@MWHPR12MB1440.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T4ycgICqE9jMb0wIwa45Mtk1TYDA449N+5JvIMFYN44xtcj762ELJ1YdM0xRT06TSCjIub258YgYEUU9lqJpKhAYb2uWo+/9tsoYVkSPiGEzXBgfITWi9CvHMG4zZp7bwNHwRlNbu/50upQYEUWwmr2hV2JDEBlhNXeko1OoaYvfAXmaGRRLe/rG3HTQPef9PZkvAECtP1aG+tm/sjpQmy6mtEoqWJe4fKSlbU8P4oPNhBOsp3OTm1UQbgJUQV/yRu715c4GpE+b/xEhADUFLH7swtgrjm76bI2sZMvqLE/oC6sH7nq2Bknvh9rFbi+oMPMYQ5Rc29GeU34VvdbgxqjS34OY2OxAJCjXymIZC6Iscjj0LaeP4e7SirnuvxGp0Qpf9L7S5Es4CgvoB7xXCPVdCsAagG0ty6dGHCmU2xf+kowr7L74swXKhsV4OmAwQTaJvo6Nro4f699emtKF34DPitYoRbZETbQx3zR4f7Y8b/M+a+yS9j2j5eBPuRNQpMl8Nt8+wT9YAlFPDkKLlaVotuxm5zyy95/Lr/Gs0Gf0msa3myRE+mukOplkbubjBm2ZJv7ytG1sS5MGXlX7pUE0fsx4MqPDy1Gy9LzO0Pj5OOIl0K6bevUPsHPhNB/B+IeCLwdnKTmfS9lg1+b2uS9dPzVF5WwLhPC4dx8tPnTYiqH2ejw+LihcEaEOxGVrMQiza+wv93eMJv8aDOl18qI0/nKkq9DA+Gvuyv8TQXPxRqV5J3ycxPAUMwMyonD9sVcNssYQag9GkQMvgx3FhQqRIDCIt9S8DEKeATm+bX4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(36860700001)(86362001)(966005)(4326008)(70586007)(70206006)(16526019)(356005)(2616005)(1076003)(186003)(26005)(336012)(426003)(508600001)(82310400004)(2906002)(110136005)(5660300002)(83380400001)(54906003)(8936002)(6666004)(7696005)(40460700003)(47076005)(36756003)(81166007)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 20:16:38.1865 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2a5e9f-b338-4e7f-0039-08d9fd52b906
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1440
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, oliver.sang@intel.com,
 matthew.auld@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pass the correct size value computed using the max_order.

<log snip>

[ 68.124177][ T1] UBSAN: shift-out-of-bounds in include/linux/log2.h:67:13
[ 68.125333][ T1] shift exponent 4294967295 is too large for 32-bit type 'long
unsigned int'
[ 68.126563][ T1] CPU: 0 PID: 1 Comm: swapper Not tainted
5.17.0-rc2-00311-g39ec47bbfd5d #2
[ 68.127758][ T1] Call Trace:
[ 68.128187][ T1] dump_stack_lvl (lib/dump_stack.c:108)
[ 68.128793][ T1] dump_stack (lib/dump_stack.c:114)
[ 68.129331][ T1] ubsan_epilogue (lib/ubsan.c:152)
[ 68.129958][ T1] __ubsan_handle_shift_out_of_bounds.cold (arch/x86/include/asm/smap.h:85)

[ 68.130791][ T1] ? drm_block_alloc+0x28/0x80
[ 68.131582][ T1] ? rcu_read_lock_sched_held (kernel/rcu/update.c:125)
[ 68.132215][ T1] ? kmem_cache_alloc (include/trace/events/kmem.h:54 mm/slab.c:3501)
[ 68.132878][ T1] ? mark_free+0x2e/0x80
[ 68.133524][ T1] drm_buddy_init.cold (include/linux/log2.h:67
drivers/gpu/drm/drm_buddy.c:131)
[ 68.134145][ T1] ? test_drm_cmdline_init (drivers/gpu/drm/selftests/test-drm_buddy.c:87)

[ 68.134770][ T1] igt_buddy_alloc_limit (drivers/gpu/drm/selftests/test-drm_buddy.c:30)
[ 68.135472][ T1] ? vprintk_default (kernel/printk/printk.c:2257)
[ 68.136057][ T1] ? test_drm_cmdline_init (drivers/gpu/drm/selftests/test-drm_buddy.c:87)

[ 68.136812][ T1] test_drm_buddy_init (drivers/gpu/drm/selftests/drm_selftest.c:77
drivers/gpu/drm/selftests/test-drm_buddy.c:95)
[ 68.137475][ T1] do_one_initcall (init/main.c:1300)
[ 68.138111][ T1] ? parse_args (kernel/params.c:609 kernel/params.c:146
kernel/params.c:188)
[ 68.138717][ T1] do_basic_setup (init/main.c:1372 init/main.c:1389 init/main.c:1408)
[ 68.139366][ T1] kernel_init_freeable (init/main.c:1617)
[ 68.140040][ T1] ? rest_init (init/main.c:1494)
[ 68.140634][ T1] kernel_init (init/main.c:1504)
[ 68.141155][ T1] ret_from_fork (arch/x86/entry/entry_32.S:772)
[ 68.141607][ T1]
================================================================================
[ 68.146730][ T1] ------------[ cut here ]------------
[ 68.147460][ T1] kernel BUG at drivers/gpu/drm/drm_buddy.c:140!
[ 68.148280][ T1] invalid opcode: 0000 [#1]
[ 68.148895][ T1] CPU: 0 PID: 1 Comm: swapper Not tainted
5.17.0-rc2-00311-g39ec47bbfd5d #2
[ 68.149896][ T1] EIP: drm_buddy_init (drivers/gpu/drm/drm_buddy.c:140 (discriminator 1))

For more details: https://lists.01.org/hyperkitty/list/lkp@lists.01.org/thread/FDIF3HCILZNN5UQAZMOR7E3MQSMHHKWU/

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reported-by: kernel test robot <oliver.sang@intel.com>
---
 drivers/gpu/drm/selftests/test-drm_buddy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
index fa997f89522b..913cbd7eae04 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -902,14 +902,13 @@ static int igt_buddy_alloc_range(void *arg)
 
 static int igt_buddy_alloc_limit(void *arg)
 {
-	u64 end, size = U64_MAX, start = 0;
+	u64 size = U64_MAX, start = 0;
 	struct drm_buddy_block *block;
 	unsigned long flags = 0;
 	LIST_HEAD(allocated);
 	struct drm_buddy mm;
 	int err;
 
-	size = end = round_down(size, 4096);
 	err = drm_buddy_init(&mm, size, PAGE_SIZE);
 	if (err)
 		return err;
@@ -921,7 +920,8 @@ static int igt_buddy_alloc_limit(void *arg)
 		goto out_fini;
 	}
 
-	err = drm_buddy_alloc_blocks(&mm, start, end, size,
+	size = mm.chunk_size << mm.max_order;
+	err = drm_buddy_alloc_blocks(&mm, start, size, size,
 				     PAGE_SIZE, &allocated, flags);
 
 	if (unlikely(err))

base-commit: 6be340ee8f5beae574dae6f5e17a22e67beeff3e
-- 
2.25.1

