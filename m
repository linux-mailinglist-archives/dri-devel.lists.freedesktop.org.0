Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2726AA401C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5B910E5D1;
	Wed, 30 Apr 2025 01:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UEdF9/vK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A147210E5A6;
 Wed, 30 Apr 2025 01:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTdsi7LrU0ScnN/b+KgVmtqZ5fPgtBnCPUcqsAnZ7l2bJDfDdjD8twNJC/o9wacyLloDbJH9JkLxo/WkLo7RhTMwQ3BS4yAkjN4yOprhAdwuLWdeBOY1efubNOBZprI1l/N5KyGkO4nRTzPM5oXZf4JOYjy9LssLtXBOExaMxVnLfmiEv7gON3XPbxLUz84hgJHCWQyK18EjX67T+vJ7OjKnn1oWLD7LS1Muxc4YCNT3CKQAL1VpHUJdJLow+UbOTJkQWVuAExFeX2zneDPkGfFtuqXCYjs4lL5DKPMdTJDdbPkDOULylzE41eWCnXWfuLv5JW0MSVoh16iDWtOhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIrpv/PCDtgXIwcMrBLrA5SaM6ZgCrqbRh/A4h3qvK0=;
 b=x909KYzOlFTphAGJdN5sizaLA8CahrWQdLzrgiw+/YtwPIiBR05xLZc5Ox1ZrMBssGRyLj0WkDhC7r+dpWR5/Q7YGi6b7mH8vuHI+bGPIFEV9XR4CpXnLzObfTpouaKWqGP1xsdjnrBNsedWdSEM1TxZe1uQR1w3vXLS501xvyuwlfc7C95mYG+ia2NSnXpEtKCSKUz/KpUqYeOwkMaddZAylMcbW/55UL2+B3DHCDUxUzDRtB23MSO0RuXgri9yT6M8Q3TSFaY7+YQzDaCo5v0O935EGLGa2WtHG1cvloEWuDoX2NB0mp6XNg0Bzd27xEn6buNBzQ46vDBsvLEJDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIrpv/PCDtgXIwcMrBLrA5SaM6ZgCrqbRh/A4h3qvK0=;
 b=UEdF9/vKiiVNUDrW1aA0fcPa5PyjWGrBGNkOFj5RtrjCELNRKenA3N3AlNPkTv6GLXPDjCfmMUQ3wPntg5igpqQd7xNIeZ0o/DxhHWUhVavK0RGbhmucGVyFg20pfp7Z83N4auIqwB24FVmnlC2tu/ZeEEFmPniduPDRUwN2LE8=
Received: from CH0PR13CA0058.namprd13.prod.outlook.com (2603:10b6:610:b2::33)
 by MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 01:11:55 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::f5) by CH0PR13CA0058.outlook.office365.com
 (2603:10b6:610:b2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.14 via Frontend Transport; Wed,
 30 Apr 2025 01:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:11:54 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:11:51 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Arthur Grillo
 <arthurgrillo@riseup.net>
Subject: [PATCH V9 00/43] Color Pipeline API w/ VKMS
Date: Tue, 29 Apr 2025 19:10:30 -0600
Message-ID: <20250430011115.223996-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|MW4PR12MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: cc257f35-7608-4aef-200b-08dd8783ff50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHhHS3JtOTRySHQ4aEtjSWZmV3RNdjQ4c0FIVzBYQUtBdU44UW94VXNXSDNB?=
 =?utf-8?B?WW1lZ0oyVkhVZ3pFYVJVeW15dlgxU25BaXJNSyszZ0VIaVhvY3BpL0pFTVk4?=
 =?utf-8?B?eVEwSUsyOEtFMUM5L2RiM0dCbEJnaEVzM0lTdkIrSWdqOXU3TUFiZWpwelVR?=
 =?utf-8?B?OXY2ODBJSkNuM1RmajlQczJFQmh6bFBCdjNTeU1tSGhIblFKc2lhbXZNWmNC?=
 =?utf-8?B?MmhCRENHcU05b0JLWUNQWU8zUlZDYTVBR3U4ZUFQUnMzbGtvcTBFRnk0SmRU?=
 =?utf-8?B?NkFLd2JFMGlrcm9JL0hMVjlreTRuWDRiK1hzQy9TZXdLVmdqZUFVbU9iSmxP?=
 =?utf-8?B?WVRTSFpGSi9yNExSY0RpZUZTamhzbVpDYStRbGFCZDVZV3RxRWs1eE5ZSlow?=
 =?utf-8?B?UXZrazd2WXpiQUFQQmlNeWRtT3NHOUV2OWh0blV1aWwvZlBNcUlDT3Z5MUVO?=
 =?utf-8?B?OURHenBvQjlPUGV0dzlQaElqVGN4dEUvQk84dFdodzVMd3JyYXk3NExyY1ha?=
 =?utf-8?B?QXdxWjJJQkllcHp5VkNDZjdZQmJzWURiVGdOYnE2Qnk1b2xnTy9FeGtEakJ3?=
 =?utf-8?B?amI2NGxhU0pBRE4rQ1FQUUN0YzJhU1BDdWtvWC9QdFNQcm1DOWNDVlhHeWpZ?=
 =?utf-8?B?YzdLMnFVTWtFdWpCYXdXYlVOM0tjZlp6cjRJZUV6R2xEL213YVVRYzFpR3Fq?=
 =?utf-8?B?VzBEL2J1WjNyVnJaYjQvczJoQlNEcVl6UFpIUDVMQnFQZTJGT1B5UG5PZnE4?=
 =?utf-8?B?YkRNTGErL2RZRldlSjVUeDhxUjBEMXFnUkZ4NVIvTHJCbDl4bWVDNVNkMTdz?=
 =?utf-8?B?Z2xqTTI1Tm5uYU11eDhSSnFIMERpL1l4Yk42V0NnOStacmw0cTJ6bGxCaUN6?=
 =?utf-8?B?dE82dXRkK3MwbThwa3o3YjExeXljcHVBZUNPY0J5aklBbThBKzc4TksxdTRP?=
 =?utf-8?B?TEVWeWVRWWVKRUplaFlMVTU2Z1FTTU8wd1VpR0FsazROdnZyWDFEcitLRU5V?=
 =?utf-8?B?V3NYUUNUMzVjR2RxOXpoQUYvLyt2ZDQ2NHRGU0szTkNlSjZWZjhscGFyTXpp?=
 =?utf-8?B?Q1RBbkhSckUvNnA0dWFwOUNoVG92Zy80MHNyMEExVnYxd2VYNFNJSzhFSWM2?=
 =?utf-8?B?YkZqTE53ZXU3TDdGaWpKdG9wRWZNMTVSU1QxYnhBQ0Y3RVc4TTVQNDFyVFJD?=
 =?utf-8?B?aUVIendUQTVidUdzUE0ycjV5aUtTQkpKdHRSNVJqanVNd3VQNWMyV1NqL2FW?=
 =?utf-8?B?WmxSdml6T2JzK3p3YTRtYUJyV2tLUURKS1djWlBGUWw0ZzBZcnFFMDljSjhq?=
 =?utf-8?B?cWY0dlF5SDdzbmxsTERKNVcxaUpDNVF2RnlnK2xwR2F5SHFqZGwvdUtrcGVM?=
 =?utf-8?B?WENkS29GVEJsejVFVUl0UWpCL0FHYTRRT1dPL09NcEVDeWVVL0todmRvMVhM?=
 =?utf-8?B?aTBkS09ib21rMjczRmZ0Y01XNkh4VDVBcEt6cXZCNWlXYWFTTmExenZ6K1Rx?=
 =?utf-8?B?SmdnT0lJQ2JKMlBFNU8wcUduc2lvRVZNMytEZnJ3TjlXUSthSGdZQVJHZUJr?=
 =?utf-8?B?Vll3WmdYRE1XM0xxdkk1RUcrZHFjbTZHdWdiWnpwNDc1eHphWTk3a2Y5UDFP?=
 =?utf-8?B?U09UdjZEZnRId28vQlp5dHR4SG5NUWdEdFBkZXgwZDh6QjBrUXRFSmk1Wm9I?=
 =?utf-8?B?NjBQRUgvQWQ5VlN1THJTN2hnOFdiNkVudktoTFFRNVp0SjlsT05BcVI5Vm1C?=
 =?utf-8?B?WEhJQm90V2NTY2QwMjJZWERmdFdaRnV1WW82RmMyYUdFaVhCbFZmY3dwVXpv?=
 =?utf-8?B?SmZZK1RYR3djMEt3NW02V1U4VFQyZkpoK01UOXNwMU1CdWlSVXZSajJvNkhC?=
 =?utf-8?B?MmFxbHFXWUVJbjlOYTA3b2I0NHlHMTh0RWVYZ2hiQmduNGJ5L2R6QWdyaTg3?=
 =?utf-8?B?cWp0RzhiSFg0b2NtMDdrQ3dxbE9xZVZHY0RZbjFXd0IrOEp4N0xSRmNWUzNa?=
 =?utf-8?B?WUhSeUhlT0ZRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:11:54.9876 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc257f35-7608-4aef-200b-08dd8783ff50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6802
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

At this point we're hoping to see gamescope and kwin implementations
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

[1] https://gitlab.freedesktop.org/alex.hung/igt-gpu-tools/-/tree/amd-color-pipeline-v8
[2] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v9

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

Alex Hung (14):
  drm/colorop: Add destroy functions for color pipeline
  drm/colorop: define a new macro for_each_new_colorop_in_state
  drm/amd/display: Skip color pipeline initialization for cursor plane
  drm/amd/display: Add support for sRGB EOTF in DEGAM block
  drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
  drm/amd/display: Add support for sRGB EOTF in BLND block
  drm/colorop: Add 1D Curve Custom LUT type
  drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
  drm/amd/display: add 3x4 matrix colorop
  drm/colorop: Add mutliplier type
  drm/amd/display: add multiplier colorop
  drm/amd/display: Swap matrix and multiplier
  drm/colorop: Add 3D LUT support to color pipeline
  drm/amd/display: add 3D LUT colorop

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

 Documentation/gpu/drm-kms.rst                 |  15 +
 Documentation/gpu/rfc/color_pipeline.rst      | 378 ++++++++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 573 ++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 207 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
 drivers/gpu/drm/drm_atomic.c                  | 170 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 175 ++++
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
 include/drm/drm_colorop.h                     | 442 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  15 +
 include/uapi/drm/drm_mode.h                   | 121 +++
 40 files changed, 4642 insertions(+), 50 deletions(-)
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

