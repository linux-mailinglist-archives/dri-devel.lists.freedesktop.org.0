Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277798F77F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E3810E901;
	Thu,  3 Oct 2024 20:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FkR08YUA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F55510E8EB;
 Thu,  3 Oct 2024 20:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dxpwr2BglSyCOC2KnMO4qYX7aw2QfVvOyHt2MV3DDzZm61cHZ4o5Fk9QPppG3rHsxoxOx6qFzrNzQUbZA/Mm/jx4eg2iZn3Fm1WLBE6k8fcUb/u3RnyOEZhbfqXK+LYHny39M02m4H9HgIZv9P08Tapve6uuI/vduXGhxcmdRNEUCwyCJ6wgADTZDaMA11Rtz7NAVDXks4OgOOW5ccgkPy8gmDNMTXqxOJtxag1CbKXJA15gd3NlLZMIGQMcNWahDUWLxM6OAUvLAAU4Hc+kQ5UcQ9OPyuGnX61WirpmAt1y65vmMGJRLpTdRlScM2pDvB9dnjT70NQdn8oS80aUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeOK7wh+hxOw30d0yDwc9naSEGZyQfFqpGgqrV9P09g=;
 b=jnUc8TIoP+hw35wsXJ5tyyrWS4OTRH0ctGOlyZMGWpqL9WFKqipb3fbtc3HlRVD9DeQewp+mUiFPa7MuOtQqM4FklkWJF7Xo+3capvyvO69MSibQu1WFsHuM3ebiuVrBYxUXiuGJ751Ew4HsVU0eWqvxzzvoEKz1jN9jD5zZhY1OQ9/7WC9QOEdYR240xTFlT+xGhkdW48R7uutvu+juTKqD4e5kDHsXz6hQ9NvxpnVcpmuiIvqusNxPb+M8nGBwvUMHCzKhsxxTK54/1/zqZmcP6A2NjYXdSf51LuIV9m9AV/eA0eH3AnuipLVy4UTkP226t8LU4GZ8mk0Se8ouvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeOK7wh+hxOw30d0yDwc9naSEGZyQfFqpGgqrV9P09g=;
 b=FkR08YUAL8mnD6M4gDaRgTTRI4Yxe3V/cnJGZVk7vcv5+747h17vqGooDLyo+08/Fk3g/LFQWE0nA1BtqqzSLP8XKip/u3RALpYTfgDK7Le61QZmNtykhg3gdrxjavU6RG4P31ERn7Lcn7dMEmLeKCMnN/Zmpen3KtHLP8kO5VI=
Received: from CH0PR03CA0063.namprd03.prod.outlook.com (2603:10b6:610:cc::8)
 by MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 3 Oct
 2024 20:01:36 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::c5) by CH0PR03CA0063.outlook.office365.com
 (2603:10b6:610:cc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:32 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:30 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Simon Ser
 <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>, Sebastian Wick
 <sebastian.wick@redhat.com>, Shashank Sharma <shashank.sharma@amd.com>,
 Alexander Goins <agoins@nvidia.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>, Aleix Pol
 <aleixpol@kde.org>, Xaver Hugl <xaver.hugl@gmail.com>, Victoria Brekenfeld
 <victoria@system76.com>, Sima <daniel@ffwll.ch>, Uma Shankar
 <uma.shankar@intel.com>, Naseer Ahmed <quic_naseer@quicinc.com>, "Christopher
 Braga" <quic_cbraga@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sasha McIntosh <sashamcintosh@google.com>, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH v6 00/44] Color Pipeline API w/ VKMS
Date: Thu, 3 Oct 2024 16:00:42 -0400
Message-ID: <20241003200129.1732122-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|MW3PR12MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7ffbe6-fae4-4cc9-da68-08dce3e62f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDB4alBaRTRqNzJQc1dadVZrVDVNaXlPZms5aDJqQXBIY1d4RmxrVTlSeno5?=
 =?utf-8?B?bytMemxnSHB6eGR6VkJoYXRNcXlUSnczT1NBQUlBM29HUnBJejNDa1RSR1Ny?=
 =?utf-8?B?UlJhM3QrV2x0WjNueGd6WUo2ckhRdVFMMjFsVzhVU1VzeTFLVFdaUzI2WkFo?=
 =?utf-8?B?VWlweEJPOUR1S1UzKzVZZFhuSGEyK3BDVlpGYWVPZS8zckVta1pqUHF0Z2tq?=
 =?utf-8?B?aTZDeFVSMk0yS3RYbmRYNER6dWRadlgzS1VGdTlCeGRWdmxDcHJWdE5kUUp5?=
 =?utf-8?B?K0hLTFFHRHhSQ3QweENKdUJ2YWkrQnVvTHFYckQ2MFhUeXpqNjk5aDFXRE5r?=
 =?utf-8?B?bWhReGVIQnh4ZUNobjUrWEpvaDBPbkZpeWYrc2RoUjkra0RLTThPOFBCYmRo?=
 =?utf-8?B?RVFZc2J1WW8xSDFpb3NPR0pjTWs0c2l4N3ZxRFdBeTB3QlpYVzBUbDlKWGhl?=
 =?utf-8?B?bkdCaXJnVXJTVUFMamdIWmJSUHFDcVcrR3FYdVdHdU9tYVB5MGNIQjZxUURi?=
 =?utf-8?B?TWp0b1drWGJ3UWd6NmF3ZnppVnZOcmg1Q3dwVFkwTEZIQlA4N25SVVJ6WUhS?=
 =?utf-8?B?ZkU2NzMwTUZDZWlPVkJ0YnMyTFJROTV6amIwRUx5VXRGWW0rSVRZRExLUm8y?=
 =?utf-8?B?OEtRcDdhblB6bHlTTi85czZlelNlVm00MHNvVzFVYTVDanlxcTVqMzZqbTMx?=
 =?utf-8?B?WG41VjNxSUFKdFpLOXVWQmhnMGhzZWRGN3Rra2pyUnBybDRMNW1YVG1LVUxi?=
 =?utf-8?B?NzJPbTVqVDlKenNwUHNLNi8wSlNSL29neHQ4RmkybHh6cllZd1VrV0wvN1g1?=
 =?utf-8?B?cVhZTHArdmEzSHd3UFI1Y004YUd0OU5JdU9Fc1Fsc3FWK1JQTUJIa0FRRTNz?=
 =?utf-8?B?eGNxTWNhaFM4djZiOFhiRXliYzVUNXVOc3pMeUZtb3lYNlJtKzZ2ZGpFTmNX?=
 =?utf-8?B?OVp3QzdrcmtHWlYvRkdpNXlCSEwzTmY0VFh4L1hmYjJxQllVNmszL3V1bHow?=
 =?utf-8?B?ZmpoUVRxSFVnMEswUHZqTkowdXduK0xZZ1JZUFBWV2JxTFdiS0dXVUhUa3hL?=
 =?utf-8?B?bVZXemtuYkxnL3JtdUp1blN0RXpCblNlWU1VQ2JvZitpbzRZeUxoMlhhTE1D?=
 =?utf-8?B?a3FQZDJuZWR4M1hiVzk2QUNnZWdvMTZnQTNBRkprRWpKOFNWTEZYUkFUZUt6?=
 =?utf-8?B?Q3FKVi9aTlNrVTZCcjYvNmYvMGZJbEhDN2JUT0tPZ1hRQzIwWXEvM2pXV2M0?=
 =?utf-8?B?N3FYbjBBSHRMTlpyTWo4dXN4Tm16ajJqOUFYWTc4dVFpZnJ2dzAyVEoyZmZQ?=
 =?utf-8?B?a2tSYkJMQ0JETUhvTjBOaFg1YW9XY3k1ejhsVWM3dTEyN1ZlMU1LL1NnZzcx?=
 =?utf-8?B?WThQZExHT0NzTkJFV3B2d2tJQ1pEZUV3Z3pKSkp0S0RlNUw1UnJmYUlhRC9q?=
 =?utf-8?B?eFhsWXM0TFJmV1QxVmhjbE5GZHNUSnhubldrTXlRWElYNnIwTGRoZWpzazV0?=
 =?utf-8?B?emRWUDIrL2huQnpBc044UFVJMHM4Zy81SS9SMWNabm12dkQ4ZitodjZzZ1li?=
 =?utf-8?B?YkI1V1R2V1ZVVytWdUJUMS9kYm9wTVZsS25IL1lMREVsVFZzQTV1Qmc1TVhp?=
 =?utf-8?B?LzNZQTFkeWE5dUlaNkNiZUl6VTV6YVlCVmRMeVJsU2x3WHg0NStVRGtadGxV?=
 =?utf-8?B?SWNZczJTWkNKUDM4WGh3ZFFJeEltaExjK2t0Y2FFNUxxRHYzOFZxazYvb2Zm?=
 =?utf-8?B?bEttb2VaUjBOMnJNM1VvL2wwdUlYZTZOUUZpQ0dna3dsejRlSXY2TFdHNUhT?=
 =?utf-8?B?bFlWb2ZDUGNOdkJoYXM1dz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:35.5383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7ffbe6-fae4-4cc9-da68-08dce3e62f8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460
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

There is a version of v5 with Uma and Chaitanya's patches for the Intel color
pipeline based on top of v5 to show how I envision them to mesh with
my changes. The relevant branches can be found at [3] for the kernel
and [4] for IGT. There were some rebase conflicts in i915 and I'm
not entirely sure I've resolved all of them correctly, but the branch
compiles and shows my thoughts for the new DRM concepts to support
Intel's pipeline.

[1] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-color-pipeline-v5
[2] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-color-pipeline-v6
[3] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-intel-color-pipeline-v5
[4] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-intel-color-pipeline-v5

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

Alex Hung (13):
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
  drm/colorop: Add 3D LUT supports to color pipeline
  drm/amd/display: add 3D LUT colorop

Harry Wentland (31):
  drm: Add helper for conversion from signed-magnitude
  drm/vkms: Round fixp2int conversion in lerp_u16
  drm/vkms: Add kunit tests for VKMS LUT handling
  drm/doc/rfc: Describe why prescriptive color pipeline is needed
  drm/colorop: Introduce new drm_colorop mode object
  drm/colorop: Add TYPE property
  drm/colorop: Add 1D Curve subtype
  Documentation/gpu: document drm_colorop
  drm/colorop: Add BYPASS property
  drm/colorop: Add NEXT property
  drm/colorop: Add atomic state print for drm_colorop
  drm/plane: Add COLOR PIPELINE property
  drm/colorop: Add NEXT to colorop state print
  drm/vkms: Add enumerated 1D curve colorop
  drm/vkms: Add kunit tests for linear and sRGB LUTs
  drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
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
 Documentation/gpu/rfc/color_pipeline.rst      | 376 ++++++++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 581 ++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 216 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
 drivers/gpu/drm/drm_atomic.c                  | 184 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 175 ++++
 drivers/gpu/drm/drm_colorop.c                 | 565 ++++++++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_plane.c                   |  52 ++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  70 ++
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   5 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 454 ++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 113 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 132 ++-
 drivers/gpu/drm/vkms/vkms_composer.h          |  27 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      | 130 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_colorop.h                     | 441 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  16 +
 include/uapi/drm/drm_mode.h                   | 155 ++++
 42 files changed, 4691 insertions(+), 49 deletions(-)
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
2.46.2

