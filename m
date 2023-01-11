Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F57E66629D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 19:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2365110E031;
	Wed, 11 Jan 2023 18:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAF710E031;
 Wed, 11 Jan 2023 18:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/ysFQ1fld7rsQtANygzZi0E8HGLV82eE1cQ2a8whEQdGGFqv9bo6LH4IdZ6/jdtAlo08cVqnZoErPdUxCeVh1KW76CpYA7zgptYFbsIlf6OIfeUZn6/M/QjtXQw/ybGRrPlIn9vaPtLJkmoD1iKvvF/bpkEj00vvooWDPy1I26n5A0n2icGUm6QQoxXoMiC89yZISyAFGIvMjFA6azqEhvrMOPSxVs/sp5XaX8wh2JZQgEcL2zNoA4IHPhFORv8AASMgRwMdQFqNGz0kEuML1J/F+xr5OMjBkc8Sn1P12lkoHWmHPdxVYvdXa32uiyO8IUqrfBZxJg4ufPRG7kQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jz1SD9FAVBusK61stxg6P0Q2X0HsS0WZuUbXpxWa4ds=;
 b=VN+jQjIGscXVw/tik85Q9PkWE0fXgmvr9+Mn4miFh3ZR07VSqiZOOfZ2M8PVflTIbvXbQ2uOt2bBPebKdpzCJ/5L/zvcWXXa3QwMsk3JqVVbxFD15kdwbPQqR9TBfdAavANqddTVTaqYhRlckwWSmCRdP+++PtnJEiCRuN+yX3yKz7Zgb6URFM6nGGbiKRC7yUkqTpXlFqKdAHDI7zsMIxRvefBfYGftBUmEq+87oeY4SgryADl+sfh21XtoM5wsr0paLlu//40GeBp424A7gEG0fEmsH15/JadkRHYUcTUIfmqyR3+zTGRQLuqPxnSjPzjFO5hkCTGvmDzVmAkIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jz1SD9FAVBusK61stxg6P0Q2X0HsS0WZuUbXpxWa4ds=;
 b=eph+/68fp0hpSOqD6WUBSYPz6yDnU1wdfn70pqX9O0OdAdCM8D8HEs/i02ZlIHyje5ahc1kdo8lkEzGhHG71aH2zx/tvr39N8VkRzVhJO/xkLcEfX6lM9+P0/nqqsNsewyEyzBQdlhSejwG69pYdV0lgKt6fx7JenzJ2GA2mrEw=
Received: from DM6PR02CA0130.namprd02.prod.outlook.com (2603:10b6:5:1b4::32)
 by DM4PR12MB5913.namprd12.prod.outlook.com (2603:10b6:8:66::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 18:17:09 +0000
Received: from DS1PEPF0000E638.namprd02.prod.outlook.com
 (2603:10b6:5:1b4:cafe::88) by DM6PR02CA0130.outlook.office365.com
 (2603:10b6:5:1b4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 18:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E638.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Wed, 11 Jan 2023 18:17:08 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 12:17:06 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: fix possible buffer overflow relating to
 secure display
Date: Wed, 11 Jan 2023 13:16:50 -0500
Message-ID: <20230111181652.158060-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E638:EE_|DM4PR12MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b09087-9a1a-41a3-f726-08daf4000d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JSu6qe4MM440xMuoo6oIAvFOzt8UKrxQbmsfPzNWwySnIVNtwGdcVYcd6tj47ySrJdYCghLU0Lmk/Gaw+hhSm5OKf9JPvaFmB8c1nLQA24MrbFpx9GTM6rzwfdb/UeXbr29pjYVpH6hJnqRBT5kKqh6PzVYoSdkOnWrm1GqUwVNAfWPn7ZJKW6rcUWEB+UGkSm3QFzVIMh4hb1FRsc/7hcNnHLH41B6gaX8PZBXFVWEd9cEgB88m/y8V0+wbEGoQOZC7bjuzH7AlCEkaUdUOYcfKfdM2YyfV/Ps1OAXWLaS1iQO7j0Fg5by+G0PruVFfQcJAPwrcKj1iSl34tNTqGpI4bnYqxJUd69l4oyAF5LyTB+oRUSboie2vaDHCam2sQwzjTJUsbvqsSN8lgG+pPKfFwKWEkT53pU0XNhalAEczygxJHCfcw/VJqS/Khru2Su5luLQVbjldP4ASJsRPXkYElumuOfdDUPf0sGf22B6i0Itl37dCRahlyEXY3l8U3iwq2tXqch8DZnUXJjkXfcvs5OvfUnHZL5w2PKwwJXuhndgdAK0vgWc/zgJHuylm1WCI34GswviV6MVdNWgE0xqJgQNKp7xiIPErcTb5XZ9OnS+VaqeqfUrthm9NNNNRztWneL3EJjOqlaLfBAKCIpbOEUyOWZgdKIg6yT83WoMkObTMbaETLb4YFs+oHUR3Zz616BSP3uEWohIP8G+J2+CotW1iQ+yxT8+EMcmigIZMgGItY+orPRYDjzob0NuOks4TNnvNhFI+iJvcVMzrNQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(16526019)(316002)(40480700001)(186003)(26005)(5660300002)(44832011)(1076003)(478600001)(2616005)(41300700001)(426003)(47076005)(70206006)(4326008)(54906003)(8676002)(6916009)(70586007)(336012)(82310400005)(83380400001)(8936002)(40460700003)(86362001)(36756003)(6666004)(36860700001)(82740400003)(356005)(2906002)(81166007)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 18:17:08.9731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b09087-9a1a-41a3-f726-08daf4000d89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E638.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5913
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, dri-devel@lists.freedesktop.org,
 Aaron Liu <aaron.liu@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jasdeep Dhillon <jdhillon@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is possible that adev->dm.dc->caps.max_links is greater than
AMDGPU_MAX_CRTCS. So, to not potentially access unallocated memory use
adev->mode_info.num_crtc to do the bounds check instead of
adev->dm.dc->caps.max_links.

Fixes: 278b2b5ba2f2 ("drm/amd/display: Implement multiple secure display")
Fixes: 65a2fbe75cd5 ("drm/amd/display: Fix when disabling secure_display")
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b4d60eedbcbf..86a268cc4b21 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1742,7 +1742,7 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 	if (adev->dm.secure_display_ctxs) {
-		for (i = 0; i < adev->dm.dc->caps.max_links; i++) {
+		for (i = 0; i < adev->mode_info.num_crtc; i++) {
 			if (adev->dm.secure_display_ctxs[i].crtc) {
 				flush_work(&adev->dm.secure_display_ctxs[i].notify_ta_work);
 				flush_work(&adev->dm.secure_display_ctxs[i].forward_roi_work);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 8841c447d0e2..8873ecada27c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -223,7 +223,7 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 		/* Disable secure_display if it was enabled */
 		if (!enable) {
-			for (i = 0; i < adev->dm.dc->caps.max_links; i++) {
+			for (i = 0; i < adev->mode_info.num_crtc; i++) {
 				if (adev->dm.secure_display_ctxs[i].crtc == crtc) {
 					/* stop ROI update on this crtc */
 					flush_work(&adev->dm.secure_display_ctxs[i].notify_ta_work);
@@ -544,12 +544,14 @@ amdgpu_dm_crtc_secure_display_create_contexts(struct amdgpu_device *adev)
 	struct secure_display_context *secure_display_ctxs = NULL;
 	int i;
 
-	secure_display_ctxs = kcalloc(AMDGPU_MAX_CRTCS, sizeof(struct secure_display_context), GFP_KERNEL);
+	secure_display_ctxs = kcalloc(adev->mode_info.num_crtc,
+				      sizeof(struct secure_display_context),
+				      GFP_KERNEL);
 
 	if (!secure_display_ctxs)
 		return NULL;
 
-	for (i = 0; i < adev->dm.dc->caps.max_links; i++) {
+	for (i = 0; i < adev->mode_info.num_crtc; i++) {
 		INIT_WORK(&secure_display_ctxs[i].forward_roi_work, amdgpu_dm_forward_crc_window);
 		INIT_WORK(&secure_display_ctxs[i].notify_ta_work, amdgpu_dm_crtc_notify_ta_to_read);
 		secure_display_ctxs[i].crtc = &adev->mode_info.crtcs[i]->base;
-- 
2.38.1

