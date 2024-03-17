Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421F387DDDF
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 16:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D285210F0F7;
	Sun, 17 Mar 2024 15:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a2dRGiud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E9510E613
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 03:39:35 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-29dedcd244dso1798757a91.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 20:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710646773; x=1711251573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XOijO3kp7/7Q2+hjIpHdWpk05IBBzZe9ngcvgY3sOsc=;
 b=a2dRGiudYjc/rd0ptyzb7+2JW/qjutX/jnM6TH+8jRuNuyHXBCvJ7RGMAr2XDni8hK
 IAjWuLRRKzzgq9zf98sYSUyec4Cr80uo0tXZOOA5dNqGbuJrmxdHPPSVVgfGzK9csWyE
 aBxoFs7xNKFRVW/4jflmWfkwL+pRQxPGOjbGxQZ9ThW8kSj2YBYS5Zg4URLN7FPO3qVL
 TsQPjcuVgzyMobdYY+Ptq+s3DMUu5wT5YVztYRWkQHrPXBgf7in+N/zQsJyueAJ+M6x5
 jdqMRS+hh7By04AZTDg4VCZ2jlorGeDMJTN5q7rY1h9oEQsEZ0eNBn5p65mAfC8Ws3QU
 N/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710646773; x=1711251573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XOijO3kp7/7Q2+hjIpHdWpk05IBBzZe9ngcvgY3sOsc=;
 b=wm8xIkWf8fIjMK/9rG4hpoSyZl7HEO6BCbDzPDKHzYYrnMty2WES2139igS+48uJih
 pwxpVJ3WTDs4GDCshaqsiH6sXI7KEOkeqboKxnMs+lIrKiMloLM+NlT4lvGuuw8yKzoB
 wdW9sGYhAeXw70RhTUdVkMwQJZv0kgoIcRCfQ0daTqWFTMYyKJORv6nf6KUoQKKE7VZa
 rWPaCIAf93z0nO04MukGhCMcwYH6KaAYArui/gXJpYMKWzFEjCDDv4WIQ8fZ+ux+VnZP
 kDE4KeLPY4n+K2datZ+zvQUUJUBEkkPWBAyau1XNhv8iHL9XvHrwzbwAmCrPRgrxMZU1
 hPoQ==
X-Gm-Message-State: AOJu0YxdtUHEJSNGbHihQ0lhTW5IULrOnGNzpx0psYmtG8T1/Kpyd6FX
 MCVEeNkeiUvHYtJi28v9MDWKId8H+KG8AhB+p+VQZl7/p492ZGFngmNoivTxZpI=
X-Google-Smtp-Source: AGHT+IGCx338OV8LiGJ7bIyHHFDaUNofgyZhHTck10Mi/2fS4Jqi0O3rvSUYIU0NaouGUrErOVoBoQ==
X-Received: by 2002:a17:902:e94d:b0:1e0:384:ecb9 with SMTP id
 b13-20020a170902e94d00b001e00384ecb9mr2608432pll.8.1710646773371; 
 Sat, 16 Mar 2024 20:39:33 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com.
 [147.11.105.121]) by smtp.gmail.com with ESMTPSA id
 h5-20020a170902680500b001d8f111804asm6635759plk.113.2024.03.16.20.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Mar 2024 20:39:32 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] drm/tilcdc: Set preferred depth
Date: Sun, 17 Mar 2024 11:39:18 +0800
Message-ID: <20240317033918.535716-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 17 Mar 2024 15:20:16 +0000
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

The commit c91acda3a380 ("drm/gem: Check for valid formats") adds a
check for valid pixel formats on drm_gem_fb_create(), but this breaks
the X server on the beaglebone black board.

We have set 'DefaultDepth' to 16 in our xorg.conf. In the X modesetting
driver, the drmmode_get_default_bpp() is used to guess the default
depth/bpp. First it tries to get them via DRM_CAP_DUMB_PREFERRED_DEPTH
ioctl, and if it fail, then try to create a FB with 'depth = 24' and
'bpp = 32' to check whether this depth/dpp is a valid combo. Before the
kernel commit c91acda3a380, the FB always can be created successfully.
This will avoid the bpp to be set to 24 forcibly. But after kernel
commit c91acda3a380, the FB will not be created successfully due to the
check of the valid pixel format. Then the bpp is set to 24, but the
'depth = 16' and 'bpp = 24' combo is not a valid pixel format.

Fix this issue by explicitly setting the preferred_depth in this driver.
With this change, the modesetting driver would choose the correct
depth/bpp combo based on our setting in xorg.conf.

Fixes: c91acda3a380 ("drm/gem: Check for valid formats")
Cc: stable@vger.kernel.org
Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index cd5eefa06060..d4bd4ebeff78 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -258,6 +258,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 
 	pm_runtime_put_sync(dev);
 
+	ddev->mode_config.preferred_depth = 16;
 	if (priv->rev == 1) {
 		DBG("Revision 1 LCDC supports only RGB565 format");
 		priv->pixelformats = tilcdc_rev1_formats;
@@ -273,6 +274,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 			priv->num_pixelformats =
 				ARRAY_SIZE(tilcdc_crossed_formats);
 			bpp = 32; /* Choose bpp with RGB support for fbdef */
+			ddev->mode_config.preferred_depth = 24;
 		} else if (0 == strcmp(str, "straight")) {
 			DBG("Configured for straight blue and red wires");
 			priv->pixelformats = tilcdc_straight_formats;
-- 
2.44.0

