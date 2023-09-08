Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D99D79896F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C70C10E8E5;
	Fri,  8 Sep 2023 15:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5AF10E8E5;
 Fri,  8 Sep 2023 15:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8CzEcLSELibZNtrE7Wr/K9wDh/l5P3oPqUGuhaGMvqEoDkt3HGGhMhrVBfv9E5cH4gYZJoROL+BaikhoRvhYSXCNem3k4j/j8Dm9ktAtLPhNZYvygHAnnIYhJ0mIRNlpU46Pp/HRW4aKOkfsgsb+dsuL8uQPZvCE50b0Vi6X/zFMslAyqpndnjSGMrYB5tIDozY4Z9LKXNAMCx5qrQJ6yUSQWR7L8RgcWvLXyGSH0/1BlFE+CeRKevLe11SdGKeofIHrq+qu8W8K4THhThPT3uuqOQEnyApicf411+lcrd5qDc+p7HL6rjypjzLMHNmSfjyTTEZJJONUcEB89nr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teTYHd6i8D0eQGF99lhu8PRCQklWf0r144LGAKI6dEI=;
 b=VwaCFMXcaH5FM08hic94l+4rvaL2eVrXcsOolt9aLDS8pshyNQGICoLaMZmrqN6e3ISNU5f8GjBKyMTZDH1d/Ba2v50yasdD6+q0TN8Dd1Y2J5o7BjCCCeGE7+442K/BgLZcvzB6kNiZWfuGo16NOKYeJB07V9LxNLyHkr5kOAl8fcVtA1kuRtN0F6klY1JpG8xygwDITqpvBjByYF1e/vdPUmmcztxDY7a7pYBVldAF7WWnpqzSRy3Er842ZavfTqhHg658rrrsp6hKhAYoaK2C2UncLjR3c7CURfRYf4IC/SqLsvwo18EQ3hcausymdPCtWJlhQ/41EtSUB8hHHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teTYHd6i8D0eQGF99lhu8PRCQklWf0r144LGAKI6dEI=;
 b=tG8D0sdVhq+y4OgWCoYyVuWSDg2NB6HIiwmVYmIKihEUbQkcGzKyRqFRO/K0oXb8DGkGDIGkVG7uaQ7zkfTdGoZyiMitF94hBvPwCJlRSCRdU2D9UDU+jlLQh72xATNFTakymBtgDxi2uptUQmKpWZMelFOihNsWIQWFKeSdwmo=
Received: from MW4P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::19)
 by PH7PR12MB5758.namprd12.prod.outlook.com (2603:10b6:510:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 15:02:43 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::8a) by MW4P221CA0014.outlook.office365.com
 (2603:10b6:303:8b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Fri, 8 Sep 2023 15:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 15:02:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:42 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 10:02:41 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 00/10] Color Pipeline API w/ VKMS
Date: Fri, 8 Sep 2023 11:02:25 -0400
Message-ID: <20230908150235.75918-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|PH7PR12MB5758:EE_
X-MS-Office365-Filtering-Correlation-Id: 0706d9af-3cc6-4fe7-8b38-08dbb07ca77c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+8AgMcnkMLeQvPRflLSpDQhUTrSLj3+jVqJmZnKj436haRnGcQ9Fbk0NYLs7+Hitwv/SQnQU5mL3RJ+LYdbWlmAnk/zHdxNTXDcDrrSX0ZeHJvFuXuV1KBzyoSi2PrrvMpU4NQObgjp+uU9fXLAkYlvOo5lpu55miRu+GxLUd7tKNnEAPN1Nw3TEmKKHpR5RfsOuVtkmTEixcIJ7gTHbuk6jxXNfJOE9pCMzWH9v2LgnuM77YapUcHgS29irog2grIgAmzm/ngmPQg45VyHxHaLgKbuXWIp5r8b5ZK5WImqmUvhK4tBjE+xzrUSwlJqIAmeT8y3kbrJvfj7BnGoNrW+JuFUdY9QLxM3LJSDXh2QpMfDJlBu/F1SfUUouJ49bWHmg6Ixv9/H2GgNesMn+gbzjTsLOg+jBSyOhtWOL/wN3CjOSYPQDckM63QqhXHZhu2DyUli+7CL6IcNF6wcFccuNgtO64G5XsobZW+l7dYPr2vomWHh4BnHAuNy0lUzuIofSmfqQx6BRXfJmFOwjdMywoqmleFImzAaX9hwfxzvjbDhehIrkK4buH72EKXYVDNTdYc6sWGN8hD46ze4K6HIQOgmbgnP6GIJMnpjPKCF7AWJb5/wf/7m2AjXsJgXM35UYvgjMbXEZgF49saeuQDubDphk9Zgf7ibb5rDXQo+Y98ErVe232z0iBOsnHWwvwFtetSEb+bB2IiRUEg3U/nGS3qFEjq6ADdHCklqBy8X5O2izhWN/MUhLma6jr8UK4RHV3P1Ezd5YvIV9Pa6nuO/XhG4oCjv0Z+QqGcbr4iubVucDTXvzCbs1hFg5FR8
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199024)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(6916009)(7416002)(966005)(41300700001)(43170500006)(36860700001)(5660300002)(86362001)(44832011)(6666004)(478600001)(2906002)(316002)(8936002)(4326008)(8676002)(54906003)(70206006)(70586007)(26005)(1076003)(81166007)(7696005)(2616005)(40460700003)(356005)(336012)(66574015)(426003)(36756003)(82740400003)(47076005)(40480700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 15:02:43.3885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0706d9af-3cc6-4fe7-8b38-08dbb07ca77c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5758
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an early RFC set for a color pipeline API, along with a
sample implementation in VKMS. All the key API bits are here, but
I would like to show a larger variety of colorop types, as well
as examples of different possible color pipelines for a given plane.

The first patch is a doc patch that will explain the motivation
and reasoning behind this approach and give an overview over the
API.

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
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>

Harry Wentland (10):
  drm/doc/rfc: Describe why prescriptive color pipeline is needed
  drm/colorop: Introduce new drm_colorop mode object
  drm/colorop: Add TYPE property
  drm/color: Add 1D Curve subtype
  drm/colorop: Add BYPASS property
  drm/colorop: Add NEXT property
  drm/colorop: Add atomic state print for drm_colorop
  drm/colorop: Add new IOCTLs to retrieve drm_colorop objects
  drm/plane: Add COLOR PIPELINE property
  drm/vkms: Add enumerated 1D curve colorop

 Documentation/gpu/rfc/color_pipeline.rst  | 278 ++++++++++++++++++
 drivers/gpu/drm/Makefile                  |   1 +
 drivers/gpu/drm/drm_atomic.c              | 154 ++++++++++
 drivers/gpu/drm/drm_atomic_helper.c       |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c         | 110 +++++++
 drivers/gpu/drm/drm_colorop.c             | 343 ++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h       |   4 +
 drivers/gpu/drm/drm_ioctl.c               |   5 +
 drivers/gpu/drm/drm_mode_config.c         |   7 +
 drivers/gpu/drm/drm_plane_helper.c        |   2 +-
 drivers/gpu/drm/vkms/Makefile             |   3 +-
 drivers/gpu/drm/vkms/vkms_colorop.c       | 108 +++++++
 drivers/gpu/drm/vkms/vkms_composer.c      | 316 ++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h           |   4 +
 drivers/gpu/drm/vkms/vkms_plane.c         |   2 +
 include/drm/drm_atomic.h                  |  82 ++++++
 include/drm/drm_atomic_uapi.h             |   3 +
 include/drm/drm_colorop.h                 | 233 +++++++++++++++
 include/drm/drm_mode_config.h             |  18 ++
 include/drm/drm_plane.h                   |  10 +
 include/uapi/drm/drm.h                    |   3 +
 include/uapi/drm/drm_mode.h               |  22 ++
 23 files changed, 1723 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 include/drm/drm_colorop.h

--
2.42.0

