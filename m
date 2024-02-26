Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC386826A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAA810ED3F;
	Mon, 26 Feb 2024 21:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O9SQGrdp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC0510E70A;
 Mon, 26 Feb 2024 21:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBHXVEK4ThXGVHvC1g3vqToP201FmgxkcgiGkKdDMJK5T0MowGkkND8hqtojMhAtMVTmyCfqstbf8+ANEhnrEyWoZvfTWs/cCq6FtADV49gzg/As1k+TXPS2iUlrGFX+tQf4TdVBAHaS6RllCQWMo3OpM/n6c+3onGckOGSDqxz6SiGBx7JLQaO/OJTTwWvicqwRJakzi1rU8kpAE/i1eSS9Cq9rNc52pP6Um0lXF2b2QVpXRlHqITphUYKALUXF+TR3ahl73muPaCxBkYMdwkns+ZZj524gCPzOUJ0BHGtlj0bmVBg1+XtrsgH6OiDSub8BVpzbatEdqfoIGhfuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhy0ISQEnqYID4mGZ7qUn7eFfB/gLvqQx05elNWJa10=;
 b=WNDQztoAu0be8l5j8ERvPDyzngBGSQk1SoXC9Wi11TGMeYyd2fUSo7KAo3IfLhrWr+/NMlcrAnsK6qINcLr/gZpliHZR4uFwNVqfHk7QRN2Bc7zcRlktA1vkpNdTCRsqynguAkjiNB8fz2hdOMLF1RUu2aJZlOZ6AHzhRK3mcHzTivfZLZYRCoqGwgcKDnBwRZR7G2uO3DnfacSBbvoy0ZWvY42Yp9HZLAaRzt8q8KYrw7CjQ7SFpbN7NuPSNGRRCF4r/WSTKwJTtyduSZj2hyUHdQrGPt356h+yWdLPArwgksaxNB17Lq+aMx56iK86KOVbxGRsuDSTSELOrQDJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhy0ISQEnqYID4mGZ7qUn7eFfB/gLvqQx05elNWJa10=;
 b=O9SQGrdpCuCmNuBTRzsY7rLBZdxC0UvUvWRE4niA9dk2UeuwU91f1WtNi7nE9gPzrPptZXhhv9XROCKd+JwlVSdsZZir9wl1iHv21zJins0al/nawmAs8bMFZh140ResXukqxAkraNo78PT996uST3NaOepmTkgTY9KKwTE0w/Y=
Received: from DM6PR12CA0025.namprd12.prod.outlook.com (2603:10b6:5:1c0::38)
 by BN9PR12MB5161.namprd12.prod.outlook.com (2603:10b6:408:11a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:07 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:1c0:cafe::ec) by DM6PR12CA0025.outlook.office365.com
 (2603:10b6:5:1c0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:06 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:04 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:02 -0600
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
Subject: [RFC PATCH v4 00/42] Color Pipeline API w/ VKMS
Date: Mon, 26 Feb 2024 16:10:14 -0500
Message-ID: <20240226211100.100108-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|BN9PR12MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e31154-8b2c-4d03-8cab-08dc370f72c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z+wSU7Ef8S9x5qGMEWzzPPaHeox9+QcbaWWzh/Pd6WHQWmefl4fVFfxtPBCeiXGxFvaDG2WCiDiZ+ptKFIlHNpgJGr9KR9/lGyloE/o/uUEjA8hA94TriA6i50bRRLg1u0cDqMMfRx6zZbkgUUe+spKtLy8oQF2EyT9rkAY7N9wjbS4rbcsoFEMmO4pzmZg3wiKo93/LLTOCykWZBi4MUg5B8zeI3CEgUODrf3Van9BdbiPv9EbQ8ihzQ0yqh2eAmXMlS3gTvWJsAZOnzel4p8eD31ZJNz0dGXO9Gbm7/9iWINmH3fLkBMycnM3PW5mIz66EbuYrN5jXnLCYBlX5ykWjVfqi3IuuPTAsXJTjVJXFgzxiM4uzhlsV/zNw6tqKWWpbfc6Us+ovoY71H/BEF+LsaHe4vwTuhAa2I6/cFp7l3RhEsnwudOde4NUZ3FqXxKU1511B15HNxcLxLki8m466Vh1380t5Btz3GQDrpj/AI+9Msxp7rp0x3Zpmx2sErPrqi+KrBHXxpUxNkn7CPuBmB+MGKVJM5WgRbEwVP9IYe28vp8S89DeIJXkI1BdQZaPRcSEmjQwUjNKHUj9zhIrQj20iStS+qdAyjOb519rCFJYOtJJ3jn3StZv6GhMxC4j6pnGKxOsUoSkU/dAoAIT6FcSq1OYcsTaIkfWpvUow1QkQkbNdum+qBmFE6+a0PchtbPaSa2bCoU+Aon9dKQDy2C27I19BSOPqLkR/Gtc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:06.8376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e31154-8b2c-4d03-8cab-08dc370f72c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5161
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

This is an RFC set for a color pipeline API, along with a sample
implementation in VKMS. All the key API bits are here. VKMS now
supports two named transfer function colorops and two matrix
colorops. We have IGT tests that check all four of these colorops
with a pixel-by-pixel comparison that checks that these colorops
do what we expect them to do with a +/- 1 8 bpc code point margin.

The big new change with v4 is the addition of an amdgpu color
pipeline, for all AMD GPUs with DCN 3 and newer. Amdgpu now support
the following:

1. 1D Curve EOTF
2. 3x4 CTM
3. Multiplier
4. 1D Curve Inverse EOTF
5. 1D LUT
6. 1D Curve EOTF
7. 1D LUT

The supported curves for the 1D Curve type are:
- sRGB EOTF and its inverse
- PQ EOTF, scaled to [0.0, 125.0] and its inverse
- BT.2020/BT.709 OETF and its inverse

Note that the 1st and 5th colorops take the EOTF or Inverse
OETF while the 3rd colorop takes the Inverse EOTF or OETF.

We are working on two more ops for amdgpu, the HDR multiplier
and the 3DLUT, which will give us this:

1. 1D Curve EOTF
2. 3x4 CTM
3. HDR Multiplier
4. 1D Curve Inverse EOTF
5. 1D LUT
6. 3D LUT
7. 1D Curve EOTF
8. 1D LUT

This, essentially mirrors the color pipeline used by gamescope
and presented by Melissa Wen, with the exception of the DEGAM
LUT, which is not currently used. See
[1] https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf

After this we'd like to also add the following ops:
- Scaler (Informational only)
- Color Encoding, to replace drm_plane's COLOR_ENCODING
- Color Range, to replace drm_plane's COLOR_RANGE

This patchset is grouped as follows:
 - Patches 1-3: couple general patches/fixes
 - Patches 4-7: introduce kunit to VKMS
 - Patch 7: description of motivation and details behind the
            Color Pipeline API. If you're reading nothing else
            but are interested in the topic I highly recommend
            you take a look at this.
 - Patches 7-27: DRM core and VKMS changes for color pipeline API
 - Patches 28-40: DRM core and amdgpu changes for color pipeline API

VKMS patches could still be improved in a few ways, though the
payoff might be limited and I would rather focus on other work
at the moment. The most obvious thing to improve would be to
eliminate the hard-coded LUTs for identity, and sRGB, and replace
them with fixed-point math instead.

There are plenty of things that I would like to see here but
haven't had a chance to look at. These will (hopefully) be
addressed in future iterations, either in VKMS or amdgpu:
 - Clear documentation for each drm_colorop_type
 - Add custom LUT colorops to VKMS
 - Add pre-blending 3DLUT
 - How to support HW which can't bypass entire pipeline?
 - Add ability to create colorops that don't have BYPASS
 - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
 - read-only scaling colorop which defines scaling taps and position
 - read-only color format colorop to define supported color formats
   for a pipeline
 - named matrices, for things like converting YUV to RGB

IGT tests can be found at
https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/merge_requests/1

IGT patches are also being sent to the igt-dev mailing list.

If you prefer a gitlab MR for review you can find it at
https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5

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

Alex Hung (10):
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

Harry Wentland (32):
  drm: Don't treat 0 as -1 in drm_fixp2int_ceil
  drm: Add helper for conversion from signed-magnitude
  drm: Correctly round for fixp2int_round
  drm/vkms: Round fixp2int conversion in lerp_u16
  drm/vkms: Create separate Kconfig file for VKMS
  drm/vkms: Add kunit tests for VKMS LUT handling
  drm/vkms: Avoid reading beyond LUT array
  drm/doc/rfc: Describe why prescriptive color pipeline is needed
  drm/colorop: Introduce new drm_colorop mode object
  drm/colorop: Add TYPE property
  drm/colorop: Add 1D Curve subtype
  drm/colorop: Add BYPASS property
  drm/colorop: Add NEXT property
  drm/colorop: Add atomic state print for drm_colorop
  drm/plane: Add COLOR PIPELINE property
  drm/colorop: Add NEXT to colorop state print
  drm/vkms: Add enumerated 1D curve colorop
  drm/vkms: Add kunit tests for linear and sRGB LUTs
  drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
  drm/colorop: Add 3x4 CTM type
  drm/vkms: Pull apply_colorop out of pre_blend_color_transform
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

 Documentation/gpu/rfc/color_pipeline.rst      | 360 ++++++++
 drivers/gpu/drm/Kconfig                       |  14 +-
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 352 ++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 160 ++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
 drivers/gpu/drm/drm_atomic.c                  | 161 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 158 ++++
 drivers/gpu/drm/drm_colorop.c                 | 411 +++++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_plane.c                   |  52 ++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
 drivers/gpu/drm/vkms/Kconfig                  |  20 +
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 449 ++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 100 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 135 ++-
 drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      | 122 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_colorop.h                     | 301 +++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  35 +-
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  13 +
 include/uapi/drm/drm.h                        |  16 +
 include/uapi/drm/drm_mode.h                   |  14 +
 38 files changed, 3882 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/vkms/Kconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h

--
2.44.0

