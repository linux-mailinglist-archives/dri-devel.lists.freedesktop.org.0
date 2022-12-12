Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829664A6F7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A079210E277;
	Mon, 12 Dec 2022 18:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBB710E261;
 Mon, 12 Dec 2022 18:22:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiDxqAmjqS/3Xs1qOW7P9M0CxKKKIjdGpyQYcS4qK+Z+nXRsJJtcMMcrbpjtI98p5HFx1K5OgguKktsto9sRvkA9f+c9e1rqNmlVtm5gDfln8Pm/5DYhwO2KL4WGUnrsrbea0J7ryLLPTVWIZMDFpive5dhuLkrHDye87lZLiPTdtTZcXv0j9hvIHXdqkalDDOSojWw0vRzlnu3seAm9P3uyBGhZunICu9HMPnKDbV33+oqyA0axg8XDoN9AYl9XxAspaeAOogVVd0YQH2Rye+iwt8hQrBKD9j1BhKZ/zLjAWQlhFFqe7rddDIu+ggMSbMj74jZ2LI4LD6TTCCWsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWJtm8bxmVex7XnYQ+6KI71aHeW9BGrFMdDXdtCDrWI=;
 b=IfazUMYA3CmDybR3U0OAvrr2c8YNP66TsQS/X00r9r8tVtWBByQk4OTUwO5CYY7TFxoN+Q3jRgKQQmaseVQqZafFJXGr9WPrTxYxBujLvWqTTLVsJP0gHxx/N7XuN+Zhn5Wfdci4RfESRpyiaS3gjVaf/qd3n47ubLwDzma5+zmMKcwCRfC8AjOJWvcogwDO3WYdYyitkhCrUjXvPKTXqqz+55i4cjapQWZKh7IuK+CJxKIvvpP36C1wh5s6tLAzSOiP6oOsT01rXLVE578sGw9tpKV6vAE2fBAoZMftMCpBK/c8N1rEEk/pWlplNDpWHSWYtOiAHKwifKVk8KG4vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWJtm8bxmVex7XnYQ+6KI71aHeW9BGrFMdDXdtCDrWI=;
 b=NmWxThEcS+UzziE3KyovO7NVJNdrj1j4UG5yD2Qo8Iab/zSklNPyyY+p3tsVMaKcvUGw4BB38s7xsNLogoZKh5nO5mg40o2lSZQYhLDow3fMYqxCO6gcRgrw9tFLQJeGOVuPsmn7x5bvDC1UENr5e3/U2iGPC/ecDbnVHKuogsw=
Received: from BN9PR03CA0469.namprd03.prod.outlook.com (2603:10b6:408:139::24)
 by DM8PR12MB5416.namprd12.prod.outlook.com (2603:10b6:8:28::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:25 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::a7) by BN9PR03CA0469.outlook.office365.com
 (2603:10b6:408:139::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:25 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:24 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/16] drm/amd/display: Send correct DP colorspace infopacket
Date: Mon, 12 Dec 2022 13:21:32 -0500
Message-ID: <20221212182137.374625-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|DM8PR12MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 4050de57-8ad6-4431-1e99-08dadc6dd1d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YhA6QRwZDQ8dP0mow3c2WQFbhbDXXRerqsbLywhtDXoZOz2pLv6/mByVxvH8Lhby6VVgair4ouDnDjibZtTmN9Pw0hZqhrca3+ImMqxFZWEEOQgUesqbm1Tg3iESQeHtUMyCGTJPrm3w/ns/04bY9efiBcWuZ8dgs8oOyoesIfuy+MmObG1jGj9Z2KrhZsxfZgeGJV3f1w2I1SpAR036Gu0RNybbyHt4LaKw+jdi7cUPsCIfaoCPfCHJiR/wZS9VU3JT3yQYJIqK4OJxVk4F3SW7iYbNgkCVaGxGodSHKPWgRvTCO4JuN/wesAvjstx3ybsC2rquUHmjn5deSOBUCKC+jOkFv6E+AkerV8yXibt9VnU0ihKTEXJNLSnjNhz1OBP4iQkXSmzPowXk6YhxyXvlPi5bQyDNj6SlHdq4FnfwtaV+/4S62kmb6IzdK/s5RU0XVyjIdGsWGNVBKfKZFvvAMsg0TOtKS7H5h8SFUTVrrnl14RT5clij4My21ej8v0+vxbdjW8DiKRsJ/FCVBSar62s4KsugHA2yLcz3luOj1ybGOnTFxA0E6QSpNK0tbjmvfKKX3NrQCqYqLfNXLW+iwQllQAyPiclzVMVCNHMAuB6vq/dyXb4XbeOUosascOWW4TRJXDlEjg0gEwxwXg8UADHSAMruIJwq3VxFu4FnJe5qGy1DJ9GdZitSu55QgMAF870FstBoKiZJ6JXeqr769/1yO1QO60HFjKdhSe0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(316002)(54906003)(26005)(110136005)(40480700001)(36860700001)(6666004)(2906002)(426003)(86362001)(70586007)(36756003)(70206006)(186003)(47076005)(40460700003)(356005)(8936002)(478600001)(2616005)(44832011)(81166007)(83380400001)(82740400003)(5660300002)(8676002)(4326008)(41300700001)(336012)(1076003)(7696005)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:25.5501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4050de57-8ad6-4431-1e99-08dadc6dd1d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5416
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

Look at connector->colorimetry to determine output colorspace.

We don't want to impact current SDR behavior, so
DRM_MODE_COLORIMETRY_DEFAULT preserves current behavior.

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
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 38 +++++++++++--------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 310388219f8c..8cf5a44d1d15 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5147,21 +5147,21 @@ get_aspect_ratio(const struct drm_display_mode *mode_in)
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
@@ -5174,15 +5174,21 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
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
 
@@ -5311,7 +5317,7 @@ static void fill_stream_properties_from_drm_display_mode(
 
 	timing_out->aspect_ratio = get_aspect_ratio(mode_in);
 
-	stream->output_color_space = get_output_color_space(timing_out);
+	stream->output_color_space = get_output_color_space(timing_out, connector_state);
 
 	stream->out_transfer_func->type = TF_TYPE_PREDEFINED;
 	stream->out_transfer_func->tf = TRANSFER_FUNCTION_SRGB;
-- 
2.38.1

