Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADFF669DC8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3C410EA44;
	Fri, 13 Jan 2023 16:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2082.outbound.protection.outlook.com [40.107.95.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DB810EA3E;
 Fri, 13 Jan 2023 16:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jy1U0FM/jJCPTJt2zHN/uXCyShWkTYOToz8ZMfxqx7Y3Kz7W2EpWOzi7LIyGf3+mM4T9kAxtL6PReLbuuu8m8PdJX421u7FGLixFUcgZj34T2j/c/PAIDgZg4Co/Q5XjbvyGoFjji2Zpn2MOTP5mBmSXNZCi9hIves6elpmo7N1Sx0vxeuHtDOVr4tOQBC66MA9ziCFn3I6iTUXonw2jNWLQaADZrVRIvdh+Eidu9n5RoMmMFgRSULPWzq1t5LC8UuKWQIgK28YsEtOKw1qablB3zyxonIL3x9wTcm8bOPsT7ghwQL9BIhIEIjzA+JVBBvDQYbt6F//odCrie71e1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7NXZGvZ5ttZWoFvf9X0bOkknf/wj7R9Rl8QDGcG/aY=;
 b=UqA9IvVWaIjtTeyvZ8OS3iLiu8pX9e2M9Ic9JvAqJspldDp6mkk3hjnkrnNAe1NRQsU5nP6kbsDm16vlNInTP25IAe6kXNXzJR0k/5bfQkAS4glFdRrRyu+veqMvrbeuF0jdZOP4p0dD2wQBBnBZAg/qeowXDqjRg4faM4WArGvMRXqgDVTHEviagdJEAsHAr0F1mquUZbTK7TZXD5QTuCvlSuJAj1c3Gd9WhzcLYv1nuRDQfaUyXo6NTzEey+ZCpXaYUajev3jaWtaPl33A81KzzDN0G6+QuBQcc999C+MfCmiGrCsxxVCe8to0DGAwrk/DMMtg6zx+nW9er0vlkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7NXZGvZ5ttZWoFvf9X0bOkknf/wj7R9Rl8QDGcG/aY=;
 b=aEFGZt+9EVp7Rywa4ofkLg0l+wqPNik79sPjvV92GZBpCdyRj6GTHVJkVqbOK9WxbvLR559aqz2E3nS6clXHZG4t88GUAJrg0Z8QQ6Xm4tIXxehwOsg2ocFmcoxJnavCLT9v4KmbsJk0DhuMmJvNXStAt8AoRbM8Q47UEPDXSRc=
Received: from BL1PR13CA0362.namprd13.prod.outlook.com (2603:10b6:208:2c0::7)
 by BN9PR12MB5292.namprd12.prod.outlook.com (2603:10b6:408:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 16:25:08 +0000
Received: from BL02EPF000108EA.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::83) by BL1PR13CA0362.outlook.office365.com
 (2603:10b6:208:2c0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 16:25:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000108EA.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:25:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:03 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:25:03 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 15/21] drm/amd/display: Add default case for
 output_color_space switch
Date: Fri, 13 Jan 2023 11:24:22 -0500
Message-ID: <20230113162428.33874-16-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EA:EE_|BN9PR12MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c5ca20-2fa5-4840-41a5-08daf582bc44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jPuWOpvWkgIt4IFvqmLoGoPmI+lK/+aD1D+ddmWgDcP7WuOdPnEm5XgYDXXEPCyKltP7OT0C9jOVpgkyG0N/O9ymQF0iQNSFePzTb1Pvt3hJr6esjI03mgf+cTQ0mza+Cs4e+uKUFS3243cHDVYHMpyAu94r5Oxd46rxkESKlVzBi6eLNmRj4R7Qja3U3LaJq9LlQujn1vvm3QyBv21T9y8doe7R46fjiom7gGFLELZK0U3hzXT7xXUHcXxXdViRMZkI0SoOWmleiXPH7NIZB38ItVwNqWd7gk2qI6UVTI+JvCWAMEsjoNCVzgrc2klZqW870G1Q5fTTyragONQI9kvH8jRdl82zEAPMbV4Wi+L6/P2Rc8z5SUlPkVsEby6ktRdih6M41cYIGqQD36W6Ez6Kypn4Si/XSYVJEu/tYuuAa+Sc3OBD+djtOttXszfrwIpXaAW62CnB9YEIrr3R7H8SS3BIw3U8bBPdntKeQBf0BAYjdRaOm9jIr7s+TMOO6z0HJ86e6TG3P7wkGDom8WxA+3mc994vEQ/k8tpHCIlbq9rtsBbMicgZgCUIm0X4r5W7QCt6nZBckOvPtOEEWEi4U3zkTucgtJYXsZVpHgsDwuT2QHBfNHFGydO4WDIQkb7DP2QUeGyC0AS1pV/WpI1UB5fsWW1ZLzZJxCk+40+irpphl0lHlLhMB0xdmadLTl0b4qu0uMoc1w1d0VPV6eYlt3sRzDGj25cO72r0bmQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(6666004)(36756003)(82310400005)(26005)(186003)(478600001)(7696005)(82740400003)(356005)(81166007)(40460700003)(86362001)(40480700001)(83380400001)(2616005)(426003)(47076005)(1076003)(36860700001)(336012)(44832011)(8936002)(5660300002)(2906002)(316002)(4326008)(70206006)(70586007)(8676002)(110136005)(54906003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:25:07.9021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c5ca20-2fa5-4840-41a5-08daf582bc44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5292
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 43 ++++++++++---------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d2921d2179cc..73a98e6e1867 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5168,7 +5168,29 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
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
@@ -5190,27 +5212,6 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
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
2.39.0

