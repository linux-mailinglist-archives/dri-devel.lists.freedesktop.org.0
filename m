Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B474726491
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08FF10E525;
	Wed,  7 Jun 2023 15:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F080D10E518;
 Wed,  7 Jun 2023 15:26:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWdlfv0AV/ISF0K+J6IIh+jPzKGspoMuC/Wg/gQxsy79TpEP+4Wjoug3wgKG4IoJKM3pXbAemZPf7aOFlh7DHysxh3sIGMmXMDScsNrATuAuWMOXYq/sWmW/LTqC6ctdFc+AC+cgbJeWOBX8HlL3wv8/9YZGCb2oGkyIB4/Q7G+YpfKbt2j/1KzrAttiH35/Xa5i3NTfbLV7CI4chbSZJq94LqnwZz3ol7DqXf9cA4VEvpquxqXVgBUaMzvXWW461VsITH4ZX/mV+SQo0mHlzZvUoU9Bmgzqr9pvkujl1agziMWRyHFTAnRvl9ifsS/IMajeZBCnBHJZiPjcLy+DaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI6rX85qWCG8xdxG9241UZgLcIXPn83yl7tl4MzmMTo=;
 b=DTx0Ok+xILCkzo3gqalySyBJlf27fOBLBJ5roHYs2XZcKt0Lq+XTQ38RfSqAX7hXJyvJMb4lorXACvwlNSo3bBtMG/YV2xyZJvGWB6dLRPcTZon9Xn1b4/Jp03psURZh8IeIMgDOlD+C/TP7QXBx6e2JS+Mh6X3BqH8uaJzFtncdUP0xiMG6tTuKhNWZcfzzBhhBCuyXhh0fhbdUT7Ki4jzVNnF9oruaNM3tvP7qAkuPCXIgqLrEp/rcO5d995xLaEG5RsB5z0Dn4PDrKXiaeTdGvuvApQ0VZR2Kwwh86PtYQUNI8LQh/A7vUW6zw8EJhvV6BJ6GUlnkd+nUQg2Edg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI6rX85qWCG8xdxG9241UZgLcIXPn83yl7tl4MzmMTo=;
 b=Wb66lHr/jiiLS2F8uypKJYV4cP17YjY3jCGjm5EScaPZ8K/7fPi3P02jXB7LaVmab1dxLtAqE6+quTojzAZ58QAgSq8TKWaz/RW96Zo4RjLi5YiMjdPfOYT+QMNNrsbkloPCSYUxq9JSmZ31rqWxg0gk276N/pOkXfGnky/eCwI=
Received: from MW4PR03CA0115.namprd03.prod.outlook.com (2603:10b6:303:b7::30)
 by MN0PR12MB6294.namprd12.prod.outlook.com (2603:10b6:208:3c1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 15:26:33 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::d3) by MW4PR03CA0115.outlook.office365.com
 (2603:10b6:303:b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 15:26:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:31 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:30 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 10/13] drm/amd/display: Send correct DP colorspace
 infopacket
Date: Wed, 7 Jun 2023 11:26:14 -0400
Message-ID: <20230607152617.997573-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT097:EE_|MN0PR12MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: d73088da-d04d-4cdc-b5a5-08db676b930f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9WCwaOYgZEU7qNQPAAN319kKTPbOF8bDY/Ct6UDHvzahD9Zy3lqz6p9DfHrSfM33bIjc9T2Exyik4j368gYoYunSYVq/cQj2jmssN6RdFBnwysnfr/CVSkG6cU4OuLGAyXke3qJ2eJbVSk1LpWWrtYYMqi9jU11KLD41HPlzTB+GV1QswhKbQDl6h8aZq9uL6Ggbvs5IYqkTPrB/PZGTQQIvSvdi2oRFV7gfVdOG7kscSEol57ZbpaR3jGeQlV4qdHBuSfAOzRzxA2LlJoKiTY4W42ABsy+j1WIPOWZwyPHqi0+RHJ65ukcPrXf2G3ZHQdxFion5nBFCqKm1fqgLavyJtXP+Ks1gyWZjFEqsMq/eS84p7ifKPta8gYQTTGbMA/sLridSTa+f0Gz6Zo+1fxY6dCkSJ0M65kNU0RBJ+v0VDOiqbCEerMdx/HSvOPYYXHdVzYQ30FvlDU+xz1ic6aJVksCCfEA0k88AZmj1iuhkkSHiw6WPMNuwfMR98JW3Un+vyRUN8SfFMi0YJ1BHGQyRULMAxOSnI6+YlGZ1qou5bTBWVv1LBy5hCAojFHSNeq2qh4ss94YMRay76EVBS7zrbkFPS5AffUixv1HnvVJ/YCmqsVS99zP674ffrroMX8pWspcSIWg7bISJi6Ff4K3aj1KW4BuahVGw/do5F9l8xFil8OK+65H/43eNqMZ6IgD8ebORDAhVND8P9supE1m1xIkA3gNIjjTnYwFG/fvvoRkCernk2LpJ9oJu/BC3dqTAUv179LEWq9OT3NGC/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(70586007)(70206006)(82310400005)(8676002)(8936002)(4326008)(5660300002)(86362001)(54906003)(316002)(110136005)(44832011)(41300700001)(478600001)(2906002)(81166007)(356005)(6666004)(82740400003)(40460700003)(1076003)(26005)(40480700001)(36860700001)(186003)(36756003)(2616005)(47076005)(83380400001)(336012)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:32.8092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d73088da-d04d-4cdc-b5a5-08db676b930f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6294
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

Look at connector->colorimetry to determine output colorspace.

We don't want to impact current SDR behavior, so
DRM_MODE_COLORIMETRY_DEFAULT preserves current behavior.

Also add support to explicitly set BT601 and BT709.

v4:
- Roll support for BT709 and BT601 into this patch
- Add default case to avoid warnings for unhandled
  enum values

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Joshua Ashton <joshua@froggi.es>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 48 ++++++++++++-------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 793ea29b4cfe..060a975f9885 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5338,21 +5338,44 @@ get_aspect_ratio(const struct drm_display_mode *mode_in)
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
+	case DRM_MODE_COLORIMETRY_BT2020_YCC:
+		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB)
+			color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
+		else
+			color_space = COLOR_SPACE_2020_YCBCR;
+		break;
+	case DRM_MODE_COLORIMETRY_DEFAULT: // ITU601
+	default:
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
@@ -5365,15 +5388,6 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
 			else
 				color_space = COLOR_SPACE_YCBCR601;
 		}
-
-	}
-	break;
-	case PIXEL_ENCODING_RGB:
-		color_space = COLOR_SPACE_SRGB;
-		break;
-
-	default:
-		WARN_ON(1);
 		break;
 	}
 
@@ -5512,7 +5526,7 @@ static void fill_stream_properties_from_drm_display_mode(
 		}
 	}
 
-	stream->output_color_space = get_output_color_space(timing_out);
+	stream->output_color_space = get_output_color_space(timing_out, connector_state);
 }
 
 static void fill_audio_info(struct audio_info *audio_info,
-- 
2.41.0

