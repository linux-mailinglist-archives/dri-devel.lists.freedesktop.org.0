Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37465E3C3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EC210E645;
	Thu,  5 Jan 2023 03:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C686410E641;
 Thu,  5 Jan 2023 03:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3EOmngewRfbPi00wOwH6+jrDaiFQGnnfW2ZLV7lUNoWstQNsOMgUqy/jF1RPG0Uv9bo4AwG2mvzakLzYGXwfOsnaIeU5eI34VQePUUE2UDbi+wXRUhnUN/4x0TmtKuKjwpl7KePU7IxYPaplTSvabm1WRKX9NVf7T5Wwc130Tc5gqtl4KRQhVtnAQtD4FkXYCpE3JL+nwF90+yDeGIRiJBfVUrL0qqB77jRJC/I+i/5h86HE9Y5KDOEggyURdez1SDpzFdRV7YDcGStR/TWQNU2HLid2+m2jjlktFPr/PXKyZABC95N8wzuy/OA+Iad0DNgyWr/gskoXtjbeAM0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnBIMQxlUUaPi3E6k/HFOdiPcG2PgK9usPYKH2oc7dE=;
 b=YNIhxAc44SCpd9TvetSCWd3FBMOZwcsfiXmLpgYocqU7WxZ3FPqNK++A/EFdtKMmoWqyj3HSZtXnQG83llpJ0HjO3+cRb4EZq3EbNEO4xutfGh5gMh30qtli8s8RgCT8mNVsaQp9sItbIXhKb3QB7i35tltNsV0RJgIUGCExfJXUkivlB0qcCVKb0YqR1bNiN4+LFlg9j9gGujklsjkp3j84UsIoM0cZpJEfgTt90tZNrMuaw/CvlMTcS/1/lA8MGokhfEf3tLqOnAq5K1/o954kXuPtMUCyyepLt4GTnd1GcZNQPkbJr+ZTBhhOfYRLtoAvJY0gKyEwBZ7IoaouaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnBIMQxlUUaPi3E6k/HFOdiPcG2PgK9usPYKH2oc7dE=;
 b=o4J2PTcf5k7/cZq2cqGjPKpqqjdsCFYfZKPup/IfB9wgOD3KB1nq4Swyfi6HzNb/V1d4zpfrmWVzpifHPWUWxCx8etjtjiFpbdoiBU/6AryuZP8XBXY10K0XCFKqll1M6rjZynoariao+M1mtfi+1NbW5EfmjFVya3k5YDWbw/A=
Received: from BN0PR04CA0046.namprd04.prod.outlook.com (2603:10b6:408:e8::21)
 by PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:08 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::9b) by BN0PR04CA0046.outlook.office365.com
 (2603:10b6:408:e8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 03:44:07 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:04 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 08/45] drm/amd: Make SDMA firmware load failures less noisy.
Date: Wed, 4 Jan 2023 21:42:42 -0600
Message-ID: <20230105034327.1439-9-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|PH7PR12MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: d95b5963-7a38-4034-3f0b-08daeecf1971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: McHYCuZL5yGaMYab0AydWkLzuTx7QTabF9XY9v3PUf8T+tM0Mxpv8bD6OAaplH+hOKtP+F44WJipSrU8m6fDju/Jf7rH/SM3tSgTC5gFYG4c017xDmltWGX9Boi66SC4Fwzses0K6X8gv8oRXM+P8psYiA296r1excmbTIYy22uI8Xfzl7fBcJl4+zFSJyrMtKWsicl/avWld4yPkdVuod6euZOoTA9bfeiEakjp3rgSZZHJoBbEhQlDqjZ+d236NWxhsYEToYzkERApUahG4D6KDEguAEUJaxka8e/kqZMfRSYH93xyESZ55jtAVEZpxfpKoaRsrnQbGcPoC2rIqgYlfl2/M3xjufugE8tLrXTDragGL3R12ZTSA+w3Z/SIumb5itKb9waTD2WJWtASba6wqokagvTPCd7Ku1BU4NNY+hNfPTZg/xk3/AcGksr24T0+rYumSQiqggQIvuVtmPA6/H/TXVBJ2yuXd/UykQvMxl8woqa1rhSzQX8TQ7L5T3t7m301L5HFVMu6I/K+Z7SkRvo+IZxWAz4bgOfB57KcNiA7DgM8tZtMqsYOASzduFrgj5In+YFKn0mSnWJ2+Ul92cBpvTWIUPDbJGIDU6ZEfvkkHPQ2it8VbJ2GEROuKhF9LsJRjb4vU6EvbMCK74OeuKc/3mW57V8jyl8JRfX3WN/Te9EP6uXIMtw4sPEzRweb7uY0+fs4AxsQcf8TE4Y1PGgiKxbl7BBGBTKMTC4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(8936002)(5660300002)(2906002)(41300700001)(4326008)(8676002)(44832011)(54906003)(478600001)(70586007)(70206006)(110136005)(316002)(6666004)(2616005)(336012)(186003)(82310400005)(16526019)(26005)(40480700001)(7696005)(83380400001)(426003)(47076005)(82740400003)(356005)(1076003)(81166007)(86362001)(40460700003)(36756003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:07.8370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d95b5963-7a38-4034-3f0b-08daeecf1971
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934
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

When firmware is missing we get failures at every step.
```
[    3.855086] amdgpu 0000:04:00.0: Direct firmware load for amdgpu/green_sardine_sdma.bin failed with error -2
[    3.855087] [drm:amdgpu_sdma_init_microcode [amdgpu]] *ERROR* SDMA: Failed to init firmware "amdgpu/green_sardine_sdma.bin"
[    3.855398] [drm:sdma_v4_0_early_init [amdgpu]] *ERROR* Failed to load sdma firmware!
```
Realistically we don't need all of these, a user can tell from the first one
that request_firmware emitted what happened. Drop the others.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 95e9450f3348..0e1e2521fe25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -280,10 +280,8 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 	}
 
 out:
-	if (err) {
-		DRM_ERROR("SDMA: Failed to init firmware \"%s\"\n", fw_name);
+	if (err)
 		amdgpu_sdma_destroy_inst_ctx(adev, duplicate);
-	}
 	return err;
 }
 
-- 
2.34.1

