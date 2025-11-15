Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B4FC5FB10
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0A210EC53;
	Sat, 15 Nov 2025 00:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mjkVD2bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939D410EC26;
 Sat, 15 Nov 2025 00:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9JCpASVRvV6HRORS/2ekqW0wiSZZTTed3qXE/hdkhBa7iU6uIij+05cBdnKtSaqFtignZbxUbpeklIMR1gscTz0V6QfJOnyznI6540ZnTajs3HcUVcwONIGAFNqG0xLQcrH4MWYIRnTn83qzkQygieDuUI08pcPolou/Y4lXtPVnQvXf9W6gNCxm83sAktmbAPSsK+1RmvVeDOCcW3yXMO/de1InMMTZXCAyZdr8KWn29jKIRcPvhnxEhczGw+iGXag06BP3jSJhjtg6XHAsTyTBwE/n+v4G4g+uTwktoHVGLn7+3RwTry+CMaqdEljT1TDSDrOnkcdqR4j/jeAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EydD+mrNMKpVPcQeSxp/8VAs33ZKoeoXYf1OFQYbMA=;
 b=YSr6/t0Qi4vvKBIoj0r5bd+/uDS6P7zP6hAp9RLu+r+opfUGTRmM8fcG1JfF5F053b/jeyb59hYYfFCDj8ToH1TiqsSZ/BwxL0HgxO8LCXldZf40FmvGWvJCTXDPNNvRw6kr0DQmic9ptTNrPi+bVu9vvXXKH7lqkz2xsiuppm6dSebvUKGEhwvBGRJoZkFlSQaV18cWAfJ98Mwt9jBfsrlqHbvu7TiakfPO+/7iPV5/p3e45z6S85xbsQc7+N4IeCLL8yBv5Dxsd4t0I1BWPE0QmiywveP04XPg28be9MmWtPyEmQvXkQSTWe0FeOr5f7OhtgHiQ0P/m5JEK2xbSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EydD+mrNMKpVPcQeSxp/8VAs33ZKoeoXYf1OFQYbMA=;
 b=mjkVD2bfH7+z30mZo1k8OVcdLwIaHoy8sD/TvtR9zyuLzBsuUpiHpXxywORXVNWxYqcTv7y1buuQL8XFQNH1Z4Jowo0BRni1tKnAXX8HXScizk6hejzBd03W1HFx1DZClW3rutO+0zA5xcvBFE4um93ezlMIG22e0zmuwp2q2/Q=
Received: from CY5PR15CA0246.namprd15.prod.outlook.com (2603:10b6:930:66::19)
 by SJ2PR12MB9116.namprd12.prod.outlook.com (2603:10b6:a03:557::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:10:44 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:66:cafe::8b) by CY5PR15CA0246.outlook.office365.com
 (2603:10b6:930:66::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:10:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:10:42 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:10:39 -0800
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
Subject: [PATCH V13 29/51] drm/amd/display: Add support for sRGB Inverse EOTF
 in SHAPER block
Date: Fri, 14 Nov 2025 17:01:54 -0700
Message-ID: <20251115000237.3561250-30-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9a5491-6891-4535-1d8a-08de23db6ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vCs5fdpkNaaeH2WCVYNAPohlbOHenrFi+KquF7p9mD28+RY7BOpZu2o2Os2O?=
 =?us-ascii?Q?rB+U23gYVsDc263QVW+sNoWI/sEXvVcU5gw/G78RfEoIXYasdRMFyzXP9PnB?=
 =?us-ascii?Q?Rte4+yCScDBp7aZ/qYRwavwtsHq5qfC80OyMUbadqMBNDDwErKBrEfY72miq?=
 =?us-ascii?Q?ERXMv97aDBEbbm5mdvKXB8fPzzftb8jcPUVr80QVXEWwuL8RoBXFd/7JnNst?=
 =?us-ascii?Q?lBF4D4CeNWZyODWRZ2Ed3jUU8zYifede/h2V5nhrFNhLP1cz5rHPBPg1djeW?=
 =?us-ascii?Q?N460jv+bj8HnIJvnihjwEFXmmRBOkgrOlzFAkLXadjXYn+uQO6Yhg8vUgjbx?=
 =?us-ascii?Q?KE4n+vcHtZyXnnkX5QJ1bNmVcE11fxtCiD9amEfr64yYksXHRwTeKjd5tI+b?=
 =?us-ascii?Q?N12K2Z/Uq+QYTlFR7i37it3cqSAWOYSkkvCB7rnhb18SgsXulu+zIXjiXIqD?=
 =?us-ascii?Q?pTfjMtYRJYWOjNyMLUqCKg7mGeRolN4KTxDeANAV+S5fR4AMIY3RLj/1jcEq?=
 =?us-ascii?Q?G0Ieo1sImv7YpO9YNah7bId0JCvi54mJ/iDDLu4rPAAGi1wzeeWNqQODhWOC?=
 =?us-ascii?Q?zhUjkBMfFmMxkGitK7lpQORKizNN9EQyD5g26dYhdo64NLjMgSLBl48wCwIc?=
 =?us-ascii?Q?LowL7Z4cct7SzzgyD6e0zEKUponSgu2PfWyBe9QyWL6U2fCHAUfx2CORbkds?=
 =?us-ascii?Q?aXIUple/1GeNX0Npyt/bDICqAytKkBuxQfbv+i4F6NizoeVZoefYoUi4B02S?=
 =?us-ascii?Q?0IG//eaa6qHVaRKqa/t/ZIdJkB2zs/VjDKW2LMqIaNkJb9vq3cASn9dXILtV?=
 =?us-ascii?Q?LYE2dwcPBWuq9CvipxwxZr1msWl+jNJZrVE3ZrWXpRyiqWypQy0na+Ize9y9?=
 =?us-ascii?Q?i8rVDfYrfZmH93pjbiJrtAF3npR8PC5GHCsNUXiyXH7I6EOxUVvm+0gWjeBb?=
 =?us-ascii?Q?EgyE+js+HD/6l/h5amEv5NydCe0QMuz6I6VSbvD1K9ruBKamW9ISC+5LbDcb?=
 =?us-ascii?Q?YwsoDR7drxWjCGjor7VzDz7WMt49Z3M6mQBDTR9dUxXs8ZHXoMoYtR0Tpw4D?=
 =?us-ascii?Q?vlqAxjFc7DFd1cZNIkusWE22jNiAHYIOOA+H8NPzMEsUJViF2fOOliRRgK2A?=
 =?us-ascii?Q?ZFQj32CwR/neGQDF7EsAtRauUI3VOyqxYZ9pQDExobwuoy3DeRYj1fPGQTWH?=
 =?us-ascii?Q?X9F/n+uEnf4fsUFop/eDxHLLCdOS/H1MhxeqKrAuKUVTNci+oCP1duD1fuxD?=
 =?us-ascii?Q?Ol9VE4QAXIrD6K05AIWysn9JXvOlSaOSfBcks5r3rWh0hrDVY5nBFy/pZiOY?=
 =?us-ascii?Q?I/dOkgES3954LfLBQDKK7yuquAbsAL2FMhVdKO8taA9H4YU9XCD+lif8LyUv?=
 =?us-ascii?Q?8GFGxOcRGJjOEwxamJLHGczozW6qS509bwTf6QNJZBQiP4s4qn2mPMctbVNQ?=
 =?us-ascii?Q?vATn6sx+5HNvmCcvAd1UDi86FT9/OuvqcBbwTn44aCCsmVRm1yxxEuz0H2DV?=
 =?us-ascii?Q?XKsNOI1H3luLRFtRGQ12gcoxBcL6blSCEnWy3jYOt8N/XouXcCeHqGivxHP4?=
 =?us-ascii?Q?j0n/7P0cKvH51oDj/B0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:10:42.8565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9a5491-6891-4535-1d8a-08de23db6ac7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116
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

Expose a 2nd curve colorop with support for
DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF and program HW to
perform the sRGB Inverse EOTF on the shaper block
when the colorop is not in bypass.

With this change the follow IGT tests pass:
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf
kms_colorop --run plane-XR30-XR30-srgb_eotf-srgb_inv_eotf

The color pipeline now consists of the following colorops:
1. 1D curve colorop w/ sRGB EOTF support
2. 1D curve colorop w/ sRGB Inverse EOTF support

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v10:
 - Remove redundant DRM_ERROR (checkpatch)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v6:
 - don't pass uninitialized variable into __set_output_tf

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 74 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 23acc035b62d..6b199f1179a3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1242,6 +1242,68 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
+static int
+__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE &&
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
+
+	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		return __set_output_tf(tf, 0, 0, false);
+	}
+
+	return -EINVAL;
+}
+
+static int
+__set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
+			      struct dc_plane_state *dc_plane_state,
+			      struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 2nd op: 1d curve - shaper */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+
+		if (new_colorop_state->colorop == old_colorop) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (!colorop_state)
+		return -EINVAL;
+
+	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1297,6 +1359,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		       struct dc_plane_state *dc_plane_state)
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
+	struct drm_device *dev = plane_state->plane->dev;
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1307,6 +1370,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 1D Curve - SHAPER TF */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Shaper TF colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index a61250f7fdd4..ea6078592f4b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -34,6 +34,9 @@
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
 
+const u64 amdgpu_dm_supported_shaper_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
+
 #define MAX_COLOR_PIPELINE_OPS 10
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
@@ -59,6 +62,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	list->type = ops[i]->base.id;
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
 
+	i++;
+
+	/* 1D curve - SHAPER TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_shaper_tfs);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
 	return 0;
 
 cleanup:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
index 3324e2a66079..71cd27994528 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -28,6 +28,7 @@
 #define __AMDGPU_DM_COLOROP_H__
 
 extern const u64 amdgpu_dm_supported_degam_tfs;
+extern const u64 amdgpu_dm_supported_shaper_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
-- 
2.43.0

