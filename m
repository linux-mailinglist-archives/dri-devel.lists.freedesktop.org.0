Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EE6A72748
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA9B10E7BA;
	Wed, 26 Mar 2025 23:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xsxauBMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4984710E7B7;
 Wed, 26 Mar 2025 23:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9w9+FpYUIOu3cm2D0TTq/POt7lHLH+0DSPh0vP6N5zI50XsFXzVaofFt4dPz2ZRLRSO+PbSvXWR3VlhfA5rAO0h+UgUTvVYw+7HVMWaFJn+elM6ZWbPb7UkFYkuPtU8ckDWO8yF3n28Vq0SLGKG1YnxpJY4ZiFX8JH3o34HvlIqBqxvTytXh3e4pbE1WOOBQi4aZVDogsjx5zguhoQlPy4w+z4Vaxanwe6uruOodQTSQuZw1cBfBtJJ//omlOOvEz94SM18bzUw4kSbZIyWISHzRttR9FHEMtbyXSHnNLobKycgcHh/Nwg8wUDZ0becNr346uhrArjewnJQ0J3Ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxfQR73G5qTmAWav+/U2XC5uol5/6SLq4Mhp0UCI48A=;
 b=fxVPNTaaBIKikq6xmM1n/yS+l/7wCVAgC+AeJc47TNKF0AsS/kgvz+1N8hDeyedfrqe/QTelzxvawgsErOh/23/FqRIToucVGNYbm5Y9YNULgsRe9xER7P3edtjDNwu4ZIQW3JITlte5DxnNkJBG/bfte80QUy1fsxHdvKADoTtk9EnbXQjSUWj02vCMU46JR2i9MWuJ8LQPEsBL7priL9x4bLOVEftYWG7HeaalHppjg648TtNdzFkKkmDNMbB12pvaqoWDljFOJwQad4fTPQbcvIQtWKfZnHi6mw+qtbQwuDcyBJoth8DjVyxupbTPig5Br6UAruDmsoooeFcR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxfQR73G5qTmAWav+/U2XC5uol5/6SLq4Mhp0UCI48A=;
 b=xsxauBMyVKNlN3scYBeP1Q9L3ozHobc2AFq42NkURFK9Qw4CqA2U1JC+U/CT9vpWRmfvNRhHzzWY4PSZKFycbvqrpUhmbDTZ69b/ahqVG4+mldS0ZRDvzuxGahPUxGJek9BIobzh2Yc08Th06nd3luRcnAzY22GXlAAdSX8kcEI=
Received: from DM6PR06CA0064.namprd06.prod.outlook.com (2603:10b6:5:54::41) by
 PH7PR12MB8154.namprd12.prod.outlook.com (2603:10b6:510:2b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:50:13 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:5:54:cafe::56) by DM6PR06CA0064.outlook.office365.com
 (2603:10b6:5:54::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 26 Mar 2025 23:50:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:50:13 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:50:10 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 07/43] drm/colorop: Add BYPASS property
Date: Wed, 26 Mar 2025 17:46:48 -0600
Message-ID: <20250326234748.2982010-8-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|PH7PR12MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e32a99c-a74e-4270-f7e0-08dd6cc0f3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HC1O9Bfb/rH1qfa+3EJAb5yN5E4+bDzXvv8L/gXcCUp9JU5rs8ppXspEfXbz?=
 =?us-ascii?Q?qeckOLgpLaPEC0MKJYBJtof3GY/jipZnriCT7AC6w4I3JK34kgJRI1GlQGeM?=
 =?us-ascii?Q?KCQgV3uL7khfRL5Oz4YZN0QDi5hULRqtM7FEB2Ao/7X6naWYZiWo7rSkUWKj?=
 =?us-ascii?Q?Gx2DfGuPDcqZ1yRWKpB0b/TDf+yHT+EU70CgmymFD167ujuaTzgpB5QR3G8z?=
 =?us-ascii?Q?4RruxpkURTMUtDdmSuV6BRHvYPQLOrrtLwFJzY1R8wyC6LGP/f2HGaK5hugN?=
 =?us-ascii?Q?r6GE9aYEe9QXnCMoqkENV8Q0+aC/puRS5YP1TzAE80r+QDfrldL5/AJchm6g?=
 =?us-ascii?Q?VxmWT7mo/+qlKbMHwZbZwFXmuvU0poWz5u1zboNeNpXiDzX7s+lauDw3AvlA?=
 =?us-ascii?Q?dVtvO7EqW7roUOqeK7hvA9lk2R1gHW9w0fKX6WGRSmF0wjIMrdNgdhPByo7N?=
 =?us-ascii?Q?qw3cHcL7zvTiQwv80q1rH9elRV909kM0GrpEVw4Hl1ePQ1y7VqYgaxrV/ySr?=
 =?us-ascii?Q?Ucrl2XcdPyKt/slx2xUnwpbdftCrltKgCC6BsZUHs/DfIlFAhik5kI+FBphb?=
 =?us-ascii?Q?COo+jtrYWAuT5jAJ3owl+Gpj6yAnkprLuK1mcAgzPdnZcb09/7I6mfQaAKo6?=
 =?us-ascii?Q?mhddrQeprjeJLLz+zdB4xX+d39kHE8DmZRXnCO0tCR6T0UP8lPxlbex/gJtP?=
 =?us-ascii?Q?h0nKY1DIpZD/FjQZ4yIIOcn8QkDdne+I1qW8WNc9BVKqKeqkUl5NVlmLJCKu?=
 =?us-ascii?Q?w9M9KC2mz06XcD1fJGc26HY1DIMPBS7fLLrcbzggSaJBZvpbpok/zXYIN3H0?=
 =?us-ascii?Q?yRxBxsqBkxBkyb3ob1GxVEhAUddQEYloVDZkOgIkwZz0JrJEFQp8+VeUw2y0?=
 =?us-ascii?Q?msdrvZLSPZbXeqLm/hP4g6iy7fMygnCc2sJZwwoT5sWgTNcmGg8EAuhtyB5X?=
 =?us-ascii?Q?mymxcJXwzCH0b0prIKy6zrWmDNtS21u2XiFxkuMW6itfZrMbFTYBrrCprCQ6?=
 =?us-ascii?Q?FbWoAXvI8kW6WRivQ6F9Xb6uDb92nck0eWpptsTpfQl1DjJU+lgt/7T6z04h?=
 =?us-ascii?Q?BVdpSwYWm9TlYMDbolMeX0hzQ3W4c0QdD25Qkkpw/f04O52adejobwTJCp1I?=
 =?us-ascii?Q?mbSjpZtAfON9uwtBqBZdSNTO3iihbbr4X+MLDX1YJ7GNrwczv6Yr7WU2Grf3?=
 =?us-ascii?Q?bpVULpEgtsIxi5BV/c/ye6VotggayJHBKV+NKCbh62xc//qWgZkEU7L9xg0Y?=
 =?us-ascii?Q?0zY3S6hGLm4mUNiqeAIlxxsG688IvqOpBPT0j/RcL3PDJGr19HDERcexwWnQ?=
 =?us-ascii?Q?HNxNTOSMheWZzwnm5gdeQqaiP8I8n5une+Gvi3aNK8FlJiQPtiXx6L2hHIg7?=
 =?us-ascii?Q?oPFPnYVcYSyzyW+u1ZA4KrYsDGCcbWKvxLNjoU1d18rNKa/g4UMz1Ut/QELR?=
 =?us-ascii?Q?ElpUsL2XoFowh6q8wQZDRD8NA0AyvwONVABwjo4ymLSI2W7WiAzy5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:50:13.6238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e32a99c-a74e-4270-f7e0-08dd6cc0f3d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8154
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
---
v6:
 - clarify that bypass is only valid if BYPASS prop exists (Louis Chauvet)

 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++++-
 drivers/gpu/drm/drm_colorop.c     | 15 +++++++++++++++
 include/drm/drm_colorop.h         | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index f75c987f8913..744eb3a8c9db 100644
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
index a42de0aa48e1..60edf6671643 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -79,6 +79,17 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
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
 
@@ -136,6 +147,7 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
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
index fc1b2e0f33e0..315d748e212e 100644
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

