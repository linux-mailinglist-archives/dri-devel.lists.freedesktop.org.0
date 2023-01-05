Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67BD65F1F2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA0010E7B3;
	Thu,  5 Jan 2023 17:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3CD10E798;
 Thu,  5 Jan 2023 17:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCavQNizS/YgoLujhX8WmiQguuT7rnVVGBwe8GU3j9y0g8DV7saz2KcNJEuteM9cZ2LfWzg+x05EYXlPEBB37lxhCURV+IxCVygXEJzZRDQpT3wMADfhtiadsFp7vzAeRVJPamLVC2NMEcUKtfM3/T0iMV30pihSvOCWRR+5saPumikDMqIh/p6KiRUzjbrOui051PMdlgqH/gkZDda96tLhozYUwWv7MBBTS59uqXf6eAT1WybVDYU711C67x0+ZmLoru7vcyQxtOE8+jB0kVhZSOv9H67A++QR89lR1y9KsBISfH++VX4EQWgEYr8zS28TgEE2Ml8V5he7rF7E0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUH+VtLisRf7jpLLUErjtXm+rcxM23AFWgv2ywEexYo=;
 b=l1hbakXDUw79AnrM7U+nwFRxakTDp+waFCZ484O6luiVRxgjaP7WHtAuDPwJ60IbUNfhK65L19kGLu2t8iOoAylghdOP/UQxQ2Ux0reYvKiUK2bOgtTTaOBXJies1Q69xgshgQI9JsKYC0U31Ikim47AuIOZKKHhGZoPXuLUPoWoe3dPp1JDqZS7yrJyR3MnUmJ9hZdqnOeTJsHbKfcYBITsGklau9A4F4YtNuZYiPvxyoiZ/ZH8HFTy0Ejo4LcIGFVuzXp95EzI/R5Jb69k+0gT5hwi/buy2RFeAK8pXEe7o/Fg1sNJlIQgJG5VyIgMAzeDY45he2/8pGoKT2jlPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUH+VtLisRf7jpLLUErjtXm+rcxM23AFWgv2ywEexYo=;
 b=0QCDZ0v4dPJnKGGLecD6LDhPQidoGCE5BThKI+z5RBy3qEXDFhER+DNdfYt4GJm8G8Aip/TBBWBKvaIrOu04997Szd1qKUI/ZO/H8DHDkWTpxlJhSF51LxB4wmwEkzlubB7xGozRPgczqvcEkKREbOwzQ2HUbMCmZbSmyyLBhr8=
Received: from BN9PR03CA0768.namprd03.prod.outlook.com (2603:10b6:408:13a::23)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:45 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::ae) by BN9PR03CA0768.outlook.office365.com
 (2603:10b6:408:13a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:45 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:43 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 36/45] drm/amd: Use `amdgpu_ucode_*` helpers for SDMA3.0
Date: Thu, 5 Jan 2023 11:01:22 -0600
Message-ID: <20230105170138.717-37-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|BL1PR12MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: cf999545-3a0f-4a75-3ef2-08daef3eaa4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHz9WKSGZFAmKQU29+3AZ7maB9pPhnyRo3p4pVerewMDJf3KuJh2J/lv6tEiiIl6+i2e+nrUY6thaACNCYaPjTLXn/iHBAG/mw1jGltvJJhN2T0ARimgDQUuAgWu3DlJ8533wA94SvrcU7lgPuwQ6Xf8wByJOgoOY8izifvpHd2E5sxdoTuzkb4h+CBzSHkkm5qHRyRVFt9TvGepUarkoqk+WgTK522854CBNfGIhV23V+40qdwLH4F6ignwuTKv/B35hT7w4/qSSxP2v36HKnMwP3j56GxKgcSnDNG9qkWOAIr/tMqC3MNDOJZ98+Kj3st2K1gqcw5/mKk1m85ZVqrda9UquVELoFe37Fl5+KEKuu8vPSoz+eJ45JOErpCvV52phtyxvSoePOKWM3q1MnGTP5+QXaVDhhlfVFSYM/utGJGy0OatfN0c8NTHkfBxkwFgQ3ru3xrwPHG/ZZ3+QWBrH660LOFhNQDDXZ937qJskycg4iIp9T2dTcTSVHy/PU+Xohq596RcGlaz3bWo5sPHt6zxOtkQ1/h23mma/N9tzP/w1A0dP8Z47HYF9kFnbnLNBxuTNKtswV8Laglu0The4bNT59btWJ+zXdn7TwFzXJT0nK2UA01/22mTmCu6SjMbEqHYpXaP8VRGOw0zvdbpIoKcqCNxD6KCLsSXnJcbSQYrbsvxiWOFYAunqudbapKGrQM/jGbBBDJ2hHGOth1k7xncvm/yYhtTvH7v+1g6+6rhwD69TW0rTsdIcL52
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(2906002)(5660300002)(8936002)(44832011)(8676002)(41300700001)(4326008)(54906003)(70586007)(70206006)(110136005)(316002)(478600001)(82310400005)(26005)(186003)(16526019)(7696005)(336012)(40480700001)(6666004)(83380400001)(426003)(47076005)(2616005)(81166007)(356005)(82740400003)(1076003)(86362001)(40460700003)(36860700001)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:45.0077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf999545-3a0f-4a75-3ef2-08daef3eaa4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189
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
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 486d9b5c1b9e..e572389089d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -250,10 +250,9 @@ static void sdma_v3_0_init_golden_registers(struct amdgpu_device *adev)
 static void sdma_v3_0_free_microcode(struct amdgpu_device *adev)
 {
 	int i;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		release_firmware(adev->sdma.instance[i].fw);
-		adev->sdma.instance[i].fw = NULL;
-	}
+
+	for (i = 0; i < adev->sdma.num_instances; i++)
+		amdgpu_ucode_release(&adev->sdma.instance[i].fw);
 }
 
 /**
@@ -309,10 +308,7 @@ static int sdma_v3_0_init_microcode(struct amdgpu_device *adev)
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
 		else
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma1.bin", chip_name);
-		err = request_firmware(&adev->sdma.instance[i].fw, fw_name, adev->dev);
-		if (err)
-			goto out;
-		err = amdgpu_ucode_validate(adev->sdma.instance[i].fw);
+		err = amdgpu_ucode_request(adev, &adev->sdma.instance[i].fw, fw_name);
 		if (err)
 			goto out;
 		hdr = (const struct sdma_firmware_header_v1_0 *)adev->sdma.instance[i].fw->data;
@@ -332,10 +328,8 @@ static int sdma_v3_0_init_microcode(struct amdgpu_device *adev)
 out:
 	if (err) {
 		pr_err("sdma_v3_0: Failed to load firmware \"%s\"\n", fw_name);
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			release_firmware(adev->sdma.instance[i].fw);
-			adev->sdma.instance[i].fw = NULL;
-		}
+		for (i = 0; i < adev->sdma.num_instances; i++)
+			amdgpu_ucode_release(&adev->sdma.instance[i].fw);
 	}
 	return err;
 }
-- 
2.34.1

