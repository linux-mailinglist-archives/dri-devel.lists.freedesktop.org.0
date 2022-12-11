Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F11836493FC
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 12:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E78310E13F;
	Sun, 11 Dec 2022 11:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4045410E115;
 Sun, 11 Dec 2022 11:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSGkv8QR/bLyhomCnPRwHfn5GncrdOIxgsIqxlfo0+E1qHdXXwyWYiGGs4A6SCGZnpfgKlwdWrnPFMbrHO8MXxBRBNcshWgPA2sxgb/SkWFzIMmTwHlrOIX/L8bP60pgLo6SFEtQoi66/Ix8fnfu/QTROIxpSYz/kIHJZnKPm4BwxFXyy2Qd43Wvie0YhXeC6brycT8uuEOSaRY2dQtaw1rxU6rYvkZ0+lIxD1AhiMMversunBK258DX3iMdbVL0af2rdvGSuGa/wN4wUX9tTzNFGiPCbQsMgL7x0XAuDiKfk2mE1jGDwVhmkvmS9gGITrM8QuReHUdXIvkbRyzIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hot4QXe91jHab25CUQ3zKQRJqu/0YaK3Q5DNlGmpOVw=;
 b=I9tkZAjWmZ7Frckmo8/KOzY5Eo8yETKvoO8gqC1bVCi9QqNaIAORmSqCkf145xhdhwbcXe61/VXOLtluKcoecRza3OMdbHZomFTRYLNq03vWlqH+LbmHPfnhk7FzTFRx/G1FiVrJ+xpr75s8QApTg/hPk+m7OSOufuU0UbfxBto8fnU+6KwWbfsnI4esUddrJ8tlEK8FGGLq3D7GM4v8ZBiJYysM3L6nakfKeq8MAo9Pi5tj5VgKYd+0Bwqr92wTPPY5WFi6VZdVF07Uxt4iEiN+8fv3sRuQRvkqvl3YJ1GEh9gIDETQPHMJ2uHea1jwgQdzyN993F02BbnELpv/Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hot4QXe91jHab25CUQ3zKQRJqu/0YaK3Q5DNlGmpOVw=;
 b=MMlOiBkF0dcwNg2wM6T7w2n9ST4h9p50twSnZhiekWXYGmzhMB8fDZBO0HBsMVAwdVIFZYJLauOAYm8FhPZPoL6tIgM8XzRyyb2tPTCWOFjBEnMjvo5xIsXpnRyg6d4N776d+5KHdTA58sFYNCnrDxE5dxVkyAABg9lHu9oF0Sc=
Received: from DM6PR02CA0122.namprd02.prod.outlook.com (2603:10b6:5:1b4::24)
 by CY5PR12MB6347.namprd12.prod.outlook.com (2603:10b6:930:20::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18; Sun, 11 Dec
 2022 11:42:42 +0000
Received: from DS1PEPF0000E657.namprd02.prod.outlook.com
 (2603:10b6:5:1b4:cafe::91) by DM6PR02CA0122.outlook.office365.com
 (2603:10b6:5:1b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Sun, 11 Dec 2022 11:42:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E657.mail.protection.outlook.com (10.167.18.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.7 via Frontend Transport; Sun, 11 Dec 2022 11:42:41 +0000
Received: from localhost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 11 Dec
 2022 05:42:40 -0600
From: Luben Tuikov <luben.tuikov@amd.com>
To: AMD Graphics <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/radeon: Fix screen corruption
Date: Sun, 11 Dec 2022 06:42:26 -0500
Message-ID: <20221211114226.57398-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.39.0.rc2
In-Reply-To: <2b7cdb48-303c-2de0-60db-95d2fa204150@amd.com>
References: <2b7cdb48-303c-2de0-60db-95d2fa204150@amd.com>
MIME-Version: 1.0
X-check-string-leak: v1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E657:EE_|CY5PR12MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a5d9fb-0785-44d4-37e5-08dadb6ccfef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z10R5Cprqt5BBwgIZ/niwi0v29Y6fDkhcXw4/u7J5lRjntjk8G8whp6CiInLUY6NzyOwamwLNCTS06jFkmAEmeWSVObt4nvHlamYU91s9zyF58//heVyXLIL4Qx7y13vWVlvr/xkbL+cUr0DFBi1s9xqChFAUX5kZ/eitHpgtq4N3nxz6tVaXwVpq9pV85nqUC58Tw2DDq8iBkJGap0Wg1AxUVQV8q/vOGauYRNNCP0cfy0qdD/gh3b6cFXnnlpFgoNrQ26Vdp802MOFfbkVEBxhDz2Ff6uOGKhVC//peWOh+RxVTWx2vQTegVq1j823ZrkEpOqmRA/qbpn5sZrpD2ZW/OpeCUt/SVHHmg3wESH/FGSbxubEN2g58D1sothgr5J3gBMuWyRoCDtLpb+7YeJKxMOlTETtMy/Ps3KkRE8XB2NubQUQD/jIMnRFdIM1zTfdw4AZKCU0GULVxe00EmyI+17QO0aCQdx2PDOwX9Yx7orY4wH1nzr6KvpK9BqabIkCux1DA+rR+HwK3E/TRsVoUEj2Za+LQ3/JA9v7+REdncwXcY9ZX/gFM/JC/PjhUAWiWcQZBMfRsL9yEGzgjyRyHTfhC6QYgoYnqI/jitqE2JVfgXDonNDZLCCCxvwRoEgO/4F4KER43bIuuRDWAw0dVW+qU0tvBFGwZVv/BhbNGIBxaWk2A5UB52iHywyLutf9elr0S1kNctRd/lmbH7CWOx/6IyLvM8DG7AmZ2Yw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(6916009)(6666004)(16526019)(336012)(86362001)(41300700001)(478600001)(40460700003)(54906003)(36756003)(186003)(2906002)(26005)(7696005)(316002)(81166007)(47076005)(40480700001)(426003)(4326008)(2616005)(1076003)(8676002)(5660300002)(8936002)(70206006)(70586007)(82310400005)(356005)(83380400001)(44832011)(82740400003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2022 11:42:41.6921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a5d9fb-0785-44d4-37e5-08dadb6ccfef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E657.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6347
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

Fix screen corruption on older 32-bit systems using AGP chips. Partially
revert commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713.

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

