Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94557C7865D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD7B10E814;
	Fri, 21 Nov 2025 10:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e8SdZPfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013062.outbound.protection.outlook.com
 [40.107.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EBD10E810;
 Fri, 21 Nov 2025 10:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9Nc0/cBS9qMKB3YoUt5Z7/LSp9PQdpAnlIMlESx5a8o5irrZ3RLgMjjYDMFACMSM6jt2cWu2RQhSsYqNBkRVW8VBtxCwcwz+tIKChNBydzWRLKZMJXdHX19c6iccLOyaiToHeNYODz6UHt3cGmm74pV4YPekRa6OwiKFx6Ccr3bUFvo/kwwgu1pi56+PQ8TCKTu0sNuuDsexC4rBfiDZQABz08NRk/BLwUQC7VFYR8uQt5HXQh8AFha8nY4eRHZ4THumWr7C/R7/UGFi3QyCn4ipj8g6VDdfUEuj6SiS41btA23g1EFv+bK5J3Bt2u1rdAbiH6sQ0Wr53a03nt/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tddlyRPQ2jLN0TjBSNMjsqw7i/vwUtVxIcLaB4TYnxc=;
 b=WJztR+C2ipG18PnCdMrnrwcLecePr7th+Zg/QEveMarHb9wxvT1EWoWHIHlrryQ9Q7TEj2lSh2kg7cJ+jYcNDLkkNRtfy+DLy3QGkAmBU4j6OFubgybRFzR+59eqqqYzUhItEIGF+S3TjYbZCdqJzCFUjKvC81W1rqxRt3PqNSjY1nCxwbBpVdONndm5exbK7qtMq0fL/iTxiPdqcOzTIlzEQhc4EvqnTbHUjKkdeLGU6yGtlQP29WBVutn+ZevsPmaPcac9obuXgPlmmvvgwYshTS0whSXbGiNYL8aUUeAuhYM21eKIXfXjHaTGn6QlY2sRwyL9Ix+pPZS+HMCTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tddlyRPQ2jLN0TjBSNMjsqw7i/vwUtVxIcLaB4TYnxc=;
 b=e8SdZPfMWLMNfEdWeyJ0gkEj2F76RH45xNTsXVzu49n0NOtdorsHzXEaXEMc7YP7eAkB8vWwq7iWI/51j5Ay7QpvKidvyF6emSzMABIwvyxZHGpKytRFpcqOv2+pA2ZIEIxkYgMgvqkOlEjFu1C16XlkSiLj7L3Q2p7D0wK3T8o=
Received: from MN2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:208:1a0::29)
 by IA0PPFACF832414.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 10:13:56 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::a6) by MN2PR07CA0019.outlook.office365.com
 (2603:10b6:208:1a0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:13:56 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:13:53 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 02/28] drm/amdgpu: use ttm_resource_manager_cleanup
Date: Fri, 21 Nov 2025 11:12:12 +0100
Message-ID: <20251121101315.3585-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|IA0PPFACF832414:EE_
X-MS-Office365-Filtering-Correlation-Id: 446f0800-8076-4322-55d3-08de28e6ae6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HTKh+dbOlM88QJD0u7habl6Z8XZBnaR3gccALZhsieQT5ADAxYySFI76PFEq?=
 =?us-ascii?Q?pXpYDJ3yZocXpruyIvB06SXaxFYndXQRsfYnwvevxptewWBl40VqAFuupNxX?=
 =?us-ascii?Q?G3W3Yi08SJePnCdQXez9cMHYsrRbwk7g2stB55BjMJwgAewtwoDyPgPEN14M?=
 =?us-ascii?Q?3l3X8W0CXD0oQ2PI2OKVPx0DxaVjBvfvVF64Ek5Y/8e4+sY5/82/eAYdYeQO?=
 =?us-ascii?Q?e85b1hBLFgQSmCkbiDa+iyxBEzBINOmbBWRfjBAx+30jzfjosMyH3I1j7e3J?=
 =?us-ascii?Q?suEp0nBCBNhIsGYN9myKzFdwDa/gLLJraPU6DPf/wDqfK8T7RA12hEcjxbGD?=
 =?us-ascii?Q?9JNAs7DrPUQt60qF9iomrwIRiSN6nXwlAWspcqJ9l+WprBKdJefERc2Pz8um?=
 =?us-ascii?Q?xWJP/pge5gjBPfcv0TK0F02tKt/sPeImXM9MqVPjw1/vMRk1uNR03pfsuNnz?=
 =?us-ascii?Q?Uwr0yMzFLXNhtV6zCkX1lbfBLKnM7Raz58gqTBtENAg40hHKQTxsnbxUqVw7?=
 =?us-ascii?Q?06rysqlIkmmzPI3B69ZvkYl1nbNO9uNbY7O0MN7xkN6msywQhHqDL0Ia/C2w?=
 =?us-ascii?Q?QeGNcUUErA5eQtetF6MTy5/xzTxItK1LZ/h3rRU04lL1IVAxciBvh6co3Y9v?=
 =?us-ascii?Q?qDs0MZ3qnzUwxq2Hnl1CVpqDT+aQwu6wnJyo5ltzJpzddpgoxo/8unyWPRJv?=
 =?us-ascii?Q?WHNGEdLxhexLcdLTsqGh+Z3BKq5C1itLJL2Nkzit2jKEZQpwiqXv/Ck/AtjQ?=
 =?us-ascii?Q?C0PdU7GeHy1D8Hje79H0g9+Nx6s0fA/x65MRISU9HfSqEPJ5Nomw9sY734ek?=
 =?us-ascii?Q?aZ81gg479i6sQL0bq6h/nq+0oxm0kGfIkYt2lSdduIh20B97AGifeF8x6mrv?=
 =?us-ascii?Q?1yNq+4/GT0YRea3MSfbnFBHD3kK65fnZPgaCZkqQnpBZeeJkkmGc0OJkuLMf?=
 =?us-ascii?Q?n5fZQ3gAYCpUjOdJNS8WyjSTnJO9lxzF6yScbkwK/4nfA29N3netvf3CxLdb?=
 =?us-ascii?Q?T1WFr86LuV+Cfs1uzxdhaLu/g0bNsrM8LeRWU1DSaCuI23mOU4SIGYPRd4n2?=
 =?us-ascii?Q?WFLnp3hM0dUPbgW1woF8pKD5ie12vvlXdcWU+i110kmQhSJ/1gPP3JSrx5TA?=
 =?us-ascii?Q?uJOYf8C1LCfDmMmt+ZeHU6T4R4Rz2LqihhzkuSUq9nolE7vsPwPKtDKPESsk?=
 =?us-ascii?Q?xlm+XgWjugUvz3xRuDXndRs39lPhyf3wqEXJxdZQSVRvh8q/rBvErcu1JdQn?=
 =?us-ascii?Q?Vr0XY/FDqxnGKzyNrKYG45ZU5nPEh49DBwt9xymNFpZ/VG7JFWTXODzGmu0R?=
 =?us-ascii?Q?CW0Y16FJmeli63LZjARXljpkzmS3Ts/ujrVgB50VcEPcVSV311ryggePBT8p?=
 =?us-ascii?Q?A7n7LKI4VCav//SEA1oPmmFAuOs+LRgO7oWLm4Wn4ZMwzYEgkd8R1ASrECaf?=
 =?us-ascii?Q?NInZv/QUltQ0Qun8PtuUuSE1oK6RCmAXHpseUqVmYvEdEn6J/UJ61ESbR2GO?=
 =?us-ascii?Q?112Oi1rK+ypifXH6U5dp3hsdKBP5uTMaL18FMhQITuEAmz7czFzjl3giMD6F?=
 =?us-ascii?Q?szWhfnQyYZxhraTJ/rM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:13:56.6618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 446f0800-8076-4322-55d3-08de28e6ae6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFACF832414
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

Rather than open-coding it.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6a1434391fb8..8d0043ad5336 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2182,8 +2182,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	} else {
 		drm_sched_entity_destroy(&adev->mman.high_pr);
 		drm_sched_entity_destroy(&adev->mman.low_pr);
-		dma_fence_put(man->move);
-		man->move = NULL;
+		/* Drop all the old fences since re-creating the scheduler entities
+		 * will allocate new contexts.
+		 */
+		ttm_resource_manager_cleanup(man);
 	}
 
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
-- 
2.43.0

