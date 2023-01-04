Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B9E65DA7B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4D810E5A6;
	Wed,  4 Jan 2023 16:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865C410E594;
 Wed,  4 Jan 2023 16:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHsUuafHgwz8Gs34zlqbt458qkdDEr0LtwkAwhKoEmBLyIFzlfJJi0LRpYgvUuFhEELNXHb4Wj4+ifNa8fTJQmANsu6//XLSmioUh7R0MSVYtwtDy6jnFjSFT1Xe9ic32wm/0iQQJvlirneH/Ykkr4Fm6MmWmvqKOJye1KaqjDlk5nojFANN1kzpDOsAlfR4zZQQSCJfS8n2lTWLblRC2eiMyNxemizXch9p0tmMVei2DUApTwNZMsSfZoI8XLF8dQx10w/kUDzWigFGZwyoMeeA/uJDctqjb56/DMx4xcFhhMtJc2kXWy4DlsVrl2rODJ8dDJYTZIKENACmKSZgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGuTatsV4PKGSiz8zb6WiZQcsevMtBD8OUcxb+n4fqI=;
 b=H7/heNOVUwk70kBX0W39j3OfqQd0z597nUPS9gUYO4Nv2kThWKwg2jQ56OAsvKjbN3zBkwnnER+XSd1/DdvkKPRU0FsBzRwayIMDY5uWJOtmha4235lYjqDOShEYf8GQZb7V60/OcVgTAZNxYnIOIRi8TYwX1tjV87faEw+3PzO7RQIvoPRypxUs6Gl+839i8M0F4QpoAMvf82hK4z4CUeQwr9sHfenxbrC7dE3FjZUaD2VU9330ewxb3vQCH/V4twZQNtN0P33pRN7xXDVIQIl9qnC45SN1MK5ltrL0n9mTrCLVrl9sWzdNFwN2AhCgMKaLKSVQC24GsA6wzM3slQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGuTatsV4PKGSiz8zb6WiZQcsevMtBD8OUcxb+n4fqI=;
 b=gjZEFz4Ws4eEv3FYH3sfyxK7rrpxuaxBW2csLhaRzi/hvSBrmp1PBdOmqc1VHgcV/1JbhO7ReYztfahmkNSaIfVEMPEP591Us5mTNtpJtRCoRhG+Yw6szAz4jDaZfg/kM11as3zvsWW1nHoKE0dwn/UsZj4xCvt/xwLc7E4I56Q=
Received: from MN2PR14CA0018.namprd14.prod.outlook.com (2603:10b6:208:23e::23)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:34 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::4c) by MN2PR14CA0018.outlook.office365.com
 (2603:10b6:208:23e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:34 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:33 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 39/45] drm/amd: Use `amdgpu_ucode_*` helpers for VCE
Date: Wed, 4 Jan 2023 10:40:28 -0600
Message-ID: <20230104164042.30271-40-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 91360a0b-6f6f-42b7-c4aa-08daee72f5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9tfuP5XBdSI1Ph91dC33pj8HgODwnsD+V7sLR/9tWo9f7bKffHDRek6ZwwTkFDLQBMHQ2iqS6S5xIJbFCxy4/xlsmAOaggDS9S9y4TSIEtm08Z2XHukMTpvCHuJhjurSOyPYstQToLghDRWHnCJf8feHrIBibfb2k3XVUYS0JuKDrFiQJjvfEW+cx/SMRtvFPd789Wg1j2Uj8ZJHdL0Ogtk/2CHcQCPaikrUUYanbZikzmq6hZmbyYBF/J9SayIiaqTy9v/iln0VEwP63v/B/rK9JyqY5/Uft7aQRRkeMhP3ri2vuCLJ8j263565HYhWzk77Fgg/I97mJutZTvysUMnjDpFSO7DUAe3muMr82CRjNpqnvZcYqU4lWf7poPBCPXsmw1V1nHqlD6x4YZJI5bhm2efLUNVt+oo4S7Rlur+us8tXJSX08OKRVmtye1leseD/s2YgaJFt3lUZWsm2219qud6ZOMXGgqYZzbsOxgGnfZhAqXCkAIcNXyX3rGSXAULNDcuPfSnR8li21cAjpLxaVCzTd5lLNozkiv8G2FMzPyZ/IKL0E4ly6wTgGPwBPwrrcbfxi3FjLMPZxt2OMCBOBtW/bhheqrjJ7u9h3StShXzSSQYGkdr2gRyIxTuIr8WqsLWzQU5jQ/AfpoiONRV0usyduM/ENFpssKb8XpcusgVEEMKGJixDMs3gbPyRzWeDY3kNadZFwD9DtwgJ0VP4aCdiwZs47kMlAaS0HCDSaEyKDor7/s2wPqo0rq4e1v3TUT+ZA/EvTbI0CdUVXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(70206006)(44832011)(70586007)(5660300002)(316002)(41300700001)(54906003)(2906002)(4326008)(8676002)(8936002)(36860700001)(478600001)(110136005)(82310400005)(36756003)(7696005)(6666004)(1076003)(186003)(26005)(47076005)(426003)(16526019)(2616005)(336012)(86362001)(83380400001)(81166007)(40480700001)(82740400003)(356005)(40460700003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:34.4642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91360a0b-6f6f-42b7-c4aa-08daee72f5df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 02cb3a12dd76..019763f7881b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -158,19 +158,11 @@ int amdgpu_vce_sw_init(struct amdgpu_device *adev, unsigned long size)
 		return -EINVAL;
 	}
 
-	r = request_firmware(&adev->vce.fw, fw_name, adev->dev);
-	if (r) {
-		dev_err(adev->dev, "amdgpu_vce: Can't load firmware \"%s\"\n",
-			fw_name);
-		return r;
-	}
-
-	r = amdgpu_ucode_validate(adev->vce.fw);
+	r = amdgpu_ucode_request(adev, &adev->vce.fw, fw_name);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_vce: Can't validate firmware \"%s\"\n",
 			fw_name);
-		release_firmware(adev->vce.fw);
-		adev->vce.fw = NULL;
+		amdgpu_ucode_release(adev->vce.fw);
 		return r;
 	}
 
@@ -226,7 +218,7 @@ int amdgpu_vce_sw_fini(struct amdgpu_device *adev)
 	for (i = 0; i < adev->vce.num_rings; i++)
 		amdgpu_ring_fini(&adev->vce.ring[i]);
 
-	release_firmware(adev->vce.fw);
+	amdgpu_ucode_release(adev->vce.fw);
 	mutex_destroy(&adev->vce.idle_mutex);
 
 	return 0;
-- 
2.34.1

