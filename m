Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA557E5B58
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C443510E7A0;
	Wed,  8 Nov 2023 16:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46E410E179;
 Wed,  8 Nov 2023 16:37:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1KoMvl+w5gavergy3XSPMI31wUGAiOW3k16u3a72phZaIUDCycVSfT5bwTMDAt/Vj0EDTGCzmKsdzlcjrtcVqfo37EWDw18eSudYVRC89HSORC2kb7Y5om18KClUXGNdsP/MhFYrZJwoHVcoTRgbdKH72RPcPO4I51hBOsjcERCO5G4HFKfFcNAyCJYGvyXMQqPYxx3aqF0f+zZ2oObl9L7dL+vYFofPEPbUEBq8T15+9XvpYPCQsHOZVsjD3IpYROnG9hjSHcYDR3GZgDlh48EUL26SURrcORJhI369ohUNnnlSLveG0GEIzcu0l1B1674G4rAmd/SSzoth+NhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fFtAUJRfOYEJO52rml/HQzlvnyCRtNiJ95VVY+kUtg=;
 b=Uvr5z39dH/ET6AaDbJXLNcPBfIkYwbCVMNL6C0xp1ColbSsV7JzT9QOrQ9LbcpKIcekFF3WNjVjIqZCLYFOw1PmzTiM5r/0VHqK/hhUEXuuEDu/pDKWVRWagWcx8VRI+7qvuxYPsxeaVvr9Gkuls/lEcgAx/pNwIHHC/cX2ynEEE3U/MCOnyp5Rv8WeROPUqzXq00DpYONOXqqmy1gYFGCkb8aCBgsLHpqNVm/V2dy/WlRF0LvBsZe3EXMEUa6YYf+l9vKKPIU5VLktRp8iD7o71LRbEyo9a9WBOF/an3S6uTHTMrn1UUAkGSwI/deh0r+Ds2401yfcmJITHBWIn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fFtAUJRfOYEJO52rml/HQzlvnyCRtNiJ95VVY+kUtg=;
 b=ZZVcJsoU6ASTqcAyGXULizcftBec4Y+jV/XLNNL8/MlGVVPl8Foz077bs3mdcyTOjGVOUqmhDxol3mDh0XAzAuiSo4N/5RZGJ3DwQlqfJ+/YepXivEr/vorP7dnwpfjZNp9XR4cf6gSvfUDKuvjegsvSnDbVgy4IzvotwzrrTak=
Received: from CY5PR15CA0157.namprd15.prod.outlook.com (2603:10b6:930:67::29)
 by BY5PR12MB4968.namprd12.prod.outlook.com (2603:10b6:a03:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 16:37:11 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:930:67:cafe::b) by CY5PR15CA0157.outlook.office365.com
 (2603:10b6:930:67::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Wed, 8 Nov 2023 16:37:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:09 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:36:51 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 00/23] Color Pipeline API w/ VKMS
Date: Wed, 8 Nov 2023 11:36:19 -0500
Message-ID: <20231108163647.106853-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|BY5PR12MB4968:EE_
X-MS-Office365-Filtering-Correlation-Id: 9704a89c-d223-4d2c-1a46-08dbe078f4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jXHx9psRQSrB3HUiJ2cJBAWlH7Tf7OJl7AKO/P30qfmqMaHHStFxzgsnSEdjyfEVFk3UTWBRE5v60MdSzn0YEZfkCmZL/f1cxl64N8yyBylFz+UsP8a2sGNzzs1QvysOjb/+oNPW97g/JqCXlQcYcVHyJcrwYjnyzgFiOEQzHRVvdLyotS7VrdaYnTNbvOcFTjmyl4LnFEKY2dg21rweS5wKxwMkbsmBCDAVexWVOBGDvRDCMijI7vGc1CEDOrKT8/sKq/V7pmVW+VbpNrk3HWO4pb7Cgb5GjOVxhYYsQsKMU7Wr5xjb1FUAJy2K6a37G4LZH+YDEAj5VMhJ0S4s594yjtnbCZkvxcXzyOoF63Qk772l/Sfs5LcsCth5oY6rIBzRj0KDiG7+20Ojaa8guM/wuC8ERYI48gXFp6t+VA3hPu4G5QVKKqo84QxfV5/vS8EqbFclwtGhc/ADCSHV9/sys3tA19bZXqJkHlsJ/QKAH9r8WL/2JprEj736A3oGUsEj7O4Ny+vO40Q8PHd0j867tyoymCDhASYHVwkqdXWRCQ9CUkZBOnZMnwAsvkQbBK1BBPbx5If3QSWN1Bp/Uh+5CJ6G3o9YnWWtOObN76vfzJkb6J5lXt5kPzPHfxE8rvAYZKIWRDOYrNYX9zgUnA3bHPk6XAtjxqq1Y5BCgcxXQIYaR8dF4cvJ8UzlJtCz/odlKVT38lM5OtybMPmLPvRweer2lWBmycOt3u/wV2ONxPMyjXwqcfZRAeW8MZnm9JIGJG3uioDXum4/cljJfHhFUgIpSxZgN0p2AQPTg3GM4kwQDvN3LV9yPmdrds8s
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(426003)(6666004)(478600001)(966005)(70206006)(54906003)(70586007)(336012)(26005)(5660300002)(43170500006)(66574015)(41300700001)(2616005)(6916009)(4326008)(8936002)(8676002)(316002)(7416002)(44832011)(1076003)(2906002)(82740400003)(47076005)(86362001)(36860700001)(83380400001)(356005)(81166007)(36756003)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:10.7015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9704a89c-d223-4d2c-1a46-08dbe078f4a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4968
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher
 Braga <quic_cbraga@quicinc.com>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an RFC set for a color pipeline API, along with a sample
implementation in VKMS. All the key API bits are here. VKMS now
supports two named transfer function colorops and two matrix
colorops. We have IGT tests that check all four of these colorops
with a pixel-by-pixel comparison that checks that these colorops
do what we expect them to do with a +/- 1 8 bpc code point margin.

<TODO update below>

This patchset is grouped as follows:
 - Patches 1-2: couple general patches/fixes
 - Patches 3-5: introduce kunit to VKMS
 - Patch 6: description of motivation and details behind the
            Color Pipeline API. If you're reading nothing else
            but are interested in the topic I highly recommend
            you take a look at this.
 - Patches 7-23: DRM core and VKMS changes for color pipeline API

There are plenty of things that I would like to see here but
haven't had a chance to look at. These will (hopefully) be
addressed in future iterations, either in VKMS or amdgpu:
 - PQ transfer function
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

Harry Wentland (23):
  drm: Don't treat 0 as -1 in drm_fixp2int_ceil
  drm: Add helper for conversion from signed-magnitude
  drm/vkms: Create separate Kconfig file for VKMS
  drm/vkms: Add kunit tests for VKMS LUT handling
  drm/vkms: Avoid reading beyond LUT array
  drm/doc/rfc: Describe why prescriptive color pipeline is needed
  drm/colorop: Introduce new drm_colorop mode object
  drm/colorop: Add TYPE property
  drm/color: Add 1D Curve subtype
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

 Documentation/gpu/rfc/color_pipeline.rst      | 352 ++++++++
 drivers/gpu/drm/Kconfig                       |  14 +-
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/drm_atomic.c                  | 146 ++++
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 161 ++++
 drivers/gpu/drm/drm_colorop.c                 | 292 +++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_plane_helper.c            |   2 +-
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
 drivers/gpu/drm/vkms/Kconfig                  |  20 +
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 355 ++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 115 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 131 ++-
 drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      |  82 ++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_colorop.h                     | 258 ++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  20 +-
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  10 +
 include/uapi/drm/drm.h                        |  18 +
 include/uapi/drm/drm_mode.h                   |  22 +
 32 files changed, 2939 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
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
2.42.1

