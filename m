Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C447B64A6F3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A9810E271;
	Mon, 12 Dec 2022 18:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5FF10E26B;
 Mon, 12 Dec 2022 18:22:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j33mNkiYqKF9J2rE8JglHpoG5DZ/EuARLqIgkAYi1hQDXcMeGPeVP+l2ayyZj+qKSN24eev2Br9MryfI1HI/boPPyBiNPixF8Sy8e74bokiSXdNXjOtMxvxpE5kq/EfA8A0prjnKPFhSYC2mn4Sul2iBeMJL5KLNzWnz+J/GlyC0yieBPj/yI75QX73T/CcYpzdGtYEupzSpx8XOHW/MZoUOFxTY9cA1kDNZwhgKT9sL4SOXbY/+G0/MK9O8gabkdJHGEroTnwwPv3d8Dl9oPr7DBzZVM6sKLlMa4c4pKcTFQHkZORG6pz5zfv8+q8J2iFkjhqWkISoqblF2hn910Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKyOzJvoKGL8tZNe/xR2f6QSMNcaK9V3/V2qg52fle4=;
 b=oQOf+VxWPXGB3bbOm8aWvcwCqCTcZOpHLCOTV7mBtnQz+ak2cjTz1HGEIGRKaKyksikXRar4kP0c2NKc6k94yR+DFD7jqQ6Lml+ZSNCo0g8/jlbAIObeE4hEnnz5DMLzwML0D3AEc91wul6p+kyJVt+f2trnbedWkLLhinRtTqxooRTWbIegG44rgwFawi1lGDulpSlHCoevRemLMgGnLnvOv0Hv3+QtEKWACoYJAibTee/hihk2zBeHVee8VOI1HS3cw7bKFYu2/6az8cr+O9F0iu8bmgmL6GSCB/jiYMf8i9+5JDMIzf6Un0kRpxzt1VLvPMcz1rB64do56l0cLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKyOzJvoKGL8tZNe/xR2f6QSMNcaK9V3/V2qg52fle4=;
 b=ZfMyFCxOme0+AXKX8O/ZlugzvtcaI+WlTaugPWBhs6mJlxpjIzz8Bcm5dZ8QgoWCv0XmWW31r9UGFqmyece6boCup1RtiNCaNaiQDAQyJd3EGN/hj1APri+w13J+2lddAZqAFn5GWtwDIgBA07iKbFUEp1zha9Qavp0kLm8KUR8=
Received: from BN9PR03CA0512.namprd03.prod.outlook.com (2603:10b6:408:131::7)
 by SJ1PR12MB6195.namprd12.prod.outlook.com (2603:10b6:a03:457::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:34 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::87) by BN9PR03CA0512.outlook.office365.com
 (2603:10b6:408:131::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:29 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:28 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/16] drm/amd/display: Add default case for
 output_color_space switch
Date: Mon, 12 Dec 2022 13:21:36 -0500
Message-ID: <20221212182137.374625-16-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT013:EE_|SJ1PR12MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: 602d8cb8-c292-4fc3-91bb-08dadc6dd6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4JbrA/mg1vIL1FLu5ekalTiq2MSTRMFwBW7zzeGpgguD5wvamiEi7qm/xMgwekBbdQE/mcW+Y43ioSu8wtDaPsS4+WUY6JZj0P34cNoueWnAc2XhcahbsJ0pwA9Y1lPdi3gsYfhBSV9sh475APgD/AE3Nh+tYVJSEE3NyboZ7xhoz3g83detWn48sf8lReALvGgU6AWrT5zdR8aoX1Se3cZ0swOIpV5sD8lMj0MZnTMsyM02BkI2C/iqdnVGGWid3HBdaar29dWN+WcBCjW2Aqkq1Ij2ZLoV/TaCKgdEh7h+Uk/xrq1tsLrwmLW9FUjU41NxhT8aDuyIsz1ik4L62rzAkYPlPZYMy8ap6vY/D3QoKYmKO4Yybd3/vI6/UuboaCZOXqCoIlEcJJlXC/jkBcS9rQW3K1rs90v4MEHQv1oNxAPr1O9iSHMgDYlWDuCuiE+b9eM+Hc1l747k7qYXvCCNQX7r7IOeiCZ3LopPgqw9JL0BJdk6W2HhYZfzXno+rL7MqT2TnPgM7/xn0dJwgASXqxwOecaIIfBRnwUh6/NZ3Fr9+U4oAWQ69qPNvgisWm004AxMWc2iLjTp+HIYn9bfWzeifY3vt7r0KgbjrwbbhUwkB+dZXeStAhxnY6M8oKQrAUHGCTWGBa5HtpMI9vR9LQ1/A64fuOv++rvRyaH9cgvO2DSOieLBkmw/m0lgZr2q73DyBdec1dMNOhB80mUk42kyE25u9Ps1lTi/Q4g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(40460700003)(86362001)(478600001)(54906003)(110136005)(316002)(82740400003)(356005)(82310400005)(81166007)(40480700001)(26005)(186003)(6666004)(7696005)(2616005)(1076003)(70586007)(41300700001)(44832011)(5660300002)(8936002)(2906002)(336012)(47076005)(426003)(36860700001)(8676002)(83380400001)(4326008)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:33.7843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 602d8cb8-c292-4fc3-91bb-08dadc6dd6b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6195
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 43 ++++++++++---------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 768c0c8fada1..d0c071000a5d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5153,7 +5153,29 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 	enum dc_color_space color_space = COLOR_SPACE_SRGB;
 
 	switch (connector_state->colorspace) {
+	case DRM_MODE_COLORIMETRY_BT601_YCC:
+		if (dc_crtc_timing->flags.Y_ONLY)
+			color_space = COLOR_SPACE_YCBCR601_LIMITED;
+		else
+			color_space = COLOR_SPACE_YCBCR601;
+		break;
+	case DRM_MODE_COLORIMETRY_BT709_YCC:
+		if (dc_crtc_timing->flags.Y_ONLY)
+			color_space = COLOR_SPACE_YCBCR709_LIMITED;
+		else
+			color_space = COLOR_SPACE_YCBCR709;
+		break;
+	case DRM_MODE_COLORIMETRY_OPRGB:
+		color_space = COLOR_SPACE_ADOBERGB;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_RGB:
+		color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_YCC:
+		color_space = COLOR_SPACE_2020_YCBCR;
+		break;
 	case DRM_MODE_COLORIMETRY_DEFAULT: // ITU601
+	default:
 		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB) {
 			color_space = COLOR_SPACE_SRGB;
 		/*
@@ -5175,27 +5197,6 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 				color_space = COLOR_SPACE_YCBCR601;
 		}
 		break;
-	case DRM_MODE_COLORIMETRY_BT601_YCC:
-		if (dc_crtc_timing->flags.Y_ONLY)
-			color_space = COLOR_SPACE_YCBCR601_LIMITED;
-		else
-			color_space = COLOR_SPACE_YCBCR601;
-		break;
-	case DRM_MODE_COLORIMETRY_BT709_YCC:
-		if (dc_crtc_timing->flags.Y_ONLY)
-			color_space = COLOR_SPACE_YCBCR709_LIMITED;
-		else
-			color_space = COLOR_SPACE_YCBCR709;
-		break;
-	case DRM_MODE_COLORIMETRY_OPRGB:
-		color_space = COLOR_SPACE_ADOBERGB;
-		break;
-	case DRM_MODE_COLORIMETRY_BT2020_RGB:
-		color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
-		break;
-	case DRM_MODE_COLORIMETRY_BT2020_YCC:
-		color_space = COLOR_SPACE_2020_YCBCR;
-		break;
 	}
 
 	return color_space;
-- 
2.38.1

