Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC35711716
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FE889580;
	Thu, 25 May 2023 19:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1E589580;
 Thu, 25 May 2023 19:18:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nt4QSdrNUne7XTx5g9rAYgPADyMK4szsdyIEhlNdNYMWu5LYCCf/EOeKLuhFE4fTC2s7GI/+DQXyj7jxi90UsZAV3yCGiB9EEEXBbc08GWo55UYLL8OGBKzRfiZWGxI/E8wRrJLcwgfRDOkIhdIYn/my2gqrQx5YCAU7vxyuN6DAvwBC0bDgqpoqzGu24imnUl07XNh+4XReVZJwvsC2kEpAhEpCTMpfzLLxxEdf93Nu8F7kxtMwBmpldtluTc1PapQFtVif2iz2QDo2jNvUqdd/Tc039Z5YAT/PKXcyZZ290STUjctS79slUv20RmcfL2Exoz3e0z2quSTpls16eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Srwy6NxzsChd5/vC/cRVqwYc0rcHqzBdWBPDzhj2PZo=;
 b=jMCLe1VXngfSOljTIcAQX13dEtaDzIbkbSg8j44DGoVGK3Pxo+c82Wb4vXgprNbOLPIrLmX69lRgOGZMYLTgLGajC4fGfHYflh0OfdgCfMb1Da9oqLBoVvBFe+R1VWGDj+JH5C1X+IoVTY0QVAJZe86BNbGFB/O59kEOoaO/+Vynu0CBE5nibo2kuQBRtoEAuLG00DaV8f3tg9vv/D6LyP3BKthJYx5T9MlkaqJsfPpjKPAdDpu2kXchVvTHBU2OU6Rv2aA2ZXP3mG3ZDD1SMyM/E7+qAB05gaDWZXcIsRsIF5JAvBR2/iEuMbt4R9qWTZvx4OPKxQo9HGP5j8bXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Srwy6NxzsChd5/vC/cRVqwYc0rcHqzBdWBPDzhj2PZo=;
 b=nXIRZWEt3dIeDsAumKJDhBV4gMpJ0E4n3VyPwKQleuaPOxZ7a68AzsYX6Kp9+YPYoEUUjaNOnoQUeunzPUSscJIjGEL+dHXNEhGjEKmw9LKQcBCjJg5CX93kbH2uCfmT+nia2ZD/xurpPsf4VFhsMsxPt3zF0MlfwE8DfQWyZzw=
Received: from DM6PR21CA0008.namprd21.prod.outlook.com (2603:10b6:5:174::18)
 by CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 19:18:22 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::ee) by DM6PR21CA0008.outlook.office365.com
 (2603:10b6:5:174::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.7 via Frontend
 Transport; Thu, 25 May 2023 19:18:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 19:18:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:21 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:19 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 00/13] Enable Colorspace connector property in amdgpu
Date: Thu, 25 May 2023 15:17:56 -0400
Message-ID: <20230525191809.3524-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|CO6PR12MB5476:EE_
X-MS-Office365-Filtering-Correlation-Id: 565fa509-1570-488c-1bff-08db5d54ce11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /AMrB/E+81Mm1T5racAxdPO/eDWbRChtZYA85K0jLcQEl9jpTfd48PHHU901/wPKVBe7ZwZV/gSY7iBwPZ7yTLipQtFRinVCyXGx0Ih3VpGIccc1DqFPBLfSKfxrZA8sjbB3o7i4ESdvMLBZy283iZylQH/Y/pV0Ni9O64eMvbNAJCzrIK2JnG2Dk0qpqJMwOWMfbi36KmFsF71S4ZHOlwW/OOf/4+Zn4KHJvPuA0mByVRDFuA17CLFvSLTse/SJdthx+sFXIKoHbHR/1Ok6xphWuOz8SPf02TaxXZNWWmFOLLnaW9/ZEUZ195FxsVl9p/f7uB2V5C+M0d3J2TnlnRDWUoCuf5SGGnW8OPhN549JKKdou5TwwU+JRvGhWUJDRU+BjpBnV6P43RQy2SZ7Wq5nKqy5fGCK8qnvUBTtavHm3jSdU4s6xAMKcLFLTdNr0WCnPVGYUbIiuVg4mmkBZR0rqwBvEsXQKxwsePNVjGbRulKd470NCEr1bXmJZDnIZgy1DOyuXoRTIwwyxjkQQ4YH8j3Ncks18wTeT00cdzeu5CpgK7mbviOOxHz/3sPuBDXD0SeaNetM9SPGveb0arbKtZBCdCWJtoU2Pl9ey4wc61/5OT+gr5Fe5VZplZ2fu5Pz5vAKGPs35Iz6OmxG53QJU3Kq0SZQssidORGz2Oe0wH7m0/9tDNvRGhSSoLV3xnHX2B+9v8iYzpvYMFY+3jm6yPmhky/Ri0w+cJmLb58=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(966005)(40460700003)(6666004)(41300700001)(83380400001)(336012)(66574015)(47076005)(426003)(1076003)(186003)(36860700001)(2906002)(26005)(82310400005)(2616005)(86362001)(40480700001)(81166007)(82740400003)(356005)(5660300002)(8676002)(44832011)(7416002)(8936002)(36756003)(4326008)(70586007)(70206006)(110136005)(54906003)(478600001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:21.8139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 565fa509-1570-488c-1bff-08db5d54ce11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
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

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  84 ++++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  57 ++++++
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  28 +--
 drivers/gpu/drm/drm_atomic.c                  |   1 +
 drivers/gpu/drm/drm_connector.c               | 176 +++++++++++-------
 .../gpu/drm/i915/display/intel_connector.c    |   4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 include/drm/display/drm_dp.h                  |   2 +-
 include/drm/drm_connector.h                   | 121 +++++++++---
 9 files changed, 341 insertions(+), 134 deletions(-)

--
2.40.1

