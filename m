Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E95087DF1F
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149C710E226;
	Sun, 17 Mar 2024 18:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gzIOa6py";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2F210E625
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 18:02:27 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-512e39226efso3083403e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 11:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710698546; x=1711303346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4yyR/dfbQLBIn87lSW001SCtvWgxlV15UUQ/8/Cvzgg=;
 b=gzIOa6pyKDOQpsb1nlLexpuH6wn60fC51KukMh7hg65I8B1VWN5SR0VBvdzpAgVJ86
 RvqLPObKtpoGGq4Qob3Oc7AYTVqJXYbi2A2F1WyDClheRo8uUtI/xlMBAzfsOOJYlC82
 2wuw1TzPacjg/hXZvHyEnMbvBZIL5yyDKlD3UUF7v3NTWL7iKXfalfCb5A8q8/27JbHr
 M/fQiDfLf1vBUJXjtu33uDRNnGN/J/5gVnA6Yc6DLkbVMe0AzEbYhZc7jWBaZ1zdV4SK
 Y7EL2MH3Xex+L6/INRGdQeQ3CDmEz5THpvsAq0ei+eQ+Xrii6soMUFxbwGw6qIMNkfC7
 w+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710698546; x=1711303346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4yyR/dfbQLBIn87lSW001SCtvWgxlV15UUQ/8/Cvzgg=;
 b=Ufv9zB3eNV/rfn+0xM7OEnY33O5vliIwzYH2gHOi/++W7eIKgysXG2uYvy01tpgecM
 9KHfS5JHcTKDzGcr5yeoAQLIBY3u7T+T7ED0PevXVw4PhiDiiCYvU2jXYrTF2PXuSdf4
 5CbKjXazvQ55JaU03kVShIRqjgOoGmrijRzX7NLQ8FEVqLbYG/po9k9fVtvpf1Xzu+Th
 cvO6kCPYqFBp29JrZED4TQG/1mmx4BNX4WDihS8oplSf6aFg+cEcEy2jeRy/IzDynSs3
 b3CXSpzDyV027t4QhmSRUVHHsNWtUOGn5sApAwhNV+QY/iLh5M0Lzmo6a1yBSbX0F4T7
 61Dw==
X-Gm-Message-State: AOJu0YwFTylScQ6uxfQWIrQ65uYgA1ncjKVDnq9iMVImjTnkr/VfBly3
 d8wwI8Psb+TnCXRV3uroPxcrLWYhzGkOh4ghxgmOr55RD0LpC9Q3uOrRCuLvrbg=
X-Google-Smtp-Source: AGHT+IFnYuj5taDkfpCTq9SkBlw2yZtDsimNqEUBWW9mK+AMv80prb/F1SShEGHcvNUoqhOvjuaUAA==
X-Received: by 2002:ac2:4ecb:0:b0:513:c790:792a with SMTP id
 p11-20020ac24ecb000000b00513c790792amr5951849lfr.38.1710698545644; 
 Sun, 17 Mar 2024 11:02:25 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 s30-20020a19771e000000b00513e4086815sm396566lfc.162.2024.03.17.11.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:02:25 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rluq0-000000005e0-1o1j; Sun, 17 Mar 2024 19:02:24 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 05/11] drm/gma500: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:30 +0100
Message-ID: <24bdbb0e7cb5b39d60c066ee99b6e46ff5e5ea63.1710698387.git.frej.drejhammar@gmail.com>
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
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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
 drivers/gpu/drm/gma500/fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 98b44974d42d..4a5eaf407432 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -189,7 +189,7 @@ static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	mode_cmd.width = sizes->surface_width;
 	mode_cmd.height = sizes->surface_height;
 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width * DIV_ROUND_UP(bpp, 8), 64);
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(bpp, depth);
+	mode_cmd.pixel_format = drm_driver_legacy_fb_format(dev, bpp, depth);
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	size = ALIGN(size, PAGE_SIZE);
-- 
2.44.0

