Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D852FEEBB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 16:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDF16E90D;
	Thu, 21 Jan 2021 15:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490AF6E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:30:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id c128so1891196wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3vESarHI2cKH5DdDJt+VD4nKwTRU0ztXyE5fn4BJO0=;
 b=TdA1X4kdSFj+KlwAxrlO0nqgFva56vIo2yB31g6Fs5qdLQMWvzU/UqUiQJH6bg1Mkf
 hrN/kjtFH3efQxaJiiVrYIEzdJfzfl4iNdJ9s9dqr7ilI2BmqO2e0UUUt8rl+1s9Mtdr
 hOb2p6zmZaqlPhmROzL6IfA9TT+a7ZZ9sxVfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3vESarHI2cKH5DdDJt+VD4nKwTRU0ztXyE5fn4BJO0=;
 b=E3MJsQJvedJ2eb2axFj3sBHWL6uAODfVJcjAy7XCzwztEGkVHA1tGzErG65B0+FRT2
 cK0RHeaF0G4Npglfe5PDRmB8RCcfGIKPhAmu8uOVuQI3gNcCmEu4I06FqUE2so762Lx/
 SnePbzrYaNmiz3MeqcCA0BMGoWzIwuMbiv0E1WHXUXL72fvSC8xKUCQ8zKPIt748AYgx
 UdU7UiVGC/f1hos4dGYpYnXRwJ+IBzh7aXyUa0zavohCmchsfoBKV9WmHKRaTNMK+Wuk
 18lBhUe/h9UWJGG4jpJ19Ib9V5sYQ/SUC8vkxGxqa2Dho4es4nxChq+R8jwIaPLwi/ez
 eiXg==
X-Gm-Message-State: AOAM530CEqFYaSbZZRCOR2M7irwWbO/KNWdIKVV1+FqqzPxVIMVhVm0Y
 XApBcYgpkBZ+Rbp9wWJYw3g1lu9znSiYI9Y4
X-Google-Smtp-Source: ABdhPJyJquDqTOUuUgHKoFATtsR6HaC3hRsoF7BPUsJTrw72y+DTUKJy1y+mtjGc1surp+MCTpA9WA==
X-Received: by 2002:a1c:dc41:: with SMTP id t62mr9535529wmg.106.1611243014044; 
 Thu, 21 Jan 2021 07:30:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:30:13 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/11] drm/omapdrm: Annotate dma-fence critical section in
 commit path
Date: Thu, 21 Jan 2021 16:29:56 +0100
Message-Id: <20210121152959.1725404-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nothing special, just put the end right after hw_done(). Note that in
one path there's a wait for the flip/update to complete. But as far as
I understand from comments and code that's only relevant for modesets,
and skipped if there wasn't a modeset done on a given crtc.

For a bit more clarity pull the hw_done() call out of the if/else,
that way it's a bit clearer flow. But happy to shuffle this around as
is seen fit.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 28bbad1353ee..8632139e0f01 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -68,6 +68,7 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
 	struct omap_drm_private *priv = dev->dev_private;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	dispc_runtime_get(priv->dispc);
 
@@ -90,8 +91,6 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
 		omap_atomic_wait_for_completion(dev, old_state);
 
 		drm_atomic_helper_commit_planes(dev, old_state, 0);
-
-		drm_atomic_helper_commit_hw_done(old_state);
 	} else {
 		/*
 		 * OMAP3 DSS seems to have issues with the work-around above,
@@ -101,10 +100,12 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
 		drm_atomic_helper_commit_planes(dev, old_state, 0);
 
 		drm_atomic_helper_commit_modeset_enables(dev, old_state);
-
-		drm_atomic_helper_commit_hw_done(old_state);
 	}
 
+	drm_atomic_helper_commit_hw_done(old_state);
+
+	dma_fence_end_signalling(fence_cookie);
+
 	/*
 	 * Wait for completion of the page flips to ensure that old buffers
 	 * can't be touched by the hardware anymore before cleaning up planes.
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
