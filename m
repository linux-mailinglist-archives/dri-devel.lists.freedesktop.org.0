Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D97D03B3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7762210E541;
	Thu, 19 Oct 2023 21:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060.outbound.protection.outlook.com [40.107.96.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D889A10E541;
 Thu, 19 Oct 2023 21:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBoRRGDzAFqy+SDPdEc+QH2raVulLbwD12eatChhMf3C6kjUdJmRySW2YCPy4q9vDJ/CNXb83hK2CnKvZklfHUqRbbLYV2B9Gj0M/IDcl4KOmdPAqqODi7pnARvPuKAqc1yklsvYFocOZOkUr9OvVUCGxOWbuCIapirnYeyHDff/ZthYw4Cs2SK4smthJ0bflYkj8qxVlJd47CHxNVgqG07SXrToQOLwiThLd2XK40+kB+Q5yMbfxoi3n0pKOLFhlKjZpNE411RpAVwN5IiRXGBYIfJGMQYHqKmzvVTKh/CeksQc7adrsVnIANgceOLcpzj9QnDF+6kfJsK4ZKgtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1AhWT54JRcYBQ41/QYGS+nDJwa/sQHjBJWhbLjNHgg=;
 b=CHQO8js+gLb3cxJV6lDtk2boyD6m1ahHZjRMsytV5Zbep0PYOuJMcMqPIoaR6F6O3icYc1gUW/AnPq9/hi31Z10nLmWshj05+RE9qSM0zIKA0Np7tiVXXy8peNi9DU/FAulBMCeksxskngHQ77EJP91pRdZlX3h1K1HtNZkOaF2Q78+AtBdtX+iR+j0YOHeE9NMystLqfp/01bNG16k+rdr2YEWUjqATaXWuNScMCkTmDayv5ZVmaywmMTBzcKFumTfe7AoCAZjTSv2FszKJidTKjzq0BSBXBtQ8EqU+xStLgFS45L5/s2uWunPHrVDmLlU9ZuymaSFd6w1uyNm1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1AhWT54JRcYBQ41/QYGS+nDJwa/sQHjBJWhbLjNHgg=;
 b=WkhzS6EStbavYkv+KEH7KaSbJ3dKbSi4D26lv3uxoRNchx1hnuEISolED9b4WIJdllvCFbzLg2WP8xagISyshwpDEki6dMDdziNmXrgHRHH/6VqQOWB0XF0KcimkYRpGLdQ7Tc//vLMbGiqrobJvLwYkcLF6p4bYCBqPRKr5rs4=
Received: from MN2PR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:23a::15)
 by MN2PR12MB4565.namprd12.prod.outlook.com (2603:10b6:208:26b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 21:21:54 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::35) by MN2PR03CA0010.outlook.office365.com
 (2603:10b6:208:23a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23 via Frontend
 Transport; Thu, 19 Oct 2023 21:21:54 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.21 via Frontend Transport; Thu, 19 Oct 2023 21:21:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:21:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:21:35 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:21:34 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 00/17] Color Pipeline API w/ VKMS
Date: Thu, 19 Oct 2023 17:21:16 -0400
Message-ID: <20231019212133.245155-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|MN2PR12MB4565:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9b61ae-a831-462a-8d54-08dbd0e96a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WU0dh7TOaXZs8SMydqonmlnWk4WmuE4rJqKTh7Psq4CDEGSWyP9a/L1ETcSlSRGJTv6nGUsoGoAJN6259toP7Pf2kzjSXILqANggNy7QqkdIAS1lAha/NYKjqjb1+F1MhCZCZxkyTZAF/Yx4nQbW18hZS2PS02r6yZsSTGb3JpcOJBrWbacCXpfjd7nvxoEqFCBTQokve7hyjHP2VhPS5Yi4jLFjS8wx5nDD6kctpJ15D854DXqoXw3IW3swOZ47SUzbwVkEFKO6RgGh9Ci6YzQkv8Eg6caL7hJxsWqDHS60nCMk5C9ZxzgnQZUrdDp/xd67+1ZmDpox8Iim9C+4+DT6QxAoxRzWWuW+r6+yi0yKmAh0spDg6P2EblArzts2cWSLG2x00Onxt+FE0CTiOMsNTfOO91Q4ozpiF00R2o8hoJ9EGJqQqzVaAmy8BXe9HnCmjxplO9EeTcNfCk+dVGw6u/UDbdyNFj/l/6v4UXp6JYpjFAMwT9FZTmBS6gc/M/IEHlCgDSOGp+rZcecas1AfsVH5tIaKtH7KhsY0Fyh07Vxr5BtMemR5nOw22aL5ndgR71+IF+edHA70sIcI0Qh5YmJ8UDCE5SUTBvJAg4vkWIzgrkRP8h7KnMCv23yI0ljp/B/gyYOxeTXj9al4rQkDgCcT47ub/3kkKDSY3Cl2fvaZGmFbcQxscndJOTYLwM9TQ/47K/+VC+M9/RsySIvA5pch9Ci2wNM+5++Q1K+zTLOWMY3DvPBbMgyeJlPw0ixCJktpOj2aCB3DiXP/06Jesd2hqp0UcLgiZQ170UL1GP2xLKDa+f5jLVvev2/M
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(82310400011)(64100799003)(186009)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(41300700001)(2616005)(26005)(426003)(36756003)(1076003)(2906002)(7416002)(86362001)(66574015)(4326008)(8936002)(8676002)(336012)(36860700001)(63350400001)(43170500006)(63370400001)(82740400003)(356005)(81166007)(83380400001)(47076005)(7696005)(6666004)(44832011)(5660300002)(6916009)(316002)(478600001)(70206006)(70586007)(966005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:21:53.3979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9b61ae-a831-462a-8d54-08dbd0e96a6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4565
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

This is an early RFC set for a color pipeline API, along with a
sample implementation in VKMS. All the key API bits are here.
VKMS now supports two named transfer function colorops and we
have an IGT test that confirms that sRGB EOTF, followed by its
inverse gives us expected results within +/- 1 8 bpc codepoint
value.

This patchset is grouped as follows:
 - Patches 1-2: couple general patches/fixes
 - Patches 3-5: introduce kunit to VKMS
 - Patch 6: description of motivation and details behind the
            Color Pipeline API. If you're reading nothing else
            but are interested in the topic I highly recommend
            you take a look at this.
 - Patches 7-15: Add core DRM API bits
 - Patches 15-17: VKMS implementation

There are plenty of things that I would like to see here but
haven't had a chance to look at. These will (hopefully) be
addressed in future iterations:
 - Abandon IOCTLs and discover colorops as clients iterate the pipeline
 - Add color_pipeline client cap and deprecate existing color encoding and
   color range properties.
   See https://lists.freedesktop.org/archives/dri-devel/2023-September/422643.html
 - Add CTM colorop to VKMS
 - Add custom LUT colorops to VKMS
 - Add pre-blending 3DLUT with tetrahedral interpolation to VKMS
 - How to support HW which can't bypass entire pipeline?
 - Add ability to create colorops that don't have BYPASS
 - Can we do a LOAD / COMMIT model for LUTs (and other properties)?

IGT tests can be found at
https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/merge_requests/1

IGT patches are also being sent to the igt-dev mailing list.

libdrm changes to support the new IOCTLs are at
https://gitlab.freedesktop.org/hwentland/drm/-/merge_requests/1

If you prefer a gitlab MR for review you can find it at
https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5

A slightly different approach for a Color Pipeline API was sent by
Uma Shankar and can be found at
https://patchwork.freedesktop.org/series/123024/

The main difference is that his approach is not introducing a new DRM
core object but instead exposes color pipelines via blob properties.
There are pros and cons to both approaches.

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

Harry Wentland (17):
  drm/atomic: Allow get_value for immutable properties on atomic drivers
  drm: Don't treat 0 as -1 in drm_fixp2int_ceil
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
  drm/colorop: Add new IOCTLs to retrieve drm_colorop objects
  drm/plane: Add COLOR PIPELINE property
  drm/colorop: Add NEXT to colorop state print
  drm/vkms: Add enumerated 1D curve colorop
  drm/vkms: Add kunit tests for linear and sRGB LUTs

 Documentation/gpu/rfc/color_pipeline.rst      | 347 ++++++++
 drivers/gpu/drm/Kconfig                       |  14 +-
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/drm_atomic.c                  | 155 ++++
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 110 +++
 drivers/gpu/drm/drm_colorop.c                 | 384 +++++++++
 drivers/gpu/drm/drm_crtc_internal.h           |   4 +
 drivers/gpu/drm/drm_ioctl.c                   |   5 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_mode_object.c             |   3 +-
 drivers/gpu/drm/drm_plane_helper.c            |   2 +-
 drivers/gpu/drm/vkms/Kconfig                  |  20 +
 drivers/gpu/drm/vkms/Makefile                 |   6 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   4 +
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 100 +++
 drivers/gpu/drm/vkms/vkms_colorop.c           |  85 ++
 drivers/gpu/drm/vkms/vkms_composer.c          |  77 +-
 drivers/gpu/drm/vkms/vkms_composer.h          |  25 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   4 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      |  82 ++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_colorop.h                     | 235 +++++
 include/drm/drm_fixed.h                       |   2 +-
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  10 +
 include/uapi/drm/drm.h                        |   3 +
 include/uapi/drm/drm_mode.h                   |  22 +
 33 files changed, 2530 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/Kconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h

--
2.42.0

