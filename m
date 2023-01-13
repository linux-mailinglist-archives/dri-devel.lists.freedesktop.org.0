Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED18669DAB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057D110EA2A;
	Fri, 13 Jan 2023 16:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FE210EA2A;
 Fri, 13 Jan 2023 16:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gb3Lox6GoL7PmvYVKGilpRqOTBEUIq5ox0crr2mA+WbQExmwGNgZSbpnBS6sNMQnR1yHZNn5LCahdOKbEpsg53oBU3ycqCgvN4F3QryXiskGCbqeCfY2bF/16Dc1RwyilsFGRukvLswPOoRiKvUE6vLjSxydJL0/20sG/r9a1X49tgpqjSWYELQ6JxqnXIuQz+87N/2blrZ/muKliqS3GAhXk12N/BcutMKkHO1m7vGqdXD4snhegdYZKPXu+a0tghJDHRby3ND4ZAKgBZJShOOmjPempz4QhvmKYUVJ0GMSuXnPXeGImVj08ZuDIpwDNz29ERSrmTFJmSY1kKIi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K666UetEuyieZ2cYMz8pLJabH2l24JacTvVCUpEUgz8=;
 b=SVGNVJ25XkjqWoh7cum28hSWu21VvQvy3yL/zqRIfgBOQ/Dv4k7+ZNSIUkXK+i/FRGPkdFxa32lhDKMg5tO1txSbu47ERz9kxbFQh1isZraRSH/ypILbQ1rGZXFNMPJ3EA53OGJbP3ex9J+8KIjfdK9IusqD23+mHB1xBrLQfqM9onjRBZgcIwsh/SXWqdHEzOduqKsDuyT4nHR+3597li/voNu4KCcrBRxaTIY6FXEN/IlNWE3OdTUCez2PnPp1QNI8XJzqlPyDmfhEtpK85Msb+xm8m/wbQXQwkFw7eUpb4YwpYowobuaHxZvg3w/wJPHMP2bFHNFisokZTcKeWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K666UetEuyieZ2cYMz8pLJabH2l24JacTvVCUpEUgz8=;
 b=iohie4bQF6N1CCZDcSlzdw4SGxcsy2cw3EbdGw7AV7YMEeE6A1gn2KTAAhhRofcQmTGUlNPdeyLsjJdYkWxDO0lNO+iOCnO2XA+plHK+mc1ZI9FwXUoi6Cm4SR2yZw6jBONBj28LDuvMWQkjeYA55Ojr07Uw/yo9kA3INLzaBnk=
Received: from CY5PR19CA0070.namprd19.prod.outlook.com (2603:10b6:930:69::16)
 by LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:24:50 +0000
Received: from CY4PEPF0000C966.namprd02.prod.outlook.com
 (2603:10b6:930:69:cafe::35) by CY5PR19CA0070.outlook.office365.com
 (2603:10b6:930:69::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Fri, 13 Jan 2023 16:24:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C966.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:24:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:49 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:48 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 00/21] Enable Colorspace connector property in amdgpu
Date: Fri, 13 Jan 2023 11:24:07 -0500
Message-ID: <20230113162428.33874-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C966:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a75b860-6fdf-4a68-9845-08daf582b1aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CrKp3pIs+CEoKtCAQk4W4cPJcmDowbjNt/dVy82BIynaML9t8uaIyHtdiLif9dN/GUOV5i76oxn8YrG8erNhQ9MAHTLBjiZq0EL/KPjSFrUPAuwJGq6hSkYfBV0ocvFTPG5jpri3aJ4UpKWIxe5pEjoOr5cHHK1OwLJrqkNZuokCX9zB6K/kws89RNVLVAf0g1BkCvPWl3wmxYCl0V+EOvXjuS+WUSrgRxruSMlZQb9bLRLuWF9hQeK1By/wGqztNTREq/KmaEUKQ8W+CDqTgQzyCCz4/riG3cMEx0iaHwgFUipuQoKExTXVcnzt/g5UZuewcdjOyIBT0dlZo5U2zAGoIKZDCtAH09Xd9FFiJvnFCFYLoJOqxUgJGlUJ5gvTdP7tH+OLKCY5aERor6gYNNREIY5bQcTmJcE7OLxGvxOkQvyZ9rcRgqLJAhiACKtOHtYL2jEm9tofvoywtd8sMCFpd+lfrheAh2fHEPl4Qz6+n7GD5NJJzX4hL1i26uACevD68ekhqSC7JO3edYIkhiD1ECivs/nzwiD4p3VfM913R8sSWla8M00qI8f5X/XYIEnwOfdHFhq2QXmDSxLr0OdK6QkNCMtJs/C/BA1FuRrw2BMcJgENXYTZmXgLnufITKnjeTcqtyU0qZVtOjllQv7MJADMFnXmzTCZnVJbIhGdVhzzpIhhDVk+LeIZnnxV
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(47076005)(40480700001)(66574015)(26005)(6666004)(186003)(336012)(2616005)(4326008)(7696005)(70206006)(316002)(1076003)(478600001)(70586007)(54906003)(966005)(110136005)(426003)(36860700001)(81166007)(356005)(82740400003)(86362001)(40460700003)(83380400001)(82310400005)(41300700001)(8676002)(66899015)(36756003)(5660300002)(2906002)(8936002)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:24:50.0553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a75b860-6fdf-4a68-9845-08daf582b1aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C966.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727
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

This patchset enables the DP and HDMI infoframe properties
in amdgpu.

The first two patches are not completely related to the rest. The
first patch allows for HDR_OUTPUT_METADATA with EOTFs that are
unknown in the kernel.

The second one prints a connector's max_bpc as part of the atomic
state debugfs print.

The following patches rework the connector colorspace code to
1) allow for easy printing of the colorspace in the drm_atomic
   state debugfs, and
2) allow drivers to specify the supported colorspaces on a
   connector.

The rest of the patches deal with the Colorspace enablement
in amdgpu.

Why do drivers need to specify supported colorspaces? The amdgpu
driver needs support for RGB-to-YCbCr conversion when we drive
the display in YCbCr. This is currently not implemented for all
colorspaces.

Since the Colorspace property didn't have an IGT test I added
one to kms_hdr. The relevant patchset can be found on the IGT
mailing list or on
https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/hdr-colorimetry

We tested v1 of the patchset and confirmed that the infoframes
are as expected for both DP and HDMI when running the IGT
colorimetry tests.

Open Items
----------

A couple comments from Pekka about colorspace documentation are
left unaddressed. I hope they won't block merging this set but
should still be addressed separately.

Pekka's questions really got me thinking of how this colorspace
property should be used and working with it more closely with
Joshua who is enabling HDR in gamescope made me wonder even more.

Uma, is there a (canonical, upstream) userspace that uses this
property that I can look at to understand more?

One of the key challenges that is currently not addressed is that
userspace is expected to pick a colorspace format straight from the
list of definitions out of the DP or HDMI spec. But the kernel
driver are the ones deciding on the output encoding (RGB, YCBCR444,
YCBCR420, etc.). So there is no way for userspace to decide correctly
between, for example, BT2020_RGB, BT2020_CYCC, BT2020_YCC.

So we end up in a scenario where gamescope sets BT2020_RGB but we
output YCBCR444 so have to correct the colorspace value to
BT2020_YCC. This in turn breaks the colorspace IGT tests I
wrote. I don't think "fixing" the IGT tests to accept this is
the right thing to do.

The way it stands this patchset allows us to specify the output
colorspace on amdgpu and we try to do the right thing, but I don't
thing the way the colorspace property is defined is right. We're trying
to expose things to userspace that should be under driver control. A
much better approach would be to give userspace options for colorspace
that are not tied to DP or HDMI specs, i.e., sRGB, BT709, BT2020, etc.,
and have the driver do the right thing to fill the infoframe, e.g., by
picking BT2020_YCC if the requested colorspace is BT2020 and the
is YCBCR444.

If no upstream userspace currently makes use of this property I
can make that change, i.e., no longer tie the colorspace property
directly to the infoframe and reduce the options to sRGB, BT709,
BT601, and BT2020 (and possibly opRGB).

v2:
- Tested with DP and HDMI analyzers
- Confirmed driver will fallback to lower bpc when needed
- Dropped hunk to set HDMI AVI infoframe as it was a no-op
- Fixed BT.2020 YCbCr colorimetry (JoshuaAshton)
- Simplify initialization of supported colorspaces (Jani)
- Fix kerneldoc (kernel test robot)

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

Harry Wentland (16):
  drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
  drm/connector: print max_requested_bpc in state debugfs
  drm/connector: Drop COLORIMETRY_NO_DATA
  drm/connector: Convert DRM_MODE_COLORIMETRY to enum
  drm/connector: Pull out common create_colorspace_property code
  drm/connector: Allow drivers to pass list of supported colorspaces
  drm/connector: Print connector colorspace in state debugfs
  drm/amd/display: Always pass connector_state to stream validation
  drm/amd/display: Register Colorspace property for DP and HDMI
  drm/amd/display: Signal mode_changed if colorspace changed
  drm/amd/display: Send correct DP colorspace infopacket
  drm/amd/display: Add support for explicit BT601_YCC
  drm/amd/display: Add debugfs for testing output colorspace
  drm/amd/display: Add default case for output_color_space switch
  drm/amd/display: Don't restrict bpc to 8 bpc
  drm/amd/display: Format input and output CSC matrix

Joshua Ashton (5):
  drm/amd/display: Always set crtcinfo from create_stream_for_sink
  drm/amd/display: Fallback to 2020_YCBCR if the pixel encoding is not
    RGB
  drm/amd/display: Refactor avi_info_frame colorimetry determination
  drm/amd/display: Calculate output_color_space after pixel encoding
    adjustment
  drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  90 ++++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  57 ++++++
 .../drm/amd/display/dc/core/dc_hw_sequencer.c |  38 ++--
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  28 ++-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  54 +++--
 drivers/gpu/drm/display/drm_hdmi_helper.c     |   8 +-
 drivers/gpu/drm/drm_atomic.c                  |   2 +
 drivers/gpu/drm/drm_connector.c               | 189 ++++++++++--------
 .../gpu/drm/i915/display/intel_connector.c    |   4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 include/drm/display/drm_dp.h                  |   2 +-
 include/drm/drm_connector.h                   |  57 +++---
 12 files changed, 345 insertions(+), 186 deletions(-)

--
2.39.0

