Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8BA65E3C2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C582110E63A;
	Thu,  5 Jan 2023 03:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD2F10E643;
 Thu,  5 Jan 2023 03:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJrEzdgKl3QOaVMW+3VbUtGziWf+34GMHeLL4Ah6GgUd7KbN9IQwMWvMezk7d/G6hxfxBa6ChKWjEPLujnmRWu89nx2hCC0Qs30Q21jcBACkrBvg9ZtHjyX8gjWjyYg0Ep7qjOf8CfMG8GfzFMYwcm3jJZVTbHOpuD0YrHhcjN5Yv5R4eDOWpouVlPemVgDxES6ILxJgWeDkOktltr87He0C1jomVFxVBkoQcVMCzSXK3PoQGYDTfkJ69jw11gN6sVJCg3YortSDMhyl8Nt6H5+14Vif7/wYQyT8/UmM8Se81r/bzyH0jrzaUeMOKs0QAC8PZSPwBMhIS48opRW7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lr/CkT1I/8/BfGJbviGOys71XiNJm7ioGG2YOrsxz50=;
 b=n8Y53zr0yrVmmhQr2fNgVrTGcrbgM0fR0NSLJk91cvPBYYjIMLlYhRx0xCnm3mC+Zxdm8ApKKEzqQDxZCMng3SFdbVfVXM8D8Xhd4XdOxqP262wim+C8pvNCpzHB846gi7GjwqEDgRAYBVUQKNZq9+C5VinJsr/u6jVMNKV4KPQbtstikMIPg0Ska+tA40k0cyYuhFny+5A4ISWok3jjZ7+42RCM1qWb4XFRL+c4KtADuIR2wUIhxnEyc0WaHTHVgpKZAF0FaeVc9mIS1YMJ1fAC/oOc0A/IsNt6OVXBk+L2+LwbQFYdrPkcgo8ThkmaXK/vbtn2Rlf8fDV7CtaDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lr/CkT1I/8/BfGJbviGOys71XiNJm7ioGG2YOrsxz50=;
 b=RLBNfMTZLee/vlSW6097pkNB5Sh59pz9qupvf84invnGXl6w7jRSfZDH2/PcWmgfiMFWPk0QcxRr9cEiHZXq3+AIPr7/BliPgR4n7wXJiPS+0Ozvt2pHynM6k1aYdIMeKVr9XDLyHJQZnXf3tsVnVDVHzQwT5gFPBAWfKbsdFFU=
Received: from BN0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:408:e8::18)
 by CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:09 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::a9) by BN0PR04CA0043.outlook.office365.com
 (2603:10b6:408:e8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 03:44:08 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:06 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 09/45] drm/amd: Use `amdgpu_ucode_*` helpers for VCN
Date: Wed, 4 Jan 2023 21:42:43 -0600
Message-ID: <20230105034327.1439-10-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc06ad2-f31c-48b8-2261-08daeecf19f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LP9wdfWVqBq9im3ifbs3PYw2LbbXAVPcO90ogPjSk2yMLGuq/pBDLBN7jg8/9/EIZn+RKcWK0p0a19eb36JciE4gM3kqpI3EdhnikonBIOxf1i4arZt+RKRstkoV3LGG1Une/+3M3xIYtFNprnORAxQXtApGaiiSP7u+wiuRqiMjMk0USKfNNHpKG9FbJO2Gk3Ini6XVC1SLk07wjtFuBn5vTkVKLHKAltqLaA1ISh/OULLm6RF/Vwv3dfgiA+DLImoVPGdgvejarSTWkhKTaCgaS5EiwoQ2EzRN/tQNczmDsdlRSrKazmpnmWmAonDolKOciiJH2L0SBCylk7DQvXiXgXO7OudAk/EUP51G4+qABz0MUkUQpsmrLjL2KChl7IXC0v6mBgq4j3sTLDbsEqxary//bg0nzR620nYOyuZ+WXyc3kHRa/g2W7oZlERb+Qx0n0IuhQ3OX7kW6bO1U6WblZvaoGial/7QAmU3DV/cTpBItfeRZTy7SZTaq92HZDZJmhZmU3ZAjRy8bIl4RlPP2CzpVYwbLnqHUnDbZyxNjlJ9oS8r611IB5lcPPzzbV9ZhosFf9aG62uMLzmbuVSpTD4c6Xb545Ew6lrjFtaQ1YEFLTREBLgN2+moiks+i8l7ZsvXABbgLrWBmiH88X3ryXGTLBzJ+WqgnhMVWy6geWZBZtixidZxzoIzfmMoprmuwT3cf2iEJDQeMdbSXTKbT+Sr4UoljFGnyNWfVpB6D0EPpC0cNmsZwYpYFNRQKj3/GmSOJkEAF3VrL+jjYA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(6666004)(478600001)(36756003)(110136005)(36860700001)(82310400005)(86362001)(40480700001)(82740400003)(40460700003)(356005)(81166007)(47076005)(426003)(1076003)(16526019)(186003)(7696005)(26005)(336012)(2616005)(83380400001)(5660300002)(70586007)(44832011)(8676002)(70206006)(4326008)(8936002)(54906003)(316002)(41300700001)(2906002)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:08.7276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc06ad2-f31c-48b8-2261-08daeecf19f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index a23e26b272b4..b37400107a37 100644
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
+		amdgpu_ucode_release(&adev->vcn.fw);
 		return r;
 	}
 
@@ -333,7 +323,7 @@ int amdgpu_vcn_sw_fini(struct amdgpu_device *adev)
 			amdgpu_ring_fini(&adev->vcn.inst[j].ring_enc[i]);
 	}
 
-	release_firmware(adev->vcn.fw);
+	amdgpu_ucode_release(&adev->vcn.fw);
 	mutex_destroy(&adev->vcn.vcn1_jpeg1_workaround);
 	mutex_destroy(&adev->vcn.vcn_pg_lock);
 
-- 
2.34.1

