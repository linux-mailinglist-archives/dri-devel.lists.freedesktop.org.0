Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE63D1766FD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667586E880;
	Mon,  2 Mar 2020 22:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CDB6E870
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:26:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e26so785794wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bRN0Ui5XqXN6WR6xH13puNc6QlAOJCfKGqyHvTJoDZw=;
 b=kEvQ1LeJTnDqw8rq9Hzc5GMlZ9uaakiuQOtQYYzTFzSB/Zemew43EimhGGmUIwbg0N
 FoEaoqi5YfN8700iFZ6s1kPh8LHmQxODlgo1ucIPKVjJxky4cKgeHUKgkRbsEOnrgaLK
 zl6my5w9tuXhQjy7pSmNK42MlZNYu1cFrNoZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bRN0Ui5XqXN6WR6xH13puNc6QlAOJCfKGqyHvTJoDZw=;
 b=n+kUZICsnfoJWm4w7kgY5K3Xx5HFjM1U4/aSYcdG5dLX7UVDV+Yua9FBclhqVuInzc
 XJxDjqr9lzSQJ13QpR/bentqkXEkP0+NRX+Wdhvs9V8TREBIHE1xKL3oNo38c71J2X5h
 jemHiLwVQuztbTaBXwrXvQuptPgGdmLfe8bw5Vdwy1HcNFaQbmietMAY7Iu6uPToust9
 ze9hO8DEUZch5haPpnx7VQSXFGxQbTlqT/4dTs5a7fdEVSDII7X+1OiAGpfJFQ3ljvs9
 hejn/bQyoMXNwGL6GZsKCkH3oHmSZ7aHmv8Ky5qBoHyIK4/iIuspRgnshnKKAcZX8Q72
 BLsw==
X-Gm-Message-State: ANhLgQ2rwY7+wNWyjfB6H4scQDLoUJonyOlGeQiMv3q8ej211yLw2mW9
 KSnaQEj56Kg41qe09DDP3bQhAN9oVh8=
X-Google-Smtp-Source: ADFU+vtdLvBfF/OTiwWe6SxxEekiJ4nEXpkbg1KV45pf+T/Hh/gE+yScm5DFTaP8T75s4tF5MrOE1w==
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr529191wml.104.1583188014816; 
 Mon, 02 Mar 2020 14:26:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:26:54 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/51] drm/tidss: Use drmm_add_final_kfree
Date: Mon,  2 Mar 2020 23:25:51 +0100
Message-Id: <20200302222631.3861340-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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

Acked-by: Jyri Sarha <jsarha@ti.com>
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
