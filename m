Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6244E724DFB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB7310E3AE;
	Tue,  6 Jun 2023 20:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754D610E3AC;
 Tue,  6 Jun 2023 20:26:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqeC4HCHlm2dKuCSsNg815+s+Ye9CwH7DYLm8T4l00VAtQ9O7D1Xqy46rHqpkGojMO3SCrEPnwO8C8eOuORumhdRjmFz/ekzrOzGfkojtD6l1OqG+0BhoE2JXa89mRn4W6ppaJvGFE7fcW3Yt6Q4XQNgFpDglCXoB02nSkOR6MujI8vY2tprPdJYrA2T+bLJYZFWpLrkSh3WCuT/yPN5E9OXma63VyDElOCQGd+KWwS6RWLaqzPS6vgpt/D8e4Kwf6rEi4ReDNcOIILlhfHzYRf1UyC0pIxtP3yeJhBJ+Z93Dm7EwHGcy3tVHYHdtk0GPVGjUmKVPqxJPB8wXlTKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRrqHbLKNETvgxGrGjssdPg67GoUEHmerlCBYu7bQdc=;
 b=lNI6rZt1d2mR8ZHfW9cSGKYOGVkQDjU2AUAFgxbFsrf5kl6IYVlB/SWKwctfz68bmOltPZlyJaad1Hnrlq2XOAHFGsvKmwYCQVGFrsWE6Zi5Vwdg7CMR9iuyDvxR24lOtkRM1bo4aiq5Juwaj4UdTc2JgKblGimRdPLOJWmKXOnF2OKJENguyYq1uj2XV3vSFaYrwtnv8nEw/HxjgOLrTQUBECBaCpQt6o9Ztz/zqQtw+7RzLCg4DbWM7KUn76IlVk8GcK1Of/WJOpb5cld9RgOb6zZC4CcK0xjS2cfRLLWixxznOvIkO+x+IiivEfHQpnSHqTZecMQghoK6K1c3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRrqHbLKNETvgxGrGjssdPg67GoUEHmerlCBYu7bQdc=;
 b=l/ThiKt/dRZgWk9PgaRNAHj1JNA+6Dxc2YQIlQyioKgFDwQHsIAyBR47m6vdYsOhH8lcvOYayl/CFRPd0ZuUEG0ii3MgElSYf4ye1kM8F+b1hKlUqNt5ZOzd3PVPDuPuEvRD1u6d6qDVe1xA2JGdUmeTO96SX4Wm63PmOohCNMA=
Received: from BN0PR02CA0050.namprd02.prod.outlook.com (2603:10b6:408:e5::25)
 by DS7PR12MB6166.namprd12.prod.outlook.com (2603:10b6:8:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 20:26:11 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::e8) by BN0PR02CA0050.outlook.office365.com
 (2603:10b6:408:e5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:10 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:09 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 00/13] Enable Colorspace connector property in amdgpu
Date: Tue, 6 Jun 2023 16:25:54 -0400
Message-ID: <20230606202607.122914-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT062:EE_|DS7PR12MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: f1db0ea1-2643-4a82-ac49-08db66cc44b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hcBbHROcSzsQaUmrQ7nVddcy8rgXUNLtVKj0vdlhlNsE5enJDTTGIyZgzjw+zJRqWSJqAXpvP3T7vKZhyrjprAPoj7R4ZJaXdgrJRRfMytTLvQLtvDCoII1BlcMX1JYORzVqYM8/IY61SdJ3Ui3gwFPnqiRLGUmLRy3pmZtk3K0R1htIofN7Vx7C/OfoQ45D7mBS4C2/qIdg90PKaPlVAI3zXVBH1570Eu5hEMKOaK3Pzfdte/vd83xvlG92pCHDxEwjke11bIR0ZI6qCf0NTMMx04UfFMQPBswKMEVCaBM3NN8fRCgWpyaBxpwVOnUUdzI6PXNsuYVRO/Mu+R6r/hFpuWrBnHgKQj0qLzE59UWtSAVf0yCHnVgaaqAzbhhApYYaPu8wmN/R2kVzgD0tHGWu/N5eP2P1uVEIAQbcRkKqQMcdwKGutA/s7oqXQ3ZU5Hflud2kZDoreMHS46cX4Ys3hVF5oCsWhTsqH3PQkzMCr90bc199rcw73fQOH8FeuKZ79cNnmRQrdFRar8wbql8oe55Eftv29XaiQt61w9xKTwhbz+W0ilRLCZfpajlBLBLd5gg7Av1UbaRVleNapNNQUtNWeUylhzmf4grnKett3PmcmK+MCJmstdNQDJcIN3bkXFE+5gjoe2RKHjghKp2yS6gN6MLvikK5LLE6loGf0RUZv/JV76xD7jav7ppNOkndsn9OQu6tVGZhFZeJNriDqz633uEPTyrLOqfK6XM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199021)(40470700004)(36840700001)(46966006)(70586007)(478600001)(4326008)(70206006)(316002)(2906002)(8936002)(41300700001)(8676002)(44832011)(54906003)(110136005)(6666004)(5660300002)(7416002)(26005)(40460700003)(1076003)(966005)(356005)(82740400003)(2616005)(186003)(40480700001)(426003)(336012)(66574015)(83380400001)(47076005)(36860700001)(81166007)(36756003)(86362001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:11.4444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1db0ea1-2643-4a82-ac49-08db66cc44b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6166
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
 include/drm/drm_connector.h                   | 129 ++++++++++---
 9 files changed, 349 insertions(+), 134 deletions(-)

--
2.41.0

