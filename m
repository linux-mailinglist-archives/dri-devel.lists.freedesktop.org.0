Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2FE9F8B43
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C8610E370;
	Fri, 20 Dec 2024 04:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XEcDMedY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061.outbound.protection.outlook.com [40.107.212.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B030D10E0D3;
 Fri, 20 Dec 2024 04:35:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngqJFEW9SIVRz8Kfb0e/TYMJFEX/vNdEYiixTQ9v+T3i12+PYx415q7fKpiPA6dSLYpwBIn8tHSTkeD5RoeTkENpEdxUJX6sjEBpSXL0qcJUun6plBTMk5SMULlUxa4ArafZsaZJng1SkqYuzZtxTMDCh33Qy+pysburleRTdmA9PUGWScl/olaDctlhBNYLuFVzTelBPGdrLi6IjUM2tEES39ascexvQSabR5ypsVjrVYIVe5+ygpFxgtYEg8wDsUZbujB/O2PBGNwyZcFq4b+iF01EmObFc05+wqO0fldZfVPJAtrtBnLiFZFDVHU/tVxE0RHkfIXdK883/sG++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtPE1flTXAIXZ0OPFxlUmCfo9xm7WZ2afzq4l3hc85k=;
 b=FaAAn0oNTpn420JP0Aukd/oIDlHnf5O/YeKW09s2xg3BGup37LYoDuP6XRha0iGp9Xf4zQapO+JzTR8bba8aVIZPNhcFy7gkB1pBi4M+HFoovZzBRh2tWgISAbH3DTmoQXipRROlZoN42FsYEu41/FaQJ+rPJqGc/5eubXb3Gdcfuo5jrM7bozTo4vRuyk0vUHyeWbXD8EMBfF6l+su4qwdhOoxMV39WUV1Wk9i16kEmZTuCeqreafkTJRi7xNZyhj8/0/rbOvESuhlmQxUdK+HcP+YV/vNcFKrhlDRGm8mbV1lE9yatnpc61tGHFT4/Q/rlY+ksdoYgFRA4g3oy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtPE1flTXAIXZ0OPFxlUmCfo9xm7WZ2afzq4l3hc85k=;
 b=XEcDMedY/MTzQUQM0E7iPLioYCFP0uZQlt5zai2FoQ00dZK6votJ+6YWVoxznz1n4Q9lCKzButMfEzD/eWZG0n4Sv1fuy/4Qe8cE1nY+AJRDEUgzPN40bWJ88I26tOFzpR6GBmuJlRbT+pd82NYVR9DwcxezFiIdCLWluaBqiTc=
Received: from SN1PR12CA0065.namprd12.prod.outlook.com (2603:10b6:802:20::36)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:35:40 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::85) by SN1PR12CA0065.outlook.office365.com
 (2603:10b6:802:20::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 04:35:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:35:39 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:35:35 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, Ville Syrjala <ville.syrjala@linux.intel.com>, "Pekka
 Paalanen" <pekka.paalanen@collabora.com>, Simon Ser <contact@emersion.fr>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?q?Jonas=20=C3=85dahl?=
 <jadahl@redhat.com>, Sebastian Wick <sebastian.wick@redhat.com>, "Shashank
 Sharma" <shashank.sharma@amd.com>, Alexander Goins <agoins@nvidia.com>,
 "Joshua Ashton" <joshua@froggi.es>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Aleix Pol <aleixpol@kde.org>, Xaver Hugl
 <xaver.hugl@gmail.com>, Victoria Brekenfeld <victoria@system76.com>, Sima
 <daniel@ffwll.ch>, Uma Shankar <uma.shankar@intel.com>, Naseer Ahmed
 <quic_naseer@quicinc.com>, Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Arthur Grillo
 <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>, Liviu Dudau
 <Liviu.Dudau@arm.com>, Sasha McIntosh <sashamcintosh@google.com>, "Chaitanya
 Kumar Borah" <chaitanya.kumar.borah@intel.com>
Subject: [V7 00/45] Color Pipeline API w/ VKMS
Date: Thu, 19 Dec 2024 21:33:06 -0700
Message-ID: <20241220043410.416867-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|MN0PR12MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 1434c857-2660-468f-b5b2-08dd20afc1ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGw0bWFVSk1jQkJnNmxNS0t4dDhMQmR5SS82YmQ3QzdFR0NLNlZOeHRGdGFs?=
 =?utf-8?B?MXR0R3lpbE9RdUtOWSs0MXRqcG5HV1UwNjA1eExYMHlDbWx2VWpSMDI0SldR?=
 =?utf-8?B?QVZucytQUk9KWkR0VnNEcVpYNGM1SVpxSUNBZStYbzkwZGY1OEFLRHY2SnMy?=
 =?utf-8?B?MkpONFNtU1ZJdjl4QzRVVWVUdEdtMkhSaGphZ29WQ1BEWng5N25vZWNraTBj?=
 =?utf-8?B?M3BycytMRVFYazlJams1dS9ZQjIxNmxJUEhMWWttMlBWb1lNSUR0TkQzdHJK?=
 =?utf-8?B?QldRNGREQXNPY1o4b1EyR0NUZXBKY2d2YTVzSVJiK3ZFdzR6b2xBOXlUc3kx?=
 =?utf-8?B?RnhWTjdHZzgrSGFjb1pwUkloQldvQWlTelREREozVzJWaml2WVZXRmk2YlRu?=
 =?utf-8?B?WlZoVGFWd2NzM2NoWklSZ2crOWNuVVRQRUFvUC9RUFcwcnFJUUtMRmlQaFVX?=
 =?utf-8?B?b3pYTk1UUDI5ZWdsMC9BdDUzM3hwV2NQUGU2WmxCRWRnVEQzOEtVeG4wc3FJ?=
 =?utf-8?B?blNsN2I0bWJRbDZJZkpPU09vcWRHeURPTVFlaWhJdHdJdDBtcUZJNmxRa0gx?=
 =?utf-8?B?YytESG5rUUxUTkwzNDVuQU1xT3B5bXVnSjBjU3hUNENmVmZVZ29tTFR6cXhK?=
 =?utf-8?B?ampzYWVCbU9RUTZlaVk4RG5OMlpMNlJMRjBGUGkwOE4vck04ZHBzS3ZDNkNj?=
 =?utf-8?B?eTF1Y0VTZGt6S2xySmxHM0FNelBkZlBrYVM0a2RYcUlEK042Z29YVkNnRTZh?=
 =?utf-8?B?RzhmY3Boa1Q5bDF5SXdzcVRrRjhYSDlSREh5Z2xvL01IUGhSQjRYMGc0aEhk?=
 =?utf-8?B?V0I2RVc3M0NBakF4aUtDaWp2WkJMOXp2ekhCbVAxckJUOFJJL0pCOGlQeTNi?=
 =?utf-8?B?TDlzTjVvcC9QczkxSkFHYkFVTmRTdHdlMXNvc1FVaHJUdFhKRVZKeE81MG1M?=
 =?utf-8?B?d1VVeXovalRHMEZ1QWMxRDJBUVRhRGE4TVlWcXJNQkNFRklHRmNuVHdFUDlP?=
 =?utf-8?B?ODViQXdnS3NIUTdqdmZ3NFBodEhtZVNJT2MvbFdSUjlscDB1aThVVWZ2bEhv?=
 =?utf-8?B?OWVnUXRuVERzeGlMYWk2Rmg4WGlHbWRuZ3FRby9ZRzhtcDNPdHM4MVdvdkNU?=
 =?utf-8?B?eG0wdTJ1clJRNTg3SXp1N0RZOTU4N3hsNmhWSDRCNWVlN1FYV1ZNS1VCbXNy?=
 =?utf-8?B?T0QyRitoWFlrbnNTUmxHVzVRK1ovRFJ3UW5CNDdjczFyS05hSWxubTdaUi9X?=
 =?utf-8?B?Z1I4ai9SK0l2eGdIOWtnM292b0xremlNMzByT0ZOWnp1bElESUlOQ0FER1Fv?=
 =?utf-8?B?ZTBOc2d2aXNxRkxRcEFkdnVNdGYxaWdoZVEwT0hqUVhiY1hRb0hKYWdseE8r?=
 =?utf-8?B?Z2l2dlI0ZExBQ3JHR0t0d3l2QUUzTG5tWVFsdG9kZmw4cGZNUHh1NTI3MmZK?=
 =?utf-8?B?OG04dE1Ld3k1eFRKM1BaUWRFVnhqOXo5U0FZL0crSWpDZm1hZTNPVURxTTRY?=
 =?utf-8?B?V2NSeTFSUzlmMXppQU5kVllYd3VpZER2UitYZ3dGQ2JFK09FYVFmRzBRK1Y0?=
 =?utf-8?B?c3diUDFnemVhS3NRc1BEcXZkYW5kb0wyYUIwMjc1dnQ5UElJWUhLU2I3NVFz?=
 =?utf-8?B?Y3p1UE92dHF2VDJiUVlzNzNiMDJVUlVlcGJpaDZRMzdOWFBkbVA3aGVLVVhX?=
 =?utf-8?B?U3puZXRiYnd3RWFjZ2daZ2gxRUJFRGNYY29pK1lIUDJUd1hWSjZGZm9XRnFK?=
 =?utf-8?B?NUVDMmYxNEs3bk9vMHZJTjJKSGdLWjFkaUlxRGZRRCttZ1lzUkw5MjNGVkty?=
 =?utf-8?B?UmtsclBCQUFvVmcxVmU4QU9tbU8vMjI5S2ZFLytoMCtINEgrQVRiWWp4OGlF?=
 =?utf-8?B?cUhFUk5maUJNOVB5dU8rNDlsSFhKNkVpaUVyVkNoRytaQTRKK2IvdzdpTDho?=
 =?utf-8?Q?MyHgRjgGkds=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:35:39.6515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1434c857-2660-468f-b5b2-08dd20afc1ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368
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

[1] https://gitlab.freedesktop.org/alex.hung/igt-gpu-tools/-/tree/amd-color-pipeline-v6
[2] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v7
[3] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-intel-color-pipeline-v5
[4] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-intel-color-pipeline-v5

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

Alex Hung (15):
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
  drm/colorop: Add kernel doc for data blob
  drm/colorop: Add destroy functions for color pipeline

Harry Wentland (30):
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
  drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
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
 Documentation/gpu/rfc/color_pipeline.rst      | 378 +++++++++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 566 ++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 206 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
 drivers/gpu/drm/drm_atomic.c                  | 170 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 165 ++++
 drivers/gpu/drm/drm_colorop.c                 | 610 +++++++++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_plane.c                   |  52 ++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   5 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 459 ++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 113 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 135 ++-
 drivers/gpu/drm/vkms/vkms_composer.h          |  27 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   7 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 801 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      | 130 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_colorop.h                     | 442 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  16 +
 include/uapi/drm/drm_mode.h                   |  92 ++
 42 files changed, 4634 insertions(+), 49 deletions(-)
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

