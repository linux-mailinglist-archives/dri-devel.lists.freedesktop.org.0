Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FEC87DF1E
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D982510F036;
	Sun, 17 Mar 2024 18:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DALAM6hk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DB210F00D
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 18:02:21 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-513cf9bacf1so4568242e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710698539; x=1711303339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezi2HuRiomJRtYvRwXzpGA8rya2T0vjTa5wf3YQ6Xp8=;
 b=DALAM6hkKzq0ULUUakBQxoSDC5ry50GGQ4CP0Zi9L3MciLMhEj9dVjHFMXB7cXuGe/
 ILoIyAcRhEDHbPMgCex8+f8ZFtj5ag7GUXuXivxgWdX7zb/67bEuaEy3zT5S3f05Vjw8
 WfLVSZ0lCuNcXOPFinCqGJYjdYBaIMM3xurxJeOFsAfaNhzD51EP6Rhrf5mPIiokVlpN
 vxctb2gDFDOsoC+/IPManYnNtWr/+ctescQbiEahwaMBSogIWmm2AyEsuYncQ0n1H76I
 I9fDIJ0g3udoX5qkzaTtwsD0fwKU0zwCMx/RplpShEN6Vn7N/icG0Ev9aj+Q1FAB3sBC
 VRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710698539; x=1711303339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ezi2HuRiomJRtYvRwXzpGA8rya2T0vjTa5wf3YQ6Xp8=;
 b=jhOr7Pls7AMw8sCJ5UQ+2WYX1K0g0KZHW+QuDl5OHfzEU9Z/eQOb8sE3m6Sb6x5mIf
 MX05SioHMqwMviukVk3A4kpNlqGoZydpGWQEr4LxTeIj7Fv+FldYdPZxlMFk3+dZL/mV
 NvDIRFnfjW84OvLw8AWiATwq0dh92KbaBHbkDfJMbiwntVUbjX33Kdbe+gD+E87xKFMi
 ky1jsk28kBnY3lRkuM3iACeKWNOo31tRRsHwWtNv85SLvW9/oJDaeBU5xk6EYnDBOWra
 0WpWcpB9KCATEaFHz8oCSMK/iuA46qPjqeq3yweES3Jwv/B6ye8MMpX32nAC5gdUsmjL
 p9LQ==
X-Gm-Message-State: AOJu0YzmyBb0qED2ECeW35LtjygIkR2Q8Xk3OT1PiIxp3I/qdsGvuZPO
 arGuw00mVHVXBXpSRDG6jF7Qb8xMcp89BlkIMY/vk9E7xYgyPUnn/mzVzJRiUBE=
X-Google-Smtp-Source: AGHT+IEks3Py1UYR/fPmmd+8VNI8lwKQ7fB/YQVpIpegoH8KzhVFzAwbt8Ga0cHH3JBIaucJmkAWsA==
X-Received: by 2002:ac2:4985:0:b0:513:9f14:8f73 with SMTP id
 f5-20020ac24985000000b005139f148f73mr6114093lfl.36.1710698538958; 
 Sun, 17 Mar 2024 11:02:18 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 j2-20020ac253a2000000b00513d82a8003sm958308lfh.160.2024.03.17.11.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:02:18 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rlupu-000000005e0-0OVO; Sun, 17 Mar 2024 19:02:18 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 02/11] drm/fbdev_generic: Use drm_driver_legacy_fb_format()
 for fbdev
Date: Sun, 17 Mar 2024 19:01:27 +0100
Message-ID: <41ec14423c2066255430fa45321156216281a9d2.1710698387.git.frej.drejhammar@gmail.com>
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
 drivers/gpu/drm/drm_fb_helper.c     | 2 +-
 drivers/gpu/drm/drm_fbdev_dma.c     | 4 +++-
 drivers/gpu/drm/drm_fbdev_generic.c | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d612133e2cf7..61c22e6c72af 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1453,7 +1453,7 @@ static uint32_t drm_fb_helper_find_format(struct drm_fb_helper *fb_helper, const
 	 * the framebuffer emulation can only deal with such
 	 * formats, specifically RGB/BGA formats.
 	 */
-	format = drm_mode_legacy_fb_format(bpp, depth);
+	format = drm_driver_legacy_fb_format(dev, bpp, depth);
 	if (!format)
 		goto err;
 
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 6c9427bb4053..f6c89b62b177 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -90,7 +90,9 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 		    sizes->surface_width, sizes->surface_height,
 		    sizes->surface_bpp);
 
-	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	format = drm_driver_legacy_fb_format(dev,
+					     sizes->surface_bpp,
+					     sizes->surface_depth);
 	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
 					       sizes->surface_height, format);
 	if (IS_ERR(buffer))
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index d647d89764cb..0a567f37d127 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -84,7 +84,9 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
 		    sizes->surface_width, sizes->surface_height,
 		    sizes->surface_bpp);
 
-	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	format = drm_driver_legacy_fb_format(dev,
+					     sizes->surface_bpp,
+					     sizes->surface_depth);
 	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
 					       sizes->surface_height, format);
 	if (IS_ERR(buffer))
-- 
2.44.0

