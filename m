Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D482FC5FAFE
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1742410EC50;
	Sat, 15 Nov 2025 00:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YVKpbDX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7976810EC4E;
 Sat, 15 Nov 2025 00:10:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3YniunUN2zm1gjGqmT7o9zghk7GoSPoqjqoGnuP0EN+HuxvDgJXFSctt6HwDqlQBCYte5D+Y24hCq5H3wgmSwF4NsuxZ8T4hz8fWoQLDX/JDkWG33WYAWzBDw1P6Etdtmvl/maNC5yDDwe+smcCC8IArwOEpxH0hDnO/WFC6h9hwgoNj1IqtT3BrEaz6HAjguD5BxXAcq4FIyykD2ErfG7ZG8vfYgpxTw/WT2yq4k9WpPhuGuuiY/qcCoxKImn9oK6RxU3Vo2B3c09jXMm3UzzVk1nh6+uatQeNhKO0OcpjjV3xQ4AW4viysibzlmPUghJVVIeKFeEgDpsgU9+vVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny7nv1YtFORs7hv8+bovEZnRhqLqhGBzX5hD50+FuY4=;
 b=pt+7cO4Pg3B7X/l2dXcRORpftrRm884oXF7rIwaM8keC44Tbs3Qq/EsPTOTFwLV7DdDgQ+7Z0067q9yXWCXeuxaf0gK+qS6udsK/Ze8Loij2ed1x9SwAE4qL/6OXJL+KQ27wLKHcOWpT1KYrKZ0Z/3nGeGL9c/zQEk4NHtEYFDHMjxFY9+4LpKjb5wea8eeeMBEAT278DxfNdQAmzckirnTMiCRm9fiLZLEk1qlPNR/kaOWR8EbfcLTVCv4xIZ93/NCXE+85SYo+stMOwUUaZ6eLJxtD/wYle/8vXY0QJuKvSC/g1q0F2MLdyHM79KOfbaor0a3GlBO2qUQr/dfGdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ny7nv1YtFORs7hv8+bovEZnRhqLqhGBzX5hD50+FuY4=;
 b=YVKpbDX59XKEuRT7bi874trG0IYg8j4OiWvchwiw0Ryv3BE87WGJwSkP0DDX8tqBOSit3zcRTXD3nGeck2gHen8jBbcBbcRULGLPaZav5lcpTE4Wh+i+7B0ptR8cggbvvynZsZC5C5fLIJT/Ef4iWQpVyr0ZdMAYd4cNnj0lALc=
Received: from PH2PEPF0000385E.namprd17.prod.outlook.com (2603:10b6:518:1::6c)
 by PH7PR12MB6393.namprd12.prod.outlook.com (2603:10b6:510:1ff::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:09:59 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH2PEPF0000385E.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:09:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:09:59 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:09:56 -0800
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
Subject: [PATCH V13 26/51] drm/amd/display: Add bypass COLOR PIPELINE
Date: Fri, 14 Nov 2025 17:01:51 -0700
Message-ID: <20251115000237.3561250-27-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|PH7PR12MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 869bd99f-8620-4e2e-10e0-08de23db5102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5XgYk1X1VZCvL2Ckw/Rs+wDTMrfKWrbN2XrTP7olLrdtNItt7J1ZxJ2MFcFV?=
 =?us-ascii?Q?ZNcGnludidWKv7HbrLQ8O3e/OFNeWLihfQ0iLHdk0xtlbkuaVaup8mf/nVA0?=
 =?us-ascii?Q?cBNgSB+5W3YSlpAGkvkBmkMgfai5+EfKcMV1TAmFQ4N37Qy9xNOtGQYDtFmQ?=
 =?us-ascii?Q?5X2LCRQVM+D5PsVf8qLv/bTOZUHBpo/U4SD3xHczUp6w0o9d4cuVPzrz8mWK?=
 =?us-ascii?Q?EipPFDt/KuwAnYA29NaZmrTKEWaJ/mS+XzPCvTS2YcgTKaF6ChKypqoWN2gS?=
 =?us-ascii?Q?8M0x0921Jk/l/556y85JLbNZ5nJiC0Cyr8k0Jd2lavvb1Jd9dNbvYAmO7Chn?=
 =?us-ascii?Q?7zZIUyXZp5H3VxxJA6140W47//zWRNnh4KbBSwGJpJnf2VSZ8p08MuX/4oQm?=
 =?us-ascii?Q?tj59nWCdWQdBaN81dvpeD0DuTRRWLKa1nzT1zWTthGPGub6yYyHkyv9Rt7mS?=
 =?us-ascii?Q?vBkT4urQLanb/Oxp4MLSwzT8qoWwpDX7zbysXLR9GJjdDMjTXM1lFrGxdsYZ?=
 =?us-ascii?Q?JIjKmY4iAVpobqLIZ77sHksBk3ch+d2V8wNF0n2o30YNu0oh/YFzn0hi+rKR?=
 =?us-ascii?Q?z47/AkoH90z8EWaciA3ShZocoMF2OeX3civpFkYbHhI78wZjeKKYFYrn54LN?=
 =?us-ascii?Q?ed9HbegboMRdDK1eIG4V6tHBwPDLuLlsXod3I/Q9OqoQlM2AyMUI0lKTz+IG?=
 =?us-ascii?Q?cOz733kgmV0S0HTHmkVZOjNJ0PObhu9DBoPKJ38aVEHxA1TXD93Y6GrDVQew?=
 =?us-ascii?Q?0w/35afmkZR1JvBbhDJDPYy0Tb9bjtQvoZkVeDjfyp+++KWR75dZWslJw9Q9?=
 =?us-ascii?Q?r8WoeiKSTzKwjLrX3if58dKTd/yCp+SieEJovHpAthZ0JpzLUROVx/GW94gR?=
 =?us-ascii?Q?VVC5mw8YGe9zauH2rA4qyjfGjhsGJ+8zIvTxL18ClO1XIK4ChJ1OKxWTmpfS?=
 =?us-ascii?Q?+UYN66GHwR/YaUxsSoTBPEhkNGQXdrny/qyk6baElnWlnBTCdUVGR7b+5jT0?=
 =?us-ascii?Q?/PIAtXDReh8ycV9ancn+93GG7mF9e8IM93Gyda2A9ZWIR15veQ+di8OL3Ser?=
 =?us-ascii?Q?yxEh2iqoYcxTVdKbpEsIlR26mg56aLtEPmOOhhzD9bGlgU4fJjlecAYJz2X2?=
 =?us-ascii?Q?RF4Fp5yDgbvBaVNa9Vpwp/VNSrznU/fpionVp2PCkFuNXGyoEd2vqO31CkJK?=
 =?us-ascii?Q?MCwrq9aqsDBDAw9qstVoIUcBqCDaNllCBxBINYc6m33bVgch9wPryCEx/nyA?=
 =?us-ascii?Q?wZwWuPoNxaIqUDJFvX34pyqJGhzgzAE/hPiv8lBYLgD7f6ndItDqppFGVLgF?=
 =?us-ascii?Q?yEZ66u8fMIiTn+IwSVKAD4rBsJ3iTKlYiE3ZeYgMhJwun7mPxdyAgKSTKAO2?=
 =?us-ascii?Q?A/yDsaWNXaGX3nv8iDVI6/r4oq6hrVhcZ4yB/ZV2Gtc7r6bPQKivqv9abL3k?=
 =?us-ascii?Q?wtQxF9L88A5we6s/9P4pDHqg1HNDC/sY7l4m77VVI6A39Q9lUU1W95Dc4C/e?=
 =?us-ascii?Q?1pPZNism+f0dX3W28m0aH9CftP7Hird3jWz0uFHf+L3NZlNU2QOMiJgwHT3h?=
 =?us-ascii?Q?WOaQAP2tRsY6mIjBVi0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:09:59.6214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 869bd99f-8620-4e2e-10e0-08de23db5102
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6393
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

From: Harry Wentland <harry.wentland@amd.com>

Add the default Bypass pipeline and ensure it passes the
kms_colorop test plane-XR30-XR30-bypass.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v10:
 - guard "dm_plane_init_colorops" function when !AMD_PRIVATE_COLOR (Melissa Wen)

 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index e027798ece03..877fd221c81a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1782,6 +1782,21 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 
 	return 0;
 }
+#else
+
+#define MAX_COLOR_PIPELINES 5
+
+static int
+dm_plane_init_colorops(struct drm_plane *plane)
+{
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+
+	/* Create COLOR_PIPELINE property and attach */
+	drm_plane_create_color_pipeline_property(plane, pipelines, len);
+
+	return 0;
+}
 #endif
 
 static const struct drm_plane_funcs dm_plane_funcs = {
@@ -1890,7 +1905,12 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
 #ifdef AMD_PRIVATE_COLOR
 	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
+#else
+	res = dm_plane_init_colorops(plane);
+	if (res)
+		return res;
 #endif
+
 	/* Create (reset) the plane state */
 	if (plane->funcs->reset)
 		plane->funcs->reset(plane);
-- 
2.43.0

