Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6107178B02B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 14:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9045010E2B4;
	Mon, 28 Aug 2023 12:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C88210E2B4;
 Mon, 28 Aug 2023 12:29:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H877OtGIRN6/XBIVPeiAmA9L5ONtrhKCJKAOv/BJoT/eV5ATEov/gBZ99dew0CSkw47yCc016WPyq+tAxZ7m5LsJyRh+TRX5dTaOY5drR6OQl1q0E0AXdWbd2W49e46Aeh3oIJzF7l3WW0FzLRZBp/eaLT3z1bJPhDLSFwp864ic70mmfWgfq2JDNQVcrwuy6gfqBnUmpU9nctfpvchOCZDQkZbkgGujTGrozhqKmnvt2/klhqSATtHaYE9mwVnBj70nYVr/xMDsnr1/NnnbV157ic6UlFz8CacCCg3P0TJ5FmeREThoJacSBFQjbPMvy7wliG6JfPjYEnyXEzRvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LS4rCDeDbyQ09V8RTtOjak6NiWRTcqb/gYMKD5CuEq0=;
 b=dvciGoyPExSPHY4N3aCHbI3d2IL+1qZHeXPajle3nabT25pOEnZ8+bmbmMvoPErou5R84c1i/0h1LvDQi2BOfH0Tn++Q8M8F2FK4j5dxLWhqRRi0NYbMJovzIeVwPAvZU0W9t4FaeGwy2WB5CvNTIOafhK53+4+wDvkuGq9sePvuVuOU2aNkgPqCuXgHKIkUnjfRrlXBew1lLwGuBVebeVDRKpGvuMLlGm/e3yoUOXBldOMXudU1Ez8U9xfpiTWB/wP+XGdwx2qGAKwnA52pE2ZScSOulYX+3kWTBGA/+Mxc94djJ1OIdt5qzZygO+8HPFeppVip+sFXDcVX5UFKWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LS4rCDeDbyQ09V8RTtOjak6NiWRTcqb/gYMKD5CuEq0=;
 b=FfDfZQgZrO8GqkdZeAY5LeZ5mZNPflk3S0eqwn2AHty564gPh86ESbw8NpNt9n2vKytaJVMlwozkQCQ4YMyN2WnqKGcc943HBe+fs31K1unTzrUe0284B02c6hyjcSl1kc0mmp49J1hVJ9J+6HoSaVk3TBJlt2OFA4ukutvl+tk=
Received: from DM6PR06CA0071.namprd06.prod.outlook.com (2603:10b6:5:54::48) by
 BN9PR12MB5162.namprd12.prod.outlook.com (2603:10b6:408:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 12:29:15 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:5:54:cafe::de) by DM6PR06CA0071.outlook.office365.com
 (2603:10b6:5:54::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Mon, 28 Aug 2023 12:29:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.82) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Mon, 28 Aug 2023 12:29:14 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 07:29:10 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 4/7] drm/amdgpu: Add suspend function to clear the GPU
 power profile.
Date: Mon, 28 Aug 2023 17:56:11 +0530
Message-ID: <20230828122614.3815122-5-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
References: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|BN9PR12MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f4f839-f50a-478e-6380-08dba7c26423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/Qx9+q3amHV/x1UxiWLeBZoALv5lvFMMk2GvIbEIaIM5kfpQ+IHpVT/olfoLJEpaY3n+qH+OxEY0TGdkkE5MHiPlBYHYqZoV2MXseJkziSBhX9y4a1O9P/4cFn7hrB9NeP4iyYneAoe5YoLjEaan6BVvDO7jatA+FxKUBn2pGyuAXByROPmRSjRhYqdOMPIqCJZ58wQTH8g0c0NAxTA6K802xVEKtegBSRylbdN1OZeGj7GLdyptso8cOSvCf1WenyzcdGQpW+hVg7jvETofYU6PjVZUcNy/eNWI4CGVQq2BmQ7UmRlhCirDILkAnVrFND+FmL6a67Chw3hwYFO5waA6YEDfDZJOzYQglrT9Qfbz9+K27ioapQqZgWXeTB1QbiFg4FBF+ZybL6eIByM1XnCQ/2+ghqmUmPhh/85/lGlNLSikMgsNm71MXd6y08dTVVf0AOBu6ryrHoWJEtubUfu3O22OPPIWKwRR1KnyVG57zvU0fqwHs+QMW/9Ajc1eElWpGU9UWFmCGTYdgodUu/Nwv/FCu/wVTFB2X2F+nbelpIlG5ZxooslzO4Sx/1qLNu9OVsPGSZzAXYUHScDY8Q9fpo8TBbL1LVPpbj1+YhCBcxIdf7fYo/uCJub97nY9PnqQr0aOrse4dODGE9SKGLtHIwk4GU5ESpVxS/5hunukutb4XUu/U/TugOeQ7HE2F8OI44rKxwJD3MbuqHrz1XsbDLuCO6s0fJklgFVWuSqtS57qg2OLw+YFh3soqSXh2LD+WlysDKmNzOl8A1y5Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(186009)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(7696005)(82740400003)(86362001)(40460700003)(16526019)(26005)(1076003)(36756003)(2616005)(426003)(336012)(83380400001)(316002)(36860700001)(5660300002)(110136005)(70206006)(70586007)(54906003)(41300700001)(47076005)(81166007)(2906002)(478600001)(356005)(8676002)(8936002)(15650500001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 12:29:14.7498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f4f839-f50a-478e-6380-08dba7c26423
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5162
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

This patch adds a suspend function that will clear the GPU
power profile before going into suspend state.

v2:
- Add the new suspend function based on review comment.

v3:
- Adressed the review comment.
- Now clearing all the profile in work handler.

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 7 +++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cd3bf641b630..3b70e657b439 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4212,6 +4212,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 
 	amdgpu_ras_suspend(adev);
 
+	amdgpu_workload_profile_suspend(adev);
+
 	amdgpu_device_ip_suspend_phase1(adev);
 
 	if (!adev->in_s0ix)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
index fbe86ee5b8bf..0ba0000b274a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
@@ -197,6 +197,13 @@ void amdgpu_workload_profile_get(struct amdgpu_device *adev,
 	mutex_unlock(&workload->workload_lock);
 }
 
+void amdgpu_workload_profile_suspend(struct amdgpu_device *adev)
+{
+	struct amdgpu_smu_workload *workload = &adev->smu_workload;
+
+	amdgpu_power_profile_clear_all(adev, workload);
+}
+
 void amdgpu_workload_profile_init(struct amdgpu_device *adev)
 {
 	adev->smu_workload.adev = adev;
diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
index 596a962800e9..34b96a5e7b50 100644
--- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
+++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
@@ -52,6 +52,8 @@ void amdgpu_workload_profile_put(struct amdgpu_device *adev,
 void amdgpu_workload_profile_get(struct amdgpu_device *adev,
 				 uint32_t ring_type);
 
+void amdgpu_workload_profile_suspend(struct amdgpu_device *adev);
+
 void amdgpu_workload_profile_init(struct amdgpu_device *adev);
 
 void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
-- 
2.34.1

