Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4A6497DA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 03:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8A010E03D;
	Mon, 12 Dec 2022 02:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0AF10E03D;
 Mon, 12 Dec 2022 02:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ot0kFp/G3M3tRbHDH1xKuwrTsLwY7SZ3P3tzxOmXl7Vs0y6veeJ1qA962Q4kVwrgyakhqluWptWdsAP9C5qWmwpswm5P+rNKglHF0dOGPUbfq6KhcQQI2JV9aNeA2Jm8k9WL8bzrL7KbR6HRsucGbQuKBQuldShVurtb5mlHZp3A0hcIqlPHkQwKs0N6Pxpbj3HZsKeY+KvhLPqjaDexjoZVUkfnyc8Gc9lwmIJfcu01DNxVR8LTNnuuN2XAbFaZTaUHEvU4jvCiWG/h/ByhcjUI/vU/2L1+wANJeCeO79QFJWsuAtNoWzZuuprWZqDosOzOrX1p1xTr+Gkb7waimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnsehzLWFr7Q5ErvmX+n4zY2uq9VEeZ4xB55tXWXaPo=;
 b=PnEWKlU0HiRInLGrCE/UX70/8WE5RzTUT6RY9SJyWWZjEYIAGee8z8pTRRugRMgAsSJUcsvsmum99DdQopzQ37HA9p3za2d7ByDKqS513Fbr+uiFfTvaLxtJIxiJdoX1wwNzlG4hPZxB341bLb6yaAlkmHXUIAZxRaBgMsn9V0FYUSK/Aa7MVqOacQ4fjUCc7CrCIkX8aS2p1DsBdMRuPMZ0KvbJTVqcJndrfAMXB8z6ZtqnAqDMn5jMzWZP1hgrxWv4+IiLInwL/iCvBIW77n6kLlBNyOjrEbHVhMwnwko/sGr0q79zRHGkWjd6PUCpmNpo77QVVMKMXu0zEJmdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnsehzLWFr7Q5ErvmX+n4zY2uq9VEeZ4xB55tXWXaPo=;
 b=ZT06+xIlLyhPSPYO7aXYjT1XLCYL1yy/naaeFvome8So1eLiJMoiIC+JpGoyuQ4LdU1SoGMq9ZcfZZs9wD4Y/6dnlLTn1sJIdlGJeLQa+XXsgR8/7jFPqBsGKkSdFtMi3ulcwRkFZ8N1BZ/4p63HzOPG7dhky0I/VoQL9MrQ4U8=
Received: from DS7PR06CA0041.namprd06.prod.outlook.com (2603:10b6:8:54::10) by
 DM4PR12MB5938.namprd12.prod.outlook.com (2603:10b6:8:69::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Mon, 12 Dec 2022 02:08:49 +0000
Received: from DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::e2) by DS7PR06CA0041.outlook.office365.com
 (2603:10b6:8:54::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 02:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT083.mail.protection.outlook.com (10.13.173.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 02:08:49 +0000
Received: from localhost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 11 Dec
 2022 20:08:47 -0600
From: Luben Tuikov <luben.tuikov@amd.com>
To: AMD Graphics <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/radeon: Fix screen corruption (v2)
Date: Sun, 11 Dec 2022 21:08:21 -0500
Message-ID: <20221212020821.8248-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.39.0.rc2
In-Reply-To: <20221211114226.57398-1-luben.tuikov@amd.com>
References: <20221211114226.57398-1-luben.tuikov@amd.com>
MIME-Version: 1.0
X-check-string-leak: v1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT083:EE_|DM4PR12MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: c280ac75-e29f-4f13-f40d-08dadbe5cef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7rinKrhlf0SSmj+svovoiBCMGI94Qr8RslkbYz+4rBsjGBiG705oseNNOX2QLX/NWS+f8Fw61WrAd62gdzZ7jj23oX64jOeda4ekm/MN+oGwxWS5cKcJHk091XlI0OmxkBq2UNu2mVnsK4r0FUHh/rbpQBgNIitgNi9OYCQZjrg3ffJxhxS/wddVisuUgRuCeg3b9mYzLCXGPhyVMWouPlrcgnm4/5TsT3XWYcYCXJJLFtkRHfFMn/bgySjce7jkpSiIwUyvmGS3023JvwMolTD79OAKKDVwx3BZVXsWUofMYVn11mAVB9sIxLDTdfJDDSJz4iXbA8YaUZlKhWlx/5bkgxRb7E12c0ZJS2EUlgjFxBRz2Kij2k/Bkxc7YYTFc2mq4meV8NsGILMUyRQ/2WENfgDldU+lMBrQ1adB0LLHgIXqvgLqhMOcjmL8VAFDkVmWvCdx6GrjwlDETXekjjX9TrUE8NAV3l3r1K2iohzSjIpU0V///TuTt9vgjjQPUiZJAQ/MSP/UdJOfzLCYCL1fAJP0wTZRwYgsyJqWvYse1eEBNWhcfzrFs9lQXumnA5DtI2TnrhDzECH/hZ8YfhBe7RVLrTTsSFlEps7b1s3Awm7YMm8w5w45QN088BdbZeiZYEr+0zvK6hkSXCSW97yjYxbyS6CeirB+qG+psbZwbo+UZ1aMFywimbJuoqONeNz80cJGi2ugnA5dNhpO5gwEHyFnrSoNf+cDB7qr7s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(426003)(82310400005)(36756003)(316002)(83380400001)(26005)(16526019)(186003)(6666004)(54906003)(7696005)(6916009)(40480700001)(86362001)(36860700001)(70586007)(8676002)(4326008)(82740400003)(47076005)(356005)(81166007)(336012)(70206006)(478600001)(41300700001)(1076003)(2616005)(5660300002)(40460700003)(44832011)(2906002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 02:08:49.1824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c280ac75-e29f-4f13-f40d-08dadbe5cef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Mikhail Krylov <sqarert@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix screen corruption on older 32-bit systems using AGP chips.

On older systems with little memory, for instance 1.5 GiB, using an AGP chip,
the device's DMA mask is 0xFFFFFFFF, but the memory mask is 0x7FFFFFF, and
subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
false. As such the result of this static inline isn't suitable for the last
argument to ttm_device_init()--it simply needs to now whether to use GFP_DMA32
when allocating DMA buffers.

Partially reverts commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713.

v2: Amend the commit description.

Cc: Mikhail Krylov <sqarert@gmail.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
Fixes: 33b3ad3788aba8 ("drm/radeon: handle PCIe root ports with addressing limitations")
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/radeon/radeon.h        | 1 +
 drivers/gpu/drm/radeon/radeon_device.c | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c    | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 37dec92339b16a..4fe38fd9be3267 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2426,6 +2426,7 @@ struct radeon_device {
 	struct radeon_wb		wb;
 	struct radeon_dummy_page	dummy_page;
 	bool				shutdown;
+	bool                            need_dma32;
 	bool				need_swiotlb;
 	bool				accel_working;
 	bool				fastfb_working; /* IGP feature*/
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 6344454a772172..3643a3cfe061bd 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1370,7 +1370,7 @@ int radeon_device_init(struct radeon_device *rdev,
 	if (rdev->family == CHIP_CEDAR)
 		dma_bits = 32;
 #endif
-
+	rdev->need_dma32 = dma_bits == 32;
 	r = dma_set_mask_and_coherent(&rdev->pdev->dev, DMA_BIT_MASK(dma_bits));
 	if (r) {
 		pr_warn("radeon: No suitable DMA available\n");
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index bdb4c0e0736ba2..3debaeb720d173 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -696,7 +696,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
 			       rdev->ddev->anon_inode->i_mapping,
 			       rdev->ddev->vma_offset_manager,
 			       rdev->need_swiotlb,
-			       dma_addressing_limited(&rdev->pdev->dev));
+			       rdev->need_dma32);
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;

base-commit: 20e03e7f6e8efd42168db6d3fe044b804e0ede8f
-- 
2.39.0.rc2

