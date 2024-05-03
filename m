Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE7D8BB5F8
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B1C113294;
	Fri,  3 May 2024 21:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PaO6uvjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48A0113294
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:08 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1ecff927a45so1151135ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772227; x=1715377027;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9+/1qUyCdCzkVssOOJ1mxYlZquUA9CwegGnK+VEhW+o=;
 b=PaO6uvjwCzkhILFSG0v2eEcqTxD2x5P8e1WQoOFZ2TeD/gl0pPT0fC/UpC/2ZFF2mc
 Uz8kowblHMFDRU6Y+epSgqGQuonVjaWyiAtlDyuDicwFBazWe/XNL+Aqq7qCxhfMFAzf
 EAlcEucaTXODAOE2BGhR0E5IBORqzWSZJ1BuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772227; x=1715377027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9+/1qUyCdCzkVssOOJ1mxYlZquUA9CwegGnK+VEhW+o=;
 b=LP9kdCjvUsQrqyooTO3z/0GM/rIuKW85w6/DpM1NOp0Z37SN3kUnBa42tZ+okVjBpS
 4hjOBYSYEopJp0m1WtjE/9zVZhRIO3W3cI5J02+bIQNfq5tctBjxyeCQ0QUomn9lHOcB
 ppKVYWcialEx9vQTnZpPiUoqR9uivFBWYzE5ydji6YfeTM1I4A/Z2kx0RI4hTJjeeAOK
 nVkyjmZ/0SU51i7Pl26vLYhlIbIga1wqz7oi2GheNy1bAJWfMbW5tpUQQXuVSZ1DHkqt
 QwZ7HjU3dMymTi7PUIYwnIQmWq/KAQ64j6/zHNdvoUWdVKLvIA6S1AnFvCcXn1z3/ap+
 cFUw==
X-Gm-Message-State: AOJu0YwcAzgzVwlllCuUWXz7L5hmKW8GPX+VnGJeV/0TYCuYqpje5XL+
 vHC+YlK4ZWPQQBYHiLsDUywCFZREFT9whpoxSLiAnoxbY4DC6A/h6GWxNAltjV9+44x/VxZqxcv
 71g==
X-Google-Smtp-Source: AGHT+IGTWXuB+YR8b+Za+D7wJjlj72NgkCjkNj7UREApXr3TOavCp/wlhNUfEqh97guBF+8UAksjJg==
X-Received: by 2002:a17:903:2344:b0:1ec:2bca:5aa8 with SMTP id
 c4-20020a170903234400b001ec2bca5aa8mr5189630plh.6.1714772227116; 
 Fri, 03 May 2024 14:37:07 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:06 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benni Steini <bennisteinir@gmail.com>, Joel Selvaraj <jo@jsfamily.in>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 18/48] drm/panel: novatek-nt36672a: Stop tracking
 prepared
Date: Fri,  3 May 2024 14:32:59 -0700
Message-ID: <20240503143327.RFT.v2.18.I13a06b9e6f5920659b1e5d12543b3cd9066383b8@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benni Steini <bennisteinir@gmail.com>
Cc: Joel Selvaraj <jo@jsfamily.in>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 3886372415c2..35aace79613a 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -72,8 +72,6 @@ struct nt36672a_panel {
 	struct regulator_bulk_data supplies[ARRAY_SIZE(nt36672a_regulator_names)];
 
 	struct gpio_desc *reset_gpio;
-
-	bool prepared;
 };
 
 static inline struct nt36672a_panel *to_nt36672a_panel(struct drm_panel *panel)
@@ -119,9 +117,6 @@ static int nt36672a_panel_unprepare(struct drm_panel *panel)
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
 	int ret;
 
-	if (!pinfo->prepared)
-		return 0;
-
 	/* send off cmds */
 	ret = nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
 				 pinfo->desc->num_off_cmds);
@@ -147,8 +142,6 @@ static int nt36672a_panel_unprepare(struct drm_panel *panel)
 	if (ret < 0)
 		dev_err(panel->dev, "power_off failed ret = %d\n", ret);
 
-	pinfo->prepared = false;
-
 	return ret;
 }
 
@@ -179,9 +172,6 @@ static int nt36672a_panel_prepare(struct drm_panel *panel)
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
 	int err;
 
-	if (pinfo->prepared)
-		return 0;
-
 	err = nt36672a_panel_power_on(pinfo);
 	if (err < 0)
 		goto poweroff;
@@ -221,8 +211,6 @@ static int nt36672a_panel_prepare(struct drm_panel *panel)
 
 	msleep(120);
 
-	pinfo->prepared = true;
-
 	return 0;
 
 poweroff:
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

