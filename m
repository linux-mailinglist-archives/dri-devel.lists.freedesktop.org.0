Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6E965F1C7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2A310E77B;
	Thu,  5 Jan 2023 17:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33A410E76E;
 Thu,  5 Jan 2023 17:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7pwtlZs3npGX3rYKuepY6MvPo4xfeQcX3JBx+WP/pNvoRCHOXnymuw0rdeG2sisnsPDcZKeE7Ftj6ougBhClPJbCkOdPWem5A6SeMyXnm75w5ijbxUQR6tQpobJYqJkcaY40HiZn75y3Nmbtj++SwJryCaGe2kNsxr/8JCD8hlo0to9LF9wI7zHsi+0/rbHxuawB/3LlUMLBW+2IMhm38cwxm+qd3W7QiJfPWaf1YXFtBDEvw9FaBrBTzPFCwKdrJKs7hHhO2DEWP0R/IcLt88CeK6TjZSLA5HH5n4ZvuT1crmcsMZQ0sOrbRuA+ctgIOcS+uA6vQIcYLieD2fV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDTeGkERtYw9vQ5FVXhBs8l0EiXLNfoEnCUEEIWy724=;
 b=XMtW7iMfNoUvW7Nsc6SOiKrFoqhsTFsDkMVjlG8ELlyFwEOpfW7+VhKKmSBqbiygeoWtJGtt9yfVlfgLfCgodrJXDLn6etuhBEcISK5ARCa97UnfDzjOME97W5QwnnSB9v/kRvBvYqGAxL7w50S8hrOlv41+Ymhl9IyRoWLgyR5t09CLMGIBguOg6D/tbKQ3qhRUMv/PUZBmg8qVHiVuTKGdFkRCH/5uS90WsmwAoIoW9xo/jD5TPIDDJS3F1DBWSryTCf7nhsYKPJn56NxZPIeYlL9nqSKG5VrPGeggBGEsLaIyHla8Cz0JpeDV6rt2gO9/TvMZM1wQiQhbfAWmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDTeGkERtYw9vQ5FVXhBs8l0EiXLNfoEnCUEEIWy724=;
 b=B6BGqGAv6wmi0loHHTQs4id1otV37ikm481ABCpAE4gnSc5OWDYfV8YaOz/Rk55RMKPwSv0vdqSA5HAjt6ImLTnfJ37qMKsB5XQjqKmOx9kypY+0pMrB2vXsuPHu6qTJcZAbG+Xms7jBNW6dE9rbMufRItY3RK7u7WfoXuVFEpo=
Received: from BN0PR04CA0107.namprd04.prod.outlook.com (2603:10b6:408:ec::22)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:08 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::dd) by BN0PR04CA0107.outlook.office365.com
 (2603:10b6:408:ec::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:07 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:05 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 08/45] drm/amd: Make SDMA firmware load failures less noisy.
Date: Thu, 5 Jan 2023 11:00:54 -0600
Message-ID: <20230105170138.717-9-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105170138.717-1-mario.limonciello@amd.com>
References: <20230105170138.717-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c89f7f-1ab3-4227-29c3-08daef3e93f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sHwG2dGnusJVJDfB0ZU6c1mZtZn11UgOQ6ahDepuvkT9js0JRvvxVJGg0m5wzxiXR5vRQKO8NWJ/TVLgNe4puCvGrCJs1RVMx/Vz2fMp+N0Fejdn8WMTJsMj8OkEob8TKAI8BL1m7nzyTgsrNoUvSuJtbY4ML9On1dOqQuklGAk9tA+EeSE9vuTzMT9heGYfantYOKRnlqrKyoqZ/LPi2ZpXcJdfK4Ft2wK1YR5iM5E7MiWJkwciHDDFfQHFJgLeCx9CYp7JvRH6LoIGQTZgq4/85igQQhsyWvoR1vY9YpoPDLrtdQ4ZPeMQGLO+M0lWDeuyVPo8AAymQS/K670Z8DcDQLqPFOSiJ4bvAEt7i8xem15AoN33oD2xFooWOz1x1uleGCLSMBODXH9+zY0uLvnEeHfrI7hqwAVOagEEyxcKpCAJi+W9hc5me5T2aSokRyplEVY8L5mXC3gX9AnizQv3jC/pXnw5knQ05HTSOthvbm40I6HbN6GIbQ0XB0q5uQ1UCMblNq2G+4SBjjVBh/rioX9ch7EgyDwgU9yHk3JCnMU89LntarDTsvTrVo9emoLNEGJ+6t6IoqN1mecXT4VzUmlz7ByXaaUj7CRz84bED6uzzRJWZ/gAht6Cb4Lld8hdpwHqK5BHzxTkhmxaeVPVaZI+7YJ76+A1CC9qWbePQCf8LFrbe4qXXY8HQaaxfEWOyZ7GrJN1K5LLhYxu+YdhdfVoqf4H8sYMNCYHD/s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(110136005)(16526019)(478600001)(44832011)(82740400003)(40480700001)(40460700003)(36756003)(5660300002)(2616005)(1076003)(8936002)(70586007)(70206006)(47076005)(4326008)(41300700001)(426003)(356005)(8676002)(6666004)(81166007)(316002)(26005)(82310400005)(7696005)(336012)(86362001)(54906003)(83380400001)(2906002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:07.0569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c89f7f-1ab3-4227-29c3-08daef3e93f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Lijo
 Lazar <lijo.lazar@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When firmware is missing we get failures at every step.
```
[    3.855086] amdgpu 0000:04:00.0: Direct firmware load for amdgpu/green_sardine_sdma.bin failed with error -2
[    3.855087] [drm:amdgpu_sdma_init_microcode [amdgpu]] *ERROR* SDMA: Failed to init firmware "amdgpu/green_sardine_sdma.bin"
[    3.855398] [drm:sdma_v4_0_early_init [amdgpu]] *ERROR* Failed to load sdma firmware!
```
Realistically we don't need all of these, a user can tell from the first one
that request_firmware emitted what happened. Drop the others.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 95e9450f3348..0e1e2521fe25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -280,10 +280,8 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 	}
 
 out:
-	if (err) {
-		DRM_ERROR("SDMA: Failed to init firmware \"%s\"\n", fw_name);
+	if (err)
 		amdgpu_sdma_destroy_inst_ctx(adev, duplicate);
-	}
 	return err;
 }
 
-- 
2.34.1

