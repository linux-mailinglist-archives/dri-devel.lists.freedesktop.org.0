Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91A296E98
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB6C6E52C;
	Fri, 23 Oct 2020 12:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D6F6E554
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y12so1578202wrp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mc/HaupIcTONzzNY/IPbsojEeOx/OAVida519eIWl3o=;
 b=SiAF8YIghStwaDa3nrFgt2H+nRr1uyHWcXttox6xsUDFvOnOYoFcZimI2jXJ/tQ7oH
 feUtbc0GqpivsTSlahj/KEGE/aKiHWUzahbyDVAa1YM27E6zsOtyx45uFNDB4N2qd6YL
 q1lehFKjBkl5Qzb++NNO7IciOhxlrxh4dqu4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mc/HaupIcTONzzNY/IPbsojEeOx/OAVida519eIWl3o=;
 b=XmNNVWeNJFhewT7XNy61prv4m9aDcd2ri8wDPK26q+Q9/illxBQs9RuBcIK5Mbvx3H
 cP6+cd6pXEqNFqMoAy+RAlo2BCjlBPVIto+fc2nL8uFDRVyRnMZhwWU5WIc7677ZO39J
 3+y1VZ6yaG431geZ6Pt905FbdGuF0HCae4Y4vW8JmZn3OFbFfFeydA7sZt2ETiyq03Bd
 7frQbORCVDgL7ETJPJ3sAgL2Dvn9j2mlixDXvLtXgqyZmiC5qiSwFrwxA4w3ICPp5O90
 3YZOVAnwPsmTQqjNIRb+BD+NimzL2SuzDloU0MtRfQ2A8b9lCMGJHzqnV55gf86tYwSR
 W9xg==
X-Gm-Message-State: AOAM533t/PbeaR+lc/wZujrA7TByFUpdIXBLEpn9Op4UAT3h8479dHw7
 +BQFyBim75CXboUCrwPyCsTcU6ZvH1CnuhOJ
X-Google-Smtp-Source: ABdhPJwKwDRvXGALRAAZ5e8yx21fm1FpIVQ5ciR3SjfBnMLg6G8gjBK3IN3bWlAi2QNlABheXDpePg==
X-Received: by 2002:a05:6000:1109:: with SMTP id
 z9mr2146352wrw.388.1603455757106; 
 Fri, 23 Oct 2020 05:22:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:36 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/65] drm/omapdrm: Annotate dma-fence critical section in
 commit path
Date: Fri, 23 Oct 2020 14:21:24 +0200
Message-Id: <20201023122216.2373294-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
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
index 2e598b8b72af..2b82a708eca6 100644
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
