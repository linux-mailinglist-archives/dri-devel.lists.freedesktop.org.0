Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F116DB06F34
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5966D10E69E;
	Wed, 16 Jul 2025 07:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HatDmnaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7C710E658;
 Wed, 16 Jul 2025 07:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD2Wt9KsD5RI+mYrHLfJAy9xKNqIqwSYn6h+SBAWL+vI4qQeSQdC8MYF6/PrOXNusZLAF5PLcG/MY+uI2XI0L3TrihDx7sWdPffjuPWgW7oKT14hCFliPaCk35vryyYpVqtH5iqZ5d0TOkk0uijLD6hPAF/C1K7z5QlghfkjGVGZGBpdeF2cFDdJX7fYveybyUJJS8pODYCfoGNblxN4x5cE8sPTwz+0hEqhA3gV3U8ObftR53JjCjjFgU2pgUBWLQasL6ggXrgFHVzXlYhEIfJ/LJd0Bl1c/NIP4XWYRCNVdCLAiDZ2lqX3TaTidlqBDLlNA+nJKrbejhAIz07R2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4q4Jb1J2xrQiYEtid+uZOal9aZZkq1osrHwwjLgLTg=;
 b=VcNDQBiaH1xELocGBtty5l++He/OinWC77PORIUjTDZF2ehxrg60l4FXbhlJ4yfmFSmCKyTU7uCLT5wb2QGSsJi2JyIcgDVQzWp8x0HtwKbGqEEkSO6+ytdGfHbPxgmIFH9b48pPlMWQDHKfqpk43dypsSa5cn9p/idXq8vVxuQV917r4vI4UGq+gN1hfVZTt4MFjiYCqnWbld4SFnLxu3nG7CUdyCRT2NhWXj7vNF5i/+rsPsuhUzd5uZuJH+QkQGLZ25Y+x2kHPKVdgouv4fWZv8gq2B4+MgVGNlu+E0zTZFrcpzgjGGaEJ1on+6ioPKaa04bTVceehB+EeHPbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4q4Jb1J2xrQiYEtid+uZOal9aZZkq1osrHwwjLgLTg=;
 b=HatDmnaTZEX1FT7679VgEJAFlFS9UNsWIFIaCswJ9oltHKMOoJvHmVvkB7Vqnp3dEfpSvl7pyvFwRYMYV5TJzqreY09QyJnpNJq5UimoUubxsaYAyLRoNMjePOq5Q7X7GJdvNNwVK9qfJkbHD/HrV7CQ6ZyNgQrrL1HX3/FPs9c=
Received: from BYAPR06CA0014.namprd06.prod.outlook.com (2603:10b6:a03:d4::27)
 by LV3PR12MB9144.namprd12.prod.outlook.com (2603:10b6:408:19d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 07:41:48 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::1d) by BYAPR06CA0014.outlook.office365.com
 (2603:10b6:a03:d4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 07:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 07:41:48 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Jul 2025 02:41:45 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v4 1/3] drm/amdgpu: Add WARN_ON to the resource clear function
Date: Wed, 16 Jul 2025 13:11:25 +0530
Message-ID: <20250716074127.240091-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|LV3PR12MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: b2cb083a-3d77-4f91-5c77-08ddc43c3880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Umg0emwzUnk1ZlJjd0Z3cmJzUkRaME80S3pRMFlBQVpLM3Q1UlFZY0FKSWZ2?=
 =?utf-8?B?Z2NST2FKc2p3THRVRFJPNmp1WSs4ZlBDcy9iWS9TVXlCbDU4ZlBsL2NpcTM3?=
 =?utf-8?B?MzY4ZHl5ZGloaCt3QjlTS0F5ZTN1SFdyUW1jck80MjgremVmSWgrOGV1Z1FR?=
 =?utf-8?B?YmZJTzZ2STFDRGZqeDRzamtJSm5UanowblY1TkV6ampTZHNLTjA3bkJtSWhX?=
 =?utf-8?B?K1VnYXZtTGltdHcrNElNNUhNSG11aHc5QkRIdDZKdEtxWlVCVU0zKzFuMnFo?=
 =?utf-8?B?SVR0ODZjRmEyUSt6ZVVzQmxmNUN4VUQyU01ZZ1Y0QUtncUtMQXZ1L0FMM0JE?=
 =?utf-8?B?dHEwY2VFSWRmV2NZMDNXZUhDK09tZ0lSd3h5OFFwMFgxUWpGLy9IOVZtZ3I2?=
 =?utf-8?B?RjFTU0lMNU1VdWkxKzRublpnbEEraUtWWDRpSU1QdU9JNEZjOWlpUmRqZFJ3?=
 =?utf-8?B?SE81NWs1RmNKQWxhMHlLZVZVZ3BNd1l2Q1BRd1JFL2FlN3ZuM1RWSStjK0lH?=
 =?utf-8?B?bjB3UFNkd1Z5UllpQTZvSUZFZmt2QzBRdEhQTjVjZm1tWUtPckpjMHNmbW9y?=
 =?utf-8?B?QVE5ZXVEd3NHcmRaNWFKLzgxdGZ2YzlBU21TbmNFOFJXNCt3ZFdaSld0MmFR?=
 =?utf-8?B?ZzFkTi9VeFVCT0lTRVBYWW5MTThBZ2E2aGpCL3J5VGROTlN3NjNrM1BGdUZS?=
 =?utf-8?B?cDI1dGo5VnVGcFl1WDZWNXlYa1VwNjJiclF2Q2dxaC9VUlBLdmN5bEJVL1hl?=
 =?utf-8?B?TjN3cmtMWnRUbzQzaE1KeGtPVVN0SnVSdG1FaUhacW5uWVpES2hOaUJ3TEZV?=
 =?utf-8?B?MTFOQ0orNWp0UE8vK1ZZVkNITS83Y1NpRTVwSHNXVmJkLytRZThhdWxvbVYy?=
 =?utf-8?B?Z05PQ3B2dGNYOXEvakQvTWZnUjlpc0g2dENOaWlFRWtzaG01d050RXhmQzdm?=
 =?utf-8?B?Z09XSnppK00rWUJwZjR5VmF5R09iUFFna04zdlkrbHB1am4zSUdUMG1uVHEx?=
 =?utf-8?B?VHJYOWZNNGNlakZGVUE3K3BFUk5rVDhnaGR0WkpJTWEyaTZURU4zTUYyOUVh?=
 =?utf-8?B?d3dnNXNCVFFhSXhxR0pLdkEzZ3k2UmZjWWZxbDJjRCtyM2c1U1lJbmxTMENt?=
 =?utf-8?B?QmtDd1NtWDBHRll3YW1PQjRsT25MNVRkUlNvVjRUL092Um1TcHNuYUY5ZS9B?=
 =?utf-8?B?TzhNdEVNRnhrdTFjU1d1R2VaRWF5b05UZGgxWFFOSUs0RWpUNzJNM0VXNFRp?=
 =?utf-8?B?KytiTjk5MU41SmtmbW1yUG1HYzBMeVlpWlB0NWZNMTRuNjkzY2FaSis1Z3dI?=
 =?utf-8?B?V1lwa3FWMWVYdXdBK2h6L1JOUjlVaFl4WlJBa1pMUDdFYUQ1U0R3OEY0Q2du?=
 =?utf-8?B?VUVsbHpRM3R5NHNOaGN6Y3hmeFVpcjJidGtJVUdZZ0JBekpWeUZwMmcxdGI2?=
 =?utf-8?B?V0p6WW03OWhQKzBIeDNoUzZUOXcrTTd3dnBpakNvaDhhTkVBd3pzbHpBa0dP?=
 =?utf-8?B?UXFmRGpQN0FZZWxYQjRJSzAyVHBXbERLSG5VYnFIbzZvZzB5SWxzeGNVY0p0?=
 =?utf-8?B?TlJER1B4NlFvb2lYYnI0THlvT01zcW5uWjFnSkFTNVRTd2c4Yjh2OVM2NkNX?=
 =?utf-8?B?QnRqNWFrQTZLdXcrR3Y1Tlg5ZTJ0b3QrbVF1U3J0M2pHYWVwRHB5WHE0amlp?=
 =?utf-8?B?QVZCYnNzL2k4VW1VZHpIdGhLVlVwdmJjdnBnYXZwM21zUWNiMlFoUGVMRGs2?=
 =?utf-8?B?aTcvcmw2OG5qaW8xN25VUGFkVVJkOTN1bDJjaDRudThEaVNVM3J5aUpBWW1h?=
 =?utf-8?B?Ykx5V2taQVk2R0RkRVZCVFEwRE53WGU1VGNWb3cxVkREcU5pSjdOaVc5OXlE?=
 =?utf-8?B?d0MzL3kwdmNNa0dIWndpMGFtT3Vpa0hPcHg2OWxzTi91MVoxdTUrcERRbHcr?=
 =?utf-8?B?dnZRSzQ2NHNwcUpnZWtFbTFTZGdUaWF4d0poVVNKUE9jN2JkdVd2NFd3YXlC?=
 =?utf-8?B?c0wyNTRubDNOYUw0NVRtWENNUEs4d0NuYVJPQ0ZIa0JQL1ZHQ1c2V2xmd20r?=
 =?utf-8?Q?TVVcIi?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 07:41:48.0018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cb083a-3d77-4f91-5c77-08ddc43c3880
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9144
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

