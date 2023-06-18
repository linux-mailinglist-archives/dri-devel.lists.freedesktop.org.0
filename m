Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A9F7345D7
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 12:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B988210E038;
	Sun, 18 Jun 2023 10:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE95610E038
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 10:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hda6Mqu1cqzZoDe2I4MwijHc7tIbv+pLl/l5QtdBOIGmL6xQ+KdOSeiVOS3D2ijyBo0X9ufKYPwviEhtfWhqYgySDuHRYIwcmUKKZR7IvrwdVxL+h1G6CEQRKZFq7sLB07IO5YQCsQ9EGJ2vjS4zWt7cRtZBhi1LE4kgtp6l6uVzTq9+5MJM/gWGiyyW4vMr8HlLY5IRpanQ/Ojcmw2oM7M1hpceN3978yGOyBEOdDPMEX473B/U+md1ebZJJKNx4hpRQhlg1d0QDwLKngi2Pc8USfy3CfSNHOfeM/igaflBAIjhLQygPgayv6C4j0vnkZaQFzxVt0K0PoaOJINuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNQTuJNlROQFEEbpx1BpK91AvqsylcnDxpY/RIJqKcE=;
 b=KmHAWkbRQab0gJSFhFRu5OfrKdM8lTKnpsEFN2LR18IZ4TcOajmFKLIds26kcVby91eaJ0P2juosCj21eEVNymHyY4ptCajKABOAzHolJlrZ/WSIAJ4rhS/NcbIrtWQZBfxAGyU+oxEl6pHk42I0wMsX2vCfmarYZ9uos4muz7GObelvP7dJrynlZnXTqAv0UFlXkHKqIBgshj9dzMZIDqEvYD5yxTGoJYgEHqfykOsAlyexLQM48KyULnWnD9MQzGwwHUj7LOHvWaFUQJT5foxylIm+w6J1VECv/VzbEGdxtFf/zoxAJFD/VNbzY+USoynphtsh6G0pw54J4OlNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNQTuJNlROQFEEbpx1BpK91AvqsylcnDxpY/RIJqKcE=;
 b=FsuG9sxfWhzPT06rKrczUu57LKs2na5q+U2w98CnM2HXkBdgZ9yVrbDWsccqq23mJohfDi31HbJliLe4EUuf09hGcdwM7JloHzInSsESgVUEtR0ztewnY+5StpqZAbAMzE1VR07lM02d745dzXMlFl609J7LMcA/qgk1hm3z7to=
Received: from CYXPR02CA0088.namprd02.prod.outlook.com (2603:10b6:930:ce::11)
 by PH0PR12MB5434.namprd12.prod.outlook.com (2603:10b6:510:d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Sun, 18 Jun
 2023 10:38:59 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:930:ce:cafe::17) by CYXPR02CA0088.outlook.office365.com
 (2603:10b6:930:ce::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35 via Frontend
 Transport; Sun, 18 Jun 2023 10:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Sun, 18 Jun 2023 10:38:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 18 Jun
 2023 05:38:57 -0500
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Sun, 18 Jun 2023 05:38:51 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/3] Checksum Region with new CRTC properties
Date: Sun, 18 Jun 2023 18:38:44 +0800
Message-ID: <20230618103847.614721-1-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|PH0PR12MB5434:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a447bc1-0e70-4a7c-d442-08db6fe83946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VKp2PtO5GB072S7hUCKtgVhS7uBK4+9Vovbcac/HrdSCnAa9UbE2YnNyCwPKpvbUS9PL02jIYpx3KCG2Ks/XFxXAy7KiAYS/uEfcWWli6UMkOh1qoR930VIPzUnwsZlonkaSFKm5QpV3HmgKtGHI9nUOJ9XhoyqZ6YsLtLRh4ahRl3dLO+VIvyqkbg95C1tngii48BYUecw7OIbyWrWx1/jDNX5JbhAD9w5Jc0IpIhCrt1E1VY+NdwiV7lVHquWk1QYcX/k2XYliuGhJsrWEpWtKDWNIhGjxgGn+Pll3UWUU310vAA9ppAPWWLLh3YIzaXT7pqaY8WMKHlU3SS8bAaIUQ/iKoWGfqQCCOUsTz0YVHtnmnM/5pjP9DsxWpfDx9q8+pxX1yEUsBDbD2q+Y6g1uaBWvD7yhzsp1VUwEpe8wOdMTiS39/sfECj49v4d2lt7pCfGGGvrlbyKywjTTgd+72y+Z4lVTMynmIw8MVDHLjCXsMe6U3lNgaRw3FzBme5/8fbygXeeNmEogR7Nj0DAnm/XH8GzS805/NLuQm7xYtU3nCdrL+sQx6cjOlU1GFuDitgcrcTlo3SXRecrHhPftARq7NzWE76jxo2LIpGhT8sX+G34QURRA97bsnXRgMSBXKMvd5i7GaVdJh0XVnchK+y9PPJNNKoifc+fcXK2g5YIuSqk3tUaGa1bJFHlj2+U1JF/xQMmFca8mbI90Xv73l9jpMp6shsvIGwQXLqc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(46966006)(36840700001)(40470700004)(41300700001)(5660300002)(8676002)(8936002)(2906002)(40460700003)(82310400005)(36756003)(40480700001)(86362001)(478600001)(26005)(1076003)(54906003)(186003)(7696005)(6666004)(966005)(81166007)(70586007)(70206006)(6916009)(356005)(47076005)(36860700001)(4326008)(316002)(336012)(426003)(2616005)(82740400003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2023 10:38:58.6002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a447bc1-0e70-4a7c-d442-08db6fe83946
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5434
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Wayne.Lin@amd.com, Lili.Gong@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear DRM development community,

We'd like to introduce the implementation of the new crtc properties.

First of all, please let me introduce the problem we try to address. With the popularity of electric vehicles, the car vendors have increasing requirement for ensuring the integrity of the critical content on the display. For example, tell-tales are icons to indicate malfunction or operation on a car system. For safty concern, car vendors always want to make sure these icons are not tampered and can be correctly displayed on the instrument cluster.

To address this problem, since modern display control hardware is able to calculate the CRC checksum of the display content, we are thinking of a feature to let userspace specify a region on display, and we can utilize the hardware to calculate the CRC checksum as frames scanned out, and finally, provide the checksum for userspace for validation purpose.
In this case, since the icons themselves are often fixed over static backgrounds, the CRC of the pixels in the region can be known in advance. So one of the usage of the region and corresponding CRC result is that as users know the CRC checksum of the tell-tales in advance, at runtime they can retrieve the CRC value from kernel for validation as frames are scanned out.

We implement this feature and call it checksum region. To let userspace set a region and retrieve the corresponding CRC value, we provide 2 new properties, CHECKSUM_REGION and CHECKSUM_CRC. Both of them are blob properties under CRTC, and the detailed struct of the two properties are listed below. One for userspace to set the region to kernel, and the other for userspace to retrieve CRC values from kernel. Upon userspace submitting the 4 coordinate values with checksum_region_enable true, kernel instructs DC hardware to calculate the CRC value accordingly as frames scanned out. The result CRC value of RGB colors are then stored in CHECKSUM_CRC property, with a reference frame count for userspace to know which frame the CRCs are calculated at.

/**
 * struct drm_checksum_region - The enablement and region of checksum_region
 * @x_start: Horizontal starting coordinate of the region.
 * @y_start: Vertical starting coordinate of the region.
 * @x_end: Horizontal ending coordinate of the region.
 * @y_end: Vertical ending coordinate of the region.
 * @checksum_region_enable: To enable or disable checksum_region.
 *
 * Userspace uses this structure to configure the region and enablement for
 * checksum_region. Userspace should not submit a region out of the displayable
 * region because there is nothing to display and need protection.
 */
struct drm_checksum_region {
	__u32 x_start;
	__u32 y_start;
	__u32 x_end;
	__u32 y_end;
	__u8 checksum_region_enable;
	__u8 pad[7];
};

/**
 * struct drm_checksum_crc - The CRC value of the corresponding checksum region.
 * @crc_r: CRC value of red color.
 * @crc_g: CRC value of green color.
 * @crc_b: CRC value of blue color.
 * @frame_count: a referenced frame count to indicate which frame the CRC values
 *  are generated at.
 *
 * Userspace uses this structure to retrieve the CRC values of the current
 * checksum region. @frame_count will be reset once a new region is updated or
 * it reaches a maximum value. Currently these CRC values are designed to
 * be validated with pre-saved CRC values, so userspace doesn't need to concern
 * about the algorithm used to compute the CRC.
 */
struct drm_checksum_crc {
	__u32 crc_r;
	__u32 crc_g;
	__u32 crc_b;
	__u32 frame_count;
};

To better introduce the usage of this feature, we also have a paired Weston application as an reference app to use secure display via the properties. Please check the Weston application and see how the application set the region and validate the content from the CRC here: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1236
This application can draw patterns on the display, and allow users to set the region and submit it to kernel via properties. With kernel keeping calculating the CRC, this example application takes the first CRC as source CRC, and keeps retrieving the new CRCs at each frame later. By comparing source CRC with the following CRC value, the application can validate if the display content got changed down the road.

Finally, let me briefly introduce the patches. There are 3 patches in this patch series. The first patch is the main patch that contains change to drm, including the new CRTC properties, the property creation function and a update_checksum_region_crc() CRTC callback.
	1. drm: Introduce CRTC checksum region and CRC properties

The remaining 2 patches are only related to the processing of region and CRC data in our driver, also listed here for your reference.
	2. drm/amd/display: Create checksum_region properties and handle new region update
	3. drm/amd/display: Implement the retrieval of checksum_region's CRC data

Thanks for the reading and hope to get your feedback soon!


v2:
- Change the name of secure display to checksum region.
- Move the new properties, their creation function and their state to drm layer.
- Improve comments on the new properties's usage and limitation.
- Add a new CRTC callback update_checksum_region_crc() for updating the CRC checksum to the crc blob.
- Squash patches from 7 to 3.


Alan Liu (3):
  drm: Introduce CRTC checksum region and CRC properties
  drm/amd/display: Create checksum_region properties and handle new
    region update
  drm/amd/display: Implement the retrieval of checksum_region's CRC data

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  44 +++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 112 ++++++++++++++++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |  14 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  52 ++++++++
 drivers/gpu/drm/drm_atomic_state_helper.c     |   7 ++
 drivers/gpu/drm/drm_atomic_uapi.c             |  21 +++-
 drivers/gpu/drm/drm_crtc.c                    |  44 +++++++
 include/drm/drm_crtc.h                        |  43 +++++++
 include/uapi/drm/drm_mode.h                   |  42 +++++++
 9 files changed, 368 insertions(+), 11 deletions(-)

-- 
2.34.1

