Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B2C1E4EE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB2310EAB4;
	Thu, 30 Oct 2025 03:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qe1Wp0sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0BB10EAA7;
 Thu, 30 Oct 2025 03:56:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=In5+DHR1sE+w3XiC7nuepu4oe0+PlY4hpu9hotsH5ru6PoQM9biSEhrWEFuAHHooW+safEXgIw9FPwzTNTg51TwFeFPqdf25u8AJqfgcPVYehFRLl7YN1Bfn55VfWZKbW5lcIUNEHukdcL3fXbEV/focioW4hS73uH9PVUxPYFj7zLUgJgKkR1FBBHwSGrcsGGQdOUsXEwo5/NpyUElbKWL1+85iuunLxsuDRw9ypllpYC5xJ/rETybYmNCmaxXRwL3ssRNq/atB/pjxzme7KCtRVQCQhLo7xumK6GDRCU8YkE65A3cHZPgtoUMQ9I83EWqXhvk78k9OQZJPwC7k6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCkS7oQiTSCzNMjJh1gomDpYULz3d3XSAITz5gBaAlU=;
 b=fzm01WPFtGZpi05HM8FNJamAfc2bUwsQ+C1g4FC/ca7iyFWeMsYsag6doK+qFhwi/YFPROe9AXb7PpYJDVEx9QsWefv+AKn/xBSsqkJ+g4D+s0Bszj0ixrVBu304O2Auv0cMeMW5UFAGZ29NDar5cePaXFXerxF6F0j4iKOGUUMfMZTn4Pfc8I233XRSivEqwvT0DNXwwkgbwBXo2QYXB3bjv0aP0WonZ/yz7CCK7eRcHDyac08nZvAbWO65ZfSmXNpcuv5amT1E+/Ta/I8fQS7Y2Ci9SMa5/M7Pn0tL05o8PCREFLju7Adi49c4wE2oHSLsKW4L+ZhlZQC4pf3hRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCkS7oQiTSCzNMjJh1gomDpYULz3d3XSAITz5gBaAlU=;
 b=Qe1Wp0szxjAJtlNNiUJ1hVVlIqlz5ms2gPPkMS+0zG/sUOVSkYoGNB4ZG9oVgcvZ//Y3dKTyh9Hi0b2BlGcf62UUHGe/IYUYszNrU4OpPW8hrJO/tOl+l0mwxVaWw4shOTbwNvHeTCXVgE+pOKHpbS1rQtqsHysK8hE4nk+rDSs=
Received: from BYAPR03CA0005.namprd03.prod.outlook.com (2603:10b6:a02:a8::18)
 by LV8PR12MB9690.namprd12.prod.outlook.com (2603:10b6:408:296::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:56:28 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::16) by BYAPR03CA0005.outlook.office365.com
 (2603:10b6:a02:a8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:56:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:56:28 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:56:24 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>
Subject: [PATCH V12 47/49] drm/amd/display: Disable CRTC degamma when color
 pipeline is enabled
Date: Wed, 29 Oct 2025 21:42:52 -0600
Message-ID: <20251030034349.2309829-48-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|LV8PR12MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: f9cfcefd-c59f-41af-2970-08de17684df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b6kPf1VDNWknYQ+GJU74ZELHXK2y1AhbfJuh/Obo+55SjH4MqqvoCBccE97H?=
 =?us-ascii?Q?0fRe5EdZOgaeJDd4scXos9nGw0vka9r9QhRXnwu8guh+3OpMjLevxyBxG0N1?=
 =?us-ascii?Q?qeKrvZ26n6AUKRR7hKEXd38MH51fBNSIbWBLa4994dT/Z8PQu1owHJCwPdJw?=
 =?us-ascii?Q?3h0uJmVxtyZ03QxYU4iqXIufiawZQuii41BXPAJzen+gt4/XTYheqZ8yN5xm?=
 =?us-ascii?Q?WG2o1ogbywY9z41LjAAnz1IN6XHNTZjIJ1IhpMbmK9x9mzl+fcYT6K+DZDYv?=
 =?us-ascii?Q?nLdDVnPXTZs3TAvaMkzKO/FSNI+fnV1yFEVZ3SJmcMKkQGcqWxAiKpcMwtR4?=
 =?us-ascii?Q?r+ntZ7fW3bR+WOqAFYHI4aM1e4m/9DdFKmo/LFlxJk5jmXOJzettIxDAEP4Q?=
 =?us-ascii?Q?6HDWE+GCKr6Uvmj2MtmUKWaudUDePZKmDjjrFg8R0MyuCPzzKj80R5HtMLFv?=
 =?us-ascii?Q?2xrHXU9IYLn+O2DcGhukUY2bsdiMcyPrrtTL4f51DXbLjIWnNl4UeeGiWV6Z?=
 =?us-ascii?Q?6I98cLh7r+V974uOorT/vd4IDjVPIw8V13t56cnxGOO+F9KHc2NQa8XcQPKI?=
 =?us-ascii?Q?MXxWpB1IPK/HUux4s2l+HzYkUdoxsZzSFcWHQBMh+sUzT/tkKJcjcg6ni1ba?=
 =?us-ascii?Q?hbbMXlgaLc33YtGwPfM1oD9eZEaEEi0jIYerBJQnue5/4KwdAwohXPCpP94M?=
 =?us-ascii?Q?esr35oq3FyV5SVwoYbnp+UjyYTkPwDIuMIWll3YUx/dUARfJFuDbt5lNmPBO?=
 =?us-ascii?Q?igQ/p37grcOk01h8vpDS+2uX1p1itmBuvKJ7uPreoY9RrJ3THIz8jJkg7JQP?=
 =?us-ascii?Q?Sj7k14GT5xVAX2CxYb16k90oO5TIXF6rctWx5InCj/kRw4o62cwMwl5VTctB?=
 =?us-ascii?Q?QQkgTCAQsLUv/DF65pFPlkjI/KYu7uvMJtSdheo7QgGBVtCdlv7uq6gCcBGf?=
 =?us-ascii?Q?OxUTMKOxM78rFdGUDRZY337cuprMyjvn3Aw5pUW8Ykep4z+grEK9kK3OLN0R?=
 =?us-ascii?Q?BqVrN5xxZAX79GDDzxCRf5PE8wnUmHHCn7EcxOFR8U8DidrEVD4J+9TtVRTG?=
 =?us-ascii?Q?flwvBf7fN3P/OAiOZfIYO1hoXqy1FezukEiEhsGpiCIuv9STRfvaX1IR4jpH?=
 =?us-ascii?Q?qrf1Pfr+EC1A5tiJqzPPYzmfLlzk2TGJhrFIYNoqhGXj8oRFKPLQ0MvlsCVi?=
 =?us-ascii?Q?qsCJk8uFkpp5jynr+0Rz/T08wPxwRwrfs5xDBT336pl/p/yoazHtfrCFvHKK?=
 =?us-ascii?Q?I7ho//9fDJkEl7foa4za/4jPzq5YQw+cOkcoKpx3OIkY8Hwj7shf+HKR5A/v?=
 =?us-ascii?Q?8snV94NnnhTetJF6TW+k+MH+7W8WOb6eqiyvbKXpOt7juEicsklz5N4gI8kR?=
 =?us-ascii?Q?ymn/9GUS3paurei0yFa27Q8AgLrFcRZEMltHjZda+d8iR0PfNgw6OUtYLOKD?=
 =?us-ascii?Q?9q91EhGkN8+jW+A0hjpUYkTMUmf0USYF7eA5OfYy2Q7up3OVCUMIIMOaBFBz?=
 =?us-ascii?Q?zrI/bNJWZT78Xmlpf2NsU1J2jwmVI/0+j2hgQLqcYj5t/OZpr9oI8r7c1K3K?=
 =?us-ascii?Q?qoXqcynWmtHWsgj7d0g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:56:28.3746 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cfcefd-c59f-41af-2970-08de17684df5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9690
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

The degamma is to be handled by Color pipeline API.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v11:
 - Merged enable condition for drm_crtc_enable_color_mgmt (Melissa Wen)  

v10:
 - Disable CRTC degamma when color pipeline is enabled (Melissa Wen)

 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 1ec9d03ad747..8d7fa1f80b9f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -721,7 +721,7 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 {
 	struct amdgpu_crtc *acrtc = NULL;
 	struct drm_plane *cursor_plane;
-	bool is_dcn;
+	bool has_degamma;
 	int res = -ENOMEM;
 
 	cursor_plane = kzalloc(sizeof(*cursor_plane), GFP_KERNEL);
@@ -760,20 +760,18 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 
 	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
 
-	/* Don't enable DRM CRTC degamma property for DCE since it doesn't
-	 * support programmable degamma anywhere.
+	/* Don't enable DRM CRTC degamma property for
+	 * 1. Degamma is replaced by color pipeline.
+	 * 2. DCE since it doesn't support programmable degamma anywhere.
+	 * 3. DCN401 since pre-blending degamma LUT doesn't apply to cursor.
 	 */
-	is_dcn = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
-	/* Dont't enable DRM CRTC degamma property for DCN401 since the
-	 * pre-blending degamma LUT doesn't apply to cursor, and therefore
-	 * can't work similar to a post-blending degamma LUT as in other hw
-	 * versions.
-	 * TODO: revisit it once KMS plane color API is merged.
-	 */
-	drm_crtc_enable_color_mgmt(&acrtc->base,
-				   (is_dcn &&
-				    dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01) ?
-				     MAX_COLOR_LUT_ENTRIES : 0,
+	if (plane->color_pipeline_property)
+		has_degamma = false;
+	else
+		has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch &&
+			      dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01;
+
+	drm_crtc_enable_color_mgmt(&acrtc->base, has_degamma ? MAX_COLOR_LUT_ENTRIES : 0,
 				   true, MAX_COLOR_LUT_ENTRIES);
 
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
-- 
2.43.0

