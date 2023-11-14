Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625A87EB501
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F1110E476;
	Tue, 14 Nov 2023 16:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0753910E475;
 Tue, 14 Nov 2023 16:37:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZOQFn/m/mxQ3yj1VWvNxWSFUCEjxoskAHvzOAloQUrC4uOyJGQ019goIDUSEcC/nLmK3P+z8kuNZKyuyzSQRSVI9/5MEQz3brZEXnhg4Uj0XH8ejlffdpo6ZPVVYYcX3DkReADinpdtxcwSIab/PdSv+Iq6QW5mZ12Ie3ihD90bKYvL3B4Qu0HVaIzC1FgEQYK7NtpGG4NQca7SYV488nsePtp0gKMFS0Fb295QJCX/rH/sOnjABnpEbVdF8+Z4cI+WdofAPpiqf34jrwQYJCMs7HDiDLc2wDfNepIlH82HrVgY+pJ8a6h2Unh1Aj0m8ZcpL9mK8iOAvF/OiTX8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfR87QNmj52+CghS17sGyioBgxGoHIvFCh1Tnlt9iEw=;
 b=FCbmqiE5B6LH6YjdvpGdO3vy3zSgN2l43/wnsS9mlGGdNIUA4CdZJX/lbQ7dWf5jES2tLuuiQwUYXOsUfP6nbPfBumF3ZV+XLOtv+BNJf6cmE6y+wdLeaeJa0JCeQOzoPOKlxuotBfpvpueiw94QWPG+ByE2WfqNWfeGEu3T2AOJQvfzfm5XtTx5BiPCEJiERF0KQ4rr1UtO9sMYBG2dGgXx+MlRArcoi9p9BBef2z7Jwl3EdBzQRR8VlRRThxMg40TLCNkl60r/WqmpihXHiVD/+4iwHyl1YW/FHhgfGanzyvQ84qNQrqSBCET86AaKsIt5rM3gkrWk9UM1iDW9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfR87QNmj52+CghS17sGyioBgxGoHIvFCh1Tnlt9iEw=;
 b=3Vbrl/V8UkzGoOl9+2KsXZZwCnAECOFfA6HmQ9uKVJ+Yidg8w3PI+Xi2EI7FmOYMh6i3xSmQQ4B6K5WvkdBmgyMlOWtpt+R6W688fIeg645+B7XzxcxgiC6XS6a0+VM9Lx0LFw8PD+Xv8pGFB5z26k0UH7ReCy5C7B2fYtT2az8=
Received: from BL0PR1501CA0023.namprd15.prod.outlook.com
 (2603:10b6:207:17::36) by LV8PR12MB9263.namprd12.prod.outlook.com
 (2603:10b6:408:1e6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 14 Nov
 2023 16:37:17 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::aa) by BL0PR1501CA0023.outlook.office365.com
 (2603:10b6:207:17::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Tue, 14 Nov 2023 16:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Tue, 14 Nov 2023 16:37:16 +0000
Received: from thonkpad.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 14 Nov
 2023 10:37:14 -0600
From: <ivlipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/gmc11: fix logic typo in AGP check
Date: Tue, 14 Nov 2023 11:36:56 -0500
Message-ID: <20231114163702.933693-1-ivlipski@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|LV8PR12MB9263:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f69525-da69-4d80-43cf-08dbe52ff6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VKHZ70MLZT0gvT+1uIV8jJ1XlJai1bC1hiFnqZRuXuI5JcDmpjZlr0cscYoCGF+wiPxe1bdTog3KA858B+heAQFFnrI438UicUqmbKZzUzpWPeB7Srkk9WMIZ40cq802CplKUVF3QSOXwmHEcox559WPrcAMsDiFUEm4qhHYvX7AEubHMeYMGuiwIWcSP8GEWPcTb4RgNLrVkGXFCscxnVbkZVFjixT5GZ3XxlsGXc4WEvOBUTbfDzHhapFsYGy6zwjkTDKLe8LmN/w1BglVzA2C9awt7cw32j+3Xk5FT11ZNYhS3UV+qDwYt9VeZSN7GP3v2reTSPKDn9HKjuwwXEpBBbvBRE5Fs6Ei2TflUmyYoQWCJSBnmTbYNN1XHASJI29DqQtSz5szb2ksxXdi82z5yxxIKrDu4B90rWJFcaoVHJ6Z7j/dLpNysq6voi46xKRHoizeUwGo3qg5LDlpYjLuCUMmWWbgzURZhHK0V3k7hsTRDomf+UQQ1JrSk8MHBm9oNRXbJyvRb6nXha5rO1hHsFElbp48TET/SzDdGUcDgsJ/iMUiicvJhHLhiMyLpx3oaFT7n5O0XYd+HdQRW2FWvQghWTNXUPXSbWoPvHDPep3bsQ/MxTVvyWFuXBmPAdgqtNFzGO/AOh0yhiOrwRBrCK7E9otfehn0MhJ6n9qpTnyRqpEz8UPztT3kZIRlJzR0vJ0tiI+GjKMLhQ+zszl5kPoqpt/stg7nsMYBCcz45XrfQQKaHfuvytuUleHx49m3IUFOoHbJES8Myux8QA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(26005)(336012)(36860700001)(36756003)(478600001)(54906003)(2876002)(70586007)(70206006)(1076003)(66574015)(2616005)(4744005)(6916009)(316002)(8676002)(8936002)(5660300002)(4326008)(2906002)(41300700001)(6666004)(82740400003)(47076005)(81166007)(83380400001)(356005)(426003)(40480700001)(16526019)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 16:37:16.6757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f69525-da69-4d80-43cf-08dbe52ff6be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9263
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
Cc: Yifan Zhang <yifan1.zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Le Ma <le.ma@amd.com>,
 sunpeng.li@amd.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 rodrigo.siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yu.wang4@amd.com, hamza.mahfooz@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

Should be && rather than ||.

Fixes: b2e1cbe6281f ("drm/amdgpu/gmc11: disable AGP on GC 11.5")
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 6dce9b29f675..ba4c82f5e617 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -640,7 +640,7 @@ static void gmc_v11_0_vram_gtt_location(struct amdgpu_device *adev,
 	amdgpu_gmc_set_agp_default(adev, mc);
 	amdgpu_gmc_vram_location(adev, &adev->gmc, base);
 	amdgpu_gmc_gart_location(adev, mc, AMDGPU_GART_PLACEMENT_HIGH);
-	if (!amdgpu_sriov_vf(adev) ||
+	if (!amdgpu_sriov_vf(adev) &&
 	    (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(11, 5, 0)))
 		amdgpu_gmc_agp_location(adev, mc);
 
-- 
2.34.1

