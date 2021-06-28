Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B673B5A26
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4F56E2BC;
	Mon, 28 Jun 2021 07:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C186E2B8;
 Mon, 28 Jun 2021 07:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUPTra7mY5g576b9n7q2NOPQKb/3DgHsZI1NP5ObNd/s741LzcrqxunBdWLazCJS9SmrbXtZbMnTGNStmIyPShltcA9mbDLugIkoa/RaptPULjtXGygUyIfv5Y+vI6XkEMvl5EIDH/Yh6jAmZWJK29MGF+zPrVGDqGLIvAXsoq3rCQuU3y+Egfku3mIXfiWnDE2Nif6dGOnnHrcaETD/V09jz+BrnbKyJ3Sg0sIEq59MrG/rCPLIQ+vkflCO4OZA5Lq297fDNqKktO5pfoHBicVIGWXZhT6wVyoKguGp2c29BXumWn2IHQR/P4ncQATi3RlIC/tV3a/XCOTTn14GyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9MthPqgelYcSJ89FybXUeSq2AWTfj3bsegm14Q7REc=;
 b=JDrrW/BBPrl9TdiMEEtuNniNhXudJOVwsp0UK4fBnVwD7OrApBQa6Nju4xQnZWN1zhWE/eU5Ab1Dz/g4fW6sVB3ipnC86HCP+/d+PRvN5i4/WS+3I90KErcNSe3uVunhPI9yur1hdnvDY6LRrfoEJ/PnK57x7442oY0p/OXYd6di6+qpv8tTW6d9OSHRGDEar6XJUO7ltbO83apq9sx+jClBHoLEN563Tin3CXkBaW8H5NugIT64lGpqe1R9a3a/pbReAElTvs3qAH5tVPElXmGl98omScuASY9kPc3xUiMDT8vdjqTIw2dqJJU54weoTtal2rzqZ4s+ll/xBcuXSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9MthPqgelYcSJ89FybXUeSq2AWTfj3bsegm14Q7REc=;
 b=bdnWQ1SUClYzlaLFJJutkli5FkQ76x77SLwxkLq2foUCQB3Y6W20ReMxaMQYqVRONh5yF5LOcewFSt4mV8lf2pff4NFsSTsQ/KTqzmQ2zACzpljCKOGipQthDRvW8uejmUuKr3Jh2DO3I27ldAK5wfxsnC8W9TVLjSzsADstUzk=
Received: from BN6PR16CA0034.namprd16.prod.outlook.com (2603:10b6:405:14::20)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 07:55:04 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::18) by BN6PR16CA0034.outlook.office365.com
 (2603:10b6:405:14::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Mon, 28 Jun 2021 07:55:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 07:55:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 02:55:00 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <ray.huang@amd.com>,
 <Xiaomeng.Hou@amd.com>, <aaron.liu@amd.com>
Subject: [PATCH] drm/amd/pm: skip PrepareMp1ForUnload message in s0ix
Date: Mon, 28 Jun 2021 13:24:40 +0530
Message-ID: <20210628075440.3692236-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8e25765-e013-41f3-c078-08d93a0a0a2b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4898ECFB1DE6C3BC28C49A9A9A039@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mEiJ8Q2DRX6OhhA9gqzE4ibGXxhgRPyYVFXYjW9ucrm39RGHOUFVUW2VHPfWvBydwdfIqslppUuHgVWXI3bDaJzQivlVCm30ChxDw00rdCiY0RmQmoPyGBouZYQIAshZabsoeRVM9Ixzqxn04KIUCeFe9mIhwwTVaSbIDMWVkhfYK+qp+j2v9yVUINcRGs5txpz9S1292vCQsfc+vAGn7GXq8wvqGhRaKpNR3BSsw3grTFLP9Yc+z+Wim9pZJ84bAF9Dc/aZRKQD0h/jGwHV37Gso3mJ28p0ShmRnPbjeJRatpHlg4jQvcYVCacowlyUmGY3a+E9cF0/MwFH1yTJD9InL9+HhlCKLnJTqwukeaafxX2UGXXXzZCVAcUcBswWsUzQXGpbfQvTX9BrvutpulXmBngSUF/4X2ZcQlEv+v/b4aWaZBx4oMmbIFdj4/jGfui1b2vAOiEfpoUgNixi2ijHntDxjiM1C7ouJgSbv15t4smwVi6sB/1AqufoQH10TuA9y3oOLDpPmH5aTRvKfpFkB6CXty8jrHo1gwZc9fBCjTtEPcQuk6tu/0Npk9qaMEloiNWHn79aN+RKwbfrOcoKQKZjVD1Mr0AZ8bUoeXOVyr5cBlkH8MdGNsXGJCQYhTT1c8Ggt4kEGFrKsYULKkaJahLLdbRV0EkWNzSmBAolxYFiDs2t8Rpw0bp07ctprZHfrPxPD0uS6tSTu3Kur37O9s1OZm/BTjUAc0M5S3GZeslHXzVWR2f032zLKEwo6AVkWc1TVRE0ylQIgEKBJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966006)(36840700001)(36756003)(82740400003)(81166007)(356005)(5660300002)(83380400001)(47076005)(26005)(70586007)(186003)(16526019)(82310400003)(70206006)(7696005)(86362001)(36860700001)(4326008)(1076003)(2616005)(8676002)(478600001)(6666004)(110136005)(54906003)(2906002)(8936002)(316002)(426003)(19627235002)(15650500001)(6636002)(336012)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 07:55:04.3799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e25765-e013-41f3-c078-08d93a0a0a2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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
Cc: Shyam
 Sundar S K <Shyam-sundar.S-k@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation around PrepareMp1ForUnload message says that
anything sent to SMU after this command would be stalled as the
PMFW would not be in a state to take further job requests.

Technically this is right in case of S3 scenario. But, this might
not be the case during s0ix as the PMC driver would be the last
to send the SMU on the OS_HINT. If SMU gets a PrepareMp1ForUnload
message before the OS_HINT, this would stall the entire S0ix process.

Results show that, this message to SMU is not required during S0ix
and hence skip it.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Acked-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
index 7664334d8144..18a1ffdca227 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
@@ -189,10 +189,11 @@ static int yellow_carp_init_smc_tables(struct smu_context *smu)
 static int yellow_carp_system_features_control(struct smu_context *smu, bool en)
 {
 	struct smu_feature *feature = &smu->smu_feature;
+	struct amdgpu_device *adev = smu->adev;
 	uint32_t feature_mask[2];
 	int ret = 0;
 
-	if (!en)
+	if (!en && !adev->in_s0ix)
 		ret = smu_cmn_send_smc_msg(smu, SMU_MSG_PrepareMp1ForUnload, NULL);
 
 	bitmap_zero(feature->enabled, feature->feature_num);
-- 
2.25.1

