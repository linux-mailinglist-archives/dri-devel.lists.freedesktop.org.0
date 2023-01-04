Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AC565DA80
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B348D10E5A8;
	Wed,  4 Jan 2023 16:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2E910E58E;
 Wed,  4 Jan 2023 16:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djFgd7y2AARN9HVDt5l/W54WRcyIVwwWQ//VWz3ISRiSg+itUEMclRgcSuuZ7zdttbP8DnyWJGpUHGP3aIcSE6CTgxb8kE6auIDORGQSnDIDaawoJ/X31KQRajIoQQ+Fny4h+ILyIZNJKWLKre7j5gGS0nLzGSHbwrEl1Cf1/M8FwHnIqEHmdrKdITUfQvfZOMunxs5WxyN3nTfMoHUzyBVAdzHiO/fYeDWYbK4pLJ3OtuP5tspZJKfx61wCfL11OF0H2Pkt+3WOHpK0WPsso3Uw27Dspn8+uOiSDY9IikXuYSzOQa1MOVlPRUqXGngbarjtq6/e3cGsoAUI7pmisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gp7J9nNm3RvgmHR7oUD3X33XjV4/w6pE4A+M/UDhag=;
 b=DLn8rlnDv51WHKNTmPQCq5m9YP+X78w+gZBJQJm5Qs56qvnKR66zm7KgzSmaQmmG37WdSLCOjWWlvOTkvqowh3DnqrXEoEV/N+0+TrHbwJMytlsDiyRF4/uhKFsy+YDOKaaAwMsWLgD1A2x/n8FIVt5DGSVO+kq8IGIisPLQPFpmkoBQ6OrgxPYKv+X4+RoGQGl0YhuWZPio0vmNSnepd2iKhXvcpigP60D8EUBNiQqa5K5TLVPRSivQi5hH+dH0yHcRnsrIvquagEOAj7Ieha+U9HaSUUj7DWBE8IaUXr76N8gHJGPP6tNwRTYp95ClMaAN+GaNmcWf8DJobodcIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gp7J9nNm3RvgmHR7oUD3X33XjV4/w6pE4A+M/UDhag=;
 b=2lnHRI7j0wRbtdmqNEAeymMyLgQMNDZIx6ukWW2Wf3xOfqUlBmkDfOO7kL6TbAFBgyM/tvR8X0xDJJDf6LDLnWxr+k/6z+iEZ+Dg8jVVDsGTqWDpGxvvleZgrd3pNfXZBvWgPrpjQjmQ8s21kZxlNSCZZZlEBOIJeZeQ70hrAhI=
Received: from MN2PR14CA0019.namprd14.prod.outlook.com (2603:10b6:208:23e::24)
 by CH3PR12MB8212.namprd12.prod.outlook.com (2603:10b6:610:120::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:32 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::cf) by MN2PR14CA0019.outlook.office365.com
 (2603:10b6:208:23e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:32 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:31 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 37/45] drm/amd: Use `amdgpu_ucode_*` helpers for SDMA on CIK
Date: Wed, 4 Jan 2023 10:40:26 -0600
Message-ID: <20230104164042.30271-38-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104164042.30271-1-mario.limonciello@amd.com>
References: <20230104164042.30271-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|CH3PR12MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: af8569cd-2203-4756-7139-08daee72f488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KDXHL5rEKjjDEhguorjikRIeUszPJ986SLpQ87yjEIjyiDOSP2pBoZgpdFxpHj5A69urpIvKGb3HSYYTVLpmrcr3T8SNYXUD4a4ZIvHUV/TLey0SSyB9PqRcsIwQRWgaPYjb8KA37fvgqEox9S3zRNuJ65Ep1UMDnUHn2N82LOQzS1GaB9HAvEbLyM50WGweYUz66p2yz3TfQmSeGO53p1rB+7966eiROgnEQsC7QrBD4AZO+cTI95+K1y63zh2o67TZ1GlZN9PdvN4fE5/SBQZH09gQI/tEetVS7STzSs84zQKyMTPI87JJ/vEqAvC6lhtbZsBsWUeOMzIyvIP388Rj2EOUvJwq8/U9fWWDfn3EgGZ7TRWLKdjHi8XV+ml1cAf2SSGdmi0floFUupNh7lX3XcKoBvAplU6kSd/wnjW7hV/hAEzIlXXwQirFSkQPDP4dMEDbNO5/Hpmz3GAxl2mIL7AVyCSngSm6cbZ/PYTmqWjB+1Dqsqn+79mxU1sgW6jUjFlqE+VA75jSoX2Ji7z/WTHzxH3VpC0JmntD8n+jKaDW8DKToKJPkiDorfE2nidWkhjHkHoA/1CJARzlTq1fq/3DDpTX1Cm5cJOOCqPKWUIQJPFS7J3qUfaXe2hUtDShrFYayCZVqDZcYY+ms3TcMNn0P9lVvFp0faaMmPHTEJ9li4a/jOUbAX2QIFit0Qxz6YbbqzwD5CiiBT87eJrBuqM6iktI8sIE0YiXzJJ3IK3RW323QJBTLy2CWpfbJDEY26GOf8aJRUsX3O+GtA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(40470700004)(46966006)(36840700001)(316002)(356005)(2616005)(186003)(26005)(478600001)(81166007)(40480700001)(16526019)(36756003)(7696005)(40460700003)(110136005)(86362001)(82310400005)(5660300002)(54906003)(2906002)(83380400001)(44832011)(336012)(41300700001)(8936002)(6666004)(1076003)(36860700001)(82740400003)(47076005)(4326008)(8676002)(70586007)(70206006)(426003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:32.2142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af8569cd-2203-4756-7139-08daee72f488
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8212
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
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index cbca9866645c..25d7b80b0fcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -73,10 +73,9 @@ u32 amdgpu_cik_gpu_check_soft_reset(struct amdgpu_device *adev);
 static void cik_sdma_free_microcode(struct amdgpu_device *adev)
 {
 	int i;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-			release_firmware(adev->sdma.instance[i].fw);
-			adev->sdma.instance[i].fw = NULL;
-	}
+
+	for (i = 0; i < adev->sdma.num_instances; i++)
+		amdgpu_ucode_release(adev->sdma.instance[i].fw);
 }
 
 /*
@@ -137,18 +136,15 @@ static int cik_sdma_init_microcode(struct amdgpu_device *adev)
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
 		else
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma1.bin", chip_name);
-		err = request_firmware(&adev->sdma.instance[i].fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->sdma.instance[i].fw, fw_name);
 		if (err)
 			goto out;
-		err = amdgpu_ucode_validate(adev->sdma.instance[i].fw);
 	}
 out:
 	if (err) {
 		pr_err("cik_sdma: Failed to load firmware \"%s\"\n", fw_name);
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			release_firmware(adev->sdma.instance[i].fw);
-			adev->sdma.instance[i].fw = NULL;
-		}
+		for (i = 0; i < adev->sdma.num_instances; i++)
+			amdgpu_ucode_release(adev->sdma.instance[i].fw);
 	}
 	return err;
 }
-- 
2.34.1

