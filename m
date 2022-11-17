Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6050962E48C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 19:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57DD10E671;
	Thu, 17 Nov 2022 18:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD0610E66A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 18:40:52 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bj12so7216016ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUtZmWalnQKWM5ERQ4dIqTHxh9HaSKYh4Nk5lsYsOGo=;
 b=E90mIeGWkAHZT8kjF/dtZAkCNw1ExinoGrCn05GM8RvygqrPUsmI5MEkEHBqezbhGM
 TAw/4Tz0ucODj2MstSnfQfAsOYGcLWojIFb0rNvH5FTjqYFx5Y8nyJGgPWkDxmNP88fP
 xRZ2nofJ27QVOuaPgx2Z2WJuyHd3G1F9zeWGJB+AOyrC3RuV1d0wHgOKe46rbqP+dsGT
 DCTGF1z23v3J6bX2nbl8JL6r9pRANpgQSQngl4CPPNvdX7/sH26H1Vq/BhWNqzbL6I/s
 PMkVidGPc7LAkl7at8N9CktkJ/8IBbGK8d33ySrvC96vTBYWDqe/OYaeO5LZrzHh4GYd
 IpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pUtZmWalnQKWM5ERQ4dIqTHxh9HaSKYh4Nk5lsYsOGo=;
 b=CofN0vUETqnXL28UeGniR1LzWT9u1R94tAKF3ACdadtl7W0gBlpVNCw4AqnNGDMF0Y
 nl5udzRz4rDTKv4YO4vf5MNl1Y3YRwBtZA2KH8DokK1/PKAa7ThSnGgzNJU5JBZLiz+E
 1Xgd/fh6yY5U7Jl3dsYAzc5U2ciZ40BXfQUbp5K7KoA3FJCmx3OoPF1a2/jN42J5S6gF
 Fha9LfbGbuYLXZGb6F9iJ33r8CYTmPrlRPVGcI2ZBPQKEfgQMudFJFnlwpDlHEYin4+q
 epIFZJXVendNCgLgjfCo13Na7Bf7sbBtDM5KgTIBWnPSqc6M1SqQMG+mVa2jApwZXfJP
 soVQ==
X-Gm-Message-State: ANoB5plduqRzLKU3dv3X9hn2CHO0vvuOqVdsDoHit+I/7Fa0g8vdjgdY
 MSxcLx8bl7FgxGbRvqFlKEQ=
X-Google-Smtp-Source: AA0mqf5xwnlYcLA9SvYwuazA2YElRV37/cwpxPvOcWKJv7jhRNjkIHWvKvvQSEXIBAIBFpyaAn1mOQ==
X-Received: by 2002:a17:906:a2d8:b0:7ad:fa6c:5e69 with SMTP id
 by24-20020a170906a2d800b007adfa6c5e69mr3179354ejb.199.1668710451323; 
 Thu, 17 Nov 2022 10:40:51 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 15-20020a170906310f00b0078cf8a743d6sm684681ejx.100.2022.11.17.10.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 10:40:50 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 4/8] drm/simpledrm: Use struct iosys_map consistently
Date: Thu, 17 Nov 2022 19:40:35 +0100
Message-Id: <20221117184039.2291937-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The majority of the driver already uses struct iosys_map to encapsulate
accesses to I/O remapped vs. system memory. Accesses via the screen base
pointer still use __iomem annotations, which can lead to inconsistencies
and conflicts with subsequent patches.

Convert the screen base to a struct iosys_map as well for consistency
and to avoid these issues.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- properly reinitialize struct iosys_map to avoid bogus increments

 drivers/gpu/drm/tiny/simpledrm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 162eb44dcba8..3673a42e4bf4 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -208,7 +208,7 @@ struct simpledrm_device {
 	unsigned int pitch;
 
 	/* memory management */
-	void __iomem *screen_base;
+	struct iosys_map screen_base;
 
 	/* modesetting */
 	uint32_t formats[8];
@@ -492,15 +492,15 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);
 		struct drm_rect dst_clip = plane_state->dst;
+		struct iosys_map screen = sdev->screen_base;
 
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
-		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
-		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data, fb,
-			    &damage);
+		iosys_map_incr(&screen, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
+		drm_fb_blit(&screen, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
+			    fb, &damage);
 	}
 
 	drm_dev_exit(idx);
@@ -519,7 +519,7 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 		return;
 
 	/* Clear screen to black if disabled */
-	memset_io(sdev->screen_base, 0, sdev->pitch * sdev->mode.vdisplay);
+	iosys_map_memset(&sdev->screen_base, 0, 0, sdev->pitch * sdev->mode.vdisplay);
 
 	drm_dev_exit(idx);
 }
@@ -722,7 +722,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
 	if (!screen_base)
 		return ERR_PTR(-ENOMEM);
-	sdev->screen_base = screen_base;
+
+	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
 
 	/*
 	 * Modesetting
-- 
2.38.1

