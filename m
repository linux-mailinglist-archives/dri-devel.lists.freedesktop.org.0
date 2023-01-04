Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC765DA1C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3FB10E452;
	Wed,  4 Jan 2023 16:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F25B10E058;
 Wed,  4 Jan 2023 16:41:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkfCKWYPEqtaggVkWdOFBMNVPsDcWgaZBM9KEhWcauCkgDdq6DbElqDxGflisvqmKFkf55eUQxnTqk657jbpikcf1Ab/fIX0gKWK6z7ZeMRT0RbhGVziz70k88IOfal05f5oJ7Ny9lfH1qtNS9wlUyOmTiHkJ/bb+E+NwmLEYAvyHrJDkL1J0o2xLS4xShq5VhujrHYsHl0p2fC2WLY3fu0L2j1UGAuoCI1psUONdSoXC54ds3KFYG6MKOUKfQ3WS+eZbHJ6vPboZIeOAug7BYssHmb1Xi96QgoArCJHT38Zrpdll1bA8eidLx1MWeLvp8Dn/9SDXH8G/9qiGdpaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSyu8no0i4tN1bff68akPDEKxhO4iVdu4y+ah8dMRi8=;
 b=OoOS4C2TBsgQ2Lr5iVNWprIJIrorhY53Hx99W0jV/124or4tsMlt6nQOI0ameh/ImHjR++CbYmcQjCVC0H3VpjN+Wlk391J8qNpsoKjJ+GUHj8KKZHelhkkfEoEgq6k5Si3JtWa2JKeqeuYZaWJoU0wCXH/4Pl0qxIItB7FYAKacyi0Hp/mtd8pwIJVxMZq210v2xDaWN/uZD65OBFusQMkNJZoXkBGkmuwDJ77QFf/mjPDFK5YPtRUA+s/dq9kmk13BLrASHvRRe78h9l+X4lqDrkaq0k9Q6H24FxHP6kmFaj+vtqtFNs7A5Sy2GDp+/BymhHPqHt0VpjtH/5bs9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSyu8no0i4tN1bff68akPDEKxhO4iVdu4y+ah8dMRi8=;
 b=2eqCHrdMp6wmSKhyKIqoYA+NzWNeKl2Vm2X2foPxkzW0AiXDnMHUGJgYy0eXvkKc2R1TxD8VnhqKb+fC3oPf7FW61AScXMtnCWChG9bay9xkOhiTbp/rPB+zlTQW1Dt7KGZmjDulQw856QsJwE57jKuYYkZMI3AvSkAuwPfGUFs=
Received: from DS7PR03CA0313.namprd03.prod.outlook.com (2603:10b6:8:2b::18) by
 DM6PR12MB4315.namprd12.prod.outlook.com (2603:10b6:5:223::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 16:41:51 +0000
Received: from DS1PEPF0000E644.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::6d) by DS7PR03CA0313.outlook.office365.com
 (2603:10b6:8:2b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:41:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E644.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:41:51 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:41:49 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 04/45] drm/amd: Convert SMUv13 microcode to use
 `amdgpu_ucode_ip_version_decode`
Date: Wed, 4 Jan 2023 10:39:53 -0600
Message-ID: <20230104164042.30271-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104164042.30271-1-mario.limonciello@amd.com>
References: <20230104164042.30271-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E644:EE_|DM6PR12MB4315:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ef3230-e0c0-4b01-c66e-08daee7294e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p9t46LSgv4jayZrH/v/K95ZAqXKRC1NNHSJ7g+klYeymPj8r5N1BWxmSyzs+53yGpiJALlN11i8iNKIDwWgjZtGOCgk3lVDC82U7XgeRZETwH59CdNC9BoqPeGsYafqb2CLw66KUiv9Yd5FuL2ofSzXgHa7iZce+BV2vPrZxCOmsaAMW8H+LPnSqQOluIJ31RZkqH+5k96nPSx3ecQGDlPid7X56vxqBsNyMRdURsfmAZ3JgqlAzVCcDDXDGcmSjy7opxRS5G5gSiPdxA0MLrKorj/6m/FexAAo7c06ygElzArOvZNJe0loQP0ceXHYJvUIgyUn/IFUTsLVJ0FtgrLxS+0hPiaOG29LO/baiG8XWx4ucLhgkzOQ6uCXb1xqwo+RvpNLah4I13lNBTfVVg8q9+Yxhj7/Fe+fTNUAQbmZjnSOwEY7eQdnY0egL+ep3WaXwPTFGyjK9SN9xa1y2S089VlyWlkAlZphsavj0GWefIp574eko9RMq7bnl4PI4fAJyvBd/Uf2BIPrqb7yn4N0BDK7p1jF3ejbZB2FnZW5Bob4cYzlcbfZv2NE7vAHTdJOjxDfvWKuqMPpzL8Eukch0pFlEvSVdTOCLwI2q5D5pEV2KP0wayvWqsLNAn6JRRo/qjjySacRo70yvWrGcnN+2itJVmKuNG9jFobLmST7yemQC+d8dbYXfixepVgg+xUBaQwjSj4gmBFPCkm5Bhv6cbFNHM8s2PwTSg2O0occgXFivecj2k7cLAXxDdyWdmw1eWM3Zgx6es3maoMlIwQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(4326008)(5660300002)(6666004)(8676002)(70206006)(70586007)(316002)(8936002)(41300700001)(40460700003)(110136005)(478600001)(2906002)(54906003)(7696005)(81166007)(16526019)(356005)(82740400003)(1076003)(426003)(66574015)(47076005)(2616005)(186003)(26005)(40480700001)(336012)(86362001)(36756003)(44832011)(36860700001)(82310400005)(83380400001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:41:51.7071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ef3230-e0c0-4b01-c66e-08daee7294e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4315
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

The special case for the one dGPU has been moved into
`amdgpu_ucode_ip_version_decode`, so simplify this code.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 0ac9cac805f9..506a49a4b425 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -88,7 +88,6 @@ static const int link_speed[] = {25, 50, 80, 160};
 int smu_v13_0_init_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-	const char *chip_name;
 	char fw_name[30];
 	char ucode_prefix[30];
 	int err = 0;
@@ -100,16 +99,9 @@ int smu_v13_0_init_microcode(struct smu_context *smu)
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
-	case IP_VERSION(13, 0, 2):
-		chip_name = "aldebaran_smc";
-		break;
-	default:
-		amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
-		chip_name = ucode_prefix;
-	}
+	amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
 	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
 	if (err)
-- 
2.34.1

