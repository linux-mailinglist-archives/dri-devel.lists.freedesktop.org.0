Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E6711729
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB20110E73D;
	Thu, 25 May 2023 19:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E0C10E198;
 Thu, 25 May 2023 19:18:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AywUekmcKMnjj20R6Gw/KKF5V6pf7F9GoFlnwJmrWTenCAAdfoW4QkYj1AYwpPzaonlJxonX6vcg6DkNDQ/KDiaqY2Y+wedMM/aOAB3Lk+aSpFfv1dX6nuaMobc8Q+qzdwVBQhM/i/GFLKXjZzHlH1GyvF9Iy5Y7ptajHvCmDerRk9oNx72nQTU12USAPpGNon2rYZJ7ZocIqE/C30+feEZVuv7c7gba255P+g3eU7UPF9Fd+IYGZ771Cj3haRgg33Hu60MzPy6nf2vRonZp0YMtG+/lFhuz8xvkAqLfIq9JXSqLgVARyz2xCfpAihHQUq8F+AWKsbJRJJJz5CJUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2sHMYY6fGX9wd6o4g7CA/0EkHznV9Lk/kF8S+WRegw=;
 b=K+EBibk3FetFebaz4KMIAduDvMhUXzSU3jKhDqO4gA/gk20Tx9y2BNoUf/XeDgZ2JrSDAhFO7nscKxmOhSRxnsF83dlx3b2A/3gTAiAF3O6DtadQE6U69l6u4LwPhWD/xzvbBN8ZTG1Ra0mesyD8UlCkr/4MRQaT9SBDDmrsk+ivD9LwpOcdd8bFcaKCu3TKbt70yxavtYgnc2zDPKTyHmfxN2UmyEx4Iq5GIElamXIkqbkr9HGoBX2xpIu2x6t23CzM9ABV1qNNjp7zh5pXdTedlm4ZJCmi5qsv6w4S3r6hYHGlciYrBumj9h2PA1ESF38CCGIZu91Qs3zGv3GNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2sHMYY6fGX9wd6o4g7CA/0EkHznV9Lk/kF8S+WRegw=;
 b=TJROhZdSkeTbtIJzRfYUx1+RQt3VB76EOIwU28MzfbaToH1rmkj+Qg8iV49zABISrAFxellxnBPwZ8shxpwTu0YpuwD1VEbKmWasBEeXvnv6mLJss7X8XhhrlVZOUoOXlX7U0heWE/PAaDx2MUyEa+d3hdbl7SvqFvRzJhcZWnU=
Received: from DS7PR03CA0186.namprd03.prod.outlook.com (2603:10b6:5:3b6::11)
 by MW4PR12MB7430.namprd12.prod.outlook.com (2603:10b6:303:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 19:18:43 +0000
Received: from DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::d0) by DS7PR03CA0186.outlook.office365.com
 (2603:10b6:5:3b6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 19:18:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT103.mail.protection.outlook.com (10.13.172.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 19:18:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:41 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:40 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 10/13] drm/amd/display: Send correct DP colorspace
 infopacket
Date: Thu, 25 May 2023 15:18:06 -0400
Message-ID: <20230525191809.3524-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT103:EE_|MW4PR12MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de5f83c-79d2-43c2-f62a-08db5d54da80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJ94TAnQ9Rl7fYthYvNYu8V8jfI8+ENEpEqNbgqTSx4Fh97mb2/AQBN5luMPyva55w3CytXmxHvm1yxrKAHOw6PzicA7vKdsIsgaeXxgBV7F+fpnB2/xQLKciWx9chIu0yG2pphj1olQyEWohkOYZIgCx3KkHatpXZzFkQHFP4LD6ZQVGO3sQLxg8Z+m5p6A6Y4Kd7uMH2EacxTEXT9mb9qewqe6/qHEfwd8kt20htVgejBoZ3M3LqSOx+kX+SZDz5tJxFfhTDsknEym/H3iloYg8AF0OVyV7lb20Qoi0Gfxue2eh9UtwaeXwzroHQ9EFUeMbB3EUJ9UpG3xBQZ3VKob1hBE4X7uMWnZzWJ5qYqMgRcsr42S/w1dPbahetJUzKiDJnF1OKW49N/z/Og8NTwCKemYuY57N/WbQ0wtGyDa3i+8Ij3UFfWT3KqRaf33nhZtPs9r85O4alJCBXf+7JkpgMWSOuV7Knhax7L7ZRDghQQQAYR8YmY3z58bkmrpzGA2ngKMTFRs2O4GhczELooZanbepw/XsC92VeJoozGF+DzRQZukjidPb5SfaO/Wq0sofG4nIDJHiyhWPSaqFBr4zNTLS1QiaBmHYcPqcVP5CgabnT8t2Ai4lHwnzUie7lCOxHikZVE/cBWO0ShQoQZzNzcrr1z9c4Jt936N4bxzl+hgDpogRTsS+3PITfZjSMWenOa3rofby17O143m6JO2watWqTonDLFnpva0hdk2YMb/7HeCdOI0Ie8syK9qIEn6X8cQR0DTEGlycPR0cg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(8936002)(8676002)(82740400003)(40460700003)(81166007)(5660300002)(356005)(186003)(36756003)(2906002)(36860700001)(86362001)(82310400005)(426003)(336012)(47076005)(26005)(2616005)(83380400001)(44832011)(1076003)(40480700001)(316002)(54906003)(110136005)(4326008)(6666004)(478600001)(70586007)(70206006)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:42.6796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de5f83c-79d2-43c2-f62a-08db5d54da80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7430
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
index 5c290e6aac46..a8de26f09806 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5330,21 +5330,44 @@ get_aspect_ratio(const struct drm_display_mode *mode_in)
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
@@ -5357,15 +5380,6 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
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
 
@@ -5504,7 +5518,7 @@ static void fill_stream_properties_from_drm_display_mode(
 		}
 	}
 
-	stream->output_color_space = get_output_color_space(timing_out);
+	stream->output_color_space = get_output_color_space(timing_out, connector_state);
 }
 
 static void fill_audio_info(struct audio_info *audio_info,
-- 
2.40.1

