Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A794965F1CA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F25010E77F;
	Thu,  5 Jan 2023 17:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2071.outbound.protection.outlook.com [40.107.212.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530DA10E77D;
 Thu,  5 Jan 2023 17:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCrq0l1Tqe86nbi8sK14vVkw76TRrTVHl8Lx9Fw4AohWPogbJj4u7HC41Hn1Pizs/FJr1odbMHbBe5tYyIzTW2pP5sTU6ekn+r1nUYMrjfBMb0oKI8z6LsCjh/gSmeIDtDCIZookBLX+1qKV8E6xZynNIo35s1rp2k435m48A6WKewax0P2WQaFOpKhDkEJNjGHaVpyCFKOj7M0BbGPvcAIqkT3QsKIA8SZ+rOHfPoFBSxY5mX0dUm2GuXltfWzKsEfyI3+ytR+69mUuPhR+TC0hYjtfohF8FCTBq1b/6jZ3l9rBxRMSH0j+dHERb6kCraW5Pe6y7e8VfHyV76WrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+TXwvEG8zK1DNghCeTLxuq/XEH1oMG+xdv41ugskGs=;
 b=kYi3P8wzaf8IqLz7VxEdfyvuXBPl1VfVwWEx/Vv7ryePOGoN+1d3iq2z1DCXn5XArTXwLp93QDQwsNRCZ5V28YZTW1Ic1TkVHsNe4IinI6Cd9rm+s8SdmTMB9tj6NjwSrfODDk/nXcdTNjAmXfYxKuvdJmZJ54qOEbb+G1UrVKvbyjQ1nEHhy4eBBu13WNItRa81BtxWOCRwYozbM2jEdoNYgbSr88EzqIld9pJsxQGBWBscUy2UfNgcJHQOtTCwDzkzQ4VW/fgQTflSoNcCX2d8PuXBpAf97G6thjjlaRr1Na+bBocxsKi8waCumuuuggka3QQTH4w6efUCbMrEyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+TXwvEG8zK1DNghCeTLxuq/XEH1oMG+xdv41ugskGs=;
 b=eMEsXbk67tzdlDZ2ZWq4/QJApxSIKORIIZitgdF5eo7lAhr3wCvh7BbzvV7Xgm3SMUpgXLt9hqbOzjpUyxJ+1nwDtultiujBSBYidVjgxJB9uSuw20JfhvRHTeF+Bbyxx/EnICVViP0KDVZacpITz8zL9Bo5makJ1tfZv21g+60=
Received: from BN9PR03CA0378.namprd03.prod.outlook.com (2603:10b6:408:f7::23)
 by PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:15 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::c7) by BN9PR03CA0378.outlook.office365.com
 (2603:10b6:408:f7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:15 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:13 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 13/45] drm/amd: Remove superfluous assignment for
 `adev->mes.adev`
Date: Thu, 5 Jan 2023 11:00:59 -0600
Message-ID: <20230105170138.717-14-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|PH7PR12MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 84dfd0b3-396a-4c55-2ca1-08daef3e986b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qp9wrFMwzSmS4cZDm7xcYBEefoP3jvjKZCa+p7F6abYucSlAOyR4pZt6Y51xqhJB66R71AQq2dTsAIP/EOo4KY0yxfPBC/6cyi7lra6SN7qv++s5sjz+6jFDRTBWEltRaPPHEYAsNsROI+1JEOaPQ5eNKUezwlNLRkbu5tZcVAxXVbwbaOlGC9I8drT7htpdmskW9bZUWgVqmT+BKDUAvtrRJtZpKLxcfBNVRSzow0idtBQQ93u4SQgC5kzhn45sfEdjaFIGooFfD3TJkCKxorOdooFZeq2qslxI8zOzOR1OIWFjiyCya2Q2tDZ4ikjCgL680pt19QWOMnNg3l+qFtRfli0TAIE90dhW+A8n92zDxtpeAO7RjSBiK/KP6RmNt/jRURTLTrgeDHbv0XlpKFi3k1OvacJaLU+28FFF0IITQH1JVzCn59shsLqTCJz6fCaymNFklm/Nn60nwZEmrEdqfmVrVz7Em1TtSohbZCuNN0OGinwKkSJ8UuMv5QO/V4FEdatUgJ6X5FI/EvftnoRf0BXOlDI1ncVhmQau+4okNVt+FoPgezul6tdxyXr/f/z8JHnt9maxLTOSyPWEiUnX6rkIzXgv79cnhAIOZ8fuIWJl5eRVdLigfLDW94cpjNKirF9a2WdATACDOC8wN1wb/Y/qKCYUK112yZjx6I83nUHvsoIRr0Pv8vjCaUj22kL9DcgtyXxfMMrg1yPI4QZ/WQW8Sv5xggymZtRPI5hXsORvBNx97PHoUc5X+MxLPrjNa6kVPV0fPWuUKYikxA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(81166007)(356005)(82740400003)(36756003)(40460700003)(40480700001)(82310400005)(86362001)(36860700001)(7696005)(16526019)(186003)(1076003)(47076005)(2616005)(26005)(54906003)(336012)(110136005)(70206006)(478600001)(426003)(70586007)(8936002)(2906002)(316002)(6666004)(5660300002)(41300700001)(83380400001)(4326008)(44832011)(8676002)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:15.0049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dfd0b3-396a-4c55-2ca1-08daef3e986b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015
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

`amdgpu_mes_init` already sets `adev->mes.adev`, so there is no need
to also set it in the IP specific versions.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c | 1 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 7848b9de79ce..2e2062636d5f 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -924,7 +924,6 @@ static int mes_v10_1_sw_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int pipe, r;
 
-	adev->mes.adev = adev;
 	adev->mes.funcs = &mes_v10_1_funcs;
 	adev->mes.kiq_hw_init = &mes_v10_1_kiq_hw_init;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index a0125e103007..a36b0f14ff92 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -1013,7 +1013,6 @@ static int mes_v11_0_sw_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int pipe, r;
 
-	adev->mes.adev = adev;
 	adev->mes.funcs = &mes_v11_0_funcs;
 	adev->mes.kiq_hw_init = &mes_v11_0_kiq_hw_init;
 	adev->mes.kiq_hw_fini = &mes_v11_0_kiq_hw_fini;
-- 
2.34.1

