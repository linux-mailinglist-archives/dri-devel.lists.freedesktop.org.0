Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E365B49DC4F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D0410E750;
	Thu, 27 Jan 2022 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1BD10E7F4;
 Thu, 27 Jan 2022 08:12:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQw+C4WH3y3ETdHNGwbJOiWTaV3p6YaiOjH9kMEKJnAW0lFDcg2fkiuaCiIYtl7KUBB2cW3qRzSIRGoidRhCyq8woD2i6xuubT8yqE1P8P0CYW7y/8vkkT+pg8hzRyNOHj1YjF8bCuImcQZNOnDMW0AElAGlMfbyNxps3pjYTl9lalnoBMy14QXr/ZxF09w3Fg/cEUUAfcX5Xf/BdfulAmNlDzLt42eCGFlhUzXS8tk2KrBQva+q2AV7X1yWe1gjPpRVlBPo4Dq0Z/SDnSJ8htZ8JEQZx/CIC9/257B/7ZDHrkpPcO2/vuWpJOhfazzEBnIfo1ehgNO5p8oPpL17+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh9TCz3iFOh/ApI0XX1g+ZZmNLLLQ+GbZ9QKhmiw+bg=;
 b=LA7SJq/AjIiIg/WiXHbXsWgn2GHvqg02IIKAxbq3/pGNeumYD7eUZ1UTrkro9W+WJCvhXg0ReUIFlCGgqG1XYuvbT0CiJipbduDycqhHpibmdqpSFYRODnRLUQo/343SfUpuAN4bAh2RCHGqU50gZeAntky+YL33bRf9C1YuEzPXbqLXnFAI7eBXlOprOWFaU3vOe++Z/i+De8AniB6hTFp8W1s+fR1Cend+SiOz8haGqlkZ16WMwwQo3REIbB0CaRINHmNkQOIguu47FRufaSIJ2t7+sBW2qLO7R+MiiPn3+8bC6HR6/ZaTC4rjjzB/8AWW2wdY7Q/h0kpmieCMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh9TCz3iFOh/ApI0XX1g+ZZmNLLLQ+GbZ9QKhmiw+bg=;
 b=bmaIFX91iV9zTX9uDKhHnY/LiG+36ITxuKAvXmY/MV8VvWihdcUcii2JcvPdN7e56pHTOT9dw5bI7VSCfJgaDMowswJMp1UxdQ6lPGkmePyCPMkRNeTqfRBTXSZ/XrWJR3lfYV8PAyk/WoQzIClUkwiWt0nX/2ZHFStTnykP6OE=
Received: from DS7PR03CA0347.namprd03.prod.outlook.com (2603:10b6:8:55::6) by
 MN2PR12MB3376.namprd12.prod.outlook.com (2603:10b6:208:c2::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 08:12:28 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::c1) by DS7PR03CA0347.outlook.office365.com
 (2603:10b6:8:55::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 08:12:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 08:12:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 27 Jan
 2022 02:12:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 27 Jan
 2022 00:12:26 -0800
Received: from tsunglin-chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 27 Jan 2022 02:12:21 -0600
From: RyanLin <Tsung-Hua.Lin@amd.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <seanpaul@chromium.org>, <bas@basnieuwenhuizen.nl>,
 <nicholas.kazlauskas@amd.com>, <sashal@kernel.org>, <markyacoub@google.com>,
 <victorchengchi.lu@amd.com>, <ching-shih.li@amd.corp-partner.google.com>,
 <Rodrigo.Siqueira@amd.com>, <ddavenport@chromium.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amdgpu: fix that issue that the number of the crtc of the
 3250c is not correct
Date: Thu, 27 Jan 2022 16:12:37 +0800
Message-ID: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 357192b1-04d4-465d-d038-08d9e16cc1dd
X-MS-TrafficTypeDiagnostic: MN2PR12MB3376:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB337630A79EBD801964351B8AB2219@MN2PR12MB3376.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g98iE5nMf/xkIttcupMHt6o1vwQ0qqFq8H5mPAlSOSCs6UxlVjg3XJ2PMTX02fpeWWWBDOORPcEkZ8PDxny1Jl3u3pkw4c7iKUA3GVCs5AUu6Z237oGOCz7M3qYg7VTEnZOZg9ypFi+nDfvY8SRz6XYe3ZtVwHRF4VQtLZmh7PthwAeVj0L7+WqAmkVu/cCdFPtZep77vf3RAh5aLh+MbY9Ks5J1GuIidQQoXo8NNz3l3kS2D8tNW/aH/9sKWrT4tn7GDiEwMQxDis1nDgktOxN1GiPpQqoG8eIVrOAGxTCkFnNQygkFBEBxEptYhw/Ni2nhV57KiAHraY0EbSZsaPaOrQ62n4CGqdWmqypvwbdK/YGwYsd8xCySkxx7iFe1sWUHCdRHoaMDEmfDpFHNtQYb/w2PSAUWlNdZXySFW0FxSztYsSOQDZzaRNLcmHS76V0Rgx3r/QwYREZ8hvgC5Eu6gIl5IfjvEatHIVeAUAFC4fLMDIW8HEQrZlSg7Y5/lsZHBxaedK1MrzoiPGVntoGi/hCXHWLzIS93HqqY2nHYm10ueQ6WuNuWYUvBlEMT5DrftsL1ERA8+yzRIq536sX4hcQPy7BRGw6qkFbXnTyfDpj2lN9wJji/hKzOGh/eq30r4uQOXfOUSAQBJ8uKvnKgRzswNsbtCJk9N/yOhX5bGBkIo+TLSfVFpQAaOymcgA5Ch8x0N41I2KfEvXdtbOn/yY9Oo8eTXNnJcJHO150=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(36756003)(508600001)(2906002)(921005)(2616005)(110136005)(47076005)(81166007)(356005)(82310400004)(8936002)(8676002)(4326008)(336012)(426003)(316002)(70206006)(70586007)(83380400001)(1076003)(86362001)(26005)(6666004)(186003)(7696005)(7416002)(40460700003)(5660300002)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:12:27.3799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 357192b1-04d4-465d-d038-08d9e16cc1dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3376
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
Cc: RyanLin <Tsung-Hua.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
External displays take priority over internal display when there are fewer 
display controllers than displays.

[How]
The root cause is because of that number of the crtc is not correct.
The number of the crtc on the 3250c is 3, but on the 3500c is 4.
On the source code, we can see that number of the crtc has been fixed at 4.
Needs to set the num_crtc to 3 for 3250c platform.

Signed-off-by: RyanLin <Tsung-Hua.Lin@amd.com>
Change-Id: I837df7101cc4849d2c3021fd529b4061edab4bb1
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 40c91b448f7d..dbeef7b57a9b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)
 		break;
 #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
 	case CHIP_RAVEN:
-		adev->mode_info.num_crtc = 4;
-		adev->mode_info.num_hpd = 4;
-		adev->mode_info.num_dig = 4;
+		if (adev->rev_id >= 8) { //chip_name = "raven2";
+			adev->mode_info.num_crtc = 3;
+			adev->mode_info.num_hpd = 3;
+			adev->mode_info.num_dig = 3;
+		} else {
+			adev->mode_info.num_crtc = 4;
+			adev->mode_info.num_hpd = 4;
+			adev->mode_info.num_dig = 4;
+		}
 		break;
 #endif
 #if defined(CONFIG_DRM_AMD_DC_DCN2_0)
-- 
2.25.1

