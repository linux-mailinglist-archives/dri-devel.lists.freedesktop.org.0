Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACCAADC06F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F27D10E5F1;
	Tue, 17 Jun 2025 04:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FHMO2YQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7872610E5CF;
 Tue, 17 Jun 2025 04:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tc0X7C2yjjNe7QYZE7EliC6X7uxeMpaHGDF+Ar8Ufygh1rYpq45vSGzWeY5YRh1FTRNI7FgPhOz73dYTxkvxU3CHVQJ6umO5/YtCk73hX4InWzuy2IDPYte9tvUrHB8cjq8oiTpE3XJSn0Yq2/SCuq9qcLZ94k0gcThQ2dF9OzvVjzyMqroxKLyzL5ozOh0dDlUVSCN0hIUvOFAUnORcLj6GOKSLs+BJ/oLQFwRAB1U4r5tW3Ih8B8mglD9+HzNK/uNOGCvIGpBlAR61uni/x0LV9APUaknjiahMAUqL+sF1w7yazEQABSAzmduOqxX1KUbc5LijNiirdsxyKwr5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4gKAVGJK5pvafcAkGYiAudiXdGaXgHxOMulHTRH6Ew=;
 b=HtNwhd/0HPVzGMCrbcJ25bxB7dREAM46h17ekq5Rtr6WlXEN9aStGZqVDnCc5ALUQbCEPWErbkKMIipa/Lx4DpcnmgR38m3q5Ue7FEaulvWdXdLWTLGuKBbCBThJBIDqEdRV3LgtvszdtaN5jUylNwoS0+PpsuHv1Oac+xVfhM3NUbr20N+RccTxEgRWawOh4WUc6D5b3rWPj1rIRZkEgGIRh2gOGqxdE7K3+5BvPK9HQRdHGLg2f9vDndPVEA6o3jgClQu21NB7okH4girgJaxX39Ab1nlQTfBWZi6dD3fkc4rnN6KrxFm9wLNTYjnCkh7D4jl6WmvOAKtPhDuSsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4gKAVGJK5pvafcAkGYiAudiXdGaXgHxOMulHTRH6Ew=;
 b=FHMO2YQOlKXvsS9nLB0+kNBggAejD4WgcSAWTI0pDXeuh0fr3iOeprctQIn57gXXHMcSX7/Znp8qn9L+EvBw5knmovqmzZ0CJVWFXgheM9N3ZZqUXtJPB+iM0hVUuCEV2Oi6iyecS+AhyaeMmSAJSAHcFRf79gifSDFACU53y80=
Received: from CH0P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::9)
 by CH3PR12MB9314.namprd12.prod.outlook.com (2603:10b6:610:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:24:58 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::19) by CH0P221CA0025.outlook.office365.com
 (2603:10b6:610:11d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:24:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:24:58 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:24:35 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 27/46] drm/amd/display: Add support for sRGB Inverse EOTF
 in SHAPER block
Date: Mon, 16 Jun 2025 22:17:09 -0600
Message-ID: <20250617041746.2884343-28-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|CH3PR12MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: 630c43ca-da0b-4d4a-67aa-08ddad56eb29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FwvT+QsP0CpdRbGnPNQNB81Y0/rcORDt332lAO7AXVK4JM1rVeV78YQOM9vm?=
 =?us-ascii?Q?r7RU4HAidJdaOtVXx+lmki6eIDQ5y31XcEBy3jmiAX7GELus9ZMAMcVOVXlU?=
 =?us-ascii?Q?ROazb8kLQb4JMgWHk5G3idXxo+dL6q1p6PfIVzQez/caoHoguNEkoHlqw+Vf?=
 =?us-ascii?Q?AMPaBtHlMbzbIiupWfuX4oHZD0pK21y0JnFd0Xjk+pNhl3SVipc+eEHVWV1Q?=
 =?us-ascii?Q?B3BzBKPC3ECSnliQ48m6JxAGRC8mykHJWhdpoA+7kQHqzSALCLrjoQD0sHEr?=
 =?us-ascii?Q?LglGud0Bpl0o6TspRRZQBIV4TXfjsum8XIRdsuDITZKljPSOLzIXIl6Oh4HC?=
 =?us-ascii?Q?CgJ2x8zJ6i6ZO5NFtMmyuUGoIAyRd3kS+1PdW+2BSYkAWHBfNr8S0xjBysQw?=
 =?us-ascii?Q?M762Xg8gPtDNGo8iEbex58+hdey1z4hqPHkJ0Lp6iOoQ0Kb21+APTxUED5qv?=
 =?us-ascii?Q?p3GDsYPCcUxG2Z04Lacir7L4TfB+PvRzCFB0852cGyXVb1MzJyEffWSn90sT?=
 =?us-ascii?Q?g6+kYbGV4suZXLQ/VBca77jgCpVuaUMQFX+LL91VmudK8pqnUdfOf4wFFWzl?=
 =?us-ascii?Q?7JGae5NSgQ1025CG/XncwA27d3E3msHpOCUNkjxLYqAzEw2MT9YBt5T+oykI?=
 =?us-ascii?Q?cEyv4Wi8/UpFr/h1ZMOr/tZqBRvk8F+9pO+8fIh60Jn/MYLcRx9zXWuTx81O?=
 =?us-ascii?Q?eLLS3/pgcRvnvxxiRtpB1+rs8yffJCZ2KDebF34pSyGUPpaDyeWJ/a8sQPb1?=
 =?us-ascii?Q?3ByZtaEw6aSEOeAHxaLXpw9MP+pg92eWSIn1WOcJerDgOTesIY320pZSvuAT?=
 =?us-ascii?Q?I24NYCttXYDtjLTcqa1W9RVzTuL+KxoTURVgBkTotYH1yZUlPk6w0qBJI/mN?=
 =?us-ascii?Q?S06fRY6M4UWbGC+rqWCgM/n0uFWdmeuURwcYxlvDajlmq5hnXNRDUJFbxjIG?=
 =?us-ascii?Q?UGWwiRz7qSOnVhCRNFEqAxr8nuYeq+bOlsOPtPbbFXlcz9pSFBCA8//sePae?=
 =?us-ascii?Q?aMyHb7PvQToWm009IDi3hn9FeLgl4ARXnP3X87DL8O/fcUUHSFyfFUhfjSTF?=
 =?us-ascii?Q?tCoC0+VtBc6Yert6vsJH7Y2E5oX0oluHiGNWjpFRbsrV4a8C9N9VU6wIDYLQ?=
 =?us-ascii?Q?4JQzD/04Mwl5z5NCkFg2YfSkV2yetfpaRUAU5nLoVH70NJwjgdhRQtlCAqtW?=
 =?us-ascii?Q?ejFBWDS/Q1JCTqbqMss94ElDQkM3kg54q222yIQPMhE1qPbGyvwfmtXjIOwy?=
 =?us-ascii?Q?mkweuWRn1U76ebQxF3nwC6chXUVSsfocXT0m5m6JdfBnNoSdAUOd0Jf2CRav?=
 =?us-ascii?Q?SkMbXFv6+FsPYcnpGjY/lBrPi7CHe/1b8NCe11jDTNC8H4vLhmUj7wuRryMi?=
 =?us-ascii?Q?pkJzwd/SXFf7wwlzzuLT85e2jZSv+fVVOneTTX6H5ce51vh1+GelC+2nPIEl?=
 =?us-ascii?Q?ApFLhE+zKBHdEh5SXesnE7TSEu47shLrqLbIC9BED9lwVc2G2iWIjAX39DAP?=
 =?us-ascii?Q?Z1HqtL4xiZ49eLW+A3xHvke6/F8vO/9qHQ3G?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:24:58.0081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 630c43ca-da0b-4d4a-67aa-08ddad56eb29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9314
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
V10:
 - Remove redundant DRM_ERROR (checkpatch)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v6:
 - don't pass uninitialized variable into __set_output_tf

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 74 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 0b513ab5050f..4662d88885de 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1202,6 +1202,68 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
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
@@ -1257,6 +1319,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		       struct dc_plane_state *dc_plane_state)
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
+	struct drm_device *dev = plane_state->plane->dev;
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1267,6 +1330,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index 9d371728b5fd..dec64f11840f 100644
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

