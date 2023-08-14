Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D85277B2A1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B62E10E134;
	Mon, 14 Aug 2023 07:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B1A10E134;
 Mon, 14 Aug 2023 07:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2PrKrZq7kawOe82BG57zTtV5G1WDmS1jX0XGoLP53UNoHTdKDPF1QDxHTRUhYX24kL2URMTxZjNB0Nb1vZLdfZQ7K80JnVnWJLHs21lf816P35wgFfge0+KqLTKDilhh6GMy6DIgWv/vFeWE/8UXkmMdSEIyVBMbJQwhHZ1OSmH/NQq4CUdbflTctpYHgHTXLjiU1YdhjB4y8aVecftN0sCDjP57/qaoZjJAZu+kYulyHUnnQdi4SXmwp41LR3Jx8PdYTqk1SxvnUcinoJ3FL1Q5jy1FVp0aZ4wQlWfe0OHMdAbwS5twWV5XNI0DbM+W3ZSyK3uYABQFIyRKiAAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpcUuG3d+eURPz4+/B67XaE+lKMluvbEUgqJqvaY12Y=;
 b=V8KGfn5KLiVIPHBztJSDZKcbYwRbyMY5D8xIgiPyKam1j2L1LJHh3zwsaaIuCAHWm4jRFAQQo5dVHQk9VbV5J9iIxFO29TJTw7ceVnoWJsOaC/tgVSEEDye/EHNW8gohdSW5GiI6MKx215yUyTJxld7gPKnXCqBo9Qbs86SMd7JB+ANfh3eeIowolyonYBchiqTrZ4v5f9ENWdChPeJm+HYiXQu7DegQx9c0BWiRxmjBsqq1p2VoSl/38oYUs8pENuW+HJCEu9JL232TURjhl4Nuu58CJCKAXwKhqm3AEIv+uXgf+Tfmw6Mts45RVkfwREmpxdST9ttNMB2fM6uHIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpcUuG3d+eURPz4+/B67XaE+lKMluvbEUgqJqvaY12Y=;
 b=HtSjKWlwJslFhcO7EBWhRndvf/EV2sip+QHIfRY6l/OEglhWIvw5Ue5gxipL6V/sF1G7qhtaCZnHaUyWvMulvBqNsrzS1kAj9JI2RMDLB8hlH0KyfZQILPm/mUUjzXhlFsqp1Jq/AK8W0DP0pF8PzBxj7vxWWINI5NCdj3q7Fzk=
Received: from CYZPR11CA0019.namprd11.prod.outlook.com (2603:10b6:930:8d::19)
 by DM6PR12MB4332.namprd12.prod.outlook.com (2603:10b6:5:21e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:36:41 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:8d:cafe::16) by CYZPR11CA0019.outlook.office365.com
 (2603:10b6:930:8d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 07:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 07:36:41 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 02:36:37 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] Revert "drm/amd/amdgpu: switch on/off vcn power profile
 mode"
Date: Mon, 14 Aug 2023 13:04:38 +0530
Message-ID: <20230814073438.10682-4-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814073438.10682-1-Arvind.Yadav@amd.com>
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|DM6PR12MB4332:EE_
X-MS-Office365-Filtering-Correlation-Id: 64df0bf8-f9b5-4a5e-f7db-08db9c9933bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Csa+q3moajfueVAcbramvbPt0GYmnRvwMoYdy/lYUS/t9Yg3KAlFwx2Jc0o3zApImJXfEfrmoXy2oGsEf794yn5t6+YMEql2lAPoS7xs4HgAiM+xPj4wsQFxC9jLSPNT0R9Kc4aKNkIBrT+tRdgZkh1fy5UnDwcJCY6MSvmIQPEdgzyyXdSMmCrBntDs4RRS2Zzu9KJ50hWqSDleQ2fAiXDbKuz51hce7aqEOpb0nVrNge2lAZ+dmna8laTlyHbesW/7ovFE0fOjHsMfo3X3Jut8MgxtuYqwtw5OnF3AmwCiEpeSYsxPmCYK09QcPyGrM6RiUP0a1I5I6T+X5OH0vqK4WPI9hRW2alcu+EyayvJYB5DMLdTrOlBgfTr/74CKB7tUmW8XWkeTLDUxnB/r2EkMmIRYPCxhP9dJkD8jqQs+eMMvxXOqf499VYgkg5HgMZtCjgWdgc0p2WR5yi8I2dHCL9QWdv8nfaSMhc3Nh1BmXRmy/XCkH8l+xd8CdtlyJnprPtkBSsYfESKpaxLgfZwKlONheTw5d8K6V8qm/beT/STkj0OKSmfvlo4247tUGji+2yR0Aa5/GI2PIP5Q2nxNUIjq2vJsYVm28L1baNa+DJdy8216GYaemUMPFZbrqnY7SIVIr7UmM068WXuKYfhu49etTBlUhz5AY3LtTY9dSJV1isytTgJF+W5MVnfC+hYQS6a3eo++uezFPaCqppssMEj2qZRFXeKQP5WmDPhD5j/Sd3lOq3XCnn/weeW+a4jY1OIhXs8b5h3VlkSAxQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(1800799006)(186006)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(336012)(16526019)(1076003)(26005)(41300700001)(8936002)(70586007)(70206006)(316002)(8676002)(36860700001)(83380400001)(426003)(47076005)(2616005)(7696005)(81166007)(40460700003)(478600001)(40480700001)(110136005)(54906003)(36756003)(86362001)(4326008)(82740400003)(356005)(5660300002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:36:41.3914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64df0bf8-f9b5-4a5e-f7db-08db9c9933bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4332
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
Cc: Christian Koenig <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 5ce71f59bb9bd3d8a09b96afdbc92975cb6dc303.

Reason for revert: New amdgpu_smu* api is added to switch
on/off profile mode. These new api will allow to change the
GPU power profile based on a submitted job.

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

