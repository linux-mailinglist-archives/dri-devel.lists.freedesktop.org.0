Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167309F8B55
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E9B10EE77;
	Fri, 20 Dec 2024 04:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D0OCuOyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB1010EE75;
 Fri, 20 Dec 2024 04:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kweS/lyE4LtDviBY+v0U3HLrLjFWE6BP5Ysc6kmmoorqKcY81KuxVVao8Opej4/m0PpjRGzQXE124i6MTehIE04BoiOcIt4aCFuFEYUB9I2+B7OzwuR2iXDfYrHsfWvlFZjtTK20VJ8sgQRush1CGPP3xhagYy65eFmXbRjdUII98osm0gzDQpjrwx7VoqBwd1DgsHjyWkP9EPdWbaLa0DqWB2oDQ+UoRmdxitsYR/jXZsR4uzFyQPovF11P6Y0mYxtWRn49GiPg+OdF/jkBlWvWJaefeoaIyYaXz3wmDycgmOAQ3mh+AmEdLrk0/ljPMJljpjL1kgo/DN1rvR0ozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQSskt6l4Mzcn+K/KjIlAonxwnZrSWt6TRBkLn6V06o=;
 b=rj5XuJKasz8g8SMnAwvWz/vce+GLePQSMmA2slmpncGRnwY29LoOFEeXcdsb0XsQjqFSC4BcH6oynrqvon2l9IG2UNAM+9X+d3+1GS7CS91NK7llaZDnNzYrdCckVVID++AnyKR3ChqDbY1aQXyfJaHIBqdvLRmlvxV0k3xNKNls9ImG6FrR6LuLJXRoTXRd0meUm3v1NNXlbJrp41cVKWpI+/pMHT35pIKZP2Apxe62xeJPtmWNPvUYkPnvWFGte9b8X78l92El/ovb1UoEhEQZok3AnyVQN2tGAx/ti1/HI8UgvHQSDBhL0AEU90r6jdUK6bl9EApJ60Hijyb/dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQSskt6l4Mzcn+K/KjIlAonxwnZrSWt6TRBkLn6V06o=;
 b=D0OCuOyICCZiBnnnr3Pq//0JPTWWm+wnhvdhb4XQkGQ4l5HjoYuhCo/S4jZWxGGw2EDH12mrNwDmCKBjt2pVTt6snZufVgLuTJGExjTUX9Rq2utiJmlAkrlAyI83sd2MkGmjDbEx9sbrqjzvqNAkYsAULuN3eBCGFFwwhvoGFnQ=
Received: from SA9PR11CA0010.namprd11.prod.outlook.com (2603:10b6:806:6e::15)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:37:51 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::10) by SA9PR11CA0010.outlook.office365.com
 (2603:10b6:806:6e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:37:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:37:51 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:37:49 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 09/45] drm/colorop: Add BYPASS property
Date: Thu, 19 Dec 2024 21:33:15 -0700
Message-ID: <20241220043410.416867-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SA0PR12MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: 79002163-0975-4282-8a1f-08dd20b01075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lUgHnfhw2D00oyru66/RDeZv1iuTW+7qX5xr36q3aTDhUR+Savw6DQvE7Eiw?=
 =?us-ascii?Q?pk/U4jrTYe2dEEMSUmHnmr9THeB2yxBRkSrCA2nR3WvxmeTnAv6mwwtxOn7d?=
 =?us-ascii?Q?MnILgBdshmKC4avPtfpYE81zemK8daq/2QhTSjTgzdwqGc7ut2pmc0Sm36nl?=
 =?us-ascii?Q?TrFZvlpoMp1i5zpr2irTy3dqaNL39CYjahyC+LBV/fUm/0ju5N1Y6q1KZeTC?=
 =?us-ascii?Q?l72sqWAKe7zFNHbIemeAhA+KHpjtJwEW+yQVNaIXJ0a6m25LUO3J9g1UK+DG?=
 =?us-ascii?Q?xYNh6gk/DtmdfUiyqbNdHELRxDZtWeMxrVURlF84ABYYAq57u1sAHx7x1v+A?=
 =?us-ascii?Q?qJV957GiuyIr20NAVK/RUG2CuVFkwnSm0uGdaoeDhDsXEntsXC1Gwqno2Nie?=
 =?us-ascii?Q?lO9aW75A/dCmavKtPluc35jlHEE8+eBzWudWRR8JHxO9dnIHv1k1VTKJoih9?=
 =?us-ascii?Q?ZmCymDcAshBxHDj73voOTVCfOQVu8NzDgAygCCCjePHFloJzpoQGH5qRKMhY?=
 =?us-ascii?Q?JAHjcv77l69o8Fg8zQ8aTH+N1Pn/BnxYYwLxeilMmq5jMUFQ/ycgiMS15/kh?=
 =?us-ascii?Q?bQbsneK7iQBeF5tDUUAB5lrfrJzSYQu/Uo0vYbNJTWoxnGXaUtT3zK8Uoo9v?=
 =?us-ascii?Q?XOBuarHwHfKSJOeC4SR33FdDLMnXSki+NBCgqAxrLqMmZx2hzyCBFE+xi4I2?=
 =?us-ascii?Q?nyGvfVJ8IzqtvvyCagmAhwT+Ll6PLIyZ1NSZrLT59HspP1FMk+XpGi3qpDj7?=
 =?us-ascii?Q?lh1hfEK9LS06v/76E0jQBqMKC0Urm34vKuoXTaMceo8ctBSnDo8YNziCBZ4A?=
 =?us-ascii?Q?79GilpoNwec37FKS0vDnwOsFZ0L4z+xHjlBcaCVOTX36+dBLtjERXwfHqFA2?=
 =?us-ascii?Q?5zbNLYBmpQ76LRfzTdkfUmqC0CIJ0o9PnLPX1TN/hInTX8MeUgOeqV1tO2i4?=
 =?us-ascii?Q?MgcwaAQonalpf0vg/HCy9UrtIjW5P7uut17vwK/ic3Q3qCGiPd/Q/b8z0uCW?=
 =?us-ascii?Q?UKl5DI1omoM3V8Wr8HSBNDUah1zZdzP8N0j4rlJZYbq25owNs92fzkDceYti?=
 =?us-ascii?Q?H6wtk9dBeCiWHLfT4gN0PvWPxMKpy/Q+a5ACKJc5p5mxL6OKZiWBz0JOmuT1?=
 =?us-ascii?Q?3ZfLymat0l9xSBDOp7DLJic6yAIvE0Kl0zw64DJfKKXpis9UsbT6c6Yjiex4?=
 =?us-ascii?Q?u7Pl51Av9NeZhV960YB91ZQ/8ptFUbUKqByt+wTu262YdbLCy8VY0ZAVejfe?=
 =?us-ascii?Q?f3jEI7l1IfQlmZMOoEDwGrqWBWPtXO+r5/bkz6KeDSwhBMwUnqehPekLvAp3?=
 =?us-ascii?Q?TnR9oAE9rFtbDz95lyVQBBDKpkLG/aYwDDZSxNLxDdFU2n9nTsf2g1Ao9zlV?=
 =?us-ascii?Q?wUSdlDbaNVt7sv1D/fq+zxmLYMvq9yahLiXizgx6Hgci/remEns/kp3ehAkL?=
 =?us-ascii?Q?SnU/oZJdEyr4DqNQSMNsfd1ZFGc+CL+M8R11ZP9pG/3I0BtwVpv9bA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:37:51.8012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79002163-0975-4282-8a1f-08dd20b01075
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v6:
 - clarify that bypass is only valid if BYPASS prop exists (Louis Chauvet)

 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++++-
 drivers/gpu/drm/drm_colorop.c     | 15 +++++++++++++++
 include/drm/drm_colorop.h         | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9a5dbf0a1306..8a038e04be58 100644
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
index aaaf96d729b9..01cbe90635e8 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -110,6 +110,17 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
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
 
@@ -167,6 +178,7 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 	/* initialize 1D curve only attribute */
 	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
 					enum_list, len);
+
 	if (!prop)
 		return -ENOMEM;
 
@@ -183,6 +195,8 @@ static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
 							struct drm_colorop_state *state)
 {
 	memcpy(state, colorop->state, sizeof(*state));
+
+	state->bypass = true;
 }
 
 struct drm_colorop_state *
@@ -221,6 +235,7 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 	u64 val;
 
 	colorop_state->colorop = colorop;
+	colorop_state->bypass = true;
 
 	if (colorop->curve_1d_type_property) {
 		drm_object_property_get_default_value(&colorop->base,
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index cd5a754e5d10..5ed24d60a99e 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -79,6 +79,16 @@ struct drm_colorop_state {
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
@@ -163,6 +173,18 @@ struct drm_colorop {
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

