Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D540F394B90
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 12:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8786E429;
	Sat, 29 May 2021 10:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D4E6F629
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 20:31:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i9so7021207lfe.13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vuoM3pI1kbUC5NFBrjLCZhuScVL8DqZ8CBiPpQoVDh0=;
 b=YaxDu+1PlL4rDOFbzA9sK4Pfrvy1JMkgAtk3bsAgr+ODyNM/u9UIK/3Ddcs4lvMK5e
 lL9fFlx90VghFJ16RPRzM6yaUj/oZs8L4MPv5mWkLCdtPgUksXWgRsNxZXpXqzpu0tf4
 Wc5SBK8v4vSDKK61M6HX0y+kI836ITvBpWw/qSYiVV04M1jJ051F4F4ukdwCGtNmJDUi
 6jhggtHqvnDS4FPSZPvsdheUGDH6hW9XkRLQg7jUFb1K96c1i6Gz7Yk5g5Dub+DEjg51
 o06QTgU9h/KBaWsbOtvIv3hqEzPHeVtJ+aNUUQhF5HegWquVYjfebEczd0HDKYWGztPD
 jzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vuoM3pI1kbUC5NFBrjLCZhuScVL8DqZ8CBiPpQoVDh0=;
 b=GbjhsmW+RREHhbTN/FQfkJIiS4CuuwC7HBr9dm3i85CkOXE7cxUQro1k0qV0XWY/kw
 wvnCSaYxp/dAwgXJe62iHksGknsskKruSrUz6MRrd9Jcnpq67+KyYM8FeLQ+7ssLrpbm
 YQeU5hwWqvE2NEAAYn4M70v7FmTMNvSMbQfg5BYb3cwCUrNybAmwtLa4nHZq56JEblyb
 IAKGZs5/WmsDgWua1SMiEu0AnezOLXhz7H8XJinuOk6+8RSvmshz/H760l0w/3Bnt5Tx
 1fKgMstBoq2CUuyxWI0J0Vfg/VyRfthJ7CIUjHfh/a+O2LG3FrT97qsS2ksR2AyjUg5Z
 Y6Kg==
X-Gm-Message-State: AOAM533ahrf3sBwpzFJDhk2NfdV7hDxQco8S4HvbfRcMGRckrZYjzu/D
 udcv+YfmEBQEusktbSSN7VE=
X-Google-Smtp-Source: ABdhPJyNO4+/xp6BFlx0xfuncqzgNoZ2hriV1Z4J3oSHun1F/RLW8ffaXQVu2FhKGT7E6WASEyCDrg==
X-Received: by 2002:a05:6512:2393:: with SMTP id
 c19mr6479223lfv.652.1622233861285; 
 Fri, 28 May 2021 13:31:01 -0700 (PDT)
Received: from roman-S500CA.. (72-28-179-94.pool.ukrtel.net. [94.179.28.72])
 by smtp.gmail.com with ESMTPSA id a12sm655820ljk.34.2021.05.28.13.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 13:31:00 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] drm/sun4i: Add mode_set callback to the engine
Date: Fri, 28 May 2021 23:30:35 +0300
Message-Id: <20210528203036.17999-2-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210528203036.17999-1-r.stratiienko@gmail.com>
References: <20210528203036.17999-1-r.stratiienko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 May 2021 10:14:11 +0000
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
Cc: megous@megous.com, jernej.skrabec@siol.net, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 Roman Stratiienko <r.stratiienko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create callback to allow updating engine's registers on mode change.

Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun4i_crtc.c   |  3 +++
 drivers/gpu/drm/sun4i/sunxi_engine.h | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
index 45d9eb552d86..8f01a6b2bbef 100644
--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
@@ -146,6 +146,9 @@ static void sun4i_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(crtc);
 
 	sun4i_tcon_mode_set(scrtc->tcon, encoder, mode);
+
+	if (scrtc->engine->ops->mode_set)
+		scrtc->engine->ops->mode_set(scrtc->engine, mode);
 }
 
 static const struct drm_crtc_helper_funcs sun4i_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index 548710a936d5..7faa844646ff 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -9,6 +9,7 @@
 struct drm_plane;
 struct drm_device;
 struct drm_crtc_state;
+struct drm_display_mode;
 
 struct sunxi_engine;
 
@@ -108,6 +109,17 @@ struct sunxi_engine_ops {
 	 * This function is optional.
 	 */
 	void (*vblank_quirk)(struct sunxi_engine *engine);
+
+	/**
+	 * @mode_set:
+	 *
+	 * This callback is used to update engine registers that
+	 * responsible for display frame size and other mode attributes.
+	 *
+	 * This function is optional.
+	 */
+	void (*mode_set)(struct sunxi_engine *engine,
+			 struct drm_display_mode *mode);
 };
 
 /**
-- 
2.30.2

