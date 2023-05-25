Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E31171172F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FE010E743;
	Thu, 25 May 2023 19:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2360010E19A;
 Thu, 25 May 2023 19:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9sE/nPAZLcaqSmKLiHUB1lBMTzKIw+/2vufHJxGUZ/69Tiilw2LoyajURrzIWspby3gGE0XpuZu7p4+/Z3m5yMaq0Ob7IH5qiCUGhPh1Fy7tTB9W/1k3xoLN96e/dm8aBi1tkdlo7YOcCKauV8lyH1kwitX3hDTQZN/Y3nVi23YtO+357XoqC5xa/JOORnMw3PZs+auajMJlX+abtjQWGz6dOYGenlr/9ERsgXWvPeSHJErcSHaKCxP7tcGzLe/bbwpy6MZibhr//xTLREvwZXqy9bINRu4OYG9LwU8cFR4nR7mNAnPEMeaUz1NNdJWBtKE4cmx7QurzGFbK+OgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3IFFyKLIqVskxFTKGcJsEhFMdN0DeWDJvmyy/K5RKI=;
 b=Xiy+8UCmfqaUKKQSbqlgEDG7BO5LuHmaoetjzuj/PlzdbcSqaGRpRqxQdXgoHh9NOoFmDKAQHRyGTmWZ8HBsNPlDdkFChNMVIzGOJFvoErxCcWA1QlysfTDYNhefVM2EDYU5HpniFTZwe/ofe/PzS3ZXWjv/x4zc8lGvKfKyJ5moFCX3hBwumV7xBS+vzrFu7m9IVp8lPHanw78C/FXoPG0Fe/8erlJTSU3B6cqdPg9rTtlOWaHz17uzCEe3aMwD+0op7WC58veCYiY/PmINK7Bt8pPn7GpfMDeoQh3C4kRNE+nNIkQ10ZL0d93QdPJoVnT67/hEBxo9zxE2iqoMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3IFFyKLIqVskxFTKGcJsEhFMdN0DeWDJvmyy/K5RKI=;
 b=s4v+GEMBS44o4jzhMDMuNe02ybF6AQBgZ5yTJ98hVafjF8u/YErnf9tBovdPGUoXmoTgd8yoVWhSKOc8Hd1LSq0Q5v2EIrfP7TJ9Cdstvy5womwWDVW/OxjXnzns/MSlXdL4LtxKoFwaGPc2MA5dH+1A+tIUVq+i27PWkv9Dnek=
Received: from BYAPR05CA0088.namprd05.prod.outlook.com (2603:10b6:a03:e0::29)
 by DM4PR12MB6661.namprd12.prod.outlook.com (2603:10b6:8:bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 19:18:49 +0000
Received: from DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:e0:cafe::e4) by BYAPR05CA0088.outlook.office365.com
 (2603:10b6:a03:e0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 19:18:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT092.mail.protection.outlook.com (10.13.173.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 19:18:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:18:47 -0700
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:46 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 13/13] drm/amd/display: Refactor avi_info_frame colorimetry
 determination
Date: Thu, 25 May 2023 15:18:09 -0400
Message-ID: <20230525191809.3524-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT092:EE_|DM4PR12MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7e6c08-fc2a-4f39-099a-08db5d54ddef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fu23e92ERSgXTkVXUK6NgsguUsE7+BHBaw7yYqQAwCpJHjCcAwqRgB19sHWzpeDO+XvktQx1hHpHQ0ZF3ighKQy5bn5o2rajFx3sM+0swMYFknKJ4ArIjFw7xW4j4OyMiws5G03Tqh8ijNSvtBmZ8PK2X5PMgGGxYO32DJRAjL7sDPoXTtBnPTV9MbNnU0pxPUt6EsYIXzEAa8el51FA1yNitRoIaigI2BKU6BfqToPw4hTaPx83pBwtCHZPAo6uBU1SpAdz/gFeAfIDRebbd/X4rZpHKWgWUYXLYdxGXCacQwfpl3X36xYI0Vl06LrpqhXQIMmvcmDwDcfsLcPNJrexNN4SGm4HF9/vJgE95ujYo9Kk/legJGzFXW2peBOxtXT/dAz8wlcIhf3F7rTKNZM/1gYZqrnjcMbPEjSYZsxOqcnGO4XxlN4jLXIJntM1uX6PXlEmtmjBVTYUo0wexEO86N3T75LAMpbnYqTjHvhaMLPUAPGf13X0IUxujSfqMdsld5gWkPa13d9u/kKzmoP5h0yXFF10BXQ2WT45omuRmSAJbmgSTdVsTY8TYBlMYGnoODPjjw/UNXqlFWPRaUCJKA04s7soWsQdNtlSPXmBDHXAUFbeb8dvuYFixlTX1MLFEEX4bOpWUeOwzsDOKqmm3N5KQpkew/0PDsfdCW+nlYVPYdec6Jh+MK8eAzHThbLIIMNTiY3Y/QtePR3zcvUXYxA43lIObcBacvwA9TFDkVCSbY3a0ZGFcymP3xTkuMm62jxGDrSPoamJBGr+rg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(36756003)(86362001)(54906003)(316002)(110136005)(4326008)(70586007)(70206006)(478600001)(6666004)(5660300002)(40480700001)(82310400005)(8936002)(8676002)(41300700001)(2906002)(44832011)(81166007)(82740400003)(356005)(2616005)(336012)(426003)(26005)(1076003)(186003)(36860700001)(47076005)(83380400001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:48.4342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7e6c08-fc2a-4f39-099a-08db5d54ddef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6661
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Replace the messy two if-else chains here that were
on the same value with a switch on the enum.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 28 +++++++++++--------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 7e1e5532f88f..ac3062abec51 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -3015,23 +3015,29 @@ static void set_avi_info_frame(
 	hdmi_info.bits.S0_S1 = scan_type;
 
 	/* C0, C1 : Colorimetry */
-	if (color_space == COLOR_SPACE_YCBCR709 ||
-			color_space == COLOR_SPACE_YCBCR709_LIMITED)
+	switch (color_space) {
+	case COLOR_SPACE_YCBCR709:
+	case COLOR_SPACE_YCBCR709_LIMITED:
 		hdmi_info.bits.C0_C1 = COLORIMETRY_ITU709;
-	else if (color_space == COLOR_SPACE_YCBCR601 ||
-			color_space == COLOR_SPACE_YCBCR601_LIMITED)
+		break;
+	case COLOR_SPACE_YCBCR601:
+	case COLOR_SPACE_YCBCR601_LIMITED:
 		hdmi_info.bits.C0_C1 = COLORIMETRY_ITU601;
-	else {
-		hdmi_info.bits.C0_C1 = COLORIMETRY_NO_DATA;
-	}
-	if (color_space == COLOR_SPACE_2020_RGB_FULLRANGE ||
-			color_space == COLOR_SPACE_2020_RGB_LIMITEDRANGE ||
-			color_space == COLOR_SPACE_2020_YCBCR) {
+		break;
+	case COLOR_SPACE_2020_RGB_FULLRANGE:
+	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
+	case COLOR_SPACE_2020_YCBCR:
 		hdmi_info.bits.EC0_EC2 = COLORIMETRYEX_BT2020RGBYCBCR;
 		hdmi_info.bits.C0_C1   = COLORIMETRY_EXTENDED;
-	} else if (color_space == COLOR_SPACE_ADOBERGB) {
+		break;
+	case COLOR_SPACE_ADOBERGB:
 		hdmi_info.bits.EC0_EC2 = COLORIMETRYEX_ADOBERGB;
 		hdmi_info.bits.C0_C1   = COLORIMETRY_EXTENDED;
+		break;
+	case COLOR_SPACE_SRGB:
+	default:
+		hdmi_info.bits.C0_C1 = COLORIMETRY_NO_DATA;
+		break;
 	}
 
 	if (pixel_encoding && color_space == COLOR_SPACE_2020_YCBCR &&
-- 
2.40.1

