Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F9724E13
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A26D10E3C8;
	Tue,  6 Jun 2023 20:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2A910E3BE;
 Tue,  6 Jun 2023 20:26:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNvNDFyGlPpaRq+Why3wvuXF3CK2DgLN5hLi5l21+l3/5F++ZkO+RXFK33m91gWhaR4lVfkvqld25bM3HisJWdBBJPsb1KEsChGVZye12NKmtJ5taTPCN6rk2aTTA0JbxAtv6+ZAxZV0wU7uXsih32YzlBd06W+5sELfpqA7mn9GRLKzHjEH7UASFcmx+a5Blzlxsy5LKvIu4BcG73cGZir4GkR0AOWJm2QHlMAmeg3IH1C5hRx+HnVWhgYaKvA6Q6f5tmGGPLm8X5JVmsn+ql+pn91FkZKTfrRIJVYR9R/OkL0YQAZnR+GJaR4LFmucIrcgKBM9NVzrjEj1iFAQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jI0zVDnV6LWrwtWM5TNbeGDiBQucB8/oKUQoyawWXxI=;
 b=chJg+Z9uB7mWF3xcirfUTEJmdNqXVtMcrJWgwbtPFSYkRDAVzpRmQZjXSD5WvD/t3/9B7tpCHk7LH+h1F6P+vw4zgeBMMsDiZO5DaKBU06YONsWurnNWhse3nxP061FVUOtNTmNF9PraTXYDaqcpT1tTPxIbZpfvdNRzUlbh1nCKvazvxg78RsRkjg3gqSOszs/IZaEZi/Ew5ActD6Ejv3/lyb3BTsxNZps2prC88x1OIFasaQhVhEQf3+/HFDVSkNcdX6bZBvPNI2KDcBE1pouKygURixXgrssUxEaBVaag7Ppf9FpgucOwX4dq/iN/oNU9CnqiKlOwMZ9mBxe4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jI0zVDnV6LWrwtWM5TNbeGDiBQucB8/oKUQoyawWXxI=;
 b=5UBQykUiupj5AedlX04381fBiQwdNdAdB6SrpJAtfoTpYagqOslxIyOR42Rm4CtuUagoq37TG2asuWLRmm93JPK5QUvBavUdTw0bnqN+FCV5/ie1wOfTOd/SYPYJTmoCT5Zcbu7XWAAMNELtbMjlK3fmgDpqDFxFueRQhIsUI8I=
Received: from BN0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:408:141::27)
 by IA0PR12MB8254.namprd12.prod.outlook.com (2603:10b6:208:408::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 20:26:23 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::70) by BN0PR07CA0028.outlook.office365.com
 (2603:10b6:408:141::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.34 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:23 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:22 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 10/13] drm/amd/display: Send correct DP colorspace
 infopacket
Date: Tue, 6 Jun 2023 16:26:04 -0400
Message-ID: <20230606202607.122914-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT064:EE_|IA0PR12MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f14711-8239-4ede-aaf8-08db66cc4c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LFmtfy2Eto6MMmWQxtWeIlmLThjF2/2rSS85pwTNQYEVdNehD4LOmrMNE22Lm/ksuEyrFu2fBv7tGuJF6sZtIQ1nQSlnnMYoAh+v55xBP3QiT7f5GVEHd2Xh3LmIOwDTL7UEAVRZBLP4iJOQXWIaLp58ABpprYM1BWjJ9cqHL6HwZ0mQACQxYMckk4exzC91xKW5lq65fJ7DB9vABgxEIghCeMB2JV29iUjEiYmkjH7kymv6mJIrKYX5BWQeRDAngxvkUOkWVBR2kxRkAbpq8khgqAv1aM25m3ooKKiMFUHaYYD0yPJeKMLuvUlWi3msfwaa5+KEMEvIHdHMpzwD6tzipT9tcA9B8hZnnEEjFgfbSXDqK+U/2hwrwQ++iaqenqlUCFiiw+LgO05lOwPjloXGWIZWi42uAJwML4qQ7nOZPhV4ZWsuBlfNo4JwEhm72B5Nl/t0KtHjmI1Qibs1WaJTuXrSw4Q9e6WZok6tPv3+QcPmdhbMtJYu7LmE9eJNopTYivSokCwEcx8AKQGFBZ9IMwGkYiYhjGoeQmm8NVqHFsbOyRWUpZdKSReNY/F8SDZSVZcI6YzaGKPY54qaews6uZnjqv/4EPdSGqwArNUOiZvC4nm+LtkcdgxCXDdheWItkcyBaS5aJULKzIMirZMyM14plWYZhtIBqsV+0kv/krMJQwflsolX9w8mCzdA99NT/2kjKIC/0YL3k76MDt5I48p+t9BYsFAFfd2J2WiuhSfTlTV0tvLoYE9F0u9f3uHLI0lONMFAlGd8r0Sobw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(70586007)(70206006)(2906002)(478600001)(316002)(8676002)(4326008)(41300700001)(8936002)(110136005)(54906003)(44832011)(6666004)(5660300002)(1076003)(40460700003)(26005)(40480700001)(82740400003)(186003)(356005)(81166007)(2616005)(47076005)(426003)(336012)(83380400001)(36860700001)(36756003)(86362001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:23.7127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f14711-8239-4ede-aaf8-08db66cc4c01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8254
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

