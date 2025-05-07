Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E0AAECCF
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A3110E89A;
	Wed,  7 May 2025 20:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XL02wCEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0310E892
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:31 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-731e277a6b0so188872a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649350; x=1747254150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ECm4vsoW+32S8jcl8nf2NLWmke5G4xraIMQjtb0TqM=;
 b=XL02wCEmfnsfaWoItkfioD7TVQEp4vrzEw3HcpHnYaC1W6EYiEGAEP0jXE4dG+emff
 ebJ/auW9r/9y7h3+sHpB9rwNGXte2Z38V1155oKCVvwOUnEcio3eRTaM2rugWQNN0DdC
 PPmMuP5Hr4vmDo+X3la/lBBVSuorwNxKgIs9liPJxIPzoVxjj937wYtZQbCWxhLz+adx
 MTPVrth9SePpRb8zW5HKs2f8jCzUcbzGwm+8oo0A6xGW1IZVdBCRyFr/jmnfaXVjnnqH
 4NsI7PNm1hNdzHfeUlR9B8QO6N6BcEcPTG4z27oHm0F2HYDEd0Cc8YoKxwNNA9XKEo9v
 xMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649350; x=1747254150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ECm4vsoW+32S8jcl8nf2NLWmke5G4xraIMQjtb0TqM=;
 b=JXWkJtIfDT/+cR+7ChrT/OPbjvZO+uaCEvmB+eqmALLtbPfZVt0G0BRy3W7yxQqvHv
 PTfKsEeZa69DDQuyqu9JbKVn0u8xwqyM1Z3fDUcJ2Pw0YCqe/Gm1AwlNPCLOgUF4Nc++
 YVc1eZ7hAH4u1ooOoJQRRBsKtLAbi1epYRlKakD3mW+YDMfUiQMI4mhK4kEwZddmdT8q
 Ih/uAJEYr0/h8hItoi0hw7smEhmTx5gevJ7BYxpmNhmC0N53x5hWecJqj1PfzMvBXNqS
 AbiX8zsoe99k/gKsYagJtIR8pKrpszeiOxODPyMjbaNJh+J6f8SbNZ1AexutP01d2hkk
 SNgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeQ2z/FicDxRN6kBlRQ2fuVCZGqKJ5VbmayVI5CL/LP4I41nbNJ5prWJ7/Zs4WpwSFUt2bkjEZ/gM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7gl4fII61vmVrOcw1F/dHU57Gpltht/p/9KbkG8NonZJpsFSG
 C4ynPDdYuwbxPF+KcHNkry+aeL+vEZVz49eGLJnRZ63ArA+SWjIP
X-Gm-Gg: ASbGncsijVYjOQxjkihhbZmyKJEXnqe9iFyVJ8QRtGYNW6eJDZcz+kU8JyDXr/jWKaI
 eKTmE27spRvygVZ2FfBXBvzEozINyprn4YOJFDVd96pnnlG0dxOudyvfmzummgAB3/fzqrz/Tfp
 CrgG0loTUfCBKxT5YQPfA1KAvwvbvZqPoSp00ryvRYGbI4N96/S/LqLXqk2Qul450tjNlZvaOkG
 B23ezt9bLIz/SRxmqiRVQl81bnQkxl77woL7G1kqzfELoY3uR+cBMgcuaEcCEdFZVpGU3pemuYv
 VGFM6n7GEoAA1XTMBmqH1wrJ9Ndprs7mvZaSjSPmvDIky6PHuETQxhskXxx39Q3EVzZOTas=
X-Google-Smtp-Source: AGHT+IFNYiTe2ivxn2BpZru44Mz+Cbpuh5GShVyQbiTzaZin9SYSI0N+J6lKKB11hGqcKOTRI24Jlw==
X-Received: by 2002:a05:6830:3c8c:b0:72b:9bac:c044 with SMTP id
 46e09a7af769-7321b9dc5dcmr559263a34.0.1746649350502; 
 Wed, 07 May 2025 13:22:30 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:30 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org,
 Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH V9 04/24] drm: sun4i: de2/de3: refactor mixer initialisation
Date: Wed,  7 May 2025 15:19:23 -0500
Message-ID: <20250507201943.330111-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Now that the DE variant can be selected by enum, take the oppportunity
to factor out some common initialisation code to a separate function.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
Changelog v1..v2:
- Combine base register allocation and initialisation in
  sun8i_mixer_init
- Whitespace fix

Changelog v4..v5:
- Remove trailing whitespace

Changelog v7..v8:
- Remove CSC configuration changes (logically better placed with future
  YUV support) making this the first patch in the series.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 64 +++++++++++++++--------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 2252bef19597..41815b42d6d2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -425,6 +425,38 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 	return of_ep.id;
 }
 
+static void sun8i_mixer_init(struct sun8i_mixer *mixer)
+{
+	unsigned int base = sun8i_blender_base(mixer);
+	int plane_cnt, i;
+
+	/* Enable the mixer */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
+		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
+
+	/* Set background color to black */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	/*
+	 * Set fill color of bottom plane to black. Generally not needed
+	 * except when VI plane is at bottom (zpos = 0) and enabled.
+	 */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
+	for (i = 0; i < plane_cnt; i++)
+		regmap_write(mixer->engine.regs,
+			     SUN8I_MIXER_BLEND_MODE(base, i),
+			     SUN8I_MIXER_BLEND_MODE_DEF);
+
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+}
+
 static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			      void *data)
 {
@@ -433,8 +465,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun8i_mixer *mixer;
 	void __iomem *regs;
-	unsigned int base;
-	int plane_cnt;
 	int i, ret;
 
 	/*
@@ -534,8 +564,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
-	base = sun8i_blender_base(mixer);
-
 	/* Reset registers and disable unused sub-engines */
 	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
@@ -551,7 +579,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_FMT_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC0_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC1_EN, 0);
-	} else {
+	} else if (mixer->cfg->de_type == sun8i_mixer_de2) {
 		for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -564,31 +592,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_DCSC_EN, 0);
 	}
 
-	/* Enable the mixer */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
-		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
-
-	/* Set background color to black */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	/*
-	 * Set fill color of bottom plane to black. Generally not needed
-	 * except when VI plane is at bottom (zpos = 0) and enabled.
-	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
-	for (i = 0; i < plane_cnt; i++)
-		regmap_write(mixer->engine.regs,
-			     SUN8I_MIXER_BLEND_MODE(base, i),
-			     SUN8I_MIXER_BLEND_MODE_DEF);
-
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+	sun8i_mixer_init(mixer);
 
 	return 0;
 
-- 
2.43.0

