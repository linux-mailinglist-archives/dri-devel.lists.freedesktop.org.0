Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEA58682AA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3944C10F25F;
	Mon, 26 Feb 2024 21:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GSCb9JST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527DA10F049;
 Mon, 26 Feb 2024 21:11:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuIgvSoTxo7mCJliDcihJxpuoriS3XBGseC//CjeKzoncaNEMUFXKcoliXuwGESfkRBVQ+UagUHcZs4ac7xpUw7IRX8wPBHjaj1sd/4i9iJ4GqYeWSIisX5P9W/Q9HeTmZtiQ/eF/DVjzhoTtDWgYS7ox05frr6JzgCjQ+hk+2QGnhpd7LCs0jvzXjJNsN+pssbk90K5u16nazM+ZSbcD+RX1DJONOl3d+vD5ESY5qaHwbAk29Ce6Fxaz6ncb8d2u6UULelJvomhgE8IujDDwXCE+GU98aQvr7Gb32K7xGP3qFQcFNrb1XbqXVeFVHXAyL1Lc7FGWAAeHSmCZsmsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgHLOQxgnmBEIu5XPwPemWgeDDPNZuvVGMegyu+BqN4=;
 b=do2Z2Z/pY543PYuYZ2dJ12/nqZOUii5q7cMoNvqI5gGws3OiG7JDYMuT8Q01nmIQrXd6k/aw5W0IMPjNz2iTX21oMwgMg7xJYoGtveWX1hzCiVetPctMKGSpZH4Ar/lTcFzXAp5gXRimt5DF4EYfr4patFwm+++9HI93ucRjNcAD4aIC3pNLbeVq4HqTd6+ANPQL+zP4g2HtaJF6bUFvqahyadf6B9bTyb9XqrTHUl/OKWmZBGeSOywCCguagapz0N/JdsxRcT+dezQJKZrRiFCY/2Pz7YBxEQwjbw1vEHoHz0fbVoXUgUbXDs+P6KKFamwSUyIc1stft6x5Pte8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgHLOQxgnmBEIu5XPwPemWgeDDPNZuvVGMegyu+BqN4=;
 b=GSCb9JSTlNltuQWyEnUNLFiA6LQbUrJnpJXLuMLHJ14lrBCg8k1/jd4WIGXqK3o7Wn9ZH/mPA52X7/pW0IVTI98ImnscrHHMPdTNTopEOZE56bJGQf/Rpg7LpYhnJ+ERs1zp+dkezSF+9XX27WhYgsNl4iIdY2QUr6LfDmDfj3g=
Received: from MN2PR16CA0031.namprd16.prod.outlook.com (2603:10b6:208:134::44)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:29 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::2a) by MN2PR16CA0031.outlook.office365.com
 (2603:10b6:208:134::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:29 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:28 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:28 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 36/42] drm/colorop: add BT2020/BT709 OETF and Inverse
 OETF
Date: Mon, 26 Feb 2024 16:10:50 -0500
Message-ID: <20240226211100.100108-37-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2d3298-bc06-4342-3b63-08dc370f8015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dFalzkgXJ0J7iC8j4zf7il5a14wA1o+7okI8RScX+Os5phF+uxaVRBkUsYtHm1q0TpUpncyCbOs3Qu/LiPCi68w0Y862eDwlJlrirWQMvr1Lbq6IjZ1bccKFSLR24iA2ro0YYAfhhDBat7WJ+jP9YQCDh2umJyTdrD9AhNuVZKMFRhjpCRxoDnh5lQ/OwsEEB0gGp6rmQzj/8lziDYdbQnHN/159DbKQGHsjwf2TWaCWb9sXVV1omlDlgHKfzOEH09xLZTlTPlZQAWIdl8Txi9yPu8NWXva9bZtGfw2gmx+ifVpF7YDV1FKwM8qXclMMS6gm/9946HSSKPBZDCXWLQKSb+jBXInQ7zEY3f1BghC+aOsZkP+LpA3ufC9cN9NFfNdorDRnBGMokQ2e3vwrtOYRNnQTT+a7mpbBMAfoKgs31dIdAtAmd32nWK8GeXs31628Qhjw869YF0XjVSMPwikHYg983rj7UIooYBfXbAeDU9SD4r+m9ztTlSNZKUjHbMRtz3yjUoF72x+5New6ltPkVkd1wRS7Dz+uLRvK9kQ+awH8gBswlicqte2M9TaIg2OOmRLzhT8cxxUCEUF/5kLY2ISS5Y8lGxzZVZv9Y44V2LBVxiK4wdWKshW27PCpNjG/l2WXRbFF/RbHYM0e4X3mQbcXs3EfqkvwkXGBO1Xg9VJvjpduT4s7Lh/Ex2YAEq1cL70QsWLsVklfwIPkaQnVbP3B9hUHluTBtaYZqxkS0phL/du60uZyqDRKrRty
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:29.2211 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2d3298-bc06-4342-3b63-08dc370f8015
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BT.709 and BT.2020 OETFs are the same, the only difference
being that the BT.2020 variant is defined with more precision
for 10 and 12-bit per color encodings.

Both are used as encoding functions for video content, and are
therefore defined as OETF (opto-electronic transfer function)
instead of as EOTF (electro-optical transfer function).

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c | 2 ++
 include/drm/drm_colorop.h     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 781947e42b02..b10cad5a7208 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -40,6 +40,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index e06d9ea28efd..28b3136dabad 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -33,6 +33,8 @@
 enum drm_colorop_curve_1d_type {
 	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
+	DRM_COLOROP_1D_CURVE_BT2020_INV_OETF,
+	DRM_COLOROP_1D_CURVE_BT2020_OETF,
 	DRM_COLOROP_1D_CURVE_PQ_125_EOTF,
 	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
 	DRM_COLOROP_1D_CURVE_COUNT
-- 
2.44.0

