Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AC850047F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 04:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E564E10E142;
	Thu, 14 Apr 2022 02:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8218310E142;
 Thu, 14 Apr 2022 02:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4XwHHWShuxLEX7WMfWZHL6hNsYXMSl/dEUfd5zMzt10AJn+bhiswC0OAcrVRVc56ORByvhlUjzo/Vi3FuJbMeIgUFXkkW07woowV6tIjLNbMMx4Sv+K0t7NFpyrBA3ucSwOPG0VIEn0wFtmjbxDXDI73DL/zMZAtO4H8ymulgIYtzXlYV2TYmY9ZTRX+WrXXMUheMcf1FtteK6ar+9VnLVu9YxMXIomiGHRW2ksfeUhxpbfoaFsaBecYe3xQ55E6F2jknxFzA8nHSQY2EEaFp6FIMc6PgXP4/yAgKznFLfqnK5PspqSYmYvy+fO0tRlnvawkn+QDv1rILPwBe0Dyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mE/WaIre2+5s/EIkPHZBdAlax6mUu6KMJc4WVDf0BKM=;
 b=Q55d/gi+D7G3Od9KlWTqV7deOsYfTfXbJ+xAym/Q8Wncn5Cux/bNbjZqT4xSticoGZorrkbkED4uHy5z4bFePVn+A/9wJ80IeoDjpclOyy/pTJhqX2XSX2/U8Xm+q6PGiLPQeZhsW4oSkiVLlYMRY8mVksIwEQzTvboCXOppIZeLMLH5qVZXSAXMPtnsU2SuAwxkOhA687i3QxxB2CRn2wn+Uhi+DhnVnoWPdm42a4QYpfeFnLHh2TrUkp/7HRvzZGk0/+gEDHA6OTEt0O8rffzfmm9g77viLN/h5fa+bUxzABnqXy/qdiW/SL8iNsKYFDR8KYNoFhhccgl9gvopFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mE/WaIre2+5s/EIkPHZBdAlax6mUu6KMJc4WVDf0BKM=;
 b=KDL1r1/ol4bcldiqvVm38pF708XKx+seNLak5MC4twcw8c4YgTFbQCbTloLytrSUx202yG6VSHzgkjZh7X8xpUH+FJLNxV2eEi7QSugleMZoNQ3gGRGoy+HUzqJhxHtcRUj/QD9nZ81mnzPNqzj/N8F8r8l89ZgkkQXRgXWrbd4=
Received: from BN6PR18CA0016.namprd18.prod.outlook.com (2603:10b6:404:121::26)
 by DM6PR12MB4371.namprd12.prod.outlook.com (2603:10b6:5:2a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 02:58:41 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::5b) by BN6PR18CA0016.outlook.office365.com
 (2603:10b6:404:121::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Thu, 14 Apr 2022 02:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Thu, 14 Apr 2022 02:58:40 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Apr
 2022 21:58:39 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.18
Date: Wed, 13 Apr 2022 22:58:21 -0400
Message-ID: <20220414025821.5811-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1acaecdc-c538-4326-ee63-08da1dc2add0
X-MS-TrafficTypeDiagnostic: DM6PR12MB4371:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB43710CF3039FC7D09E19AEC8F7EF9@DM6PR12MB4371.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BEgQr4Y908LnEerwDPXCdSdpWpYnwXG5NBSE2WXhlIp81PWV3VYhZOZywhgEzYD98Psi2SGPeBmgAUDAQdaBZinQ7cx94msue4dwTTbJPNTIKAhP4NNgXUn+cnrGzFT6AAQVECQJUnlWUpFfDxu1IyaW1UIZkF19fzfySqe2z6h+fC415dTxRlkAHEq07l8hiQW+dWN9nwgkCWqs+Kb+mMOuSNjOT3+C8dlUqS7ZTb1V/XHYzlxVPO/pMrUXguaO3uKSOiTUtlIY14C6LzAu/lohfnfqO6Bp66/fd/kWNZS8Gr8K5oinrMvUZrrTAmXEUX6tNnNeKzXqIDfi8oNzsEWImoO+c5HHLGSXthtvNPo4qPc/1AH/uzz7OZWNh9CzFv6F9wN9lpOns6XiizknJvGBZKt83/yJzx5ZRtgKQDVXup9qCsmHmAxSW0OnVtFGhvImWtH/gPSXvZwShZBnIsL8GyspomlAZ+waqSz51sDBl02z8ZSQIuJO14H4Eub4zTbI5u7HbRxQbWG9In1nS9MV6zmAALS/ldONslZQwyYiHrqfSqpx6PAu9Nepm4Vk6+wq76CJ5oLS+w173AvQ+/wGcrO0npsap0G5xnaprXvBGDWBwVRdMxD4l41W+l+6uG30Wh7fojrvHhbtE4nCDUSSEd1+SwjB1jYQyOxv9eFylauO8e1rLg/frQmhhU4TvirqzGHARRshwDINozM0fQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(316002)(36756003)(8936002)(356005)(8676002)(4326008)(81166007)(70586007)(70206006)(5660300002)(36860700001)(83380400001)(47076005)(86362001)(40460700003)(1076003)(426003)(336012)(186003)(2616005)(26005)(2906002)(16526019)(82310400005)(7696005)(110136005)(508600001)(6666004)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 02:58:40.2577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acaecdc-c538-4326-ee63-08da1dc2add0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4371
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.18.

The following changes since commit 88711fa9a14f6f473f4a7645155ca51386e36c21:

  Merge tag 'drm-misc-fixes-2022-04-07' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-04-08 09:22:16 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.18-2022-04-13

for you to fetch changes up to aadaeca46ce54af9f8f494792a1ba47a6fbda7ba:

  drm/amd/display: remove dtbclk_ss compensation for dcn316 (2022-04-13 22:23:54 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.18-2022-04-13:

amdgpu:
- Fix for alpha properly in pre-multiplied mode
- Fix VCN 3.1.2 firmware name
- Suspend/resume fix
- Add a gfxoff quirk for Mac vega20 board
- DCN 3.1.6 spread spectrum fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: fix VCN 3.1.2 firmware name

Charlene Liu (1):
      drm/amd/display: remove dtbclk_ss compensation for dcn316

Kai-Heng Feng (1):
      drm/amdgpu: Ensure HDA function is suspended before ASIC reset

Melissa Wen (1):
      drm/amd/display: don't ignore alpha property on pre-multiplied mode

Tomasz Moń (1):
      drm/amdgpu: Enable gfxoff quirk on MacBook Pro

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                | 18 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c                |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c                  |  2 ++
 .../drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |  4 ++--
 drivers/gpu/drm/amd/display/dc/dc.h                    |  2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 14 +++++++++-----
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c     | 14 +++++++++-----
 8 files changed, 37 insertions(+), 21 deletions(-)
