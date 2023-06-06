Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB91D724E1A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909710E3D2;
	Tue,  6 Jun 2023 20:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971D310E3C4;
 Tue,  6 Jun 2023 20:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W31kHQDGYKScRnmEgzuJzhlU6nCBe2tgdo+XV6mvlQxE62DAXToblDt7czLrkPql53mOHvipO1dP3u9GhzOfPx1lz1Wt5HMmhUaWNrLEytbFTNNaWkNn4M8+2zpyNjlVaJV7Wcrb3s8VOkU9ycfQZrtZLQY5tlAm1Ax2JaVMdTpaHLFgoRxQgnrYvB4FVZEbjd8E+9zZRbJQQxfQegzfHMqTjICeNP++DFo+PbiQHPYp2UcvtiGmYdRSKaMF2+HLPOY3JNp92mysQrZGFUkJfJMQdRnO6lq7uphQgc84VNRJEHx5/i45ZnkTFBEo22SVIM4tMwXRizC289eHZmOrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKi9iXX/dXKQa24jRy34TfLWZNEd8lVzVj+flWI4uQE=;
 b=Uf2nwp5A1i5YF4bEcSp5WGemaLVFViE8LKOmzQXS9h0uZLSDNslE3Rf8uFmnwazsAVAitSkkXbSzHPm3ZNYy/EwMJAkyXnlvMEqsuums/FCu7fKethSNSY56guyFvGenC3X3P5tvyhACdK5ZtvVxTUk10h9GUXByzLM/ij1QwR3FSurV2jenVY6Fn5XnpS25tejCgDyZv5l930M1Kh3bc85+rIjG7t8uh+j4GrvhyHC1HpvZe07RwX+eFTRYUpXRcz35Gps/O3S8rCWTat+JajNwjQWYixZgaWTiQlqefzp0DOoSN3u0iJIT0hzuJzLWk7YwqeMgm4Fmpry3T12dhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKi9iXX/dXKQa24jRy34TfLWZNEd8lVzVj+flWI4uQE=;
 b=TsLelJ1zleZDKxsnOTxg81amWweLqzcKkacKuQzn9Exlu9ad8q0PAsrk/1bmYqc9bVa5/ZCXziBTAcX5Oekc0qkFLM3lXZQzywYN+9c0pd/SF566OKNG8Nw/7V7Gb4IGkTiOMSieKVsoJNu5v4VodMEm6/y/At7ksB95l4N+iEs=
Received: from BN0PR04CA0118.namprd04.prod.outlook.com (2603:10b6:408:ec::33)
 by PH7PR12MB7966.namprd12.prod.outlook.com (2603:10b6:510:274::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 20:26:28 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::23) by BN0PR04CA0118.outlook.office365.com
 (2603:10b6:408:ec::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:26 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:25 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 13/13] drm/amd/display: Refactor avi_info_frame colorimetry
 determination
Date: Tue, 6 Jun 2023 16:26:07 -0400
Message-ID: <20230606202607.122914-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT063:EE_|PH7PR12MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: d90fd614-cd54-4d71-5cbf-08db66cc4e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 11yWzzaH/a5xUzqTM0peaRZPHPNRF1f0KqkzNKVfh+1yXu4opq/eJOkVERnv+XzeP547ZQuw2w8MmofemEDvIlb3pCaArUegucx5PuYi6k6+ckbh9kRcekkQKYnljrr0OS4VERtt//vI4XR8CQb3FPtXwGh/1hW6Z9DW+d36bLG+pe1QpMq5uOexw8uy7TOfos/mZC0l5rKfrlG8f90schZh5M6mhTo3RjM1yHIHSFXvAp91f06rEnsTdDr+imEl7t0amqSqw27xR0iB5j33Ti86keMnEOa1e4O2Y2UCG6yLxDH0/XHKw6UkXb2RNL/WCCzbv6fYbWpVAeqvnz3ZiBe71vONnrHr8my8gaTEFcJuVdNJ8zKXKZTM44y9PtO95TzZn3FeqydBbH+RMs7aVCnRPFuwtzQ3WZll8w0V1jNLdu+7M6QbVJ1ERv1CCnsVPUg1MzLvWHlnsI5HAcH1IkhZHQz8lfHHbwu+zV2+c6VnGBNlll1286bDkN0EBbo6lBNx53DHqUZ9pf9K6obyngcyU5DCAtuJIOPic+UFagNUMJS2Wm1LXiwumzlNUVtScPQk7KtUPuuc5osnKpvr3OpjfoW64Wwh6RFg+hJB7Ro60neWCcuh4/dppII4GIT1PHhZ6XMLZCtrJOaiviQmp+wlekU0E+MmbPTCDp/Xf22Km63oBtqsls4QUUQfrH7yWh/R8k29NZvrvk2MLrhs+5vnIHtNyiz5MM2Kl26TxRGQ0yDyt0Usgm+N9IT5RGaAwWXi1fM4LZ/ugdFFuxYPLw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(70586007)(70206006)(478600001)(8936002)(4326008)(316002)(8676002)(5660300002)(41300700001)(54906003)(44832011)(110136005)(6666004)(1076003)(40460700003)(26005)(40480700001)(82740400003)(186003)(2616005)(356005)(47076005)(83380400001)(426003)(336012)(36860700001)(36756003)(81166007)(82310400005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:27.5249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d90fd614-cd54-4d71-5cbf-08db66cc4e47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7966
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
index c72540d37aef..2f3d9a698486 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -3035,23 +3035,29 @@ static void set_avi_info_frame(
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
2.41.0

