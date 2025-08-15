Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38394B27776
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5E210EA8B;
	Fri, 15 Aug 2025 03:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Vs3TZ1k8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4799D10EAA1;
 Fri, 15 Aug 2025 03:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwVgJ9U1yQ+9QZcLq46tiCKwchrngHtHFtsBE6FSmjjN7kP9a52fpgGBVbbENv5pmpZSVqDf29qEEJlWlRzsOU2QPAHhNdKDRvnNZvKr/RsDifWtpofryFRdrqYM132NTEfbu1uaApeM985dRLA4PjNgYUSI4tQNdnYZ3hmOWECJtXjZTAK6Qkdmmx+F4r2qV9xhLUuCVhhIDpQSPnFsA8++fQPWrCof2BlBCjssbs/gdHJnOzBnBsWDlcEB3arzJhvgssSp1cFKAAAYlv/k6rChLtV+S+yNz1n8aAuPI2ZUv1PPY88URCytT2LCWrTL/ebVKyEcaGQRgz1LMrtuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FY7P83lUJ03eAV2MXp1ka5HjiEOx82/5qxcgvHljxFw=;
 b=THvJ4BMVDJqj1g4n1umat2erMmbqniYTSLFuZCm/56e4MexuBX2r0fhThzROdHQVbsmu6KS+0KpqeyulWkJ9ikL1C4Uez7+CnIYz0JRpsLpgI6O/768tvfG3YeYpoYba65zJV7YfQWhRq1EEPR476BngsITqojBq5kKfeTi+RgpFzx5g1txXpmnERV9FAcF+Oxv/0qLh2ZQo3ebdcaBrcZfUXjXhnfYvkNbdzHZ3p5ehHQUSbsjw5433KpvSfKfMTBltVhj4FLx7tpZZyOovuX0vX0lWrmvOfWNzfDemHI7/b8MnI15R+pc31HPTfnLX3WjUSTLH0CmIxbz7lsDeig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FY7P83lUJ03eAV2MXp1ka5HjiEOx82/5qxcgvHljxFw=;
 b=Vs3TZ1k8btpIcgxUweb/mbI+67E1/KaY7n0CPeIx2nVTl30kCh6K9t4WkG8nhZ7YRrxC7LTQfQ+Wrhej5NuHj2mf9MsxlOkoxz9EAPLEjD2IsJJpjfQ0Yd4sdSX/FsV0k5ZtHCoGYYctbISvSciSckZEQD6rLzgyg/cIPnrxj3g=
Received: from SJ0PR05CA0028.namprd05.prod.outlook.com (2603:10b6:a03:33b::33)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 03:59:22 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::f5) by SJ0PR05CA0028.outlook.office365.com
 (2603:10b6:a03:33b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 03:59:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:59:22 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:59:17 -0500
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
Subject: [PATCH V11 32/47] drm/amd/display: Add support for BT.709 and BT.2020
 TFs
Date: Thu, 14 Aug 2025 21:50:21 -0600
Message-ID: <20250815035047.3319284-33-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a7f205-e28e-4242-1ba3-08dddbb01e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jY4Vz0bdMrLp+I8ZhzMw9m+qfhp5qFR3KzDhyOiOBjuExHk9YkoHvwmYkoDV?=
 =?us-ascii?Q?ET/7n2HSx1aJahVIrOoexsJcDbVdFCRyb9qCxTEwip4LqMs2jvbvelmTmP/p?=
 =?us-ascii?Q?xe5H20gLDN9omsWCHoZGXMK529mY0oLbdyg3cB+uLtbwHarEFCWOLb1kUFNm?=
 =?us-ascii?Q?nAneOMRMxYLDp+kSI+b5tnJsucdAKv44hIettWJ5F6M8Cqh4BQrwSf8m8U0C?=
 =?us-ascii?Q?hFbFZ6fkX7eLxMCV+N7mj5RflV5/Dk6ctY09MKenQc4DMAu+26lJ+2w6gp19?=
 =?us-ascii?Q?QvdSu1Wwlm9xm6x9Pw69UjVNGnU0wtqpwUXu1Ygbgx6q9YYWde5yqT12LS41?=
 =?us-ascii?Q?gJCt0e69sYF5qePK8UrGiQ6sN8p5PV0aLowA67p83ntQcYT8SZiq14GwfO4n?=
 =?us-ascii?Q?ZU9Cq/QLcUFWpE5I58+pQaLRXnDGKeBqAwSi63nqzAB3jQPbgaGKIkIDFv3Q?=
 =?us-ascii?Q?3XoG7fUtmfQ90HeKSX6UDmkVS9TAUmMVbvPKVa9LT4mMCuuIycwg5u0bmYGH?=
 =?us-ascii?Q?5yciJ/3YA3vSKl68ZKB1NlBA+GS+5PvfsPTXCnIADOkopFG1g074As9Pgu8p?=
 =?us-ascii?Q?CXOF0n3KA33lczB8LxnK6nsc00iUp3qIkP/EOY92EN2OrVprLY6cPOi6OE+L?=
 =?us-ascii?Q?lLr1rIa8Vswo7+a9d4WPW7+XAwqcOhsQPI2HWevMHJxNcSHnZp5f9a0jvfz1?=
 =?us-ascii?Q?PPAUrFriEv578VCdHfa5XISkaBb+4YVsnLxl4OQ8Yo56hGEx0hqB4wkQIr3q?=
 =?us-ascii?Q?r6hOfkfIUR7JTLTlT3ch+9XoL/xhGlYAD0Eh82aLIyATCWsijslZjxzZFgKb?=
 =?us-ascii?Q?+N/mnUntywNlPFwD2DWtY2C1Vih0MgMP69LlOqcBqyh58+AUM+GZSmW0f/m2?=
 =?us-ascii?Q?2cdPYbCMWSDlI3CoVgzfnALUNU2u01xOC4e3OjC+nVOqH+3ROYPYi8NUHfsT?=
 =?us-ascii?Q?li8axUkGWXjxbkMgnQNkDJCppRX6Ui5STzaJhdZnRWg8SsPuojyb5hUhBxGb?=
 =?us-ascii?Q?ruD4M13HACblSV6t+9s1g+7WrTj8OYYILNQyavaQITcOUT6oLsb0KlhoI+ov?=
 =?us-ascii?Q?iB178yJDAkCfjKcGeyndgeBnYjjD2nkkgUWoHuj994ifqVctuslU7TVrU7Ar?=
 =?us-ascii?Q?Q22M/5NKCBPYAVCKcjWOQbZWMepnkQr6sFXv5ttFDdyFKchykpbU4LcIc2ey?=
 =?us-ascii?Q?g0z9MQR8W7a41hCr3OYDCmdlGEyZKX4YCHjt+L04oqbhk3CRMXZso1loZWfG?=
 =?us-ascii?Q?7TATuOq6Ji8sIzkFWXNKE0w9hOajdZwLFnAx8I2h8WDpFcvtMZroBqt+gj1x?=
 =?us-ascii?Q?Yx4HU7QH95Nj1LOQUoDq0nqClRx3bsMPd6aiX3H96JoYU1h65F8l/M7ZHkfM?=
 =?us-ascii?Q?61JnbabLKzxYfCXsR/yBjn8FL5tcv/vN5YaDUieMRn5/WesP6DgbOvkOupKf?=
 =?us-ascii?Q?jTSwFkM4TdWJqDPABeBinpiucuXPstptZp/ZkKJOD4dXH0g0mvpcQbcW+zSB?=
 =?us-ascii?Q?SS+/H0JhJT4S5poOmSDCWVqtp+8+TzYuAlya?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:59:22.1797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a7f205-e28e-4242-1ba3-08dddbb01e28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385
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

This adds support for the BT.709/BT.2020 transfer functions
on all current 1D curve plane colorops, i.e., on DEGAM, SHAPER,
and BLND blocks.

With this change the following IGT subtests pass:
kms_colorop --run plane-XR30-XR30-bt2020_inv_oetf
kms_colorop --run plane-XR30-XR30-bt2020_oetf

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v10:
 - Move amdgpu_dm_supported_*_tfs check to Patch 32 (Melissa Wen)

v9:
 - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end

v8: 
 - Move BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) in amdgpu_dm_supported_blnd_tfs
   to "drm/amd/display: Enable support for PQ 125 EOTF and Inverse" (Leo Li)

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 3 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    | 9 ++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 315a1028cd45..f645f9ded95f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -679,6 +679,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
 		return TRANSFER_FUNCTION_PQ;
+	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
+		return TRANSFER_FUNCTION_BT709;
 	default:
 		return TRANSFER_FUNCTION_LINEAR;
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index f79b52ef7d5d..d7162fab0884 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -33,15 +33,18 @@
 
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 const u64 amdgpu_dm_supported_shaper_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
 
 const u64 amdgpu_dm_supported_blnd_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
-- 
2.43.0

