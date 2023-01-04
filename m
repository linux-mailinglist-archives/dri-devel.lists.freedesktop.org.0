Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525065DA50
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A4D10E56A;
	Wed,  4 Jan 2023 16:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C7E10E54A;
 Wed,  4 Jan 2023 16:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+L14Nm5HTPWVfqkEpw7Y0OfRCg8hPic8KFXvVIJVKkZ/cEixfHtoG04FwuzxxrAdqQu0mFI9XEJ5f9ROWdG/cS1ON1bQKuAyD6PEDquJR38EuRqs+sPa3s/LT9FnyHqEkEdnhfAgrl+gAu6T181o2r67w5jyBsX6fkvKJoJMRe6Tx4ybeyfG9/SYyg4j2b82FSaASB5oxbXBOEfDiw2CMrR67QtOzr2FBuJCgHvxDqP4p0Zj4aQbVJmjrw3GsJeTm1AmLIq5mDD3EaVXbF9UC9yUVjVeQPr21a/XpQU0qlUtCq+Djet4YMgsF+N8tyvqijcDjb7+MhaPhJ9cn8KRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4q5X5maJe64aIx4Sd/OlmpTCbvTkhNblm8yOV9gV1sQ=;
 b=UlKfEllgr3cRFJB75jONNCkixqymZKrsv0Cqk+xpCIWXONpQxELnYm6oEj0PuRQtqqdxnF83qibpaprKRunHRXIVKkqOQgps28icr8j+IkDlOeQuCFF5s1efHq9u8DGn8VQxRUf4qxfGFIRP+kyp084bUjzNb+liIG4mhpF5ccxoZ5nBkox2bZH20KFdg+/2Qgeso69kWusLVkS2NtoOI4TRlyvZJfciDjPPkpDIfanzOqoQC8lncLUx4Zqry6prg8DYT5jBoEgtA0jfjbOoHgM33uN//Yjol2JZ7GvOGQ5nJK55IbG4Gj+wGkWTtNVCDiWBfU8np5384jsYjzeDRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4q5X5maJe64aIx4Sd/OlmpTCbvTkhNblm8yOV9gV1sQ=;
 b=MeFaDqN04vpayafvIZaxqM7lgLnQvdJgctlEEiugSjvC296dgP9us+XrQ1FlASHW/i0YyUBLEYSEwyxDgI9sgtD5Lg3eIvqEzpkxr9I7SeQwoTQ96XN+AVzQqL9ZTe0zwaC74d7B7J7sCF2CCT00mUJmXTk817bJnGatMftRGCU=
Received: from BN9PR03CA0628.namprd03.prod.outlook.com (2603:10b6:408:106::33)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:07 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::1a) by BN9PR03CA0628.outlook.office365.com
 (2603:10b6:408:106::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:43:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:07 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:00 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 19/45] drm/amd: Load GFX11 microcode during early_init
Date: Wed, 4 Jan 2023 10:40:08 -0600
Message-ID: <20230104164042.30271-20-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e03955-dc89-4186-3d46-08daee72c202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fRrfb03QO7jzv+l2Szs8Pw8MF4LhmNMl64EfYf8N6F/fUUYI66uY2NXgpPFl1l720wd+RBIGzwxOeMtY4bvWxjXQmrz29v9LzDX4a6DLM+5xnfyOcgauBB5lb+SplpJXacwB2S9jbpKBvj89MfxRMw60Ps1a1H1BmrMqK30fW6/FQA7rXmyJOf1oheJMqh6J+8k5Ipj62dm3K+DpDx6WUtBQ/kb/SZqmga1M/M5emaxo/x+EmY8Lw8/Bd8ouJXxS3cffCaj1zlFd3r9uuiw/aWLytFHT9HTh2CD+x8++E/uJn7VVpjsrEdZa2sBXgYIqQvhJPU1tB6XN398RwE1n9WGNW0wEr+99QqdGjZlhlZJxcqExxgAXPEFV8AP7oZoeFCl6ew2AOVlb+CvGW4eOSBNaMe/mL+KzPvJ7CIsKIXLtMlpPgKjcA3zFCEVIzJ1Mnpa46dFVG8f8hzEJAtH6eSpMQhUXsZCq+UBxxP7Jfk1sRLLuo6w+/kZ8KcAdLnpvqzG+iQ0MzyDcvwX230Uf/wr5UYBT4OIo+FBltDcdByQFL2nQVcWiimS+rbbSXqmclaqBb4OSYjP/TEfxa5xrhj8PfhRItyNJDvM+yG7h0rZFrYdQdlNwIjiLx484POeD2MHkjwNdtS5k0vL3UndUO/glnJIqguaqVHmkpXfuXSppRGPHYKtN8EoMDvfCUBsBqDyLjB6mwAuR8OH3IW+edPbpzrqy+pdm6TcGOOZuO4s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(2906002)(82740400003)(40460700003)(36756003)(40480700001)(316002)(16526019)(110136005)(2616005)(82310400005)(81166007)(86362001)(54906003)(356005)(5660300002)(41300700001)(83380400001)(4326008)(47076005)(70586007)(426003)(8676002)(336012)(1076003)(7696005)(186003)(70206006)(8936002)(26005)(44832011)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:07.4486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e03955-dc89-4186-3d46-08daee72c202
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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

If GFX11 microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for GFX11 microcode into the early_init phase
so that if it's not available, driver init will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index ce018331b093..28efea3b9070 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -532,6 +532,9 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 	}
 
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO)
+		err = gfx_v11_0_init_toc_microcode(adev, ucode_prefix);
+
 	/* only one MEC for gfx 11.0.0. */
 	adev->gfx.mec2_fw = NULL;
 
@@ -682,19 +685,11 @@ static void gfx_v11_0_mec_fini(struct amdgpu_device *adev)
 	amdgpu_bo_free_kernel(&adev->gfx.mec.mec_fw_data_obj, NULL, NULL);
 }
 
-static int gfx_v11_0_me_init(struct amdgpu_device *adev)
+static void gfx_v11_0_me_init(struct amdgpu_device *adev)
 {
-	int r;
-
 	bitmap_zero(adev->gfx.me.queue_bitmap, AMDGPU_MAX_GFX_QUEUES);
 
 	amdgpu_gfx_graphics_queue_acquire(adev);
-
-	r = gfx_v11_0_init_microcode(adev);
-	if (r)
-		DRM_ERROR("Failed to load gfx firmware!\n");
-
-	return r;
 }
 
 static int gfx_v11_0_mec_init(struct amdgpu_device *adev)
@@ -1307,9 +1302,7 @@ static int gfx_v11_0_sw_init(void *handle)
 		}
 	}
 
-	r = gfx_v11_0_me_init(adev);
-	if (r)
-		return r;
+	gfx_v11_0_me_init(adev);
 
 	r = gfx_v11_0_rlc_init(adev);
 	if (r) {
@@ -1377,9 +1370,6 @@ static int gfx_v11_0_sw_init(void *handle)
 
 	/* allocate visible FB for rlc auto-loading fw */
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO) {
-		r = gfx_v11_0_init_toc_microcode(adev);
-		if (r)
-			dev_err(adev->dev, "Failed to load toc firmware!\n");
 		r = gfx_v11_0_rlc_autoload_buffer_init(adev);
 		if (r)
 			return r;
@@ -4648,7 +4638,7 @@ static int gfx_v11_0_early_init(void *handle)
 
 	gfx_v11_0_init_rlcg_reg_access_ctrl(adev);
 
-	return 0;
+	return gfx_v11_0_init_microcode(adev);
 }
 
 static int gfx_v11_0_ras_late_init(void *handle)
-- 
2.34.1

