Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372BD5F4AC0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 23:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8FD10E13F;
	Tue,  4 Oct 2022 21:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1992010E00C;
 Tue,  4 Oct 2022 21:15:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yplj1cyfwgKLcfvVYB2egMk0d22rF8F15g4joJWsp8hmMhymoc7v2/rKnLmnl/J5rtuVhzynND1kFN6h8G6z2XL45M9tW7fYaAeUhlE38b45JhVrYgPrlNptRKk+YITq8pVYRofjFz93o648WKLWwX2t+9HWzaQJ+yvAQYOpDhilYyBPsbI/ibV8isodGd8HYaoxVpDKU92ehbBbvW962XMgLcU/9q6LQ3ZqwDugJdasfDHEjG1RK1YbRh1tStECkD0GNXB1DZ/w7Qa76futTERF6Go1FUot6uX4kBhkfBrEhAthPJnTj/LgbKhzHtqUvOvTFjD30Sy1iCCnFvnkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5sJcNIcOq/TBHIegE7qiYMrxO49NmaJH+RynZFBfFI=;
 b=XLAWd7Quznq55S+vsLQImRoLgwTJZfacQrxvfHk+Qe28dT8JfvEInLXcQpndWWpO+4Ha5rRh1JHMkcHUxSM9nE2mK2du6IlRT3SYaqaO9YhyqpbPqB2ZfJCXxLTNdEsRJkGPXBodBUQmozG3x2bOKSHY+1kjz1AT/EgLKzERLWfgGLxHfDDWqYFGCAR3ccBKnYZFIhbI5qCyitycAXq37C5UhTmLs8elqvvVzqLD6xx8SCTWNG/bvmT8y/1bh+zu29j0i/Q/WeqrwmJxENJrqhRF9vpp9T4cZeZUIeFxoaPOwt1+SXBlh5E0c+xc/Ukv2Hj6xTQxZIqQGPvsF1l9AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5sJcNIcOq/TBHIegE7qiYMrxO49NmaJH+RynZFBfFI=;
 b=p5fShnu+SdT0f+tvV2D4wyHxoGRnYdDOBCLuW/F2Vi7OGLqPqawjcenzKemPouopLnZFlz2AZTLB0hYeGskaE6YofsMvZyw+DedBkWth39qh4tAEY+dUqU+y4hmj86zz/irq0fjFB+B0aZ3tVQ9YJs/IKZjE7dNOXqTw3vHkMU4=
Received: from BN9PR03CA0320.namprd03.prod.outlook.com (2603:10b6:408:112::25)
 by PH8PR12MB7374.namprd12.prod.outlook.com (2603:10b6:510:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 21:15:05 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::2d) by BN9PR03CA0320.outlook.office365.com
 (2603:10b6:408:112::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.22 via Frontend
 Transport; Tue, 4 Oct 2022 21:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 4 Oct 2022 21:15:04 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 4 Oct
 2022 16:15:03 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 0/5] Proposal for Pre-blending 3D LUT interfaces
Date: Tue, 4 Oct 2022 15:14:46 -0600
Message-ID: <20221004211451.1475215-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|PH8PR12MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: a5509521-fffb-47b1-ba55-08daa64d8205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4fs5TnQDpxj9NioUlUe+HsVEOtbf5o3bErT1KuZxcht27ll1eFD1FvFIJQGLswPoJCLp/pMzk5mZf2NP8dajlQgb8RFiZbwkb3Hb9eIxgdWAzSndzHS1u+aZ8PLDnxWaYk+suvaBK6ImXArC3LHpx2L8Si5+q2ciTNyKKpupOizIyhd3QlE7VmKGFec61HZLRkpB9eQl8NAQaE+yLZk/XOXL1MH3xkzPyrq3kTm9MD2IGlAitib7qqxofg85kssNVXux8isc4OpZeArOo1rtPltCAOdIJpE9i6789klRvSjudTZOfwzbuYCwiO23gsq1fXo0BXsBVt5JhNlvFjpyxnzY2iVc2A2SZyDWoXEYuU/L2EWEIG6GYe9whFT9PPlgVyolqEMeECTTP72dlbn05lfw7HABWMCoxmMDIFh9pajay6TC+X6J0voxVgH7RPzQC70ThmCnWS9vU+Pa25ifyZblHz+CF/+z5Sp9PFe2ZcLYL+oLGbwaoZM5wp5ZQzYKafvMy/bbjC+DxxbQprvtWsR2My5NJgm+4u9dlfFmaDCa3GoW1HlyGQZMcbGonHt86Qx86um501KmWa1JFjpy8TI+60AY03tqwrk31gX45TthuXnKLMIFXCxReQaHy737b36ku63eS4yzNNtdqEOlpunf0cZzt6sYPmH5NMMAAIBE7CccVzwKpZbLe5OkKGd21l4oANWzLxpxqWU/qmwhFQ815/ciY8BOtcS/Dx2rslQrNzfyJyT6aQObQMlgrK8HwHz7lYIl1wHEfieKTwcQntu5ZofLi/ah9O5UWJNKcUoVMaY2NL4WIY+ZgTVYEHtDEw8Qx1iTBkHmb+ZjRoucQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(1076003)(186003)(16526019)(44832011)(336012)(2616005)(2906002)(7696005)(41300700001)(8936002)(5660300002)(26005)(82740400003)(81166007)(356005)(86362001)(40480700001)(82310400005)(83380400001)(426003)(47076005)(36756003)(36860700001)(40460700003)(54906003)(110136005)(316002)(966005)(478600001)(8676002)(4326008)(70206006)(70586007)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 21:15:04.9671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5509521-fffb-47b1-ba55-08daa64d8205
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7374
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
Cc: mwen@igalia.com, bhawanpreet.lakha@amd.com, Alex Hung <alex.hung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an proposal and a draft implementation to enable 3D LUT on
drm_plane. This proposal defines a new interface for userspace
applications to query hardware capabilities and to pass/enable 3D LUT
functions via this DRM/KMS APIs.

Overviews:

┌─────────┐    ┌─────────┐    ┌───┐    ┌──────────┐   ┌────────┐
│Userspace│◄──►│3DLUT API│◄──►│DRM│◄──►│GPU driver├──►│hardware│
└─────────┘    └─────────┘    └───┘    └──────────┘   └────────┘

1. Userspace queries the 3DLUT mode (defined by drm_mode_3dlut_mode)
   from the GPU drivers (ex. amdgpu).

2. The GPU Driver replies sizes and the color depth of the
   3DLUT modes, such as defined by struct lut_3d_mode_17_12bit.

3. If applicable, userspace selects and sets one of preferred 3DLUT
   modes by "lut_3d_mode" to driver.

4. Userspace passes 3D LUT via drm_property_blob "lut_3d". In the case
   of the mode "lut_3d_mode_17_12bit", the 3D LUT should have a cube
   size = 17x17x17 (lut_size), color depth = 12 bits (bit_depth), and
   X/Y/Z axis = R/G/B (color_format).

5. The GPU driver parses 3D LUT and passes it to hardware pipeline, and
   enables 3D LUT accordingly.

Notes:

1. The patchset is based on the previous work on
   https://gitlab.freedesktop.org/hwentland/linux/-/tree/color-and-hdr

2. This interface can be part of the newly proposed DRM/KMS color pipeline
   API (https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11). A
   future integration to the new API may be required or preferred, such
   as the followings:

  struct drm_color_pipeline_element {
    drm_color_pipeline_element_type;
    drm_color_pipeline_element_lut3d
  };

  struct drm_mode_3dlut_mode -> struct drm_color_pipeline_lut3d_config

  struct drm_color_pipeline_lut3d {
    lut_3d_mode_17_12bit;
  };

  struct drm_color_pipeline_lut3d_data {
    *lut_3d;
  };

  and etc.

3. A patchset "IGT tests for pre-blending 3D LUT interfaces" for this
   proposal is sent to IGT mailing list.

Related Work:
 - Enable 3D LUT to AMD display drivers (https://www.spinics.net/lists/amd-gfx/msg83032.html)

Alex Hung (5):
  drm: Add 3D LUT mode and its attributes
  drm: Add Plane 3DLUT and 3DLUT mode properties
  drm/amd/display: Define 3D LUT struct for HDR planes
  drm/amd/display: Enable plane 3DLUT mode
  drm/amd/display: Fill 3D LUT from userspace

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  20 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 181 ++++++++++++++++++
 .../amd/display/modules/color/color_gamma.h   |  12 ++
 drivers/gpu/drm/drm_atomic_state_helper.c     |   3 +
 drivers/gpu/drm/drm_atomic_uapi.c             |  11 ++
 drivers/gpu/drm/drm_color_mgmt.c              |  68 +++++++
 include/drm/drm_mode_object.h                 |   2 +-
 include/drm/drm_plane.h                       |  33 ++++
 include/uapi/drm/drm_mode.h                   |  17 ++
 10 files changed, 347 insertions(+), 1 deletion(-)

-- 
2.37.3

