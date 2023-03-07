Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582526AE40A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9411D10E4EA;
	Tue,  7 Mar 2023 15:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBFD10E4E5;
 Tue,  7 Mar 2023 15:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFPgjhRRcbvsxZL5WnBAib2yIvzEhhF+VMhNZqpH9jM2OBUW3ZlkCfkEHWmLz8vQAo5m4owQ14X5jD7lSaPpDU2Q4uJObpUTiE26RFuMMHhMDIb4Os/8073ID49PXEdY+muI3JZ9I9qNfbiHRCsxeSKaFG+CN/Dccz6ZpQ+8stuYMz+8DAXUZ04MN2dZjejeuToyZcZUPnzojq6liIB3743aXBaV1DllIq86RM4rQH05BHKYkWdlgxIFC84nHiArGivxliwghBRjkfIEHm/TledXOJIPH3nM5VXRGrr7WTnVjxzlRGGrK4wa9WRfsx1lRBTOYxD5pXobNZXFNg37cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeogpEk/d2KU+crAhYUnduHPODZurQfoU4/59fYWwYM=;
 b=BfduA2cFEg802SSqEMlm4QjK3hoKd6sc5KAYyyPB7CidASdi4WDmVyZZZAoTCMl6zLeWzCp5tAlJEX+Lxi7teMa2BzbRh1tCJfXz7GZA/I9UxdGHAThT8GdA9n/w8o0Eb6XJFexfGTk542udxVpe0GZrdC3kZNZCY8HYkpM3M8dvCRd/jijq/mQ/OovWXQHPaGTxOtwpSLffgeZsvP53SP/2jxO5zMkueB6dGMozpvC4UxcOijVvTHmUpezkaRo67bO9SjloeQ3ZkuvdnmhK8IfsCI/Xm50FnVTZtATFYkC/1jHIGvlZWe1N2P2B6YMpHjsVr5juebnNExqT+kcPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeogpEk/d2KU+crAhYUnduHPODZurQfoU4/59fYWwYM=;
 b=q+uENXMqp+k3bpk65FiKuzrw7EU+dq8+KUjZ2HQNtIEdoE0ew7ktUHl/yd2NcHHmqhSUtu0aeyaieLbHDGr1hBg0l9/Rp3osI0CLEgs9JY9DEzbyIePbbKrYUSM1yqJ8zKBAMG/aEKqy4ZrUfXYiUUamu+xDaxUBrVt+VbqCiMc=
Received: from DM5PR07CA0061.namprd07.prod.outlook.com (2603:10b6:4:ad::26) by
 MN2PR12MB4471.namprd12.prod.outlook.com (2603:10b6:208:26f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:11:15 +0000
Received: from DS1PEPF0000E631.namprd02.prod.outlook.com
 (2603:10b6:4:ad:cafe::cc) by DM5PR07CA0061.outlook.office365.com
 (2603:10b6:4:ad::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E631.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:11:15 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:14 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 07:11:14 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:13 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 00/17] Enable Colorspace connector property in amdgpu
Date: Tue, 7 Mar 2023 10:10:50 -0500
Message-ID: <20230307151107.49649-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E631:EE_|MN2PR12MB4471:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9d73cb-ead4-483f-a3fb-08db1f1e3209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yJflTJPas7SSkp82vgPe2yQnDiQX0/fiK+r3crdcH738GcXyL9M3GEhL/2S+KC5IVb6pYfoNttDJVOHzJVOePTA7svWi+0dYZvGiSMN3FYSkqGIYP+v5Esma/CbUEdUWvewO1RggJOFUU+lJ5yzahvxKlhk2KZ+lBGIFuxAzmArWVrJfniJRAh/GVyDVz8ADqxce7omNN9NtBWlz51tlMtsjxp6dboPXBQXlH7WAXHg7/2XhL+2zp08yeI93EWNbr1xMxWrKnebKEQe3n3MPKvamFQyIfj8jp2YJPgNoT96P5Ig8Z7XXjRQWuIV/LBwOkUTbAIC4KoZTc4fs8YBE1jTruAGQbGyaWF7fN7T/5dVHTf8Uld6gu11gfklGR8M99h63oLhYMI4kqtD/mYKfRok1i/BYD/OTNc3NUUkOhZ+SMoP6AF/7h08Op64PxBSciyu39fde8YLLFKzeXZTw83s5bIheeqSYh/3AcYyTvL1axoIdqI8Y9AHtJxzgdF9JGsujapOdRiacTqxPpoE0LQWJQPKcEMpRQiLmjy75mJTRF880eLv6RZmy+2pBAvAZEnnorgJMZga0Fg1cyZNWKCAkxiYxC+UvMfG6rz157oLE/7+IqHOgM1hosFm99uwe1h2HwNxOwNc3Y4oR8SaM+Dy0UfmzIqSgRWJZzOemKBCEfdtBOzFLzazDhP5GUGrn
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(36840700001)(40470700004)(46966006)(44832011)(83380400001)(70586007)(8676002)(4326008)(70206006)(86362001)(82310400005)(426003)(81166007)(40480700001)(2616005)(336012)(356005)(186003)(36860700001)(82740400003)(26005)(36756003)(110136005)(6666004)(966005)(1076003)(478600001)(66574015)(47076005)(40460700003)(316002)(54906003)(5660300002)(2906002)(8936002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:15.1092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9d73cb-ead4-483f-a3fb-08db1f1e3209
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E631.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4471
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
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is based on Joshua's previous patchset [1], as well
as my previous patchset [2].

It is
- enabling support for the colorspace property in amdgpu, as well as
- allowing drivers to specify the supported set of colorspaces, and
- deprecating the BT2020_YCC and BT2020_RGB properties in favor of
  a common BT2020 property. We leave the BT2020_CYCC property untouched
  for now, same as the other _YVV properties. If they'll see use later
  we might need to do something similar there, or allow userspace to
  decide on the output encoding (RGB vs YUV).

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
patchset.

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

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Michel Dänzer <michel.daenzer@mailbox.org>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org

Harry Wentland (12):
  drm/connector: Convert DRM_MODE_COLORIMETRY to enum
  drm/connector: Pull out common create_colorspace_property code
  drm/connector: Use common colorspace_names array
  drm/connector: Print connector colorspace in state debugfs
  drm/connector: Allow drivers to pass list of supported colorspaces
  drm/amd/display: Always pass connector_state to stream validation
  drm/amd/display: Register Colorspace property for DP and HDMI
  drm/amd/display: Signal mode_changed if colorspace changed
  drm/amd/display: Send correct DP colorspace infopacket
  drm/amd/display: Add support for explicit BT601_YCC
  drm/amd/display: Add debugfs for testing output colorspace
  drm/amd/display: Add default case for output_color_space switch

Joshua Ashton (5):
  drm/connector: Add enum documentation to drm_colorspace
  drm/connector: Deprecate split for BT.2020 in drm_colorspace enum
  drm/amd/display: Always set crtcinfo from create_stream_for_sink
  drm/amd/display: Fallback to 2020_YCBCR if the pixel encoding is not
    RGB
  drm/amd/display: Refactor avi_info_frame colorimetry determination

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  84 +++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  57 ++++++
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  28 +--
 drivers/gpu/drm/display/drm_hdmi_helper.c     |   7 +-
 drivers/gpu/drm/drm_atomic.c                  |   1 +
 drivers/gpu/drm/drm_connector.c               | 182 +++++++++++-------
 .../gpu/drm/i915/display/intel_connector.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  14 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 include/drm/display/drm_dp.h                  |   2 +-
 include/drm/drm_connector.h                   | 128 +++++++++---
 11 files changed, 363 insertions(+), 146 deletions(-)

--
2.39.2

