Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30B8C5FA83
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4BE10EB75;
	Sat, 15 Nov 2025 00:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p474VUKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010012.outbound.protection.outlook.com
 [40.93.198.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3150110EB75;
 Sat, 15 Nov 2025 00:05:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTgGai43C+I78/lJf3UaInQbKBv8U75Odm4A8zEQ4VOvtnEu6+M/TGp1FA7wUBu4QKbzlHjUhjBGiJaxNfqpezfk/519sg9U8lLgl54awFTvj3c4kS5jB210MM+rCdp072vxiImS+9cXEnqyrpMbaMqlp3WD8dQh+t16i8Cr5Pg/9O5DP60qm14PvVdW5xfZe80xyqAXbkYWelyHRP5UgHTzDQFmURTGY1f/yU0buzYjs70vO3/Dtubt9cVZkWQQWgiiPMP5WFHkiQuG84UL7iPgctPmYpc+Zs7UNnwpPv13XX0nqQ9Gt/WgeLYNEo+gWM5nuVoucw8x6BFEMcnjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmNYZvSCgHk5nRyqPcPKZWNXYqA+yU5ENevpUUk1cqw=;
 b=XT5e3bCNpL+bMR7ExgFxoxaVGQ7QLyXdbye7KvjHFw6HX1dKzuxPLgxULfgu4ZrEijQFIWgzNeOX7mEitdya4f37UA1Z2eWjS6Ncz5kvRj3aRd8fcz8s0/XXYvrUFPoWGkKbAekGeycCABvaK+NHygjhmZcNCPkag9o/FL96xUs9ydg11FwLcHULgkZnhtO8BOSXhJX9pnONfexBLkOBF7PciOZDwRcIHVLo9a/NlzqmRSAgBJ5vf8H9C5hq+pxE6KVueV/CvQVza8E53KpI7eaEc5BmibCInvOvn+m31ACnTM9oi2cwtF8dzALKbZwZwk238IgYu1w2H4G7aCtr0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmNYZvSCgHk5nRyqPcPKZWNXYqA+yU5ENevpUUk1cqw=;
 b=p474VUKR7SWS1bYv7Ay0Va8XCv1LV3PONmZ69e3a8Wr5opG3+7O/cQPZi6SPvzrlfmTJdIM8V3TScZvLRCZxm4srib2BaVbmp72DNe3UUejjjFNw8qjE0bDXTvkKdaDjXj820Z3dPUXjA/PpRqzVq7TVajyFla3SonBdNkzaEwE=
Received: from BYAPR11CA0083.namprd11.prod.outlook.com (2603:10b6:a03:f4::24)
 by CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:05:29 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::cf) by BYAPR11CA0083.outlook.office365.com
 (2603:10b6:a03:f4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:05:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:05:29 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:05:23 -0800
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
Subject: [PATCH V13 07/51] drm/colorop: Add BYPASS property
Date: Fri, 14 Nov 2025 17:01:32 -0700
Message-ID: <20251115000237.3561250-8-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|CYXPR12MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8c2f14-2db6-48fd-0cf2-08de23daafbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wjwV5SbenUTcbFlNodpfUWlh2C2hbiDCw5a2DTm/Wr4s6TAk8Iycm5jywiWB?=
 =?us-ascii?Q?HekKtYhZVO/ZQJNorVqiqfMpoB3XwuOpCUcYqqOKzIO9D9bKMxFKLozhCmHX?=
 =?us-ascii?Q?V2nY02RKTi45Z3RhavtT1MVMffNotRH+8o2pY0TjDCWNgIteKQN7bshuZwyo?=
 =?us-ascii?Q?4EuM+BSDPp2hG/aD5HSkr5hnL/JAf6ydRScO4RltPnppKzGWUPM+5bfRF+wU?=
 =?us-ascii?Q?2gtBDth+LzqCnSAvtpDLNnEveK6PzbfixIi4fw1Uyhc9MotpiA0RJ/qCLIiI?=
 =?us-ascii?Q?KmfPssXCcxKTPg8QjwUIg9+U8POqNAZQmsOpEkoaE9e/h8uqfSewVUZdSwJ1?=
 =?us-ascii?Q?X40kZHd/Hyp5mRHi3Pw8nM4raN/Wc+XD7D92xuGQQoccRegFJNDMokr6Y+JY?=
 =?us-ascii?Q?Zn04/uqGF5KOUGnHb5yKOmHf6GTmOw2S1hVxSNEvv1MEqkHBRbZ1TFHBCAYZ?=
 =?us-ascii?Q?/2+Nj6vqBtqKz6MnrMXObBp5E8z85u+ALkx21kZWqZcujX10CjX16qaXOmHX?=
 =?us-ascii?Q?ri9apcqLbqdkDMNRgbbGFJ/3SoRwkX3QxI7vU32H156J2di1ubrn6fnAiQMx?=
 =?us-ascii?Q?ubXFcZSxVnx5zmab25z9r/Y5Bo1LfImpUZC/BljdUmm/BxT8GvEAYBtUbG/b?=
 =?us-ascii?Q?mH+y4kJGiEcbXyjxnTSYxOz/H4J9fkzga6n2d8AuOZrSNulb1guSaM0p8S9R?=
 =?us-ascii?Q?Xfy8r/k3DVgwsRQSV3tGQHlYYA2rnJi9Wjb1EHsL4Kky6pYW9bxRqrgQWpB9?=
 =?us-ascii?Q?IOnHlpVxPGlkMZpgkucgjP5F88MOFye4z5MSp3tUAnld3NvpR+6YuXbX18b1?=
 =?us-ascii?Q?MLOg4of96O0EFvXpWitF2r1wcq+HD/FrqGEYOwg5CWr+Rd39dlU4ncm7VB3V?=
 =?us-ascii?Q?OmfyDWcRWwcmIss4xY4g2N50WpTdr24bu1uszKjtaOHxcHi92x+Z92jipgZl?=
 =?us-ascii?Q?AdpTNPvGPNf2569Cm+3I70/NAtSxCGJwk55rukfPVdu+FLYZQ91W8OFkKExX?=
 =?us-ascii?Q?XN1jvSZeYy5ofEfRe2ebDkNHPef7tZaO4i2hK4Go9dE343aMnmwDUW8dpHF9?=
 =?us-ascii?Q?/lZLrZsOdkda5vgNeDk0OBq4ugizH7ZVd1MSLayNSnM/2nAOrAU1BJlYTYdU?=
 =?us-ascii?Q?LYU27JUbUPm1ZEdBpveodY33oEzjdEBIJPoejbWj0abdbYuk8DY2xoEjCF5o?=
 =?us-ascii?Q?0gA2LBRdw0vjOPZ/ebt2H1TeowgbLjPVkLjgFdfTTc6f2B/XTQT+AjN/alIj?=
 =?us-ascii?Q?t91QRQ+lIYh54nBMgaNTyy6r8ERvmhamuJwJ4Q0aGF6b1GuTnmc9VIYm9UPJ?=
 =?us-ascii?Q?dCeII69uhBUHjEkyBCHgZbJdc9vQIwhWahMhabhKVLm4JTzKrWFbuRRfohPn?=
 =?us-ascii?Q?v4jopTliJMEBbEzHC3mzGcreF4ItsvZQFkshogtUKo+zUWPQgM3n1+G0d6Ha?=
 =?us-ascii?Q?yx65jKdlDbanAPlRZjHWJF8fkoVuuYozFz506tDvqa476wo/69qgEqlD5hrp?=
 =?us-ascii?Q?A0uXcYC8oz4sL0ESo9hTy6G7bFYQqOeuL53e+x1dv1KUI8GDwfeaCyLeM6jd?=
 =?us-ascii?Q?dMDiFKpGGMPS0W1KugU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:05:29.0156 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8c2f14-2db6-48fd-0cf2-08de23daafbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v6:
 - clarify that bypass is only valid if BYPASS prop exists (Louis Chauvet)

 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++++-
 drivers/gpu/drm/drm_colorop.c     | 15 +++++++++++++++
 include/drm/drm_colorop.h         | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 2d13614d7730..7a3ae48ac4d4 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -654,7 +654,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
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
@@ -674,6 +676,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
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

