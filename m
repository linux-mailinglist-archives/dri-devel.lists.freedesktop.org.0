Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBB1B27734
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767B710E909;
	Fri, 15 Aug 2025 03:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tuk2C/aI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AF010E909;
 Fri, 15 Aug 2025 03:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLlKXNtzdYN3EPTXU1CKuO9R/o4N2zVh87cycmYjA7qlQZKW33lJ4uKI1AAIe5tachAG5FvHpDspian5W6R874LeF2I0C1swYfVU4kxqKOjEgK1xIAPkox6vNGGlLm65d7KCvTjcZkPtJPexWdngtgLWyM6NLnDcFzo4T9zLuvvDc9P2SJuQWPMDe0P3naYT4RYsZwlXx5w71cptaV5RljmnWLBeAczsnDkKw2my86uaEYKS2UvyhPjqRFGQLGnVz9Srg+sk8A+VRQ3g5hSPcFQV3qMjlUtsxXLXabGmEdbQAeCMTQtAaba9CIiJvpDV9tdmoGK/7UkjtxVtcMeqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyN7sRvdnPCf99Yew54m7EZWRwfmJPeEepimEAsLTY8=;
 b=nRSNFy2nHv3UalNw6FViYD5cm1dPvo1hsxSYlHmlJ8s6XZv2c2I3kJtm27yPoH2IqI9J72GriMPX6UGN8ZXlYmmyfN0Qqfzb1CBKRdnjxvq2j9YX1hWVvL8SxUVSFvdwOlETagfo9/m7gFnT0BHue1rc5FdIFfPEthyVrt/3ZH/d3DiRXku7QqXeGLKRjnavMoLhwrtB6v0ngNsbL/Xj5ndsxL5cj7mMZIAO1Xa4ld3JXMJ/LGUykljVMfe9wiZX5h5r0jfrc40tJTZK7OjAx+KjxVQfjeUpCINnwI6YFoBu7Pmu1rTepB++EXq/pQ4F0TxtNqynnMfQg/dHKAiFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyN7sRvdnPCf99Yew54m7EZWRwfmJPeEepimEAsLTY8=;
 b=tuk2C/aIkcNcLe70Ni/Cf3ApWN6yHIEL7uDKlRIZYjNWmfDV3/7R8BbDIkVlukC6asFZOEUOfouA5brICfKTVyLQDTLsivXi7QLiahF8nYl9X4+PHdFXXqPby4OdpdnTC44tPOIsSP8x6fUHGCeE5aLGVPsy2E41Z9XSzCxvo3I=
Received: from BY5PR13CA0010.namprd13.prod.outlook.com (2603:10b6:a03:180::23)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 03:53:21 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::42) by BY5PR13CA0010.outlook.office365.com
 (2603:10b6:a03:180::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.6 via Frontend Transport; Fri,
 15 Aug 2025 03:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:53:20 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:53:16 -0500
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
Subject: [PATCH V11 07/47] drm/colorop: Add BYPASS property
Date: Thu, 14 Aug 2025 21:49:56 -0600
Message-ID: <20250815035047.3319284-8-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d7141c-cf29-4d35-a4b4-08dddbaf46d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9Npd6ytmcq/cn1is0+euEsK8UThobhhBMAOeH5GkFMyBOt3Q8HZZjy2rQmyD?=
 =?us-ascii?Q?YjTAhkQCSQRtQidBgcCdGW2lldjsyfbX/7ZSTvp56lHvMvARaKR6454WftXT?=
 =?us-ascii?Q?1IQsDIKSj9zE38gmf0gpQdaFoZT1F0DpVr7T1fWFMcm3Cmz82M3nZYurycPw?=
 =?us-ascii?Q?/nApVDS/ZkQMGjrZ+Rp1xlLMFhlv/FvGMSGDOw+SnbtBYiehc4CSSe/HTI+Q?=
 =?us-ascii?Q?nbJJKhPWuaTzbmKzxYLf6MqPVMq4Vf/O1lQbNdTQwQ9W+PrKr987yGUPVQnR?=
 =?us-ascii?Q?rzgAVl5suA/NKJ32qTxRbGIoX8jE5mGmKyxZaiy+gXF6FNPPU2uvv7uMw6uX?=
 =?us-ascii?Q?RHfY9LA1w4kt3QxMVzxLcJWf7pptG3sVKYD4CUOV+BqkPzVRG17XPa8AyIzT?=
 =?us-ascii?Q?FtlMRWRp+o7pcgc5MlSCEfN54zCLRi5JJbsUXo65UDVJnLkj+LeuVtjBsse8?=
 =?us-ascii?Q?UO/sVDIfebodWKIxSzAdJrQuyqrH9Afu4RsNJoj76A0hQVtU6/ZY2JrPPk6e?=
 =?us-ascii?Q?XaglidwNG84GtcECBhUf6DEzY8gtJ4iwdj2e70EfElK7hNdj8jVw5AO6ji0e?=
 =?us-ascii?Q?sBTKsbbqYp4ffAuFdl9d8rn/o04H2lrvQULF2cNtrBHqa/efN5VDLfO0FmUX?=
 =?us-ascii?Q?Ah/JKlNgP2aMXh2LrKlf9l1GSCn+A9QQNk+oFs00wPup5chlXWAdXpTob9m3?=
 =?us-ascii?Q?jAAwXRJBuCfYfrHbYLL3ejBRqNeLMHBkJFtL55kA539uQIFBxpmjIELR79ce?=
 =?us-ascii?Q?eCWBzN/8FKa/jeMnMr0s1aL1mboMNFK4zGDCx/NKO0XlcQD+he3F1KQcFY5G?=
 =?us-ascii?Q?6BNjrQXaC6lqkMd0j48phB9MrwArbMzvSJmTdC4u+K8l4YbwrxvX6tCveSIW?=
 =?us-ascii?Q?v6BDqF/p6x8sGurKth9+PYmYVp7UEi3AuYW0gTeT3eIDgOyHlj0oV+BV0JnI?=
 =?us-ascii?Q?T1eeWInJTgr5de6ctx6A5qlSRIVFG3ZwFgGbgPCv2UH87hJCChIpWINqk3wx?=
 =?us-ascii?Q?J6tWvDlwdChzzrp19q6XIrOXVo9XGqMOupR/5jXPYotn9ePiLgptwF5Cn5lh?=
 =?us-ascii?Q?1V6/pufKwUtU0t5cvgutYe/EMpk+jPOUo8Yj0VpbNm8qS2np0u7cTnHl8Enq?=
 =?us-ascii?Q?13za2rxRa1kk5K50kGRMhOLeYBdN1fZ2kHDk0epOhzm6n/YovEgF1wTztAfS?=
 =?us-ascii?Q?gXR+vbmJx3aXYsuljA+Ur4eHlipfVMb4qOaxTtMm0xyqotBYhNmBb1h2+hQF?=
 =?us-ascii?Q?pGYYpthj4iZoKx2YyDgK3rPy9PGNb8UP2U/XVWVwDCxlCgJ956ZB7fFJaYRU?=
 =?us-ascii?Q?NnTSmi32/oMF3CfZMgdy45g9ZndZREGWLyr4Lk3fJCARcoO7fJukIiggpGPU?=
 =?us-ascii?Q?SPyU6O2cGyjcmjv4xd1W4Xu4qglWPn2y5/E2U5u/QLp5wXbR3ogzUXSKmfaq?=
 =?us-ascii?Q?dvAqRTLe9pIX+vvto/w+xcCc+MEy7OYDuupKAnN0SAHl1ErKes2gSzHS44B+?=
 =?us-ascii?Q?tGpgv/icoE9W9R9l7Yd+2XNSaVefn64KvswS?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:53:20.9706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d7141c-cf29-4d35-a4b4-08dddbaf46d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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

We want to be able to bypass each colorop at all times.
Introduce a new BYPASS boolean property for this.

Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v6:
 - clarify that bypass is only valid if BYPASS prop exists (Louis Chauvet)

 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++++-
 drivers/gpu/drm/drm_colorop.c     | 15 +++++++++++++++
 include/drm/drm_colorop.h         | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 52b5a9b5523e..44665efbef55 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -650,7 +650,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	if (property == colorop->curve_1d_type_property) {
+	if (property == colorop->bypass_property) {
+		state->bypass = val;
+	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
 	} else {
 		drm_dbg_atomic(colorop->dev,
@@ -670,6 +672,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->bypass_property) {
+		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 6fbc3c284d33..11c37916c758 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -79,6 +79,17 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 				   colorop->type_property,
 				   colorop->type);
 
+	/* bypass */
+	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
+					"BYPASS");
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->bypass_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->bypass_property,
+				   1);
+
 	return ret;
 }
 
@@ -136,6 +147,7 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
 	/* initialize 1D curve only attribute */
 	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
 					enum_list, len);
+
 	if (!prop)
 		return -ENOMEM;
 
@@ -152,6 +164,8 @@ static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
 							struct drm_colorop_state *state)
 {
 	memcpy(state, colorop->state, sizeof(*state));
+
+	state->bypass = true;
 }
 
 struct drm_colorop_state *
@@ -190,6 +204,7 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 	u64 val;
 
 	colorop_state->colorop = colorop;
+	colorop_state->bypass = true;
 
 	if (colorop->curve_1d_type_property) {
 		drm_object_property_get_default_value(&colorop->base,
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index fa167e642e0d..49e6564c17ba 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -82,6 +82,16 @@ struct drm_colorop_state {
 	 * information.
 	 */
 
+
+	/**
+	 * @bypass:
+	 *
+	 * When the property BYPASS exists on this colorop, this stores
+	 * the requested bypass state: true if colorop shall be bypassed,
+	 * false if colorop is enabled.
+	 */
+	bool bypass;
+
 	/**
 	 * @curve_1d_type:
 	 *
@@ -171,6 +181,18 @@ struct drm_colorop {
 	 */
 	struct drm_property *type_property;
 
+	/**
+	 * @bypass_property:
+	 *
+	 * Boolean property to control enablement of the color
+	 * operation. Setting bypass to "true" shall always be supported
+	 * in order to allow compositors to quickly fall back to
+	 * alternate methods of color processing. This is important
+	 * since setting color operations can fail due to unique
+	 * HW constraints.
+	 */
+	struct drm_property *bypass_property;
+
 	/**
 	 * @curve_1d_type_property:
 	 *
-- 
2.43.0

