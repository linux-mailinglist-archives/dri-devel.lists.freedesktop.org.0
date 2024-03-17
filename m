Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A38D87DF29
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DD510F130;
	Sun, 17 Mar 2024 18:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a79a1W1u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C336010F129;
 Sun, 17 Mar 2024 18:02:32 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-513dc99b709so2285814e87.1; 
 Sun, 17 Mar 2024 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710698551; x=1711303351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ktCU793rW4+FdgMbTSKL4r8VonEldbvjY4KALBd7fS0=;
 b=a79a1W1uGebWwS8U5OhQchRfs2JMh2xHnTy3dIXjESz691ZbQVDwIxDaW3VskGSwQb
 fkm8FieWkifbUc8GuYWTnzTTKQ3LzmlyI8lmKgcbO2ZFJNCnAI8WRTN/s+riSI2342rI
 t/bCvz3QgEDG2pM4bP3lY99qnMnGdLssS7oTIRoWBDIZ7cRKSWDs2AIA9/IKi2HQKAL+
 urx9g4DmAnCeOBwsOluL6Pww/NlE3WA0yYPi5HYwBiYYLGdDNBpUYk18JIJAGXIZ1/Rn
 uj2eI14mYjY3GRMAu1f83JFV6kQ3Ndx9bUixOk/aSR3kH0WyDx9ofOk86OcN60wu+qyk
 0TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710698551; x=1711303351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktCU793rW4+FdgMbTSKL4r8VonEldbvjY4KALBd7fS0=;
 b=KlB1j+NxI2Gl0o9gm6MrOUgzDsmN2+DyxV7ADx1jK+PfC85906iYexFZoZ0kN4IeP5
 sPZDVitJhYMgmDGCcmo8nXk1uOZaNzcbkt5mXHLZkupi5bas7gqjgUOjzSa2Qg7FIwuC
 70+SFnVqWpNly3/f9Ey+KX7A3TbrOUszkLSrz4FZ/kMp+75lvK1DHogz+skaD/NhhWMz
 FmBLOAHSott3TrEYwM1+kv8PV7dcD814vRxBogX74bGBNttp/u+KiHXfU2rErof/xga6
 +l2b8CXGiNBrVKmZuzeSWaHyjUEmDgwzvNucIvNUlAFJJecAWrNAqJisMTGT/L6Kpriy
 9nLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+2zSZMEJCkcTPNw1n88dagQEzWRWkCWjnwFSfG+QSj7xPa/4Qpwo3sikuhV10tJhobGdBZHzOlgYLDbWD0SKQF192KdixNzmXIqn/8w==
X-Gm-Message-State: AOJu0YwkJftz7MxTwSS9BhCEULiAUF3sTiawmxGv8CYTYfo31UPlq8Cz
 ZwWIQdx774DMGs9V3F0ubVeSXiONL0qHWVNqfL/ecU41mU7XKHaSb6bS1X2ur/0=
X-Google-Smtp-Source: AGHT+IFBExA7h18h1aPZaVAKqYjQICtcFTM7YdQzyhgcb5Jd3NPKIuB4lnHdoqETUpS1dpj7Shm1IQ==
X-Received: by 2002:a19:5e12:0:b0:513:de14:b66b with SMTP id
 s18-20020a195e12000000b00513de14b66bmr3638021lfb.24.1710698550670; 
 Sun, 17 Mar 2024 11:02:30 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 a10-20020a056512020a00b00513e5a52bc7sm293055lfo.35.2024.03.17.11.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:02:30 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rluq5-000000005e0-3HVC; Sun, 17 Mar 2024 19:02:29 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/11] drm/radeon: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:34 +0100
Message-ID: <1b6a44beb345068fef171b1e1745b703dd779ab6.1710698387.git.frej.drejhammar@gmail.com>
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
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/radeon/radeon_fbdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 02bf25759059..7f4617183982 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -221,8 +221,10 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	if ((sizes->surface_bpp == 24) && ASIC_IS_AVIVO(rdev))
 		sizes->surface_bpp = 32;
 
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
+	mode_cmd.pixel_format =
+		drm_driver_legacy_fb_format(fb_helper->dev,
+					    sizes->surface_bpp,
+					    sizes->surface_depth);
 
 	ret = radeon_fbdev_create_pinned_object(fb_helper, &mode_cmd, &gobj);
 	if (ret) {
-- 
2.44.0

