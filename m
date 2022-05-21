Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD956530978
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256CE10E7DD;
	Mon, 23 May 2022 06:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C6110E079
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 13:35:02 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id c2so9459205plh.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X/1JoYU2eaaPdYWTtHptPizgGXOiJfqbRsxQiijvcnU=;
 b=hJ2wZiz43Q7G5xoR7vAK2HSUyHGSdRL6QM5wOn5ffWmh5k2Q9I5pqiRe4xddjEhY8e
 IGx3dW2owdGd6n7HP8V94tSJYcKWxXNF0wiB3hZ5KvoEBtuViuVj3SRjC1qO0uau/WCB
 S30vyXiWvOWLqj/mj66JfAe6myrcD66UJh/gEwv1GpzVDZJ+SsT3VdoObIg7449Qjasc
 yipS888I4w66zXrKuPCsk6JY9czhevexTSnd7nwSpnYuKonJ5ncBXahUxoxsgLX4Jtnu
 QYIAmB1QvxnvWoxkCg9VBammHApWcTg8J1eP7nWuRnLEYPtoqB5MFCQkxkBLn2i3M7XI
 CfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X/1JoYU2eaaPdYWTtHptPizgGXOiJfqbRsxQiijvcnU=;
 b=l1JCESKNDqWy+FOMYst6qyjU69eG/jWcz6KvWNEO5L5kQ0V8b1HNBCm6yfm5vH2NKj
 nqm5TEfyeYe8a2ihYC7I8svCVLw1fJYCgRanUlYGDoveu+4EmzCENfb2bl3k7hgxAeLL
 gBAGLKqimXo4nfyob9o1wO1HQl5cNeDEtnuzo4t0qSpiLAQZOk60TEv+J0aK6WSPs7Sr
 2giePtU6FtSCut5oDFL9NiQCIyoCyWQzVnDm5tqYqnJ3Y1CsvxzRrP7YNvs9j6lhhxmK
 Ccfj/CL56C/Pt9mGAKIIpmPdf/LRzYbpI+2CMDzK1IbkBGuyFzGPw83FDTeKHCrPUtVZ
 A/2g==
X-Gm-Message-State: AOAM530M3/RyPikS1x0ObH7FtvUvrUK0wU8Exa6xZnK8Z6vxBbmx3nEZ
 khQknCZmZovlTJd5raHK9f0=
X-Google-Smtp-Source: ABdhPJx0zCLwUiyeASotOlJEzSqtjfEA3r1zvU8fue4LcCU1odSzkqoq62UrwvZajtLu0Z/RriA9jA==
X-Received: by 2002:a17:90b:3889:b0:1dc:cac6:f03e with SMTP id
 mu9-20020a17090b388900b001dccac6f03emr16537918pjb.23.1653140102261; 
 Sat, 21 May 2022 06:35:02 -0700 (PDT)
Received: from benly-pc.localdomain ([58.100.171.250])
 by smtp.gmail.com with ESMTPSA id
 jb15-20020a170903258f00b0015e8d4eb256sm1597765plb.160.2022.05.21.06.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 06:35:02 -0700 (PDT)
From: Genfu Pan <benlypan@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com
Subject: [PATCH] drm/sun4i: mixer: fix scanline for V3s and D1
Date: Sat, 21 May 2022 21:34:43 +0800
Message-Id: <20220521133443.1114749-1-benlypan@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: Genfu Pan <benlypan@gmail.com>, samuel@sholland.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accrording the SDK from Allwinner, the scanline value of yuv and rgb for
V3s are both 1024. The is also the same for mixer 1 of D1. Currently the
scanline value of rgb is hardcoded to 2048 for all SOCs.

Change the scanline_yuv property of V3s to 1024. Add the scanline_rgb
property to the mixer config and replace the hardcoded value with it before
scaling.

Signed-off-by: Genfu Pan <benlypan@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 13 ++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  1 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  3 +--
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 875a1156c..e64e08207 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -567,6 +567,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -575,6 +576,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -584,6 +586,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.mod_rate	= 432000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -593,6 +596,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -602,6 +606,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -610,7 +615,8 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.vi_num = 2,
 	.ui_num = 1,
 	.scaler_mask = 0x3,
-	.scanline_yuv = 2048,
+	.scanline_yuv = 1024,
+	.scanline_rgb = 1024,
 	.ccsc = CCSC_MIXER0_LAYOUT,
 	.mod_rate = 150000000,
 };
@@ -620,6 +626,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -629,6 +636,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
+	.scanline_rgb	= 1024,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
@@ -638,6 +646,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.scanline_rgb	= 2048,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -647,6 +656,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -657,6 +667,7 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.scanline_rgb	= 2048,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 85c94884f..c01b3e9d6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -172,6 +172,7 @@ struct sun8i_mixer_cfg {
 	unsigned long	mod_rate;
 	unsigned int	is_de3 : 1;
 	unsigned int	scanline_yuv;
+	unsigned int	scanline_rgb;
 };
 
 struct sun8i_mixer {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index f7d0b082d..30e6bde92 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -188,8 +188,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			src_h = vn;
 		}
 
-		/* it seems that every RGB scaler has buffer for 2048 pixels */
-		scanline = subsampled ? mixer->cfg->scanline_yuv : 2048;
+		scanline = subsampled ? mixer->cfg->scanline_yuv : mixer->cfg->scanline_rgb;
 
 		if (src_w > scanline) {
 			DRM_DEBUG_DRIVER("Using horizontal coarse scaling\n");
-- 
2.36.0

