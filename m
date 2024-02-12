Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793B1851F16
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8620E10E724;
	Mon, 12 Feb 2024 21:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mYvBnzb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175D710E56D;
 Mon, 12 Feb 2024 21:04:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUTKtUWnpkGauod+rpSoHHTNoDRXWfIgM3Tvrm7tFaEg19RwextUNPsL7A35852uArVglQtS4EMIqm3cHSR6aYg7bS/ePnO2qQEBdIsymbRtYlqKw7RbBxGcKsdMi+2cq7SolvLqHtK/kO+BNr0I6NaX+m8OhzjyMK00KYZACb2nWySmvf5zqxUhgsQ+ni2vqRxH3yJ+LANxWNHnKMj5we793vI+Zf25wKLfOsRW0gg1j1EbIpI0ZPMJE9oirJf9fp9kdVqq3VYUeBlDAa4Bhx5q28ex5xJ9xpfzqhi77bHqN3tcpuiGFi1GGsYVp1xt4yLShNW/Jv+/C+8eAxxcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRtM1wsUyneTByH711abrNxiqsruk/2WT67jRGs7CKc=;
 b=Mltbwsmwt4s/xGEvhx7zAIOdVMtGiOWYA9X62oE633WUQmBOzdsFPb6aG9OQeFp1e1eFxN/2tSXL2z01Ci8V0F+08QVpTR2VSEvMcYgDI0Ham+JQM6kC42D1J2GacZXVkpnZ9DnxfyaayPUnF4bbg1ywpAd09wflntZDw+U5fASCDtWRS8tEPk/qTDNhriA19RoUnM5OKs8Hb5jxqdXhWQmzBx/Ohqeg/IlGgUqVNMXuP4mPYP8mO++3rWqh6CtJ9XelAZeWaMZ/lDQSZBTzGbnKmOj8ZzKhtr+rwBnbmfjTKtdhzXyNDTB8FzGrPxd3PsqWo3BsS3M374x+zvo9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRtM1wsUyneTByH711abrNxiqsruk/2WT67jRGs7CKc=;
 b=mYvBnzb8HHndQMZJff/p2sbVwEEk4SBkhju77Qbv9Xm4s2JF9k1QdmfMhZSGmOqlacw+uv6jwyj4SHQL94Z58kysL3XVRFzG56fxS/FgYV8EHuUSs7tupbKY4W0K7ZlJGDChwsRCwjnJfZxHI8hvziiFybjvzLzOyRJiaL3N5bU=
Received: from CH0PR04CA0083.namprd04.prod.outlook.com (2603:10b6:610:74::28)
 by BL1PR12MB5047.namprd12.prod.outlook.com (2603:10b6:208:31a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.23; Mon, 12 Feb
 2024 21:04:48 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::fb) by CH0PR04CA0083.outlook.office365.com
 (2603:10b6:610:74::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 21:04:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 21:04:48 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 12 Feb
 2024 15:04:47 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 6/6] drm/xe: Update shared stats to use the new gem helper
Date: Mon, 12 Feb 2024 16:04:28 -0500
Message-ID: <20240212210428.851952-7-alexander.deucher@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|BL1PR12MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed80f1d-a569-4b89-0a7b-08dc2c0e3f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOD4OR9ED8xqw/UXMk9LYLHifHYgi8XocO/HdIrrDH0XJBMtu+dJPP0gpEsBbQvHLTYD6WjSugEIP/L9a0lleV/IGtuGVEfPZyd6SSuHu+XCH4dgxp94WRLxNY90mD60DYYURw/EWKsyeyEFyx+ahXUdLa+VMm7qizc5M2gW3WnJUX8zuQuUWmDnhaRoihylqF3B74U14+oC9ecrI+jHQ1m0dPcUgFCdTVKwHCjfNNe2AlcHpuME9ZoIU8OKcVIznudMj1nwT46YCspvHv3xAwsgWnKxpw7oQkspuMFBp+JtNTj2lh09g/NVxxHEAvuCt80ztJNt97unQp0tbCj1ihkZITClfhKplnFaoexgabQvKWUnnM6p+zCUWGk8xu+sqN2GSldqlFEtVwoXd54mh0YAvYPOz9OOUyJtI9pOlPT2GXdvxffeI03eI3uJNUMgohye7mh484fNZBg0pnC7pYUcGDD6UoRogZrP+7gg57BuXiBV4PzJHoiqOCmbAcaHurF1v+q8iSn+RHMUF/BtQvP5YgXxlCIN4AgiLaVM82Dg7Ei08fsptbxlBMz/yMRVaAKrxbltfOCyFQjG+VfdXA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(82310400011)(451199024)(186009)(1800799012)(64100799003)(36840700001)(46966006)(40470700004)(36756003)(2906002)(966005)(7696005)(6666004)(336012)(110136005)(83380400001)(82740400003)(316002)(478600001)(426003)(26005)(41300700001)(16526019)(8676002)(1076003)(70586007)(70206006)(8936002)(86362001)(4326008)(5660300002)(4744005)(81166007)(2616005)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:04:48.6187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed80f1d-a569-4b89-0a7b-08dc2c0e3f88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5047
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
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 82d1305e831f..ecf2eb67d310 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -113,7 +113,7 @@ static void bo_meminfo(struct xe_bo *bo,
 	else
 		mem_type = XE_PL_TT;
 
-	if (bo->ttm.base.handle_count > 1)
+	if (drm_gem_object_is_shared_for_memory_stats(&bo->ttm.base))
 		stats[mem_type].shared += sz;
 	else
 		stats[mem_type].private += sz;
-- 
2.42.0

