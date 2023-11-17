Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6840A7EF7F8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 20:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A983D10E76D;
	Fri, 17 Nov 2023 19:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A45D10E76B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 19:44:14 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3b40d5ea323so1480526b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 11:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700250253; x=1700855053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57wKZQ9CpcI/KABBdYnBmlor/KExRJr0eHFWG2qkyVs=;
 b=lOZdHnS27wyrhZVfh5cBfush07uLJy98d7unBX68rMYH62zRTbED3U4+0AoyFfPBSe
 GFN46B9zA5vkcL75NX5s3uGJD9OXaj5miDjalwOYd7TftwK2i+uVJ0hJ/iG1vwIR6YhU
 RGwy0LiLfPlXYFoW/f59zSexVKWug9WhBbS4iAaa2xLRM8ndl1XJH7GUWPGqF/ZALyK5
 ROXaSQcVj7K5zDGeiekF17KzLOZpr2JPlKyQ+qH3DBTM+UTNTSIkfbGadeLYNGQII4cR
 GvARo1PLWVMWDSU+dDcf5M9M8teWuHcsNgmuxuGNolN4cOneZNFBg9TsogPDzDngfww1
 lqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700250253; x=1700855053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=57wKZQ9CpcI/KABBdYnBmlor/KExRJr0eHFWG2qkyVs=;
 b=iPUD81i4OO84/FFl/OzpGW0ixww12ZGBU1cYbab4RynsRobYOnAsZXCrOtiFprbfBD
 e9NWhwGT/dIcLRXr3VdSTN6nk2z4MzMUqy/Pun28WZkqNkiJBFKgBislTiQo8dH7sS8l
 VpmrCgsJK+a/inOJ4xm/S4Ywc/2JH2jhPRHKudrN/NBZzMD+/FhxxHvvOneqMJUusadd
 Bw38JDiR6gSmXVxg1Fo+e/PSc7XqdtPstIZwbTskwCnA2jUW1IxoMngQuGfBKiHXbinq
 Ga8LEREUeCR2F+hY2jR4aX9qmK0Bfu7eKdAZAy3pdzNqUa5S3gU6Pc6kqD22DqMyJGEe
 idSQ==
X-Gm-Message-State: AOJu0Yz6/BoUl//pYLltAOreibmSRuUsgFsugJCRDUobOvRLwyPE5dt2
 he6Sc5YPKe4cw5GW6oj3d5iprWI9uDM=
X-Google-Smtp-Source: AGHT+IHQ0EYg9FWbkoppMB+I2rCvddHn874Ao+DFHShBVAc7+4nIW+v07lHrGo0/JjnaTZ66sxMIIA==
X-Received: by 2002:a05:6808:6543:b0:3b5:66af:f8e3 with SMTP id
 fn3-20020a056808654300b003b566aff8e3mr379628oib.37.1700250253237; 
 Fri, 17 Nov 2023 11:44:13 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056830108500b006cd099bb052sm338193oto.1.2023.11.17.11.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 11:44:13 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 5/5] drm/panel-elida-kd35t133: Drop prepare/unprepare logic
Date: Fri, 17 Nov 2023 13:44:05 -0600
Message-Id: <20231117194405.1386265-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117194405.1386265-1-macroalpha82@gmail.com>
References: <20231117194405.1386265-1-macroalpha82@gmail.com>
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Drop the prepare/unprepare logic, as this is now tracked elsewhere
since this commit [1].

[1] commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled in drm_panel")

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index fea3d9e84905..00791ea81e90 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -43,7 +43,6 @@ struct kd35t133 {
 	struct regulator *vdd;
 	struct regulator *iovcc;
 	enum drm_panel_orientation orientation;
-	bool prepared;
 };
 
 static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
@@ -91,9 +90,6 @@ static int kd35t133_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (!ctx->prepared)
-		return 0;
-
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0)
 		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
@@ -109,8 +105,6 @@ static int kd35t133_unprepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vdd);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -120,9 +114,6 @@ static int kd35t133_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	ret = regulator_enable(ctx->vdd);
 	if (ret < 0) {
@@ -166,8 +157,6 @@ static int kd35t133_prepare(struct drm_panel *panel)
 
 	msleep(50);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_iovcc:
-- 
2.34.1

