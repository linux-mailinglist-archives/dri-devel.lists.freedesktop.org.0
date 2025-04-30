Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAA6AA402A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C094A10E5EF;
	Wed, 30 Apr 2025 01:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J1ZgCY4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A66010E5DB;
 Wed, 30 Apr 2025 01:13:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaALuD0gv1mYyNiYO2IZ5IMkK7X5x7ZLLU5Sss3Tenj+FOiKe8vnqNUHooCUq5EBSDHI+tUFDPDaqIWKDpkZdzR66s5C2BbUpV/we+ty9j4fyGGXno/KOnIdqmUywSasl9bj9SY05OAnagvVb18/YzEo8/mVrL5aSxikc8s0OWXuiEp2QmpHxSktZrMCl6fziig+dY6kUqBn29J3rsBeMSEhXDOjaKRHn7v0gvH8aFa7CQtD1uaIuhK5mys+GqBGIEc4FmALRDqrmYL+5EuTbcOk8mBc9HrgGfVAOoY7r6flm+qSUVhdDP1+xRGSfWJe+PjcWjhbTXVk9Bu28KjoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXih5lkwOL8n5CBapP3pGcm0CCgcBtevmWgePRRIyJs=;
 b=FQ79awgO+CtWhox7LzGoWPDUjMvY/OlYuSvC43aPzHgi/5o6HgWJGKvBN8jYprLYt6T/152BebtYgje+kyFqvcleS8iTE1POd+Oo19+Dd2+r6tZDiDoBrHD7tUbmc0YIiNUThnC/oAgZ5ckfONzktTEjpGnU0I7pZSqwVlNSLYEu5PBb4tGraD4vGa1tvyzxMG4yAHZoXd3f8R3cHoYp2LdtgAGbwCeBpr9v7GNpThuOpEievO0ou7P8hX12GeOrF6GaqhxVz4eKdERbiupJpxbEzJ/7cZ8Ng3QD0OAYqmThGxkK7pEg5lWK+tNlzCxhS8vkSXOzp9nsQL7NV/5mPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXih5lkwOL8n5CBapP3pGcm0CCgcBtevmWgePRRIyJs=;
 b=J1ZgCY4SjPHrUV95/hD59navPtE8E7dt4YABGGWB4i1ViczymamT2CrUCwW1jwo/9M5g2exGQAwInt0dwESKE+VmuBixO5Mh115sehQlUVgFaJx5vqL4m+Xf7ZOG/VMvppvhpwhmfyFLbcJ2KXr5rJBLqv+jfHMhslW1U0eSc6A=
Received: from MW4PR04CA0139.namprd04.prod.outlook.com (2603:10b6:303:84::24)
 by DS0PR12MB7969.namprd12.prod.outlook.com (2603:10b6:8:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 01:13:38 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::ac) by MW4PR04CA0139.outlook.office365.com
 (2603:10b6:303:84::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Wed,
 30 Apr 2025 01:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:13:37 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:13:33 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 07/43] drm/colorop: Add BYPASS property
Date: Tue, 29 Apr 2025 19:10:37 -0600
Message-ID: <20250430011115.223996-8-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|DS0PR12MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c29ae9-f520-4ba9-7d2b-08dd87843c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OpfEFHtct/LisQnoo5vbd4jUIHFvJz5SbXLY+Sh5k6Oe+A/JySWU+3J8WyOH?=
 =?us-ascii?Q?A/jE6MBAIVhpqOPJXGuXgZYzjZnuwcs8MmrNgqbvekBGDiCdErVCESvHnyhi?=
 =?us-ascii?Q?JabN4jtoi1eHmshknVJdjd6PFkpNxqlgboLs9hCOP1/PkQbFhTDARlvp4xVe?=
 =?us-ascii?Q?JJTESmZzIkdFlzCKkF52cz5nDIXCzTm5IXnXOWLCjaEH2wQnRd6MsFIckoAw?=
 =?us-ascii?Q?kbDZQ56MFHIrK/xub0iqfe2ekSDRVk3k+8wTspMMABB4NCSNcrfoCBBtOmtm?=
 =?us-ascii?Q?3SG2KOWfpKFp8MFIkm9RyMufuLVsUqI+P3OIIcSbZD9DONWGsnwgsqc5LTej?=
 =?us-ascii?Q?Ptu+Nasn+BjZloHPYSOZ8ZJp93krTMj6SN2TBApDetXqcJokFpXn22SwbnDJ?=
 =?us-ascii?Q?mM6BHsSfuECFS7fVSTTtX3yCrUhM49iY7PPiZVC5HbH6B08CNXuqNUpmOhFu?=
 =?us-ascii?Q?T06Jndgq2hg/fRcOLV4RvaMM+dxDaNbTxmWTKJGLt8NR4TX+6/JM0ZMC/cEQ?=
 =?us-ascii?Q?LGyBGstN15+7YznxO87+Jj2UlAR5NvboOb7pmA7fvtRiOilVaWCP0u3XAndY?=
 =?us-ascii?Q?gYt5jHVBTWX2oIhE40zSUO1j6SezTlpSSgVkG4arreNrrzKxzUBebWWHrtmo?=
 =?us-ascii?Q?H32bkgywJdBVqVZUtSv5D0nzeLbgbXPkIDgB7/9D6lfHsloDrjTbZWOXEFxK?=
 =?us-ascii?Q?1xFhWmClcj8yxj8eXYI7SBts99vjTy6VWFbPpC83dIJ9euh+gv4ZDfhWwfA9?=
 =?us-ascii?Q?QGBn8DfLKGdT/1fhyttkAlsXIXJ+C9TnvwE62Dl2S8AVMexzjXGFiwaeEoko?=
 =?us-ascii?Q?R7t3m6ueit6xC08+aTzu8MBIHwkNcZs+8Beg4celp+WahEGEeFtGtsehSIGa?=
 =?us-ascii?Q?DvvrNlwfbZ65sU8XtnmJJE+/kc6gsbFDSXr8yI/LIzabBvMQK14t0TwHP3GO?=
 =?us-ascii?Q?JtEVV+kJ6mEg4RFvB9ErqLsVUMO1M2ZLTLCAQsE5I6lZvmbo0jFQuUEaUeec?=
 =?us-ascii?Q?THRAd131duvdBpIa65FDAJnrbU3JFpJPL3Dq/a7uWvjJ7eq8trDyCinTjYPe?=
 =?us-ascii?Q?UaiRMzHKQzV2Uph6rw/iWZojt0B5cxEXT6gr62OFf00tv1o4b1W8Lxo//kW/?=
 =?us-ascii?Q?ev/jY1SZycfdoNxS35kgHWJx3p/yxNyhke+zFkcaRuwP8IJ1fyFExBlVkHKj?=
 =?us-ascii?Q?kQR1yVY4Yi2KYwHU+2/FmlFAUrin8uqNbst42JXKnghBgXY0mQ0/441xXgko?=
 =?us-ascii?Q?W0sUwRhSUpz0OG0XD+D96PwqaGa/A6gtuxHLLArWWAA2Ezk/PfK8IW1LQsds?=
 =?us-ascii?Q?wvqoZMF5B+cCjV/FDbs8Q9npeTQ3ziBbOFWmuHF0M92qE8d2J6eQbXC/LWK2?=
 =?us-ascii?Q?4nu79JFPvLzHTih5G4aOILNZyXLrJFllaSijCKZ3+fLWW7neNcvzYApAIs3e?=
 =?us-ascii?Q?upAUQzHrDwiBOVAIfWiKasDvwmWF4BhgZuy6FUHcTgmuf4khobbIKAHmrFaF?=
 =?us-ascii?Q?JUgmhQp4gAM8JIsUx5qoWyujOAT8MwVWqxel?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:13:37.6368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c29ae9-f520-4ba9-7d2b-08dd87843c83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7969
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

