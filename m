Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9095C7707B4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 20:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B1410E053;
	Fri,  4 Aug 2023 18:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBDE10E021;
 Fri,  4 Aug 2023 18:21:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7GRwCAP2Ue7xwuNSAX8M1v6/iXD5SH1jiA3p7WfbISOMrOGarGic1jw+zO/dZQM+pePYm4WclRGlD8rPExQ2XOzA0UvHJgHucQGaElQTRz5Bzfp+31U0ZzRxNy5J240N/KGHwM/pxC3rItXTR2WYLYkiwcP7Fg7j6wq+23WFUl5bWnoZHA8fZUwCWqZSwqxt6hYFGqImlfQJTyRdPhoB2f/TO9htPUkgkpMoFK+Mv3oCiHa8MkQLmts8g1jp/77yphULp188lguVM6BtQP79OgpxhGV5+ijCEFZJxBNWRV/VXT6h/quzMYJLl9VX85GmDGdBVfXZnu6xHiX5XWLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muXktZ9uNSFJEYTOHALJGwlk4jfOOgu/fx2lKkRO+88=;
 b=GZZMZKGGcu8Vxw7Lat8XO82wbvtdJ1KNomutrpHeQ5V63a0TJUb/Dgwu7yiLpw95C8WFDBWRfUGp/zRiDbCTskm7+vdfpi1zNShr1P2KOeMXu53lVM8Gi3nL6N6hUCw+FcPZHjJ55SnuZOi3aKswGQT6zrhGhTTCTn131wozdMmZRCoGvkxaD/n1qNpgrev4pWanSxboRIRoPy+onVpcDRx1h5EbA9nhgu6L7lwzDFSKjkdpP6c2Nz6l0Y19wA2MrIfPS3AkKEANXPNycejbz2TmOqD2QINDTDlsVc7qA5qb8Uc2qDjhYSqlWzUlFE+dwfuWRJX0g7+0+bZf1VSKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muXktZ9uNSFJEYTOHALJGwlk4jfOOgu/fx2lKkRO+88=;
 b=Xg3z8k+5gorqZ4r0uM3B+s5Hq8bML5VqczkiSK75hHtJ+WhPjlAJ9KrLWjTrsWCk9VrkRMK5tjwewEjoFbHmX93fDy21NgyU/b9XvieiKJZ+DeDGaOWhQmo6nwlJiha6/CkG9CCrsM3+hppFXVi3xuMUWimQwwtsS6PRBIQHqUQ=
Received: from CYXPR02CA0062.namprd02.prod.outlook.com (2603:10b6:930:cd::25)
 by SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 18:21:17 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:cd:cafe::c3) by CYXPR02CA0062.outlook.office365.com
 (2603:10b6:930:cd::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21 via Frontend
 Transport; Fri, 4 Aug 2023 18:21:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Fri, 4 Aug 2023 18:21:16 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 13:21:14 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: ensure async flips are only accepted for
 fast updates
Date: Fri, 4 Aug 2023 14:20:51 -0400
Message-ID: <20230804182054.142988-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SA0PR12MB4431:EE_
X-MS-Office365-Filtering-Correlation-Id: f7751df9-05a1-43fe-a54a-08db95179805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMMlEr1Bvix+4PAmdVBDN1/hv5uJy6FY6n67TKbx8UBHon+tfElMctWw8aSW/tUPbIsJJdIPgisGNO+ELR6ZidInfJKhfzCS2OH9W2xAWxfjrNLRoxbWQ2JXOlNU0FBxQcjWYIpJaWqn/EOLzGgyIGzUYrr8i7M2ItC/dsBm1MWbLYz35wcBEReRefuevr6RuvwCuQIzDSFTMgv73pib41TKyQlCOEOn64WK1WRWSJ/T6Ks96WzqcX1xom+BUVorUG482jrG/zGKKCTrz04/HecXu9D1uCi4C4noQl8C9zkjci2Uv1Gd5XZIEMpZxuSKd0TKcaNL/YBhw6HJm1FYzgo5fEb+4vI68J9eUEtyZeNEcCTsbns1SJvwE65hJBkmxDVL5yFhv0EfLoN0h+z+28gQ/4jVTpG6/vqu8uB8FkZnti1u8Gfqmo6BqfoZKLkex+W9GLh10oNQdaaB3AGqFpLmFCqfxagR7eBTg0rFlBN7P8BLBSywIKAl5VSvLYle8ZQML5366MS+2zp1mDSfTeQiuC3p/ADJA1yyjeEo5OdL+wfxCEdpggJp7cxvrzKINAmTqgTI+ZYetO7zRoPMjbym8rhmfaCzw1tzVg1Wv6atxWirxVKsSd9pkMHZoabGUnGSazR7xrMoWkF17X4/fB594QOHMjY5VepurXU9nAb4is64AFBkhwglzD5aLzmuhm+bSNcH1OxgAIPk3o+GQzZKBrT/xqLjAcPvcyDLlGY/AliZrouaGPCAiqp12uFHvDj+DEFseQeWlqjZ9TbIiu/+MXfy/oZz5JPtVK4L0Es=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(1800799003)(451199021)(82310400008)(186006)(36840700001)(46966006)(40470700004)(41300700001)(15650500001)(4326008)(6916009)(2906002)(70586007)(8676002)(8936002)(356005)(5660300002)(478600001)(44832011)(54906003)(82740400003)(316002)(70206006)(7416002)(86362001)(40460700003)(6666004)(966005)(81166007)(26005)(36860700001)(40480700001)(1076003)(36756003)(2616005)(47076005)(83380400001)(336012)(426003)(16526019)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 18:21:16.9256 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7751df9-05a1-43fe-a54a-08db95179805
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4431
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
Cc: Alan Liu <haoping.liu@amd.com>, dri-devel@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Melissa Wen <mwen@igalia.com>, Hersen
 Wu <hersenxs.wu@amd.com>, David Tadokoro <davidbtadokoro@usp.br>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should be checking to see if async flips are supported in
amdgpu_dm_atomic_check() (i.e. not dm_crtc_helper_atomic_check()). Also,
async flipping isn't supported if a plane's framebuffer changes memory
domains during an atomic commit. So, move the check from
dm_crtc_helper_atomic_check() to amdgpu_dm_atomic_check() and check if
the memory domain has changed in amdgpu_dm_atomic_check().

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2733
Fixes: 3f86b60691e6 ("drm/amd/display: only accept async flips for fast updates")
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: link issue and revert back to the old way of setting update_type.
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 ++++++++++++++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 12 ----------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 32fb551862b0..1d3afab5bc85 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8086,10 +8086,12 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 * fast updates.
 		 */
 		if (crtc->state->async_flip &&
-		    acrtc_state->update_type != UPDATE_TYPE_FAST)
+		    (acrtc_state->update_type != UPDATE_TYPE_FAST ||
+		     get_mem_type(old_plane_state->fb) != get_mem_type(fb)))
 			drm_warn_once(state->dev,
 				      "[PLANE:%d:%s] async flip with non-fast update\n",
 				      plane->base.id, plane->name);
+
 		bundle->flip_addrs[planes_count].flip_immediate =
 			crtc->state->async_flip &&
 			acrtc_state->update_type == UPDATE_TYPE_FAST &&
@@ -10050,6 +10052,11 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 
 	/* Remove exiting planes if they are modified */
 	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
+		if (old_plane_state->fb && new_plane_state->fb &&
+		    get_mem_type(old_plane_state->fb) !=
+		    get_mem_type(new_plane_state->fb))
+			lock_and_validation_needed = true;
+
 		ret = dm_update_plane_state(dc, state, plane,
 					    old_plane_state,
 					    new_plane_state,
@@ -10297,9 +10304,20 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		struct dm_crtc_state *dm_new_crtc_state =
 			to_dm_crtc_state(new_crtc_state);
 
+		/*
+		 * Only allow async flips for fast updates that don't change
+		 * the FB pitch, the DCC state, rotation, etc.
+		 */
+		if (new_crtc_state->async_flip && lock_and_validation_needed) {
+			drm_dbg_atomic(crtc->dev,
+				       "[CRTC:%d:%s] async flips are only supported for fast updates\n",
+				       crtc->base.id, crtc->name);
+			ret = -EINVAL;
+			goto fail;
+		}
+
 		dm_new_crtc_state->update_type = lock_and_validation_needed ?
-							 UPDATE_TYPE_FULL :
-							 UPDATE_TYPE_FAST;
+			UPDATE_TYPE_FULL : UPDATE_TYPE_FAST;
 	}
 
 	/* Must be success */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 30d4c6fd95f5..440fc0869a34 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -398,18 +398,6 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 		return -EINVAL;
 	}
 
-	/*
-	 * Only allow async flips for fast updates that don't change the FB
-	 * pitch, the DCC state, rotation, etc.
-	 */
-	if (crtc_state->async_flip &&
-	    dm_crtc_state->update_type != UPDATE_TYPE_FAST) {
-		drm_dbg_atomic(crtc->dev,
-			       "[CRTC:%d:%s] async flips are only supported for fast updates\n",
-			       crtc->base.id, crtc->name);
-		return -EINVAL;
-	}
-
 	/* In some use cases, like reset, no stream is attached */
 	if (!dm_crtc_state->stream)
 		return 0;
-- 
2.41.0

