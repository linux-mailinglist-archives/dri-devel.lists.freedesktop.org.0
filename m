Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C25F4AC6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 23:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7964B10E173;
	Tue,  4 Oct 2022 21:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B855410E17C;
 Tue,  4 Oct 2022 21:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYOtw+/YedmBC3y7bryOLOyerBpZGJl9WJS+2cczJ4csvUqoQpobL1LvL3qqCV650aWGG1wAtpmRsj/pz+nihFXPMOBlhVpnOjDNVqsHjZtKSriShBevEYXG4jA4kI+TN+sIZHb9qGIbtz0ERonzxubX1PfxJZ+QeaH3+3bawDxJ6z1Ifn/wCWtEyaZwSAxC5/PNKQguqgfuE0HoMWNqY1u5WQA4kP+FF2M1fkySwaksVsR/6PyP2pkFhKYuJ0vOTiGm26GLVuyEGu79zuND5KAJVJfKFFuJRlNC1Kn+xKffWD/q3PVgPH4KwSe34Mk1CmDh+I6D1PlrYGkmRH3yVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyPP/8lfjJWHvaRIFbruseaJVeK1uMm7fAzJE2i5eCM=;
 b=O/YrM68F0rxregyp0Xob7KJres7eI7rqYm8jeyd/3E28dDfpEwB783452S5T7kq6B9AEMsqZodbBBRLACBPN/HZoDcsL3aSK43QcmBy5FlZ/+pZ0Z30F0A3oOopYG56FXePOcWR/kUkE5TaDBMoJ3ZT2ff33MlrYW1tQ6TzBrcqLH1djZRC8UYTnMDodHVqNWLj0XQSfOCkeVDgqW8P07eiSoID83JSEsIM0Rq+bhHbsrjJY64E60UmeK7R4D+T/054S2oRz4W11mlQxsVmNsgKuq3xQWMUk6cmjsiiAcEHWsRINl8BT7bLG5kxIPMe6Hi4T4+WfLKsjXdEC7kLwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyPP/8lfjJWHvaRIFbruseaJVeK1uMm7fAzJE2i5eCM=;
 b=xV4lPEO6yy6QlF4WI9oCFx0naBeGpB3t71wYyiLlNU2CvZMxQ9X2AjA7k7QWnNnDBpLKwq7yYArsWc9ALnYlfr+u0eXAgOvULR65TiCf6gT/7papg34nY/NzoMovW/+exg2H/08tlG1RjIjTK0bvYj2o3XKh8AH8HIDN76Vbh3s=
Received: from BN9PR03CA0384.namprd03.prod.outlook.com (2603:10b6:408:f7::29)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 21:15:42 +0000
Received: from BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::6f) by BN9PR03CA0384.outlook.office365.com
 (2603:10b6:408:f7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.22 via Frontend
 Transport; Tue, 4 Oct 2022 21:15:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT091.mail.protection.outlook.com (10.13.176.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 4 Oct 2022 21:15:39 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 4 Oct
 2022 16:15:38 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 3/5] drm/amd/display: Define 3D LUT struct for HDR planes
Date: Tue, 4 Oct 2022 15:14:49 -0600
Message-ID: <20221004211451.1475215-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004211451.1475215-1-alex.hung@amd.com>
References: <20221004211451.1475215-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT091:EE_|SA1PR12MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: a15425ae-c8e6-4fe0-e466-08daa64d96c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hgUWk5ugej0AIY47OlZJDKICursRyYjQImnsZitSLy4+smLdCUV1YPJnhRmSmr7vJeGZomC025DIKNzhmCukVs+we0jX9OfYh9AXMJRmFdpSKwDPKEUlC6nBCLIeSk1I6t/tJU22IwMP//9DeskrP/XYqGenJXHasSJRg2lFUPxES6MUN4ZMShuEXSdsKjz0Aa3wjf4ycZ/9dtZ6I9MNnZ/IfqLkzyFXVdlAfmKRcXBeeswOujICHU9zX2fdwEDoEA5WfF27fSVfcVoSLMw4d235iRLDpwQQkLG8cxMlU2I3e3ubzT841Xhr0F1v3Jic8XI+oJ6ev91rupY2WIruxLizpCcyCWWlfWayhvfllmvCFZueWYiAy6oaIKYU4bvrDCefWqshjKou49j75x7HWXtD0EvXQOXe+E6aqyGu5hVwrwYPRkb6PEiqrn9epF98aNf5srljYoyki4RyExF86vYFfVCL8wwczejkR+cBkViyaypjHCrTGfeXsJcCrV2jfsHAlzt7j1Bv7U+z1k8IRLuqUapAOepPn4paYuIl3ny9kCPRzbDWa9Z8Luv+4rg1CMTocN9y5snzP7TYU4oEVZ17W7rLFaBuiGE0hdwTb6vprPxFqoK2BnTOs/mpm4dm3VFrvVJnL8hO2ocMa2Y+yrCmo4kMUr+omOT2sKlCCcnjrac2fSqQ6ZINOYdxlCzr2zMgM9f2NGXUUMIrC31GtH7Mei8oj7khHYOucv58qYEVRkAZ482zk5e1ZeuGNB8YCyqsL/xPRF9GvWVdBjXmmaxGP7eh0yWHe/u/kcPGknDnRldu8DD5e8E/NwfZoBSc
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(44832011)(36756003)(8936002)(186003)(1076003)(16526019)(8676002)(2616005)(2906002)(70586007)(41300700001)(4326008)(26005)(7696005)(6666004)(70206006)(82740400003)(82310400005)(356005)(81166007)(40460700003)(336012)(40480700001)(83380400001)(86362001)(47076005)(426003)(36860700001)(5660300002)(110136005)(478600001)(54906003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 21:15:39.7703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a15425ae-c8e6-4fe0-e466-08daa64d96c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247
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
Cc: mwen@igalia.com, bhawanpreet.lakha@amd.com, Alex Hung <alex.hung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a 3D LUT mode supported by amdgpu driver.

Note: A patchset "IGT tests for pre-blending 3D LUT interfaces" for this
proposal is sent to IGT mailing list.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../gpu/drm/amd/display/modules/color/color_gamma.h  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.h b/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
index e06e0a8effc8..aceb23b03a4b 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
@@ -27,6 +27,7 @@
 #define COLOR_MOD_COLOR_GAMMA_H_
 
 #include "color_table.h"
+#include <drm/drm_fourcc.h>
 
 struct dc_transfer_func;
 struct dc_gamma;
@@ -35,6 +36,17 @@ struct dc_rgb_fixed;
 struct dc_color_caps;
 enum dc_transfer_func_predefined;
 
+/*
+ * 3D LUT mode for 17x17x17 LUT and 12 bits of color depth
+ */
+static const struct drm_mode_3dlut_mode lut_3d_mode_17_12bit = {
+	.lut_size = 17,
+	.lut_stride = {17, 17, 18},
+	.bit_depth = 12,
+	.color_format = DRM_FORMAT_XRGB16161616,
+	.flags = 0,
+};
+
 static const struct drm_color_lut_range nonlinear_pwl[] = {
        { 
                .flags = (DRM_MODE_LUT_GAMMA | DRM_MODE_LUT_REFLECT_NEGATIVE | DRM_MODE_LUT_INTERPOLATE | DRM_MODE_LUT_REUSE_LAST | DRM_MODE_LUT_NON_DECREASING),
-- 
2.37.3

