Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DFB65E41F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A1B88130;
	Thu,  5 Jan 2023 03:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F100410E68C;
 Thu,  5 Jan 2023 03:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiwEjEogTJERwcXMqrvsapB9p7huc9ClcxXMjRTTHs4BrdAoNoS2ipVlMdO8jyV1hCBKjEmCRU/AXAbbgT+SBQcavln41T8egOqCdS/rAwHZE9JntjE4iHw+W55JhJogTQ+4jETHiGshON1AYSX/TjH87+CKg/mYnCWYu5TQoEVeG/RqikAeEtd7TGftEABpyaiXtcEYtQAOfqGeA53Y16MacRBpjlFvnsqWtDH9dlzbFSt6k+r2bGwPGU6c98y3SGossImq+vfoJtfvWWQInRAsT9tHaojfpj5W62JrOy9IAh+jRz7y/4XJI5sxTA+Bs11yHxqSu09e6tXIP+cLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpwUsRn5ZXo233PjzNNHVCf0rRtJFbp9st4DukpH9gE=;
 b=H8nFtMu/9p/eZu9od0Ni6VK18sZwiKZ4JoMYwAm9rcWXZnAOe6s6YwjHqUStRFlUKSj+hvVWCDDNs+TZUt+vJ89eWBoclMLIDdXtlTyvILqbynvcMTU2qw2jJLa6oylq6oVSOBdZIjTUuulnH67HDrvqcDJzgWar4TelFL25ulvb3VM1UdaEKnxl3XAWoCjjjPcB7/F8vxQZKRujdaCJKJP9Zb9erjhnDxgU1hYrYOor4nQZF1bOWf9a50arg6ZSphucRMkcDek0Ey8ElKdeFrliR/K2V456UEPNSlYOs/lqJLyJ3Fszm0gVtbzEQO5xxgMToTnZWW+KL0naIF1dKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpwUsRn5ZXo233PjzNNHVCf0rRtJFbp9st4DukpH9gE=;
 b=spJIkeZR8mtJ8SFcQBhxgQUIvFvpxH15NTdVmhvYPkxUo50o9bSYbO7WYMgAXp7A6AJAStNeBCmGRmD0ziPZ+goXsxu8FCbFyaYKuloy8hgTtfuJQq3qupn13lxWumO/UD28ip4mi/JXHqZCrbvK0YpQn9rEvKaAeuToApp//3k=
Received: from BN9PR03CA0569.namprd03.prod.outlook.com (2603:10b6:408:138::34)
 by IA0PR12MB7532.namprd12.prod.outlook.com (2603:10b6:208:43e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:45:11 +0000
Received: from BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::a7) by BN9PR03CA0569.outlook.office365.com
 (2603:10b6:408:138::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Thu, 5 Jan 2023 03:45:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT077.mail.protection.outlook.com (10.13.177.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:45:11 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:45:09 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 43/45] drm/amd: Use `amdgpu_ucode_release` helper for
 powerplay
Date: Wed, 4 Jan 2023 21:43:17 -0600
Message-ID: <20230105034327.1439-44-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT077:EE_|IA0PR12MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d11bf4d-7161-48fe-7d76-08daeecf3f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /063DpRIKEujBmy8h23xUsld+QttZ/QonvxdUTdgvac+MoJSS7GWXfkicDpbsD4oiMQ0xIjFu+nq/e0EEFU48w0EP+L7hTokFs21ntxLmMXp1ZJmvzde9S0mVJEULxVbx/n/gtJgw4iNIL9cxQfjogCsyRDyrRT79E6lR2Gu4/1nX7Fc1fF3M2oHU3zG3JpYGriwz0NFaEluJw/3SG5B3KVBP63fQXyrNiZqplMRSKNIn/iFqv2WGcUS9iO2ftYW9Dhq150RUL6hClc3bz7zw81dwk/CaW6k+P3OFmHniUnBLPiic4k+lF0GefROfS2eoabGHaj+QbudS70aTu1zs1zg1uPcz8wn4VFqk3HG08mCtwM40AvxVjs2E2pjf/ULGdF9jz6h1T0VRgbTZ0UIpYqZQq3tNo2GqNVRUEa90evC9Gq2tag6olr7lYx4cEjyzzkw0sd5b58biDG5Rx2ovd0OWIohLd7X+YZBfg3yveId4chXmL2RL4GA85JR9IG9kggILrAEKUXtNXZBM5lTxz2cYD1KeqzjBHwiGYX0sK++Ly0/OXUtxTzFtDxUeQouwxpUSjCL0olFLzskPKYiFdkCUNPJNxt25uVCKRGUxPTPaxfy53iS2oI5xb+vCPDTA+f7s1SBZIlikdsUq2xf32oc2v3qbtS2BDEyTWmbp77yhTIFLu5/5MZkpM7QCXvYjnciTywOvJSuBOBro5vkvL+RFNKctwxSlzNKGyk/jBMN0xmfsUot5rGYde5G1lYWv0JoFi2WmuF9XKZHC57pKw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(8936002)(41300700001)(8676002)(70586007)(70206006)(5660300002)(4326008)(4744005)(316002)(110136005)(478600001)(54906003)(2906002)(7696005)(6666004)(47076005)(2616005)(336012)(86362001)(40480700001)(426003)(186003)(26005)(83380400001)(16526019)(1076003)(81166007)(36756003)(36860700001)(356005)(44832011)(82740400003)(40460700003)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:45:11.8083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d11bf4d-7161-48fe-7d76-08daeecf3f92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7532
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

The `amdgpu_ucode_release` helper is replacing all calls to
release_firmware.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 8f2cc6310340..11b7b4cffaae 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -111,8 +111,7 @@ static int pp_sw_fini(void *handle)
 
 	hwmgr_sw_fini(hwmgr);
 
-	release_firmware(adev->pm.fw);
-	adev->pm.fw = NULL;
+	amdgpu_ucode_release(&adev->pm.fw);
 
 	return 0;
 }
-- 
2.34.1

