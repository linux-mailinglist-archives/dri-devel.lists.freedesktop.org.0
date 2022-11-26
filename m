Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 162336397F3
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF1510E173;
	Sat, 26 Nov 2022 19:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F2E10E168
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 19:03:02 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id f9so6476995pgf.7
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 11:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ORhYy+5RsRhtN/r0n/8d8XGwBuq0gn/E8Gc2XsetIZQ=;
 b=Z1FZXck/wingZVI+QM6vHDgxZx6YdzUkUiqs5tNsn8Q2aPzpW5Vb9AiD6RRrGeD/Z0
 KN44CxBiWmXu/Z7BZuzmuj5w+CobeOuXr3NmkX4H5PbLqjP5cQaUgwRQTKKy2cDFMxpC
 l9Gw57t4YRW4HiR9VuY+7YgcVLQMx2TOq7Z28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ORhYy+5RsRhtN/r0n/8d8XGwBuq0gn/E8Gc2XsetIZQ=;
 b=oP+2AIHVkDGfnziZALaeLKGTIdV+HJC46eWlbpr1Ytwt1OwOzTg+U/pHyP3/ifoDaM
 U5frZr/yOaN7ROrhsDR8VWtflvs8VQHQHi+O7F4AJjVdqbP8vrp70XfSvd7XEYpsGlV0
 p1teNw5sKIYI46J6znyJ0dvFxEOdALl5DLv+N7K4v9vwPCBKumg3S4lCI6pQJq2eJY3u
 MR7ieKw+5L3+8OMcIgkCd5ic6rI4tGxMomJPSxJioVQdPWGxuj7iPAAA/OteB4T98UeA
 v/uDenrQYOKuP3sIL+XKwgVukO36bw2bYVa1vFTmii9LO0ISw0LP6Wlf8iWF063Rg0tS
 wOxQ==
X-Gm-Message-State: ANoB5pl/WqT8vS61bPnS9TrwsVzz67zIFlrZw3uaPhjQykEL0afP8QyQ
 4VJqnYH1cc7k5RT7stsa5SDhXg==
X-Google-Smtp-Source: AA0mqf7fkWPorcp2eOnPH8suTjgmKJnv8X+ibGgbh2psbAPRCJQRVnPhxGIqzXQAg7eloxRjl1KzBA==
X-Received: by 2002:a63:fc0a:0:b0:434:7885:6ade with SMTP id
 j10-20020a63fc0a000000b0043478856ademr25814393pgi.243.1669489381967; 
 Sat, 26 Nov 2022 11:03:01 -0800 (PST)
Received: from doug-ryzen-5700G.. ([192.183.212.197])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a17090a738e00b00218f5de49f4sm5678606pjg.1.2022.11.26.11.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 11:03:01 -0800 (PST)
From: Doug Brown <doug@schmorgal.com>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/armada: Fill in GEM object for each color plane
Date: Sat, 26 Nov 2022 11:00:01 -0800
Message-Id: <20221126190001.157800-1-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Doug Brown <doug@schmorgal.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver uses a single GEM object even when there are multiple
planes. Starting with commit 746b9c62cc86 ("drm/gem: Ignore color planes
that are unused by framebuffer format"), multiple plane support was
broken on armada because the object pointers for the additional planes
were empty and drm_gem_plane_helper_prepare_fb was returning -EINVAL.

Restore functionality by pointing to the same GEM object on all planes.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/gpu/drm/armada/armada_fb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index b87c71703c85..341ad4d422de 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -21,9 +21,10 @@ static const struct drm_framebuffer_funcs armada_fb_funcs = {
 struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
 	const struct drm_mode_fb_cmd2 *mode, struct armada_gem_object *obj)
 {
+	const struct drm_format_info *info = drm_get_format_info(dev, mode);
 	struct armada_framebuffer *dfb;
 	uint8_t format, config;
-	int ret;
+	int ret, i;
 
 	switch (mode->pixel_format) {
 #define FMT(drm, fmt, mod)		\
@@ -63,7 +64,8 @@ struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
 
 	dfb->fmt = format;
 	dfb->mod = config;
-	dfb->fb.obj[0] = &obj->obj;
+	for (i = 0; i < info->num_planes; i++)
+		dfb->fb.obj[i] = &obj->obj;
 
 	drm_helper_mode_fill_fb_struct(dev, &dfb->fb, mode);
 
@@ -79,7 +81,8 @@ struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
 	 * the above call, but the caller will drop their reference
 	 * to it.  Hence we need to take our own reference.
 	 */
-	drm_gem_object_get(&obj->obj);
+	for (i = 0; i < info->num_planes; i++)
+		drm_gem_object_get(&obj->obj);
 
 	return dfb;
 }
-- 
2.34.1

