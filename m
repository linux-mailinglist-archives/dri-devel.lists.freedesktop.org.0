Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B40B2779A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C350210EBDC;
	Fri, 15 Aug 2025 04:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hmyrfuKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2FF10EBDC;
 Fri, 15 Aug 2025 04:03:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfm9Nu+1AUvpaJgR3XtlKaw/8v1W4cEpQ2rgqb64POP7P6uc/FDTH6bPpYx3U7RmuMrAuaA6DxoshF+b/wVIGYqAwNgPPLYd1slUwviv8xFADRYj9xhIfVcUUqtxit9xZYSeXYxY8FIx/Yc+EMBQmPDw1NRTa1jI2T2HnkKo1xMAaTIQLx6law7UhydPIv0M+Vvjl9cmRe7jxqJ2Cqdd9i32xtD8nolgDFNoBF0AVgsGw4i0m5zPKl9OArZslSWzsUjcqgaz5iyG6SD1AeG/VyqMValesqso19iLAedI3VUOLKmL6Z6ynbjsdQ7N9gD4kxPusfkX1tBmgfj/6nSSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BWtlTJq5hqxbmd1whVKgPMLcFlZVNqim/I3te4okHQ=;
 b=w5MRAnBVd4dl9/MdM8DHPlfSwN9iQJlvc9FpU0WtyVL2s31k4uKRnbZJHKqRj+HZmjphtAmiIRMOcWSw0NiKaMCOiNcnsoJF08rC6gP20zEhxnqF++mDiDNwsUzoC0ojRQgnUxYAOxZmSmRCvhqyU4UuSlKEL3meEL4ClQPLD1ajFMXJyrM3ekFVlgB1JaF7Y6ySmenRZkt4/2PTGi8ykqKPH+AJloJUv8NA+FFb6GbF/fJALXw3IdXhXwlujvKbuPuNaVCDYJ2jzDWf4CCaOp6kz0TD0L2QGL0Ul8CN7p5jUcrT39yJslMBWQGX+X+z5dWk195sJEJK4Rg54kgjTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BWtlTJq5hqxbmd1whVKgPMLcFlZVNqim/I3te4okHQ=;
 b=hmyrfuKbaTYUNB5OcaeEgn2pRWdOKhduvNkKvFkqperOHqrcpNcLy/cFrS0wokXnCnQXydWjKyRXyB8d9DBdxSHdruSDsGfc6YWRWO5p5KzseeYr5Voh3dCW9baOEx0t1HOFzaOwhNDQ6i6GlEkzJmf1gvGBu5GDYEsk+xG6KP4=
Received: from CH0PR03CA0090.namprd03.prod.outlook.com (2603:10b6:610:cc::35)
 by CYYPR12MB8990.namprd12.prod.outlook.com (2603:10b6:930:ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 04:02:58 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:cc:cafe::b5) by CH0PR03CA0090.outlook.office365.com
 (2603:10b6:610:cc::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.0 via Frontend Transport; Fri, 15 Aug 2025 04:02:57 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:02:54 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>
Subject: [PATCH V11 47/47] drm/amd/display: Disable CRTC degamma when color
 pipeline is enabled
Date: Thu, 14 Aug 2025 21:50:36 -0600
Message-ID: <20250815035047.3319284-48-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CYYPR12MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: a4886b81-f330-4fd4-9b75-08dddbb09ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rv42tC+b80I+efEaT6khsvt4Csx0sucoln2tci2vyuWPaZwYnFosxFb2mSww?=
 =?us-ascii?Q?gKtBVQLmJwDoVGZSfYtrs+dvDnCN696GaeFU57bUo/dND8eCcT8rMJFPV44X?=
 =?us-ascii?Q?Di2ehOHtaCIvNY1AvLoIg5hg11yCsKhA5ZJCjJ88qS79RHpLH7BP+Q9dP7AW?=
 =?us-ascii?Q?PFIYgSQS6K8SLbYysw7vqhUNHqAfUllyYRktCt0/+h1ASF+JgFPBs4X4I/NU?=
 =?us-ascii?Q?4O1BRN398RRgWiAdgdgSfSPGZFyjtOh4exdzjqiQaBR/yFWl9k7TZbbMezHs?=
 =?us-ascii?Q?Rb+8GVXnkG0Kk4YHo0qx/YnR5nRf7Ak/U+tV58LpSANpRZ1Z+xNtynB2agtf?=
 =?us-ascii?Q?PAOZkJdCv85McTpZXI/i6GM/SCwa7Du2IqVYHmFWf6/gUYS8Bpztd++Wvyjs?=
 =?us-ascii?Q?Hxh91KF7jOcmn5vx/L2D8TnLVztyPRJCTrKE+SGDS3DqAM7jnbZtbSzXmehH?=
 =?us-ascii?Q?I4CAaBa58REk/Vob4QBFe3hapfzuaUed34Ls5s/BVk9gDEEBq+/ei7smw7Gl?=
 =?us-ascii?Q?ws0iuuS3GrotJT4IfYyOUVAkdhDAvyV1PP6EUD6ZjN7NKcsfsJjCDfTjK1qE?=
 =?us-ascii?Q?NfivW4dki4QV8t7BOGfqxB/OQJAD3Twp1fjugd1rXPp2jWXBiK46kddhZ537?=
 =?us-ascii?Q?0LIHvEm4605p+EMGxcUQ0yZ1Wg8CFB3fSL9kWI55O4+d7HBwzG6tO7IIi/IJ?=
 =?us-ascii?Q?9n76c4JFplW0tLj5plXRd6ybcZkXZ1YdAOkb5xqHXVJp0XJFoNG7Zmuthg7h?=
 =?us-ascii?Q?yRpb8fK028O557XjRYF5NMHB0Xa0KFbTsNvYTs4g2ldyPY+ydrCWm//S8Ozx?=
 =?us-ascii?Q?G9URj5SCJFRnDy8WKr0MBE79lHg/WJolvzjdPYf/UBZ/mRcOj+EhYiOi7cgU?=
 =?us-ascii?Q?qBT7wT1fASLO3R0n9AEOYsZBVt41maTi/zd6EJfJFQORWmihERialRn4pYPx?=
 =?us-ascii?Q?u9C6hOr1ohjXFEnkK05UL2UB1yCe5viKS66jYNELcpeh2Fst9OSRCkZMnaVF?=
 =?us-ascii?Q?/Bntn2OFqEHfkUp16rVp4VKWeHLU46apQQyq7l9irsgS+n053SR5BJTT74iH?=
 =?us-ascii?Q?fkG1nXpHAlq98kDqYEF/pEatXCtZ0mjtlSsZDl0x7aVPNEmxfXfKNziReWpW?=
 =?us-ascii?Q?cKiCLu86RwGRwwRtKIVP0M/mGqnlzmVSwBant01Q30PInOZxLmbDvoQ+Gmbh?=
 =?us-ascii?Q?YVk9vYx/6g7otoB7EOMnasb9YQbZvxvIlb8/zd8m7HTpHRCk+oF/27/1JV1p?=
 =?us-ascii?Q?xq7jMDSLSr3DyxKezMAE0JwFtSmcHkz5F3AqafECvU3WLiVp+kNcvKClApqa?=
 =?us-ascii?Q?AoHxor3zgSwCz100/KKmS4LsO3ETG6oT6AJu9iq+gtapZ1PBJr+U/oVQNTAs?=
 =?us-ascii?Q?v8zC1ifwrvuKkewP4KYsD5YqRtz7ALQbaT7N1QGL17JpUt6a/PJkZxcASYtC?=
 =?us-ascii?Q?zK4y27gLfyIdTxfRPK0PdPQ2XRQz2RiP8dTZ0j9fbv4tgu9FhtqjXfVYoQmK?=
 =?us-ascii?Q?t9PGzUgYw9FBP0OSy0T1ghPFto3TbcfzxBCd?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:02:57.9965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4886b81-f330-4fd4-9b75-08dddbb09ebe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8990
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
index 010172f930ae..687892258523 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -694,7 +694,7 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 {
 	struct amdgpu_crtc *acrtc = NULL;
 	struct drm_plane *cursor_plane;
-	bool is_dcn;
+	bool has_degamma;
 	int res = -ENOMEM;
 
 	cursor_plane = kzalloc(sizeof(*cursor_plane), GFP_KERNEL);
@@ -733,20 +733,18 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 
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

