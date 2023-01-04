Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCDF65DA7E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEDC10E5AC;
	Wed,  4 Jan 2023 16:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438B810E592;
 Wed,  4 Jan 2023 16:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ao3P3xp8sVApihMK8/luFDByBgDqmPCbD599z6e5+YkWr7UafopMrTEgKzlUNRVjAVjB6e0b/H4EGWt/GkXK8xRSO2/6GTEMa03iscI6VwcAnHDzSIqxR/X+KKsB2LmfJ2u6gcv9Rt8ir1kZvhSfBt2BV2eLLNmYqW+qSEY4A/Nm8g+9KDfAUUn+EfYvyAvug11JCAg9TyEDS+G/2R/J7f317d74oh/LkQ2XQuDz6QIYEXNtkDa+sXEyvMMCwCU8vwHW8jZaNhLYcHx3Tuw9soZgRu03Sd9a7K67jHPaTOp1R4bQ1ZiTWzEFPxdMsSIYUfrauUGzIytt6FyRWjME/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdDo540KYk3IWe+cQKczP4f5TYkjndp0Q8wogcq2XY8=;
 b=DQpYdOJ1drr5f3L42o82aRBA50iWiX3t+kEmlqLHoroCoZ0iUxBOzvBxKzMChZbcj76nyczKqm47KFhDTpO0syQWkphACWfAlJhGw2n7XzEWRwWhsXBgqDs7aFyqI808EB2bVmezqs3pjPek8M+MXmyMMioW78WwXhguIn3R42Z0xcsWAXaHDRGiiVFx4KEDy0lrMFmaDk69ffO/sFMvLw2aWlwVuB8GfpCafINYoG1teUF8gxgjxGQv60OADFpgJfg3/SI4eJphf1q3hSkAeseJa0G1ipaPkiPic3zawMdu14OS/lwyPHwftEreypztB9r0mLg1OSlZoAQjLQDq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdDo540KYk3IWe+cQKczP4f5TYkjndp0Q8wogcq2XY8=;
 b=Za10zzCzeBdvOJFbYUz7LxE52R4gIUv63b3QGZWlgTKKEP+R9DkUcjg9fsVaJUqoowYzaO5DmD/729tqAw3n2xRawUorJFfBPWEKbdP7I3+aJp8mKFeOnc/8gsd3R2+GE20oQnvu00aMMhuHqcFvEg4/TxNnF5X9TSbY9g127Qo=
Received: from BN8PR15CA0011.namprd15.prod.outlook.com (2603:10b6:408:c0::24)
 by MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:38 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:408:c0:cafe::38) by BN8PR15CA0011.outlook.office365.com
 (2603:10b6:408:c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.20 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:37 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:36 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 42/45] drm/amd: Use `amdgpu_ucode_*` helpers for DMCU
Date: Wed, 4 Jan 2023 10:40:31 -0600
Message-ID: <20230104164042.30271-43-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 398b027a-dfeb-4c4b-3e18-08daee72f7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yWnT2jbKcqSlPgdFu9Bl9qTbTfESE6acqlPdKoRwRNbgKD3u6uDsUNBUu8Eu4AT+7BspaAAEcND0Otj8Y2x7Sx20slc6IUbAtKMYp2hITksbW0JiijFVjsaL6tnOeI+/iv9qVhg7pxzC+O8ws5mrS0oQhw8+5/FxC1cJvoAOuQkK7Z+1zTUrf+4omfGYGKcgF4uyogkl/IXh5jxdqdFetTngE1Rc+LSDxNxoMXit9U5NqOeC70AeKMPuGMCz6K+suSH/YMB+hyUUnVfZI8rn18ZIQx+nvVJTl4K3msUAsNo2xabIXs4BSmYtdP9dtVMKYYODNJxU5HDmWSlF3EFg3aL4aMfpbsZB4K+rOWNePLV44YT1Z/BGmG6ROtvg432da+LJ1pa652RyU+Xe8uvcopyRP9eOT/l0tehD4Ucylxg6PeEsbiG38SY4OfsMfKvg6vHDkN9pln2owowY0n9hk+GPLMylvIB93nbcZdeZNMWh6cM69PZkpboSlJwL0eUA4KzXHT8BZljQZ61mTsxejAxfbuCKy2NHxGHmn+8J1f/q5npNiAhMTqwaHBdRWWFFdhj0pEc2VrrhBrmPUKG4sqIHw4ST6nXWLDvBy/xhbGH8DEQVof4Jw2AZ3Pyd20tnjySh2wpRDKWICFbhKGKlVs3PW1QHcziPBXsIUb4QIzejT2sffrKfDPa10Sw//x91YA3N8GmaArFeYvvW5fXUPVP14wnAtwP7KO8W8+FZ3wA4oyAgeF3VLHTf1Z0jBDKr
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(2616005)(426003)(36860700001)(336012)(83380400001)(47076005)(40480700001)(1076003)(86362001)(40460700003)(82310400005)(81166007)(36756003)(82740400003)(356005)(70206006)(2906002)(44832011)(110136005)(54906003)(41300700001)(5660300002)(4326008)(70586007)(8676002)(8936002)(316002)(26005)(186003)(478600001)(16526019)(6666004)(7696005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:37.9080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 398b027a-dfeb-4c4b-3e18-08daee72f7ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Lazar Lijo <Lijo.Lazar@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>,
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3908d715b90b..19c365283d91 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1881,20 +1881,13 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
 		return 0;
 	}
 
-	r = request_firmware_direct(&adev->dm.fw_dmcu, fw_name_dmcu, adev->dev);
-	if (r == -ENOENT) {
+	r = amdgpu_ucode_request(adev, &adev->dm.fw_dmcu, fw_name_dmcu);
+	if (r == -ENODEV) {
 		/* DMCU firmware is not necessary, so don't raise a fuss if it's missing */
 		DRM_DEBUG_KMS("dm: DMCU firmware not found\n");
 		adev->dm.fw_dmcu = NULL;
 		return 0;
 	}
-	if (r) {
-		dev_err(adev->dev, "amdgpu_dm: Can't load firmware \"%s\"\n",
-			fw_name_dmcu);
-		return r;
-	}
-
-	r = amdgpu_ucode_validate(adev->dm.fw_dmcu);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_dm: Can't validate firmware \"%s\"\n",
 			fw_name_dmcu);
-- 
2.34.1

