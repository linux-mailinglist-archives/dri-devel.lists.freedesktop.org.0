Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3FB65F207
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD85410E7C9;
	Thu,  5 Jan 2023 17:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FED610E797;
 Thu,  5 Jan 2023 17:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULfTRsE1IYgUgRxAZlKUVjkMiZcC6lBvRx+wf0aoDfgKd7kW/Ue4W6eN/7b3wQzXvxlmA6bxm0M6ZQCsmrWtC2obkN1kmykC0BdYNkCaIyq4nTNcgAPPA7iQn4xOiujs9uqnkZ+dabPtKwNS0Ogf9+fYpM+IHfdOeV2ktJedDqGF+KzFkvxss/QPyX4xSOE4XKarv6PF68RnsuKQZVceCFcAdn/71lwH/NIt58GH9wdaGycTTUomnaS5RPs62lXfw7HaJeECmjvuPapb9aJG/OtOKoMxbOGNRttG+67sSDv+HC6MMR0Ha3pYEyWsNKfXG4bsy01SWbpu+qGswzXWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qawIKoF56FYm9uU4b90E+JQYKd6nHlp5JANCBGOY/88=;
 b=RUV06aYBayDlqI1HRGZS5+vgC3CKLmzkPmqyHbaoVGVtpszIDFHnh5mZydoub3D1lflLd3oY8SY/WqlVUO3nhKGt2yK4Yh/79P4e0f1pYv8aJAemLjPRm1EaugS1blClb2UnmUGxqkJMMTiuRhVubzw7HwYDTzLmdrry9U6QGQfh4BP+a1+jDirj3oTMxeoEk4maepwKuownnIbTwMwWUdrtoingAtCKqBHNY/jkn93vIufyxy9vGzDVM5c04neJ5zlsEx40bQ6HYVQUq/6N2DaL6b+ok6t+9+208YtV1HxU01Jeg2JIN2d8Z46tAa5gOTN9m7a+gD3o8qcFQg0VQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qawIKoF56FYm9uU4b90E+JQYKd6nHlp5JANCBGOY/88=;
 b=ZkDKPfrktiudkSabgR8l3L0Q7z9+ay0DTCj6zdKv3DAsHZdXVN35ZB2NSvH7H1PcCLjWxm87WIPN24PmTDK/Utq3oXxRCOe95M3wqwJDm8CzG1R2E9Wsnd4g5yprVg49qNb34BNN2jjojcM/u8gVHF8wJnpFKe41V+dnZiBYNwM=
Received: from BN0PR02CA0018.namprd02.prod.outlook.com (2603:10b6:408:e4::23)
 by MN0PR12MB6151.namprd12.prod.outlook.com (2603:10b6:208:3c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:47 +0000
Received: from BN8NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::69) by BN0PR02CA0018.outlook.office365.com
 (2603:10b6:408:e4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT100.mail.protection.outlook.com (10.13.177.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:47 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:46 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 38/45] drm/amd: Use `amdgpu_ucode_*` helpers for UVD
Date: Thu, 5 Jan 2023 11:01:24 -0600
Message-ID: <20230105170138.717-39-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT100:EE_|MN0PR12MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: ecab7a4b-efb2-4ae2-0669-08daef3eabc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gU/kGcCjPKQO5zOYTt3MGaz6UDnoy7bJjdNQMSmpQN5j84S3O5GOKCfHsKzhc0DbOKpNRR6Y/T/PEtFiuaSKhJfaMYLggl/HIwSSQjAPhYnAF45KvpdnkMv3yMmgZh8ooVR+Taej9K/9nYFHPStdVfLPLbuwfi1V07RbQOKbqBwenIKLWALjwzYtKPHR2l6aBYmSaFjwMTaIlXE3Ql5nNwGvmtT9PZUCugQbZeQcLI+ex4/p2bqZ74+qV9lBYYHph1d1ARvf0afXCBfJGYfaF2+4ZlsCEeE/LVwmCtmx4/B1hGkA1EKNtwiGqcO2sbttSrma6bqZ+GDmGTo24aLJVbQBEXnnjkcEj/qTrY7UlL/QBINKeRQzwWKL9diQ5BNiGLmHxXoLpKS0F8YKCLNPnZHtLtXcVYaAv7D77x6m856QnQZ1jEDVRCc3gIAy4VZTSIouIMC4sIFC1zP8MikElnL6V+kyHW+KD9xhPwvym8/YtFaEJlHKZr8evxQFBBUiWqb95jAqZZnW57jAe6n1PBr/TxfbJlFnXRjg189m+vXplLeks19DNkoSYSLQ/rQ+ltO7uI5lE8MiqS3i0eignDzafVxqu1AdBoWEg4aDXHmdlxOtHmZSmsc8yV+ApDJcoh5G0SwVqDFqjahTSJy6Uqfa7piQ9A9keEhpcyrXXb6usBIR9S4FfuM7rNU53mZ/dzNrhmGhlDzYl8CLZVQs8spVUNt5y/Lsv9Q2tbdQglQPOagfVtcBhRuKWOMoeUpy2xUtjVL3mslgZOAl6mkskg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(40470700004)(46966006)(36840700001)(5660300002)(4326008)(316002)(41300700001)(70586007)(8676002)(8936002)(54906003)(110136005)(44832011)(2906002)(6666004)(7696005)(186003)(26005)(478600001)(70206006)(16526019)(40480700001)(86362001)(1076003)(83380400001)(2616005)(36860700001)(336012)(426003)(47076005)(82740400003)(81166007)(36756003)(356005)(82310400005)(40460700003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:47.4614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecab7a4b-efb2-4ae2-0669-08daef3eabc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6151
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

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 6eac649499d3..482fcf71d1c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -260,19 +260,11 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	r = request_firmware(&adev->uvd.fw, fw_name, adev->dev);
-	if (r) {
-		dev_err(adev->dev, "amdgpu_uvd: Can't load firmware \"%s\"\n",
-			fw_name);
-		return r;
-	}
-
-	r = amdgpu_ucode_validate(adev->uvd.fw);
+	r = amdgpu_ucode_request(adev, &adev->uvd.fw, fw_name);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_uvd: Can't validate firmware \"%s\"\n",
 			fw_name);
-		release_firmware(adev->uvd.fw);
-		adev->uvd.fw = NULL;
+		amdgpu_ucode_release(&adev->uvd.fw);
 		return r;
 	}
 
@@ -394,7 +386,7 @@ int amdgpu_uvd_sw_fini(struct amdgpu_device *adev)
 			amdgpu_ring_fini(&adev->uvd.inst[j].ring_enc[i]);
 	}
 	amdgpu_bo_free_kernel(&adev->uvd.ib_bo, NULL, &addr);
-	release_firmware(adev->uvd.fw);
+	amdgpu_ucode_release(&adev->uvd.fw);
 
 	return 0;
 }
-- 
2.34.1

