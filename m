Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A173B1F7E3D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 22:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6F96E1D6;
	Fri, 12 Jun 2020 20:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3706E1D5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 20:49:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c3so11249378wru.12
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 13:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XIgjIzPFIgBI4EmyoK38np1WAjTN8clhgllj8ppmN0o=;
 b=bknKxuRZkahxMHOgE9ynpDquNqp6yw7USyhNiDp1nm0tVtAVJ7+8dSuU9K13Md8846
 Q0aWKqLm1+Cl8/2Vw6wjjsWhVxBMHtUt1PzZHRx4eDmx6g+QUn7nnAL3NcVs9vSrlYdy
 oInRDbFKGlgIVhFVpvdfG+FjCYzR7W98P8yV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIgjIzPFIgBI4EmyoK38np1WAjTN8clhgllj8ppmN0o=;
 b=TLckYUJh3UD8K6uHPDUIG52/uD3wfiaFhw5CHcnp3Ja3yu9N5cEayL+C1BH59LwzWv
 G1Rma/+MoPtSxbyVH/snEX4A/PAA0NYd1AxeGXdkmvUHtgqfOArV03Oj4O7FXEZmy1Yz
 AmvVK+0Z3Xoc7LirIaIY/y00FPWXUSNloh+5QhxQcVawJGs+btc9yQJevZEmbb1wBug6
 0qu8/fhNaLzZGurkuCQfZoiHeyJbxbyCsjahkmBCU7rCUJC72xFUhVwQvNJu8eilQUJa
 7MwUfwP6oeDjr+wbmLoOql5L/U9QHdXfo03wyRBeBcSDPiHk6YQ3B7OWA9nQhd+zAmQc
 lmTA==
X-Gm-Message-State: AOAM533Or2JgELBpXAy1CqmAhRIJDZFxKri4zJF4V9uxi8mXcb4DJVun
 YtDoWpzrz9MMivwW1FSSqJukticVJ/k=
X-Google-Smtp-Source: ABdhPJzCs81BOXZQABnrH6PiF+mNU4ln7OpSkG0b0FLaXNTTrsuHx3nfSdG8xpcXE91hBXJljqvFEg==
X-Received: by 2002:adf:e604:: with SMTP id p4mr16403880wrm.212.1591994985834; 
 Fri, 12 Jun 2020 13:49:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a7sm10811284wmh.14.2020.06.12.13.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 13:49:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vmwgfx: Use __drm_atomic_helper_crtc_reset
Date: Fri, 12 Jun 2020 22:49:40 +0200
Message-Id: <20200612204940.2134653-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612160056.2082681-6-daniel.vetter@ffwll.ch>
References: <20200612160056.2082681-6-daniel.vetter@ffwll.ch>
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now also comes with the added benefit of doing a drm_crtc_vblank_off(),
which means vblank state isn't ill-defined and fail-y at driver load
before the first modeset on each crtc.

v2: Compile fix. Oops.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 3c97654b5a43..bbce45d142aa 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -629,8 +629,7 @@ void vmw_du_crtc_reset(struct drm_crtc *crtc)
 		return;
 	}
 
-	crtc->state = &vcs->base;
-	crtc->state->crtc = crtc;
+	__drm_atomic_helper_crtc_reset(crtc, &vcs->base);
 }
 
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
