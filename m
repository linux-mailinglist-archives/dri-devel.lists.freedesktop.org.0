Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D280D917B58
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0019F10E7D4;
	Wed, 26 Jun 2024 08:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NaF8lEmy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6DB10E7D0;
 Wed, 26 Jun 2024 08:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQWBo6RS902zxHxQgokFvDPwbXKeq+YA7f9ru2fZHOZSKmnK6vTF2Jfizg8LAqYx57cReTOEoIfw/GMP8PcQ2ZeW0GP8OTMgSyWTljtKHfrZKL77TFWjIYCp60a4SGZV41bHerY/Ly01Wb1VqVrwPDRDl/ZJ1mPhQdwmSQCgYzLiAekci/4X8ka1+CPlhSz97Cx9RRP2N0rExaGMYQQYUCoMGTXemsQC/t2ByRchhyALjf1dkCuHs7R6+rwtNhIwJBoPX4mdkOWbSea0d48gXLCLOSsnWRRTazISBwS/EwdMWrArPjSeZBQH3Jsfh6FZxM/7LHVtFAkVPRujFTbxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FL6bSV228+bpg0up16wDmfUOpDDr0CI0ysy7JObFjo=;
 b=cJCajQ1GxyDJqy6DEAwrKeOIYoJK//wtq2S1vL+CwHqqgDtzi0reo8kG2Iu8ijySik5pmp6JWYABfGBlT0hGQe1sPm/mW7q7S/Qf8xjzmmLdOh/GyzNRfdjOn+ZpkMNb+G+eIQ3t2A8z4mDnt1STuQ1l0OpRZ9uw7qk7aX/vD0TWA77jtwAK8jLBxx1ExDOWrjvx9pdGoS498Jq8CnWudgtkU835USbNgJdKEMweICkNWjnlKhFcmN4kzpBaYFis1Ig3TAUSExqvOPEmOwJcZwGk1swiBqxuK51y44NkI6+Ls6J8D49KW+3W8u+X0819fF3vhDWAd8WvcBcKsOBomQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FL6bSV228+bpg0up16wDmfUOpDDr0CI0ysy7JObFjo=;
 b=NaF8lEmyx3W5cmtymk3qjXCmhVa22WJYzNkDsgHj+bMWMvKR6ztfeokN2Hqxwr2pXLAYfWeZXO0+hkPU90OveP5NEmi7Fg8EZqpXmyDq2rNe0u83Z/4ZfQneMYDVfnVjfwSBWq04IF2uR1eh74lrr2dNR/OU8RVhPe5EYiRpsk4=
Received: from MN2PR07CA0018.namprd07.prod.outlook.com (2603:10b6:208:1a0::28)
 by DM3PR12MB9433.namprd12.prod.outlook.com (2603:10b6:0:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 08:49:29 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::15) by MN2PR07CA0018.outlook.office365.com
 (2603:10b6:208:1a0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Wed, 26 Jun 2024 08:49:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 08:49:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Jun
 2024 03:49:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Jun
 2024 03:49:15 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Jun 2024 03:49:11 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <jani.nikula@intel.com>, <imre.deak@intel.com>,
 <daniel@ffwll.ch>, <Harry.Wentland@amd.com>, <jerry.zuo@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH 3/3] drm/amd/display: Solve mst monitors blank out problem
 after resume
Date: Wed, 26 Jun 2024 16:48:25 +0800
Message-ID: <20240626084825.878565-4-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240626084825.878565-1-Wayne.Lin@amd.com>
References: <20240626084825.878565-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|DM3PR12MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e5b198-b2a3-4c15-4c10-08dc95bce3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230038|82310400024|376012|1800799022|36860700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?csW7x2PC6zZqo/AZR1jrCVLYwvhaFRtMs7mDBYgcBP63HGlU+jEQneXFw8JD?=
 =?us-ascii?Q?IuXt+DJlou8Mdz9sNEVe0tPHFUGH66cqLP9HsRY64xR3gK0PD5rsEeHnAhUg?=
 =?us-ascii?Q?OpHiVtI0bhp3LOo2xae4Kp78UJh9SNggzi4eAZHsivvTtogwXJhB1hknlgHW?=
 =?us-ascii?Q?RrcHin0Sco+cQq2skh9E2R8c86sFMwEip2ExVEeUTgwZh9DLA7hptrCWUVpb?=
 =?us-ascii?Q?ASfbT8g9ZE84K0Lc521M9h2CFU4TgQEI0qLRoD1NcEOKT5kXKq2XQ5r16Isc?=
 =?us-ascii?Q?gMutzlDNL32HNGiA8oVeaPUc/zpRZQyTWqhqITEtwMRfWah74cFOZ5uU4hWT?=
 =?us-ascii?Q?j2Apt9LvihcvzbyUFsFSKDqw22JZ7s7VU9Z3mvTja4UDMnEKP2YxG2fvJAIb?=
 =?us-ascii?Q?yrM9DQs4PXfZ5gZhVVwuwcXwNw6fkSprDdKlMyvHrpXZwtOEz/6FRxSUnddf?=
 =?us-ascii?Q?1/0L5WWLbLx5rKzmZbqt3Kms52YXb016sDJXVmhBFfLhJWSgzFOcB+tFX6bM?=
 =?us-ascii?Q?zcPfPveWoGWk+mbH90JumkLHza7puwNYxaXuAtPsM+RKbckm1amHcdzq4rLp?=
 =?us-ascii?Q?ahb940cjleOMNDpnGNPtxNvs2S0Okqh4fLfLw4qQcFqRKfT3Opb4gQ+SlHZl?=
 =?us-ascii?Q?ZyU6GZlAyQPli72C250WuL7yzYxXrhqMJtC98TcIMuktG6ZgVZO/j8haJRQo?=
 =?us-ascii?Q?g5+//h3JD+YBa8ZvEkrLJhFqlWwlAsC94rY9DJ2uOi2BPLJ08LkNx2K9csw+?=
 =?us-ascii?Q?WFNi4hCJq06Wfqo6JYPx8OvQgVvnffvZ2+4jM5aaEJfuFqgwf907npYDM9Tg?=
 =?us-ascii?Q?CdV2H76BRLZMK82Uk8L//0xM6ZqLBZz6XHkjyXJjduHYSIDaFQYS2i17BwvA?=
 =?us-ascii?Q?XPoTUuISPpgHQkYxophn8LwFsfvPdQ5vcnbha67NYDLaQmt3+y8Yc2LLkZpD?=
 =?us-ascii?Q?zRkipHSldIxeG7mW2KTWIbCLn+1GFBu4yI+EGj6f527KMRsz6DbLSOKbtplD?=
 =?us-ascii?Q?cY7bGVU7tJYS30qS7j2fpGuS6WdzEtqjgm97BZBpK7r64DrfUmAsRBoxnChX?=
 =?us-ascii?Q?hsYiJ+25EC3kdw9Y3cBIOedQgYz5iaqG7k0k7tcoY3PLIqcQRy88zUV+8ZIZ?=
 =?us-ascii?Q?WAt7i9lnmvcyblFFPFW7EFsq4xTPgDUN8A2GL4WQAhxUvbJgCKNwu1NoqmAQ?=
 =?us-ascii?Q?kZAyTGXRJB/79AuKvwfbO7yPdqxT/cKW+Y/GGldtza0odUhvze4gqMQttBh4?=
 =?us-ascii?Q?ymvmF7BcrUBO9LzZOG/OQjSt1TgBwqtS80XBK2+GJXKJTgdr/gTnu44pwwId?=
 =?us-ascii?Q?4TjENHh0aZEQn2KnaYv/dNH2QPd8e23SF9l1/4IiyvQQWXFczB2MhPfYXRxy?=
 =?us-ascii?Q?h8P5jXCjtkh3zlc1omLGow7e3nUgkjbR0+ADAxB3iZb79AGotw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230038)(82310400024)(376012)(1800799022)(36860700011); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 08:49:28.6170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e5b198-b2a3-4c15-4c10-08dc95bce3ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9433
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

[Why]
In dm resume, we firstly restore dc state and do the mst resume for
topology probing thereafter. If we change dpcd DP_MSTM_CTRL value
after LT in mst reume, it will cause light up problem on the hub.

[How]
Revert the commit 202dc359adda ("drm/amd/display: Defer handling mst
up request in resume"). And adjust the reason to trigger
dc_link_detect by DETECT_REASON_RESUMEFROMS3S4.

Fixes: 202dc359adda ("drm/amd/display: Defer handling mst up request in resume")
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c64cc2378a94..b01452eb0981 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2569,6 +2569,7 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
 
 	ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
 				 DP_MST_EN |
+				 DP_UP_REQ_EN |
 				 DP_UPSTREAM_IS_SRC);
 	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "mst write failed - undocked during suspend?\n");
@@ -3171,7 +3172,7 @@ static int dm_resume(void *handle)
 		} else {
 			mutex_lock(&dm->dc_lock);
 			dc_exit_ips_for_hw_access(dm->dc);
-			dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD);
+			dc_link_detect(aconnector->dc_link, DETECT_REASON_RESUMEFROMS3S4);
 			mutex_unlock(&dm->dc_lock);
 		}
 
-- 
2.37.3

