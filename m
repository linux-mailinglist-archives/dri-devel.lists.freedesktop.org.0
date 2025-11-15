Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B75BC5FB82
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB2310ED4C;
	Sat, 15 Nov 2025 00:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ydimBVJ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013015.outbound.protection.outlook.com
 [40.93.201.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AC110ED39;
 Sat, 15 Nov 2025 00:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8sx0phe55OL58fpY+AABaYJ3xG3wpVY4Zv0QLGkUZrTar1BabGUfvgTzJr/6jXlZBIlJJKL06tATYdTngu/8ZEiI/61bEZ/4Gzrw+Xvazg48kPh12tL2XZMHqEwP3d1nMHedgYUakgYqrau4uKkVz6nkLgAQEux/LeXtps8IZJKrgn3rWqILq+vEBNZR9cTLPXga8nNp9pySAdcjooEV0Ekw7cQuL0mQ/uHzQQvHLiL3ubohZNhrKguzV3+m1qnlwisyU2J8A/3ZyTnm6yOyow4eF/0EEFcXjc38w2MiLlGeDy/UahZI+lwkvgr4yJDQDPH+xtgv2QpsEMX9P4Tsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiZyDw6Qv6r156qOc/qwV7gmNyOtpPcd8J7K/Okp0NU=;
 b=QWIvvS2W8VEGQgUz+iQeXNVLvXWVg6fg9XQ9BPm1LZF5ty16aSAYH7Qvz4zeRSD9CNHFres4tSa+wFQV6+hhNUwVitihN1gTLUHi5oF0HbXkFrdzr04zD9nWrfgyVJkBla8RII6KKsQtpkkTE6+97qclqS+q1OJ6+/ONePzhyBNp7sxP18qndxr39LC6IdISPYJX0l112vvH2IYwjDOL/mSWb2XYG7wdKjoHYq8aZ4q0KFBp6p1uVm42QihmYVpKwVsXdCBYwYKkHpbGQWv2oItZyfk/2JZPRcTui1mWhNsM5Nw+T4YOOK2gJU+y78vzuxOGMUjPI4woYikJ1T9AcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiZyDw6Qv6r156qOc/qwV7gmNyOtpPcd8J7K/Okp0NU=;
 b=ydimBVJ1Y+xrQoFXksAzUPSFAN0bAN0tDzNSXAFKGw/NjaDdycfZBfl7Q0E4SOgf3mRJAwjpxOkC1WS6svJlmsHhAi2IwOQfEs73iEMUOvNxoDcUNJXprFrf8A0Z6Zt0X5eiocAcV61mJ7mZSAo9g3EqiU+CXK2VvHvdv/Xj5eg=
Received: from CH2PR14CA0023.namprd14.prod.outlook.com (2603:10b6:610:60::33)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:14:47 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::d8) by CH2PR14CA0023.outlook.office365.com
 (2603:10b6:610:60::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Sat,
 15 Nov 2025 00:14:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:14:47 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:14:42 -0800
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
Subject: [PATCH V13 46/51] drm/amd/display: add 3D LUT colorop
Date: Fri, 14 Nov 2025 17:02:11 -0700
Message-ID: <20251115000237.3561250-47-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: e597e660-b587-4d7e-ab47-08de23dbfcae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmJGWm84ZnkxTUZNZkpjSk1QZ0g5U01qaEZyeTZSUlJmNmxhRXp5c2MrSXZp?=
 =?utf-8?B?ZnJrY0ZlYm5qM0xTajQ1ZG1oUERibC9oR2V2YS9wTHlXTTM5ZFBGSDcrQUtz?=
 =?utf-8?B?eXRPelJFVDJIMlIzUHZqQjhiTzlZdTBMdnJLT2NNNXlHb2hwL0FxeTdTVm14?=
 =?utf-8?B?NHM0OERxWll6c2RkNGFmRWppdVVGM0RsZldVbENDV1pTaFpuSi9DeXNzLy9m?=
 =?utf-8?B?R0dLY21ESkFDbVh6dVlXSERTc1dlNDNCdjJmTmlQR1cxRWVGVW1nSmFFUGxT?=
 =?utf-8?B?REdqbjFmTkxnR0ladGJBNmJpTGpteUVZd25WeCtIcDNyNE44SW9QWG40N29Y?=
 =?utf-8?B?ejdOSWhVOG53ZktlNUo2K01FVElkc0dWSXF1ZGhVbDhrUkJsZ2Z3a0w0YkdY?=
 =?utf-8?B?SGlwdUkzanpBWUlpMS9YbDV5bFp1SFNTZHN3QkM1aFJyandjM1BuK1ZCT203?=
 =?utf-8?B?OXlFLysyOWlxUDh6eWxSb3VBb0hITFp0YTFtRmsxZG9Wc0NmLzBUUlNvNEd0?=
 =?utf-8?B?dHd4M1A4NEt3OFBiY05La2psSlBJaTJjcXVjZEJLaEl0N3NFclhnZ0VjTmJm?=
 =?utf-8?B?MGhNT1Y2TGpYNm5nSy9wR2VZWi95UGhybDREUVNEZ3dXUnhHNUsvS0hLcXdZ?=
 =?utf-8?B?NkFXRTlMTHZ2d1ZaMXpZOVVuc3U3YTUwaFVTQzY2cm9wenFGQ1RRU1B3RjAx?=
 =?utf-8?B?eEFKNHljTHE0MlB5WHp6TFIyeFJKeS9oeEJVdFRWeGl5K2lJRjJKNWpCSjNG?=
 =?utf-8?B?aHFGcXp3bmNVbWw4Z3g2NFR2QmpXSHBXVUlvdlBSUzZTTUE2U0JoME0veHh6?=
 =?utf-8?B?ODY0NSt1Z2FFSk9FeEJ6VzZBS1NIdUY4aTdQYUlZQUFoMjA3aWRFQ2ZUL21H?=
 =?utf-8?B?d0pVVERzQUNVcUxSMXZWNnUzTmNXN2xKcm05Vm5IM1pkZlNzT1VLWThyMVdC?=
 =?utf-8?B?STV2M2pPdnR2eGlZZ09WaU5uaUVhUWVMTlB5QW9mNTl0aUdYblhCWGJoYVlh?=
 =?utf-8?B?NDIxTjNWa1ZkSFNHYldoYy9UcXNsM3ZaTlU1c2RUaFo1a1pBc3dvVWFwNVVa?=
 =?utf-8?B?dXZua1oyZ1hnYWVIVlk3M1lTK1BtNWdMV1hqZUQ4aVhrbTdRcC9hZGdoN2hK?=
 =?utf-8?B?NFlMQ09CREMxWUtlRk5CdjhIK0NmakZQbTNCMEE3aVlORkNSWVFlTk9Qdk9v?=
 =?utf-8?B?MmVNN0ROa0ZoMy9jVVJJeTJzL3pKdkFCUTlvVys4b3hBcG1tS09CV0dYNTMr?=
 =?utf-8?B?ZDB6RlNjamlvdHdlZStEUEMrV1RrUDExdnJHUFl1c0hLYURFSzlobGw3YU83?=
 =?utf-8?B?UDhDS0RmQjNWS0JQRjJkbHVmdGJRdVBJdElaMklWVlBESDFxVjdMbllBa0hR?=
 =?utf-8?B?bVpBQXVFZEMyUG1YRjk1Q2xzZEQwa2ZoU0lUalhPRmJmVmtpU3U0NG1FUUxH?=
 =?utf-8?B?MEM2WWxhYjV3OVROU3B0b3NNZzNmZFpZMmtMeSt3SnozTFJHTjd4Z1ZubHI1?=
 =?utf-8?B?V0Iyb0VXU2ltZTJ2amZ5TVdTNjBTUENhUHFWajF0WnhLREI4STZuSVF1VXhS?=
 =?utf-8?B?LzU5a0ZSTXV0Szg5T2tMU0xmbE9SaVFKalJ3VUpuNW5hTnJZdXFEWW84clR0?=
 =?utf-8?B?dm13bWwySHNUaWxuYjBvOFJObnRNZXBMWE5wVk1sU3MzU0Z5UDVocHpTWmJx?=
 =?utf-8?B?c2tDVlBXUDVkbjJzMXJsVSttS0wwSXBZczlWTk82aGhmYzBpU3M2blVYRGdr?=
 =?utf-8?B?a0NkcU1kRnZTNW03RFhwMmVudlRXSXdQM0RneUlJZDNVZDhrVzdsdnFDd2Jz?=
 =?utf-8?B?Q1FkQTFiMVZ0aHF3MzZaR2NVQlNRRWFTenhFMUhvTS80bExZbGpzakdtcStE?=
 =?utf-8?B?NHJOYnN6a2pYTzdCbTNXWkIvanlJQlIyR21mOHNua0tHdEhzblBWZ0R2KzJl?=
 =?utf-8?B?OER0R2xZWnRIRVRKdEpNTXRIVG14N0RjUlNOdmY3WHpZNXNSMWNxYmlRWWFG?=
 =?utf-8?B?WVdZU3RXVDhqWDlSU2RIdXBCM3M3c3ZmTndvMFltb24yQzhvNHNWOXpDOUhq?=
 =?utf-8?B?TDBiZzF0WWxKdHh4M3Z0TWg0RjY1L2E2Z01Ud3JuZ29HeDZzbnRoWGJDdWpu?=
 =?utf-8?Q?HTjA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:14:47.6506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e597e660-b587-4d7e-ab47-08de23dbfcae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308
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
index 5df8f13d56b2..01e420b4527c 100644
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

