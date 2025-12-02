Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748E8C9AF6A
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109D610E5DE;
	Tue,  2 Dec 2025 09:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J0/7utQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DA510E5DE;
 Tue,  2 Dec 2025 09:51:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzFGwOAM1S/I5am4zjqbCatCHatIhBL1Pm8yeB7S4A9IQMAfJzozjDnTpdaZpkFhC0IC+hxoX4UwpKz/1WeGf35+rvZKUeIz3BJbgqK4I7ptuRLCo1NbiDvGMV8wYVq9xEINZTnYvnV+puz38m6fA3dfi4y2yH8PkPHOz7WxSdLI6LSZOu78Dm3+LVmJpXEzPLA/tuwVKQKK4wiiX1rP30qfPzxaZVaNsR3nw9nPRewonbNpgg7p9QtsFovCTioeMtWNIuaDREqkXJtSeDB86mCi4jiK15lqN1BJ2jHM9X6v/TRa/2JrRAXXXClsOPx2DiS7DjpqMxObCeVtiylXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2z3VIZ7GA40CA13Fn3mSXgkg3s8RUc1zhwdLYzxGJE=;
 b=u3Dp1ZiO8cYf+eyd7jexqLiI4rUlWBwfBK6hNbYwiVBN3e+mXH+3lefg7ErN3RhOmQxX+2+ozZjfA12I7aoDAEq/4sLTl9clWgGquooOzMCg33VJPBDBv6Um/rx70UvshQNDer13FyfBys6dGE2mFNGXjLdsETOYRMebO23ysri+Y6+oMlZZlaBBO3Fu2nAWAuI9naGSjwAD7777osVbBbW6r5+4NKeshsbEaBBaG1HxEK7ea5yLe+b9becc+pdckjcF5Ds7gE5JA50WljK9iRzWZPx0LKuF3t5YhChWeAuh3tu8I7LdP42aMYMfxkMPDEU501WK5qjPIx9cZcff+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2z3VIZ7GA40CA13Fn3mSXgkg3s8RUc1zhwdLYzxGJE=;
 b=J0/7utQs7dhl4LbA4vsbzQtwtU2SCuFS/nlie38jVeWOJPQiKS5yKKp8y3tPoxEt3ci7ZTMIflb1OP6HasYDcgWbV7zKS7Qmuf34eRB/kORT5WLIkLOXnoCYQ4GTAkNaCu1WX4XsD9khiaiK7WLUo9K8b2GfCo9QDWjjMxnr1WI=
Received: from MW4PR03CA0227.namprd03.prod.outlook.com (2603:10b6:303:b9::22)
 by SN7PR12MB7912.namprd12.prod.outlook.com (2603:10b6:806:341::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:51:12 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:303:b9:cafe::b5) by MW4PR03CA0227.outlook.office365.com
 (2603:10b6:303:b9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 09:51:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:51:12 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:51:04 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 08/13] drm/amdgpu: add missing lock in
 amdgpu_benchmark_do_move
Date: Tue, 2 Dec 2025 10:47:18 +0100
Message-ID: <20251202094738.15614-9-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|SN7PR12MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a03b7c-279e-4616-4080-08de31885407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kvSEgXujRTYcxmXNWzM6eOhkNp3I3nO0XpMXL3BVcuJrLVU3SqhLgxFkZ64W?=
 =?us-ascii?Q?RcrAZgj8FEZHkWuJ/xq259/Y1YNLo4BQYkJtG8HlBXKYXtlvw3uimzhkj0Ic?=
 =?us-ascii?Q?A4v+Ye9fHyL9zQBvIJkF6N76RxSHM3QpbfoGg52qw7brGe7hIKRJjDp0ALg4?=
 =?us-ascii?Q?GJOBQSvJe2xvD/BsqKm7Emz20KewLJb0P0G6O2A50BxHeeCT6e5zD2DmnbUN?=
 =?us-ascii?Q?MpPxXAJUyTM36l1FrromgEbjYk/tNWYFeKLT2gNz5t2+Ezrz/DLU0sHi9Pzp?=
 =?us-ascii?Q?PzPA4Epf6K2t/Iw4J+SEyxowSeQC8y9UekYzOIT9puONpK4ahymrv28G8nP5?=
 =?us-ascii?Q?kQ2Ybal5FGhzRf6NrF5oGzw0DpDHDNHtTlJzgHKa+VRiWJ22qwfUc86u0B8M?=
 =?us-ascii?Q?kFygbS/tWr3JFP4KqGGi2lMhIH8GKKl0dfGE7WW1tlJ+WWIsNpF/UA8YIN4x?=
 =?us-ascii?Q?ANTBClAK/r3vJ96QIuDfoOPmVLAUt/Ku9uMgdYSwfrDsEV7ifF7seyLnpJ47?=
 =?us-ascii?Q?FtcWMoXSvaEvoYiki4Ghcnpn+L7ejzYQt/LRHni4ywKcTqvS/0fwewp3iSAl?=
 =?us-ascii?Q?Rp8v3m7ZOFDejKeqQTon1r0TbbhsQq60pT++Q9qj4ipDn6eZbyXZcDP5Q9+s?=
 =?us-ascii?Q?lE3BpTbzCsQidSe+6LDoK5l8WEgytO14QKhkQKGzvcQxCmXOdaulyccoan/4?=
 =?us-ascii?Q?47Ma1cK94ivTMJCg7Xst5RzayZA+SjmPQFtlko5Z5qNSv4RxaQF+pw2fFtHn?=
 =?us-ascii?Q?WqjTm9Ps2Nm1zgyCYucC6DDIaKUiR70eTmOj2FWTVfO/y+HBDU6aUOMqtzmO?=
 =?us-ascii?Q?oP6qIslUcpwyEeIXwCvt0je60/pzO3/LgHDhup58cmHmUt+vp6csnMcMZ+T+?=
 =?us-ascii?Q?trVxkMWdVu29Y1YwdQZqAMz2D0+EpLSXwFT71/BiSHyEmws/3n/vfzrqCo+X?=
 =?us-ascii?Q?sPCzQDGq5J6RPSAdOp06ln6NXM4ZEvQhntd05rwRb0sNclqFHND/pAb1j9oB?=
 =?us-ascii?Q?+61uV65pq3qK44LtpEveQXFOzC3Ts7ww97ljzICTYFt1vRs6/3d3rzRT3auY?=
 =?us-ascii?Q?TZt/tUHjGC2F0y1DmE3XcQmbwgrwIRA4J12G/iw7bi3LKAR8kCkKKtZs/fKK?=
 =?us-ascii?Q?aBJvX7P4jcbRdUC+Jxk0Vp2BxOkYiNqcVG/6upXh653Jbz/EyVOYIoyULMbP?=
 =?us-ascii?Q?eOUllfvVUBFsgTb35rT+wS1FgnKIce/D3ui38L+DFHtxs5nDA/OcvVx9Xpr3?=
 =?us-ascii?Q?a6UNpL4CKfnZ8YTzxpso60QDiw4+NlBxcxYJ8AsH+KWfCBcpnVlx1momXWtz?=
 =?us-ascii?Q?XNIh/dQ0pWxJsQvhdl1DtY4tnkgg7W/00S4af2Ntl5S15UVbtNRe4csbh2zA?=
 =?us-ascii?Q?5PWvaaiI9JvEQF82CUAKQHa1cpH6EPB/OPgp+VTi96kUUgi9tJSTxIfDAdBy?=
 =?us-ascii?Q?ppMZ1ol6/iiRd1Jr6ESueMoyO0g55iUtGZUFZ6dNRpjAs5p5okZ9on0g29oU?=
 =?us-ascii?Q?uVoSm9A/3dLqXiQwVD6QkoiSek8akGA1ljYmFojQsDZBeb5mS5RMPL9ot+kP?=
 =?us-ascii?Q?X4cDX+lUOx74yEGwybI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:51:12.6898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a03b7c-279e-4616-4080-08de31885407
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912
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

Taking the entity lock is required to guarantee the ordering of
execution. The next commit will add a check that the lock is
held.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index a050167e76a4..832d9ae101f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -35,6 +35,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 	struct dma_fence *fence;
 	int i, r;
 
+	mutex_lock(&adev->mman.default_entity.lock);
 	stime = ktime_get();
 	for (i = 0; i < n; i++) {
 		r = amdgpu_copy_buffer(adev, &adev->mman.default_entity,
@@ -47,6 +48,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 		if (r)
 			goto exit_do_move;
 	}
+	mutex_unlock(&adev->mman.default_entity.lock);
 
 exit_do_move:
 	etime = ktime_get();
-- 
2.43.0

