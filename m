Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8ABC1E3E9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7087E10E8A5;
	Thu, 30 Oct 2025 03:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="baw01YrE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013026.outbound.protection.outlook.com
 [40.107.201.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5912B10E8A5;
 Thu, 30 Oct 2025 03:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y793YbJ5UTZ05dwchc5td9jjGkbGmi1Vmw8Lq9zFMyZvEHt9IkyYqIxa6ZlbKmeJ6MDZNT9FsoC8WOK71M+BSHWLeBqGXP9qo7iya+Z0U+tlPDj7GrVsKcRj1lKVjjN24PB6S7xnENYRXp71n1veTKIwED6vcPxN5pzNLO3mFdXk4J+/8opS+UJJigNFAhTJbPyiJXcY5oNboqz1BgQT8iYNtyjPMLCih65aXje71zm0mvK5vnGAX53wawp8DGsD8KRJygnqdoHPNhnUtkp0clo9ArEKwGZHaEDo/miU38/uBeBWg1x+y8aAjfZlZq27J5CfjnzZ7Pbxd18eZ7PT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TX0VKxbKjB4Crr4iDefKNlfI/XnWJ2fDJsk2+ZerrQ=;
 b=o5VwcRG+9tCbDgNrEP3RWjgymPMg0eEgHmQnLO6pOyJc+m/IUJ65AOwwos/bkAo0+WLVDGmqMvFQRcFl2FgIDMvN7+0vOQRzmZyNFot9w3RdmF2HacV2I1Sgxxb7aSWlqTnxEa6AqAtxpmPM+QVIPQHtAuyrAiUCediW807Slj+0nXF9b7kb4FnNJmCNeMxBdmX6mmMDkrIZry4FlCQoCRLAliSdVnELvFXFBJHt2GY1w67nab2oU9XDYCmemwDycatY0HcOSPi9DWfCP4lv3qorOwweZsqWVIVrN6pP4EpPB1Z8JqUkIGoCqfVMcQrAfimUJFCP+qSHSrrTlHO1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TX0VKxbKjB4Crr4iDefKNlfI/XnWJ2fDJsk2+ZerrQ=;
 b=baw01YrEsBjHCvvSlRPmAmve7uJAjR7ViuQOvS6Dcj36kRF/EgbrF86+Mo8HPLgYPNC0/GQ++d1WSBsrsNZUhSUjJL9gdko7xHG3/n43O6apNiPpeGmTX0/urly9CE3Aqe9W2skDiMMUJVa24X5NR6Do0FDKJtw/y1Ey5Vp/+S4=
Received: from BN8PR04CA0023.namprd04.prod.outlook.com (2603:10b6:408:70::36)
 by IA0PPFDC28CEE69.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 03:46:12 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:70:cafe::28) by BN8PR04CA0023.outlook.office365.com
 (2603:10b6:408:70::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:46:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:46:12 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:46:07 -0700
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
Subject: [PATCH V12 07/49] drm/colorop: Add BYPASS property
Date: Wed, 29 Oct 2025 21:42:12 -0600
Message-ID: <20251030034349.2309829-8-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|IA0PPFDC28CEE69:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ab1821-183a-4297-9619-08de1766dece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VUHqw/T6RIuZ3BbMMm7tU1b2jq/2xE+MknkJvuaVViK46jfBTo2PCDu6FPkB?=
 =?us-ascii?Q?t3FCkSbRGbdam4pxz4SLPG3UaS2RUMfbbsor0C+d7nPSBk2lkjNXVYKNd5V7?=
 =?us-ascii?Q?xCE26wuJLT/wRIi0ILGUtSG6K78SS8Cm/Ah0vndZ6J6Ke5EgoO4CcLEtuimz?=
 =?us-ascii?Q?/23lxLKcxUqFTGkItjvnPeBPFqRqXKgz3BQEvhX4GNaQFzzXlzFMvgborSWK?=
 =?us-ascii?Q?PFRZdet99Hv7hhyhJiIgD1Guuatq88ylWM+jo4R0LzFZBvfJdWMw1UTeRbQr?=
 =?us-ascii?Q?HDH6uVIn4FZ3fJqHIhYZGTO8mlkLtAnBhaQswNaDKVFoyTQbjiyCibZG3S5k?=
 =?us-ascii?Q?yFky2ch8NnpjWPny2s5SPZMUmoltbHEN4nqL8Vj/4eBrknPbD32I1FWuIkW7?=
 =?us-ascii?Q?n7CkCVfdftK43GphwU6LF1g3znFVE2CtG/LQvpskVQntzI6XYJRTO9u+sQd7?=
 =?us-ascii?Q?QqZytyI662xWEQhC2oKm3LCltF+GnFn3090bA4wBulRq8tsL6QVMVzt6hXr4?=
 =?us-ascii?Q?nt5W+6YAbxN5fCalLqU5TDtw0np+Ch3Zp5XY3bLQhHTXz/yRxpZpWO+sfh50?=
 =?us-ascii?Q?GRNjNTVACEwFMzUzAaku0tp0C5vU5AENCRqkELnP18mWQjMccS/AC+IOOFlV?=
 =?us-ascii?Q?vhBQza6jrxEgMWKMK/NytSrGRqy3NRWM9tkUMxhYltHoz0N2p1USrtc7NVEu?=
 =?us-ascii?Q?0mbHI/SdY3Co/iOIMmbv33H7UTCTCxH3u8Q5khv0OpTigA538Ll7pJsW6gBH?=
 =?us-ascii?Q?hx/QV8cgYGvncJQuR7VAtYth/c/gg8bNRoK8LqDuSKrnqmTIR/Kx65ELfVKg?=
 =?us-ascii?Q?jVFpcaj+rDZoLcLwfoI8aSe3e1efliAxzo47nPv+cpkHYrGBFV8RCHet136X?=
 =?us-ascii?Q?ODxeDMVa6LFbRn8wixA9XCnZ1w2uTpY+HdwkGSwJCa1DTdhWYR/PYXYgB/cN?=
 =?us-ascii?Q?CD+ONQQT8+CFRd6hPaJXYJJ4Kl2QBGMyuM9rTgip9s7RaogqXs//Utq8NC5A?=
 =?us-ascii?Q?Fu+3kMiL6yAZeJAmkChudCY03sBHMKV5nEXtzBXVSmylkcADA5lMfsf9fAuA?=
 =?us-ascii?Q?crul1Z+Lb0Rr0Kcgrxw+vukptwDIUdOybfOuMEUyNy5W3x2gsOdPiE93hOH0?=
 =?us-ascii?Q?4UNxEDmPJBc48DMlCWhPGTbl63tlKS5KNI1VVCFik/GVfk8NZzdiW4MdYwrQ?=
 =?us-ascii?Q?iB7E/k7K4THMdlhERXtI4Khf+zWVgePq3Yuq03xUxRuKasNKADXMI5BEABRV?=
 =?us-ascii?Q?sj5UDv6kBpKcTTSMVu6crQT/jzRoYc0gkI7/YoL3YjIZqJkcQ/2Xo/H01qVg?=
 =?us-ascii?Q?4JKP1FaqgBuoBXeAZN46+SMdxQaK1EIz03CgApMc8emkrIQMOgMux/2pWxqX?=
 =?us-ascii?Q?leYyUxBG/zw/ApGeNcpY86ErX383/ikFniSaaA0sHQXALB0dz/EfHhPk6/bJ?=
 =?us-ascii?Q?DN9bQ15gICLdM0x5R2uZJvG8Z7VIYLQaH0hvqMpecRHZy0LiuRi5bVKmCX2/?=
 =?us-ascii?Q?9samUatXw1yhJSvN06D6XtRXuUMX8N5/TnpVgs1bwcxJUsbcJc8iLpm6cuBG?=
 =?us-ascii?Q?FPi0E1BTlHyIOk1xXQI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:46:12.4957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ab1821-183a-4297-9619-08de1766dece
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDC28CEE69
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
index df8ad79577cd..b8307cb7682d 100644
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

