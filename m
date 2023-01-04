Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3C265DA2A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E923A10E532;
	Wed,  4 Jan 2023 16:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060.outbound.protection.outlook.com [40.107.101.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A05D10E457;
 Wed,  4 Jan 2023 16:42:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaEhBEBdDHKvuFkxK6ukZUMNuLdzxan4kXEgaezPaHSdIVv5llPibn3vFOZlOIq1fYGSrInPVkeBugcpLtEZQzwl+Wes20jeDiruDTrp57cCG+do91rKf27+vMJD+Xx+dqhQNpQ1I1i6fvgRBh4szthvQxPU5paHpyBKjhvgmnn4JwNkVfJziNobAuhQijOHgHOnlTigdOb2wFRMNDHwoE/doIQTm7en3O9BwtRGZdOzn3Q/HKHpRm0UirTmAiCDHjHGSCCLLU7fV6VZkxN8i7j+YNbbCRrWEd5TedOAeOTBE3b04d6hadfW1xvb5bhvisg/P70jB5oZDKiienYqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYEI94OHZJD5rujfGunzioO+qt2jPdpcF4T44tMN5Pg=;
 b=c6yh3H+wGvZZvVBTNYTMambvzb40or5KmHcuIKdLc6C1byUljWcCb3VcF9Dg+whXaEqKH7wps7325huV/5i+k3fhLOffiF4iyXNDuG7LNm2TfjbMNsB99Kewx6fq5Bl86KnM8tphHIXOtPmuVLGsVqXaF73hNgzsYZTiBxFgXhneriVRCpm2az+k+3MTr/CgemF8bEPohBFtZybi5lpxpkSbZA024rsR0madv+WKtJQC3m5Rfp2cx5THSsRPAy9+PhB8IPvNS5g9heFqayQwd1RDAcg0S1pDrDGnNJQ/pMjQ8JpvoaxYZw1J2e+Fox0fXyiDmmVgfPr+MXtEEpZkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYEI94OHZJD5rujfGunzioO+qt2jPdpcF4T44tMN5Pg=;
 b=dkrpMf5RoCOy5po1032K45x2FZjI6vRJQDQ0kXL9CwS7pVC/bnU/yqkKkXj60cQqmYMIqtyDqcnAgZrjOTnRszsVCvOTXPaTecvEYVeWHBLUNKVNSI9kXWy0pl/uV66JOsYxjkyLvmZxfGcFVxNLmUdVKrpCFWxxdRSpjpxuMfg=
Received: from MN2PR16CA0045.namprd16.prod.outlook.com (2603:10b6:208:234::14)
 by BN9PR12MB5049.namprd12.prod.outlook.com (2603:10b6:408:132::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:41:57 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::bd) by MN2PR16CA0045.outlook.office365.com
 (2603:10b6:208:234::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:41:57 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:41:55 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 09/45] drm/amd: Use `amdgpu_ucode_*` helpers for VCN
Date: Wed, 4 Jan 2023 10:39:58 -0600
Message-ID: <20230104164042.30271-10-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|BN9PR12MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ef1c81-1395-4595-1b64-08daee729824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GTb7gCKjqqTCvumJ60IyjnldWxytkyMnm8hTgRb2B4/TrHqj1GA62RbaLSpKYhI0jR8giAPKzLO+I2muujUyRn+eqMpqFe0Pv4nyjDRreM/+ysSIafHIf5w7fkhCwhccQB8wGbx9vsW/uSgrUSXdcENXvWiP+qUcOtAUDxkLTHZpnB2FIMwuA3cKFqvbdnv3JJWu53F/YPLTaDNgqkxBtsTqEMunoDLOcoPFOM/thqfNe/o6a5hMR3TFsgKR4feg0xuuVclsZqb/6BPjr3IeTFnDdltylPwIJWQeYHppI+9XTdqET/EOigLpUegtrOcLajJRS4yOoiV4ZzxJvjGBXw6OjPZUQa6Soa3pXyPkOSCEJ07E2b1WaelSNW1eFWpvJTpUmyw8gI4HxznBdvJub7w7sU+7ClXS5bRbvDSTgG0zjj/YcN0GjaCBBoN10vLKmdK337xo0ZAwFDFsYsaM++FsEUxGTZuGOcPlTYdrhfmwlb9uXdJTKI+QjJesuDykvYBGzYsWoI9NqLEE2BzDf7mUHKIVPpS4ruXBXza8tQ5H2QLuN4a6WFFzjeSF/F1t9r2OeY2AqPpboRdOxTOAaZWpZgJw9We5L0mGFtMAmgoAezIXMiWYLY5EGhFCZf2SWhD58mdAtg6fTkrE/x3nVxTxeW7w6KDe7nWFFTaZ5IC5f8sUJzT5z9GZY7cQaTUaOQTgywCBCXjla9ZrdBptWMBuy59Rlpo8HM+YAf1H7/Wkh+7rLhEnT53w+mddVIhi0wa49M8vaRnK+k+NtPZIJw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(426003)(1076003)(2616005)(336012)(83380400001)(47076005)(16526019)(186003)(82310400005)(40460700003)(81166007)(26005)(356005)(82740400003)(40480700001)(86362001)(36860700001)(36756003)(54906003)(316002)(110136005)(44832011)(2906002)(5660300002)(70586007)(70206006)(8676002)(4326008)(8936002)(41300700001)(7696005)(478600001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:41:57.2219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ef1c81-1395-4595-1b64-08daee729824
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5049
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

The `amdgpu_ucode_release` helper is for symmetry.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index a23e26b272b4..b5692f825589 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -206,19 +206,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	r = request_firmware(&adev->vcn.fw, fw_name, adev->dev);
+	r = amdgpu_ucode_request(adev, &adev->vcn.fw, fw_name);
 	if (r) {
-		dev_err(adev->dev, "amdgpu_vcn: Can't load firmware \"%s\"\n",
-			fw_name);
-		return r;
-	}
-
-	r = amdgpu_ucode_validate(adev->vcn.fw);
-	if (r) {
-		dev_err(adev->dev, "amdgpu_vcn: Can't validate firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->vcn.fw);
-		adev->vcn.fw = NULL;
+		amdgpu_ucode_release(adev->vcn.fw);
 		return r;
 	}
 
@@ -333,7 +323,7 @@ int amdgpu_vcn_sw_fini(struct amdgpu_device *adev)
 			amdgpu_ring_fini(&adev->vcn.inst[j].ring_enc[i]);
 	}
 
-	release_firmware(adev->vcn.fw);
+	amdgpu_ucode_release(adev->vcn.fw);
 	mutex_destroy(&adev->vcn.vcn1_jpeg1_workaround);
 	mutex_destroy(&adev->vcn.vcn_pg_lock);
 
-- 
2.34.1

