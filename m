Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADAEA72736
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EA810E7A4;
	Wed, 26 Mar 2025 23:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5doQo/1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7AA10E793;
 Wed, 26 Mar 2025 23:48:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWrWpGtfxqEBZPyvr39E87YjVjhmkkTiR1t3rxUZy8vfIZ4C72onBozNvzjDtDmGPkq+Tw7F1iw3B+PRX/ZhcCAqNmk2nEhUmiyihISZHNiyWulSp3AHshyla2GOtxgWG5+1Zb5TPOS4ZcZLB6kn22CD3Q/HZx1U2jEw+NAVB7/DFN7y19xOXwoCOFDx+2XMkpJlNY1x0yCGxPXmttxD6sfLzH2gqOdhNycSV3N3gcqY9PIkXO+e2iDzcVpX95udeChS7z0vVQQqtX+bDitLgY65cpaZQACiKd3oU0X9H33wE9xZHFomVMpd1YNxs4WEBmMs6DT7KI2v3HS/TgmhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXltyZXFJ4uqh0f6kLT1rv+3cTLq6xuaSA/+ktsSseE=;
 b=zLqJcSpru1VjDeWgk4NXg2UYtMXnT8eb7CiUdp2UAinIlLrkoQXXMsS14oPUOZdJfx45FeC1RJw55sufCTUx3dOiFMzMYkj7L4ayj7NXk+AEcOlO5xaCyPxenGhGB0wPDzb35xEitto96NE/wgAMr3/u3r3EJRL0flX1tu+fDglWmbIAv8Bcmu5LHwEGCk+wDLH4uHPN3iVvTHfnumA1Eoby6c3zdYakc6NC4oNo85B34msxRp5bjUnECQjkTy5QHz3WLaR8fjo4lILmyTc5+6gsS2ccwMi9iSmacElWzBrlK3zSDkO73kXprU7RI7BSGZ9CjR0lSgPJxnWY40OXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXltyZXFJ4uqh0f6kLT1rv+3cTLq6xuaSA/+ktsSseE=;
 b=5doQo/1EwPJnU3S0eS/VfWrQJ2yrEzfQhiWlNuSEdq4pNxGObh2ydfVY6I3AL/KXCT3OL4wAfTTMMHeRtH9v11I3uHQFOFHnuH9WYppwnNhzHvYhLbK3vjr0wOZZnkljt1bv9MqbzFtKkYPqpks1bef52ZIA07fTrBI4WV/JbIw=
Received: from DM6PR06CA0051.namprd06.prod.outlook.com (2603:10b6:5:54::28) by
 PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:48:34 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:5:54:cafe::fa) by DM6PR06CA0051.outlook.office365.com
 (2603:10b6:5:54::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Wed,
 26 Mar 2025 23:48:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:48:33 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:48:29 -0500
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
Subject: [PATCH V8 00/43] Color Pipeline API w/ VKMS
Date: Wed, 26 Mar 2025 17:46:41 -0600
Message-ID: <20250326234748.2982010-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|PH7PR12MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa8dd85-1703-441d-fd77-08dd6cc0b863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmtrY3A5ejE3cUVDTXlSMnFhQmRyV3Y3M2gyMDZRUUZnZHZ2SkQyR2JNZWpX?=
 =?utf-8?B?Ujl1bG9HNm82dGtienhGSExIWDZVdldJcktPSU5nNHhRckhOOEFIYzlqTkVD?=
 =?utf-8?B?b2pRQWsrWWF1dXA4SEwrQWJrRzA1Zk93VTRsejZ3YjVkZlppQ09aZkwwL3cw?=
 =?utf-8?B?T29LbWl4UXNuaXhOUXF0ekZkVGYzMGZmVmN6NVBabHNJMGNubU5EenZNTXpr?=
 =?utf-8?B?S3VEWFZlMk85NWswbVZLRXlaZUJoNktLMnJ4eFY4R1lER0JOWGoyckRxTG5N?=
 =?utf-8?B?cjdQUDBUVkk0ZTZrdEtHSEUzblIvdXhPcytuN25RL2tEQTNTMXhvTjV5K0JZ?=
 =?utf-8?B?amFLR1FSMUNyb3dnemNvcmpnc2VFVmVrV1poQm5QNVQzcWduZkthY0J4eGo5?=
 =?utf-8?B?cHY1ZG9uUGhNTC94TDhpR3lyaDVYSjhhZnFTclVVYjdvNHErMGZ5UkRwMFVQ?=
 =?utf-8?B?cm90TU9yUmhldm9ieXVxM0xINitteXpBWXI1ZmRQTjZaSFpoMWIwM2lxSkhC?=
 =?utf-8?B?cUFxUmZMVEh5SXVwK2VqV0p0OEhkU0RqY01wc2JmT3hXSXhyZS9KV1Flb21n?=
 =?utf-8?B?dStjM2JJaTVGZmhER0NLN3ZDOStwMEJLRHdCRzNDM0lnQmxBWkNxalFqSEh4?=
 =?utf-8?B?QTFOSVF2QTcxY2R5bjcvTTJYQ3RJc0NVNGgvaExSMUwyYVNDYW9xVXBTcW80?=
 =?utf-8?B?b3prMWpvTDFkN0lhclFGU3ZvL1JaMVhORnVEanE3Y3V5RCtQVlcrSndzVmU5?=
 =?utf-8?B?bkM2YWVaaHFSU2pieXRPRUJsMkx1VUFOUkM0bzBYemM0dW5rZjNLMnc2bVpx?=
 =?utf-8?B?ZmkzSEFzWXJieXk1ZEI5NkdaWittK3hZb0VMZHVDRmtHZXpTQzB3Tmd1Z3FG?=
 =?utf-8?B?NzVaMTB6U0JwZkpNcjFqaE52U3l0STgzTDVHaVdCRWo1cFZPdzQyYTc4c0xr?=
 =?utf-8?B?bVEzbWpNYm9CODAvOWc3YnVMaVNJVE01Y2VHT1F6cldWb0k5a0lqaFVROWRz?=
 =?utf-8?B?b0QzSkdNSWJkZnh4UlNUTkhxR3hkcWlrR1hjSlZDZFErYkc3TGhhS0NXTFFo?=
 =?utf-8?B?TThCRzhTZTdKR0JXUjZiYlg1Z2N2eVlzUzJyV2tXcXBDbHhqUWlJdis5cGsr?=
 =?utf-8?B?YW9wV1h4dkY3eGx3UUtBakFSejUwVmpqcmx2T0U3SnB6Yno1eFU2eVFXVlAy?=
 =?utf-8?B?ZXBvdUUvMU4rZ0gzYXBQbzI1YmhoNDlvVjJqVy95K29GZTQzQzFEaW1QQ0JP?=
 =?utf-8?B?cVpYK2tEYVpEN080TGJoOUM2bVlrSXlPcFV0dTdlak0wa0pTU0Vic3Y5TlZ5?=
 =?utf-8?B?eUhObnVnMWFNU1djNXdseEp1ZmJ4YnJLcVJQV2RUd2pweDRpS2FjS1ZXQlVT?=
 =?utf-8?B?b3M4UjBlU0RZdVVCTCs5TmozQmJhMTdzTUFGbU5NbjZsQVJQdWpQRC9zTmFx?=
 =?utf-8?B?T2o5OFBWSlR2Nk5zY3ZmWlVna1N5Um04SWlPQ214YytsWWUyb2tzSHlSU0pv?=
 =?utf-8?B?WDdGRjlQNmJxclBFY2N2clYwK1pROFNHTmdSclRUbHJ6MW9zTURIS1BIVmND?=
 =?utf-8?B?b1B1QnBLcHJiWW5mYWJGZDNnMTNSdytRZDdzNXhHcHdxSzA2YUVCSjdBRktx?=
 =?utf-8?B?bGE1bTgvYVlUbk5saUFZMFM0UG1KTEN6OVRuajlkMnF5S21oREV2czh5R1ZM?=
 =?utf-8?B?cHpZR3JCYy9ta0M3TFUyRnpxV2RNcnlmb0hLMk5rdnlmK2ZNZE5YbWpTTnNN?=
 =?utf-8?B?MTY5cm5hN2MrNlh5Y1ZpT0czU0dMVUVJbHJEUGtIZERHTlFDYnpsbmNWR3VT?=
 =?utf-8?B?SkFzYjNIaDJwS25ISEFmWVJBMmhGbWk5MlRES21iZHFxc3h0VFY1TGRBSVpT?=
 =?utf-8?B?SEMxTlBTQ1BkUG15VXE3RkFrUnB5c2o5SEQraWl4djNacE9hM0dDelFNY1d6?=
 =?utf-8?Q?pNFy5XXbas8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:48:33.9173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa8dd85-1703-441d-fd77-08dd6cc0b863
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818
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

[1] https://gitlab.freedesktop.org/alex.hung/igt-gpu-tools/-/tree/amd-color-pipeline-v7
[2] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v8

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
  drm/colorop: Add destroy functions for color pipeline

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
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 206 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
 drivers/gpu/drm/drm_atomic.c                  | 170 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 176 ++++
 drivers/gpu/drm/drm_colorop.c                 | 607 +++++++++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_plane.c                   |  59 ++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   5 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 459 ++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 113 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 134 ++-
 drivers/gpu/drm/vkms/vkms_composer.h          |  27 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   7 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 808 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      | 111 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_colorop.h                     | 441 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  15 +
 include/uapi/drm/drm_mode.h                   | 121 +++
 42 files changed, 4670 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h

-- 
2.43.0

