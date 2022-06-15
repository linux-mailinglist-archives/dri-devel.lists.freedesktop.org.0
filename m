Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106E54D334
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 23:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E852B1131BE;
	Wed, 15 Jun 2022 21:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167AD1131BE;
 Wed, 15 Jun 2022 21:00:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvxgz3xKLNPsXcWlDNQinBK16SwRhNnysGgVpxuF2WNdYmRWIdLvSRcBp8UotqMT+sLgi6AHxJfzJLgCTUFh+6fpA5DwyybOiB0SR9dtVc9WXpawmnqtZDmCcxbpJHI4J1HtJu/+XxwjcAutoxm6io+5tCL8lFtd21Anqmo+h49aXt1hshsrBTq1blAKRj/EU8lRMZdcCaAGWofm9gS6mIr/r56ZX0AcJEePRqrMRb/ZM9/BVOkhdg3cRaLvs8XIT4wtZJxVlSZzZf4GLp68+CINHItevDw6ZFjxNizSPuKPD5uqOPXUox/MDHHjF3IxmBHC0vxrhszGB9X+jFbE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8XV3dy68yyzitEROMGR6eoKgrR5jwiq+2S7s34vcSc=;
 b=TcKpn/L0obiNlxXFDogDHQqHOEutJESpNAE70MOMU6n0RA7kjYTFKBSI0WDetv4739vZPLFNo8fF3UgGqW7pcHY2qOLIhvYg9JhLIvIda9OXeo1o1F0dNwIA+zvhgM02vcZd/juhk5MSBYSN8bquAiaNDB3IV0EX2Apm5aFlRF2rGU7pL5ywlwPZly+6wKgq8+bCV/UETUa4fQ9EmQo73p//4rJP66JY36+C/6/jBWMdJbFX8hfGgR511MB6Vz7Yd+CaztD5YHmBsgzD6BNLluPY9MzTYlWy4gDLeDX90glJD+d68Quxk0QuhQp4UBONtP5keJSNQetZUSs1TOqLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8XV3dy68yyzitEROMGR6eoKgrR5jwiq+2S7s34vcSc=;
 b=KGMVLb71zpPXqPmvEyf+UxzKOJzLOuWtoviFAQ7BYNntUBlHH3sWUxvyJ9VlXNrBtKRgtsnvBND0gs+C6g+jMEy/3BbbsgmOqjQiMMZ403wbv8LDyQWX3m7MOr09yw6ON6BWLq5jDya9PoN7xHC1TjNKqVpM886LAvw3nQfArbU=
Received: from BN6PR17CA0015.namprd17.prod.outlook.com (2603:10b6:404:65::25)
 by CY4PR12MB1192.namprd12.prod.outlook.com (2603:10b6:903:40::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17; Wed, 15 Jun
 2022 21:00:38 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:65:cafe::a5) by BN6PR17CA0015.outlook.office365.com
 (2603:10b6:404:65::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Wed, 15 Jun 2022 21:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Wed, 15 Jun 2022 21:00:38 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 15 Jun
 2022 16:00:36 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/display: fix build when CONFIG_DEBUG_FS is not set
Date: Wed, 15 Jun 2022 17:00:19 -0400
Message-ID: <20220615210019.28943-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 685161ad-ae0a-4d59-a5dd-08da4f12197b
X-MS-TrafficTypeDiagnostic: CY4PR12MB1192:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB119228675E2A3B59DD244824F7AD9@CY4PR12MB1192.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12k32sxgV+xOTd01QLeKkdWoGKPiQISwwYGmSVthyCnrdKXWCcfZLNG6G45X4lJyOl2HIbgTrVoRe8Dv9bxkkKVeN4TlXkJtv00ieFz2hkRIyMYc16Vbf2A1xOYhy9Pi43qi0NJSOGaI30oTApbL9JisJVX5rqKLrx2Mc+5At2hDJyt1jdF8AZ1vTS+8bvyyJ5Xz3P2dfzScFr7lBS0rTE8pALlzR/rhldQz82sfBwCmGudU/dA+pyYjbJxRjr3lKGgR3R3OWpHqd5Ulp8IpLXhP6uok6pw2Ngr7h2vD827lJebtOarI1mPIczL39CXLw8pubGrCZ6uSq/xdloGqMuknES0xNSpvE2fP45lLt1FLFIBTPhI6h0oSNZFVSZhe1jzpDRQo8s3ifu7qjR3wLI/MhRwEeT2fzFsk5S9pl9lyebHSNrNOEOdXRHpqe1fDYCaSf+BNfquK2zMmUPuKyWhNUkrrmfZeLWN+D4ewLjpsfAUJz78xqaGf5J3Q+K9Wq3R+ESYaPdvQnHqKNqH6Zi435uNWSm8DQsJKJf7YskM9pAi8PsU3TORH6MZMtcKqaEYwoUMZ4Yni9O8Rm0q8/QEJozZHSjExejG7CU1uAoqbsXTnN4S1TFRrmPkiw+O0VjR9GrItLXX2f7L9YqJu6eeMapwPrXyNps1sh75cHAZQBK/+lT+IvTQ4OvWkVr8+x66o//tIHRqPfUopPaewhg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(8676002)(82310400005)(4326008)(54906003)(110136005)(5660300002)(8936002)(2616005)(508600001)(70586007)(81166007)(36860700001)(70206006)(2906002)(40460700003)(36756003)(316002)(966005)(86362001)(26005)(1076003)(186003)(336012)(16526019)(7696005)(6666004)(83380400001)(426003)(356005)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 21:00:38.1104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 685161ad-ae0a-4d59-a5dd-08da4f12197b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1192
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
Cc: Jani Nikula <jani.nikula@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_dm_crtc_late_register is only used when CONFIG_DEBUG_FS
so make it dependent on that.

Fixes: 4cd79f614b50 ("drm/amd/display: Move connector debugfs to drm")
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Tested-by: Nathan Chancellor <nathan@kernel.org> # build
Link: https://lists.freedesktop.org/archives/dri-devel/2022-June/359496.html
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c9004f7e700d..33cd7a3d4ecb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6594,12 +6594,14 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	return &state->base;
 }
 
+#ifdef CONFIG_DEBUG_FS
 static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
 {
 	crtc_debugfs_init(crtc);
 
 	return 0;
 }
+#endif
 
 static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 {
@@ -6693,7 +6695,9 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.enable_vblank = dm_enable_vblank,
 	.disable_vblank = dm_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+#if defined(CONFIG_DEBUG_FS)
 	.late_register = amdgpu_dm_crtc_late_register,
+#endif
 };
 
 static enum drm_connector_status
-- 
2.35.3

