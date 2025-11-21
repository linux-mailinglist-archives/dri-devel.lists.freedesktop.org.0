Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB0BC786F1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D4E10E82F;
	Fri, 21 Nov 2025 10:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wRBmhJHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A6410E82B;
 Fri, 21 Nov 2025 10:17:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcrOvgbIWphaaBWljSlqYn6GiSnGyGhAaHKhRWkNTB6ETlxMTIAoK17k+skTmHtu40iPycD557z5bK5dTsKv1RfuijKQgTzFu0r+Illjh97V+pQEy/SkaMMh9OzXNtctnmiEpPksNebstPWQgA2S5NuGS5u8pqGmnel4JIgCQqMjJmJRHpxlTW3yiGXiqbiA7pV+PlIb1nJ5jDoJnGw3Qggv3dQLD/BG/jRaHQGbmKmxEj/7+Ois5XFz/SxF6P+wSWcOD6caILBdchtc8ooOdNTjK/03Uqx6Ld69M/8oJweTcasQUc7+/L4EmjJ0mh4oMEKQe2tqHYcGbciUzieaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6WxifO5PpN4RTpNiZEvJKMmNt/AR4vIL0vc4J0RbLY=;
 b=JCSbrHKpWjmwb5kNpDXvDUUaRoVo2lDrP6slmIh9C0buEy2Ci5YoI2E/zsAsytOecUwRxPKFBUHGLV1M22n0i2owHd1HJ9EKhtQuGZoEsYqNvvbQT9kDZQ6jUarqG1fHEqcfyT5IpPkGvXL2cXyg+IH2kc9FxAboFkXu7jNk0iwduTEj5/GCUDdlgecbkbQtwHGyKncvskofWGfZQyXURME9OUONMvnL2f4SvxI0p86PeS3o6Qov008Oi+iJsjhm+kkySzedIVlMVBLEjp7xLm2IujJgrxFQWnx8qoj4w3vE+tBLVsj0ufxa1n2dKNNk3b2QH4K8X2fWkGQ+80wWYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6WxifO5PpN4RTpNiZEvJKMmNt/AR4vIL0vc4J0RbLY=;
 b=wRBmhJHt9sn/f6B5UCScMVv5vv07nV0KtTVcO3o278mTml0MFsE0zByzxhIjOjGTBZnMViYY2/tSOlFUHE9JsVXI2tVP5ZzpT4ATLvFNweYorwFFl6IKuDyp7dQYUnk0AhW/4daSXoKCFCu3cx72hH+zPx6Zovn/LB5qfBgM/Rw=
Received: from BL6PEPF00013DFE.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:20) by LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:16:59 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2a01:111:f403:c803::8) by BL6PEPF00013DFE.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Fri,
 21 Nov 2025 10:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:16:59 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:16:57 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 15/28] drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
Date: Fri, 21 Nov 2025 11:12:25 +0100
Message-ID: <20251121101315.3585-16-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: b906086d-66ad-42fd-40f9-08de28e71b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHRWS0NtNGpxYTVpU2N5d0ZvSlJDOWhVRDAwQllPSm1sNkxseXFLbkxXeUtJ?=
 =?utf-8?B?NzNhK1BmRWpBVGpUWGUrb21MTWhrZ2MwUEJWZDh0eDFoMi9rekkrc3cyZ2Fq?=
 =?utf-8?B?MWNnT2NrbmZ4NXNUZ3pNdk9xakZYQm5SM2NmeGRaMjk3MXRUNXB1Y2ZNSzlF?=
 =?utf-8?B?NndtWlpUWUhYQkRWT2pEQXdUdGM0bTFMSHBqN0tLVGczZ01TNnlXaXFOTVZX?=
 =?utf-8?B?b3J4OWJPbjNNTy8yOExkM0xQYW9sUXhKNlAzc2I5VE92cFZIUUV4b2EzL2Iy?=
 =?utf-8?B?MjhPZy9HbWh2ekY1KzRzd2N1NUpyZCtESDVLUmZKenFzN3VNOFJGVE5EVkh0?=
 =?utf-8?B?a2p4NGFleW1mODFEUks4SHhpR3VvRnJhRE8zalBXWThrUDlBUnk0RlpVV29E?=
 =?utf-8?B?KytlWmNGcWVZZW9jSlp5M09reVE5Q2poWDhpK3htWWtZZ1VlZGVIY3ZDcGhH?=
 =?utf-8?B?bTdrb3VDOG85YytmMnBaS0FwQnljaFNXMVVOZlZ2dEVrN0dmcjM4bDVRNUZM?=
 =?utf-8?B?RkNUb0IwQlhlcjU1R3BYWWFBQS9wMXpTOE9sSkhsU1RWandiczVkMjZ6N0dm?=
 =?utf-8?B?bHFCVVhNd0N2aVYwMG1NZTN5eUpsUmFSNHFUV2xWUFdaeHh3bXJ0aXlXNzVm?=
 =?utf-8?B?K3NLWlBxOEZTNlN2eFFXYWtzaW5DblFNYXBka00raEFDbngwT0FHak5JSy8z?=
 =?utf-8?B?Y2RNSXBWMlFpUGdYMnEraDFIK3BFWFVJNmcrQXcrd1ljcXh6ZDUvcHJMckZM?=
 =?utf-8?B?Sk8rby9rRW9ZQXVmdHB0ZFZVUUdQR1RsZ1pqalBrZWdYOUNMVmFvRXlqZ0kr?=
 =?utf-8?B?aGZTMnBjb3RLWnlRTTM4TmdUaVIyQ1loQkljWGtpbUsrZ0hYdjFmbzAzcXNz?=
 =?utf-8?B?c1pzeW4wQ3c1b0xvSDlRWEdWdGRLUm1OcEFRdHlTZnlMd2o1aU9BRms0WHIy?=
 =?utf-8?B?R0xjbW1nbXRKcTl1NlE1THNiSE9ENDZlWjh1SEJDWkhyZHM3d1ZYN2N4VlZO?=
 =?utf-8?B?Z3VIVGxZci9WMlcvVEpxTnMwaGJya1NSZDcwYXloRklxcWhPSHJVR0JpUmtT?=
 =?utf-8?B?UzBMVVQ4NkVnaVJEbFlIdWtkejBHLy9sVVNHYzJsRUUxZUN0ZFZjWXFSUldP?=
 =?utf-8?B?SnVmWU9EajY5amZuLzVmdHNRV29IUVRQS1NGNGtUUmJUSUZJRGZHZi9kWEdm?=
 =?utf-8?B?REl0bDJpeUZUVkU0WVY1djNaYUZpUVNhSERTTXFVL3dSTTE5NFF6MXE1d2Nr?=
 =?utf-8?B?Q1RFaU5FK1R5enl1c2JEYmt4TlA4L2hEVHRodjBSKzNBNUhjdjl3cXZoUTZ3?=
 =?utf-8?B?R3hBazBDM3RyWUFvNm1FMCtSaUJNSjJZVm5KTGpUdFRENDAvS0xGR0dlK0pC?=
 =?utf-8?B?TmZPNTFJNEFuSzdVQmxLc3ZKcTI3MTY2dU9TRTFDVTl4YmM1MS9lNDh5TWpQ?=
 =?utf-8?B?aTIxVE1uNWVQK0VSQmRzd1Vvd1pLS3VXYk1aMGhRWkFRSy9DZ1NaRGNGYXNC?=
 =?utf-8?B?L1ZONlJ2c2pzQVNBR2sxMHc0UmhmZ09HYnpTWlR1M092aUlTdW5Tb0VCbW50?=
 =?utf-8?B?R1JtdTNTZDJBNGZDQWFNaHNPeno1SDNTVHBBU2RZaGhFWWdnY2Z5SnpzQVpr?=
 =?utf-8?B?aUhoVmMwbzl6TlJDV3VzQ1ovdTV4OG9QRjN0elF3dEhSSkIrT29oZ2RZL2JV?=
 =?utf-8?B?YUptYVVLcENMK3VWRFhiRjlrWlhKdFk2N0s3cVRPVGN4RGtuUXBTWTlOcjgw?=
 =?utf-8?B?dGU3R1lsbjVJWTdMQ0w4cXpxZ3dqQSttamVVMEJmMHptNkdxTmd4UFZ3QWoy?=
 =?utf-8?B?c09LMDMyV09Rd1JtMDlVL0tUV3JOSDZJVUNMdjB2RUlPcGVYWWNtZk5oZS9u?=
 =?utf-8?B?L0d5cjBiR3dMZ0FXVGcrbzNWK015ZzhDaVJ6eTlWaUZwTitYWG5VNEw3WWRj?=
 =?utf-8?B?ZDFIVTZzU0llRnh1cytkb0NqTml3Z2RldnJ1bmJzbUNOUm5Lc0Ftd0dOTTFv?=
 =?utf-8?B?WEVuSFpBcEdEejUrdm5vb1JiMGFURUJBMmxKMGVtL1k4WVlmVFdWMHBUb0oz?=
 =?utf-8?B?MEd6VnhpRURORHVtOG0wczhZWTU5Z25Yay9zOU50dU5sME5LdjlyZm50blZK?=
 =?utf-8?Q?rFb4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:16:59.6587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b906086d-66ad-42fd-40f9-08de28e71b7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968
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

Makes copies/evictions faster when gart windows are required.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 2a78cf8a3f9f..0b3b03f43bab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -39,7 +39,7 @@
 #define AMDGPU_PL_MMIO_REMAP	(TTM_PL_PRIV + 5)
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
-#define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
+#define AMDGPU_GTT_MAX_TRANSFER_SIZE	1024
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
-- 
2.43.0

