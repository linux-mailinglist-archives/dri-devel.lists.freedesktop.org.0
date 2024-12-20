Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDB99F8B9D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C4810EEF3;
	Fri, 20 Dec 2024 04:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ta9Kl3Tp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6492810EEF0;
 Fri, 20 Dec 2024 04:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iL0PMs5MAvfksE6CFehWnw8idGWqi4A5vO98XVxrg3EVrwIbrJjRhkNrXH6ufS0kgO6vC7Y2R8K4TKNe3uf+pgjqdmpf6Y+JSi5KcY1+T9qN1iXiA1tUcL08BgPg6sSLRH2V/HMAhxFFvsOH+kTBXZHb1Q2LOJ6E/F0yYINjdqo/K93DgViz430Q9xHlWG2yoVqHM/gJ49ADMdDYFe9Pc7BAzT/PBdkkFEE7IhMSCJl3KF3sOGa7fJHsgr5N2bXXL8ObWhzVokXNIlCOVauMM8VCRMBKtKJyNtQGUiZKoKYnKQ25udfpwbKafDGaBgnCX/kt2D8uD08RPEbxvRwoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QE95C2aXynRV8PuFopsB/8YGiMpl0ur7C/p5yFPu2Dw=;
 b=bRin4pwt4UAiDmYLtD7PpPFTcVl0/J8qt4NlOoHkIZhBSKffh5iFBeEqWKsuDsBBCRnocKeW+o6Dc81JdtSXnlwFxKuLbxrHlAQh0jZkje2SiqZl8eyBZOdVAEeVl0+9/6qFbFaPuEGWFm5GaZ1QlZpD0lVrZTouSstlJS/omyGquGdslEOPNyA+b88DAsnDW76gx+M2B9hm2UI2pO7iiP4DZXvI94KtSOAq3la8eGgg+ghceOeseZJGlCqbwQl4rWtvFlW9zU2SAFUIxML3y4T1ezr9J3Goy4LYN/5Ohi6hzG3gRrUhwF4y83bAxDKquWMNmcQb0X4uQ8dumrpkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE95C2aXynRV8PuFopsB/8YGiMpl0ur7C/p5yFPu2Dw=;
 b=Ta9Kl3Tpo20lnZT045XclqmD3v0l/nIOYNlnqMKY40/QpSo8OwUUiWSbkzlhjSt40wu4yNBRcT9sHoxO1iIw3Xe8Ip6fV/85PEIBxmYD6RAGFi18rpDyJ9oqsN93o5G56xkGE9q97eUuT/ZuttSHzjRHCY19tG/pScY6e2D/7rA=
Received: from MW4PR04CA0273.namprd04.prod.outlook.com (2603:10b6:303:89::8)
 by IA1PR12MB6625.namprd12.prod.outlook.com (2603:10b6:208:3a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:46:45 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::32) by MW4PR04CA0273.outlook.office365.com
 (2603:10b6:303:89::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 04:46:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:46:45 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:46:43 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 41/45] drm/colorop: Add 3D LUT supports to color pipeline
Date: Thu, 19 Dec 2024 21:33:47 -0700
Message-ID: <20241220043410.416867-42-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|IA1PR12MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: 380b5ced-d35e-4f9d-148e-08dd20b14e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UboKC3zUJz3t2owF6i7vBS2k4SAFygO64zYQL4ZB2XX9L7V2NqhUmUIJEkz7?=
 =?us-ascii?Q?wyqbgrfOvov1Rxefgx+giMEGfK/sQDSqgbt1FVEg6QthcZlI1uHBYqRmdGdQ?=
 =?us-ascii?Q?m2zv5D0rFvYCEtUku95PTrDmUSqc3reG5YFCmUw23CEr43uhAgy7QidhHy2y?=
 =?us-ascii?Q?VYCFjHcc7nVoG/Q4GyCazUyujhOgXIvaNvAfQqc3Z25N41DHvTNSLofgcbkv?=
 =?us-ascii?Q?LZqTPG8IxvjfCZfrJsiiIeh1JFH3I1MtNkqiJF18B4LdRjS0hVQV5UqKXSHP?=
 =?us-ascii?Q?pQZXXim0Pt1nkrHEmsI8e6y+0GOqDtKiEztHBuIY4YPnnlvuc7OYlMK9AlOO?=
 =?us-ascii?Q?9ifl+eboZjFVMzAc4Ttb/l5y5lLJKcdr4vfFitQrKNwUUDLEWLBTcbi3fl+s?=
 =?us-ascii?Q?iHFQdwRanJ2Zfjxjv5FJgJWLQ0a2zNVhiC4JvbofIxbK0J0Yex4RW7ljr0W/?=
 =?us-ascii?Q?/Peje0+1ij9Vw5ZtRumHIvqD8TG3B82ndMOTp4jNgqvwlXM799OaH3uT4G5M?=
 =?us-ascii?Q?W9DXIbCUjLbrZq7hyow9ajQoKLFupa2oKyvle0xkipxdq9B/s/tfzptGiYh+?=
 =?us-ascii?Q?L9O25asYQggALSYO0sab8U7p4MERKFKW3MFUDrl9uXLiLTas/l6agRird/yn?=
 =?us-ascii?Q?JHxDaFW3r99kg9uHy4eWhauW5dX2XZ9Zbp2NB618ZrI8zmJqP0bCW3rE7SXH?=
 =?us-ascii?Q?0+BhO/We/UfKlRSoQuTAQR6oMGQ6lsDjAiIBCVPPEwylQYLYO7sLwYsfFsfP?=
 =?us-ascii?Q?8gMHWrpAnVzpCawC/FYWPhJyRWrMGUX9Z8e9jowTgQeCqHXnGofa4KtH+Aw/?=
 =?us-ascii?Q?uzs8OigpuhNMA4BixwTmG9mOez5qpk8i+4KRBXaK6sGw5dKG7aMidJ0O1Asd?=
 =?us-ascii?Q?nQ4y/Ot9vc2jQe06fj2DJOsJor9Sts8EvM7k46etlTRxwvbagpoFcREsMbuM?=
 =?us-ascii?Q?uHZylb845G3BhzCEcd5GlWymE9OfLjXbYiANSM3gyBCZUOKxJ9Jgxg9626UX?=
 =?us-ascii?Q?/QCzF+jRWMSkOnpi4pzU+aiZbcMORFN8bZOyDDOCIWp7MKzXgHsGnBsH8QSq?=
 =?us-ascii?Q?oJkbCpXIXeasWEs23tSP6PQD/6QR07rM8xSkMWMYm1wfXfDjAtW8vpgWqkeE?=
 =?us-ascii?Q?cZ7MPiaP31fJ7PjgG8T39T3PYjHXbD9FncO4qNWmKztebav08V3QO6EyQoK5?=
 =?us-ascii?Q?XxWQLPLO8ghvOndLrTfg6F4Da2SwpIKHXN89KJrGNohNWufBdqnYqKzinXlk?=
 =?us-ascii?Q?JtsyiHR03LpMBt+FHwGfMrnpjBdbKj+rdHnnYqsYceet7G1L1ZeUT1qnf3KU?=
 =?us-ascii?Q?VKyocHWZb3RN/HyASb/dsYOYdZPa3bd3HHOxiCEmdKOCPLkWZqQP+sA2m/mp?=
 =?us-ascii?Q?fYaWUKcwH6QwA6nFBaiiEXyGPi8m7NitSJNPPz5ZzeJL1Q0iNwZkUgLkyv5o?=
 =?us-ascii?Q?gG4INCjDE6dXkGnl8wEbafvh8FSlCEGWOtuxF3FEW7d/xgN3CiOAboBSc+zh?=
 =?us-ascii?Q?lvhPzpLcg6e3YOs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:46:45.2577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 380b5ced-d35e-4f9d-148e-08dd20b14e76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6625
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

It is to be used to enable HDR by allowing userpace to create and pass
3D LUTs to kernel and hardware.

new drm_colorop_type: DRM_COLOROP_3D_LUT.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v7:
 - Simplify 3D LUT by removing lut_3d_modes and related functions (Simon Ser)

 drivers/gpu/drm/drm_atomic.c      |  6 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++
 drivers/gpu/drm/drm_colorop.c     | 72 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 21 +++++++++
 include/uapi/drm/drm_mode.h       | 21 +++++++++
 5 files changed, 126 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 88219b095d99..d94ea4e11888 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -806,6 +806,12 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_MULTIPLIER:
 		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
+		drm_printf(p, "\tinterpolation=%s\n",
+			   drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 3c815a2a8d9d..f742a6235c12 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -707,6 +707,10 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
+		       sizeof(struct drm_color_lut);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
@@ -759,6 +763,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->multiplier;
 	} else if (property == colorop->lut_size_property) {
 		*val = colorop->lut_size;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		*val = colorop->lut3d_interpolation;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index dfff8e37ff05..e3dd49c0080d 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -67,6 +67,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
+	{ DRM_COLOROP_3D_LUT, "3D LUT"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -82,6 +83,11 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
 };
 
+
+static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, "Tetrahedral" },
+};
+
 /* Init Helpers */
 
 static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -349,6 +355,51 @@ int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 }
 EXPORT_SYMBOL(drm_colorop_mult_init);
 
+int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+			   struct drm_plane *plane,
+			   uint32_t lut_size,
+			   enum drm_colorop_lut3d_interpolation_type interpolation,
+			   bool allow_bypass)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, allow_bypass);
+	if (ret)
+		return ret;
+
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "SIZE",
+					 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut_size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
+	colorop->lut_size = lut_size;
+
+	/* interpolation */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "LUT3D_INTERPOLATION",
+					drm_colorop_lut3d_interpolation_list,
+					ARRAY_SIZE(drm_colorop_lut3d_interpolation_list));
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut3d_interpolation_property = prop;
+	drm_object_attach_property(&colorop->base, prop, interpolation);
+	colorop->lut3d_interpolation = interpolation;
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_3dlut_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -441,7 +492,13 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
+	[DRM_COLOROP_3D_LUT] = "3D LUT",
+};
+
+static const char * const colorop_lu3d_interpolation_name[] = {
+	[DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL] = "Tetrahedral",
 };
+
 static const char * const colorop_lut1d_interpolation_name[] = {
 	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
 };
@@ -477,6 +534,21 @@ const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_inte
 	return colorop_lut1d_interpolation_name[type];
 }
 
+/**
+ * drm_get_colorop_lut3d_interpolation_name - return a string for interpolation type
+ * @type: interpolation type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_lu3d_interpolation_name)))
+		return "unknown";
+
+	return colorop_lu3d_interpolation_name[type];
+}
+
 /**
  * drm_colorop_set_next_property - sets the next pointer
  * @colorop: drm colorop
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 988955582636..7b58dcf0615a 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -261,6 +261,14 @@ struct drm_colorop {
 	 */
 	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
 
+	/**
+	 * @lut3d_interpolation:
+	 *
+	 * Read-only
+	 * Interpolation for DRM_COLOROP_3D_LUT
+	 */
+	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
+
 	/**
 	 * @lut1d_interpolation_property:
 	 *
@@ -289,6 +297,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *lut_size_property;
 
+	/**
+	 * @lut3d_interpolation_property:
+	 *
+	 * Read-only property for DRM_COLOROP_3D_LUT interpolation
+	 */
+	struct drm_property *lut3d_interpolation_property;
+
 	/**
 	 * @data_property:
 	 *
@@ -345,6 +360,11 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, bool allow_bypass);
+int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+			   struct drm_plane *plane,
+			   uint32_t lut_size,
+			   enum drm_colorop_lut3d_interpolation_type interpolation,
+			   bool allow_bypass);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
@@ -395,6 +415,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 5ef87cb5b242..316c643e0dea 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -913,6 +913,27 @@ enum drm_colorop_type {
 	 * property.
 	 */
 	DRM_COLOROP_MULTIPLIER,
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * A 3D LUT of &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
+	DRM_COLOROP_3D_LUT,
+};
+
+/**
+ * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
+ *
+ */
+enum drm_colorop_lut3d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
+	 *
+	 * Tetrahedral 3DLUT interpolation
+	 */
+	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
 };
 
 /**
-- 
2.43.0

