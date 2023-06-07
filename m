Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1644672646D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD5B10E16B;
	Wed,  7 Jun 2023 15:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2086.outbound.protection.outlook.com [40.107.95.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A09410E16B;
 Wed,  7 Jun 2023 15:26:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWUgaa6yynDwTwnjKyrm2plTLX7A6XgcTK+OiEGLkQGAEUjZWltToOEyuVV0xd/SLgf0kYKG+FK2a4EnDJE7cwyZywk/P+uHpvLRxEw8tcflutl6qoGjZHNLOgvL+0rfRREW6lrdKVZZd+jTPmmpkxE5Yb4PFi8DW9MUiFLDQhVvxiRinQNXWG7vAz1WPomSAZ27nr8Ml3kSCD3weYd33h5/uLm9NwpGbQ4JSiZY+bv95TfvC2CKbtsFE156n3jUCYYXqMq5PDanGDVMP4j5KdQptEeSM3UxLwuxECzGJ3gmBcq+bMi2Z4Vm2zB9XdGa9VcskNQWwaxwwcfmNb3uEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eP3qv0wvgTVZJPOvkXJC+775JgrEd3fJB+Ny+soksM4=;
 b=PDl1hrBxw8BhaDMfIQpA5cPJN7Uqe8m0ExPbdIufdWlW3kxk9Y4iPxAWbyq0H0MBAGmhZ/5uG/osP/q94frzno7Q+T7uaNVAVvetL951ueXvInWKSfao12JdPBOpZDEkIhHBkQ4oNp+gyXAcEDnex6j/G/weumaFazi3evCIGuVOXNyjYSaLQ0NusbWd9Bh1Fx1WAL6yJmVj6MSp0CuoVM/HVQG3xKFD/cH19GxdRGHkU+MW48ZxANz5upbveOUqu9qhD6ed2OkjwZCEWUpvX9r5bAOnIS5Q+zRtmDttCIpq6hiEWNAazqSpDA+isHFARoDxOHcQU1uV6I5Fs+f3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eP3qv0wvgTVZJPOvkXJC+775JgrEd3fJB+Ny+soksM4=;
 b=mNpeuKX6uvksTTfTVtVbdD3fOkek8GT+BE5KpXi633T4C4jdTaZSWCrdbQGO3QAknPesFOUGFrlkSCnOSf7VpgI303e/jRkBDrcHJtY84l/cvh723zIFBdFAC17adfFVRxOfRXbF1TFF6Fsj8YB96xtIPd0XwS5rGDqR/T1SqbY=
Received: from DS7PR03CA0335.namprd03.prod.outlook.com (2603:10b6:8:55::34) by
 SJ0PR12MB5486.namprd12.prod.outlook.com (2603:10b6:a03:3bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 15:26:21 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:8:55:cafe::2) by DS7PR03CA0335.outlook.office365.com
 (2603:10b6:8:55::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Wed, 7 Jun 2023 15:26:20 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 08:26:19 -0700
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:18 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 00/13] Enable Colorspace connector property in amdgpu
Date: Wed, 7 Jun 2023 11:26:04 -0400
Message-ID: <20230607152617.997573-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SJ0PR12MB5486:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ead7dbf-cf2d-4c8c-4dea-08db676b8bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5c51CgzI4XgCYsmqi/uhSZ21eDyHM7LC66AUZkC5z1ykvuGZAPsf8wo4idzHv6HR0s+U78682K+0FMLZNCv3Rmj39QcqQQXCNBuGwlN7N932/WL6+3iHcRhMZSSEgiXpDm5gmti+qugZ9eOxa3QMrwsWzm5ZUrue5bDLXBhk6NB6PEr3V+iiPaPLNF7y0cdFW1lFJLfS6aCKkJyD+/qDMMGjHJsVUhN7OltzRfFSOA30zYE4ei8kKy3MvHjS/MTPxDLYykcQtsPzLGqx8yCZ3RBRF/75Mh38NkvYj+A2KjZ83jO2ENUaHMFSY7JbWj/TlKRiTOWwI0vhCcilEajkLA4sZivN9AyKDQu/yDqnNHIN3kp0n3XDa70SYAIruZBag688OmSCUmtT2VGqruMKyURXYWAsvN5x/jZakTUrJPFfU0lIrakmbo/S/0Uewadr1Feqj5tAaSJDNzyDBKdX8iwY1pN48WdrVTLtIaEoM+aYAnYH8d0AuAOjiZVS0owSE4WzLoTux6joDdApitYi1/byi+F+AQArUbAO/qFHVspWy9Qs7UgMv06h2zP2zcsl2XA1QFslNVe5p2C75xH+MuDFq1sB7fGrqYLj8+dVBTeoW5pHjry+rL8IgJ6scAJoGXMCiWNGEXFx8hOO/yBt5efUPH8OTsE28dvHaPYuiL1KoTy5B8rAs0rNvp2L1tTn8rPqgyLSgLbmCw2AKEm5XJyoNMKgFFejDm6wUiQQXlM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(82310400005)(966005)(6666004)(26005)(47076005)(83380400001)(66574015)(426003)(336012)(40480700001)(36860700001)(1076003)(2616005)(186003)(86362001)(36756003)(82740400003)(81166007)(356005)(7416002)(44832011)(54906003)(110136005)(5660300002)(316002)(41300700001)(8936002)(4326008)(70586007)(478600001)(70206006)(8676002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:20.6244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ead7dbf-cf2d-4c8c-4dea-08db676b8bc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5486
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
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Melissa Wen <mwen@igalia.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is based on Joshua's previous patchset [1], as well
as my previous patchset [2].

It is
- enabling support for the colorspace property in amdgpu, as well as
- allowing drivers to specify the supported set of colorspaces, and

Colorspace, Infoframes, and YCbCr matrix
---------------------------------------

Even though the initial intent of the colorspace property was to set the
colorspace field in the respective HDMI AVI and DP SDP infoframes that
is not sufficient in all scenarios. For DP the colorspace information
also affects the MSA (main stream attribute) packet. For YUV output the
colorspace affects the RGB-to-YCbCr conversion matrix. The colorspace
field of the infopackets also depends on the encoding used, which is
something that is decided by the driver and not known to userspace.

For these reasons a driver will need to be able to select the supported
colorspaces at property creation.

Note: There seems to be an understanding that the colorspace property
should ONLY modify the infoframe. While this is current behavior and
sufficient in some cases it is nowhere specified that this should be the
only use of this property. As outlined above this limitation is not
going to work in all cases.

This patchset does not affect current behavior for the drivers that
implement this property: i915 and vc4.

In the future we might want to give userspace control over the encoding
format on the wire, in particular to avoid use of YUV420 when image
fidelity is important. This work would likely go hand in hand with a
min_bpc property and wouldn't conflict with the work done in this
patchset. I would expect this future work to tag along with a drm_crtc
or drm_connector's Color Pipeline, similar to the one propsed for
drm_plane [3].

Colorspace on crtc or connector?
--------------------------------

There have been suggestions of programming 'colorspace' on the drm_crtc
but I don't think the crtc is the right place for this property. The
drm_plane and drm_crtc will be used to offload color processing that
would normally be done via the GFX or other pipelines. The drm_connector
controls the signalling with the display and ensures the wire format is
appropriate for the encoding by programming the RGB-to-YCbCr matrix.

[1] https://patchwork.freedesktop.org/series/113632/
[2] https://patchwork.freedesktop.org/series/111865/
[3] https://lists.freedesktop.org/archives/dri-devel/2023-May/403173.html

v2:
- Tested with DP and HDMI analyzers
- Confirmed driver will fallback to lower bpc when needed
- Dropped hunk to set HDMI AVI infoframe as it was a no-op
- Fixed BT.2020 YCbCr colorimetry (JoshuaAshton)
- Simplify initialization of supported colorspaces (Jani)
- Fix kerneldoc (kernel test robot)

v3:
- Added documentation for colorspaces (Pekka, Joshua)
- Split 'Allow drivers to pass list of supported colorspaces' patch
  to pull out code to create common colorspace array and keep it separate
  from change to create only supported colorspaces

v4:
- Don't "deprecate" existing enum values
- Fixes based on review comments throughout
- Dropped Josh's RBs

v5:
- Add documentation that drivers are free to pick appropriate
  RGB or YCC variant

v6:
- Remove magic when drivers pass '0' as supported_colorspaces
  to indicate default support for all DP/HDMI colorspaces

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Michel Dänzer <michel.daenzer@mailbox.org>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org

Harry Wentland (10):
  drm/connector: Convert DRM_MODE_COLORIMETRY to enum
  drm/connector: Pull out common create_colorspace_property code
  drm/connector: Use common colorspace_names array
  drm/connector: Print connector colorspace in state debugfs
  drm/connector: Allow drivers to pass list of supported colorspaces
  drm/amd/display: Always pass connector_state to stream validation
  drm/amd/display: Register Colorspace property for DP and HDMI
  drm/amd/display: Signal mode_changed if colorspace changed
  drm/amd/display: Send correct DP colorspace infopacket
  drm/amd/display: Add debugfs for testing output colorspace

Joshua Ashton (3):
  drm/connector: Add enum documentation to drm_colorspace
  drm/amd/display: Always set crtcinfo from create_stream_for_sink
  drm/amd/display: Refactor avi_info_frame colorimetry determination

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  84 +++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  57 ++++++
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  28 ++-
 drivers/gpu/drm/drm_atomic.c                  |   1 +
 drivers/gpu/drm/drm_connector.c               | 189 +++++++++++-------
 .../gpu/drm/i915/display/intel_connector.c    |   4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 include/drm/display/drm_dp.h                  |   2 +-
 include/drm/drm_connector.h                   | 129 +++++++++---
 9 files changed, 363 insertions(+), 133 deletions(-)

--
2.41.0

