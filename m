Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8787DF22
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F0710EEA7;
	Sun, 17 Mar 2024 18:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hWZOk5NK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245A410E625
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 18:02:31 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d48ba4d5ecso18938761fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 11:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710698549; x=1711303349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EjnlE7Pfa8bae7nZJi7TuyVEuQ78PCt16CUR/JLkN7U=;
 b=hWZOk5NKg3oKTKOXo7eNTqdYpBUCxzfxayKeWoLrKJEE6yY/T806C4XfOw6UYbBOk1
 ufvNO/D23rDTy/xYFhVdU8znynBD2+/WEP34fYCoxM/yYB+gEJmx3skCm0e2gawQDoWi
 HddCjjxqhHZdcemjP0oIxr7Iw597BTHENZXbK//oCsoxkptdLGwoF0xqTl4Rt7NVfais
 hp+PiBWaySLbGQ+ve1izX9n/jvKV9db7SsPB5toWEtE/30oJA/0aDEK7ba94ZY2hKatq
 eskP2RCF/hPlr/ISn3ooY8uDVtDdhjdRXVarHy1HviyinIyyOtOiB9FnYT9VLDvi+SHm
 fu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710698549; x=1711303349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EjnlE7Pfa8bae7nZJi7TuyVEuQ78PCt16CUR/JLkN7U=;
 b=hl1Vjt+aJWtNiQ4eAD+umVGGxcpTF8oJTLXNpSZ3wbfYWBPsLCuXb+Iv42sBCM99ea
 8RhyQJ6Y+ohFj3Br3abolkOuV8JRT99uPSeR+X2yWGa0yu3P3Hd0TWbP8IHQOF62QOoo
 /sxTOYs4iSCfyaHooim4uxOckAEx9pVwu5rpmOKxjy38NCddJ8bWVvDnDySQRIuhNwZm
 W2/k/fpD72oekbzj0k6BB3pU0ojQEW0fPrB2nfeYwKJdPKVd3WJjiV9ZmA4wJib9lUhk
 0oT6W7KARY9SAI0fumk3Iubkt0gpSaGYWcHrSwoRVqHuYGLk9VBAJYDnjU7xYh1T6uqL
 pZMw==
X-Gm-Message-State: AOJu0Yx0UhYSgQq1+EgRGjhv8pVmdQufz4K9c/DHeK6ERTCV99QxPAaW
 GNPQhBwPhB3cZ8ZUdO2MOIH3W7SCk23RhOzxWmENXjpMmLPbr/gtyM4HwVW2IU8=
X-Google-Smtp-Source: AGHT+IFXq+pOwb+4h3vuswCk4AhmMOmvagYV64sUOyVcR7YqtbPm1uZxpugBnm9YH3yP7B7SC5WlDA==
X-Received: by 2002:a2e:b0e9:0:b0:2d4:8c97:f69d with SMTP id
 h9-20020a2eb0e9000000b002d48c97f69dmr2450623ljl.12.1710698549007; 
 Sun, 17 Mar 2024 11:02:29 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 o15-20020a2e90cf000000b002d49e852bc0sm454074ljg.118.2024.03.17.11.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:02:28 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rluq3-000000005e0-3DVx; Sun, 17 Mar 2024 19:02:27 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 08/11] drm/omapdrm: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:33 +0100
Message-ID: <4f0018a47ff2cd4c6692653479e2303222afc127.1710698387.git.frej.drejhammar@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710698386.git.frej.drejhammar@gmail.com>
References: <cover.1710698386.git.frej.drejhammar@gmail.com>
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

Switch to using drm_driver_legacy_fb_format() instead of
drm_mode_legacy_fb_format() to use the same logic as for the
DRM_IOCTL_MODE_ADDFB ioctl when selecting a framebuffer format.

Signed-off-by: Frej Drejhammar <frej.drejhammar@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 6b08b137af1a..08ecced62459 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -139,8 +139,10 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 			sizes->surface_height, sizes->surface_bpp,
 			sizes->fb_width, sizes->fb_height);
 
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-			sizes->surface_depth);
+	mode_cmd.pixel_format =
+		drm_driver_legacy_fb_format(dev,
+					    sizes->surface_bpp,
+					    sizes->surface_depth);
 
 	mode_cmd.width = sizes->surface_width;
 	mode_cmd.height = sizes->surface_height;
-- 
2.44.0

