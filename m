Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECDD391AAA
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE57F6EDB0;
	Wed, 26 May 2021 14:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060E06EDAA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 14:47:44 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id s22so2851631ejv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYJiXj0ddj83L8aXFRzvFTEUKUN+B1Z6lPzHOBdtjm8=;
 b=Gx64LBbNwLBBdNiZ+bV5ywxpe6PBhcnCmmLq6MfAhsshgRyRWJE5MRYUBD5wRb0JpZ
 UC7BcdcJ+RPyjVBYsxNTC5eMH0TT1w28arbEApo3LjX7M+QGZsx+bDbm5oM7dqZHUsqG
 mFWL+ok9mjGR7pU6V9Tz4M1U+OhydAVesTOWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GYJiXj0ddj83L8aXFRzvFTEUKUN+B1Z6lPzHOBdtjm8=;
 b=mhU+Y3J450WjfYNJB+JLXTgb2SUVvvmsucIxZhccYEVCb/zWI+/8tlGqpTJxWWYxIu
 TQbv2TuyBgSvW751XtHU0j/tq89EWPW6Hjcytv9DvS7DoJ2a762zRZBJ7nRnN4CjElyJ
 fK+0BIs7/OeyfF/0GrJnfSinlAEaWnnKZn4JeOfA4jQbC8gxe9fkVVCURQR//NBtflOQ
 Bd/fjEXU+T9RcCgmrqtj1graJN9BcBSNzIMGU1XVx7m2V4H8mWWnGhlk+8u8oulPJ52I
 3pQmSOrVk5V+t31mMeCVuJ5RCIGZ6/rgh4bMiedeyQGFCYsrlYhFlKqNQzrUbLAM7+5G
 iD+g==
X-Gm-Message-State: AOAM532/xcuWtp4aUS0jECR+QOEeWHr6Lz0/FeP37F6kjf3e4LuHuIiD
 gTCzzFCMYryHNCtm6J7dYNtq2w==
X-Google-Smtp-Source: ABdhPJwhr9w2Wi5BavMfFaZH9Z7O4mPTaJqpkodpz6jWKldNLB91UPiGnLBjED8qH1gNlBDtBj432w==
X-Received: by 2002:a17:906:c212:: with SMTP id
 d18mr14780658ejz.291.1622040463738; 
 Wed, 26 May 2021 07:47:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id fb19sm10466212ejc.10.2021.05.26.07.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 07:47:43 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/shmem-helper: Align to page size in dumb_create
Date: Wed, 26 May 2021 16:47:36 +0200
Message-Id: <20210526144736.3277595-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210526144736.3277595-1-daniel.vetter@ffwll.ch>
References: <20210526144736.3277595-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

shmem helpers seem a bit sloppy here by automatically rounding up when
actually creating the buffer, which results in under-reporting of what
we actually have. Caught by igt/vgem_basic tests.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 6d625cee7a6a..d5e6d4568f99 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -505,13 +505,13 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 
 	if (!args->pitch || !args->size) {
 		args->pitch = min_pitch;
-		args->size = args->pitch * args->height;
+		args->size = PAGE_ALIGN(args->pitch * args->height);
 	} else {
 		/* ensure sane minimum values */
 		if (args->pitch < min_pitch)
 			args->pitch = min_pitch;
 		if (args->size < args->pitch * args->height)
-			args->size = args->pitch * args->height;
+			args->size = PAGE_ALIGN(args->pitch * args->height);
 	}
 
 	shmem = drm_gem_shmem_create_with_handle(file, dev, args->size, &args->handle);
-- 
2.31.0

