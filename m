Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E39C5FB91
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D415D10ED1E;
	Sat, 15 Nov 2025 00:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HHK8FHCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F1810ED1E;
 Sat, 15 Nov 2025 00:15:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvMRPgriCWd0P3UtU9z8n2p+9E/Hn/Atf5EgQIwURtSU+Zkz7/Hw6WNLMDaj1x6mZA4KHQDcaMSgSkcBuIKdUjJi6lGpYzzfmJIabX6C0G++LQXMnBz4FwG1NguQXl8NSWMhj/esmh74zMo+NXsSzIWkMEwiiNa98LqYEAuPZLjSiu4uIQv5IH/7vVSRtilX5EZNrJyusAmlP3Zdex5X5m1U6I9KEo81sjglAhNM9IKUjj5YY+r34qF2xksaTfsTBKORnlEYSpUGc0c4zdP1Sn8R6Rx9wBQlXZA7v0aj3YhdNPVsPfK7yyZ3vpiMZ232Nmt/Q7OhoovcX8EydGU+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8gXwO4Q4AWMZHbOaI0gm303xPHR9Vb4RRKaHgIQNW4=;
 b=fHQ2a/8p3WPT9O1yDqmAIz0QFpidjKXVM4opYY1H427jh6plL6aDemB3KnmjOyF17IRqGVMwHRTrYl7XUOf99/azR7ZdOv9Hy5V1bDM/zBWIrDbVX8IbM7GuyRdLQq0/7lqmwGmWWOStKJ4DVDpfKReXzCIfxtMpyT2k/XZvgFwLbsaIb08xAEaKib7n5JfTZ+PQZzHqRQKTa/WjvV4t2+lT6MK7h+6ZE6Aa0nOMCO4Euu9loY0pegh7mBsG053TeQCVp2gZXVXx3HFIgEWc+LJ5kz/jvRTS25PybrGNe5zh+hjY20U3dlR/bHMVcaUrnHMLfWzKMzvl8nTmtI1LBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8gXwO4Q4AWMZHbOaI0gm303xPHR9Vb4RRKaHgIQNW4=;
 b=HHK8FHCacLtJCZ6BNGsmnzNvBMyF3pFSpUl1z/NKjhH1tjcNnwUX8CafTBkPwn/JbV3f/C2BXsUhGoqf+ykz3IyARpMA0qQL+7Vs9T9QyXQCJ4/fI/SFyiCeZ5M8SVgt1PA5/zMtAbiFt0pWa8Imsqhtbx+WAlllfFAHhDOE6LE=
Received: from CH5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:610:1f4::23)
 by PH7PR12MB6978.namprd12.prod.outlook.com (2603:10b6:510:1b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 00:15:29 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::c) by CH5PR04CA0023.outlook.office365.com
 (2603:10b6:610:1f4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:15:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:15:28 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:15:25 -0800
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
Subject: [PATCH V13 49/51] drm/amd/display: Disable CRTC degamma when color
 pipeline is enabled
Date: Fri, 14 Nov 2025 17:02:14 -0700
Message-ID: <20251115000237.3561250-50-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|PH7PR12MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 86548009-4acb-4bc8-3baf-08de23dc153c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kIsGo8sIzp2y1MtvcCV4yMWuKE9Eo94XgxMMiyuIrAAM53nM/rj/NEl/Ey1u?=
 =?us-ascii?Q?kquftG6fTFSmPX53RPPr/IPW7PWdRl6+oU3tqm6JpsxtI6Txo0v4wgP4/6Nj?=
 =?us-ascii?Q?sOXeposaoGgYkCcrRVYO6IrnVRB/QB9v5ZclW1f2wmNQeLb62DPcUDI611/P?=
 =?us-ascii?Q?4d6l99LghqFdHEU263Otea3qCHLT9GyHTEdkxg1RhZA2+GHRb1oQtp/Tmaj7?=
 =?us-ascii?Q?+L4VHhP6gFvBzWpCl4zn0zTBW7KGzVovh9YWFTzR68fheE7Op2qyIe/3kKOK?=
 =?us-ascii?Q?ZCHu1r9zSTJOJUCCqnBNdJZIT1rZELf9WXEyV9euJ/jxNOxGFFAqi+ui7SKh?=
 =?us-ascii?Q?55UYm0ivHNZkyIkAgA+laYuxQaUJZnzPwrmDiepSvWCWs3jrfrxPEUVPb5Z7?=
 =?us-ascii?Q?DAEYTytAJ1VytVyqhSLZp1hTIn+X6HpWwJoP+I6agmoq4mgPqxAGxTJFAq/q?=
 =?us-ascii?Q?Vlj9CJo4i4k0EwcgIqe0D3o3a7LncfF//3gDguVo5+d2H8khm9ctQ6mPalsG?=
 =?us-ascii?Q?p9yEmmFRt+p2VwHtLGf22axYsdogdLOR7qLVcOABiBli3MAXVa8G0q6eKgJk?=
 =?us-ascii?Q?Iior+CJ2ct10M6mzF0M8bUBF5MlTWnzARlpPpmIqtoTLcP0JPfOn8g3qQqkO?=
 =?us-ascii?Q?BMc3w35nSGjeQLxegwlJCHcFUDVjfq86vmL7AApMAuK/XOAo4pqPo/cf01IO?=
 =?us-ascii?Q?+K+3R6100HqaQjygG3FFY3enw1XhSAMmFMm2adoe+8ddw6rzVyE2MZ1H0kUy?=
 =?us-ascii?Q?m0ri+0H4Kt1oJSgP/MOqHh/N9oyMSm+C7tICVYZO0sOzJ4E5O0wMHmDsWOS1?=
 =?us-ascii?Q?Mh+uEPy+aQB8i+jM7HU1VOoHl9w/yvARqxDGf8o8CRow7ckjwlAgUp3STwWy?=
 =?us-ascii?Q?Y8JngwNG0ChjATQPL7LuKDSfzNoXJ1+JzLoRNUyoeeDEciyiu8DFzSSLWLjp?=
 =?us-ascii?Q?7LOXUlfgdbcJH4LVPZriRtfJbxIkbNGKhvm0Fy6pqCJjiS4Jdq5o7GKqx4fc?=
 =?us-ascii?Q?l+BF0RBhtqMBM9HuE+Ov8H3+j0gEhUe20N4Cqo65T1a8x85Ip19j4GGPNBZl?=
 =?us-ascii?Q?ayxGFQUAY9ryMIV7iePOq6Gx9eel7UY5ETc/VRqO6SEwFkBHdToU/D6Dgcap?=
 =?us-ascii?Q?gRoQNyPMiWXbPTbOcPVNhSAGCIy3AUcvVnFmDvLWTw/3Y4rT1T7r05Y9hwS1?=
 =?us-ascii?Q?QKdv/cUL+N13McK6a7uuED4CBaRkg6lZJkojeYDRbnT1XHYOeQExObTx7aAr?=
 =?us-ascii?Q?MQNOdl5G9wSy+eElro0Hu6xQKDU8fQsaJKfcYz2uS+/N2vfG6QgIrIS23BuH?=
 =?us-ascii?Q?vm5VWF8b2nhpWB5RsH+Lqlmf7z9cdGIOxO0jPWCeyEpnm3/Jq6LKvOhfzw2c?=
 =?us-ascii?Q?DkAbLZqK9VZKsc6rGk9TvZV04wbjThogteU2xljOOy6jcrqWlEaMs457zy7v?=
 =?us-ascii?Q?RE/NVCBy64Ulmcx+EZc5fqmEpYcVMBX2V2VCUhZNcJxkkGHnLidL5Ypeo0dG?=
 =?us-ascii?Q?LtF63hIEOTKq5rKTLbygW8/wO5Gty/z328fX83yhJR+YmDywnRudkCAE7DlE?=
 =?us-ascii?Q?XNEoDNPQGjMdBL31ESE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:15:28.8500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86548009-4acb-4bc8-3baf-08de23dc153c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6978
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

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v11:
 - Merged enable condition for drm_crtc_enable_color_mgmt (Melissa Wen)  

v10:
 - Disable CRTC degamma when color pipeline is enabled (Melissa Wen)

 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 38f9ea313dcb..697e232acebf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -736,7 +736,7 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 {
 	struct amdgpu_crtc *acrtc = NULL;
 	struct drm_plane *cursor_plane;
-	bool is_dcn;
+	bool has_degamma;
 	int res = -ENOMEM;
 
 	cursor_plane = kzalloc(sizeof(*cursor_plane), GFP_KERNEL);
@@ -775,20 +775,18 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 
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

