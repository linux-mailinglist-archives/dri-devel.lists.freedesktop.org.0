Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E02E798953
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261A610E0E2;
	Fri,  8 Sep 2023 14:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D0010E0E2;
 Fri,  8 Sep 2023 14:56:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caVQBHHWNxPm/JXt3VxzaBt3t7BNSgFBNpB+neHIvuPpcm3bCAEa2kJVTtxVZVehQyaQ065NH8CbknFzlbU8NAVVnCv56eOJylLDTxCcqhxS6BvFLYkB4eQGmPHZ48hK2diBRLSLMYdtQR0UkLWcuO2BbWOI00qhOHmZcK1bLG/orkoVY6x2REHb1eb4/smLJf3vMXkXNl7SF/QXhBUXpYmGaZdbFW/v6GLF3eaYTtq+k+XVkBW2Mx3GhpDBTMWQq/GaZIS34hDBp1+ItkunDNx6gWPEfVBHp6C2tE7/X8vXcAwARlEGjrMJBSiPrTDXaPAoFj2WnfYqUKyvQW9nWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYosKuGwEHSV0ARvvNJr9fo0tUJ2iy2V6hiPHh1ZbCk=;
 b=VzlktNn619nPxV75sn5HOsNwF0JhlVVH8m7tdAvGzqkhaQg8hBGp/B0Vdd1XjV8vXPtdZiqPg2HG4YpqVo7oMp1N8Ue6dapeJQ3OPKqdn4936oo+olCgzb7kEHzQGhKDztknrJHEBsaDerEg79vG6DhRhaK3ElRcoXxLRbrBsyFH8rIg/HeFujEvd3s9DkQxiiVHFw6AYpknp/ZH7cIya6J6c+MoMWaGS1QzyZ+znpnuHgNqQeHJR+qfFhnn531rxoTACoCjav3vdwLzkFD6evKFStEmI7x7ngW6K6BKxI4punxCl4VFH7mIBlPlf+v0EbWArSDGhRaDABQgAMcpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYosKuGwEHSV0ARvvNJr9fo0tUJ2iy2V6hiPHh1ZbCk=;
 b=KZ1Qzm4JVsms2yyL6FqAgaIZBaxujR+1HY4N1iaPAbrjkUpmxMS3L1CasBANJB3qQLXD743Skj7bthCysXGsVp30KOfs4tG5omoUHxb3GREzxvG2PohMtVd/GWW6z70Lh7NOtiqrlLlzPySIs18TmRH9VfgAW1+M5sHTGeXG3X8=
Received: from DM6PR03CA0069.namprd03.prod.outlook.com (2603:10b6:5:100::46)
 by DS7PR12MB5743.namprd12.prod.outlook.com (2603:10b6:8:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Fri, 8 Sep
 2023 14:55:59 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:100:cafe::84) by DM6PR03CA0069.outlook.office365.com
 (2603:10b6:5:100::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Fri, 8 Sep 2023 14:55:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 14:55:59 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 09:55:53 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm/amd/display: fix the white screen issue when >=
 64GB DRAM
Date: Fri, 8 Sep 2023 10:55:12 -0400
Message-ID: <20230908145521.39044-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DS7PR12MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dba505b-2e6b-44bb-6858-08dbb07bb6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SMG0lj8Nx9+bP/neHfmkH+7uFVRmUDA8bXfM0KHX6hY4XKwRtpI2j8PglBHxt1jNOZ4H7FiADr3oHg5q+qwrgiDSvs1nS5yFuload7QK8F80esicmdH3Re6hNpXMBKuXTfmaN4KhBZIL8C776e55vxWdTAfZh4Df3DbhT+J2h5b8Bd0In3OhqCdOdtjK8qiAbvJgVF+M77nLqF7J1StpF8j6iSWZGr1rlPKEPQK77Foe8+Rknd/ztyIKlMy3UiD6F2oBzTAnoEV6XYF5L2ylDAA9gMT0WfD8RTA9QoZ/OewHIzvSCyEMLRvFzjnNMZ90lF1gU/kNxE+7y+95X4bat4xXARsx0wUXvX4Ui+iFArzQBIattQ8owaw5C+DIfRt6Wt6dluGQl89XIprSL+ishMeTAxdHtFZPw6iuOlQiX+KMfrvulFtSHuCTwQeBwUAk4XiVqeAsf7Tw9QI5ZLQjQd29yEmw0KJNul1Eum89NA1kJa1lTFMsrmnZo4c8vYSYHIJjdR4hUxjHhNG+sumQBeXY2aOgxRkc8RdjXgCyEWeLiuI7HUhJGMZ/J5Yi55puwcFZwUHPldfuw090w0T34qegHvuKVlrPH+meci4lUuTobZY5rO00rBy8Z8YaqFENoKswBEuLF4GhJajknJmil+jIpNWxJdxTuPMqcWH2h/vU1QMGgRit1In+KvSj8bQ+NXVpgTxMKQ+likW3VNRO3VjY32dS2LDQCrV+pXemV9uz72lnvi74IIBMTf1hJrdRal1a3DtNaJpM1VFl84Wv+6wJ2DT0gay/xXxU2WEO1ro=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199024)(186009)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(356005)(36756003)(36860700001)(40480700001)(40460700003)(1076003)(8676002)(83380400001)(4326008)(8936002)(5660300002)(6666004)(44832011)(2616005)(336012)(16526019)(478600001)(86362001)(426003)(41300700001)(26005)(47076005)(81166007)(966005)(2906002)(82740400003)(70586007)(54906003)(316002)(6916009)(70206006)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 14:55:59.4297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dba505b-2e6b-44bb-6858-08dbb07bb6a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5743
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
Cc: Alan Liu <haoping.liu@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Victor Zhao <Victor.Zhao@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Le Ma <le.ma@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Candice Li <candice.li@amd.com>,
 Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yifan Zhang <yifan1.zhang@amd.com>

Dropping bit 31:4 of page table base is wrong, it makes page table
base points to wrong address if phys addr is beyond 64GB; dropping
page_table_start/end bit 31:4 is unnecessary since dcn20_vmid_setup
will do that. Also, while we are at it, cleanup the assignments using
upper_32_bits()/lower_32_bits() and AMDGPU_GPU_PAGE_SHIFT.

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2354
Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: use upper_32_bits()/lower_32_bits() and AMDGPU_GPU_PAGE_SHIFT
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1bb1a394f55f..5f14cd9391ca 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1283,11 +1283,15 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_
 
 	pt_base = amdgpu_gmc_pd_addr(adev->gart.bo);
 
-	page_table_start.high_part = (u32)(adev->gmc.gart_start >> 44) & 0xF;
-	page_table_start.low_part = (u32)(adev->gmc.gart_start >> 12);
-	page_table_end.high_part = (u32)(adev->gmc.gart_end >> 44) & 0xF;
-	page_table_end.low_part = (u32)(adev->gmc.gart_end >> 12);
-	page_table_base.high_part = upper_32_bits(pt_base) & 0xF;
+	page_table_start.high_part = upper_32_bits(adev->gmc.gart_start >>
+						   AMDGPU_GPU_PAGE_SHIFT);
+	page_table_start.low_part = lower_32_bits(adev->gmc.gart_start >>
+						  AMDGPU_GPU_PAGE_SHIFT);
+	page_table_end.high_part = upper_32_bits(adev->gmc.gart_end >>
+						 AMDGPU_GPU_PAGE_SHIFT);
+	page_table_end.low_part = lower_32_bits(adev->gmc.gart_end >>
+						AMDGPU_GPU_PAGE_SHIFT);
+	page_table_base.high_part = upper_32_bits(pt_base);
 	page_table_base.low_part = lower_32_bits(pt_base);
 
 	pa_config->system_aperture.start_addr = (uint64_t)logical_addr_low << 18;
-- 
2.41.0

