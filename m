Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E512BB06F6C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1055910E654;
	Wed, 16 Jul 2025 07:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bK4rpo8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DE410E25F;
 Wed, 16 Jul 2025 07:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDu5nCyau3HE61qkRFWmRC7dxd3sPseJvtRo1fxrRuuKYFXW6iA1QPa0ew0+TLbiMfX0JoymTvQMx0Y09o0E5Y/tFMlXzV01ursdi0RmTu9A9QP5spKKdFrSVH4DeY5skeOuf7dKfLDVAZDyCS6BSZ/XHa7Ki6HJz8T50yIiPxwQ7GgKgJ7zH6dc+dna8mQvqLsn5efXYCBc7mA/mQsDy61rjv1TCVFfZkpGjAcXQYZvl94l1vqxLDsiElQ5TA7wkENF0Sn0sD+l3wi/Mv68ODQkCfOJXBeOkMXCfO02cKyJiKkr8DsDlVVKAH8ijnbrfXc0QCxPwhwO3SGKmKcqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4q4Jb1J2xrQiYEtid+uZOal9aZZkq1osrHwwjLgLTg=;
 b=nbsj8fONnPmmaCLiWjrSypNU78uSrkve3WhXjrQdLoxCfR2h79GLKL7kr4KX68sdwU7fhTj5n8D/d+DUWP3mVqilL6rUaaUuDwbr2ny6i70WyDzhZJsOPO6uWsuPSGazusVZ+//EctZn8naPYxGEs19NjwmjafrCYyda7fKF9tKmW+rUUgLOYTfVpKdAyqj+6XSOinNlohlKJHu8S+rI8jEY+XPPaYRoCCpJ/OfRA6pGS94e5Y47GxybrW2PfnOKo6nbPM7wzR5hYFlWqjq9X15h0epNgNid7RFbTtgItB5vtIbD8m2zEZLtnClgoaFN8zLDjSjFuFMx+IVKUEq+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4q4Jb1J2xrQiYEtid+uZOal9aZZkq1osrHwwjLgLTg=;
 b=bK4rpo8ryPB7IT/S3XBvUlnZZ+kiWXZHTrYQRfetgDoeq6QcXf1T+kuEOe12ZA362WH3VznVtk+TIrasUK0HbSLd5fyPBYgyYKyMO9UrmqqjsykkRc5udPY3s0PdbLPrE6a9uhJY2zSbiFPlz9jzLdmfKwQH8zPits+B0j1r9S0=
Received: from MW4PR03CA0157.namprd03.prod.outlook.com (2603:10b6:303:8d::12)
 by LV3PR12MB9257.namprd12.prod.outlook.com (2603:10b6:408:1b7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 16 Jul
 2025 07:51:43 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:303:8d:cafe::9) by MW4PR03CA0157.outlook.office365.com
 (2603:10b6:303:8d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Wed,
 16 Jul 2025 07:51:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 07:51:42 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Jul 2025 02:51:40 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v5 1/3] drm/amdgpu: Add WARN_ON to the resource clear function
Date: Wed, 16 Jul 2025 13:21:23 +0530
Message-ID: <20250716075125.240637-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|LV3PR12MB9257:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f07ece-4a1f-4f1f-aed6-08ddc43d9afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUd6aTBvNG1BU1kwcjJ6cVFoeUxJZ05RcGdIRTgrY3VuR0FqNmVNbDNpcjVz?=
 =?utf-8?B?cHY4MzgwU25lbUwvVlJ1UnYzbjF0MDhYU0ZFVnJtdXZxVGJuOUs2MGlmVTNE?=
 =?utf-8?B?R2x5eFBmbVBBV3JxSHZNZ0E2YTk5ZHF1NWE2R3h5c2JoWkFvMi9pcHF5SGdB?=
 =?utf-8?B?by9LT29IVk96WjJnTjU5bkl2RWsySnAwTVAvemV4eDkwMk5WZGRqQ1Y3ZUxD?=
 =?utf-8?B?dVVrYUEzRDY4cmxIVG13c01uUHVrSHpFNzIvNGtmZ3lwR1p2R09zT2N3L3pN?=
 =?utf-8?B?ajhaOEMvVnhmc21xUFRPRzlpbHRCR1lib2kvU3VuaG53K0NMaUhWODd3TStO?=
 =?utf-8?B?UWd2dklxUFJQWEZjTHZIR2hLWjFlR3dYYWNFdEVqV2VodGpSSFA5WXBmNytB?=
 =?utf-8?B?T0UrdGJFeFRGSm1MYTFqZlhUUjNScVN0R25tN2tVSzE4Z1JqR3F3RlpmT29L?=
 =?utf-8?B?b2gzc0VQVFQ2OXBOdVRuNTJmSzJ0VjR1cjZXa1FtdkRuWFZ3MzNpSE1IdUIx?=
 =?utf-8?B?bEdaUXlidlVWNU1WUVE5enFZdzBZVWF1ZkVva0h1NFMwcy8zUWhndEoxeVVw?=
 =?utf-8?B?dEU0enFqNkwwMzM0TEE3UjNqYm0yenBjdDgwNytjakd5V3BlZzlHeVo2SUJo?=
 =?utf-8?B?bms1akkyMDZKUzVMOHZQNWVtV3l4TllDWHZCNzZGTENXbG5OdTE4RG9LZThX?=
 =?utf-8?B?azVhZkN2d2NEa2pvbktKR2YvUVZRYWZQSHNXRi9JalJtNDNCRTF0L1Rucm5n?=
 =?utf-8?B?UER3dVZvNytGbHBuOGM3by9TR0FGVkxrNVIvWUVoeDQ5c3hNQm1nS3VjeVY5?=
 =?utf-8?B?SnJ6RmFEVnlTSGJ3NnJNSkdqU1cyQ0JzZnpicGJqcDVqend3c0gyRkFlRVZz?=
 =?utf-8?B?NFJOdWFBK0ZnUkUzeEZ2Z2UwNm1WK2tWUlYwcFRVbUdRSGl5d2hRYWgvV3Z4?=
 =?utf-8?B?R0NZKzNlUVMySWV5bHhGUHZTcG1yWEtHNWdLWWh1ejI5VXZnZnBjYTdRV2RL?=
 =?utf-8?B?UlpacjNtVFRKVFg1dkthUm1Wc3RicmZ4aEtCVEFRWHJmeG9EYThjaWFKS3ZT?=
 =?utf-8?B?TXpnUWkvWGtld0k5aHphTzFua1FsbGNselQ1eUNBbHYzL1N3MFNLOUtaYWFU?=
 =?utf-8?B?STBSNEhZcDhCNzM5MlBDRXhSNHdhWTBFZU9FaVhtNkJDTEF4cm1SZ0RGSnlT?=
 =?utf-8?B?UnY1d0dVbEVQa3hYMmdpV0pQZWVSM3JmL0pyNDM2ZFoybWdDaFliZzkyTDc3?=
 =?utf-8?B?ZzZRajR4M0tuRHU0OUEvODJKdnRybER5RDZIZTREY2ZaeVppTE5EZzZLUVUv?=
 =?utf-8?B?Qjc5SDM4d3p0YkdaODBEUE81dUdXUWdoTithOVY0R0FOT01IUEwwNEU3R3Rz?=
 =?utf-8?B?SDkzbzZCeHFVbW1GR1hPMElmb0YzNm1pWkZldHR1Wk9YanZmRWZQRFZ2eUlB?=
 =?utf-8?B?eUhJeE12aHlXdWlLaDJXMzRuaUtDQWNwM3FJYkZlSFo3VjdRU3Vta2ExSWkv?=
 =?utf-8?B?eEpzOTFEa1pJenlMOXUrakNFUkdZdDlmSHpJdXBiWUttK2dKQjl1ZnJsTmha?=
 =?utf-8?B?OU9JYlBwUkxsR1VGMHlPQkFrTGZPOFVFMWdBZGZnWUdOdTh4anI3RVFDZDNQ?=
 =?utf-8?B?UFBlcFhNSUxrUkp1UnBzVitxUEhwWU5nSnpLbm5CQlNaY044bUlVOFVSSmZI?=
 =?utf-8?B?SFVSYnBDR0JrOWVtRXZ1Y1U3TVcyODZLWksrdEg5c0ZxUjUzM0l6Q3I1UVd3?=
 =?utf-8?B?OVRRU01HRzdrTVkrbWdqcmZSVFMvQ1hZSE53Zm9jWWFNU0t4YTlUclpPcEFJ?=
 =?utf-8?B?bFlSaU45Tk9hSjd2V1FuT0xCYXptdmdnSTNoMEpENlRiMGo3RXF4WTdoWDg4?=
 =?utf-8?B?M0h1QzNIZFhLNE14UEozMmpreTZ1cSthT25CbHNrVVhoMWtPeThyazFpZitn?=
 =?utf-8?B?ekQ2OGd4SEx4UlVrR1pybUMyTERSU2MycEFaS1ZodlViTHdKa2hBUzBnUVdy?=
 =?utf-8?B?V1ZJVHA4NExidjQ5djRFQ3BzNURHTGNHSjJ1My9GbG96M253cGw1Y1hoSlg5?=
 =?utf-8?Q?ZDyn9A?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 07:51:42.7299 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f07ece-4a1f-4f1f-aed6-08ddc43d9afa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9257
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

Set the dirty bit when the memory resource is not cleared
during BO release.

v2(Christian):
  - Drop the cleared flag set to false.
  - Improve the amdgpu_vram_mgr_set_clear_state() function.

v3:
  - Add back the resource clear flag set function call after
    being wiped during eviction (Christian).
  - Modified the patch subject name.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index b256cbc2bc27..2c88d5fd87da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -66,7 +66,10 @@ to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
 
 static inline void amdgpu_vram_mgr_set_cleared(struct ttm_resource *res)
 {
-	to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
+	struct amdgpu_vram_mgr_resource *ares = to_amdgpu_vram_mgr_resource(res);
+
+	WARN_ON(ares->flags & DRM_BUDDY_CLEARED);
+	ares->flags |= DRM_BUDDY_CLEARED;
 }
 
 #endif
-- 
2.43.0

