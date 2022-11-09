Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27226231B9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 18:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D457710E037;
	Wed,  9 Nov 2022 17:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C0710E02C;
 Wed,  9 Nov 2022 17:46:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHfsFUJzMTs+moow60vQwInpGBHbPKoN+2yepis2x+ak1hoGjoHau/AsgPmAGqWWV7efUAk+kQScmH6G3SjMzXG6wXGiS8ubzqymrz5/rebKO+VApNedwlyeg7nO9M5muTHCEqHNJNpCkkKCWA2h9Vzv9aWEx6xd4r/6qkBxQp3DNKVc+MxQmI+QSsfDPkWp5/FDndFxvnj/x9JCP4JiQrJ5m5HFo54L2Zp1BICJ/RvNuwTcVTQ0ac9aovUq61Tt8Vqt1YiEHnm5HVlijPDGqUSSmXdMcnTAVUcd7icWxe/Soo9QcKX9qSbhvi10V7Ecbc5bSWKNr7dQSe7VclE1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAn/CfaYg8T7hiRGZ/nflqMFNH7A7GqWKnsKdoQepcQ=;
 b=E8ezOiLCwvgilgOLQTotx0kUNbuQ9X5YtIpCSbDX7E2Q3OzkhtdU96hMvhb5LGI0AoUsdtsNcIyDdM08LWDwHzmn+F72uSaL2iDXnkA/rKahVmUAfl6pCvYb4hoDGaeBAJ0/OyBZI1ztJSKjc2/bd2+KrS1stCI0E/FU39iyIcq/bNVk4wkWCIEeZEJGzSE4zbk86rGAIGVaVWIGF+f2rQRRX+NF4kEnO6HPmmmRpWJMZxusI2M1GhkLHMTBlFAf0BD2RENAXbECu4tnhQIG96fZHeY24KntZdzJUhbBJVI4A687sVAHSvE1WE3aLr54WWW5I32SLC5xu1hin0MkXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAn/CfaYg8T7hiRGZ/nflqMFNH7A7GqWKnsKdoQepcQ=;
 b=tcSvj3esFf09eoAgdl9kwPjIo1UM3CAZPa/Pp7zBXRQXLpbeYUpXfk4oYKNavRGEaU7laFqgzuDrzSYbSG1SpPTg0TPdOLWSjR1kiTPdFZ93Kq3jN31LT/AkdjIIINSXXZDRAO7MzQpeDo7G8kJKqm6AOlarmzKgqvt9qO+sD3k=
Received: from DM6PR08CA0050.namprd08.prod.outlook.com (2603:10b6:5:1e0::24)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 17:46:04 +0000
Received: from DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::6f) by DM6PR08CA0050.outlook.office365.com
 (2603:10b6:5:1e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Wed, 9 Nov 2022 17:46:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT107.mail.protection.outlook.com (10.13.172.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 17:46:04 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 11:46:02 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: only fill dirty rectangles when PSR is
 enabled
Date: Wed, 9 Nov 2022 12:46:27 -0500
Message-ID: <20221109174628.150234-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT107:EE_|PH7PR12MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 879d6752-1cd8-4595-4567-08dac27a4616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6l7DexLWkh2HOEYjvm+TXdTK11zUixmHgEeT7Po0sqCFO4+sF3u+4LzX8F9oAv7OFzf4IXF5nCHygAR9/WpmrcsvW4/DxpPe9YDi4NUk8pZb9oJwZQe3gdZU9RswsoN4nA7plKca77XRctq+b5BVE07N19oHzghvS2K5g1Mtevypp1S0wOoQ2EBRt4ch4ZhPpmPGQpcpIHfQBEn3xXW5zOkIg/ydvoTeFa/7gA/5logIy0SftXKuf6S73m90rsfFnzL909cIrbc51+/AfwfZAY2bBQZHfOSagKY8Th/2g3kBKmXkqduLr+jhWRaVfuNgDfa/eNwGxBQNQxMVDVZ2SMrGAtCFz/gZo/AdB6ihTmPGLje5Mw+Vp2SUGJrMgePFsHxQuWuynEMdCsX0swoTbG/hGfzZagJk4cX+7ItRyfPZo4B3+uITM43joeamPxpbZmZa65Q7CBHAleOttrP24dHiu/KaSB+UBH3GhiXxcLM1wAwFv9VmFA5iLBFcdl4iENNDAY280d+pkZ20QU8DgNfzulPsvhY4rdEwBZ4JILBUqtfiGCGzzMNtyCygnPGBydyaqz2lSVeSM89g3/bpRTcNST8HSZ/uubT/DkC/WJl8Oo1dWu/JymiBfaV22e4L/IAq3fXg9wbv67Rp3ScmnO/WXwrOhD7WU66IK1jeO7aOjF5jdjpWQjNeu++xT6EpWcNh9/HHK/iwNkj82Whc93Awipv+AQw4Zf2gV4PWr21qyw0JfI7nShEHGxLKu1oWPDwj8IlLkDKLpR4aMgN5jYI7ATlDpDPK1Ba1deEBBD/i7dpfUwNNL1ImjYrTSxqnrGA9lEBaTty25wBLq8/DorHs6QUBKk8EDL5eSli3VS0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(70586007)(70206006)(82740400003)(26005)(8676002)(4326008)(316002)(2906002)(7696005)(47076005)(40480700001)(426003)(336012)(83380400001)(36860700001)(44832011)(40460700003)(86362001)(16526019)(186003)(1076003)(5660300002)(2616005)(41300700001)(36756003)(8936002)(82310400005)(478600001)(6666004)(356005)(81166007)(54906003)(6916009)(14143004)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 17:46:04.3228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 879d6752-1cd8-4595-4567-08dac27a4616
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we are calling fill_dc_dirty_rects() even if PSR isn't
supported by the relevant link in amdgpu_dm_commit_planes(). So, we can
instead limit the filling of dirty rectangles to only when PSR is
enabled.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 66eb16fbe09f..956a6e494709 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7697,9 +7697,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		bundle->surface_updates[planes_count].plane_info =
 			&bundle->plane_infos[planes_count];
 
-		fill_dc_dirty_rects(plane, old_plane_state, new_plane_state,
-				    new_crtc_state,
-				    &bundle->flip_addrs[planes_count]);
+		if (acrtc_state->stream->link->psr_settings.psr_feature_enabled)
+			fill_dc_dirty_rects(plane, old_plane_state,
+					    new_plane_state, new_crtc_state,
+					    &bundle->flip_addrs[planes_count]);
 
 		/*
 		 * Only allow immediate flips for fast updates that don't
-- 
2.38.1

