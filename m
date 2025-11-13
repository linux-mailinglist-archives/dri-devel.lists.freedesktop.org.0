Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DECC58A24
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9729D10E8A5;
	Thu, 13 Nov 2025 16:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vqK6MfSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAA410E8A5;
 Thu, 13 Nov 2025 16:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iyea50PT5NhOXiOQ3ndyQuOuQakzWuHasjjIdKmL7neDCC97jB3+ebxYgX0UGbQoXRNzmaFCapgDg/hIhpfPw5Nl8GFgiQFu1brp6C7ph1uL4JOY0lPFILx97T0xdtDTecz0xH04mSCNTISTzIRAYBkXaXjEq6Z41ARYj267baFiRPyDY29HfZRKAQSihDG1kMXZC3nViahQ7a6FnNhcG0Tus/o/tpTjq4Zokw7z52iWePjpwQsr1cZGsDbOHNhNrrzdRSFsy0RVjT4tlFeOx5CpBgMVX5nHeF5aTmr8obwjJVPUzqK5Nze8CC25hOwr2RMF66+tlK8+a2bfcwIfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JGQhkIR49/uFa7AabSuVenjYByb+x8COtqzxKNKQtc=;
 b=MB5KfJFz51rhveHQrmrw9gNzQhKSrtF3NAPvyzE/NVnD57xCiVvRHbqmxpOlfpR7P5dNiFSCaK3UZdkC2TL3EJbDfo6n/tm2mwlZs3GWEoVJmkAeC7YZvTU4FLmjNKBXxfn/n+G+w640Z5H+GcCpCKMM+jtunonBU8ogZAb5hPSM2PddYCYbxazuRnWz/DsuxspYMNxjZEaGNPvBnd6X8Jrs/AerXP4jp2ydqQsqTBuBB0MC4VUio/XGpHr5u8LZ9QIUYmQtCq2E+tMp/B1UkINeYrN7MJdmLvGDHwdsyWgf9p+OI+UH5T9h3sMR524kTVPpkUK8SpCjZNP6N+2e1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JGQhkIR49/uFa7AabSuVenjYByb+x8COtqzxKNKQtc=;
 b=vqK6MfShy0jbeqbggv8Unu3civJJf60KIu0QA+uQoqmBZLqJLPDlq7RilF2Mf3i+zXBZG/CNEPY14ffSlEjcaexy/EpctG7PuNgz2ITP8socy8BDwVRP7+WPTaZg4YH2+Hamr8OA08hD3mMv+bUV1zTrqgJs/34fZzD0//yYmOU=
Received: from BN9PR03CA0582.namprd03.prod.outlook.com (2603:10b6:408:10d::17)
 by PH8PR12MB8605.namprd12.prod.outlook.com (2603:10b6:510:1cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:13:40 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::4f) by BN9PR03CA0582.outlook.office365.com
 (2603:10b6:408:10d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:13:40 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:13:38 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 20/20] drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
Date: Thu, 13 Nov 2025 17:06:01 +0100
Message-ID: <20251113160632.5889-21-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|PH8PR12MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 0180e1b8-2e40-48f3-bd7f-08de22cf9c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkNaaFFEUkZYRnlCT0V1QW5uKzkzNmsrZW95cmRFRUE4QzFaSFFUTWdaZ3Zt?=
 =?utf-8?B?cUplTi8ya3BPSUpYRmMyU1dYNlp1VkhLenprc3ZzMkN1YlRnWUdYa09Mb3VK?=
 =?utf-8?B?NnJDUnpyaGJ0RUh2RCtFRENJajJtcVhqV0lIUTJ1NXJLMkhNVzd1bWtxMkRw?=
 =?utf-8?B?eHBXVi96NmU1OW1DQnFFMU1XYVFYOWtuUlFBSGhDaHE1ZjUwaXBrbGlWa0lt?=
 =?utf-8?B?M3FMeVd4UjZ5VHBoc3AwOU4vOVBZem1rWEJhUVpOZkpqeWEweXdVNDZsbGEr?=
 =?utf-8?B?RVU4TWhHRCtGUlJqRkNHSVNCMkQxMmFUaWRTVG56SzNFVE1jTTFFcGlyOHRi?=
 =?utf-8?B?eTFSTE1LVC93SXNQTnA3a0pBZXYxVEFid0t6N0Nzd2EydmFLeVhnMlJ4SUtj?=
 =?utf-8?B?bGtFSHhFL1FDMXkwZUkrYTNCdTFzQXh3Q1VIQzJrN3hIeTRwa1hyZi92QVFQ?=
 =?utf-8?B?RzNhaFJrUnBmandVZyt4V0wyRkk4RE83NVRwb3NRUHN0cU1KL1Bkd2lpV3dQ?=
 =?utf-8?B?eUlZdDRZcVhSU1lHYjRuSzJvNXFRcDVJaG5lUDlEQWFLbnAvL202NmlyQVc4?=
 =?utf-8?B?STZjclhtZ0g1YVNYZHJ0TUMwem1kajNHV2pqcThqWm10aTlaTmVnTVRuOGVu?=
 =?utf-8?B?T3dkQ2w2Z3N2OENpU2tyKzl3dlRacnloL1FxOGN1eFAwRm5mdExtS0pEaWdw?=
 =?utf-8?B?bTM5KzhyQ0tBbkxOcEZGQTJBaE9LWndGOGJrQkcyMGRieGx4Vi9qSDhPUUVz?=
 =?utf-8?B?RXBoTXF0MzdURjRqTDNoNm9LTTIyeE1UWjhXRDd1U0oraGVKN1dhRTEvSlFT?=
 =?utf-8?B?L25HTjlISFpwamNSRnVHak8ySlQyYjN4Zk90VWFIakZmZHFTaGNWbG1YUUZT?=
 =?utf-8?B?UXBydGZKTDRXc1h6aVZuUGJxK0F5MlMyd2VpbFdTTWI0WitIaEFydjZFTTdr?=
 =?utf-8?B?bW55a2RUNUc3bVpqR1JTMU1WZkd6VGhndnMyT1BWSWpvSjVpeWhjTG8va1VU?=
 =?utf-8?B?UERwTXA2ZVF5RlM2UE9UazBQNXpWOHlNVUM4YnMxQ1hRNVNYVFlmNGl4bVBF?=
 =?utf-8?B?S3hVckhYaG9DVGhRMjkzRUdGQm1rWWI3YUtNUVpFWWtuWjJ6ZHMyNmQrK3Nu?=
 =?utf-8?B?YjJtL1NBNUY4ZjNEakJtV0ViZnhZQW11akJWTlJiaU1BanQraG9yYjQzdytK?=
 =?utf-8?B?N3AvejBPQTVxenNkdURwRHRRVkxOOUk0SnVadTMyWTQ4bTVkMFBsdnR0QXNs?=
 =?utf-8?B?NHFzbCtXTDRFWWpHTG9Mb0xXSklmK2ZBN2VHVUY3K0ZCaGhFZDg0dTYzaGdy?=
 =?utf-8?B?cHlSaGF1akdOVjBPeUo2d3NGMEJiL05qL1o0U3JCVEJGcjhNM3lZZUdqZDBY?=
 =?utf-8?B?UVVFUEI5N0V1bGVQeTkwVlAwNGRHblFGQzRkNmYvd0orc2lxOWxsRUtTTzZv?=
 =?utf-8?B?UE9NTXJrTU1Id3Z4VjBtVEZWSjQ5WmppZkhlK3BpZ1FhOXJvUjlNSUNoVHJs?=
 =?utf-8?B?ajlEY2dDSTNTY2dPQzB3dmR0UXRMYnBFRXhSVElBRXJTalhVa3orVjNuOVgy?=
 =?utf-8?B?RXVwemJzWWRWNUwvcm9IMUJuQXpuK3ZZT2xsbzNUK2tOdXRTcmpwY3BpRVRy?=
 =?utf-8?B?blJPVUdhWVhvRFdiUkFqdzkxVU5FSW5scCtqQkJZV3JiQkVoY2hNbzhqcUJq?=
 =?utf-8?B?dlJhL3R4TWJTWkNGWmhldGFqR1RzVmNGVjRTVFFEUVBsdDYrQ1VIWTdvdzNU?=
 =?utf-8?B?QjRnSVZkZ2tyVXVYY3N3dGNBR080NmJ1Q0hFUEZhYTVOREIrR2ZSamo4amRh?=
 =?utf-8?B?M0w0MUpWVXo3UFQ4VDZaVTJiNStEYmg5WXhrRFBqRllzYUxuT0VDcGdUM1Zl?=
 =?utf-8?B?M3crOXYrQ1huZDlTRFNlWUsrQjg0UlI2WktEc3MyWHNuK25qQ1J5WlkvV2J3?=
 =?utf-8?B?Y2dOOUJJQ2w1d1VLNHNyOUcrcE5uM25NcFNPOWVFYjdtTHhRN0lIOVBtbTFT?=
 =?utf-8?B?N09Ud0FsbGsvYmg1TW14VXp1bUsrYWYwa2YyWUUvTVBmQThrYXpxUDJQc0pu?=
 =?utf-8?B?bm5zaUJ5ek9uUEhGZWR1ZXNXTUZ5a245UUEyM0hnd0ZkUU1WVFloK1FTSkpq?=
 =?utf-8?Q?OwzY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:13:40.4142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0180e1b8-2e40-48f3-bd7f-08de22cf9c08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8605
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
index 585aee9a173b..910728cd084e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -38,7 +38,7 @@
 #define AMDGPU_PL_MMIO_REMAP	(TTM_PL_PRIV + 5)
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
-#define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
+#define AMDGPU_GTT_MAX_TRANSFER_SIZE	1024
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
-- 
2.43.0

