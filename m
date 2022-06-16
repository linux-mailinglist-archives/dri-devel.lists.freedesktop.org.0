Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A7D54EB49
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 22:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6241810EABC;
	Thu, 16 Jun 2022 20:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34E610E2A2;
 Thu, 16 Jun 2022 20:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I87Ae44rUCMXLt7dkKMMGvPEuu3BYYkfHFAwpdy0OD3Les10FpaunLBg8vbbTQPD+QgvOMblz2afSgQStVuN+Ec46/Rilg0M4Z1ZpsQ/ofFDy4LPCjsiuq6zZDi3m9uVYlvmVOdOPCUztJ2cO1Yu9vx8chQWD3c3BtugqZs77nQirKvsBnDSgjPWIYfVkp7Fp7qytb6aC9updRhZD1wyFCGzb5uSq7eWXAYZOy7YUeWELhvGP4WOcfzRmt/hOGlp/qNQvgELKCjaUVqBL5dsXa2V7wR1ObKJreUGZas9E471mk1tfqahi+T9GmkLqrGiG9pduzN8ADp0eO+Acw4DzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZP4C2gPmcwv6B/dlffYSNzEuHqP1WPI4yQpH/5cLySg=;
 b=UtRbzK582zWUHrykux5URgrIeFW5OaF5VZ/NXoF97xTD1AgeTEeXtcktrULQCn5O06cqAkJcFUonrz1/M3jlhhQy/9/BbLjH2kMQl9QUTDgglIkWeLJnpYGsOB0kTxHD3JZuTDsdaNeN8e3N549Yv5PuF1U2xZ7P02qePGbDHbiRDyHPLFqNmSprNwCPIcNdiMIMw/DeAjuBgPYhXeQZs7uUpqVikLgLAJdd2pmx3pRqOc58v8wNwi1OX0XrEHxS8oTzSECyjeWYqxCybsdk2UXrkkwLFZro6AK/ZdwNjbSHb9M1GLO6vNdMPEnnj5rsoRDkWFuiD12sswr3+E4Y3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP4C2gPmcwv6B/dlffYSNzEuHqP1WPI4yQpH/5cLySg=;
 b=PdEkjGFcQUTQU25dQSBilLF+3cKgPyUMlqdb/CoOdLIbcJZ2sC4Jralx8TjsYyFE5F9VHF3KVz81zPIWxiaTqtH5S2rU4rRIdCT5RB1oQ/7+lLaooT8XpYKhmyay7ZToQm9kVXV1pyIQsE2qiPQg6JnmlgZmRGZHnip06lZgpNM=
Received: from MW4PR04CA0167.namprd04.prod.outlook.com (2603:10b6:303:85::22)
 by CH2PR12MB4005.namprd12.prod.outlook.com (2603:10b6:610:22::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 20:35:54 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::3d) by MW4PR04CA0167.outlook.office365.com
 (2603:10b6:303:85::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Thu, 16 Jun 2022 20:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Thu, 16 Jun 2022 20:35:53 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:35:51 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/display: drop set but unused variable
Date: Thu, 16 Jun 2022 16:35:38 -0400
Message-ID: <20220616203538.649041-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d76e4f1a-35b0-4a26-7bd3-08da4fd7cf49
X-MS-TrafficTypeDiagnostic: CH2PR12MB4005:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4005D516FE0293D28206EB09F7AC9@CH2PR12MB4005.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCIjKmEVLsBbMAVUn7WKACAGDRAt1BJLJlUY5KZZTUX87gth7mvs2jiwaru4y/bN0tUxsSKNWsczKnFpvwUy8f8Idg8FCTRw3xGjSDD/WDEfGrbcDpNv96P+g42xCUyBI71PbzO+Yelv3PeGvfbkLjRG26KKJMvtb9hf3gCuKUpnB6cms9ICXraY6XsNCuHnC16L3bqGm4b9/frTMa53khOpv8KDLSKqkqW05fZbwVw37OaiJtsTDafBj6zplwP9lWao6dHo/bJZm9gxGtnVTGV44S1YKfwnDvzoy6X+REzoAqw4nWjBnkBA452PssYjBaIA/vtaAPkkSNeWsXfyTNGa/UG6ivu3jxHH/qFisdkWaF9nufDDdr2369UoModkr987Ehb7umE1TJEA0DYHb9QaysX3K1kWdqD9eKA7XTP4DdMJKb3jtMFyt/8r5j61svWxP1CAqgtzolSD0tbdO64YcdjKp8oBYm5h97RAEYPcCMFEH7i/iMFSaBSrTlADiFDQBROK64BMEMekk+YdBzUEeAgeiDzGtrvhdkf8TdrRbxJrFjdIBA03ptG3piplMHrwLbwp6fl0Wvm6JyQq2T3k/f4zf959az1WTCyr1OmPzcVu2/GWOIekwgYZDF5tFl/10d23fL7sKa3pyC6a7f++S6L6/iAu9A3iAgvWlIaEYQu0xAGaNi/GqX1+J/zTwoAbGku2kZOV6jF0MhIWlw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(40470700004)(46966006)(36840700001)(36860700001)(8936002)(426003)(81166007)(356005)(16526019)(7696005)(5660300002)(508600001)(40460700003)(83380400001)(1076003)(186003)(86362001)(26005)(336012)(47076005)(2906002)(4326008)(8676002)(70586007)(70206006)(110136005)(316002)(36756003)(82310400005)(450100002)(6666004)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 20:35:53.8734 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d76e4f1a-35b0-4a26-7bd3-08da4fd7cf49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4005
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9143:27: warning: variable 'abo' set but not used [-Wunused-but-set-variable]

Fixes: 047de3f17a83 ("drm/amdgpu: switch DM to atomic fence helpers v2")
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 33cd7a3d4ecb..33d575bcf964 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9140,7 +9140,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
 	int planes_count = 0, vpos, hpos;
 	unsigned long flags;
-	struct amdgpu_bo *abo;
 	uint32_t target_vblank, last_flip_vblank;
 	bool vrr_active = amdgpu_dm_vrr_active(acrtc_state);
 	bool pflip_present = false;
@@ -9212,7 +9211,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			continue;
 		}
 
-		abo = gem_to_amdgpu_bo(fb->obj[0]);
 		fill_dc_plane_info_and_addr(
 			dm->adev, new_plane_state,
 			afb->tiling_flags,
-- 
2.35.3

