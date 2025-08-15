Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C8B27794
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E740F10EBBC;
	Fri, 15 Aug 2025 04:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zaS8FCrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2346310EBBC;
 Fri, 15 Aug 2025 04:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgkhLyy0PdQUYKPj5UYYnDTqx/QfRT1qO6O8OH2khdmhovCrmzGWuiNXybqmhQxa3bVW/f4w7gEiQsX+0AXgfsJ9RqXA8RsneBOymZ4RSqP6eiz0/gZ+r1i7rA52a45LM8DUQEkmIAGwoj2k0kQuLhcw0Y0XqC5K5qupguWaoMohjc9645BGvdFfXvsvmu7gERgqalRu1W7pImqhYDXZ/3mNvP8aVxvBtw+XHLEXE0zEveM+8wHrEE7mVs+hCNhFXek+iXpSxp1MkL3zpYQE5F5r7ga32XTs8aHembakh3lWgrs1FaWc+7Ie/LMgdRm7WPEyMY8KbuF2hXWJVt8mIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05Mp2r2YmjvC8uFUJFmKPT9t3wnJG162XFKXEy5AeU8=;
 b=iqEqD9t7OfY5DsG0MXQMlEe1cRSBWlK2isSHGiLLkwXIjnvLmC4epduCZLgnE5eMHX2kvi4DxIxktgdsILOkhYhyNKZG+dLZzoSMnzfIJjx9J4mBKVZy2TKZBx9ud7QoSGJAjai4lzWYjVF/MTiYMUF825bfi+8O3o3wHzv4JxUK4d7EbCBUrBjYqaPES04ZT9CXFI9t8/X1Yzr3C5ceoyFSue7LY4nriYmvmOpYd6QEyTRarD9EobMt9Rq3AqBfeiOZ2W4XB9KWaZQ+IhM7qwBKy7FqurS1WbewLVWa6WAC6+T9Il/V2eCba2XMuUIpIgK2raa/58Hnks4Vz0LgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05Mp2r2YmjvC8uFUJFmKPT9t3wnJG162XFKXEy5AeU8=;
 b=zaS8FCrXkxem36QGLoxtjcYK7mBnknNMwg/9n8F+SzSUeH+NUtP2ndxSdj0YBuhdFzEakr/Mi06aczTxGOfTEnC2SxdFy5+V7m9nVFlt0AhZjq3UhdlpuP0sEGEK8SAaMCspmhhSmBp2jj4yVtxo7DbSrgWHiGefCHHGyAOZ/Lg=
Received: from CH2PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:59::15)
 by IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 04:02:15 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:59:cafe::b0) by CH2PR03CA0005.outlook.office365.com
 (2603:10b6:610:59::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Fri,
 15 Aug 2025 04:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.0 via Frontend Transport; Fri, 15 Aug 2025 04:02:14 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:02:11 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 44/47] drm/amd/display: add 3D LUT colorop
Date: Thu, 14 Aug 2025 21:50:33 -0600
Message-ID: <20250815035047.3319284-45-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f647c1c-49e6-427b-641d-08dddbb084fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXlEeEczelhkNFFFd0p0WE1hWVVSeHZWWkpsWisxTUcrbHJtN00yelQ2V0ov?=
 =?utf-8?B?SkxCQ0I3VjlNZlBJY1ZtZWp6Zm55N0o1dGJYUTJqRll5Yk9WQmpIMUxEUXBm?=
 =?utf-8?B?dS9seG5jb0RmblY1SjJteFg3R2lsZXEreEtxZXZuUGN4UUgwRDMwUEJWZUlB?=
 =?utf-8?B?MGcwQytaL3RGdGtJZHFERnRLUmptcXVBNXZ2SG9ERkI5cmJBMEhCa1V3cTZw?=
 =?utf-8?B?dm5kZ2hjQ2NXVTR2UWFxWjlkN2J5OEd1N1NjNkt0T0sxdEExcWdYb3BLNUJt?=
 =?utf-8?B?NldwMXpXb016dVdlanBUeGdrekttclNDazAvNnE4SDZreURjOFRZVVl1bHpW?=
 =?utf-8?B?K0djL2ZGc1Exd2d4MTdQSUV0LzRRbGlzcVkxMHVMMVRoQTRiUjNLSkpxMTc5?=
 =?utf-8?B?aSt0STF2SW01NlJpMUU4R2NOdXNROUhCRVROM2NBcnpBMEtSa0xNUkpJRXV5?=
 =?utf-8?B?Q1creUxxczA3S1JZcXBrM21GZWZyTmxaUUd6anhybWRqdTM1N3RRSFhpVnBx?=
 =?utf-8?B?L0tmcjVzRnJob3BsbEVTa0V0UUtybmErZ3lvb3ZHT2V2SmpzeVA5ZFFMWmJ5?=
 =?utf-8?B?SVIrd0pIN0UxbE1teFJuNFRESExocXNrNXVZM0xLWm4rNFQwOWZyM0gxQ21U?=
 =?utf-8?B?c1ZRRy9iNGw1bDMzWnZSYU1qZVVUN2xGUDJnQmJiS09oendjbFVjQzU2eUJm?=
 =?utf-8?B?R2d5bmFCM2tMUHlqcHp2RUs5dHZtYjVxV0NHejBjRlFuVHhPU2ZSdThmcUJE?=
 =?utf-8?B?by9TSGtnTXFVcXl5RWdBcXl0V2w0YXBrS1ZMK2NtdXd5TnZ0eUNUTFl6aU96?=
 =?utf-8?B?enRJdTBHam9jb3hpYnhvZ3hIWXdsbG81VzFxaVF3ODBrb3RMRURNenFLbGlh?=
 =?utf-8?B?NVpBYjlqMTFyTzVxdlR0cmdvSEx4dmgwQ3RDVHYzZitrRTdIZkJ4V2xrZzkx?=
 =?utf-8?B?Tko2R29zY0FRbmJweSs1ME1zVFpFbDZ6T3loN2d3U2dTMzUwQ3pLMXBLRWRG?=
 =?utf-8?B?NUdLTVRoazMyZnV2MFVDZGk3dk5PaE1raktxRXVGakxRMldPNTN0UkxRQUo4?=
 =?utf-8?B?cHptVVNJZWcyRkJmN09NdG1sRmo0OE5nQUh1cUlEUGRPTFNsdFVKWmQ0Sndr?=
 =?utf-8?B?UXpya2EydDQxRkRvdmdFcDV5a0twV2czUE1od20vU0Y5MjhYQnNpRlpSS1Qv?=
 =?utf-8?B?Wm03T0JCOUVRM2tIN0U0ZDkzYUNHQ1lLQm12WXZiSk1ORXViSS9uaStuWWpu?=
 =?utf-8?B?RmNPbEg4TFN0T1BmVHVKMENLZ25yUmJrMG5PTnUzSGJnOUNyUGk1TDgwMWY0?=
 =?utf-8?B?WDZsR3liWUYyQTIxN0M5NXExN3psMGc5Q2lnQXJtUE9jSUhaZHdZUHBwdVQ4?=
 =?utf-8?B?Q1RqWWlxbXVPd1JwWTkycFBKMjBXMTRXMkNzWVUvSUFrellGM2NzZXFWWnpl?=
 =?utf-8?B?ZTF6d2UzR09JenQwOGlKcTF0QU90eTJlYVZKbTNxaXo0aHpKcURKdTljQ080?=
 =?utf-8?B?ZWppZkJjU1B2bFA4dXlNZkl2d0NmZ3lVSFhuWTRFN3gyTlA5UDBabW5EM3pC?=
 =?utf-8?B?RHRCQzBSQktMaGIyTHBMV293Sk1STUdOdGhtV09VZW56S21WWk1ESnpoenRj?=
 =?utf-8?B?bWN4YmRSSXR1ek9maXk2RVhxb0RKbDZ6RHJGeVgrdWxMa3cxZTZEblFCY2xm?=
 =?utf-8?B?ZCtnLy82QzVoU1JoeDArTnJPWXVPQUJhL0h4NEQyclpwTDJoV0ZORDd5NUNZ?=
 =?utf-8?B?TXZkN09sY2NlRkVqVHp6SFRFSklmRW5YcXlmaVNMTDZvcitheWc0ZUNCdFZx?=
 =?utf-8?B?elZKZkRwWDFveE44bGxuZzhJclVIZGY4RW43dGZ0ZTBFNXhFZTVNYzdWTHVV?=
 =?utf-8?B?dVpSTmE5bS9zQ2pXaERCVlZvWlN3Q3JqVEppSVBYWStXM241RzlkM2pvNzhO?=
 =?utf-8?B?Y04zK283OHZwNW93d3VVMlhvaHlaYjNoQmcza0pyMllvWHZiRDdTRU1KaFBM?=
 =?utf-8?B?UmtaVmY4RmE0ZFp4dUQxcE5md0dFWHFrZFBvaDBQTVViUkVwY2dxblRiMGx0?=
 =?utf-8?Q?4dhCQc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:02:14.7606 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f647c1c-49e6-427b-641d-08dddbb084fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284
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
index 7d7df27535c8..0056c77225c2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -867,6 +867,59 @@ static void __drm_3dlut_to_dc_3dlut(const struct drm_color_lut *lut,
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
@@ -1420,6 +1473,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
 	const struct drm_color_lut32 *shaper_lut;
 	struct drm_device *dev = colorop->dev;
+	bool enabled = false;
 	uint32_t shaper_size;
 	int i = 0, ret = 0;
 
@@ -1441,6 +1495,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		ret = __set_output_tf(tf, 0, 0, false);
 		if (ret)
 			return ret;
+		enabled = true;
 	}
 
 	/* 1D LUT - SHAPER LUT */
@@ -1472,12 +1527,102 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
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
@@ -1649,6 +1794,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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

