Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E78C672648F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC18410E521;
	Wed,  7 Jun 2023 15:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4400710E525;
 Wed,  7 Jun 2023 15:26:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3oQfsoiUzSWrID2N4+bRy2wjNDavr6EsDq28dPjwo/e2B5PhCBh0dc4omad75/y+/Yqr2FSXB24Cge0ELa8wKWgeRL+daaxddjZTeFhtVhYUwaNank16jD7lI6SzkIfKsON8Gpb3sXfHjZS44dNwXMmyOtr8EZ8TV3uD84xv0IT834LL4HlSfxh5To1gFk9Rlauxcbvk49D0OOj5psa32mRsrh2thJzkaO7RtcRriPk7Sfa3b8vVxr6gyVomNb2JKkCHlDA6koYCuyEKWSY4avewpRH17YcIxiKJvWWSRHQMK2zuuu00jVEcnYTpdEQgvIRWTXIBGSpXW/XmtzhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZQZzHcjaiaCdVd0vLNQybb6vZiPNNxQpS6xkYcJjU4=;
 b=T6YrtX9LWtZZX9AdGg6m/NpQI2LpioY6rjciswQ7432jYpYAfjViP0UOzK1PvVt9ISiPO3Ow9JkF1waJlkUbCybI8JrorHpGGT7QrVoVm9Hzf64O7ao/XjgKDiOUJxQbyBls53aJjxP9NP64BnbVKNR84jet/8auUVLiRQGbvKtOwl7m6BKE4/5XNnW+LN8CypSUjUusQ9vGTACz1A2/aNa9oWuLLutCqkjkUFLwXb3FKzP1cIiEKXbOjqE/7Hlh5P7Qzoc5rfXPIYqfxGAcbC2RLO41MVTEnkifF3e9uZlyV6L3gDbYwhTJXegoKV15eAduwgn+8oNpUQOfY2Kmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZQZzHcjaiaCdVd0vLNQybb6vZiPNNxQpS6xkYcJjU4=;
 b=zTGU3Y8Cjg7qS1cuwhMYp5qxytRO8BNbw6rlWQMKJQZUKWK/5kRvfItJt9KOQAwmz0RftReyUon+iRjwpwRy2DEPazhU3X/klJq2t65/us1OefVibJFPuROh7RNj9NTlRJagq2i4sTN+6Ki6xkAcPgo1t5UB1Eo41Cn1KW9p/LQ=
Received: from MW4PR03CA0120.namprd03.prod.outlook.com (2603:10b6:303:b7::35)
 by SJ1PR12MB6146.namprd12.prod.outlook.com (2603:10b6:a03:45b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Wed, 7 Jun
 2023 15:26:35 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::61) by MW4PR03CA0120.outlook.office365.com
 (2603:10b6:303:b7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 15:26:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:34 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:33 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 13/13] drm/amd/display: Refactor avi_info_frame colorimetry
 determination
Date: Wed, 7 Jun 2023 11:26:17 -0400
Message-ID: <20230607152617.997573-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT097:EE_|SJ1PR12MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: 41005a09-705c-456a-86a0-08db676b94ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iEHXERAZci8z0XhNKYdmKir+QZklPIUMAAXN1Sge06KNkZ6C13ZVL1x6nBr6YGNG83jssJK4FTP0ejNiqIo3kM/AwOyyAzfxB+1a+ayPI+3WWm1p1hDMFxcvAUXajB5utUg+2BAq1C1tDyK2d4wUy4h0mQzUDudxPsNKAHqO2pyof05kQ4kVCliwp/71N1u5H9AJAtc8UIsgmm/BBswmgaf1JUEoXV9MHRi2Ks/dZSEX0YMz8ioXAcg5e5rqJbdHrfdr5ghTyKtsLgzonOR4bstcahUI+sdxnOT24FJCZNjsb57K/tgoRdnFI7IFWQtNlbCgqaC77YJHJ57/GvtqiT5LTG1HSXVxTzakK0CDc16qbQN+Vc3FGtqtkj2mqRYBPUoZ+S3UAasqJ7SfymzQjceToqWWQqfrnj5BMfbwianE5HtOlkV/07xv5ZyF+hQqcaqakyyAoaLUiMgiGz2MU3h9GRHveX4c6G5itcOI1b38eGv4zMDG7YEJ/9Dk/gmuYaPb1p/u0TjbXlkK7eSoCcdS1OcWgYg89ikX/TLWMg9+uqoBaFpN85EFsbanzfV6tZ48yopIp1SNeW1R3xnHoo4cTbfJ+vG7CyUIeCNmmq6rI33QR3CvHjB2Xsvl0Bw9BP8llACFcb+HLBNkgnZGUXl8WV+jwpd8tKRm15gfycqSsK1kI5def3e27MvsqhlgYD57jpqFYaYzCuTji1GS7dxmElGVfs0NyyLgtgC/B/bCTtO9pbqbwHb+xoNXQcbhRYWOMJUQ+6A9tncTEPSpPw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199021)(36840700001)(46966006)(40470700004)(36756003)(478600001)(5660300002)(110136005)(40460700003)(54906003)(6666004)(8936002)(8676002)(316002)(4326008)(70206006)(70586007)(41300700001)(44832011)(2906002)(81166007)(40480700001)(356005)(82740400003)(1076003)(26005)(86362001)(186003)(47076005)(2616005)(36860700001)(83380400001)(336012)(426003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:35.5278 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41005a09-705c-456a-86a0-08db676b94ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6146
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
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
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

