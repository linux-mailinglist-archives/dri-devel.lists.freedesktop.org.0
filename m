Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C24D9F8B92
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AD710EEDD;
	Fri, 20 Dec 2024 04:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z3Gl5cSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7520010EEDD;
 Fri, 20 Dec 2024 04:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dp2qi9rqJSTkaIixswVBKIB8h+j16B4E8IrGMsMRjpDxe8qX7YuFSAZ1DDaNwk8VMRevBjZuS/jwsRA/p2Ngxe8G/5hpYSxrgyq6lR7t4PjypWTRmHJ5DBrZ1dJxm/Z+QM5FZeBbYw+6+Gt0IpsZcm9WAQ4Bu3g2G9xtUHvzW/PIuDb6Cx1MqG9REIkCefX0nptCWum7hpkX7QwbL4P4e+pKZWfIxnT1jihJXMgu3Job+x9FmQ0I+BOvom/oSWelqQXwTdjvfqKrIFZygog3FtX8t7AtX/el2lP4GKrOz8d2QLsWpd1wW+LImwUHaEye8IuA/OcA4ddrfT/WcCOC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXFY0nPGTeUNXRHwQoeAcILblw+4jAF5lmZnDoNZ88M=;
 b=B/zJBc4IsVqnOah5kNVdnWm3wkgV17HdEbrZmSdJ8MANX/5WCQoNo5S8dh7elZwkHxpsMzDULNBnykqsVSiCfx0cwIzh/icSh+mQ6sIpnu4Kigtw/LT2zZ5341i9Q1LZB7ti6jVIvcFLayckdqSNJKeDx8a7LMd9Y/hmC/ke5j9UFZu6DPzTQK9/QdaVR9udcLnVQsHV4WElNAysSyUo1N5mbi9kJhgJC/8MTL3EkNHLf3pnBd/RbWGMZJCa/rb5rR3K0SewiMiGHsQ4NNNowVBbPWvDCB2pp3VLYdGnMcNWEp5DnBexTye71+epqAUWoCWp/f4tQM1zwaRR5viY6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXFY0nPGTeUNXRHwQoeAcILblw+4jAF5lmZnDoNZ88M=;
 b=z3Gl5cSAfa8AXKE1PXFJhqP9QWHmKD6qVjv7OO50uzbEosLE/zWWQyknizMIgQno/R0UaWfOPd87sKw4TyRi0vBhbwkmJVrN3l4csFfNZEqoj1nq6c+Lkl9CqmTuWZnf8ZXWFUwtvqZ9HhML0iJXObuIVZ+Uk8RdvWwTxIvUfXI=
Received: from SJ0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:33a::28)
 by SN7PR12MB7909.namprd12.prod.outlook.com (2603:10b6:806:340::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:45:42 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::2c) by SJ0PR03CA0023.outlook.office365.com
 (2603:10b6:a03:33a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Fri,
 20 Dec 2024 04:45:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:45:41 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:45:19 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 36/45] drm/colorop: Add mutliplier type
Date: Thu, 19 Dec 2024 21:33:42 -0700
Message-ID: <20241220043410.416867-37-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|SN7PR12MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e29aaab-1985-4598-fa6a-08dd20b128a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L6MKfsdtmukmKqfvHzED/EbCiT1IMSwLxJUJFq1Iiq8ykWHcPstda3815o/z?=
 =?us-ascii?Q?MIgKRMs/AVheR5iokBhVpStjufuZs6/yk7/SRa/y4j+gbIoihgkEjY+6vW9K?=
 =?us-ascii?Q?iUPaazpYNQDiXS/wSHzOEirI9YxgycmhMDXeZgioyhm902b6XWlGk0mazGzq?=
 =?us-ascii?Q?LqEJgKWf/XAg8HMjJDdiKBFE+PSylpqJ/Ek4inv+X1gvLs2C50Z2D9Bg4qXV?=
 =?us-ascii?Q?YmG2C1mD7VRtGBZNQpP4+wA6YNXGFbVVgJj6CYD1NmGnb/BzILbnEAJYB7ck?=
 =?us-ascii?Q?8ae6tu+Lc/hV3Bu88WMdnDB7P85Vov8KNlNjxCZnh8+dkbTog0AlIewTxA2P?=
 =?us-ascii?Q?KTaVOxcesYC/GpGWJlm/J4D4UMa5l4uhOaeo6pJN6f/2vm8umqoE4/iaY+YG?=
 =?us-ascii?Q?ZaiCMVwJdHit3yW/jOp3xV11WnJrg13RMahXM+pRSvsJBL6xi3lAiwhqep8r?=
 =?us-ascii?Q?n3ymESO1kmXsZ8aRHagctR8ARXVUQeL1TCe2/lFzQL7ibK/0Bd/cvY6sOMbI?=
 =?us-ascii?Q?tE8eDhnfPQuz9/NNuBf71SLEMcoogjdzPD+CsLWNP/ZkYArCPp0J6WWpnrPa?=
 =?us-ascii?Q?lPPymZUEB2srBum+zlWJnNAYVIYmjRnx5m52Pp0ylkH0D5wklYRJmH7M5FxG?=
 =?us-ascii?Q?dq5brvgsdZckp3vtU4/JbPZlXl+e/sHSSDO67DRKhNWZc2w3S1VtEOmLTrT6?=
 =?us-ascii?Q?Rm8bpLN2swB/4xJaNwGszFt0DZAlvWQtW8Q3DZ2vb1BSJ9XZ9w2MnG7oIz+B?=
 =?us-ascii?Q?oe4fEZ5o/K/LalmPYvKC4XDfgDd8P6ZM6EAKpvTf+wYgw/NRpAuwNvGIhhLK?=
 =?us-ascii?Q?oCtiQGNIgIELpaP3z50EP7MeHT2hdLvPZ589onBELCUipgI861b7QLaZmcly?=
 =?us-ascii?Q?FWYozsvHyFl75xYntCSH6blN8a+sFlkb2Yn3fwOOmhfxED3Aez3fE1TlmDMQ?=
 =?us-ascii?Q?yWzInVfRI/hgOmbrXMoRiNn4JmZdwBKwb8oOBHWDFcFe9aM3orFw1Sa3kZO2?=
 =?us-ascii?Q?mGP/H6cUklj0Rs9Tm4X/nSbHSH7lsMjsjaPu9JkHbnBpveq6eiu+YDjRphX4?=
 =?us-ascii?Q?KTeCNSKi+GE79sgZYXjwicfZMj2tQD/hdkFAL82s8IkIkTJkvnLThxYSrNTD?=
 =?us-ascii?Q?qz0ZfO24yOQKjQ1WGGgspSW4Chm457VJdncpxQRY1Ts54UvnBYQn7sfoAgkn?=
 =?us-ascii?Q?5x5E04nini6ihZJkXWvHdfLHzr3SBwZhWkEbdW8xKhnkBDOVpP/4uf+wHOMi?=
 =?us-ascii?Q?rlZK/BoqpcutYJEW3OrwbVOFmBy2p7Wczy9UObC8WRgs2JGSuVlglch/+zOz?=
 =?us-ascii?Q?HMVwwjA91uc/VPfC/sb1Af9FihCHTp/VKJ/iueduKB7zbaZbw9iPrejiosxH?=
 =?us-ascii?Q?VoKsPpui76rLH7P472/SzWIeQjfkwLPkChGYly8oju2hxFOkjIVW7TC/BXQ6?=
 =?us-ascii?Q?PMJO4utgbcEswkx/GuJQ0WPy7KwtMIonHdxHCfI4oRS80ExqmxzE2Bw11Lcb?=
 =?us-ascii?Q?ByPRhNqM3biNOm0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:45:41.8444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e29aaab-1985-4598-fa6a-08dd20b128a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7909
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

This introduces a new drm_colorop_type: DRM_COLOROP_MULTIPLIER.

It's a simple multiplier to all pixel values. The value is
specified via a S31.32 fixed point provided via the
"MULTIPLIER" property.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v7:
 - Modify size_property to lut_size_property

 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_colorop.c     | 37 +++++++++++++++++++++++++++++--
 include/drm/drm_colorop.h         | 16 +++++++++++++
 include/uapi/drm/drm_mode.h       |  9 ++++++++
 5 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b7a05132ee01..1fa6818794d6 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -800,6 +800,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
+	case DRM_COLOROP_MULTIPLIER:
+		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 4744c12e429d..3c815a2a8d9d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -728,6 +728,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->multiplier_property) {
+		state->multiplier = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop,
 					state, property, val);
@@ -753,6 +755,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->multiplier_property) {
+		*val = state->multiplier;
 	} else if (property == colorop->lut_size_property) {
 		*val = colorop->lut_size;
 	} else if (property == colorop->data_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e6dea2713490..9fbfb2b89b1b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -65,7 +65,8 @@
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 	{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
-	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
+	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -286,6 +287,37 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 }
 EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
 
+/**
+ * drm_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @return zero on success, -E value on failure
+ */
+int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
+	if (ret)
+		return ret;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC, "MULTIPLIER", 0, U64_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->multiplier_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->multiplier_property, 0);
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_mult_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -376,7 +408,8 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
 	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
-	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
+	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index d3226ab7e1e3..d84f457a2b65 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -134,6 +134,13 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;
 
+	/**
+	 * @multiplier:
+	 *
+	 * Multiplier to 'gain' the plane. Format is S31.32 sign-magnitude.
+	 */
+	uint64_t multiplier;
+
 	/**
 	 * @data:
 	 *
@@ -253,6 +260,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @multiplier_property:
+	 *
+	 * Multiplier property for plane gain
+	 */
+	struct drm_property *multiplier_property;
+
 	/**
 	 * @lut_size_property:
 	 *
@@ -311,6 +325,8 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 				  struct drm_plane *plane, uint32_t lut_size);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
+int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 40cc5c661cff..96cb32e6980c 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -904,6 +904,15 @@ enum drm_colorop_type {
 	 * &drm_color_ctm_3x4 struct provided via the DATA property.
 	 */
 	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
-- 
2.43.0

