Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78DC5FB64
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597D710ECD5;
	Sat, 15 Nov 2025 00:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rPt/7Pdq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013029.outbound.protection.outlook.com
 [40.93.196.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA8310ECD4;
 Sat, 15 Nov 2025 00:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxX1XcXAmCmeFKLM0u8Yc+LgpoEr3dbh6plqtkeejhYumjOaDvzE9qKdxiCt8iupQo58Gh1zhddDaPz0U8jk2h3JDpyavfpNm86N/KxiGjTorLHz9kffLgobrBL5H4NKiIFW/rAw28NIDtQ+PkK0FbkmXKn4Xkgu04RnFWVh7bbk5qUA5rXXLGkQcFZyhSTEpkmKc00f47gHD8gFtr/GxXCslN3NgNUJrALfYQd26Eoe3LxkcKVYTwuqQpdfxdBXIHMQOmMQFibzTwZcLIEMczB5C0XK4xffQU5mztIICEq9Z/ks2VBVrrS6nR338ZI5z58akpk00ioJTKMGPJOGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cBOr4IdNQ0wNtiajllSIb3nj5i8BASxNJXlJbxucL4=;
 b=WxTZu66uVdegaSikHk3BVbvNF13kuSVX/EsWTCjfhPwRHZ1fK6YTTqqjHyFDnI+oLcopaKsEBxVCMdZRPoodnExmyL/Xl4ZlpUYm9XIx34v3TgdUt2LR8G0PRQGFbghp+C/s76GILs0tkGk1qJpceWr8Dz32RF1Mnn/dNrEWvDaUfVKmtznuwgNSSObHbfs5d9CbIzZiKfhC/vli/Xfkf1L8wu7HKZ+vbLWxz8+W9C1fJVVTH+XOBplsgFm1nicSjExar5fGalA06Ja5yJKT90j7zpa6B6yJ2wMC0AOy1C2jGQaupNW1JyV0oJwI3oUabAGNp4/aTOGhItagl7ptkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cBOr4IdNQ0wNtiajllSIb3nj5i8BASxNJXlJbxucL4=;
 b=rPt/7Pdq5ZfsJj2PSFpEXIh7+Q9ELLGrjAad2Gmw8TdKh/tXjaukxeP0VlMY628j/r+DrJel6IiiWlikoPRZClU/gSGfNUXpU0HqNXH3d12m1d+2zb989amv+bKgzBs/g4qG4QEv56+dPDkaELG/MDaP1P841bTo39JMa5ElnSc=
Received: from PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::9)
 by DS0PR12MB8271.namprd12.prod.outlook.com (2603:10b6:8:fb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Sat, 15 Nov 2025 00:13:35 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::28) by PH5P220CA0012.outlook.office365.com
 (2603:10b6:510:34a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:13:34 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:13:31 -0800
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
Subject: [PATCH V13 41/51] drm/amd/display: add multiplier colorop
Date: Fri, 14 Nov 2025 17:02:06 -0700
Message-ID: <20251115000237.3561250-42-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DS0PR12MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 718bd413-3332-4bc0-a0d3-08de23dbd112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sHrgxFwJoGK8wxSWQLRnmSHyoZTr87FKSKqqXtCniF7q3Cq7LkUhifGRVs7a?=
 =?us-ascii?Q?5rkefX1M3UKhvPsjwFtzQcrIFUphyCNhX0RGcXal1APtI9lkTLuKdulhcgKC?=
 =?us-ascii?Q?DtDo1FYI68xuOVp0vk43qs2FDTDvf/OWkFQYzVmDenqVT42T9PNqISPNWsEK?=
 =?us-ascii?Q?ldLmrfpsu7hW7Nc79kewCOFCUmkkt8RJIcSIttbpmJlcuWhigY4XVmkrclcw?=
 =?us-ascii?Q?8nG2IsoeN/t+sIgy086DCslu6ioSlfjUKxyQ7rEy0SZlFCU766/mLUR6JfxR?=
 =?us-ascii?Q?tn+WJuhuYDC8Y62ZSwDd9nxikqMvKzinrlx02VQXbvINMWQ+W5xu5kdzkXCK?=
 =?us-ascii?Q?6rUqUeZEkbo0qUnsC70iCOwp+3q5QTx88LvOkLOF6ab6yuPxpvtgi3VeJhty?=
 =?us-ascii?Q?6YVDAfB8KApZbEQ7jayYZAebgTIisGefMESBKY5b5jDPqsPD3gqcFVqsp4DC?=
 =?us-ascii?Q?souTuUw8x0m3L6hvPGMgwP6Ru1rKqCWK7iuTZbAwzQqblHNJLB4bGl5YhWhp?=
 =?us-ascii?Q?9JFVbMXblnV41wlcZIVFGnYKLEj9bPCKXkjKGmmBjKMefvHtmp6fvLosZt5T?=
 =?us-ascii?Q?uf0YNk2hZoXf+lMSkSQBBJWylGdyGsxy3wtQS+3E31rT5y/7b0vus3RhgL5d?=
 =?us-ascii?Q?1r+M0HucbBRqjqBQMsedRrvbCzsSD7fnBO+8v6Z9QvsYtXxiQUrGmN/E3pQu?=
 =?us-ascii?Q?P8YVypEFdt7PBtoRdDMuzWp43JfoVoFni6FdRa6o5nuYmAKoJbw46HCQHG0h?=
 =?us-ascii?Q?oQOQp8fqZbM6FvTsHQI3UpX8qW2nmaqlxfJTlRx9KfSDthRe91vWUdSxoS3O?=
 =?us-ascii?Q?iovfyh+4JErNbzbx+cvIc6EPV+qeNmFa3cz73CU7d4ipXGhq+3zknjpH6Oxd?=
 =?us-ascii?Q?Aj5016+5ajZYTxYC00g+5mlE6rrvgiMGiX4PbiO7VR3lWnKpZFq0MIXM54FN?=
 =?us-ascii?Q?IREmzEGTuu3WkqI23EiXIAZptIMutiC/835e4z+1wWFwkhQnN6Lbeq4LCQUu?=
 =?us-ascii?Q?fnINXijfukpvnxOqQC2ZexJkAkmznbvwXAv3L8YDQb33WcSa4qAZsNxgPkmH?=
 =?us-ascii?Q?1uCR9VRI0m2rkqD/LyQJen3GXseIydCPqKX84rVQGEB5uhlwffaRaS1fmS0o?=
 =?us-ascii?Q?QmObagejigq6CFAqjn7qgL6asyA4JW9ps9Qzu0t03NLnbey+m0ZPvB7L4tfd?=
 =?us-ascii?Q?xJz+Nkg8hqvdGHwjkhuqSax3syjqHM5uPBQZvjpD7M/djsBLigSFWAV7vb3t?=
 =?us-ascii?Q?fFVdjwG0Gmb2lEX4aZLYiKNs4/60L7fSWGsX2U92CvEMAESjbuFsQ++tjt4T?=
 =?us-ascii?Q?u/IL0M++02o4YJMy7YD9cCOUhWYyq3gbJqH0ZzBX51DW5N9LnKW+dilwdp9b?=
 =?us-ascii?Q?tlPnYc8CMNBvGdRLvR4NayhGZ22XA0pk0UfHOcm7NcMpX3ImaAQiClGab6sz?=
 =?us-ascii?Q?E7qGcBihfDsCeFcYA5PSD9SC7xcC0SzId7JRXs7RCYlbFw5ovL4AvsYkuz53?=
 =?us-ascii?Q?dSJgMC1I0a2xvuyS7F5FhQ+PkcvZ4Sve56HJQXlwL+fM3+IR4terOP5GB/Vq?=
 =?us-ascii?Q?lTLbpDqCnsTEDIgCP3E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:13:34.4783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 718bd413-3332-4bc0-a0d3-08de23dbd112
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8271
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

This adds support for a multiplier. This multiplier is
programmed via the HDR Multiplier in DCN.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-multiply_125
kms_colorop --run plane-XR30-XR30-multiply_inv_125

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 3x4 CTM
3. Multiplier
4. 1D curve colorop
5. 1D LUT
6. 1D curve colorop
7. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v10:
 - Remove redundant DRM_ERROR(...)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 15 +++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 298f337f0eb4..751e8e2b0c4f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1419,6 +1419,35 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+__set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	int i = 0;
+
+	/* Multiplier */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_MULTIPLIER) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_MULTIPLIER) {
+		drm_dbg(dev, "Multiplier colorop with ID: %d\n", colorop->base.id);
+		dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1633,6 +1662,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* Multiplier */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no multiplier colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index f2be75b9b073..888494d17509 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -89,6 +89,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* Multiplier */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - SHAPER TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.43.0

