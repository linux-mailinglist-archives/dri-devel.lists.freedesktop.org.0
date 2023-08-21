Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA997823FB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE1D10E1F3;
	Mon, 21 Aug 2023 06:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0100410E1F3;
 Mon, 21 Aug 2023 06:49:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhY3PJCyRZt43f2YwlgDKLuZRRSTStaabqT66sURyxeVzq3yFkYj3ImdjCLQG3f4prndQQuzHVnlFZE3SvFHk4YkpYxUfM0n20YQcd3btDBOzvonpfUcA6x6Vxsg/AKf2mnjX1buf0uzxZYcCchbIe4/b1shqXuI29i3f2k/89GrsCTmvu9kHjPdGRSE03i7GDqwoxCeJrmFH+0zxDhKpXU1g0tZOlr32HoqBkAGcvAkqWj4c+1ozrPd8SEe067h1xLbmQ2VeSd6Lx6bwog+lobXttbCzDz4BY2y0GJ5qpiF6w07f4DDKHsarnb7KhjWJqCAB87Q9G17bs3anf5osg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbWPjoZywievjNFRTdg2CT3B0bWDMu/+7Qilcj03Ups=;
 b=gFbsDatZq9GFuUInyf8tqfMNJRCTh8+cV8l0tQNCeal6ksXb2M0X132N2VXBQnVS37fu3EC38T+u6r68GGP7XLLVOPxEsX2aI1Qi5jjulY3WdoSdI4BbUQ723yUKKHLIPZXFdthXyka3Y6tbOjUFc+sTmOc5VUJw1NvOfUmtn5oLf4c1rORpC1DbKx1Vcsl+Q8PiONnv0M5zt8sZ10xTyToR+Ps4nVpL1gc83vssKsYDQgR8Z+EppyMwBw/CyUrfrfL/rbbCieUa5ylqKLvJz86A48mwHOF/nP9xz3wQpE+xrO12Dfzso2tRbo6WDQ/Ew1D9mjshrRTKydJqC5xlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbWPjoZywievjNFRTdg2CT3B0bWDMu/+7Qilcj03Ups=;
 b=FknJhltN9+Sml1d3uYgNVUnHc/aomzRgO/lZ8RKLY8rNNluOmS5pdvhWsA8xWELz8naAAp99u8Qm0q70dZqqKSN1T5I40CzDi933w7aoRqc0xXb/FCysVsHYu3q3235WzIBrld5V32+uczNT9+nVzSi6YXJeNwW8ZQVFR/GYeus=
Received: from SA9P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::27)
 by MW6PR12MB8664.namprd12.prod.outlook.com (2603:10b6:303:23c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 06:49:25 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:26:cafe::8c) by SA9P223CA0022.outlook.office365.com
 (2603:10b6:806:26::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 06:49:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Mon, 21 Aug 2023 06:49:24 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 01:49:20 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 7/7] Revert "drm/amd/amdgpu: switch on/off vcn power
 profile mode"
Date: Mon, 21 Aug 2023 12:17:59 +0530
Message-ID: <20230821064759.94223-8-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821064759.94223-1-Arvind.Yadav@amd.com>
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|MW6PR12MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a435017-f044-47c6-9542-08dba212c1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D7/xmDShAEul+A1gFNhhB/C6Izpr8Vj4pks5SYhc60qxase2RiN8o+S554uimNuW7BNuRswyU9Dj5RYQnRyVV1PcKaf+xHIeuJXcDY60eMeWr9d4+lHlh+LjikMqydORLTjpoInCBqt7jlc1rLa7OIXU1WNdtcmkF+Y+UL+TIYpiHBj6rVLPLtIW0zcjSLBa+Q/I3REVmYsVzvMNCSxM7O6zyFUR6T8tNEhOd1oAnTO+VltOsqgikieWhg6LGVRAFs0k0ak2AYRLXIXFRaQrxmsy2+r5kC/1M5NqSyRhkPpMtx2uOJzsMWWvbgEUNxl+9fvE0FRRXm+oY2u7c1Y/iufWJVeY3ZU62/aSRVSFIOxXu1m6RNdzOPfpZiI16GlPj1VAgZ5VYqyT5N7774q6aIM7mECfK63GLZLYDAxXtJjDqCs6GBXDYfH/S2ybl3pwqVID77fq7eoeqSGFPaCt5FAPTwy0griY1iYxmupeSGG7IulOS567cask+Jwzqe0crhRKpT5ts5g1A7LwGkj4/pM0ACVtEYUx15h8t+QVZbNsahwhdsEHLdTibro//DLaWjTFTkia3UymUOjv+DL+IWpsde85tyftKSfcNj7qZxWEoQ7lDOkvbCKCqC7p/bpebge6615RB8r7t/WkcRm1obZ+TIla8pzp7b6j4LawDf1CfZj744isU1u85skADofXMwcsk2KFUTB0UZ6usXIWxZUv7V7T3tlXHlDaYmG+GFTfvcitZ3Yqe+YW3hxWiKrr1cAO34MTMaWCfFVEXdhF6g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(186009)(1800799009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(1076003)(2616005)(336012)(426003)(16526019)(26005)(47076005)(81166007)(356005)(82740400003)(86362001)(36756003)(40480700001)(36860700001)(40460700003)(83380400001)(41300700001)(316002)(8936002)(8676002)(110136005)(70206006)(70586007)(54906003)(2906002)(5660300002)(4326008)(6666004)(7696005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:49:24.7936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a435017-f044-47c6-9542-08dba212c1db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8664
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 5ce71f59bb9bd3d8a09b96afdbc92975cb6dc303.

Reason for revert: New  amdgpu_workload_profile* api is added
to switch on/off profile mode. These new api will allow to
change the GPU power profile based on a submitted job.

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 2d94f1b63bd6..70777fcfa626 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -363,7 +363,6 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
 		container_of(work, struct amdgpu_device, vcn.idle_work.work);
 	unsigned int fences = 0, fence[AMDGPU_MAX_VCN_INSTANCES] = {0};
 	unsigned int i, j;
-	int r = 0;
 
 	for (j = 0; j < adev->vcn.num_vcn_inst; ++j) {
 		if (adev->vcn.harvest_config & (1 << j))
@@ -392,10 +391,6 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
 	if (!fences && !atomic_read(&adev->vcn.total_submission_cnt)) {
 		amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCN,
 		       AMD_PG_STATE_GATE);
-		r = amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWER_PROFILE_VIDEO,
-				false);
-		if (r)
-			dev_warn(adev->dev, "(%d) failed to disable video power profile mode\n", r);
 	} else {
 		schedule_delayed_work(&adev->vcn.idle_work, VCN_IDLE_TIMEOUT);
 	}
@@ -404,16 +399,11 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
 void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
 {
 	struct amdgpu_device *adev = ring->adev;
-	int r = 0;
 
 	atomic_inc(&adev->vcn.total_submission_cnt);
 
-	if (!cancel_delayed_work_sync(&adev->vcn.idle_work)) {
-		r = amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWER_PROFILE_VIDEO,
-				true);
-		if (r)
-			dev_warn(adev->dev, "(%d) failed to switch to video power profile mode\n", r);
-	}
+	if (!cancel_delayed_work_sync(&adev->vcn.idle_work))
+		amdgpu_gfx_off_ctrl(adev, false);
 
 	mutex_lock(&adev->vcn.vcn_pg_lock);
 	amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCN,
-- 
2.34.1

