Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 128C3957606
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6859110E39D;
	Mon, 19 Aug 2024 20:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nrJjbCKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531E110E397;
 Mon, 19 Aug 2024 20:57:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyVPgCLkT0B+HvMWY52XfIWhLTrTPXk6YT7RkBqp3qz8GbfHIwUl3QklzkqgjxJi+lwVKW7lXvIe/0CFyG/rCn9QNhETJEoCtYFPV8sZRWMGJ1/JnkN1ym1rmIeWAKuqIvnJAbvpXZ848PyO1lnDEIv2QtZ++TIZ52st6xnFY+sETGKctVh9oC4zxlVx8fn59gWSJAAk4RYwOYWXlTCVn0x8aTJ0+Ni4DAxBfF7i8MYQyQDVKpwHcIg+2KgqdzTm+KowSc1ZlLCqEeE/X455CevXPzr+lQx6vB64Thiy5gEAEUpfnf9olW00on9cr6d/7I7dLNAe/GsWWkOohK0JyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c38UQo8uhhTAmQIlqRUxg9SpKD+kYzIORVaAses30Ck=;
 b=H/MA8kuc2bWrB25bWNWjFt5yIGtEtz+PNbOdUEQ/yDeoaaruKjhcDqUAvknnZLTpz1fR5M7eqfeN0iLDseEWZMypFmmKOQVMBP83eGORSVtb/jIq016W1/K0kmdjFJEDK4zHno6Shi6MPpCNFVs4DS0TFDjFmqfOmwaU+/3V36x5Vns1avIsnijga9NVLsbHUmmsWmoRXgaAMUeRfKSBDengrpvw3aF0Z27UDIsvzN+u5Z1mPvAKn0wgzIZG/F2SYoA1LCTjXJMhsIKv3KojDEr16m21XY7pAKOAecP12Rn4AGgVT0mbVvPOmTU4hARiXYExU2ClNjTw/ZQcdgBW3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c38UQo8uhhTAmQIlqRUxg9SpKD+kYzIORVaAses30Ck=;
 b=nrJjbCKxRCvBz4S5eeHX472aZptYFFrGw4CsBIwzW/krM3ys2Ef4M1URavd3DWCu7e8e2+VeiEYNEQuegfHRIS7GwTUMnZ+9W1hCTGI391sBcUu+tqoQDdJVT9uwoqeiaB3T0RCl4AkQY0cwlSbCXPypFu8M5s0xrhcy46deDRs=
Received: from MN2PR17CA0036.namprd17.prod.outlook.com (2603:10b6:208:15e::49)
 by PH7PR12MB6738.namprd12.prod.outlook.com (2603:10b6:510:1a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:27 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::61) by MN2PR17CA0036.outlook.office365.com
 (2603:10b6:208:15e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:24 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:23 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 09/44] drm/colorop: Add BYPASS property
Date: Mon, 19 Aug 2024 16:56:36 -0400
Message-ID: <20240819205714.316380-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH7PR12MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4b3316-b942-449f-273a-08dcc0918884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ItguW8zWdQIV5gNsURqLFnh/OsZbAnkaeFhAkhkyHoe7FvTr9eXart2hXErv?=
 =?us-ascii?Q?4V6EGLLL6UqLfYKdrLgAzvSCpyOfI0o15m7+AxKm5JzfJyUDrXQafDwLLUId?=
 =?us-ascii?Q?OfqyqjkDahiiqpIs9ceL+PTi/kXzrHviAlnj79L9Mr2jibxn6qbaQCUYY0rW?=
 =?us-ascii?Q?hgxlvDUquadFPL7af8bqhCYLgoUwNAkrJ4ZHvmcX5snKidxTrkIP5HiQvUuC?=
 =?us-ascii?Q?IdHtxSAj5Ig3wmKQabSP32T+nl1OM3sa1XNT3zcxpIN4TA3a1PmoPNeD6b2q?=
 =?us-ascii?Q?VDcRsbGoGBwJxiXDhPPa4bjAt7VCHV5xg6M8Ogvn8waWk6fXoP9eXyrIiDYq?=
 =?us-ascii?Q?Pxe25hWi4Iw8ch/FguldssJTXpiaYxq6zkYbDAygLIn43OAyLmb05vSkKRF3?=
 =?us-ascii?Q?c21xgOZ/jCLVYJUb5pYtfyrKgPVg28/5P00Alk03U+sfBLYBYs3G9G+4fV1T?=
 =?us-ascii?Q?gkbP3cv2PR73yl8g1x2DRkJePhySwUblH8gZ5o0uoCBBIzINHE0gqZxFDJTD?=
 =?us-ascii?Q?CjhIoAYqbfAYA7XzTcNpfBD4oByAYJeafNN2nHFR/vOdBZPlCg3tBeAPLsqn?=
 =?us-ascii?Q?naWe2EpdQcLfKk9MzOt2gNwba4W2Wy6URjEHVm9EzS43lDDAdOyl80J65Snd?=
 =?us-ascii?Q?j6R10iRSNtuF6QoJvzLip/2tP7v/tm8PiHQ4fgUCtuX2RwJyJ/ZxbkQuzlc/?=
 =?us-ascii?Q?mT628mRGVrtQFWIiAgggJP3RUhknTq8n6780JyQc+3YDc24IQBFs7/cF7MRJ?=
 =?us-ascii?Q?UIzdXWJgjiAtmGJEGX3aAdr47oNaXkb9R5rJXOF0oR3qb1YTZUFfRVye0I/Z?=
 =?us-ascii?Q?rXFd5jSThOTO5WkUAicpGl0cDVHgh5Bqki4+BroH6lgYNK7Y+SBLFFQMluee?=
 =?us-ascii?Q?yh3dOhVxJGNgXXB7GmP+vSshSR2J8NG/ANZSX9K588bmyvPpp3Xaj5ucaF+w?=
 =?us-ascii?Q?EQHeE8IF1RCOrVT4AOKu9sdH0RtXQUicQrFF7UGhRr8dUUcvVPfTg14xx/Ga?=
 =?us-ascii?Q?kmqDKAj8rDgzMVjKCzJXrQGIdnKrSisEkrrHrE7VxgISSOKUCaGW8PoCvds4?=
 =?us-ascii?Q?YliDSid3EmJi8F778hz50CF7xo0bOLnurLchlm2YVl2sESfxEv+pefL1CRPy?=
 =?us-ascii?Q?uHjZfGprcOIIFpNHnTYPAuH4ATtJ0DbgDj7vZCdYOA+c+l4P3UyKt+kCeLlj?=
 =?us-ascii?Q?TuJyzTkA8bFhvbZ7vpEBoc8qyh3tj2lRMmMfRJRnGhLWIOpkNSKMWxTIsAfi?=
 =?us-ascii?Q?ytDRex2dB0mve+yMXP0CTCUQkj4zN9Racy+QeJMjufXNrd1FFKc5AAL/IgEm?=
 =?us-ascii?Q?hTWTOR16tFRMWkuo4GMqFgbAAElFyXc4D8VBSzYQN4DMHxKjI05MrKaQy+kG?=
 =?us-ascii?Q?BWLxp3hIU++baa1Q+PHB6WgBFXQ0fV1KMLFGxMg+eUNhE4wl9WkLhSghL/Wq?=
 =?us-ascii?Q?0o5ZEHqT8t07Tc7qfD859B/TAwa+8EGU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:27.2139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4b3316-b942-449f-273a-08dcc0918884
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6738
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

We want to be able to bypass each colorop at all times.
Introduce a new BYPASS boolean property for this.

v5:
 - Drop TODO

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++++-
 drivers/gpu/drm/drm_colorop.c     | 15 +++++++++++++++
 include/drm/drm_colorop.h         | 20 ++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index b867bff49f67..419813be21b0 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -648,7 +648,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
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
@@ -668,6 +670,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->bypass_property) {
+		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 5b844daabd44..054e7f01151b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -109,6 +109,17 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
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
 
@@ -166,6 +177,7 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 	/* initialize 1D curve only attribute */
 	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
 					enum_list, len);
+
 	if (!prop)
 		return -ENOMEM;
 
@@ -182,6 +194,8 @@ static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
 							struct drm_colorop_state *state)
 {
 	memcpy(state, colorop->state, sizeof(*state));
+
+	state->bypass = true;
 }
 
 struct drm_colorop_state *
@@ -220,6 +234,7 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 	u64 val;
 
 	colorop_state->colorop = colorop;
+	colorop_state->bypass = true;
 
 	if (colorop->curve_1d_type_property) {
 		drm_object_property_get_default_value(&colorop->base,
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index dd6943117461..7ecf4e3dca4f 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -72,6 +72,14 @@ struct drm_colorop_state {
 
 	/* colorop properties */
 
+	/**
+	 * @bypass:
+	 *
+	 * True if colorop shall be bypassed. False if colorop is
+	 * enabled.
+	 */
+	bool bypass;
+
 	/**
 	 * @curve_1d_type:
 	 *
@@ -150,6 +158,18 @@ struct drm_colorop {
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
2.46.0

