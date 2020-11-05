Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DADF82A8165
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C726ED8A;
	Thu,  5 Nov 2020 14:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DD96ED84
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRroRlpiI4RnQSZKfJabuBJCl1DklsiMIgE4+KYQsUMSjukrSXyBaF4z9I0eg0nhpzIg08qZV9Lx4LjjbQhWpC1+TlSnC6s2wC+7TY3FkKbITOY6o+xAg8XhnnNgLtAkTI0rUdT0hXvMFF1U9cbonHbie9rvAlWuRCuXQ+l7Do9/dS2VMsCymx4q8Iq14jUVtM3qFJMBS0z+7L1WXXPmohOjtAo8UcJqYkYFaXccRXs+9gLz7XypG9Odft/2RQeQhptbB8AZFHkqVE1ASK2tSCHq8kKBMW1C7ue46VRLo1KnUz9tmMke6AKVOJxgSj2E9EYpgqkTu20E9nW5XH8Uzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j15SjDF9aLjGIPxBcDlHgRAxxK6JsizXt3CeJttpP0g=;
 b=B4VtUrP8YidYS496cqCu+RufeWDW0oGhraO59VuzaOa8whEv+mVzpIJtDN380WH+tRJ68EHrtdDAln8SRUggR2jVEDO3bEVCcznpNKy9J20KaArob5iEgzTa3aff8j0bya0FYhz/6pOvXxU4JfyS9KC9TrWUeycNgNchpwmgNNeiZLwEZ/jDQNTkfOJ5xGnH+/LJH6DNWI972V7KD/H7nqaJQmh8kIgp3e5OInMzq7rSe2g9bxiwWWEihPbKPurA431AciJsgqmAqyPckowHqgjz6JzDBK/WCGiMr53QJqRzPjvRKHViMgSd3254Yekk7tfkJCOIfpJjq3uVMP/6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j15SjDF9aLjGIPxBcDlHgRAxxK6JsizXt3CeJttpP0g=;
 b=Om2yd/gG0FLY7q1h+nDtNcZLlNBLoVIXxLhxjBCeZMq/Gra0PcQ/IqQd3GKoOxDqwHNiBtc/v4A8+SNo17wLqnuGhw1jq2RqKI62z+C1hYwLqT85ywr4d0C28/pr/hT8uVzTozDcU3E8Pv6NtkejesBle+9D2Toz9KukeDR1kMI=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VE1PR04MB6495.eurprd04.prod.outlook.com
 (2603:10a6:803:11d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22; Thu, 5 Nov
 2020 14:50:47 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::f000:d709:509:bb5]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::f000:d709:509:bb5%3]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 14:50:47 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH] drm/imx/dcss: allow using nearest neighbor interpolation
 scaling
Date: Thu,  5 Nov 2020 16:50:18 +0200
Message-Id: <20201105145018.27255-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM0PR03CA0101.eurprd03.prod.outlook.com
 (2603:10a6:208:69::42) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR03CA0101.eurprd03.prod.outlook.com (2603:10a6:208:69::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 14:50:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 47c2cff4-8a32-4914-2147-08d8819a2df1
X-MS-TrafficTypeDiagnostic: VE1PR04MB6495:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6495F2D9540F85EB91D0D5B2BEEE0@VE1PR04MB6495.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zp+Owf++aSJe9b38E+Yaw8qGPc+X0Ft7N65S0K+SexUXwyyVTBIojJ3G0ySLhrM/6D2N6gCvaUV7w7ZfpLLJQGX+9+rZTznjRg/TmImguDpai3I00uvw09WcM0sk1BtSo8oAVIEsnXkr/Zerw0tlauDk+GoEFyNo43U72a65mnwexu0rs6yuzh0Y6wT0w/ASiLryN3F6Ucl5waV1fouBCzM3a5RflHgn2DPvyKAtU8yR+uhqx0lFO05h9m9goWCYA4Uav6za4LHJ4pY8czlagzWotrZ2AaLYTCWSL2oiRrkvWTjQ64agcXi9VIrrDI5Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(66476007)(66556008)(2906002)(8676002)(8936002)(6486002)(6512007)(66946007)(83380400001)(6666004)(86362001)(110136005)(478600001)(2616005)(956004)(7416002)(44832011)(52116002)(1076003)(186003)(4326008)(316002)(6506007)(5660300002)(16526019)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: JNv6rEFMF3tgV8akulWD+LcyC0pZWF7/vOIBmyN0Ke3ZYtMhSBGaWfw5r7xvK0Ha6W2iK8lzPJ9gytMqNO12ZY6899/GhW9hvqo8VSw51L75+t44sosAoBKXBG7NsOgRvRFttzaYcqle6ccZojTLFL9RLzEIZMRH1dadrDkv6BcW1tLEmV9ZXnHxGtMeD99p29cDxNZwOJHR/ow8Ft1ViPPagcYddT2Y0s+MB4volB47FdDp/SbsSYhtQuEz5Ev2T1SUuXW8AHiHs0qRPuVhhyDc0lKu/HjgX/bMtDcxHLUF2nN+AUV2i0P3liA1uscH+8aOngDSvRQ709TMCtBe2sC9sAaoYxT8tG62K6Tgdaq8EV/dENCrcbKrLBE6n8z9SdOLND+RI9g54q4/6RS1bCO+7N4Uoa1ssxsZGyLQcGgohSy42ER64uabXvCg4Dnvopbi2elKatj0hM0yjmp90iSJZ5lSp28wl50P6rkrOOD4qZQgB5uBSRFTOBbzogJqIKbzxCRDn1qvcO7p9l+7myei9v7TYEehTsVhxl1mnkPiVy5s7FbywGM0y2FC4mG15UWhVTo2VfKXC77smrBRvJEL6/ob0xDdYzNHxvFvF+cOcKeD940PVkC8kvBlx//Qiehw/LwrEz3sgZKX+hAPjg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c2cff4-8a32-4914-2147-08d8819a2df1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 14:50:47.1419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6gYG9GXJsD3IahANBZrtvEZaF66ALFGcj61nisCHWBbhjCzexKyPSKGB+ukg+yw7fRA4PTsGXXm8k81WgSvKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6495
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
Cc: Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for using NN interpolation scaling by setting the
SCALING_FILTER plane property to 1. Otherwise, the default method is used.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
I had no retro pixel art games to test this with, so I used modetest to see the
results:

To test, I used a 240x135 buffer, upscaled 8 times to 1920x1080:
 * default scaling method using gaussian filter:
/usr/bin/modetest -M imx-dcss -w 33:SCALING_FILTER:0 -P 33@38:240x135*8@XR24
 * NN interpolation method:
/usr/bin/modetest -M imx-dcss -w 33:SCALING_FILTER:1 -P 33@38:240x135*8@XR24

Thanks,
laurentiu

 drivers/gpu/drm/imx/dcss/dcss-dev.h    |  3 ++
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 10 +++++-
 drivers/gpu/drm/imx/dcss/dcss-scaler.c | 47 +++++++++++++++++++++-----
 3 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.h b/drivers/gpu/drm/imx/dcss/dcss-dev.h
index c642ae17837f..1e582270c6ea 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.h
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.h
@@ -7,6 +7,7 @@
 #define __DCSS_PRV_H__
 
 #include <drm/drm_fourcc.h>
+#include <drm/drm_plane.h>
 #include <linux/io.h>
 #include <video/videomode.h>
 
@@ -165,6 +166,8 @@ void dcss_ss_sync_set(struct dcss_ss *ss, struct videomode *vm,
 /* SCALER */
 int dcss_scaler_init(struct dcss_dev *dcss, unsigned long scaler_base);
 void dcss_scaler_exit(struct dcss_scaler *scl);
+void dcss_scaler_set_filter(struct dcss_scaler *scl, int ch_num,
+			    enum drm_scaling_filter scaling_filter);
 void dcss_scaler_setup(struct dcss_scaler *scl, int ch_num,
 		       const struct drm_format_info *format,
 		       int src_xres, int src_yres, int dst_xres, int dst_yres,
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 5db093aada2f..03ba88f7f995 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -257,7 +257,8 @@ static bool dcss_plane_needs_setup(struct drm_plane_state *state,
 	       state->src_h  != old_state->src_h  ||
 	       fb->format->format != old_fb->format->format ||
 	       fb->modifier  != old_fb->modifier ||
-	       state->rotation != old_state->rotation;
+	       state->rotation != old_state->rotation ||
+	       state->scaling_filter != old_state->scaling_filter;
 }
 
 static void dcss_plane_atomic_update(struct drm_plane *plane,
@@ -313,6 +314,9 @@ static void dcss_plane_atomic_update(struct drm_plane *plane,
 	is_rotation_90_or_270 = state->rotation & (DRM_MODE_ROTATE_90 |
 						   DRM_MODE_ROTATE_270);
 
+	dcss_scaler_set_filter(dcss->scaler, dcss_plane->ch_num,
+			       state->scaling_filter);
+
 	dcss_scaler_setup(dcss->scaler, dcss_plane->ch_num,
 			  state->fb->format,
 			  is_rotation_90_or_270 ? src_h : src_w,
@@ -394,6 +398,10 @@ struct dcss_plane *dcss_plane_init(struct drm_device *drm,
 	if (ret)
 		return ERR_PTR(ret);
 
+	drm_plane_create_scaling_filter_property(&dcss_plane->base,
+					BIT(DRM_SCALING_FILTER_DEFAULT) |
+					BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
+
 	drm_plane_create_rotation_property(&dcss_plane->base,
 					   DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_0   |
diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
index cd21905de580..47852b9dd5ea 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
@@ -77,6 +77,8 @@ struct dcss_scaler_ch {
 
 	u32 c_vstart;
 	u32 c_hstart;
+
+	bool use_nn_interpolation;
 };
 
 struct dcss_scaler {
@@ -243,6 +245,17 @@ static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
 	}
 }
 
+static void dcss_scaler_nearest_neighbor_filter(bool use_5_taps,
+						int coef[][PSC_NUM_TAPS])
+{
+	int i, j;
+
+	for (i = 0; i < PSC_STORED_PHASES; i++)
+		for (j = 0; j < PSC_NUM_TAPS; j++)
+			coef[i][j] = j == PSC_NUM_TAPS >> 1 ?
+						(1 << PSC_COEFF_PRECISION) : 0;
+}
+
 /**
  * dcss_scaler_filter_design() - Compute filter coefficients using
  *				 Gaussian filter.
@@ -253,7 +266,8 @@ static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
  */
 static void dcss_scaler_filter_design(int src_length, int dst_length,
 				      bool use_5_taps, bool phase0_identity,
-				      int coef[][PSC_NUM_TAPS])
+				      int coef[][PSC_NUM_TAPS],
+				      bool nn_interpolation)
 {
 	int fc_q;
 
@@ -263,8 +277,11 @@ static void dcss_scaler_filter_design(int src_length, int dst_length,
 	else
 		fc_q = div_q(dst_length, src_length * PSC_NUM_PHASES);
 
-	/* compute gaussian filter coefficients */
-	dcss_scaler_gaussian_filter(fc_q, use_5_taps, phase0_identity, coef);
+	if (nn_interpolation)
+		dcss_scaler_nearest_neighbor_filter(use_5_taps, coef);
+	else
+		/* compute gaussian filter coefficients */
+		dcss_scaler_gaussian_filter(fc_q, use_5_taps, phase0_identity, coef);
 }
 
 static void dcss_scaler_write(struct dcss_scaler_ch *ch, u32 val, u32 ofs)
@@ -653,12 +670,14 @@ static void dcss_scaler_yuv_coef_set(struct dcss_scaler_ch *ch,
 
 	/* horizontal luma */
 	dcss_scaler_filter_design(src_xres, dst_xres, false,
-				  src_xres == dst_xres, coef);
+				  src_xres == dst_xres, coef,
+				  ch->use_nn_interpolation);
 	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_HLUM, coef);
 
 	/* vertical luma */
 	dcss_scaler_filter_design(src_yres, dst_yres, program_5_taps,
-				  src_yres == dst_yres, coef);
+				  src_yres == dst_yres, coef,
+				  ch->use_nn_interpolation);
 
 	if (program_5_taps)
 		dcss_scaler_program_5_coef_set(ch, DCSS_SCALER_COEF_VLUM, coef);
@@ -678,14 +697,14 @@ static void dcss_scaler_yuv_coef_set(struct dcss_scaler_ch *ch,
 	/* horizontal chroma */
 	dcss_scaler_filter_design(src_xres, dst_xres, false,
 				  (src_xres == dst_xres) && (ch->c_hstart == 0),
-				  coef);
+				  coef, ch->use_nn_interpolation);
 
 	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_HCHR, coef);
 
 	/* vertical chroma */
 	dcss_scaler_filter_design(src_yres, dst_yres, program_5_taps,
 				  (src_yres == dst_yres) && (ch->c_vstart == 0),
-				  coef);
+				  coef, ch->use_nn_interpolation);
 	if (program_5_taps)
 		dcss_scaler_program_5_coef_set(ch, DCSS_SCALER_COEF_VCHR, coef);
 	else
@@ -700,12 +719,14 @@ static void dcss_scaler_rgb_coef_set(struct dcss_scaler_ch *ch,
 
 	/* horizontal RGB */
 	dcss_scaler_filter_design(src_xres, dst_xres, false,
-				  src_xres == dst_xres, coef);
+				  src_xres == dst_xres, coef,
+				  ch->use_nn_interpolation);
 	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_HLUM, coef);
 
 	/* vertical RGB */
 	dcss_scaler_filter_design(src_yres, dst_yres, false,
-				  src_yres == dst_yres, coef);
+				  src_yres == dst_yres, coef,
+				  ch->use_nn_interpolation);
 	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_VLUM, coef);
 }
 
@@ -751,6 +772,14 @@ static void dcss_scaler_set_rgb10_order(struct dcss_scaler_ch *ch,
 	ch->sdata_ctrl |= a2r10g10b10_format << A2R10G10B10_FORMAT_POS;
 }
 
+void dcss_scaler_set_filter(struct dcss_scaler *scl, int ch_num,
+			    enum drm_scaling_filter scaling_filter)
+{
+	struct dcss_scaler_ch *ch = &scl->ch[ch_num];
+
+	ch->use_nn_interpolation = scaling_filter == DRM_SCALING_FILTER_NEAREST_NEIGHBOR;
+}
+
 void dcss_scaler_setup(struct dcss_scaler *scl, int ch_num,
 		       const struct drm_format_info *format,
 		       int src_xres, int src_yres, int dst_xres, int dst_yres,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
