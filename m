Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CCBBD0B52
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D921C10E1CA;
	Sun, 12 Oct 2025 19:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EwJVQJT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8DB10E1C5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:24:12 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b3dbf11fa9eso592142866b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297051; x=1760901851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XtfZqtpuShLv1nU1aubYkk3yFU+GUfrCfqGs419v49U=;
 b=EwJVQJT7te+lBxsQTBAahocKjUjMlyAU9ZUD5NUflmcd6OyQReDjQC3y2l7IYPlO6D
 LIvAsZQURkHkCqDlb0So8zmszyhyM884SKhHcxQr2+yU4hnP+AUFPp8WgM7rJbvh1IF3
 XVlQMF3o6onjS6JuX4p5/HK2gRufGv9PHlBlkJIntu0gbQc5Kzd4/aA3kLjlqRZO+cM3
 4fhJAN9kB1okuqDjhE+MlalBhYKk4rktHzIwXz9sew/NGZqeJbrc1F3Zy2XuXwiL8DZe
 ZA1KuCA68gWNC2XT7lCU6Nt0rkivFP582pLMwIrtBgn+xoL32C+f6i8j/F1KjkSTcHoo
 SOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297051; x=1760901851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XtfZqtpuShLv1nU1aubYkk3yFU+GUfrCfqGs419v49U=;
 b=vIeEwntVTFjXmZo55GZNnsFNDavA3GoD+UukVs42g/e1dnWDLHrg11sJWAyjMK8AYQ
 kZDIFum9iXTlCyZJjv2OvEvSgy47BYioTXSSOVkJDmuEtyUi9iLdk+bRViRpCrVq1QAX
 kAy0aTCO36t/Dia+H36kFrDyvJm9eSESQnZDy+8Hg2yJR5MCqp3yVU2Miqr9W570C9nR
 oOjgcnr/6nkQ/JhKo6hQ+j60wuVul76LqVHF+0h27+jNy3SGAHI0FED959S2SwrewKkZ
 lVpGuEmNaJ/R7OawR43qR2zMsnpjaCQl/aZxeYauagG2UdyoqyZ3og4SOfuGs3rtUg3i
 VpKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd3vkQWNpXGNqLmVD6jYgBryuos1LA3DvJl5C/kO5iHwNzL8yhMaxWP/Q8D3PT/eDaj1ZMaX4/DTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu9HaBcK9cTf4FDjJSUpowZsS8Mk6vb85w3Hztu/636wpXRkDO
 D51iiWPNL00XLHWlgf/JsfskwfHoUmogXKGobDVtZne+/9zOQ6NxsIzS
X-Gm-Gg: ASbGncsTuvJpUWrR6JAcowkJAQmtIPOYAhqrn+vvOar0OWLDRIjESHxl403Fv0HzTgb
 fg6w/A6Hmyvqcw6xoo/YWv30OrE+Q/S6GuKzQaG2CK0VdzhyMpYKZvs9hMhN/5mpPg3v4ZZigTB
 6s+iFWENFL6/x49ZFI3dWWGJ2N30bmaU1Hboh8MYFl/NI+CbvvdiT1B5ZeJan+Wqx3rogVKEP3n
 lhfiu57q+3VroMKIGcPtDp2D4Bhq6FMZF+e61fvQuk5k0skUGIhK0Un0+Kg4Dx8MDn+m4OCVwBl
 7aUNA5MeltdqELpSnGyqsmRbGwgHc1b7MdcE1AVYO0a2zNDEySo2nRyoNe2KkarJ5JsKaEK40Bs
 HurfPgb1oJTAFBUBef2PRLRwPVFEOmATU21GHD79gqI+0dOeEc8sm7k8QX2Cw+yCm5gQ7zZAIOr
 k0oOsHQbijgWtSj3avqOav9TJbOHPBbQc=
X-Google-Smtp-Source: AGHT+IHB34QQqDlmEWSULWlkvhSNkqtePImbxaBbIAD1Quq/9BnRqWHi2Xd84ZFnczeko4HHUeU2JA==
X-Received: by 2002:a17:907:2689:b0:b3e:bb87:772c with SMTP id
 a640c23a62f3a-b50aab9c912mr2070025566b.17.1760297050626; 
 Sun, 12 Oct 2025 12:24:10 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:24:10 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
Date: Sun, 12 Oct 2025 21:23:26 +0200
Message-ID: <20251012192330.6903-27-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On DE2 and DE3, UI scalers are located right after VI scalers. So in
order to calculate proper UI scaler base address, number of VI scalers
must be known. In practice, it is same as number of VI channels, but it
doesn't need to be.

Let's make a quirk for this number. Code for configuring channels and
associated functions won't have access to vi_num quirk anymore after
rework for independent planes.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 78bbfbe62833..f9131396f22f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -708,6 +708,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -718,6 +719,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -729,6 +731,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -740,6 +743,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -751,6 +755,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -761,6 +766,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.ui_num = 1,
 	.scaler_mask = 0x3,
 	.scanline_yuv = 2048,
+	.vi_scaler_num	= 2,
 	.ccsc = CCSC_MIXER0_LAYOUT,
 	.mod_rate = 150000000,
 };
@@ -772,6 +778,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -783,6 +790,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
@@ -794,6 +802,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -805,6 +814,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -814,6 +824,7 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index def07afd37e1..40b800022237 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -178,6 +178,7 @@ enum sun8i_mixer_type {
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
  *	Most DE2 cores has FCC. If number of VI planes is one, enable this.
+ * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
  * @map: channel map for DE variants processing YUV separately (DE33)
  */
 struct sun8i_mixer_cfg {
@@ -189,6 +190,7 @@ struct sun8i_mixer_cfg {
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
 	unsigned int	de2_fcc_alpha : 1;
+	unsigned int	vi_scaler_num;
 	unsigned int	map[6];
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index c0947ccf675b..0ba1482688d7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -91,16 +91,16 @@ static const u32 lan2coefftab16[240] = {
 
 static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	int vi_num = mixer->cfg->vi_num;
+	int offset = mixer->cfg->vi_scaler_num;
 
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
-		       DE3_VI_SCALER_UNIT_SIZE * vi_num +
-		       DE3_UI_SCALER_UNIT_SIZE * (channel - vi_num);
+		       DE3_VI_SCALER_UNIT_SIZE * offset +
+		       DE3_UI_SCALER_UNIT_SIZE * (channel - offset);
 	else
 		return DE2_VI_SCALER_UNIT_BASE +
-		       DE2_VI_SCALER_UNIT_SIZE * vi_num +
-		       DE2_UI_SCALER_UNIT_SIZE * (channel - vi_num);
+		       DE2_VI_SCALER_UNIT_SIZE * offset +
+		       DE2_UI_SCALER_UNIT_SIZE * (channel - offset);
 }
 
 static int sun8i_ui_scaler_coef_index(unsigned int step)
-- 
2.51.0

