Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42075C1E3B3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C35F10E22F;
	Thu, 30 Oct 2025 03:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uluZK9Ic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE0D10E22F;
 Thu, 30 Oct 2025 03:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xn2dKUnggG0DOdr8w9O4Gd8Th0LH/HHON6wPTWEgZJLU4+q8wxJgDLMQCtwTdzJE0aKG4KF/kK18cCm8niC3Yr7qig0x5VkKP8T76gyTCrKukrRwLta0l9SBqZxVYg50zAhBA5oWpgbwnK48+0WoqAXJgUlW7wzjYgeE2m6Jk+0bO70adYX+fVXhTOID1+EEjOAqCYyB6ZdOXGd7+BxMh2F1eDkLutVSzODNc8KdCrYNKvLr961TKp1ODi9ZN80naKyxxkwNInShqtfvR/WndSPCzrt0gfOum1hU2I7vC632Mb0jJ7OAFJ/TkFfFYP+idt5wZK7XFDWIanEIezCvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EHI/bPXvxZDWVLwNHkfEoyi30Tn/W2xolLHpmr0td8=;
 b=U0XhNrZ8k7buA9zKRikNFYjlFr749lLBgBgdXuwDeflgbFVRcYZly8qjhMyJPAMbx33Q1XrMBDL9SSaLHR2zm/3Hgkc50c6w3hZlqPDHOFRjn5yKFlJdSzcbG1vogKEMRsHlr39Oyag9NFAHi4ORG8y1JsDy1XaWoavG+oGSWbheM6MUz+W/ZblX+o2+gnv5jDdxL2UQpQ8l15mMXGMzvCH/dwu8KwNxT7lLQdB0a86FLY+nCOOHnBgz1nIZSiaJGH9r6KmIESAVxPZW9VH43RPQql5nTQ7+E5EPeQFx+ib10q8VNh+BYWzA1sdBoc0keKkZfYMsXg272ZsSCCHUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EHI/bPXvxZDWVLwNHkfEoyi30Tn/W2xolLHpmr0td8=;
 b=uluZK9Ic7znPy3lvCwbVKYN2Clmyjdto7RgSSfIGgTPfRvQT527zfwpDsSP4Pcqi98eQT/N2VuE+Tl5HdeiFXbGHVXXjmKXgIcINoAUhUuK5Ss95d8wSkXKvbrV6Ia3xROQwGe2vDtCzip7JH9jQ7aer0MRdB4OcRXLo7W2rgaE=
Received: from BN9PR03CA0364.namprd03.prod.outlook.com (2603:10b6:408:f7::9)
 by SJ2PR12MB9088.namprd12.prod.outlook.com (2603:10b6:a03:565::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:44:28 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::cc) by BN9PR03CA0364.outlook.office365.com
 (2603:10b6:408:f7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.17 via Frontend Transport; Thu,
 30 Oct 2025 03:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 03:44:26 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:44:23 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>
Subject: [PATCH V12 00/49] Color Pipeline API w/ VKMS
Date: Wed, 29 Oct 2025 21:42:05 -0600
Message-ID: <20251030034349.2309829-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|SJ2PR12MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: d4470c54-bb9c-4fdb-b39d-08de17669fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmdyRWJZMGl4bVB5ckpNM1dBazdGS01iZXd3Z0FEdEUyNTRDMWZwUlFvYW9J?=
 =?utf-8?B?citVUGk3STA3SlVtblJJcmJIbERCN3lnc1NrMm9XdWVCOUhrazU4aDhyeHZq?=
 =?utf-8?B?ZkFrTUJzZTloaWlyMkh2SFMvU0F4KzV2TE1FUy9OMTMrbFJBSWhrb3pXUW9x?=
 =?utf-8?B?UUNwR2JUZm5TZVpWS21Tc3FuOEZlYWVMcjJJQWh2c0NEQVNjRUtjbWVHc3U5?=
 =?utf-8?B?UHZlMG9BVURybTVTZ1ZzbkF3YjhKN3Z5NXZSKzdQT3c1dlNJOE0zNDlTL2ZM?=
 =?utf-8?B?U25mVlRDK25WT1Bic3k4VWNvbmdLOWovcFg1MU1paG5Lbi9VZnE3eDRWWXNB?=
 =?utf-8?B?VEtLbXdodWk2TC82R3RGZHB0UE9tVzQ2Nyt2Nkl2UFNDUFgzc01VTmp4Q1FH?=
 =?utf-8?B?QVp1dGJtNmY4TG5BVDZkOFcxNmpHYUR0M0wvVDJzRW5GSkU5TjZpVDI0SFlo?=
 =?utf-8?B?Z0toWTFpWWwwN2lYTC9IZk9zczY0VXQ5TjdLTUJMSjYyMGFQbkp3TEVGVzc3?=
 =?utf-8?B?L2FYcDN3djdnK2JYMmR4ZlpwM0ptWWNDemczU1F1OWpmUFlZckMvZmZsSVZ3?=
 =?utf-8?B?M2I4S2F6MjBoNHZlSDBZT1N1R2U2THJINjZHYU5xTkVBTXRrb3lmdFNWaXRN?=
 =?utf-8?B?UFB2emhCZWF5a1oxU3p2NTl2ZFR6SVB4amhleU5pZnNETENkUDdXamRIRTZG?=
 =?utf-8?B?eE9DYWdzU3lsMi9ja0Z0Sk5iNTJ5WE5ORkJnT3pmbUhBa1JCNkp1VDZzZVd5?=
 =?utf-8?B?WllUbkk4ckZYSmVYeVdRMkdnRWtrN0FRRnhkNGo3N3hCczRBM2JPS3hBdm5N?=
 =?utf-8?B?WkN5a01Sb1U2MlhWNHp1VVNYMmY0dWpRc3FtVmNsd2RKdFNBNDR3NzlXWlhw?=
 =?utf-8?B?RDBDZHFIK1NyU2JGcEcyWTFPRk8rQ0RMLzV4RWZZVWs2a3dhOTIrQU5mQTNq?=
 =?utf-8?B?SEtNSFA5ZjAyNHZLT29zRVRxNVErSnZ5ckVncVVQcVBQS25UUGNFOTFqenpl?=
 =?utf-8?B?MUdVWkNRSTROVWd6VDcyb1VSUHRHaHhOL0grV1A1V1RhMzFrSk8ydklSUUhD?=
 =?utf-8?B?MThJWW0vL0JjUC84c1RvV3hxUTUwbnR3ckwwSE5IbFBxRHVyMEVvWDhpcEJX?=
 =?utf-8?B?aXM4MHFIa081V0FyMWZ3WS9QTTNzVWRRS3U3Yi95bE5hS2FKYUtrUDBJVC81?=
 =?utf-8?B?SjhSbnZNWDFic1dtbkFaTXBMNkVkR3h1THNaT3dlMWpoSGxkUE1ERHd3NjBx?=
 =?utf-8?B?S0NMTmVNdHBad3NTc01QdTlzSVVONUs4VEhVemtMb2RlYkpkL2lLZjE5SUtm?=
 =?utf-8?B?aVNSeFpJdHVxUC93RGZlVUplNENZYmhqZVZIMEJFajlzbyt5VmQvRkM2N2dE?=
 =?utf-8?B?dG56ZFpjN01DVjZGbWdpcWJOMWExUjNtMm92a2xqVlpYMEJDMDhQZm9VLzhW?=
 =?utf-8?B?dDZSRmFuSDhtVm56Nm5CdzZGSDhsSXZJL1k3RG40djdxa0IzNmwxbEordWk4?=
 =?utf-8?B?ZGkydGw2NXBUZE9lS3NqYzdZTEhwUE5OVVJWenhsWDgxUk9KYUdrNU1mcmxM?=
 =?utf-8?B?REsyUlpuelBDcC91QlpFTC9SSHhXQkI4WEdFVlNLQVZVcFNGUVcxTlh5d0I4?=
 =?utf-8?B?QlRBZ3dFQmhYT3dnMkFtWlVVWWlhWCsrQm1BNlc4VFJ3VDhQWU1HU1ovVHEz?=
 =?utf-8?B?WUNoVzQwOXhQQnF3K0RBV3BKL0c1NnFBTmFEbXppL09pNFR4YVppQW96V0V3?=
 =?utf-8?B?VThaUDArQk5SNVMzc1JhcmZNTXZNckdjUnoxNU1ZSmxrcXBtNHRodEV3NGkv?=
 =?utf-8?B?YWdodDgrem8rUy9RODRoaUJPUk9xR3B3TG5MYjA2Rk91MEx0ZkIrWHVERERv?=
 =?utf-8?B?Y2lha096bFpxcldFQVV6SXJmRUhIMDNMZkY3a1YxN3djSWhlNEkzcmNHQmtZ?=
 =?utf-8?B?R0hSNEUzVmJ1MGQ5Tk9sV3lhL2d6ZVE5Vi9VY0VUQlVjUWFZK0VXTkxXdG9C?=
 =?utf-8?Q?0ROLOVVa9zmONoQ9k8Can4QeXQTucI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:44:26.8522 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4470c54-bb9c-4fdb-b39d-08de17669fd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9088
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

v11 change names from *_lut_32_* to *_lut32_* and fix RGB 32bit
    extractions.

v12 add gamma 2.2 to 1D curve

** Does anyone have concerns to merge v12? **

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
- Gamma 2.2 and its inverse

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

[1] https://gitlab.freedesktop.org/alex.hung/igt-gpu-tools/-/tree/amd-color-pipeline-v11
[2] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v12

v12:
 - Reorder header files (Louis Chauvet)
 - Add header file "vkms_drv.h" to vkms_composer.h to avoid compile
   errors (kernel test robot)
 - drm_colorop_cleanup is no longer static (Nícolas Prado)
 - Rework cleanup in vkms_initialize_color_pipeline (Louis Chauvet)
 - Add drm_colorop_pipeline_destroy in vkms_destroy (Louis Chauvet)
 - Remove outdated commit messages (Pekka)
 - Initialize the variable 'blend_lut' to NULL (kernel test robot)
 - Change lut_size to size (Sebastian Wick & Xaver Hugl)
 - Update comments for bypass_property (Sebastian Wick)
 - Update lut_size to size (Sebastian Wick & Xaver Hugl)
 - Add gamma 2.2 (Sebastian Wick & Xaver Hugl & Pekka)

v11:
 - Refactor vkms_color_test_lerp() to parametized tests (Maíra Canal)
 - Sort include file alphabetically (Maíra Canal)
 - Skip color_encoding/range_property in drm_mode_object_get_properties
   when plane_color_pipeline is present (Harry Wentland)
 - destroy function takes drm_device *dev instead of drm_plane *plane
   (Nícolas Prado)
 - Fix undefined errors by EXPORT_SYMBOL symbols (kernel test robot)
 - Fix comments to "2nd op 3x4 matrix" (Nícolas Prado)
 - Update outdated "drm_rect_test_suite" to "drm_fixp_test_suite" (Maíra
   Canal)
 - Update outdated MODULE_LICENSE to Dual MIT/GPL (Maíra Canal)
 - Create color pipeline on supported hardware only (Melissa Wen)
 - Update names from *_lut_32_* to *_lut32_* (Simon Ser)
 - Include help function drm_color_lut32_extract (Uma Shankar)
 - Remove redundant is_legacy from __drm_lut_32_to_dc_gamma (kernel bot)
 - Fix RGB 32bit extraction from LUT (Xaver Hugl)
 - Handle errors in __set_colorop_3dlut (Nícolas Prado)
 - Merged enable condition for drm_crtc_enable_color_mgmt (Melissa Wen)

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

Alex Hung (18):
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
  drm/colorop: Add DRM_COLOROP_1D_CURVE_GAMMA22 to 1D Curve
  drm/amd/display: Enable support for Gamma 2.2

Chaitanya Kumar Borah (1):
  drm: Add helper to extract lut from struct drm_color_lut32

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
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 768 ++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 208 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  26 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  39 +
 drivers/gpu/drm/drm_atomic.c                  | 170 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 159 ++++
 drivers/gpu/drm/drm_color_mgmt.c              |  43 +
 drivers/gpu/drm/drm_colorop.c                 | 600 +++++++++++++
 drivers/gpu/drm/drm_connector.c               |   1 +
 drivers/gpu/drm/drm_crtc_internal.h           |   1 +
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_mode_object.c             |  18 +
 drivers/gpu/drm/drm_plane.c                   |  59 ++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/Makefile           |   2 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 417 +++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 120 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 135 ++-
 drivers/gpu/drm/vkms/vkms_composer.h          |  28 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   1 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   7 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 811 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      | 111 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_color_mgmt.h                  |  29 +
 include/drm/drm_colorop.h                     | 462 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  15 +
 include/uapi/drm/drm_mode.h                   | 134 +++
 47 files changed, 4936 insertions(+), 65 deletions(-)
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

