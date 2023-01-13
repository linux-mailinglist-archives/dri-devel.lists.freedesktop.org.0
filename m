Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A947A669DC7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDE410EA3F;
	Fri, 13 Jan 2023 16:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3F610EA38;
 Fri, 13 Jan 2023 16:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLXG9zYN/5mHBpVsrOAQIM8f0dJVDgz0+cuXwI6kep2Q/hnNh2cSiZJbrzhL6FpqQQiFJZBBaMa37R0yGIl9IqIJLX5K4uPRc0RfI3OjfoNk7k9DhzoCASWnvDh5wQopS79uCEbMwXtU6E+dZ9xeXKUoMTn0Hxi86HsSCW7hZAmK12zxYXY94QcqfvfJjJZAhdKn7Q9Fk3h+X6AvmcMNdK12Vo/UmAOWpGMnAANNCNjX66qL2pdYvUnXnM/tmYoQBDLPi/IIoSS4y+BC4Zr8PwF3S/tO/gjzresVPdNYDmjlX9NTIwIFkGm+UzQxFYsfi/yobx12mzZR9rXdEn2DKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxMseIc8wt2rzbjzDov2bZswFiGLgtE0ghauS0LmNdI=;
 b=NOdyn1+lYeoBCpCGazzCuLayjVaxUKsqpc7ERXTW6n8CVZOCytAvzpS4vNO7EvdrrnG13xYCxP5dFD6c4FCphB/YHPkYIFW6ai8q80Tjm80CECWa/EboxtKSZS0cYKOFLnfSPiu4ZS1AUTHGrRCelKEMygfvk1CAdPDitz9aMVZDJwopuaYWf/FivCr1DQw9N3BvMtVmAtreQKwolxxFsLzdTXjngetdEraPQmFOAgIu2deAYdH7dhdG7xTCFjPecsJ110hPkotGqzufxTotlwwPVYUWur/ooy2jcMoi62MoJIDQjBM5x0y8nxCJA8t7qbA3MgZkAd9Z6muZGFNK6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxMseIc8wt2rzbjzDov2bZswFiGLgtE0ghauS0LmNdI=;
 b=z+bW+6MbFC/LB/6oKdfNP5uQZZjKO0GJI47wvToOeY9WS9ae2VsnCRuX/5kKAtq7GLHSrILSORKmKOluo7lYEXQjrf0ZOIEpnVhngAPhR1eo8FrJ3w0wLKwS9AbJ3tM0txvUp/NMvQ9UyzXR5HeVtyzxX46Am6+fWyIHJcltmVI=
Received: from MW4PR04CA0189.namprd04.prod.outlook.com (2603:10b6:303:86::14)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:25:01 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::b8) by MW4PR04CA0189.outlook.office365.com
 (2603:10b6:303:86::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 16:25:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 16:25:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:00 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:59 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 11/21] drm/amd/display: Send correct DP colorspace
 infopacket
Date: Fri, 13 Jan 2023 11:24:18 -0500
Message-ID: <20230113162428.33874-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: f8907d50-20a8-486b-e5ac-08daf582b859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8D9tdieUcgAUTtuMQjU0pw+84+vyDV9zOQPvE0qr29yOh/SHs5UQOfTprWPbD9EEYuWTknc4+QILFWsV7pA/7t37tTU2QjWxhAcvwSDJEh2JXMSD0aMPnBVFzEDugLOTfphoAM3O0Hk3zb7PScmj1TlaEg+YHgWEbTuI5PSevMS9bd1C46vL/mSm5pQS7il31Yab6tFUMdppl7Y8Zm6N37L/Ca1iIfVca7+ciZMpcg/mKjt6R7Vagp7AYXlqQnKZJDVC4xyFby+PfEaDsxXq9B5T9ygkGFbDw5cQNBlicY5kOSwO1SkKi432ymELUEkOSud40r4l5faE1ibYKehb+LIUomJiEpwYOPC7SxW+bxzVzI29rjSGlCPzGuTC7IPd3yVGT/xZWbRXEtVKWd+5jDND7VPzLf2FWDl0soSkKm3Kn3eN02hsoNNV55qHeRvo33Ee18YkqNSvZQ++FpKZabMx+auSCQoRGrqVl5xaaanHBJda0EKftjqQqIwGWw3AG2AHMzSQYfC7kzpiscFu+ypzStjyREl5HF6fgMwYW5ryrp820TN0sNOBvumrgKmpGNNCPxfBr6G+6bQ5yvpFIgCf5ESg2s05+gRqLxdH9+4ut7ur5KEbtCU1bFqpOH7tU/APJg7cKaYD0lN8uFxZ/XD/ifUZ5jftrPcF7I2F+VSIor8MFd7aAJgXnUsLjOpHa1huOq2q4fBMtPaJUFPOTvVl5SwlkOLZjEhU3v5mrg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(26005)(6666004)(36756003)(186003)(8936002)(2616005)(7696005)(1076003)(5660300002)(40480700001)(316002)(40460700003)(4326008)(356005)(82740400003)(41300700001)(70586007)(81166007)(478600001)(110136005)(8676002)(54906003)(86362001)(70206006)(82310400005)(47076005)(83380400001)(44832011)(2906002)(426003)(336012)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:25:01.2236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8907d50-20a8-486b-e5ac-08daf582b859
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
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

Look at connector->colorimetry to determine output colorspace.

We don't want to impact current SDR behavior, so
DRM_MODE_COLORIMETRY_DEFAULT preserves current behavior.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 38 +++++++++++--------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f74462c282a6..a31f71f2feca 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5162,21 +5162,21 @@ get_aspect_ratio(const struct drm_display_mode *mode_in)
 }
 
 static enum dc_color_space
-get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
+get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
+		       const struct drm_connector_state *connector_state)
 {
 	enum dc_color_space color_space = COLOR_SPACE_SRGB;
 
-	switch (dc_crtc_timing->pixel_encoding)	{
-	case PIXEL_ENCODING_YCBCR422:
-	case PIXEL_ENCODING_YCBCR444:
-	case PIXEL_ENCODING_YCBCR420:
-	{
+	switch (connector_state->colorspace) {
+	case DRM_MODE_COLORIMETRY_DEFAULT: // ITU601
+		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB) {
+			color_space = COLOR_SPACE_SRGB;
 		/*
 		 * 27030khz is the separation point between HDTV and SDTV
 		 * according to HDMI spec, we use YCbCr709 and YCbCr601
 		 * respectively
 		 */
-		if (dc_crtc_timing->pix_clk_100hz > 270300) {
+		} else if (dc_crtc_timing->pix_clk_100hz > 270300) {
 			if (dc_crtc_timing->flags.Y_ONLY)
 				color_space =
 					COLOR_SPACE_YCBCR709_LIMITED;
@@ -5189,15 +5189,21 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
 			else
 				color_space = COLOR_SPACE_YCBCR601;
 		}
-
-	}
-	break;
-	case PIXEL_ENCODING_RGB:
-		color_space = COLOR_SPACE_SRGB;
 		break;
-
-	default:
-		WARN_ON(1);
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
 		break;
 	}
 
@@ -5325,7 +5331,7 @@ static void fill_stream_properties_from_drm_display_mode(
 
 	timing_out->aspect_ratio = get_aspect_ratio(mode_in);
 
-	stream->output_color_space = get_output_color_space(timing_out);
+	stream->output_color_space = get_output_color_space(timing_out, connector_state);
 
 	stream->out_transfer_func->type = TF_TYPE_PREDEFINED;
 	stream->out_transfer_func->tf = TRANSFER_FUNCTION_SRGB;
-- 
2.39.0

