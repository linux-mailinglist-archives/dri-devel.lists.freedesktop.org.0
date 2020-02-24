Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E516BC6F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669606EA3F;
	Tue, 25 Feb 2020 08:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs4.siol.net [185.57.226.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DF26E81A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 17:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id F27065236E8;
 Mon, 24 Feb 2020 18:39:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id JRsQv1euN1Bq; Mon, 24 Feb 2020 18:39:11 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id A7E775236BE;
 Mon, 24 Feb 2020 18:39:11 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 0743E5236E8;
 Mon, 24 Feb 2020 18:39:09 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 1/7] drm/sun4i: de2/de3: Remove unsupported VI layer formats
Date: Mon, 24 Feb 2020 18:38:55 +0100
Message-Id: <20200224173901.174016-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224173901.174016-1-jernej.skrabec@siol.net>
References: <20200224173901.174016-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: jernej.skrabec@siol.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YUV444 and YVU444 are planar formats, but HW format RGB888 is packed.
This means that those two mappings were never correct. Remove them.

Fixes: 60a3dcf96aa8 ("drm/sun4i: Add DE2 definitions for YUV formats")
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 12 ------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  2 --
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 7c24f8f832a5..3a78dbbceb8a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -196,12 +196,6 @@ static const struct de2_fmt_info de2_formats[] = {
 		.rgb = false,
 		.csc = SUN8I_CSC_MODE_YUV2RGB,
 	},
-	{
-		.drm_fmt = DRM_FORMAT_YUV444,
-		.de2_fmt = SUN8I_MIXER_FBFMT_RGB888,
-		.rgb = true,
-		.csc = SUN8I_CSC_MODE_YUV2RGB,
-	},
 	{
 		.drm_fmt = DRM_FORMAT_YUV422,
 		.de2_fmt = SUN8I_MIXER_FBFMT_YUV422,
@@ -220,12 +214,6 @@ static const struct de2_fmt_info de2_formats[] = {
 		.rgb = false,
 		.csc = SUN8I_CSC_MODE_YUV2RGB,
 	},
-	{
-		.drm_fmt = DRM_FORMAT_YVU444,
-		.de2_fmt = SUN8I_MIXER_FBFMT_RGB888,
-		.rgb = true,
-		.csc = SUN8I_CSC_MODE_YVU2RGB,
-	},
 	{
 		.drm_fmt = DRM_FORMAT_YVU422,
 		.de2_fmt = SUN8I_MIXER_FBFMT_YUV422,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 42d445d23773..6a244d6fafd9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -431,11 +431,9 @@ static const u32 sun8i_vi_layer_formats[] = {
 	DRM_FORMAT_YUV411,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV422,
-	DRM_FORMAT_YUV444,
 	DRM_FORMAT_YVU411,
 	DRM_FORMAT_YVU420,
 	DRM_FORMAT_YVU422,
-	DRM_FORMAT_YVU444,
 };
 
 struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
