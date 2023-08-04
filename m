Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7377055E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9450F10E72C;
	Fri,  4 Aug 2023 15:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F8A10E0C9;
 Fri,  4 Aug 2023 15:56:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLl8wKHB4ixqk/EsqHptEjegGIgOTGKz3GFSsW1CHxgXq6bKYmhZBedFQIkNCdKUpp6GE+GoiSt44vJ5jrewf2TwcLj4mEYUKe8UCLGFfMWh0ORazhaVMs17pVlhZ5jokdbgBv30ILTvs5cLIa3f23zDmnossTHXuXwZZjt4QFEHUeHg7PGvt0Q3evmF5ZM1L7bk9dcS9XYsr7KspO/toajOMnbltxMi9oUoVqDo2VrwE6A9ziv902K6+/kezJTZjqnwvE1UHNNWzbbnra1Qo5ghQjDYScTS18viH0tIV8OHL5NqSpsJ4V7s/zCjZTk1k3XMlQP1LNSHN/RsbfpMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMvqme8hDauvvjgC8GM4BU0yGjq7PBSNSaF8BvvePCE=;
 b=Ooz1/FUlKm5gBGmTHkulj2xNJvkdjvMbEUk8QPaWylSotKgJV9FA3PbBtH0P7KZJh8ODy6jqdHc0SbtUq1k9j0ia2e/8TrDiO3HpZPeWkk7uYWB/zkCz58dCBRwsDlsi7VGctV4hjGGQoIKoTPQkfHZrow9awy2FFxWAtksAh82jvcb65KRpZxg+NmRhWVRgDD7aBD7bQ+Rj2xWhD1MZcY+RVZP7+QNftrQe7vZ6GrNEiwOhiI4OnGCDgAw4GunlBYS14+hlRdhqCk711SvXqoJQqPNuWD8VTGHiHshzEWm6NNk07MViefoxxDjD5h9Qm1FRi2c3MmbdSgQM73Y8iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMvqme8hDauvvjgC8GM4BU0yGjq7PBSNSaF8BvvePCE=;
 b=Qi7qfiHD+HfVQ2tz/0cOfsvtlUTeu6/c26flLnT8RJ6km8eAHw0SOBqogbT8pnSj90axwwxgxC55mN57B2JfjbccoMenN2tevrIpbOKRpTOYBmv61n7ltCegkDEA8CIAFCQw5pZSte6CpRa3LjhjjuXQFtXz1GSgINpnn238A5Y=
Received: from DS7PR05CA0023.namprd05.prod.outlook.com (2603:10b6:5:3b9::28)
 by SJ2PR12MB8110.namprd12.prod.outlook.com (2603:10b6:a03:4fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 15:56:35 +0000
Received: from DM6NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::ec) by DS7PR05CA0023.outlook.office365.com
 (2603:10b6:5:3b9::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.9 via Frontend
 Transport; Fri, 4 Aug 2023 15:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT086.mail.protection.outlook.com (10.13.173.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.48 via Frontend Transport; Fri, 4 Aug 2023 15:56:34 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 10:56:32 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: ensure async flips are only accepted for
 fast updates
Date: Fri, 4 Aug 2023 11:56:09 -0400
Message-ID: <20230804155613.117310-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT086:EE_|SJ2PR12MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: ad00b647-108b-4854-a492-08db950360fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gcInYj8dg3heQzvp3qx3Sl5vHBJ1jYEyUjSaZEg7Zy3O3dhBjhV6RKSg4qIjBqCYFDUGjwaKI0OfQato8vRiJTulVdsvouf6iGHHvrR0SjjHdTOgtivZRsnqA5dhFgrzzgrHEBvLDNphltzAisLj9GQdDeNB2NWiWru0B2MHC7HuimOZs5wOi/hYNU+NUTT6Gu3qvnKWTUI+SLwfs12nfIoRpFOMK4HySr3I71e1GHyF9FkWhCPqZ1SGsOr+E3BnKRpthV/NMbUJVQhmCSACQwqAK/oIlyEbbYoPBBmxBzP+AyctPFyFc4A1HEo8oI6csCpqkEi4U8lvO20aUZD1EyWeyU1eeZzSFs9A3p51HAUCXVMEH+A9Mrvt2Wq6ArKpDfS6LgRo8BxAidBywlKytDT/Fs79kU8yMCfXmCz7n3xtfjvQtRb58XU5VKhPG6faCbtT6p0zcSasgxZMnik7VEBinhkQzXnMRiWEQqO9wx4t3D/iXKi2itgu54iog3r4IyX6qKerirBGC3EkujQaLTrDVzIPblSjaBBuUnp1GiHhQKmLYfr6UncPmG5KiYn75vYPtob40q1ge6b82C9x6fmVceTkwf/bITHsVPaI2CGIAkLcJpjZJXjwb2wCMTlbzza539HCgF30vyz7lAzMXDh7mRsHU8b+fxgMBWXpWUB8F9Fqy3h1YBGL5+Z991ES25vKgoxDRc0I43bosk7aVEUUGpUySaFbm4dytKVZ8Bg3LvjSoSijCIqDhzfMc2dqrbCIO0KwYHG0EaQD0ycCoY5KUNfQQkvBnnJcjYvIwp6Xj0j4DW7KnU/Km8FMTGYK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(186006)(1800799003)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(36756003)(86362001)(82740400003)(16526019)(40460700003)(40480700001)(478600001)(54906003)(356005)(47076005)(8676002)(336012)(2616005)(426003)(83380400001)(1076003)(26005)(15650500001)(6666004)(7416002)(41300700001)(8936002)(44832011)(81166007)(36860700001)(316002)(2906002)(4326008)(6916009)(70206006)(5660300002)(70586007)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 15:56:34.6820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad00b647-108b-4854-a492-08db950360fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8110
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
Cc: Alan Liu <haoping.liu@amd.com>, Marcus
 Seyfarth <m.seyfarth@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Melissa Wen <mwen@igalia.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 David Tadokoro <davidbtadokoro@usp.br>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
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
Fixes: 3f86b60691e6 ("drm/amd/display: only accept async flips for fast updates")
Tested-by: Marcus Seyfarth <m.seyfarth@gmail.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 25 ++++++++++++++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 12 ---------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 32fb551862b0..e561d99b3f40 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8086,7 +8086,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 * fast updates.
 		 */
 		if (crtc->state->async_flip &&
-		    acrtc_state->update_type != UPDATE_TYPE_FAST)
+		    (acrtc_state->update_type != UPDATE_TYPE_FAST ||
+		     get_mem_type(old_plane_state->fb) != get_mem_type(fb)))
 			drm_warn_once(state->dev,
 				      "[PLANE:%d:%s] async flip with non-fast update\n",
 				      plane->base.id, plane->name);
@@ -10050,12 +10051,18 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 
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
 					    false,
 					    &lock_and_validation_needed,
 					    &is_top_most_overlay);
+
 		if (ret) {
 			DRM_DEBUG_DRIVER("dm_update_plane_state() failed\n");
 			goto fail;
@@ -10069,6 +10076,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 					   new_crtc_state,
 					   false,
 					   &lock_and_validation_needed);
+
 		if (ret) {
 			DRM_DEBUG_DRIVER("DISABLE: dm_update_crtc_state() failed\n");
 			goto fail;
@@ -10297,9 +10305,18 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		struct dm_crtc_state *dm_new_crtc_state =
 			to_dm_crtc_state(new_crtc_state);
 
-		dm_new_crtc_state->update_type = lock_and_validation_needed ?
-							 UPDATE_TYPE_FULL :
-							 UPDATE_TYPE_FAST;
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
+		} else
+			dm_new_crtc_state->update_type = UPDATE_TYPE_FAST;
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

