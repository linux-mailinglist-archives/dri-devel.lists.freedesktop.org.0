Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A03B0AE7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB2F6E83D;
	Tue, 22 Jun 2021 16:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107B86E7F1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d11so22107437wrm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b9Jdr4wtlOOCFldrnFk+zQMEf14dJEiyFw/3fjGC0jA=;
 b=Df+8Oxx3Gx1nETy5Ci5Z78MEEXbbmKXn04S8kpH8fxaA3WGc7MUpF4hyIdZ4rL7Yr9
 GFJXVc+kuPYqmtVY6trwYU2hBdMa6rqz2bUh1rvC8BM+79JDQGK97f2T+vvSqzWlrTxc
 dUnCGNGzWkUB/ubYFJep4xlk9o9DrWfUpEfGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b9Jdr4wtlOOCFldrnFk+zQMEf14dJEiyFw/3fjGC0jA=;
 b=EqOXUsJVvAvsco3gGsZB2le8IxfblPlWtitCwCH2bcfYQYIJQdiCyt+QJ15TU43/v7
 j7QTLJeMB8Czq8Z3jm3MEPZF8fSTqI2//udtNHNOCc6C094LohKEQzYolqJVUHLiBJAu
 0umLOKU2bGJrDS6AUSghR1kRNiZM7nKOoV3qr4JRINxNuhBV6C+Xkq9KHpm7Jl7eVRtO
 8PwdFGgK13JYqwTp0/iYTJ4SHu5o+zdMOFdW0/wEU0U60jVlkPYGxNVEB0L9TzXvg8tt
 F1jn+4BMxDc/sM94XFQnl52UaJoGCVwfBID9+Zsy26IoNLU9FIcia1G3QfaueLA4B11n
 8Z+A==
X-Gm-Message-State: AOAM531N+GOYzB9kSX2OvB2tcWvUjgGZNE7SUmtlC5jQQyDhFQNs/iUs
 SAM6ZwFnjBKrT8tOxiI/4J8BbZS/K+FhYA==
X-Google-Smtp-Source: ABdhPJxRaQeu5zw+01KaYFtztrrwy3gdY+LcwVsX0y3odT09LLdZWhYYMbIKwOWFsIhlqUJAbbR8qw==
X-Received: by 2002:a05:6000:188:: with SMTP id
 p8mr6123747wrx.296.1624380931724; 
 Tue, 22 Jun 2021 09:55:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/15] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is the
 default
Date: Tue, 22 Jun 2021 18:55:09 +0200
Message-Id: <20210622165511.3169559-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Lechner <david@lechnology.com>, Emma Anholt <emma@anholt.net>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Jeffery <andrew@aj.id.au>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-aspeed@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Goes through all the drivers and deletes the default hook since it's
the default now.

Acked-by: David Lechner <david@lechnology.com>
Acked-by: Noralf Trønnes <noralf@tronnes.org>
Acked-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Emma Anholt <emma@anholt.net>
Cc: David Lechner <david@lechnology.com>
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: xen-devel@lists.xenproject.org
---
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 1 -
 drivers/gpu/drm/gud/gud_drv.c            | 1 -
 drivers/gpu/drm/mcde/mcde_display.c      | 1 -
 drivers/gpu/drm/pl111/pl111_display.c    | 1 -
 drivers/gpu/drm/tiny/hx8357d.c           | 1 -
 drivers/gpu/drm/tiny/ili9225.c           | 1 -
 drivers/gpu/drm/tiny/ili9341.c           | 1 -
 drivers/gpu/drm/tiny/ili9486.c           | 1 -
 drivers/gpu/drm/tiny/mi0283qt.c          | 1 -
 drivers/gpu/drm/tiny/repaper.c           | 1 -
 drivers/gpu/drm/tiny/st7586.c            | 1 -
 drivers/gpu/drm/tiny/st7735r.c           | 1 -
 drivers/gpu/drm/tve200/tve200_display.c  | 1 -
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 1 -
 14 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 098f96d4d50d..827e62c1daba 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -220,7 +220,6 @@ static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
 	.enable		= aspeed_gfx_pipe_enable,
 	.disable	= aspeed_gfx_pipe_disable,
 	.update		= aspeed_gfx_pipe_update,
-	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
 	.enable_vblank	= aspeed_gfx_enable_vblank,
 	.disable_vblank	= aspeed_gfx_disable_vblank,
 };
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index e8b672dc9832..1925df9c0fb7 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -364,7 +364,6 @@ static void gud_debugfs_init(struct drm_minor *minor)
 static const struct drm_simple_display_pipe_funcs gud_pipe_funcs = {
 	.check      = gud_pipe_check,
 	.update	    = gud_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_mode_config_funcs gud_mode_config_funcs = {
diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 4ddc55d58f38..ce12a36e2db4 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -1479,7 +1479,6 @@ static struct drm_simple_display_pipe_funcs mcde_display_funcs = {
 	.update = mcde_display_update,
 	.enable_vblank = mcde_display_enable_vblank,
 	.disable_vblank = mcde_display_disable_vblank,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 int mcde_display_init(struct drm_device *drm)
diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 6fd7f13f1aca..b5a8859739a2 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -440,7 +440,6 @@ static struct drm_simple_display_pipe_funcs pl111_display_funcs = {
 	.enable = pl111_display_enable,
 	.disable = pl111_display_disable,
 	.update = pl111_display_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index da5df93450de..9b33c05732aa 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -184,7 +184,6 @@ static const struct drm_simple_display_pipe_funcs hx8357d_pipe_funcs = {
 	.enable = yx240qv29_enable,
 	.disable = mipi_dbi_pipe_disable,
 	.update = mipi_dbi_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode yx350hv15_mode = {
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 69265d8a3beb..976d3209f164 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -328,7 +328,6 @@ static const struct drm_simple_display_pipe_funcs ili9225_pipe_funcs = {
 	.enable		= ili9225_pipe_enable,
 	.disable	= ili9225_pipe_disable,
 	.update		= ili9225_pipe_update,
-	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode ili9225_mode = {
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index ad9ce7b4f76f..37e0c33399c8 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -140,7 +140,6 @@ static const struct drm_simple_display_pipe_funcs ili9341_pipe_funcs = {
 	.enable = yx240qv29_enable,
 	.disable = mipi_dbi_pipe_disable,
 	.update = mipi_dbi_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode yx240qv29_mode = {
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 75aa1476c66c..e9a63f4b2993 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -153,7 +153,6 @@ static const struct drm_simple_display_pipe_funcs waveshare_pipe_funcs = {
 	.enable = waveshare_enable,
 	.disable = mipi_dbi_pipe_disable,
 	.update = mipi_dbi_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode waveshare_mode = {
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index 82fd1ad3413f..023de49e7a8e 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -144,7 +144,6 @@ static const struct drm_simple_display_pipe_funcs mi0283qt_pipe_funcs = {
 	.enable = mi0283qt_enable,
 	.disable = mipi_dbi_pipe_disable,
 	.update = mipi_dbi_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode mi0283qt_mode = {
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 2cee07a2e00b..007d9d59f01c 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -861,7 +861,6 @@ static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
 	.enable = repaper_pipe_enable,
 	.disable = repaper_pipe_disable,
 	.update = repaper_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static int repaper_connector_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 05db980cc047..1be55bed609a 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -268,7 +268,6 @@ static const struct drm_simple_display_pipe_funcs st7586_pipe_funcs = {
 	.enable		= st7586_pipe_enable,
 	.disable	= st7586_pipe_disable,
 	.update		= st7586_pipe_update,
-	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode st7586_mode = {
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index ec9dc817a2cc..122320db5d38 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -136,7 +136,6 @@ static const struct drm_simple_display_pipe_funcs st7735r_pipe_funcs = {
 	.enable		= st7735r_pipe_enable,
 	.disable	= mipi_dbi_pipe_disable,
 	.update		= mipi_dbi_pipe_update,
-	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct st7735r_cfg jd_t18003_t01_cfg = {
diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 50e1fb71869f..17b8c8dd169d 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -316,7 +316,6 @@ static const struct drm_simple_display_pipe_funcs tve200_display_funcs = {
 	.enable = tve200_display_enable,
 	.disable = tve200_display_disable,
 	.update = tve200_display_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 	.enable_vblank = tve200_display_enable_vblank,
 	.disable_vblank = tve200_display_disable_vblank,
 };
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 371202ebe900..cfda74490765 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -302,7 +302,6 @@ static const struct drm_simple_display_pipe_funcs display_funcs = {
 	.mode_valid = display_mode_valid,
 	.enable = display_enable,
 	.disable = display_disable,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 	.check = display_check,
 	.update = display_update,
 };
-- 
2.32.0.rc2

