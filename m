Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70829589C5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 16:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0907710E3FC;
	Tue, 20 Aug 2024 14:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XV3iOo1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AAD10E3E1;
 Tue, 20 Aug 2024 14:39:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yItjtBIE7S8liAEgpWcesPpEUJi1PvireTCUOTR6nPMJs1EL+lMGtll8gVBP7rkAmF/1TTn4bzM68N8Z9eyxVouqQ5Z5EXujnDrPweSS95l9vOtmvMF/1+hXiKchmnV8zRA/rYA5GTJzlh6SozhzIRLrMlWNrPvr96cf3d9pb3js0KPCY+WZQPqkGS3lUjNaP2629Qiq++1mAft/mhggFGqTJmimj3mPFKx6RB20N4qS/wdnqxKK3aw51wpPtIpilXfdjPKyQFQlx0sDnRuNPgalRzpolL5FTrK4F+xI0LI4s8WtgjmzD5Ivvu/H2OmmdEfJZrjhh7saH8NQvmg1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJebZlCAUnsP9MYbW9AG+5GLZWBkwjrqyj6iX7eyQ0M=;
 b=ilVoUAOO/shUDhhgkI28WAuyLixH70OyhWSMzBKz5kp5aFImby2n5g3IisCtsQ6K60fqhWi4loJldXe7DBGvZd0FfT5ppbsJI4KSNvCPCUQKFnrG0ClujMgf/dVEN5EPXptDqE9r1pyD59Me+pPreyeIR4HMhrYxwE3gZZ2gOroaNBZPoQOI9OpGxCSeEyC64KTh2wbIxg2os0tU6Xau8RJj9o9piMc3kbgl5JaixtXP2lpnUyl3m1SQqKI1mmfyEw5zTYrFoAMg2zMouJBPtZlODC5/gCKaO6dHBSKVFryrRXMQwixLt73oclXqhqJHNWL3DH/yaMA4kwwMT/pHOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJebZlCAUnsP9MYbW9AG+5GLZWBkwjrqyj6iX7eyQ0M=;
 b=XV3iOo1SBWIwfe+j4wV4kZl1gszOhb+gVJNMMl3ut+wfTmnkYgrxfKiYuapK6LqZAV8D2p6S6QOVM77Y4IiIfJQtK1UffalUgmU7ZzJrtqQwqanbPboGZPQyr+WuvT2EtPBzeiT9Bfjzingus68qzUZrF5d0VkT/HWSL/XDATSQ=
Received: from DM6PR08CA0058.namprd08.prod.outlook.com (2603:10b6:5:1e0::32)
 by SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 14:39:43 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::64) by DM6PR08CA0058.outlook.office365.com
 (2603:10b6:5:1e0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Tue, 20 Aug 2024 14:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 14:39:42 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 09:39:41 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: [PATCH] drm/amd/gfx11: move the gfx mutex into the caller
Date: Tue, 20 Aug 2024 10:39:09 -0400
Message-ID: <20240820143909.1933483-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|SJ0PR12MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 62964ce1-ad34-4ebd-582c-08dcc125eda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VuT9FbOIhlVzkoE9MVqR1v2iwQoUCx8eb/Ez+AwYXQSS4iUFxtp5AblwJywN?=
 =?us-ascii?Q?Ou+oZ3WfUbFi82nas0qSj2SjbCQFzIe49HZ+OL96heKYH2OkI/kecuKn4i7d?=
 =?us-ascii?Q?iGcqKatZ1zXNkapSgVXuBh9XIInMY+Vh+gbHaJXHq6vsCa8vsvA7Aq1VJS5h?=
 =?us-ascii?Q?0qye4VQvMA9Zl0+8S24D6Jkyon2CXsY6Ex6EL+KwhtwNSlHcfCCplUN0wBP/?=
 =?us-ascii?Q?6g/+fOZfUTfXwBqNyPVTeThSwLW3oK2Qz0RAk4nv+w8b4N+AaYOmKpigR+BU?=
 =?us-ascii?Q?zbnMxxtvjzCbW++dyei0QRz+xt79nRsH2T/Q20mSp7kLyIzOjThs4/TXZjxi?=
 =?us-ascii?Q?rWbXO/oFPQ9BG8TNyaqANodmX7Cscnz7AJtiOTNdkoDFtqFE51bxdGRLmEYz?=
 =?us-ascii?Q?YDCVmyzDNtUGgi6ubPd34iiTnNoxXNu89SlVvv63JHop/RYdH0xziTXp+GV+?=
 =?us-ascii?Q?NRPkztaibw1sIwJrdQJPNJ0senui6apsz+wRI93jvU6s7d/tu02N+rAQwj49?=
 =?us-ascii?Q?S7XO9giG98q83f/HujMN9IdrK9sAccDf12EqIFqcHe+OUV/E1N/iYbROJCiv?=
 =?us-ascii?Q?PnqBRIqT2h3b1F+C/zvZLpEPaAxLNrSDvlqRjb4GLnxPxNXvgFczrlD2b2Tn?=
 =?us-ascii?Q?3wH2Nl9vROqjKMN9yDbpTQZI1Hu5u7os0txpjtAI9E7eM4Xb8SEFp+hmvxVG?=
 =?us-ascii?Q?Iq6MV51QX9T80+q+qpoYk0wEmQoSrfDoSyeLgQ9oHMPEd0n4mzM+sWjrTCDB?=
 =?us-ascii?Q?YSNjU35OVj780GaDpxGqqIGwchsVs1faYdClwlQRp0KqBdHqhlyA8rxGdI16?=
 =?us-ascii?Q?3lPpWvMjBlOQR00mkvxjqPvJiiCyzq6KyenyhiWPd2mG7jLo2A7wSJ5996O0?=
 =?us-ascii?Q?oyrSCSmdDtcpjlWWamkTh/tt+VBUGTpQc+5R+uHvwsYzzs9xhLNqsc/KAs/L?=
 =?us-ascii?Q?OXB1dx1aZcIAqM4dY56vIaYGkiBXQyMjx9YaSHJebkNeYQNbCgZJ8diHcuJo?=
 =?us-ascii?Q?cRJyy3zBrvAqVROP7XrIX8eMnz313fPjvEwLKId4CKy837aGRl2NJB2jkcAS?=
 =?us-ascii?Q?GyZzIunlnu7yGYYgylA/RgLqGie3wDqS2XiP1yXcs4my6Ty5Vc+EECLLanIj?=
 =?us-ascii?Q?jFMUJJkL/AKO8ZujlcgdQJpYSEeeaSBSwOzbrJb0CBsDl/RY6sRol8sP2M/s?=
 =?us-ascii?Q?8ym+ThBu+N3g88R4+//qL4Apa1vS3g6+5eyAN7UPd5430hCpIv8LKFwqPym4?=
 =?us-ascii?Q?rM8ruH7M0/c2mIxZ8RBtCuzEc07v6Df5TiOaxU016wZrwB2eeKiAnBRTUHWT?=
 =?us-ascii?Q?rG5bb/4qEiAmbHz8ffou+lchXUbEpLDh630NB6Yai8S/etKkgerePpBJJLGG?=
 =?us-ascii?Q?qT3DAkjXEKvcoCrVmRBG9a+QW8MPlzYWzXrOtoTNoqwQcp7FIz4BWdaSuoCz?=
 =?us-ascii?Q?yHW+bxBT8kBt3ePYDNXj0fhGNQjo56T4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 14:39:42.4013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62964ce1-ad34-4ebd-582c-08dcc125eda8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781
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

Otherwise we can fail to drop the software mutex when
we fail to take the hardware mutex.

Fixes: 76acba7b7f12 ("drm/amdgpu/gfx11: add a mutex for the gfx semaphore")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 5704ad25a49d6..aa7fdece8ad42 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -4747,8 +4747,6 @@ int gfx_v11_0_request_gfx_index_mutex(struct amdgpu_device *adev,
 {
 	u32 i, tmp, val;
 
-	if (req)
-		mutex_lock(&adev->gfx.reset_sem_mutex);
 	for (i = 0; i < adev->usec_timeout; i++) {
 		/* Request with MeId=2, PipeId=0 */
 		tmp = REG_SET_FIELD(0, CP_GFX_INDEX_MUTEX, REQUEST, req);
@@ -4769,8 +4767,6 @@ int gfx_v11_0_request_gfx_index_mutex(struct amdgpu_device *adev,
 		}
 		udelay(1);
 	}
-	if (!req)
-		mutex_unlock(&adev->gfx.reset_sem_mutex);
 
 	if (i >= adev->usec_timeout)
 		return -EINVAL;
@@ -4818,8 +4814,10 @@ static int gfx_v11_0_soft_reset(void *handle)
 	mutex_unlock(&adev->srbm_mutex);
 
 	/* Try to acquire the gfx mutex before access to CP_VMID_RESET */
+	mutex_lock(&adev->gfx.reset_sem_mutex);
 	r = gfx_v11_0_request_gfx_index_mutex(adev, true);
 	if (r) {
+		mutex_unlock(&adev->gfx.reset_sem_mutex);
 		DRM_ERROR("Failed to acquire the gfx mutex during soft reset\n");
 		return r;
 	}
@@ -4834,6 +4832,7 @@ static int gfx_v11_0_soft_reset(void *handle)
 
 	/* release the gfx mutex */
 	r = gfx_v11_0_request_gfx_index_mutex(adev, false);
+	mutex_unlock(&adev->gfx.reset_sem_mutex);
 	if (r) {
 		DRM_ERROR("Failed to release the gfx mutex during soft reset\n");
 		return r;
-- 
2.46.0

