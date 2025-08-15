Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66BAB27792
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4B910EB95;
	Fri, 15 Aug 2025 04:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gtT5evry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2648E10EB95;
 Fri, 15 Aug 2025 04:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HW6KSZ86UOmC7R//fGI6kZeC8TsCZyZs0Ywbu1hXr9RjtQtPe9Kn6ezksM0WKKinjujJmuWgm4Tjuwp2MMd756S4fw3HSq7175s9moF2V/6SCY5JhvSPQOxRGamiTMrv3NmALaizmcaOph/ivdKtdpOtLC8YebXsc5x2yW+3xhFGyHTSXifr0Ek8HjG5o/1InE/gpuf2dxUijQAj3hQ1lgiUf0/oeRXZI93M1z9IruK//vdvtQhPF3FEPSZwsYLFKZPeNuwf+Fo26hP63WpHB/5n+SCXNKwpdirMWEBJGvPpxFQHk8yT2tfXw2z+ATMtRGx1ef2yvQ6hhtS4+RF14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iG5rBJ1FOhltQ0Bie8zUFi4D53l6d7iSVyI97nIRb0=;
 b=N6JFkMrb57hWpVTQVMGoICkMKLZrhp7IWrqQb3uppj0KobUrsGRrCkd4wJLeKW2zu5gpVAalKiVnZaELlJIP7jHnwEk/DY9KDGrn/CbdPKtbmpNTY0DzJUeDHlZXqFHgKJnlZDQg5ywvX3Of9/Pv2Zd+6UeKLwQH24TU+K59X/7TolRdNyRXAwLWTO0J8KtcVJFZ8biqX2hH4MwTmPJS6O9aqYmmwvbZ2iE4oATnnvaAuspK7a4tiL87vA4lB+UZ5kTtkAjffPbr+pG8xxowex+KlkPAJDhHx9L2gsughXahSjeiNATkk+gd2BATNqkKOo+rGyDaWO6MEk0VLpmqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iG5rBJ1FOhltQ0Bie8zUFi4D53l6d7iSVyI97nIRb0=;
 b=gtT5evryu8ONtIlLRrmyV5+pCJsoGynXvpcs/UCgD8GddwjomOPxq1iCFFKf39ePlwkelzUfzNWr6osxC8hrDx7GBh/KQ0YJyRhLMclD1DweqrA1HdtwViGXq5IMPMFJwM8BmgigXZDMsErm3+6WKZqb3GwiWCyt2G7OS1jNoLk=
Received: from MN2PR05CA0009.namprd05.prod.outlook.com (2603:10b6:208:c0::22)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:02:00 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::14) by MN2PR05CA0009.outlook.office365.com
 (2603:10b6:208:c0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.5 via Frontend Transport; Fri,
 15 Aug 2025 04:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:02:00 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:01:56 -0500
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
Subject: [PATCH V11 43/47] drm/colorop: Add 3D LUT support to color pipeline
Date: Thu, 14 Aug 2025 21:50:32 -0600
Message-ID: <20250815035047.3319284-44-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: dffac722-5b54-47d9-d1b8-08dddbb07c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wiy3EziDIWNlIsMP9HLVInhHd2dUKJmhhIa7zRfy4isUHqn4CXk2KMCv/Ca4?=
 =?us-ascii?Q?yzCSJ4D/HNlSUNMeWR4ikeBObqAFyUS8TVxtBL9qwAt9DIGVjEuPiaRDmxUF?=
 =?us-ascii?Q?1UxKIaYyIH818yh1KAv7YVmikaCcT0PjaMy8pGNY2mR6LYXKGDr6QXXW2iQ9?=
 =?us-ascii?Q?DPdu1j/PhubCpFyHX2O2XSUME+HjFA2d1WVoN0WbLoBT06ZQCK9ABpL+HYPW?=
 =?us-ascii?Q?Bj458ozIEL+6trHmavQ5BhiAeoMCWibhS4hfgIXOjIW2zDdzLCvZU7i2mYRV?=
 =?us-ascii?Q?nHx1sNOn/hQgNtZQ841ctinraAtAFFJE8dphqRRmtUifzfp3ryw6pi/ZMKUZ?=
 =?us-ascii?Q?tT0bmHQkEXj18SImfKHcGGgpoQS9bSaYXxsMuC5rBAcaxrc21ytFAPPTLT0P?=
 =?us-ascii?Q?SI3+kMid5zbAgNGeKUvwDtEmlP3v4EZ1qJWOjRNRL67fRFIUY2g/2GfLlmkN?=
 =?us-ascii?Q?qpo0ehKrLASsMM4zRrAphm++GpBYBqSzobI6exjbsel9xuvCC1Ddz+n1dIrZ?=
 =?us-ascii?Q?o90og7WS7ICWj8qRCF89lw5Zc3w33dL+OSHl2BpeqAbZu4Se84Gkm7zSxF1U?=
 =?us-ascii?Q?bvdrkL1wOwqoThUyXxYpiFpMGObkF4uzU2FpRQE+4pkf61wOrR0KfiEfLNq1?=
 =?us-ascii?Q?vWaTBPJgVQORDqgOm498EIcMU6ivdKs3pDlPvvO8gJJOOxe/3u+nNlqVhpWB?=
 =?us-ascii?Q?iyhcVimtMNtXmU4hUpmjnzU3Gh8t8TrsiOChCvdkAG9m89BPObJz2LgF+vAN?=
 =?us-ascii?Q?g16TT1swAvIplMhXe67BtW6PAQFNH5PbZ2NxUI01nRsuk8nNH0kWPkGdoLyc?=
 =?us-ascii?Q?h1V3E/daFCuB+siqcXuvtpk+U7t9G+d8xL5BlRMlwSe0CkUqdtgiWecJmIfT?=
 =?us-ascii?Q?YXlYY/WnuP+fHycwJdYrlskwVytW6ldEOZ40040OthAVTSbVj/eva3G7VHkt?=
 =?us-ascii?Q?bRr6ynYlzwYQA7TRmeH5f4CMn9Ug6APlmJyVqyAOsJw1Gh8jevXPIIe/WZXv?=
 =?us-ascii?Q?rmn4Av6b7DFdTGOSC78z949/wnDBJbMZbiUu1F0LjfngmwpdU2fOURUc90xN?=
 =?us-ascii?Q?Ifz+Y6ArZf63hrzOc4TdpF9emvuedwc3jo67LH4SSso81V305vFwwxJwh1ff?=
 =?us-ascii?Q?TE4Eo49wSEaLtRNuRp5GElj7JkLL/RbzrJBdOQVR/WN6Vhh9q0UNzCI15Kdc?=
 =?us-ascii?Q?LjPT0FPSyP39EXpQ4KQzYbTiI6Q8XXzQM9hlIiO62fYjCyh2w3829e0zrAZJ?=
 =?us-ascii?Q?j5eTnubvi6PZN/wGEGjmzvuvBsFC5O7VyvCf2qgp6Te+6J2/thhxe15EMFe2?=
 =?us-ascii?Q?DTKe9qk9JRK4vPCqdInFNCYCVjHnWRVq/BxZhM/NQnduy1WB47imWnJUi9wh?=
 =?us-ascii?Q?gFkZbckdrkkxegyZktAvJv483Lay7XcbYe1vaiP1qwi7h+fagC7S0f0bx2PH?=
 =?us-ascii?Q?fzv/30iALlevxPkkZhqXxtseGYBfv/EY4ObRzeZzIc059u68AldEKNr6IZn/?=
 =?us-ascii?Q?x8Rh9VMeyhXw2SAsKwt1HEeBgYvJX20knhnH?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:02:00.3296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dffac722-5b54-47d9-d1b8-08dddbb07c5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896
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

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v11:
 - Update names from *_lut_32_* to *_lut32_* (Simon Ser)

v10:
 - Add missing set lut3d_interpolation in drm_atomic_colorop_set_property
 - LUT3D_INTERPOLATION is no longer immutable (Xaver Hugl)
 - Support 32BIT RGB in 3D LUT with drm_color_lut_32 (Harry Wentland)
 - Fix 3D LUT kernel doc (Leandro Ribeiro)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Fix typo in subject (Simon Ser)
 - Update documentation for DRM_COLOROP_3D_LUT (Simon Ser)
 - Delete empty lines (Simon Ser)

v7:
 - Simplify 3D LUT by removing lut_3d_modes and related functions (Simon Ser)

 drivers/gpu/drm/drm_atomic.c      |  6 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++
 drivers/gpu/drm/drm_colorop.c     | 72 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 21 +++++++++
 include/uapi/drm/drm_mode.h       | 34 +++++++++++++++
 5 files changed, 141 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 3157a503001c..3ab32fe7fe1c 100644
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
index 5f080adc690b..b7cc69458642 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -703,6 +703,10 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
+		       sizeof(struct drm_color_lut32);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
@@ -728,6 +732,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->curve_1d_type = val;
 	} else if (property == colorop->multiplier_property) {
 		state->multiplier = val;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		colorop->lut3d_interpolation = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -759,6 +765,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->multiplier;
 	} else if (property == colorop->lut_size_property) {
 		*val = colorop->lut_size;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		*val = colorop->lut3d_interpolation;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index fd9cedbb4a8e..a1b36cd488f0 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -67,6 +67,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_LUT, "1D LUT" },
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
 
 static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -380,6 +386,51 @@ int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colo
 }
 EXPORT_SYMBOL(drm_plane_colorop_mult_init);
 
+int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				 struct drm_plane *plane,
+				 uint32_t lut_size,
+				 enum drm_colorop_lut3d_interpolation_type interpolation,
+				 uint32_t flags)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, flags);
+	if (ret)
+		return ret;
+
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE  | DRM_MODE_PROP_ATOMIC,
+					 "SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut_size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
+	colorop->lut_size = lut_size;
+
+	/* interpolation */
+	prop = drm_property_create_enum(dev, 0, "LUT3D_INTERPOLATION",
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
+EXPORT_SYMBOL(drm_plane_colorop_3dlut_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -472,7 +523,13 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_LUT] = "1D LUT",
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
@@ -508,6 +565,21 @@ const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_inte
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
index 7600f10d3961..d61c6c40e471 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -283,6 +283,14 @@ struct drm_colorop {
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
@@ -311,6 +319,13 @@ struct drm_colorop {
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
@@ -365,6 +380,11 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
 				   struct drm_plane *plane, uint32_t flags);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 				struct drm_plane *plane, uint32_t flags);
+int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				 struct drm_plane *plane,
+				 uint32_t lut_size,
+				 enum drm_colorop_lut3d_interpolation_type interpolation,
+				 uint32_t flags);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
@@ -415,6 +435,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 519badcd1d04..f97e455770c8 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -942,6 +942,40 @@ enum drm_colorop_type {
 	 * property.
 	 */
 	DRM_COLOROP_MULTIPLIER,
+
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * enum string "3D LUT"
+	 *
+	 * A 3D LUT of &drm_color_lut32 entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
+	 * 17x17x17 entries will have SIZE set to 17.
+	 *
+	 * The DATA blob is a 3D array of struct drm_color_lut32 with dimension
+	 * length of "lut_size".
+	 * The LUT elements are traversed like so:
+	 *
+	 *   for B in range 0..n
+	 *     for G in range 0..n
+	 *       for R in range 0..n
+	 *        index = R + n * (G + n * B)
+	 *         color = lut3d[index]
+	 */
+	DRM_COLOROP_3D_LUT,
+};
+
+/**
+ * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
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

