Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD652178F7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2C66E53C;
	Tue,  7 Jul 2020 20:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964286E454
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 20:12:56 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z13so46596313wrw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 13:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pt65zP3tlEuv8TvdEB6rXZKaCDTrRKjurzMHDo80+l4=;
 b=ECzcjwmTm3AborwU40haIL5DfGUbNaGnjl4KrnQruJIqmKFPCtJbIcfPTulkN3oSNO
 LeoytZCXEcdrNk/HBVLRNvsvpRSnu2zo4n5M8SWqzSYXPQ57n9jIZATJmEY1VIUw2fNP
 3raRyIXFs8+1WpAOpUHm9CDrANOWWyeYyfNdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pt65zP3tlEuv8TvdEB6rXZKaCDTrRKjurzMHDo80+l4=;
 b=OyrWFimgsJG5iDf6B1rKzlYTziaWRDEwWVtztEcNA6QaeZ6RcciV0JbunObZ2BNGBv
 5GgNYwcux+m4WR7NARlzkt5AhGgz8y1aVxGBpucj80CczPA27OhNbYRxVnPMHkYnr1lK
 T6JyFLqI8pxf8qUOJ7LEK1CYLmV/nji+niV33omR2z4tminTNTcR/3cbn7/PzIHcjxEk
 8ftJqL6++Xcep2lZ78yBMHiP4blKM6+GPjxudJWqw6Ot1w7kWrg4o06gDiaaVGtdB81m
 FoMCLfWlZLaUxyKm6FLFsquZwVj2HPZOfjgYsZoATGCsSkEz/8OPlCiouTmLb+K/UySz
 eDCA==
X-Gm-Message-State: AOAM530DAKqsOs4PspJ/5+2FoggKxMuWxgKT8HUjA0VkZkEAwr8nJXTf
 4ed/6rKvVAEM9fcu/M7DJXhMHtEsQgU=
X-Google-Smtp-Source: ABdhPJxKgmysUU/h7rSk9LS5o1iZmQTnbNWz1lWZoVAw8JPRoDOBpIt/L+K29HI41t8AbVdqITvtgg==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr56007824wrv.177.1594152775024; 
 Tue, 07 Jul 2020 13:12:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:12:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/25] drm/omapdrm: Annotate dma-fence critical section in
 commit path
Date: Tue,  7 Jul 2020 22:12:15 +0200
Message-Id: <20200707201229.472834-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
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

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 4526967978b7..aa3a8034d0ea 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -68,6 +68,7 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
 	struct omap_drm_private *priv = dev->dev_private;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	priv->dispc_ops->runtime_get(priv->dispc);
 
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
