Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A62C1E4DA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DDB10EA79;
	Thu, 30 Oct 2025 03:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EHNWmMYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D154610EA84;
 Thu, 30 Oct 2025 03:55:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9Ww63jabNCRHpKUNJC6TqOHY23Hs0+2AtL+2cJki7X5Zp6jUMKBCmVonHaEXqEWtgZVTTZSUQIVEQHIU1pz7mBGMuH6AvTjIbk8ejLpLR4C4PxM7m0PKtHu1hq7sUVIrV+cm2f0rIVcw6pyBsBqtwDVXaF+mCgwG7fX2satF5sgExO0WKeQkLLhMIVN4r6S0kK6lCSjZ0VOmhDv2c4kq3POBCha9g/tDd303CucOobkUVrEde189voyqifb5Sf3NJi2QGWNYvWibtfqh0smgTWiGBF4UJQwxDDztT52XDvw8YrCAEvKdmTwykuZqa9+wGMFYnNumuZY7CIO8lTV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAeoCGW+Rrrz+Qu7bGT8X6OLw4qbKjZbqfLMq3UJXE0=;
 b=EA9BDDPg/JVW3Pl3Qo8bJ1YrYvlYnrTZKlqObDH6yILT6CxWihNeOU8/EMpfeqdt2IVG/DqvAawe6tr2BqicTJPQ9Lnrs73eYZWoBeacVI1UGcf2UZOZQjYfLLz2XB9EgcqJK1GUESu3yB1PrEoNavxkAGEMNeiCxIAKBGDS8ZJM5IAcgmAeq+kr4WD1tsVAwTclE9HsVUA3JFKlVGyFkofz0MrRVznCXqOLn5Q2OXlFcuADKkml7acLEfBkgQl2FgIg/VfIZTww/zfU0uvz9rJGhFFJOEcD2vNRrb9jThzJD6QEGjIjWb60+g0N3mh78U5IK+qD3jxWes5xaYwK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAeoCGW+Rrrz+Qu7bGT8X6OLw4qbKjZbqfLMq3UJXE0=;
 b=EHNWmMYNkxYk0y4sF1/JS6ZUKImCGe7u8AltQDTtT0Z90lVFdjTW2ehr7Pxcbj441M76XR4oGcguCMTPKGCRVZpSgAg8+rNejK0l6zq2mc/b4O9D+IAo5TcfdxbnPGNlfTrz3gYzjRsdaH3XOHvy6LDMK6P8w2WQKDGJoSc9hJg=
Received: from MW4PR04CA0180.namprd04.prod.outlook.com (2603:10b6:303:85::35)
 by PH7PR12MB7355.namprd12.prod.outlook.com (2603:10b6:510:20e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:55:46 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::cb) by MW4PR04CA0180.outlook.office365.com
 (2603:10b6:303:85::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:55:45 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:55:39 -0700
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 44/49] drm/amd/display: add 3D LUT colorop
Date: Wed, 29 Oct 2025 21:42:49 -0600
Message-ID: <20251030034349.2309829-45-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|PH7PR12MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c87c37b-0d68-4630-0593-08de1768346a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTR0L0IzM3ZQbFoxWkRUVGFJbk1PQlJBODJxMkEyNFVPc25xUlJ4N3ZZRkhQ?=
 =?utf-8?B?dnVUNENNRE1WMWRoZzIyemYvcEV2SGJybmN6ZWV2djdOUHdrK1NQZFExQjZP?=
 =?utf-8?B?QW13a3BUWVMzcjZuMGM4WklpNklKekZMblJQNHVOQUowOWNNUEcxMk5zMU1W?=
 =?utf-8?B?bnhXQVh2S28rTXBrNGxRNVYyajJCTlF6NjlrcnZNd0FjR0RsdnphU2VsOUI0?=
 =?utf-8?B?ZTFRakp6Q29Pb2FXd1dOeW8zS2JmMlJ6QS9aRUllbXMxRHkwOWRtSGJBWGht?=
 =?utf-8?B?N0w2d2xmUWhNK2w5d1M1cjVzSll4aEIvSTlFUyttUDBkdHVhNHAxOXVqYzZw?=
 =?utf-8?B?SFJpdFBlZXNCSHdhTW9OZXpxQThGbXE4TXBqdjhkM2YreWVDYldnQWM5RnRV?=
 =?utf-8?B?WFl2b3FNME0rTGVLVXptRnJ0b3hWZVVia3FSMFBuSVFkaFloTjhTaUJVdmtT?=
 =?utf-8?B?Mis2Q1d5UjhkVXBlV2gyWW05UTRlNWhhMWg2NzA1S2x5eXhGNElFTjcvWEdz?=
 =?utf-8?B?TFlNaGdXbGpIUmxDQnk5Mmg3QXZXL3l6OFMzS1dlcFRRUnJzQStSWWphbG5G?=
 =?utf-8?B?VmpZYUhKOVc1T1htaHNPM1BpWm5KYVh5eDBZSDlxczdEWmxIVzRLZHVtbVF1?=
 =?utf-8?B?VnNCanhOZVFBZE5FV2ZIdmVCSVhScFMzOEsyQ0I3Ujl5S2VMTkpraWtmYmxR?=
 =?utf-8?B?ZmNMa1dzK2ZoVmJ3TERQNkNycFhDVkhQdFFJVzBYMjR4eGh5RmNxa2N2ODZQ?=
 =?utf-8?B?ZFN4b1orUUMwbmRVL1NaOXM4Vm43VGVwbTZpUHJURURnWHRHUU5KZnBxdGYy?=
 =?utf-8?B?Y3A5Y09maklrTjhUcGJ6eWxoYWM0bmtlV2NTZk1kZ1hFYmh3OVRBYXFWUjFS?=
 =?utf-8?B?Y2x0UTg3YnNPL09VWHVpSjJ4K0I2Z3BkZGZIeHBiOU4wQW5XOEZmK3FHQjhp?=
 =?utf-8?B?YUpzbjBaaEk3RXEvRlJlV3V6RUZla0pNMXdaaHlhSG5BcjJKSEgvMkpTTEN5?=
 =?utf-8?B?L1paUzR3VmRuaFJmMDh0M1JjbDdwZWVOREpRVkh2emFacTVaZUVlUzJyL0pL?=
 =?utf-8?B?QXhMSHlQVFhhOGkvS3VDR2JCYkNnMzV6aEVUWDFTMFUxekFMTzQ1VnZYOGRn?=
 =?utf-8?B?OFl1N0JiNks4N1huS0FLR2loMmNHTGtFYjg0SjM1UFBkaHRBQmhWczBBK0tj?=
 =?utf-8?B?cWh5WVV2S3ZzOXdhS3hSTWJNTHVjYVd4bVdYa0JaMnFDdzRibVBhUE1HbjlN?=
 =?utf-8?B?ZGRpZkVRZlFEeG5NZVhuOTBHRWJQaGtjdnYxZjlWS041VFZ3VWVpMGozSzhw?=
 =?utf-8?B?SlJHVDdEQXN2aUdoSnZiWS8xQjh3UlQ2TFVEa1RCN296N2ZtVm5wZGFrUkM3?=
 =?utf-8?B?RFNCN3lNa05EZnk3K090QkgxSWZZVTg4TXU2N1pMNkJ5VkRqUTZMZFd0MTJw?=
 =?utf-8?B?WEk4RnBjZlpmT3BjbXFXZzVRNElpYjR1UExzdEErcFd1SVJ6S3drUVdFT3ln?=
 =?utf-8?B?U1JIQTE2eFlmZ0FxUFdRV2c4QzJveDl4dnBzaDhHWGc5QlhzRUJJU1d5TUVH?=
 =?utf-8?B?VnR4Z1dYeDJwdjhiSkkxdUpLSko4TGhxWUNSaFJyYWdZRmNabW5ZYzhTVlh2?=
 =?utf-8?B?aUNVU3B4NDNMK2tEbi9lY0ZHR2lLQlZCK01ISnVnMDlHRVhFeVRwNHF4T2JT?=
 =?utf-8?B?bjN3b1dRQUlmVWVpZk1ZdzJTd0VjbGlPbThsakFFcTcwdXN5UVdyeStTa2hD?=
 =?utf-8?B?RTZkdlRySDZGTWpNVVB2T1VqcVlrY2R6MmNwYVVrcGVaSVFDVjMrb3VGRG50?=
 =?utf-8?B?elQ3N3RSQVV2T0RkTDlUSEptY3kra3dkbitOY0J0N0hiSzZTSGVTS2Z1RFNa?=
 =?utf-8?B?bHlYdlhKZ0JxdDM5ZUJhU014R0hBMXI4UXBLdmNJR2tJRTdCRkRJTWJ2VTZx?=
 =?utf-8?B?Njl2cFhMUmJZMDJxWjYyQ0V4ODJsampiaWJUcnhyK2xTYU8vNi83alZia0pu?=
 =?utf-8?B?TWRiWjJ2c1grME5hWC9SWUFZODI2c1JKUmIvT3ZXRW5vU2VDeGJEWU1aSjg0?=
 =?utf-8?B?SWlRUy9PYVdweEw2bEVVMFdCNWtFZXprY05FOUJaTHhUbm9xUkxBS0Z4ZVdD?=
 =?utf-8?Q?MHDg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:55:45.5253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c87c37b-0d68-4630-0593-08de1768346a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7355
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

This adds support for a 3D LUT.

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. Multiplier
3. 3x4 CTM
4. 1D curve colorop
5. 1D LUT
6. 3D LUT
7. 1D curve colorop
8. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v11:
 - Update names from *_lut_32_* to *_lut32_* (Simon Ser)
 - Fix RGB conversion from 16 bits to 32 bits (Xaver Hugl)
 - Handle errors in __set_colorop_3dlut (Nícolas Prado)

v10:
 - Support 32BIT RGB in 3D LUT with drm_color_lut_32 (Harry Wentland)
 - Remove redundant DRM_ERROR(...)

V9:
 - Return a value in __set_dm_plane_colorop_3dlut

v8:
 - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentland)
 - Rework tf->type = TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li)

v7:
 - Simplify 3D LUT according to drm_colorop changes (Simon Ser)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 156 ++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  19 +++
 2 files changed, 175 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 5914b5688a8d..e442fa9b791b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -866,6 +866,59 @@ static void __drm_3dlut_to_dc_3dlut(const struct drm_color_lut *lut,
 	__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
 }
 
+static void __to_dc_lut3d_32_color(struct dc_rgb *rgb,
+				   const struct drm_color_lut32 lut,
+				   int bit_precision)
+{
+	rgb->red = drm_color_lut32_extract(lut.red, bit_precision);
+	rgb->green = drm_color_lut32_extract(lut.green, bit_precision);
+	rgb->blue  = drm_color_lut32_extract(lut.blue, bit_precision);
+}
+
+static void __drm_3dlut32_to_dc_3dlut(const struct drm_color_lut32 *lut,
+				       uint32_t lut3d_size,
+				       struct tetrahedral_params *params,
+				       bool use_tetrahedral_9,
+				       int bit_depth)
+{
+	struct dc_rgb *lut0;
+	struct dc_rgb *lut1;
+	struct dc_rgb *lut2;
+	struct dc_rgb *lut3;
+	int lut_i, i;
+
+
+	if (use_tetrahedral_9) {
+		lut0 = params->tetrahedral_9.lut0;
+		lut1 = params->tetrahedral_9.lut1;
+		lut2 = params->tetrahedral_9.lut2;
+		lut3 = params->tetrahedral_9.lut3;
+	} else {
+		lut0 = params->tetrahedral_17.lut0;
+		lut1 = params->tetrahedral_17.lut1;
+		lut2 = params->tetrahedral_17.lut2;
+		lut3 = params->tetrahedral_17.lut3;
+	}
+
+	for (lut_i = 0, i = 0; i < lut3d_size - 4; lut_i++, i += 4) {
+		/*
+		 * We should consider the 3D LUT RGB values are distributed
+		 * along four arrays lut0-3 where the first sizes 1229 and the
+		 * other 1228. The bit depth supported for 3dlut channel is
+		 * 12-bit, but DC also supports 10-bit.
+		 *
+		 * TODO: improve color pipeline API to enable the userspace set
+		 * bit depth and 3D LUT size/stride, as specified by VA-API.
+		 */
+		__to_dc_lut3d_32_color(&lut0[lut_i], lut[i], bit_depth);
+		__to_dc_lut3d_32_color(&lut1[lut_i], lut[i + 1], bit_depth);
+		__to_dc_lut3d_32_color(&lut2[lut_i], lut[i + 2], bit_depth);
+		__to_dc_lut3d_32_color(&lut3[lut_i], lut[i + 3], bit_depth);
+	}
+	/* lut0 has 1229 points (lut_size/4 + 1) */
+	__to_dc_lut3d_32_color(&lut0[lut_i], lut[i], bit_depth);
+}
+
 /* amdgpu_dm_atomic_lut3d - set DRM 3D LUT to DC stream
  * @drm_lut3d: user 3D LUT
  * @drm_lut3d_size: size of 3D LUT
@@ -1460,6 +1513,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
 	const struct drm_color_lut32 *shaper_lut;
 	struct drm_device *dev = colorop->dev;
+	bool enabled = false;
 	uint32_t shaper_size;
 	int i = 0, ret = 0;
 
@@ -1481,6 +1535,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		ret = __set_output_tf(tf, 0, 0, false);
 		if (ret)
 			return ret;
+		enabled = true;
 	}
 
 	/* 1D LUT - SHAPER LUT */
@@ -1512,12 +1567,102 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			ret = __set_output_tf_32(tf, shaper_lut, shaper_size, false);
 			if (ret)
 				return ret;
+			enabled = true;
 		}
 	}
 
+	if (!enabled)
+		tf->type = TF_TYPE_BYPASS;
+
+	return 0;
+}
+
+/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
+ * @drm_lut3d: user 3D LUT
+ * @drm_lut3d_size: size of 3D LUT
+ * @lut3d: DC 3D LUT
+ *
+ * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
+ * on DCN accordingly.
+ *
+ * Returns:
+ * 0 on success. -EINVAL if drm_lut3d_size is zero.
+ */
+static int __set_colorop_3dlut(const struct drm_color_lut32 *drm_lut3d,
+				uint32_t drm_lut3d_size,
+				struct dc_3dlut *lut)
+{
+	if (!drm_lut3d_size) {
+		lut->state.bits.initialized = 0;
+		return -EINVAL;
+	}
+
+	/* Only supports 17x17x17 3D LUT (12-bit) now */
+	lut->lut_3d.use_12bits = true;
+	lut->lut_3d.use_tetrahedral_9 = false;
+
+	lut->state.bits.initialized = 1;
+	__drm_3dlut32_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
+				   lut->lut_3d.use_tetrahedral_9, 12);
+
 	return 0;
 }
 
+static int
+__set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
+			     struct dc_plane_state *dc_plane_state,
+			     struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
+	const struct drm_device *dev = colorop->dev;
+	const struct drm_color_lut32 *lut3d;
+	uint32_t lut3d_size;
+	int i = 0, ret = 0;
+
+	/* 3D LUT */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_3D_LUT) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
+		if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+			drm_dbg(dev, "3D LUT is not supported by hardware\n");
+			return -EINVAL;
+		}
+
+		drm_dbg(dev, "3D LUT colorop with ID: %d\n", colorop->base.id);
+		lut3d = __extract_blob_lut32(colorop_state->data, &lut3d_size);
+		lut3d_size = lut3d != NULL ? lut3d_size : 0;
+		ret = __set_colorop_3dlut(lut3d, lut3d_size, &dc_plane_state->lut3d_func);
+		if (ret) {
+			drm_dbg(dev, "3D LUT colorop with ID: %d has LUT size = %d\n",
+				colorop->base.id, lut3d_size);
+			return ret;
+		}
+
+		/* 3D LUT requires shaper. If shaper colorop is bypassed, enable shaper curve
+		 * with TRANSFER_FUNCTION_LINEAR
+		 */
+		if (tf->type == TF_TYPE_BYPASS) {
+			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+			tf->tf = TRANSFER_FUNCTION_LINEAR;
+			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+			ret = __set_output_tf_32(tf, NULL, 0, false);
+		}
+	}
+
+	return ret;
+}
+
 static int
 __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 			     struct dc_plane_state *dc_plane_state,
@@ -1689,6 +1834,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (!colorop)
 		return -EINVAL;
 
+	/* 3D LUT */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3D LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index deacc18b8926..f89a887c6b14 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -49,6 +49,8 @@ const u64 amdgpu_dm_supported_blnd_tfs =
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
+#define LUT3D_SIZE		17
+
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
@@ -140,6 +142,23 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3D LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+				     DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - BLND TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.43.0

