Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E54F65C96D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC9610E4E6;
	Tue,  3 Jan 2023 22:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BD810E40F;
 Tue,  3 Jan 2023 22:19:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGznlCaSfMTPhGUdX55xr9X/qISKyMUvQAlvKKVgS3Hz1P+jT7kW6awGqqlJJIaK+DZBVOViKcOzEg90Jzcs5pItXSB9EuS5lXCqkHeT5g3j1C0TLCJzwhB/gFbMY/0K/iwfJ/dNMgKS1tuQLcMtEjF1GBGus5O718TF/2APZlTMsqo5nJ/YSTf3P2t37hCIOyXSNcXfB4hA8s7OIlZOpppJDWB80A1l/YM/0Qoba4HnDW3+0qYy6tihZeJDpExB+r9VY2esjDD/eNZt3tczELG6NaGUaamOYdhARA4m0WuNiSEYCHDzGCTLEXBFSQ0HhgVe2oNBHai5fCZcnW0tnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv8pYRi7Zez2kDJHX6DDFMxMA0cE2AkRLddJELdmfrI=;
 b=EMOPkH1Zih09HTIDl1jXyHfuM8eGtHV9oIlzPmPrhMd/txf2Q2ABAz4tRFpKoET9SqMPCCNDZWOljIV0+F8Rqv5c8OE8b4dTjMWYNImpnUp78xP07YTwRankn6AL6Mb+5cLoKOkKHythirW7z+B/xiqObWmO18mN0zoQy+7g3I+dE66IpUVFB+spRoAqSL/OuldUJSRKULOeEIT2HrC7kjxtBH+zCg6dhsO2BVO97b2l6MW75Gh4zaDSQ5K1KhP/mXcMEwrfor/tEGEMbAq5SbVrpcmL0UNGztrkC4RlVjNUa0pnN6IofxArozsOJVFvSCzI3PkLfJqyCUVsIr7ZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv8pYRi7Zez2kDJHX6DDFMxMA0cE2AkRLddJELdmfrI=;
 b=0INXcLXfILG2mTSp0H8Utgn6Bj79nDT90aghY+lpMVWteeGJgyuoEo5qnR2yrnXaTStkA70Va/Owf+eNdtWnbjrxN4P+P9uNPmSNZ61WiJb98gfqr1HVBd3VxXN2RZy+uXn6DUd8XGCmZSgcUupnSwO9pOcjh0xYWpdUkBfpv8U=
Received: from DS7PR03CA0198.namprd03.prod.outlook.com (2603:10b6:5:3b6::23)
 by SJ1PR12MB6146.namprd12.prod.outlook.com (2603:10b6:a03:45b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:48 +0000
Received: from DS1PEPF0000E64F.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::30) by DS7PR03CA0198.outlook.office365.com
 (2603:10b6:5:3b6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E64F.mail.protection.outlook.com (10.167.18.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:48 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:47 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 18/27] drm/amd: Use `amdgpu_ucode_load` helper for GFX11
Date: Tue, 3 Jan 2023 16:18:37 -0600
Message-ID: <20230103221852.22813-19-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64F:EE_|SJ1PR12MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: 19f592d5-5c8e-4ba6-5f72-08daedd8a065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dxFj9yqRAioliMfQ1sSBnUvR0kwE7W8rTcmMlLlfrdXDRyj1jhVOz+Aq3voDfpUDhNm6sdCUrF9xAxCDaRWnZ/DXOwCUgx7jGGRdQ7X8CUt4jeLtCrlvluuXQAbxqD7PjpY/3P/2bxN9fv/BQElve7HmUIxMZX3vIvvzKdlQKedq8b4n0GrqCMZs+I/V7HhNCSTSi54gxS0uP9s8bjXt9YQx6r3SYZfcRsPJktCamrhRgjIqbxqEcO2+8MpQ3l7zXXoFQaEq8scHTdwKtff1wRH0YsWT+tXHa40MSTLE4Xldo0cCgcNhI1q8ZAYUCSS3zCphq/WfyiZMp02ObFmpI2heJEdrOkYeJ1e7R4YmIQFynee6F9vxEQ8gsr19MgPev1D/BtU6bpR0KmuN/4pDLgQ2tYY96gzDikhzki9guH76bX0iPZy93XqG46CRpSxb7gRzSd8UANPquuUZlpKVUsZuI4A2sdXTdBSOtVpa9jcwD+mfiCFqLl3Ar/yoFUISA+mktzMinQKGz51sH4/ImTNITyen59KuQTbcC+h+4N75jPBVt4ZyVsKfOF4x0TGEOormBGtMbwH7g49Ld3l8akc2DKr/h+wIFkG9rSxTLbpRJhzI3sls6g2tr/lcrQxr/Uj0TQntQjI7BwN5eNFHYFaMKluku980tz5p6J8QPKheA8NioyLOiyagcrVyUXWdn0iMgcmNqigX+qXl2Yy4T/T1EORUG5yhQ8zQjzlG2YKk8EYAOypQxCi+jKruPsB+VijZxmlst+ARSSxCR90POzb8W835NjH7fnaSriWBQZU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(8676002)(4326008)(6666004)(70206006)(70586007)(41300700001)(8936002)(40460700003)(316002)(54906003)(478600001)(110136005)(2906002)(7696005)(356005)(81166007)(82740400003)(2616005)(336012)(16526019)(26005)(47076005)(186003)(426003)(1076003)(36756003)(40480700001)(36860700001)(44832011)(86362001)(83380400001)(82310400005)(22166009)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:48.5438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f592d5-5c8e-4ba6-5f72-08daedd8a065
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E64F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6146
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

The `amdgpu_ucode_load` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * New patch
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index a56c6e106d00..0c77d165caf7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -457,10 +457,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
+	err = amdgpu_ucode_load(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	/* check pfp fw hdr version to decide if enable rs64 for gfx11.*/
@@ -477,10 +474,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
+	err = amdgpu_ucode_load(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	if (adev->gfx.rs64_enable) {
@@ -493,10 +487,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 
 	if (!amdgpu_sriov_vf(adev)) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
-		err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-		if (err)
-			goto out;
-		err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
+		err = amdgpu_ucode_load(adev, &adev->gfx.rlc_fw, fw_name);
 		if (err)
 			goto out;
 		rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
@@ -508,10 +499,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
+	err = amdgpu_ucode_load(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
 		goto out;
 	if (adev->gfx.rs64_enable) {
@@ -530,9 +518,6 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 
 out:
 	if (err) {
-		dev_err(adev->dev,
-			"gfx11: Failed to init firmware \"%s\"\n",
-			fw_name);
 		release_firmware(adev->gfx.pfp_fw);
 		adev->gfx.pfp_fw = NULL;
 		release_firmware(adev->gfx.me_fw);
-- 
2.34.1

