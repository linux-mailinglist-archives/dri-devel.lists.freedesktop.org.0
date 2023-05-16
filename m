Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9619F7044C1
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 07:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6D710E186;
	Tue, 16 May 2023 05:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B6210E186
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 05:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbeAAok3fjlZMZkihiIYkhrQLmg/UNk7qrKAReCJt+poG+IvdcWdXMvOKTIkZN8tXA6JGPWiDOGlNLzIEhHAYeQYFH22er5HbzWTvotfckJrPqE4cNaC3rLAZ9+Apu2X1PojLFnD/r6JAWoKo5H1oRMULRkgUoGSpOj3u4LVS4b7lsQFTSoDgxLT/Bd5UPdHorS2UKDFZXDMYfugGuFoYy6jucWsI4Qm3tXDGE5gNQ9uS7R7D03OJOpAN1VoZZ5Qi1LlNxCZuQ1vrgx3qh+TdZ95Qelx+s+SJCU1nftzhHw3ewhhClAN17pG+dsnH3XKAIaFuOd+LFOnfzZPwyKW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azNfKoBAw3T5o2DpFN9L5PiW19nreH40Rw62jbknrjc=;
 b=RyDnPwHglTKD0FIfkJIwIF6/sokWy11+YcWB+zaCR3fV0jplRC+NPJpdXOcYEtNpXlM6IFGj5ZJg8CUZZweXl9FwrPQEX/QQbE+VNh3FOfMhh0xdPB0hWeE1uw2Om7szfAXN6DPIjmwEWx511P6W9nv8+vmemfBrwizdajmEdU9BmPHxQ66owLKUJcWdr7Ep0ib1a3XwHXmnA7EZpttWGUAecrTnac0f98G1AICQXX9TDp974cJtdmrnsJSQt1QDnbzbMAaKAIT7Z9Y6j5QM7CR++qKq2FvebyBS4U8vfZk/vSspvKP8zatZchz/vZ0u+l7jwxR25IIL1a0H+00gTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azNfKoBAw3T5o2DpFN9L5PiW19nreH40Rw62jbknrjc=;
 b=4IVBtMR74QwNahalAvpiKKtW4sm/C4kI2o7z8vxCQJmgjBeLM/IcnNf4ufRt1o0pXw3dpQj5bD3DiTf33WmpJD4evKmiDyBjsX3PRa+QHQGmn8V6DUU/Nxv065yahOAZfEMNx1MAQv3DfN7wnU/Q09NqhElWr86zs5OwYiHDq+M=
Received: from MW4P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::29)
 by PH8PR12MB7255.namprd12.prod.outlook.com (2603:10b6:510:224::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 05:39:49 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::1e) by MW4P220CA0024.outlook.office365.com
 (2603:10b6:303:115::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Tue, 16 May 2023 05:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:39:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:39:48 -0500
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:39:46 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/7] Secure display with new CRTC properties
Date: Tue, 16 May 2023 13:39:24 +0800
Message-ID: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT024:EE_|PH8PR12MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: f46aee67-26ef-416c-c375-08db55cff6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F+3KSBP7pWIKtvD75wI9z6LKf4i7vfkWDnWmFCjPRHpPowr+U/FhEhTsSMxMSAGZuO8LCynoaN3I6j9MHt8C6E8VIgAErFExH5gP08SPLI8Tep7dLcibugm8+ax3wDqdL6mGcn8VnB7Dv5BPo5Ho3Uu+Ylxlmbz6CTLK99ZCwcZXP8EMoC1kFV/dVhHtlxmQXePQYK5EO5v0vF4lXne6r/hAmzu6nd1So6ggAzzSa+cipMnc/ElW4m4BTdwRu0zsdyWqEfzrNaVPBh9vZijZvZoxzUDwylkaIdncjiXyRVtkL6ccpfQtcewFDqo+zbZ5Oo8QRdl7cfd7yl5xu+xMJTP6x0LqkrTVlOVO7bNxpEU+XMc5cJIqW5zdT8QkucQXzjlVnxsDh6vT8p1q9hef9U4hDu8bj4YJ6dPbd3XoNpFWDslAHmzYuVvODktLAT+zVi/oIULgyMU0+aUtSasA75ONK9WnNB8cetSow4iiSRNi4+1yAOhnfz1cYFAX8iB2cFB/ciC+/QESzTBwUMG5aiqXCry44S0X5r3+h6VNR7CLBb+2RNf5wmeb15woM5AkyauPyZQ5q3KPNSqNRvd4byLPUwfVolUrw/aynfYVOFnlobztsizdt43FgJFG2PfhxshihJTqFKsWvBOjNYIQj9U3b1W5qpC1ZTteSLnAEFEPJfI/e26prbnKF6SsTXYePJikGHpVt5WpswtJ5tW0a/x2kThYBym9xPQR2iemM4w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199021)(36840700001)(40470700004)(46966006)(47076005)(336012)(83380400001)(36860700001)(426003)(70586007)(70206006)(966005)(2616005)(478600001)(7696005)(40480700001)(26005)(1076003)(54906003)(6666004)(186003)(40460700003)(8676002)(86362001)(5660300002)(8936002)(2906002)(41300700001)(36756003)(4326008)(82740400003)(316002)(6916009)(356005)(81166007)(82310400005)(66899021)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:39:48.8110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f46aee67-26ef-416c-c375-08db55cff6c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7255
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, wayne.lin@amd.com, lili.gong@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear DRM development community,

We'd like to introduce the implementation of the new crtc properties.

First of all, please let me introduce the problem we try to address. With the popularity of electric vehicles, the car vendors have increasing requirement for ensuring the integrity of the critical content on the display. For example, tell-tales are icons to indicate malfunction or operation on a car system. For safty concern, car vendors always want to make sure these icons are not tampered and can be correctly displayed on the instrument cluster.

To address this problem, since modern display control hardware is able to calculate the CRC checksum of the display content, we are thinking of a feature to let userspace specify a region of interest (ROI) on display, and we can utilize the hardware to calculate the CRC checksum as frames scanned out, and finally, provide the checksum for userspace for validation purpose.
In this case, since the icons themselves are often fixed over static backgrounds, the CRC of the ROI pixels can be known in advance. So one of the usage of ROI and corresponding CRC result is that as users know the CRC checksum of the tell-tales in advance, at runtime they can retrieve the CRC value from kernel for validation as frames are scanned out.

We implement this feature and call it secure display. To let userspace set ROI and retrieve the corresponding CRC value, we provide 2 new properties, SECURE_DISPLAY_ROI and SECURE_DISPLAY_CRC. Both of them are blob properties under CRTC, and the detailed struct of the two properties are listed below. One for userspace to set ROI to kernel, and the other for userspace to retrieve CRC values from kernel. Upon userspace submitting the 4 coordinate values with secure_display_enable true, kernel instructs DC hardware to calculate the CRC value accordingly as frames scanned out. The result CRC value of RGB colors are then stored in secure_display_crc property, with a reference frame count for userspace to know which frame the CRCs are calculated at.

/**
 * struct drm_roi - The enablement and region of interest (ROI) of secure display
 * @x_start: Horizontal starting coordinate of ROI.
 * @y_start: Vertical starting coordinate of ROI.
 * @x_end: Horizontal ending coordinate of ROI.
 * @y_end: Vertical ending coordinate of ROI.
 * @secure_display_enable: To enable or disable secure display.
 *
 * Userspace uses this structure to configure the region of interest and
 * enablement for secure display.
 */
struct secure_display_roi {
              u32 x_start;
              u32 y_start;
              u32 x_end;
              u32 y_end;
              u8  secure_display_enable; };

/**
 * struct drm_crc - The CRC value of the corresponding ROI of secure display.
 * @crc_r: CRC value of red color.
 * @crc_g: CRC value of green color.
 * @crc_b: CRC value of blue color.
 * @frame_count: a referenced frame count to indicate which frame the CRC values
 *  are generated at.
 *
 * Userspace uses this structure to retrieve the CRC value of the current ROI of
 * secure display. @frame_count will be reset once a new ROI is updated or it reaches
 * its maximum value.
 */
struct secure_display_crc {
              u32 crc_r;
              u32 crc_g;
              u32 crc_b;
              u32 crc_frame_count;
}

To better introduce the usage of this feature, we also have a paired Weston application as an reference app to use secure display via the properties. Please check the Weston application and see how the application set ROI and validate the content from the CRC here: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1236
This application can draw patterns on the display, and allow users to set ROI and submit it to kernel via properties. With kernel keeping calculating the CRC, this example application takes the first CRC as source CRC, and keeps retrieving the new CRCs at each frame later. By comparing source CRC with the following CRC value, the application can validate if the display content got changed down the road.

Finally, let me briefly introduce the patch series. In this upstream we have 7 patches. The first 4 patches are adding the new properties to drm, which are the changes to drm layer:
1.                   Add new blob properties for secure display ROI
2.                   Implement set/get functions for secure display ROI properties
3.                   Add new blob properties for secure display CRC
4.                   Implement set/get functions for secure display CRC properties

The remaining 3 patches are only related to the processing of ROI and CRC data in our driver, also listed here for your reference.
5.                   Processing secure display new ROI update in atomic commit
6.                   Implement the retrieval of secure display CRC data
7.                   Block the requests for secure display ROI/CRC until data ready

Thanks for the reading and welcome any advice from your review.


Alan Liu (7):
  drm/amd/display: Add new blob properties for secure display ROI
  drm/amd/display: Implement set/get functions for secure display ROI
    properties
  drm/amd/display: Add new blob properties for secure display CRC
  drm/amd/display: Implement set/get functions for secure display CRC
    properties
  drm/amd/display: Processing secure display new ROI update in atomic
    commit
  drm/amd/display: Implement the retrieval of secure display CRC data
  drm/amd/display: Block the requests for secure display ROI/CRC until
    data ready

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  44 ++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  14 ++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 113 +++++++++++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |  19 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 139 ++++++++++++++++++
 include/uapi/drm/drm_mode.h                   |  39 +++++
 6 files changed, 360 insertions(+), 8 deletions(-)

-- 
2.34.1

