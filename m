Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289E5164180
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0F36EB46;
	Wed, 19 Feb 2020 10:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2123F6EB35
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so6155778wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hx/cPuNXkvvRSURKUkq3f2ByH3GR1vkT+hlQK0aAurQ=;
 b=TnFNBWloh3uOJtjawkAo8h4KUW9S2clxn3+pcFzhRLfP+45gNFjI5YlDyBhytAGtxh
 OMJJQg6oQH5MloQBxPAzpE8FQaqjloa2XEXzQJbzt7iXy5eU0N83eVV43UfeZ32ownz2
 CpUpYST6IRhEL3lIHsyg1XvBvedE9KalKPNSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hx/cPuNXkvvRSURKUkq3f2ByH3GR1vkT+hlQK0aAurQ=;
 b=mbATe0LY+EaWDf+LQDx0MOaeeeQmlsz0+tKC1BvHjNb8Qh0eaC8zFN+b4qh3B7z1ER
 ReL7xlWGJc9Dl5PWbDDipWToD7qZAjMgMZQInSka0aSRwL7HG9c496itZrdV/HOxnl0o
 s4xvjL/LhLLYZyp9qaQK80KhqgkJo1mY32hTIXPqB8aSODDTulXsgsuXFc6U9O24aOXZ
 xbnkGcHzSkCEYO5caHpPqg41FCm5KimU12v/xFy6Yarq7gIssvyjrMF43PgdvKNN/1Fu
 qtKn5OA5k3TDrIOgpj7xDLHe0ivKO1d62+mDMYG0jMovOf4i/FLX4b5wMU300qF4ReS2
 zFQg==
X-Gm-Message-State: APjAAAWCt0cY7/VNbkhGCKCe5mL0SKe6nY5BeUdmFV1NIi0iA3OSOyTi
 XRL//9YotRroYrp76dWqWzld1RP/rLg=
X-Google-Smtp-Source: APXvYqy59BuMgvc7q2NRP/AxABDryisz2+eDHbG4XDgqNMZ70f+891L106RkrugfHAfgx96PmmzSCw==
X-Received: by 2002:a05:600c:290e:: with SMTP id
 i14mr9294538wmd.139.1582107705540; 
 Wed, 19 Feb 2020 02:21:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:44 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/52] drm/tidss: Use drmm_add_final_kfree
Date: Wed, 19 Feb 2020 11:20:42 +0100
Message-Id: <20200219102122.1607365-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index d95e4be2c7b9..32a85628dbec 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_irq.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
 #include "tidss_dispc.h"
@@ -109,8 +110,6 @@ static void tidss_release(struct drm_device *ddev)
 	tidss_modeset_cleanup(tidss);
 
 	drm_dev_fini(ddev);
-
-	kfree(tidss);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(tidss_fops);
@@ -154,6 +153,7 @@ static int tidss_probe(struct platform_device *pdev)
 		kfree(ddev);
 		return ret;
 	}
+	drmm_add_final_kfree(ddev, tidss);
 
 	tidss->dev = dev;
 	tidss->feat = of_device_get_match_data(dev);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
