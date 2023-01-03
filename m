Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 801C965C989
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD36310E4EB;
	Tue,  3 Jan 2023 22:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2E310E4F1;
 Tue,  3 Jan 2023 22:20:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocLE1KXpWdxvDqU2JvfzZ5YuREYdOnNDlXSE1rIPsQvAa5YRHRgL8+S73h5Taaa3qmLmVQL50R9s1ItJgfjC1j03Od0/JjM+c+jZplKQxw+540ryneA7eqGi1lqutEorFnLysGoJga/aDRRH3W9JsZhVQ2F+pOEM/Itk72cNLZkTUX/gyBVy3k2FJPJlpscf9z+4rw0/NN/WLAWwB5FZQ/Gb9peOoyiEqHuBqMXvR5uuqp/WFQpT/V9lvZAtl1YfGvifFHDKwlMGl7q7DR+5XfGrku2q1ScNKWNyzLOwl+8GoTgyisuFmfxX5X4Ek5LngYnTuM7N+KUVB0OZ1P09Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJ/l7d8aCxDtKk2S7pKUUy8zP3KH/r1mbvB6xAj812Q=;
 b=h6kHkJQQQRO4jk/8aP9yX58MZsK+hlda4LHEaFwQEYLI4BQbvhzou1xbDZ/owYKDiMtFbDHE8v0LJ3ws/0pDBMGsIJpVntALgAiGOWDq0DzpOhDTvZcnN1TXI1uWIaRCXZWD2B1lAbGO+BfQga+nZYCYn4LiA/n724KFMUUxdqGc36KWb/HGwk83z0P2n5klT/t2Hf5alTd7BRHVq/pZklhqzAF4ufPqAQHWg5CqIEzLXgL6YjYtHz/8b7f7e9eebJWW6vQ4+fe3ONIw0qQabBNGrqYgEJeyukNTsrTZV+FZcwaSF463UFTsweO7RE+7b7AeNJWBpweG7WlAsluKpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ/l7d8aCxDtKk2S7pKUUy8zP3KH/r1mbvB6xAj812Q=;
 b=D32HftlgfvpBk93p1w6OZiJ0RPfkm2lKyRe/iHcx+RhjviEzfXYQrIKABilXRTUzrvRCGmbxZWLcs+/JrtRZJGh9jmWX0lkgDDbWrUQZcsv5pCWsLiELLI1hsK05HvgwKBdCtBc56hpY5UALuHW0zCCpIzqf+k+nfSpJXjsy4ww=
Received: from DS7PR03CA0129.namprd03.prod.outlook.com (2603:10b6:5:3b4::14)
 by DM4PR12MB6422.namprd12.prod.outlook.com (2603:10b6:8:b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:59 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::62) by DS7PR03CA0129.outlook.office365.com
 (2603:10b6:5:3b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:59 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:56 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 25/27] drm/amd: Use `amdgpu_ucode_load` helper for SMU
Date: Tue, 3 Jan 2023 16:18:44 -0600
Message-ID: <20230103221852.22813-26-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|DM4PR12MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9cf458-3062-42c7-d4b4-08daedd8a6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2TYgBDmA6caTmvLoA829hRrAtGTZe18trN5bV9YcUr3ecELFEbgBdTLdi5AdZZj/JflvxMupsPct58wi4+4OHRWWqktGtarLHbmONnrRcviTXw9z43jYXy/fU8FCy0aBJ4TNOBoYUDo3ItIslQgDA9eLxqBxb5b/yjUd7Za3e4YLjBBRM0XBVJERu4pbmR/pU9MWFNkK6c5HQylR4QYobt3EINRQYBpHtE5ZpM5gDsWvP8sZfQIAZCl4wxgzFOJwD+wxob6xpklZhnJdnIF9GGBkc9XY7bbJphMI7VHngvOmgn9urWhE9gwCJCX98gatujLY3BpLY3Ki9/NHHhyXWvysOBugE3l1QKvt1sppQoZGvVgBvIRHYYz629YblgiyNsnqCdgP/AsUBO0lX4iMWDvlxUSW+2Bcfkj603yRjL2rYh1ZBLAw1ohNQcOJfqhsmne7qSjw+3mbuQn/VBy6QF2J0tQtGIqojL7Rvjk75+hj30LTXJ3Tz6I6JigCLjEKxQvgdHZjF8cxhD+9JfUW9oip+ZFuaS52aADMSZLucL9WJ7f6wV+gbSkO8pNSDa4eKQFoy9hldzMiK68X41H4iYo1+Nugoa88qVzHrteRiuEtJbQemrQ1ed8FuWyMPXZxagdaKjk8hqU6z4chtLdYv1kb3e/0YL7EUmFNsh7bkEOqOefjAG9WNdVWZmBiewOQS1YmXQeyKSFtPWv9cYzExmcyiRlLwGVY6RlyYIczyuaeWrfs9VhR01WMd2/QmdI28JKmtroUCZyJOBhrbp2oyCiIGwodD9+WEl7c5aPIdw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(16526019)(6666004)(54906003)(316002)(186003)(26005)(7696005)(81166007)(110136005)(4326008)(2616005)(70206006)(336012)(70586007)(1076003)(8676002)(478600001)(8936002)(41300700001)(5660300002)(83380400001)(44832011)(356005)(47076005)(426003)(2906002)(36860700001)(82740400003)(36756003)(40460700003)(86362001)(82310400005)(40480700001)(22166009)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:59.3708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9cf458-3062-42c7-d4b4-08daedd8a6db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6422
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `amdgpu_ucode_load` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * New patch
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 5 +----
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index d4756bd30830..1d693cda5818 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -109,10 +109,7 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
-	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->pm.fw);
+	err = amdgpu_ucode_load(adev, &adev->pm.fw, fw_name);
 	if (err)
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 506a49a4b425..845a7fc83ba8 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -103,10 +103,7 @@ int smu_v13_0_init_microcode(struct smu_context *smu)
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
-	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->pm.fw);
+	err = amdgpu_ucode_load(adev, &adev->pm.fw, fw_name);
 	if (err)
 		goto out;
 
-- 
2.34.1

