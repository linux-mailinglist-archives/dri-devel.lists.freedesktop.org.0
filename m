Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C165DA86
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B243010E5B0;
	Wed,  4 Jan 2023 16:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C876710E59D;
 Wed,  4 Jan 2023 16:44:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZXBvYH+F6unS23wHuRaElEFX3zSA/pSmsVXmcqEWkLKAyJSN2S6SxTam9mOptWbfIK3rc7acV6ZE4sXF20I7+YhA5MsqoGDGREzScMEt+xCRNjyLPQVGh2JMrapD0+A9M/Bm/cnpm0MGS4x6oMIpkfiXsTiu9aL2eNTe9qkFxDnZHi8tLM2MFJJ4DnO+WLI0BCeP8CQc3WHRTi3CLv01GlxtjLN+XgLE6kVFaNXWYaezKyAWqzeKvnM9T4bP9U9bYVd1pHmUYHwi3CIQGLnplnduq1GrSPFpO8RAxpO3cSijdT0YJEce26erRdG8RIS1wKw1laDeHndoRrmIumMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYtfah8psObx63uvmlkhk7Sf0R1xaDX+DdyKuxOPHH0=;
 b=cAo1F/2EMiGjIpXRJYurHfzKBG+6gPivf6bK2qp59OCKEZgiDQ506ZAn3mnXt4JFjJy9snVXHUqLQAaIoI51aM3yUbVs9m+FVIFf5GG+jNIEeR+CkOEP/T/o3DdSFFZ2tVf8utJkQ9EvpJO69nsp/oRULqFf6uiMAJUSjd9KWLZQV8z9FaZL5qOA54AxtdouDikCvhDwewR4a6kR75DtCaaMA6EbkLfmgrz3FYF7eWjMVEsrgIyNHX3iP7K8rViF5Wnd8pZIaPTbjAI7cS+98dVpq0TZACFc1KZLFx62zJjI+l6OhJNEag0kBQ/bn1HwPyFccaRtn/LpuyGgmA5ICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYtfah8psObx63uvmlkhk7Sf0R1xaDX+DdyKuxOPHH0=;
 b=CJP3pgW+vIudfovY1ye5VIXRRAreZqlIMnlPTlLtiZhT6Tu6QbLeZ9dxg2OSxrHqp81hYhSGRgS0LvH93w92+Isx5IEFKCHMjOFyy+ecxMmnAnpy3vR5jkOBksqj/QDIM6Muy99qM7dzI24ATTBf2NZlDzfF29CmKHidO/39p7E=
Received: from MN2PR16CA0062.namprd16.prod.outlook.com (2603:10b6:208:234::31)
 by BL1PR12MB5062.namprd12.prod.outlook.com (2603:10b6:208:313::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:41 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::20) by MN2PR16CA0062.outlook.office365.com
 (2603:10b6:208:234::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:41 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:39 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 44/45] drm/amd: Use `amdgpu_ucode_release` helper for si
Date: Wed, 4 Jan 2023 10:40:33 -0600
Message-ID: <20230104164042.30271-45-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|BL1PR12MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: 1228bb6c-54bd-4c3c-678b-08daee72fa20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Un5bJ9fojCYwcfmrm8dbf1uiYQYIbyozuYWQLi3utQVyGHIR604JLMk+arEzHfuM8mNdMdOyW/eLa2l2LznKQPiLzm6aJ57K+fv0sxcZAUGhza/qJcSTWSUHwdhWQ1+RsOeOr8NHT0wnEArb/UQqxULDIFPDpHTb3JIf87P64mr64pAU4/uBy5dduz1GUo/cmrCYCHtsHl/G+FEfYzeV0xkDcoS8FH4VZfJDChKd6ID2QYp2V35Y7aW8A8p0NrlgkmVA6e5uD1sfA7YzgGHWrUa8Ugx002rH7gwSHKBZzvdsSyOwOw2G4raKA02UsrbGSVS047ABa6QKc/b+yLL14vFEl5It2Xo0+JSxUXHMxjOrqk7Avzj2BIBjLG3ZZ5avswJafIiHJdh9gfs0KHk+ZjbNP4l1ruYlIlOIVZu6bgr4GJSAy/t4IBmmWCyrinTcdQI6SYN6jFH6LaXNqQ14BIqIFOJoY/px8zVsjRbkRXM7rlD3nSOVYIeaHcqnFSdMcLpQ/+7o0FOV00rP34BIfMEhpDPlE0y8pW1YtFHpyboy0qu4G4tpQWUzW1BmkPRuCt2nhZiiIOI9a4ubOYDi13z5pkh7IWUxXcHlTGek/FkDeyQc5hwz3Xvkhv7qCcimwGbchhf5HL1lq5X3Wde37RfX7vI/U8MQKghMsHnrs3oQb0RMzgpTQfNr+Md+V0n1Fv3oXHFfBPSuc8d+ixfZSTlWbUwbqZQzsHs/RTble3UCD7lc+3qCYot8WwcOJXKiDbvzg5KH9Ev0JjssADNbrA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(16526019)(6666004)(26005)(186003)(83380400001)(8936002)(7696005)(40480700001)(44832011)(478600001)(54906003)(316002)(40460700003)(1076003)(70586007)(2616005)(70206006)(8676002)(81166007)(4326008)(426003)(336012)(41300700001)(47076005)(36756003)(36860700001)(82740400003)(82310400005)(5660300002)(356005)(2906002)(110136005)(86362001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:41.5987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1228bb6c-54bd-4c3c-678b-08daee72fa20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5062
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

The `amdgpu_ucode_release` helper is replacing all calls
to release_firmware.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 49c398ec0aaf..b4e5aac25ca7 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7714,20 +7714,13 @@ static int si_dpm_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_smc.bin", chip_name);
-	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->pm.fw);
-
-out:
+	err = amdgpu_ucode_request(adev, &adev->pm.fw, fw_name);
 	if (err) {
 		DRM_ERROR("si_smc: Failed to load firmware. err = %d\"%s\"\n",
 			  err, fw_name);
-		release_firmware(adev->pm.fw);
-		adev->pm.fw = NULL;
+		amdgpu_ucode_release(adev->pm.fw);
 	}
 	return err;
-
 }
 
 static int si_dpm_sw_init(void *handle)
-- 
2.34.1

