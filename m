Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 785124EB896
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 04:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B231510E6C6;
	Wed, 30 Mar 2022 02:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CB910E69F;
 Wed, 30 Mar 2022 02:57:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miTpEf3W+ZxAxaQb+giHcmz3vkNYevOUv0WJSa5Ds1U4iIGf/JRTF61oV+Rp/msvwngfyqJSYOE7Qc2oI+11Hv1jpHWjbxmyoKsGpe8AccKHaTWZIy0iWxfRBu9Nho8QBHVgbbaE7TL1dftCp+d7Vh9cdVVH2XkjLaWVS7qPVrEVa6zD2DZlFNat20d8xH3VoDAvv/J99/RAQAItk5VEa7uRiduA6S/aQWNcSw4z4UMKKorFZfXC0UQ2WXIdQQKhHCOgDo0J83aAbqJ9tbdQ9g0tR1wbHFFVa0ZynS1d+XmC+c8XFWYD2adOT5TGoc3btzsmp6PA/OANTMmPVd8ZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZX2QGMXn6BXRiqgP0ftviduKlC+EYYUoU6sg0QLiVyA=;
 b=Io/ZpbAXq7Z5qWmq93gkI/OBGDy/8aswC6dVpcSIATFqpaAX5V61fJ4pokPReNqE8pxAgtfSRC/ptaTUVfUqz6jG7TLEC40+Eexyq2S+CRYInmNHPbRKz4DneE0FrLQnkHshXJ7eSzH9BkDVRVj9dzDIFUvI50jI0mNKZSn0w9+O+pmYiXAjnHXdUhPnEOsyRdZIwbbRm4alQmnQTgOQ+H0C0X6Fo7meXQ5L+e0UzkPtmOIcobXn3qxXrJyDozucbXlYf+Od6E2RK6LYvcEknRANL7pVaMbGLNC423yyHFBjLc+AXDU04F6NT6nLJxdKeCSLAiNBlYH3x1AnQDrYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZX2QGMXn6BXRiqgP0ftviduKlC+EYYUoU6sg0QLiVyA=;
 b=zlKC8R7Jj8fc+voWLxfYFpEpxZ6wytZzrtppIPJxSYksJIkOZQVnAarAVt8b/dG6lRgSqHf6OMjWvX4Kd3MEChy0/ZDJQfcl/nBKXyHmnadAicuwBHVS3SbbG7Op6ivGspH1fSV90VVCEh08CLJrN81G8f3I/x/STULDgKOZdbU=
Received: from DM3PR08CA0013.namprd08.prod.outlook.com (2603:10b6:0:52::23) by
 MWHPR12MB1438.namprd12.prod.outlook.com (2603:10b6:300:14::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.16; Wed, 30 Mar 2022 02:57:39 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:52:cafe::f9) by DM3PR08CA0013.outlook.office365.com
 (2603:10b6:0:52::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 02:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Wed, 30 Mar 2022 02:57:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 29 Mar
 2022 21:57:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 29 Mar
 2022 21:57:38 -0500
Received: from Ryan-AMD.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Tue, 29 Mar 2022 21:57:33 -0500
From: Ryan Lin <tsung-hua.lin@amd.com>
To: 
Subject: [PATCH v2] drm/amdgpu: fix that issue that the number of the crtc of
 the 3250c is not correct
Date: Wed, 30 Mar 2022 10:46:43 +0800
Message-ID: <20220330024643.162230-1-tsung-hua.lin@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
References: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f523fd-7362-40ee-70dd-08da11f90d0e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1438:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB143853811BDF58202E31344DB21F9@MWHPR12MB1438.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XoC17PVGN1L17z4s1LNO19xqr0rPrPQqZveNdaFBmlFRUJR0poB9fk2wVHm0LRkrbIQP0oYo/8JsOM/46PZ4OW3chQJDgTvGyEHrHSQU2IJK+nap/ycR1lQm/KkTf1vH5kIk/pxu5LlTbg5yjKb8ITRl9LgyCw1ohKI/4DuU9m96c4rog51Ek9ahGdMXnJ6iIP/wKErrCVaCMZF9dBDrdnM9JuoQBIMSsYXivLvqqyTSc6Ry8ICFr7eRplsU4OnEG8tNqwKPiXnfagGJ7ZOGu0pmRyVDrA0nj37xG2nhB1ohvcygwHSDo87SxyFpsH4gvO3ecAsz8zGCHzyn7CqHzK4x1rBbj7OGTukeBTRQhblYsiWoq7oK0NWjquo7b4YFtyU0f5RaXrTyGBb3dgWEtotj97+Jjtg14cedX49dOC2xATM9qDHuynZai971hzdLjW9dBupqya8AnUa07Viwm0KjCMYOd+EbRCmo5KlVxBAUTHVSXfJHHlOtDZcJv4bSIwagzzFLfxfYqwLtnUp9Fg1Q2Ezt9flUihWKlkiyIZ3qPyoCe1S89cVcCZLc5T7WZ99JHJaqiaw5Tjo8QkAf8ka8LiQLFOthAkYchzX18JbU+FeFboOnY4mj077MeXGHBr7hyrZUCKX8uiurl5BTzjLquMj9tNd+krStnqrcqEO+8I+yhMjdbOTQJ4CY77JaORNwLhbVF9F10vKU+7TdtHIoH0K2tYemeIxumJTL3As=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6666004)(1076003)(8936002)(36756003)(426003)(26005)(7416002)(186003)(47076005)(2906002)(508600001)(36860700001)(336012)(316002)(70586007)(4326008)(8676002)(356005)(109986005)(5660300002)(7696005)(86362001)(83380400001)(2616005)(54906003)(70206006)(81166007)(40460700003)(82310400004)(266003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 02:57:38.8831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f523fd-7362-40ee-70dd-08da11f90d0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1438
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Drew Davenport <ddavenport@chromium.org>, Leo Li <sunpeng.li@amd.com>,
 leon.li@amd.com, dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Louis Li <ching-shih.li@amd.corp-partner.google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Ryan Lin <tsung-hua.lin@amd.com>, Mark Yacoub <markyacoub@google.com>
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

v2:
   - remove unnecessary comments and Id

Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>

---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 40c91b448f7da..455a2c45e8cda 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)
 		break;
 #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
 	case CHIP_RAVEN:
-		adev->mode_info.num_crtc = 4;
-		adev->mode_info.num_hpd = 4;
-		adev->mode_info.num_dig = 4;
+		if (adev->rev_id >= 8) {
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

