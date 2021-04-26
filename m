Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3B436B82E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 19:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69126E85D;
	Mon, 26 Apr 2021 17:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BD36E85C;
 Mon, 26 Apr 2021 17:39:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4mm6s90kEGftg1oPY0rUkmgAHOqr/ExMqNQ0gswOi8/HO9DBzupzDIWNEQPul43hqUdn7Ci3D9gg88Zp5Tl7vX8waiTDXAtePqJz3rd6yB/yFtvU0MBXc77Bd2tva02owGJ1cv80A92H4hrsfGWGs9JNYEbqysobWkFbMzafb2zjHPc/pIVmQOUXBuLJiS/+eXoKq9zKx5SC0JielsoyS7n32Gdh7lokkOEAdYSZBTAtKszWwX+M7iRWz7dDd233eMG/zLNF85NzBa0V175b4DXSA62dQz3SSqb/gydDb3dZfXmWvmSq+423RXrBzrxf/U8f1X13oC6RplsOnKszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K93Ip9QzP2T4aJnzphkxtar9E3WT4vg5utTRDGsi6Mw=;
 b=FtLu2CbW5hQHkxlRFABSpu5hZ93hwJXktBmQoURZphuU8IgbuSDRnGJFy84HxoUK0ROFcFOr+HyBP/ErC29sk2OqPsa7qZcPNOxZiYkTsCaUEURwsu1o9HiGyEITtgzChe9zHple9Sp7gVqHXTcPePwmxAUSR+Z5m0xoNj1XXZr0mw5hHBMZgkYSRV8S3vYLis2Wr7oEJGaQ1dA5vMt4iXBR2Yps/UuCd/re5zr5NNYa0y7LH9RMdotmQfjacAosjgwkd5w0F+wwS7Sj9YKHkCXP+6NY8kp0uKLzxIYoD+H1xraKEBnAGux6QjhBVbASvbq01/mTKiJ0gVL0YZmm1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K93Ip9QzP2T4aJnzphkxtar9E3WT4vg5utTRDGsi6Mw=;
 b=rIpShjySceHkyZdPy6+zSX7VxVNFlz8CGby4pUcf4k2zH5gPYy9ispGP4sShK6kann9kFV6Ml3rMc+xPfCHvGAggXgp5MIA8EPBrygKdGxPs8Ypjp8Xfs9JJTesNdPUf2I6T5tjpDhd+wKW9Hpj9AWJF7WYQNW232JCJgrFQ+hk=
Received: from BN9PR03CA0725.namprd03.prod.outlook.com (2603:10b6:408:110::10)
 by BN7PR12MB2771.namprd12.prod.outlook.com (2603:10b6:408:29::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 17:38:58 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::20) by BN9PR03CA0725.outlook.office365.com
 (2603:10b6:408:110::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Mon, 26 Apr 2021 17:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 17:38:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 12:38:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 12:38:57 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Apr 2021 12:38:56 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>
Subject: [RFC PATCH 0/3] A drm_plane API to support HDR planes
Date: Mon, 26 Apr 2021 13:38:49 -0400
Message-ID: <20210426173852.484368-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c326747-0305-49af-0df7-08d908da2c0c
X-MS-TrafficTypeDiagnostic: BN7PR12MB2771:
X-Microsoft-Antispam-PRVS: <BN7PR12MB277118B8CFC8B66126C3D96F8C429@BN7PR12MB2771.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecVW61jUODC11lJC/GwLIeW2yd1sj5UjgLm+pNqT2dGBbqP8mcYQ6gxUlcXysLFNAa7sLAh4v68y3lpP3p+rh4RgYyU36M/sJuWnBzwR59Fzgv6n1n3OnK4cWnNLpI5SSZ1ThrxoZd/ixYu0hYJx+WU6l305PvFjL/JDiQsMhZNcb1kpODj6dncU/YyT7NYbNVg1aqtntcRRS4qLOR5K4+kP2pt4+sDjeghxBGFqyrqOdYDWJJX0CR1DTiwCc0AmasaOoudNFg35juLwGcstcnUpD6HEURdxlXJAGpsHxZxT2DPy6hx6771xtWHxIjDxhR7VSEZwoUmO3l6S2fmwSeja+E99SpS9pVGLaWETT3pDwgmFb7En4hG/HpHrF/5q0yJ1y7CT8bfeLz2aMVBrNwpx2kInqFdc749swWmgXGHiZH23FLsmA+/1oenQLse4SGK5BNi0d0qWyAorTbDnU+AJNo2xZzgMFsQ5LJQo2RCsEKBWVOpjA+qst509z0fRgr11MGJFQvZbGmy9jLj+w9/WtuS/mWX6vyFsY29BWGU25VrztPmcwK24/xhg/K6kxG9jEvdNzBlSbLlWMmoyjw145llFyk13jTU4CrDlxwC4c63ABnT6ym49NImsu7oNOSzt4giOYqo8uB4e/9R3iy29BfyPwOuWG7J642G4OHRlsireLMDpVpQQ0OAmmZAq8V2DX9h2+Ea2C5AKPBXLYdqfsXyb5Yi/ut4GlV0LTy8fjS+jLinBU3f9ijXfRlYI1Iwv3kF2CZcYcBUyxlx0ew==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(36840700001)(4326008)(47076005)(83380400001)(2906002)(70206006)(426003)(2616005)(70586007)(44832011)(336012)(81166007)(82740400003)(86362001)(8936002)(8676002)(316002)(54906003)(110136005)(966005)(356005)(478600001)(36860700001)(82310400003)(26005)(5660300002)(1076003)(6666004)(36756003)(186003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 17:38:58.4076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c326747-0305-49af-0df7-08d908da2c0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2771
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, Shashank.Sharma@amd.com,
 Shirish.S@amd.com, hersenxs.wu@amd.com, Vitaly.Prosyak@amd.com,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


## Introduction

We are looking to enable HDR support for a couple of single-plane and multi-plane scenarios. To do this effectively we recommend new interfaces to drm_plane. Below I'll give a bit of background on HDR and why we propose these interfaces.


## Defining a pixel's luminance

Currently the luminance space of pixels in a framebuffer/plane presented to the display is not well defined. It's usually assumed to be in a 2.2 or 2.4 gamma space and has no mapping to an absolute luminance value but is interpreted in relative terms.

Luminance can be measured and described in absolute terms as candela per meter squared, or cd/m2, or nits. Even though a pixel value can be mapped to luminance in a linear fashion to do so without losing a lot of detail requires 16-bpc color depth. The reason for this is that human perception can distinguish roughly between a 0.5-1% luminance delta. A linear representation is suboptimal, wasting precision in the highlights and losing precision in the shadows.

A gamma curve is a decent approximation to a human's perception of luminance, but the PQ (perceptual quantizer) function [1] improves on it. It also defines the luminance values in absolute terms, with the highest value being 10,000 nits and the lowest 0.0005 nits.

Using a content that's defined in PQ space we can approximate the real world in a much better way.

Here are some examples of real-life objects and their approximate luminance values:

| Object            | Luminance in nits |
| ----------------- | ----------------- |
| Sun               | 1.6 million       |
| Fluorescent light | 10,000            |
| Highlights        | 1,000 - sunlight  |
| White Objects     | 250 - 1,000       |
| Typical objects   | 1 - 250           |
| Shadows           | 0.01 - 1          |
| Ultra Blacks      | 0 - 0.0005        |


## Describing the luminance space

**We propose a new drm_plane property to describe the Eletro-Optical Transfer Function (EOTF) with which its framebuffer was composed.** Examples of EOTF are:

| EOTF      | Description                                                               |
| --------- |:------------------------------------------------------------------------- |
| Gamma 2.2 | a simple 2.2 gamma                                                        |
| sRGB      | 2.4 gamma with small initial linear section                               |
| PQ 2084   | SMPTE ST 2084; used for HDR video and allows for up to 10,000 nit support |
| Linear    | Linear relationship between pixel value and luminance value               |


## Mastering Luminances

Now we are able to use the PQ 2084 EOTF to define the luminance of pixels in absolute terms. Unfortunately we're again presented with physical limitations of the display technologies on the market today. Here are a few examples of luminance ranges of displays.

| Display                  | Luminance range in nits |
| ------------------------ | ----------------------- |
| Typical PC display       | 0.3 - 200               |
| Excellent LCD HDTV       | 0.3 - 400               |
| HDR LCD w/ local dimming | 0.05 - 1,500            |

Since no display can currently show the full 0.0005 to 10,000 nits luminance range the display will need to tonemap the HDR content, i.e to fit the content within a display's capabilities. To assist with tonemapping HDR content is usually accompanied with a metadata that describes (among other things) the minimum and maximum mastering luminance, i.e. the maximum and minimum luminance of the display that was used to master the HDR content.

The HDR metadata is currently defined on the drm_connector via the hdr_output_metadata blob property.

It might be useful to define per-plane hdr metadata, as different planes might have been mastered differently.


## SDR Luminance

Since SDR covers a smaller luminance range than HDR, an SDR plane might look dark when blended with HDR content. Since the max HDR luminance can be quite variable (200-1,500 nits on actual displays) it is best to make the SDR maximum luminance value configurable.

**We propose a drm_plane property to specfy the desired maximum luminance of the SDR plane in nits.** This allows us to map the SDR content predictably into HDR's absolute luminance space.


## Let There Be Color

So far we've only talked about luminance, ignoring colors altogether. Just like in the luminance space, traditionally the color space of display outputs has not been well defined. Similar to how an EOTF defines a mapping of pixel data to an absolute luminance value, the color space maps color information for each pixel onto the CIE 1931 chromaticity space. This can be thought of as a mapping to an absolute, real-life, color value.

A color space is defined by its primaries and white point. The primaries and white point are expressed as coordinates in the CIE 1931 color space. Think of the red primary as the reddest red that can be displayed within the color space. Same for green and blue.

Examples of color spaces are:

| Color Space | Description                                |
| ----------- | ------------------------------------------ |
| BT 601      | similar to BT 709                          |
| BT 709      | used by sRGB content; ~53% of BT 2020      |
| DCI-P3      | used by most HDR displays; ~72% of BT 2020 |
| BT 2020     | standard for most HDR content              |

The color space is defined in DRM for YCbCr planes via the color_encoding property of the drm_plane. 

**We propose to add definitions for the RGB variants of the BT color spaces.**


## Color Primaries and White Point

Just like displays can currently not represent the entire 0.0005 - 10,000 nits HDR range of the PQ 2084 EOTF, they are currently not capable of representing the entire BT.2020 color Gamut. For this reason video content will often specify the color primaries and white point used to master the video, in order to allow displays to be able to map the image as best as possible onto the display's gamut.


## Displays and Tonemapping

External displays are able to do their own tone and color mapping, based on the mastering luminance, color primaries, and white space defined in the HDR metadata.

Internal panels (which are currently few and far between) usually don't include the complex HW to do tone and color mapping on their own and will require the display driver to perform appropriate mapping.


## Pixel Formats

The pixel formats, such as ARGB8888, ARGB2101010, P010, or FP16 are unrelated to color space and EOTF definitions. HDR pixels can be formatted in different ways but in order to not lose precision HDR content requires at least 10 bpc precision. For this reason ARGB2101010, P010, and FP16 are the obvious candidates for HDR. ARGB2101010 and P010 have the advantage of requiring only half the bandwidth as FP16, while FP16 has the advantage of enough precision to operate in a linear space, i.e. without EOTF.


## Proposed use-cases

Although the userspace side of this work is still in the early stages it is clear that we will want to support the following two use-cases:

**One XRGB2101010 HDR Plane:** A single, composited plane of HDR content. The use-case is a video player on a desktop with the compositor owning the composition of SDR and HDR content. The content shall be PQ BT.2020 formatted. The drm_connector's hdr_output_metadata shall be set.

**One ARGB8888 SDR Plane + One P010 HDR Plane:** A normal 8bpc desktop plane, with a P010 HDR video plane underlayed. The HDR plane shall be PQ BT.2020 formatted. The desktop plane shall specify an SDR boost value. The drm_connector's hdr_output_metadata shall be set.

**One XRGB8888 SDR Plane - HDR output:** In order to support a smooth transition we recommend an OS that supports HDR output to provide the hdr_output_metadata on the drm_connector to configure the output for HDR, even when the content is only SDR. This will allow for a smooth transition between SDR-only and HDR content. In this use-case the SDR max luminance value should be provided on the drm_plane.

In DCN we will de-PQ or de-Gamma all input in order to blend in linear space. For SDR content we will also apply any desired boost before blending. After blending we will then re-apply the PQ EOTF and do RGB to YCbCr conversion if needed.


## Summary of proposed interface changes

per drm_plane:
- new RGB color space definitions, mirroring the existing YUV color space definitions
- new transfer function property
- new SDR maximum white level property


## References

[1] https://en.wikipedia.org/wiki/High-dynamic-range_video#Perceptual_Quantizer


## Further Reading

https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst
http://downloads.bbc.co.uk/rd/pubs/whp/whp-pdf-files/WHP309.pdf
https://app.spectracal.com/Documents/White%20Papers/HDR_Demystified.pdf


Bhawanpreet Lakha (3):
  drm/color: Add RGB Color encodings
  drm/color: Add Color transfer functions for HDR/SDR
  drm/color: Add sdr boost property

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  4 +-
 drivers/gpu/drm/arm/malidp_planes.c           |  4 +-
 drivers/gpu/drm/armada/armada_overlay.c       |  4 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  8 ++
 drivers/gpu/drm/drm_color_mgmt.c              | 84 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_sprite.c   |  4 +-
 .../drm/i915/display/skl_universal_plane.c    |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  4 +-
 drivers/gpu/drm/omapdrm/omap_plane.c          |  4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  4 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |  6 +-
 include/drm/drm_color_mgmt.h                  | 25 +++++-
 include/drm/drm_plane.h                       | 30 +++++++
 14 files changed, 173 insertions(+), 16 deletions(-)

-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
