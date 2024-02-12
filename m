Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E9B851F0D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D37210E65E;
	Mon, 12 Feb 2024 21:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FQh1jiky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F382910E3BE;
 Mon, 12 Feb 2024 21:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTeLru3nyN1ONB+aWSV9sjXzUASCI4iHa4Ci3J3N30MSMPCcZTrb0SVAzMiAIpkqikYy4swvg2ERkPX7pMYgkLjMQhWCiz5+nl1iEmf8XhCcBnh2mu5dI5mu554FuofUtffFBYICcdsQ2TK4Ky4Cwo5AKx7LQFtC+FZr89km4Pho0mWvM6mnG4PoMML8iJe5sxEWw5NxSt/ny2r5U7+TLvmZAsulktj9T7mRvUr888feO1vEd7kTw2ZlK/N42PIhn7UUhYX/fjfp6l2kCTA59/co6w5uHsjeyeUxTDXpVllT+UyYWgJlfS4VKFqKI5kPLm1G7j1ux4eh47oMhZfKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q87PkI5BLKVn0unDjNjtkn4F9ccJc/ecu5jfQJ2/7M0=;
 b=CoQOsHPcBYDuSg0527LK2BKFNi3mF+J9MwNlQkY0MSLZwAo5nc/dMH8bQYinQwEOH9BMT/sZEoK1HEdQU7EfXHCFdtIno8nCXc1dnivUrX043qvnEq9TnRPxhKiKhGCKwl1vRk9OVrNcYnywURYh0qVkqWwEkr7Sqfa7MIg8IvZJrVY28IgrAAAlPu3Am1BL4TNWDua8ZhbD/olzi+/IticSLAjWaLklGZQr2k5YifMwFi+6R80SJjfRezwdVn4RqGIdn0LPiVWj3OaO2KTSF6Uod+jOrediIHsrIwGgnsuViwMOmfNy3kE8yGq9Ie3J0+sANU8a6MxTslF4PDGT/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q87PkI5BLKVn0unDjNjtkn4F9ccJc/ecu5jfQJ2/7M0=;
 b=FQh1jikygN3TgV1+9mS3dcTNMQqV0HKOMmY3Fg9WqdnWPV/xxEZ8C2Toh5GHDko3XQPsOdRLaCwurDT6Nk8IKXKyjx2+9jNvu/tIHVipLRRpd4oP/kYupK1u4rwQs3mE9HpxytH6LKXOAN+i1wrLJ4f5cbw52IjK8W09Ze+T4+o=
Received: from CH0PR04CA0070.namprd04.prod.outlook.com (2603:10b6:610:74::15)
 by SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.14; Mon, 12 Feb
 2024 21:04:48 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::e9) by CH0PR04CA0070.outlook.office365.com
 (2603:10b6:610:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Mon, 12 Feb 2024 21:04:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 21:04:47 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 12 Feb
 2024 15:04:46 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>
Subject: [PATCH 5/6] drm/i915: Update shared stats to use the new gem helper
Date: Mon, 12 Feb 2024 16:04:27 -0500
Message-ID: <20240212210428.851952-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240212210428.851952-1-alexander.deucher@amd.com>
References: <20240212210428.851952-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|SA1PR12MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c96f15-4889-4bcd-c068-08dc2c0e3f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjGR0008t1P7XVzHMG5yoquuTX6XOaAeFRqsomdCGkFohnrq9TOwUdPO8ntdK5PNZPNFya8iU2yRWhjuIuZfSQmcNykqJRYhvWBn7bmqq3WUZn6YcqYDZGKTCOPtab4phcdyJ4ARNmNYBXUs4LeQbU2vuh/UC1DRnxeqJeWM3f+nwY38rFfDXlJ/id9D0CHHsiFlEFqw37jUhBFQIOt1wOgBvHCXsrd7lYGi8mOlz8NsGOkR9FXkJFtALSyzgwOuXu2Rrn5tHI+Dmg3UcKJPJieWvKBMwuq6oz/Kcw9f+47W9GWJ08w3b4NL+/zBSPjG9rtmS9guAN2ELaNrFC94PCAqJSog+0CYg2SyHcMXP0LiWCmHVz0HVKszbDjKEmYXh6MmJFxaNmsMQJk473qglc46C/K/WSTFGst1n+NAqdNsvm/cFiK66fvEt66YYfvP1izf/mteuBS3AXC2+AB4K9WhlZIJ2Nczcz3x8zt/O7Yd78z/yGBmAnOjP6QBexRooeUpGgFrFlPxEnYYXZXlT/yIWWNxz9TsEBoUOXE7ImW1YK+gOrK5LNhUblbc/JqZYe9pVbiQuuVrsA0W8Q5vqA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(5660300002)(2906002)(82740400003)(356005)(4744005)(86362001)(81166007)(26005)(8936002)(7696005)(6666004)(83380400001)(316002)(426003)(70206006)(2616005)(1076003)(16526019)(4326008)(336012)(110136005)(70586007)(8676002)(54906003)(966005)(478600001)(36756003)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:04:47.9155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c96f15-4889-4bcd-c068-08dc2c0e3f1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8144
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

Switch to using the new gem shared memory stats helper
rather than hand rolling it.

Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/i915/i915_drm_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index fa6852713bee..f58682505491 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -53,7 +53,7 @@ obj_meminfo(struct drm_i915_gem_object *obj,
 					obj->mm.region->id : INTEL_REGION_SMEM;
 	const u64 sz = obj->base.size;
 
-	if (obj->base.handle_count > 1)
+	if (drm_gem_object_is_shared_for_memory_stats(&obj->base))
 		stats[id].shared += sz;
 	else
 		stats[id].private += sz;
-- 
2.42.0

