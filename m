Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B72ADC03C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD5410E529;
	Tue, 17 Jun 2025 04:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J1b+p4wb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C7E10E4B6;
 Tue, 17 Jun 2025 04:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7Wl/IiXyC7Gvuny4yrHfEUZpg5NLHyPzsKXaA6Z2KMOcRVvZafW04VI5LPBp0Ru3od/A7wiQ8oMlzihgk57GtUI5DFPlSysGUcbUcwNFKxw0yHexruZmkhJYovtqFxG1YwnajKBVdGyMbMy4XvZtNqFl8lpD8bmhrtB1vOVj9VDxqR3OVWZXHp79EjdEfBSOQp/XXQP82dVpb5ILT7O3iiL8hcMm1p8/8/adfQgyW2fQnpNoVO3cjTvkTaXXk/3TRj/x+Eeuw8udD2Ec71t9E7HhnIk130T/N2+EW+oWeILZLuazMI9e5zQykPSGCvcM5JOu+2B0j44ZBfBKoQ84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXRn26RNqHuFiFobCMvpiN+2eIpCOXht8ReiSga1u+I=;
 b=d6DkPTzuwe7unxkXCFcnmMkULNuFgtyw1LdHmGySeNEtz6Xv6GUKsBpEpVT3qGcPkSaPmHX3SkszTn+wHNnYFytiiHmXDYM5G/PeNVP2UjEhDNY7P7Fr/+wO2qqXWTT5YGqGeKSn/p/Wu/HH1UBPWZdd/lFge0GsS59wGaXNnOMmTE8Pyao/J1gdQJlKvChL6xn6NZ5zUdZB/6B1mckh2MU5GdxgT1LXOOe7kr8NpdgTeW+t4TgUhO1+RzY9Yigz8V9WTqd5LMZTLVEGvoFePkiPGCw9zFuu5/Pg062hrzY3RiGTkSoWSKKswNYPuSzF+wtLua4ifpdLJWq8doa5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXRn26RNqHuFiFobCMvpiN+2eIpCOXht8ReiSga1u+I=;
 b=J1b+p4wbRYUc9W8UC5m3NvU4VF06xRsaXiCQJg5C/dbH2QpocXpayw5XYrlisL7q793zMBGhDwt89X4snVxXPROeB/7Khyb5IxB+KOOTR/An7W6PAl/mgbn4DMii7tON9arYEQjKz5CsvNKv8rIWrOMF7U3Os4wRCazkjJpMU3Y=
Received: from SA1PR05CA0009.namprd05.prod.outlook.com (2603:10b6:806:2d2::11)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 17 Jun
 2025 04:20:09 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:2d2:cafe::d4) by SA1PR05CA0009.outlook.office365.com
 (2603:10b6:806:2d2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:20:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:20:09 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:19:47 -0500
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
Subject: [PATCH V10 07/46] drm/colorop: Add BYPASS property
Date: Mon, 16 Jun 2025 22:16:49 -0600
Message-ID: <20250617041746.2884343-8-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 80742965-6ddc-47f7-4209-08ddad563eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H/HoycTcKKpvrvxRxrvTvYkS1XKJiqzNWneKqrH5i0GbPjJKjoZEgOZNLEsp?=
 =?us-ascii?Q?ONYMkzSRVfWR4yofEy+wE0Hv7RCeBoe+0nUhlseoQpn301hlmLSBVmV92Sgp?=
 =?us-ascii?Q?vlNsHiW5IAzThF5HYWyQ+GV8Rx4kxfw+eLy3avMGeWWnrwh40excD7ty6aM7?=
 =?us-ascii?Q?j/7wecnayuRBfIePWginW00r89In6JzdGvQW2uF+qy1KFc1o3deybd/+LaeL?=
 =?us-ascii?Q?3dcpu0qTgQxsXZ27JaZ+fU5ufocH6Y2vHdIjuF3RhIcTup5tC2AWi8JK/NJG?=
 =?us-ascii?Q?Em3qTsXzFM7VuRfjAyPGI7RjuPC3ZIh7L4gwmw2Kebq0FzxRtIszuutlE7QV?=
 =?us-ascii?Q?dYccdqoFxTZ7GMQM/m6yveDUkSn0xNGcowBJ5+TVlJvaqH+iP8MpqlqYjc57?=
 =?us-ascii?Q?uHBoqF3Rjd7cBJaOxLh/UuVpeElt8kzwSldlIMG7Fj411BalMFbmWo11YXdW?=
 =?us-ascii?Q?H/qc9skmzjf3jvxs9xylcJK4x3aOn1Tf7AtYtixIsUCgrU4NWlZlm4vkbPJP?=
 =?us-ascii?Q?xSh2ydaB72nmyM89/v9ftzrl/MrtK1K3F/AxO/vC+QluUjDUJXVfwvjYCIX2?=
 =?us-ascii?Q?gpul7qlgd9Pjl4+hbEVRddg7pd3wWHv42ctv12/MKa1/Mh0GLMqXvC5IvDCZ?=
 =?us-ascii?Q?OLnoIWc7duQLCFdEAXdT4wkz9cRRc+HXOqZkx8YVyRiOkOunkJM2QfDJl/21?=
 =?us-ascii?Q?3NG3WmmFvHvfC4b3pm+ZCyWEOlVy4TBjWyxYPcYCElbi3MAlprdB4A6VhOn0?=
 =?us-ascii?Q?MZKVw/g8eG8+Wk2cy1Q5rj9YHlbOyvkpXeYhw9258p7hWR/92qprO+2ilRhj?=
 =?us-ascii?Q?Xrj70j+6zyTqdbQRXxCp7ModfzakOUVqVA4dfpU7u1uwniIjpRedt841Afp+?=
 =?us-ascii?Q?fTH+5xv49brvQuEQo+OwCztsZ42+79qFsHWa3LFwzQODDG7RdOS6586b6X1O?=
 =?us-ascii?Q?ethfotxrpr8D4H1aXdcwKsUfN4lcepmv7HIQGhmprmyba84z9Q4SRSoD3SQw?=
 =?us-ascii?Q?NY47XZ2JMCMwOsD9nc99ZTO41AtKpNG3dcVPSvDFZI6xuPufDBR58K/w5igT?=
 =?us-ascii?Q?kS5/3Lq4EewKz3eqtCJpbxyE8v5727OETyf929vo7eRixbWJeqyHPsTWu/fG?=
 =?us-ascii?Q?yAtvUfIZnQvghlE70/cmbFyMHVyQBra2m3xIZxVQxwnITdbvC891wil9FcQq?=
 =?us-ascii?Q?Z0+ryuTGcvSFJRXvVA15O3OCMfFG+LqFGCWuBeDdGIbyeAlRpYpMgg6IMwul?=
 =?us-ascii?Q?qBxOgo3lXaJ/oys+eXjZocj+WEqDB9SrvyRxyQwTLRscM6J72JMmjijALXlU?=
 =?us-ascii?Q?7L4zWu/lNo4rL7+HUdMAlAeDSelj81MPTxGjc7zMTjN2dS5E6CHld8SNmt37?=
 =?us-ascii?Q?jxkV4iVJE+otfq93AOE9IT2F16sTH/AhSMmrtv45DmQY0PyamoyUujFyHg3S?=
 =?us-ascii?Q?jvqdsu84ETjvptJS+XbRlwpUduQucJoPwCiC5n9bYuFzUd9i/8erkwZmWDwE?=
 =?us-ascii?Q?qQPFlm123fqeHYMDUNEz8N5mD1CCIRIr2xjL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:20:09.0214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80742965-6ddc-47f7-4209-08ddad563eec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
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
index 995f5ce87efc..e5da00fdbca0 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -649,7 +649,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
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
@@ -669,6 +671,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
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

