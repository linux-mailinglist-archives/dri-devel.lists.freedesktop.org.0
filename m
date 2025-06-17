Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF7CADC023
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52BB10E4A4;
	Tue, 17 Jun 2025 04:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hI2F+t32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3C10E4A4;
 Tue, 17 Jun 2025 04:18:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMoLOLR4WkW4sUhUbgyhLDGP42dBvCfFyen26PFSQ5eeZGJcUt9Cpv15vdiwr8LS4NyNk2RmT8MbCYU8HhM42wgke64fSOaKGSX86SANlN+ePRa/YzZqCUBpnzAUNfKhd0Zt8mbkSD7PX2SxNl7YMyoKPMrzmBA/6TN4DEvdeN+9PTCalVdokBFzXuPcPDHuuaVTc7yS6+xMEY8MdDMcICHEPeUb/y4ypztguGg1UkSS/dLrIlE2GUT1/Zh8POmNJhVdy0imW6/FFvSvv2qmBQjDMRHS1c8LH6gKIAWcoXZ13bUQjFYhJRDQ1+YMERUIg9st2LieHX21uisGZLtTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asu8G+ExTVHURLTMLk1Mf8IoXQjx1PeCca4JedHWEbM=;
 b=m5YeL+BflCKpLrN01wOPEsaWLfbcAWCUuPEasARRc66NSxz/jdbsKT2zPhPra16kf2CMAhg3e7Z07YZS2fLYnyx7gCJimfhosNBSchUeFlJEtbKoMu4aVmDnW31jVR7pxUBRM79GJHvciXHIO/LBJanh+OMjEux4uK+Pvr/oGS616Kymcmn7iUel2nk/bc2YYRQ596eD2BlQzSb6ndznq+nZKRjQRD5fcz+rVTuiwlw762NrvNjvqwUrqut1G1AhluSCQTDnY+bs6OEqLCq5+E9Q0jyXCGvnOZK9meCsvoWfFBbcaWhVG2dvxDAA0ce+Pru8YF/lgsFTG3Pyb2PRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asu8G+ExTVHURLTMLk1Mf8IoXQjx1PeCca4JedHWEbM=;
 b=hI2F+t32Qa0KapXKZhRt+F+PoB1HUcAyB7Epx6haRYgbomrgX+2rJ5x5fX2xsS0XjXyzZ3xIwPNpAnqMiXy0wxgkl+Vrl5sMfwbNmd6htxlfSjZOoe2y7m+dJat/Ata865oBct3iJN49Y80yMrm8W+8FRFRnO0xPKWCgcMX2SXo=
Received: from SA9PR11CA0003.namprd11.prod.outlook.com (2603:10b6:806:6e::8)
 by CY8PR12MB8068.namprd12.prod.outlook.com (2603:10b6:930:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:18:34 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::ed) by SA9PR11CA0003.outlook.office365.com
 (2603:10b6:806:6e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Tue,
 17 Jun 2025 04:18:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:18:33 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:18:07 -0500
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
 <arthurgrillo@riseup.net>
Subject: [PATCH V10 00/46] Color Pipeline API w/ VKMS
Date: Mon, 16 Jun 2025 22:16:42 -0600
Message-ID: <20250617041746.2884343-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|CY8PR12MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 162796f2-4563-4aa2-6969-08ddad5605fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlpBb09Fcm9NcTVOQVIwdENqczVhTEY3V2I0MTZkNmoxN2JRdEpGeE9oNG9S?=
 =?utf-8?B?SGxQck52NjNQWXl2RVExZTc0blRBUlVQdk9NYXVBbHVzV1F1N0hmZXZuK2hN?=
 =?utf-8?B?Tlp0dDEzaFAvNWxzM01qVktJQmIzVmoxMmZ1NWd3SmFyMXBETVFIN0VPckJa?=
 =?utf-8?B?eUV3cFdHb2NzRHVaRkxCNmpaY3dsZEwwTm5SemdiV2xKK1hGaXFYa282aUdN?=
 =?utf-8?B?NTJ2bDRZRUlraXVjY3BOUUxaRjlRZkZJdGlOSWtYVWRKZTMwZFVyYzB1bGF3?=
 =?utf-8?B?TS9xamZDT0x4eVhLZGZhRUNBMkhlbHh2RVhOQm4wNmc0VEZ3ZnZzQTQ2SENl?=
 =?utf-8?B?SmJiclZkc2czbkNjSCtQZU9LbzQ0bkN0WEYvS21EcFRhTXVYTlppOEJxTGpI?=
 =?utf-8?B?eG01K2V3TWJSNy9jcUtiZWlmUjRJbkdLNGlWdk9VaGs1cUV4cTk2K3BNQ2M0?=
 =?utf-8?B?Yms1Si9BSm1OVENCdFNnMkdZbTd3U1ZtNUltS2pHdVYwWkVnL3FkMzN5RlpH?=
 =?utf-8?B?dFZLWStabGdGbWRJM0FoMG9qWDhhSFpDTjdxZVRDU1k1SXhMdlkyN3htWlcv?=
 =?utf-8?B?WC9xTDlIeFNLWnkwN2pZOE80U0JMMzhpSXBKaFdSa1l2Sk1FbzFjM2ExZVA2?=
 =?utf-8?B?VzRuZWJLOXVhdStuMWlMK091a1oyR0JWZkI5R21Qa1VnM2pUNWJEanZaNWZQ?=
 =?utf-8?B?L09jOXRBRGNMWjM2a2FlcWV1aURYUi9lZW9VMklFaUh3ZnRlbkFjVFlZZzRn?=
 =?utf-8?B?cGpOYUhScE04TDExZVhsRHdEaWN5Rm9nckpTYjliRVkvNmdENlVrc0hGdGJt?=
 =?utf-8?B?SU0reklMWWd0aGNpeGw0VjM2MHNuTVFGQWhVOCtpeUhOTFdPdi9jb0Q3MWov?=
 =?utf-8?B?M2xoaVoyenBEU2tOWFQ3cFF1WmQ0MkdzSXVNWlVkWERnd3lJdHJLeTcwNnFs?=
 =?utf-8?B?K05qYWo0cldYZEJVVGFiYTFnN1RzTHM4UStMWUR4Mnc1RkVtT0RUQ3ZPSjd6?=
 =?utf-8?B?d0JsMkVWcUdaRTFQYzduRzVpLzBmU2NKY1F2dllKdWdpR1I0a0N5Undmb2ZJ?=
 =?utf-8?B?dWN5OXRJeE9tbGF2ajIxeFJubXBpVk5PYUp6ZXl4VnR5dHliSlVudk9mMmdR?=
 =?utf-8?B?SFNoSm9OajJqNGE2dm9pL2lxSEgwaEZXOVJtNVVSeitrQkFkREdEL3Y0VlFW?=
 =?utf-8?B?d2xXdEpiNVh2N3doRTQvRWwzTGlJcGg5U2diZFRZK3dNUUZPTG0xSEN3cENB?=
 =?utf-8?B?Ujg5bzhUUWZPbmNJN2Ryb2pnMGFzZzBneTdGQ05QRFZEYUZQMEppZXN6NUlq?=
 =?utf-8?B?M3BMUEM1bVEvZHNXYzJhRWpkQ3Z1a2RwQy9PNG56N1lZdXNQUU5yZGZqRmRU?=
 =?utf-8?B?OURkem5vSEJIOEVRNjBTY3BIR3hqcUFkc1FUR0tBNllOVEpNQzB5dlZPbE9B?=
 =?utf-8?B?WkFRTElzOWp3NjYwRVRJSVZLZ2J2QWYwWHZpMXFaVE9PcXNRbCtIYnkrS25W?=
 =?utf-8?B?d0EvRmNhMTRJN2FITTZTS1hyNzA0d1VjY3ZpUnNUSTlacWtYM2dHd3g5OTZZ?=
 =?utf-8?B?NFdIWnFuWGoxKy9ZNjhYYUR0TVpoNVNjTXlUQ2JDRDYvdWFydmVLazVTZldC?=
 =?utf-8?B?OFhKUUZKenZQcjFNTlVBSEN5aER5T1FFL0l0d2laQlVheEgrS1h3c2w5TUtJ?=
 =?utf-8?B?ZVlwSVVsN292dGNVSElBUDFYR0ZPZ0FaNFBjdGpiaWRGeDdNbUc2Tzh5dGtZ?=
 =?utf-8?B?TWpHSkp1ZFFjdnJUMmNrRXl4QUlBcTRVQUZUWHZEZHpKc2NOUHh0blVzTy9S?=
 =?utf-8?B?RlVNazRMRCtvcHFtY1VsRERHeUVoaGlNYmx5SUFXbmFyNm9hbVpEU0NyT3hW?=
 =?utf-8?B?SElOeGVuNlYyYnhIUEpGQlphbStPcGZWY1dabk82aXZJTzRodFhQdmtCdjVy?=
 =?utf-8?B?emM4a2dtZG9BczAyYXhnS2xac0o2VXQ3RVpDM2ZDUERkaktsMHd5d0Q3dndo?=
 =?utf-8?B?ZU9ROVptRmh3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:18:33.5381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 162796f2-4563-4aa2-6969-08ddad5605fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8068
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

This is an RFC set for a color pipeline API, along with implementations
in VKMS and amdgpu. It is tested with a set of IGT tests that can be
found at [1]. The IGT tests run a pixel-by-pixel comparison with an
allowable delta variation as the goal for these transformations is
perceptual correctness, not complete pixel accuracy.

v5 of this patchset fleshed out documentation for colorops and the
various defines that are being introduced.

v6 addresses a few comments from various reviewers.

v7 simplifies 3D LUT and addresses more comments from various reviewers.

v8 fixes typo and errors and address comments from reviewers.

v9 refactors cleanup functions, fixes typo and errors, and addresses
   comments from reviewers.

v10 add 32BIT RGB (drm_color_lut_32) to 1D & 3D LUTs, addresses comments
    from reviewers, and fixes typo and errors.

VKMS supports two named transfer function colorops and two matrix
colorops.

Amdgpu advertises the following pipeline for GPUs with DCN 3 or newer:

1. 1D Curve EOTF
2. 3x4 CTM
3. Multiplier
4. 1D Curve Inverse EOTF
5. 1D LUT
6. 3D LUT
7. 1D Curve EOTF
8. 1D LUT

The supported curves for the 1D Curve type are:
- sRGB EOTF and its inverse
- PQ EOTF, scaled to [0.0, 125.0] and its inverse
- BT.2020/BT.709 OETF and its inverse

Note that the 1st and 5th colorops take the EOTF or Inverse
OETF while the 3rd colorop takes the Inverse EOTF or OETF.

The 3D LUT is a 17^3 tetrahedrally interpolated LUT but the mechanism
exists for other drivers to describe their own 3D LUT capability.

This mirrors the color pipeline used by gamescope and presented by
Melissa Wen, with the exception of the DEGAM LUT, which is not currently
used. See [1]
https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf

At this point we're hoping to see gamescope, kwin and weston implementations
take shape. The existing pipeline should be enough to satisfy the
gamescope use-cases on the drm_plane.

In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
support to the color pipeline. I have sketched these out already but
don't have it all hooked up yet. This should not hinder adoption of this
API for gaming use-cases.

We'll also want to advertise IN_FORMATS on a color pipeline as some
color pipelines won't be able to work for all IN_FORMATS on a plane.
Again, I have a sketch but no full implementation yet. This is not
currently required by the AMD color pipeline and could be added after
the merge of this set.

VKMS patches could still be improved in a few ways, though the
payoff might be limited and I would rather focus on other work
at the moment. The most obvious thing to improve would be to
eliminate the hard-coded LUTs for identity, and sRGB, and replace
them with fixed-point math instead.

There are plenty of things that I would like to see, but they could
be added after the merge of this patchset:
 - COLOR_ENCODING and COLOR_RANGE
 - IN_FORMATS for a color pipeline
 - Is it possible to support HW which can't bypass entire pipeline?
 - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
 - read-only scaling colorop which defines scaling taps and position
 - named matrices, for things like converting YUV to RGB
 - Add custom LUT colorops to VKMS

IGT tests can be found at [1] or on the igt-dev mailing list. There
have been no updates since v5 and rebase on latest main is straight-
forward.

A kernel branch can be found at [2].

[1] https://gitlab.freedesktop.org/alex.hung/igt-gpu-tools/-/tree/amd-color-pipeline-v9
[2] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v10

v10:
 - remove duplicated "is useful" in comments (Melissa Wen)
 - guard "dm_plane_init_colorops" function when !AMD_PRIVATE_COLOR (Melissa Wen)
 - Replace DRM_ERROR by drm_err
 - Creaet color pipeline when >= DCN_VERSION_3_0 (Melissa Wen)
 - Relocate amdgpu_dm_supported_*_tfs check (Melissa Wen)
 - Support 32BIT RGB for 1D LUTs (Uma Shankar)
 - Support 32BIT RGB for 3D LUTs (Harry Wentland)
 - Fix typo mutliplier to multiplier in subject (Melissa Wen)
 - 1D & 3D LUTs are no longer immutable ((Xaver Hugl)
 - Fix 3D LUT kernel doc (Leandro Ribeiro)
 - Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops (Melissa Wen)
 - Disable CRTC degamma when color pipeline is enabled (Melissa Wen)

v9:
 - Update RFC documents for 3DLUT and fallback behaviours (Simon Ser)
 - Specify colorop function names by _plane_ (Chaitanya Kumar Borah)
 - Remove redundant comments (Simon Ser)
 - Fix typo in commit description (Shengyu Qu)
 - Move destroy and cleanup functions earlier (Simon Ser)
 - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end (Simon Ser)
 - Chagne "bool allow_bypass" to "uint32_t flags" for better extensibility (Simon Ser)
 - Return a value in __set_dm_plane_colorop_3dlut

v8:
 - Change VKMS config names (Louis Chauvet)
 - Remove deprecated function "drm_atomic_get_existing_colorop_state" (Louis Chauvet)
 - Remove null check in drm_colorop_set_next_property (Simon Ser)
 - Remove MAX_COLOR_PIPELINES in drm (Simon Ser)
 - Update kernel docs and documents for DRM_COLOROP_3D_LUT (Simon Ser)
 - Add comments for dmr_color_lut (Louis Chauvet)
 - Fix typos and replace DRM_ERROR and DRM_WARN_ONCE by drm_err drm_WARN_ONCE (Louis Chauvet)
 - Fix incorrect conditions in __set_colorop_in_tf_1d_curve (Leo Li)
 - Add DRM_MODE_PROP_ATOMIC to drm_property_create_range (Simon Ser)
 - Change "1D Curve Custom LUT" to "1D LUT" (Simon Ser)
 - Return error when __set_output_tf fails (Leo Li)
 - Return -EINVAL when drm_color_ctm_3x4's size mismatches (Leo Li)
 - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentland)
 - Rework tf->type = TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li)

v7:
 - Simplify 3D LUT by removing lut_3d_modes and update doc accordingly (Simon Ser)
 - Add destroy / cleanup functions when color pipeline initialization
   fails (Louis Chauvet)
 - Fix checkpatch errors and warning (spaces, long lines, {}, and etc)
 - Change lut's size from drm_colorop_state->size to drm_colorop->lut_size
   and from size_property to lut_size_property
 - Update some kernel updates and commit messagesa (Louis Chauvet)
 - Squash "drm/colorop: Add atomic state print for drm_colorop" and
   "drm/colorop: Add NEXT to colorop state print" (Simon Ser)
 - Add missing MODULE_DESCRIPTION (Jeff Johnson)

v6:
 - Eliminate need to include test as .c file (Louis Chauvet)
 - some doc updates
 - cleanup if colorop alloc or init fails in VKMS and amdgpu (Louis Chauvet)
 - couple other small improvements in VKMS, such as rounding (Louis Chauvet)
 - take ref for DATA blob in duplicate_state func & fix refcount issues (Xaver Hugl)

v5:
 - amdgpu 3D LUT
 - Don't require BYPASS
 - update RFC docs and add to TOC tree
 - add drm_colorop and COLOR_PIPELINE kernel docs (non-RFC)
 - add amdgpu color pipeline doc
 - define SIZE property similar to drm_crtc's GAMMA_SIZE
 - various minor fixes and cleanups

v4:
 - Add amdgpu color pipeline (WIP)
 - Don't block setting of deprecated properties, instead pass client cap
   to atomic check so drivers can ignore these props
 - Drop IOCTL definitions (Pekka)
 - Use enum property for colorop TYPE (Pekka)
 - A few cleanups to the docs (Pekka)
 - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
 - Add missing function declarations (Chaitanya Kumar Borah)
 - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
 - Add helper for creation of pipeline drm_plane property (Pekka)
 - Always create Bypass pipeline (Pekka)
 - A bunch of changes to VKMS kunit tests (Pekka)
 - Fix index in CTM doc (Pekka)

v3:
 - Abandon IOCTLs and discover colorops as clients iterate the pipeline
 - Remove need for libdrm
 - Add color_pipeline client cap and make mutually exclusive with
   COLOR_RANGE and COLOR_ENCODING properties
 - add CTM colorop to VKMS
 - Use include way for kunit testing static functions (Arthur)
 - Make TYPE a range property
 - Move enum drm_colorop_type to uapi header
 - and a bunch of smaller bits that are highlighted in the relevant commit
   description

v2:
 - Rebased on drm-misc-next
 - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
 - Incorporate feedback in color_pipeline.rst doc
 - Add support for sRGB inverse EOTF
 - Add 2nd enumerated TF colorop to VKMS
 - Fix LUTs and some issues with applying LUTs in VKMS

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Alex Hung (16):
  drm/colorop: Add destroy functions for color pipeline
  drm/colorop: define a new macro for_each_new_colorop_in_state
  drm/amd/display: Skip color pipeline initialization for cursor plane
  drm/amd/display: Add support for sRGB EOTF in DEGAM block
  drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
  drm/amd/display: Add support for sRGB EOTF in BLND block
  drm/colorop: Add 1D Curve Custom LUT type
  drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
  drm/amd/display: add 3x4 matrix colorop
  drm/colorop: Add multiplier type
  drm/amd/display: add multiplier colorop
  drm/amd/display: Swap matrix and multiplier
  drm/colorop: Add 3D LUT support to color pipeline
  drm/amd/display: add 3D LUT colorop
  drm/amd/display: Ensure 3D LUT for color pipeline
  drm/amd/display: Disable CRTC degamma when color pipeline is enabled

Harry Wentland (29):
  drm: Add helper for conversion from signed-magnitude
  drm/vkms: Add kunit tests for VKMS LUT handling
  drm/doc/rfc: Describe why prescriptive color pipeline is needed
  drm/colorop: Introduce new drm_colorop mode object
  drm/colorop: Add TYPE property
  drm/colorop: Add 1D Curve subtype
  drm/colorop: Add BYPASS property
  drm/colorop: Add NEXT property
  drm/colorop: Add atomic state print for drm_colorop
  drm/plane: Add COLOR PIPELINE property
  drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
  Documentation/gpu: document drm_colorop
  drm/vkms: Add enumerated 1D curve colorop
  drm/vkms: Add kunit tests for linear and sRGB LUTs
  drm/colorop: Add 3x4 CTM type
  drm/vkms: Use s32 for internal color pipeline precision
  drm/vkms: add 3x4 matrix in color pipeline
  drm/tests: Add a few tests around drm_fixed.h
  drm/vkms: Add tests for CTM handling
  drm/colorop: pass plane_color_pipeline client cap to atomic check
  drm/amd/display: Ignore deprecated props when plane_color_pipeline set
  drm/amd/display: Add bypass COLOR PIPELINE
  drm/colorop: Add PQ 125 EOTF and its inverse
  drm/amd/display: Enable support for PQ 125 EOTF and Inverse
  drm/colorop: add BT2020/BT709 OETF and Inverse OETF
  drm/amd/display: Add support for BT.709 and BT.2020 TFs
  drm/colorop: Define LUT_1D interpolation
  drm/colorop: allow non-bypass colorops
  drm/amd/display: Add AMD color pipeline doc

Uma Shankar (1):
  drm: Add Enhanced LUT precision structure

 Documentation/gpu/drm-kms.rst                 |  15 +
 Documentation/gpu/rfc/color_pipeline.rst      | 378 ++++++++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 762 ++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 205 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  15 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  39 +
 drivers/gpu/drm/drm_atomic.c                  | 170 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 181 ++++
 drivers/gpu/drm/drm_color_mgmt.c              |  43 +
 drivers/gpu/drm/drm_colorop.c                 | 598 +++++++++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_plane.c                   |  59 ++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/Makefile           |   2 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 459 ++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 115 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 134 ++-
 drivers/gpu/drm/vkms/vkms_composer.h          |  27 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   7 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 808 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      | 111 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_color_mgmt.h                  |  13 +
 include/drm/drm_colorop.h                     | 442 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  15 +
 include/uapi/drm/drm_mode.h                   | 133 +++
 43 files changed, 4920 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h

-- 
2.43.0

