Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67387DF2C
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955A810E37B;
	Sun, 17 Mar 2024 18:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QBcXc507";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275A110E05C
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 18:13:16 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-513e134f73aso864225e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 11:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710699194; x=1711303994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLIvWfQxZs3QTY3A1QUq5O384ZLcnnVHBqmih9QBi4c=;
 b=QBcXc507nUjnxHutinBzHAFSPTYiML1bw9VUuNxAAS959jIUrMt98Iy4PDPwD6GRrr
 pQ6S41JZaPIAhBOEHIHRIeiZEon9Ri2QY2dSPBPdQxbkgZaB8Z2egxG5jX6BxotxSz7T
 3nJzfZJtKimy8J8xrot+pRDE8cGPsMYyQQNUGq4uHVCoOGPU3gqbWDksOjNfT9NYxkKr
 6MBtIovDasixNIv0dU3Y+w8JdTnSfm36xME8bgXVRoNxJUn8khnD/Bi7TXkF/B09Rdi6
 JZ4i/sBGfuSvz30FS0D+I095ICk5HzsY2n6vkftdbS9Ev6gywm8Ks5/mn3Drew3t/2oS
 4+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710699194; x=1711303994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLIvWfQxZs3QTY3A1QUq5O384ZLcnnVHBqmih9QBi4c=;
 b=vQ2QbafoNn5VjEFSm9xwXUVdLfT6UdOxKPCCUlMiXEV+n4/2gxoJIUSGjtjmo2E6zC
 87cHUEZTC2jHUso2gx4/qgYWxvbyUFY9KvB0JUFVQY/OdKx/f6fJKvlUWm3tmjJyTl4r
 DBPMPTblaw4c35vElceHknNWPsvt77M0/FxF9UZQilKlJDJABvzSp8HXAikZhVcFvSJn
 RQwaQkDWBUdO8PnGBw+sW+s4p8hY82x3JKh0wJ07l9n7cqE0ERp27gBFQpp6cSDCephp
 0u/ZG56/O6pX4MSvR9nz4BeBDzDbLnTSkNippDnqzGQCPaZITM+T9G3kmLsHZktx9Hq4
 TVsQ==
X-Gm-Message-State: AOJu0YwmMZepHnyIT23BD9FDq5UCURumITeVk4EdPcXrvMRI+l3ehxnB
 LHe4glcpoXCDykwL//Y0aFGZ1hAJfrOzAvnO5jugoDNW4MpWr4mdACwLXZ330hA=
X-Google-Smtp-Source: AGHT+IEbGQkw1XDjMbeU/1kBANGQY/J9bKqomI2iZbYnfeHipSKJP+571GQ+9wHVnWaPWyR4ah59XQ==
X-Received: by 2002:a19:8c47:0:b0:513:ca96:dbdf with SMTP id
 i7-20020a198c47000000b00513ca96dbdfmr6486551lfj.12.1710699194183; 
 Sun, 17 Mar 2024 11:13:14 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 g12-20020a19e04c000000b005131cefefd8sm1351431lfj.240.2024.03.17.11.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:13:13 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rluq6-000000005e0-375u; Sun, 17 Mar 2024 19:02:30 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-tegra@vger.kernel.org
Subject: [PATCH 10/11] drm/tegra: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:35 +0100
Message-ID: <a40857fd77807f00b5c62c0fbe3f951e8bcb1099.1710698387.git.frej.drejhammar@gmail.com>
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
Cc: linux-tegra@vger.kernel.org

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/tegra/fbdev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index db6eaac3d30e..700ab02235f5 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -87,8 +87,9 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 	cmd.pitches[0] = round_up(sizes->surface_width * bytes_per_pixel,
 				  tegra->pitch_align);
 
-	cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-						     sizes->surface_depth);
+	cmd.pixel_format = drm_driver_legacy_fb_format(drm,
+						       sizes->surface_bpp,
+						       sizes->surface_depth);
 
 	size = cmd.pitches[0] * cmd.height;
 
-- 
2.44.0

