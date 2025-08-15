Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27323B27726
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF9810E8D5;
	Fri, 15 Aug 2025 03:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="at2vVSGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F0810E350;
 Fri, 15 Aug 2025 03:51:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2/HW4wMatb2j7P+RrShgbqVYS9Wzd0cW06bSo+2hzEtust9ZNDTDsgdmM99Uiczya60QnqOGHF5p2bW4Bj4LJ7e95PI+9cEzZjV+vycx3ZAjb9DQv8/Oi9rSoKIGa55ZVgtK3LZXzxR89BWfHm2RuBD/Cve9Sysla10k9oa1DA5hpbwzzUscXJR/3Pr/jxCmOFh5HrKOvcWH7rOWApzQTNm2LA6WsP/auuP0t38RTItaAnK2zxQuXIr2NVljHLik1zyVtHSBnGYfz3OKm1/WuhNsjjXlr1bnFi3QNbNyi4ZIC21N4KKNZfR7wTwzCSu5BVfzPjSCZn+AYaNY/JDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyUkqsOF7ZSAV2AoQuoUB24WodnY+Fcqd3+DjQeUhGo=;
 b=G0nHEEaMRD5oSKSqt9ULBsCFtguuxzAb+XUesireh0PxjfDuce4uIv3IWzic1IWzBJpitVQfZnwrSJ+804tA1qsRMWN5H3KrmhE7ylkbx51vgAECwb6zodbM9Ed18zcwRTys3rH2RIWSVW5ugrBjoxmzKTV/zKs+sPwcpte0FruSN+v69/dkZGgwzh1FpBs4aROP3l9JrsBPoC03EjTH1urB+mvMvGhtRVJBZycDI61XgxEYmlOcTHkIUoBZFo19XH+aNJWzBjc9E52QhaiBuoqKk8mLRjkTp3N7sET0ei3SFOTwG02oDbqC3wVGxQOgYgNnTnda9sQM7UGCqFQNOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyUkqsOF7ZSAV2AoQuoUB24WodnY+Fcqd3+DjQeUhGo=;
 b=at2vVSGgYEb821kZIoCumCKKN+ssespc3FkzIwY2ccIoDhHKv2kpsJLoXNS+B6Apewudi7S54wmbJydBXVCT9i+GRj4JE3ubCafbQL7sGaZfQ2i0es1InvDgn2akO7EFzx/1yPizTzGHogW7vVqu0k1S8PF2xb4g32TEkUYU7cY=
Received: from BN9PR03CA0052.namprd03.prod.outlook.com (2603:10b6:408:fb::27)
 by BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 03:51:38 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::ee) by BN9PR03CA0052.outlook.office365.com
 (2603:10b6:408:fb::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:51:38 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:51:34 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Arthur Grillo
 <arthurgrillo@riseup.net>
Subject: [PATCH V11 00/47] Color Pipeline API w/ VKMS
Date: Thu, 14 Aug 2025 21:49:49 -0600
Message-ID: <20250815035047.3319284-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|BN5PR12MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f27b62-2a71-44e0-041f-08dddbaf0985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1NLMTU2dlFhTEVZb2UrNGJyS1NqSEhNTlhndGI0VWRNdllwK2FzVWM0RmFZ?=
 =?utf-8?B?c053YzdIL1ZydlVCcVZoSjFEempweUZQYUtyOWZJelMwY1ZqOGdDWldHSnB4?=
 =?utf-8?B?RkNaRmx0TVpjL3ZCZUhHU1hOV1dxa3RNVFlMcy9VcXpsUkFSQ3dWMXJYajU3?=
 =?utf-8?B?WnA0c3ZEWmJTUjJvcmsrY3VTV3FRZWhyQUJXRktENG1DVHQyb0NTajNzbWZk?=
 =?utf-8?B?TnhpdHJsbzhyTm5KTVV4M2dkM3FuWUZxVzJZa2Z5T0JGN3VFNWxBZC8wNUNZ?=
 =?utf-8?B?WGxNWlp0RExKTlh2ejk3WmVoL3lKYWlhZ2FLbXBIZnZkMWxvZGtLN3FYWXE5?=
 =?utf-8?B?QUtOUURGZ0hwSnZSNEZyTHVTamJYWlM4KzlEL2dRUm1md3c4TmV3MnFTdmxk?=
 =?utf-8?B?N1NRN3ZXRTdOYk8wdFg3M2p0VCtUZlNxS3hNVm1rWG0zTi9sSUdDeUlwcis3?=
 =?utf-8?B?UEF2Ymt0N3huZDlUWFl0QWFnYVZSSzNod3ExUWpGTmRobnJOTEVGdHdCbUd0?=
 =?utf-8?B?WkxjM251MFlCRGN5eFNrWDR1RGVmME1vMVVmWUNWTkxJRHBjdndtUzZoOWZj?=
 =?utf-8?B?VEVZUHlFV3BFQzJ1eVA1S1c0MUwzeVQ3VURhVS9qTGUyZkNmYmRBdzFyb3VO?=
 =?utf-8?B?Y3VGcWxCeWNUUEtHMnBTVkxDY3N1ZEN1QmRtV3lNcklFQ09kN0dRc1ZLd3ZG?=
 =?utf-8?B?SFF4bmR0aVF2ZmRsTlVGSXpQYnBJSS94OEpzSm4rY1JIVG5lTkFRNnpFV21Z?=
 =?utf-8?B?dEFmV2xzREZWd29RZVdNdjNMaW5LajRiRW4wREozUy9lRFZEWTNEcDM1eXZS?=
 =?utf-8?B?SCsyc1BkcUo3aG9VUjdkVndYbXhZalJ3a3VQUDNMWnpwYVFCYmFFV0Vlbi9w?=
 =?utf-8?B?VHNEWlEyS09xeUszcXNpSGx3cWdXM2d6QW5IRXJMdXJlMzVBTzFPYXRhVzhR?=
 =?utf-8?B?bHpnanF3S3A5SThpcHBvZzZncTJTT1k2NzJBcTQzWlRjRnhsSVVCUFdEM0Ja?=
 =?utf-8?B?Z24yTGZ4T3YzUzhEci9GM3JTSzFTcmhrM0dyMkNSV01nd3dpWEFPQjU5YVIv?=
 =?utf-8?B?T1dta1Y3a1lTT3NmTXpPZnlXUVJUcTREYm8vak83Qlkxci81NzJPWktRYmoz?=
 =?utf-8?B?bGhzZThRb3hhRUd1M3l3OUk5REl0dXlSdWNMYXBDeisraTR5Mk5oYjVkRU0w?=
 =?utf-8?B?TUQrM1l3bkxVMmJkTkMwRy9nWmplZmU5c20yRld4R2p1U1JnT3ZJVDJxZ0RU?=
 =?utf-8?B?UnZYK3FlZGQwZUo2NlJIY09tL3E3Q0p2Q2pJaHNJcFlyNVhTS1cvVHc4N3FE?=
 =?utf-8?B?KzdXYUdkamlHWXdYMVFDVnJvZVVMcWFtRHhldm0wWVZObVIvQ25JQkZldmZl?=
 =?utf-8?B?aHY5MWxFMmRhdWhVd1NDMzdyZG5NVUdKL2ZjQmFodS96blFweWxwYm51MGR0?=
 =?utf-8?B?MERLVng4c3FFYWxmM3c4RzU3NjhZUHNTZytDcSt4Q0w0S2Nrdk9nQWlSbmE5?=
 =?utf-8?B?MUJNU3lPYUV2UnJGcFQyYWFFd0NnWFVmMlZiMUZJdkJBYUZ2a0k4OWhneEps?=
 =?utf-8?B?U0tCWUNrSkl3c0Z6WlhUS1l4UVYzNkdtRDV1OXB6RzN6YWxLYmQ0aG5vNFVP?=
 =?utf-8?B?Y0RoRmlmbE9sS2ZBQ05mQ2NVeitlMDhDd2ZjZDhIMUllRlgzRVB6SHh3MHp6?=
 =?utf-8?B?b3pDMFdCeWJZelRGQ0tURGZqZUt3NGRkUitLeWZLa2ZseEVKMlFlUkF4ejV3?=
 =?utf-8?B?R1BKeDdPQkVZekpaRnowbGMyeVhvZWM0QVZaUndBRE1vSyttWjZEQkNWc3gr?=
 =?utf-8?B?YTVEVmJSMmdnYy9RaU9qei9IMXFONGZjNmROMEw0c1VKaGxwTlhxN3ZwZm5p?=
 =?utf-8?B?VlFsdk9McENNM3dBMnZrVGtPOXUrbm82OFNpaHZDWnhsQkt6RVlUL1B0MUtF?=
 =?utf-8?B?dnRJWFo3VmY4NEt4SmJvdlBYMWZCNndjWGg2U2ZiMnltYXhrcllxcjNFL2Nq?=
 =?utf-8?B?VDYyNGZ4bmt3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:51:38.1502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f27b62-2a71-44e0-041f-08dddbaf0985
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9511
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

[1] https://gitlab.freedesktop.org/alex.hung/igt-gpu-tools/-/tree/amd-color-pipeline-v10
[2] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v11

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
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 765 ++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 205 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  26 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  39 +
 drivers/gpu/drm/drm_atomic.c                  | 170 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 159 ++++
 drivers/gpu/drm/drm_color_mgmt.c              |  43 +
 drivers/gpu/drm/drm_colorop.c                 | 597 +++++++++++++
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
 drivers/gpu/drm/vkms/vkms_colorop.c           | 115 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 134 ++-
 drivers/gpu/drm/vkms/vkms_composer.h          |  27 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   7 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 811 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      | 111 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_color_mgmt.h                  |  29 +
 include/drm/drm_colorop.h                     | 442 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  15 +
 include/uapi/drm/drm_mode.h                   | 134 +++
 46 files changed, 4900 insertions(+), 64 deletions(-)
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

