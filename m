Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA8A675B87
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF59C10E38A;
	Fri, 20 Jan 2023 17:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EB210E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:31:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id n7so5483900wrx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZNLi/l9wxy+mypxiXIZ6SYlQ5ADDjWtmD5zsC5Iu7U=;
 b=ekmCbRnQ3AKTSQE0uIHwanjK5e6WP9TSnmmjfarZxQgBhR/oiLwMIm/Zsd4JZ810NX
 /12FvuVLMlj3cBThnm4vG/SGhZDBu1ZwSGoeOc1QYfGVHmv2vLI1rKmYu3w2Qa6bcatW
 bihB3PpG/qNnfJ1XcPQw+mWakCZdhXFdABhR2Vx8o5xJCCvQjDdPoy3qbclJna8o6m+/
 vooPj/OdMhGZupkhaDS6ttD+war33jtqb+hJCukHGDvgVn3Df5FeDPXpeC2ch0SZoNuH
 Hh7ONe2kRy1EHHoJ8YqG8/qzCZ/IGBFMKzm+aUF0ILgAdTAcd5nyMcGo3JF+6wBpWOFB
 CDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZNLi/l9wxy+mypxiXIZ6SYlQ5ADDjWtmD5zsC5Iu7U=;
 b=pwhmz+geR2fWk2qJsMHkS9DzrbgLCp+RIL56JD9s1jaPMezd+9aGWUooVL/r7Nn9PX
 MkcwFk3msuwjxGlyZNaJdVL/2zcsEUuFnOwEqGEYKnJdoRQAITTcT7Bsk+e8LfCKSrah
 BmzC1ILO4huui/dpqEVuixaqXaP8ab1eBtCcv2jWt+uTL8oaGygn792Xwl3mAuVVmsdb
 kKzLxdCaFNFEMLlwuZaHKRVLQZY7FBd8U3kxZmyyOs02/3I2qBgD31kA3cvDcy+UiWTN
 BndUSD03po5d6OuiD+gV+vHAu0ntkc+NSiLwAeSeKORjPsebXfWlHz3k/EnvwJOHjF/B
 iedA==
X-Gm-Message-State: AFqh2kobOYqldB3zkvOflrjac5OisYc+GcJAr18j0NKXQN/kGKNXV/Jl
 BE9wKlqlC9+wv4VtAd6nOuI=
X-Google-Smtp-Source: AMrXdXt7beT4QiPFE5mJktjpvop0RXCXl2JkSoxV5JPJmVDP+OojVEZhXyRjj+HLM0Q78WAZAizSiw==
X-Received: by 2002:adf:a31e:0:b0:2be:5cff:5d00 with SMTP id
 c30-20020adfa31e000000b002be5cff5d00mr2463881wrb.70.1674235871083; 
 Fri, 20 Jan 2023 09:31:11 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b002bbb2d43f65sm33297181wrx.14.2023.01.20.09.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:31:10 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 4/8] drm/simpledrm: Use struct iosys_map consistently
Date: Fri, 20 Jan 2023 18:30:59 +0100
Message-Id: <20230120173103.4002342-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- rename screen variable to dst for consistency with other drivers
- add Reviewed-by from Thomas

 drivers/gpu/drm/tiny/simpledrm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f658b99c796a..c1ed6dd426ec 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -208,7 +208,7 @@ struct simpledrm_device {
 	unsigned int pitch;
 
 	/* memory management */
-	void __iomem *screen_base;
+	struct iosys_map screen_base;
 
 	/* modesetting */
 	uint32_t formats[8];
@@ -473,15 +473,15 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);
 		struct drm_rect dst_clip = plane_state->dst;
+		struct iosys_map dst = sdev->screen_base;
 
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
-		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data, fb,
-			    &damage);
+		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
+			    fb, &damage);
 	}
 
 	drm_dev_exit(idx);
@@ -500,7 +500,7 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 		return;
 
 	/* Clear screen to black if disabled */
-	memset_io(sdev->screen_base, 0, sdev->pitch * sdev->mode.vdisplay);
+	iosys_map_memset(&sdev->screen_base, 0, 0, sdev->pitch * sdev->mode.vdisplay);
 
 	drm_dev_exit(idx);
 }
@@ -703,7 +703,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
 	if (!screen_base)
 		return ERR_PTR(-ENOMEM);
-	sdev->screen_base = screen_base;
+
+	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
 
 	/*
 	 * Modesetting
-- 
2.39.0

