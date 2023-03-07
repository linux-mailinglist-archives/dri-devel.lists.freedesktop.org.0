Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1230B6AE416
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1A710E4F9;
	Tue,  7 Mar 2023 15:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F4610E4E8;
 Tue,  7 Mar 2023 15:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWE92kyWKDrw/PR7/wL+OqI1w5+t8YRpvJLTiltjIe8qMsPePhUTnf5j+vv/22nP6EfKKczR4nILWKeXiVoi0un1poO6dh63eNFKIupEDSqWtkeHnSSa2CzxOm03YbS+7wFvrTkIRAcDDr/BRRC18IwBGsx2Hd8aIqAFOKLFQzT11aOUBJxJnK3fRaRcaBn6XwMLtja3xtH8xCQukhPGlc4RR80J4LVKZC1aMOQa7b6gBk1rYaPF32U2o63aLiAy/5zxsH08iZgN5D89j0stRdNaYoNQydl8rCFIdSb6Adc2W38lUGuAFWdjb5I19SG2jDxNQGN5emt/eoy7jZBFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyLBXG83rw75iZ/awqCaX0+wOWij8tUvdiyX+Zo1tVw=;
 b=GQgc2oJblzjuiewhQqJE9YHb1tZPbqRfIDHRMgfgukHqcmxnN29ZcHzd/Y7iB01avSMJIecqmpDwL4NjKSACoceUq78cOIIAUSPwk6QnlyuojUf9kHoE3HtILL48LD3bTQ1JoFZdE+Ic8BDaMeB5XHx5ODNPHnhKbFZrHTrIPoSbqCkG70RUWQbsnqRtC/v5X+ZguXM/HSakenahYowzGerNG8hGktF9kuCQt5BnnT3AZ41n8XPNgmKixZMZc78WAPskLKHfvx3ErmEwIAw3m082bQb0kVeEvXS/051RVjV3G9cHYJFjf8k7mUq0vqPL5+09L2Zaj8DQQN8J+DF2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyLBXG83rw75iZ/awqCaX0+wOWij8tUvdiyX+Zo1tVw=;
 b=tF1lgm0PNnM3cRY4XFvvAO/4VpIsTX4KCaNMBngqTVR8nu73ceho3KPCRW17fRVvW5GhJug7ycYMy/vxBLUWL86zwrzipAnrVEdIwULHOGUOxrGa0uETN42DnU2NWBdFp5FI6qFN3g7KK5zM2Cttg43v5Bk/6sWuBvwyqANVfYI=
Received: from DS7PR03CA0282.namprd03.prod.outlook.com (2603:10b6:5:3ad::17)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 15:11:26 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::b7) by DS7PR03CA0282.outlook.office365.com
 (2603:10b6:5:3ad::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 15:11:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:25 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:25 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 11/17] drm/amd/display: Send correct DP colorspace
 infopacket
Date: Tue, 7 Mar 2023 10:11:01 -0500
Message-ID: <20230307151107.49649-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fa56e3-a8b4-4b4a-bfa1-08db1f1e38c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: baU9navLFLOcjF5Kf9oTr5mtp5KPmoVDZWEqaO7F2/aZWNZVnSPf0z1VAl/aI4L/3KLTEoubpZkpC7PL+XWoeXozA7MRZJfJM0HgWB7wGL/jntSr7gKVkXdOhR0dyR0Pnr1hdFYCoo3KGRqqRZ9W2bwZKJstO1BmiVmWStaQz13jS5Mdg/mIoVGUjaFLFLmXNhnnRMdAhADnZYCYM5524tSL/oAUqSeK+7BJeu0sF8LJQubh5YravhWIHis0f2paxfDwtT6qvESLJyjy8CoOaWUikaxu2br1W7s+gRbiu/KEdWG7ADbevRBGGFOlmFElnDKmpKdadVxHSrqBRGif25BJFDyFE4TO74wMO8K8SVd+Sm0cYSWc37zBsNevp7Usgg1F59Zsn5nv2kohl6ip0lRpwzkvWFOO8EVdKN6NdYkcRfXZgeHPexIDRR1id1dAudvxT3Oyu6q5/Fv7C73qGx17JUbC9Zd0RHENCPU9juc2Gvhn1MyIwbu/Pygx4nvptNPznhbrrqkcaGmHo505nuPn+By8UOpzgeCVE/ghgkQhNHcgOUXAWqQa4b/mNh6l5xPJLVcKK6M6CAP7VAp8dO3bja993GVP5Xw7FAvN8IfIEICTsOuktZ1dmgBnmFnfIKLaTdSSUvFjX06rf1Tw3DIQCXWB1S2K36SUk51fZS8abEDk3XkIZsrqll3M+Ec0I0QvKdY8xQ4/6Z2gCP5+XIloKqB+1KX4bSECkEhPES4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(46966006)(40470700004)(36840700001)(110136005)(36756003)(316002)(336012)(83380400001)(54906003)(40480700001)(82310400005)(86362001)(2906002)(70206006)(40460700003)(186003)(70586007)(5660300002)(82740400003)(44832011)(26005)(478600001)(8936002)(8676002)(41300700001)(36860700001)(4326008)(1076003)(426003)(2616005)(6666004)(47076005)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:26.4239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fa56e3-a8b4-4b4a-bfa1-08db1f1e38c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859
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
index 58fc719bec8d..cdfd09d50ee6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5302,21 +5302,21 @@ get_aspect_ratio(const struct drm_display_mode *mode_in)
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
@@ -5329,15 +5329,21 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
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
+	case DRM_MODE_COLORIMETRY_BT2020:
+		color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
+		color_space = COLOR_SPACE_2020_YCBCR;
 		break;
 	}
 
@@ -5476,7 +5482,7 @@ static void fill_stream_properties_from_drm_display_mode(
 		}
 	}
 
-	stream->output_color_space = get_output_color_space(timing_out);
+	stream->output_color_space = get_output_color_space(timing_out, connector_state);
 }
 
 static void fill_audio_info(struct audio_info *audio_info,
-- 
2.39.2

