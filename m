Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDBB18F755
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CA06E1CE;
	Mon, 23 Mar 2020 14:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EB06E16D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 31so11416492wrs.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C+qwRvOTQBprgCHFV2JnXoXJFc0YxzOIY1i5YWjQEZc=;
 b=H2ZWKXjO2Tj1DCEiWPj33bKYe44uHab1I3CazyAjmsnoHzuObLpYvc6H5K1pHcRBUO
 JWr8DgAimBADxVVDUrmk+kkeh8swqCNU9gDDC2LcwA1mekhRxmyo3XGQ30zPF1dbgVX2
 4/eKv1eOQ43hxDelasNaZg6ceRFUEbkqQsdPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C+qwRvOTQBprgCHFV2JnXoXJFc0YxzOIY1i5YWjQEZc=;
 b=qs6z+5YFk3EEPh7DVGRiDjKIUM6hp4cfCfASm9rZ5clFF+Ax8ZNjnmLmBlM0tqf2Vd
 UF4j12Y9dMM/Z7cJA4444q7xsZLRYYQRI2AxhAescJHxO9ENsq+0UAFVEm4eQgGNW3/o
 Y9kcnmaIVR2olMewwSoiQ8uGG30HQphJiFaAt7hOHNmVGqoF9WLR/cXv9HrpHV9A10HT
 8gFtJg3nLy68QeyRmhpvZ9BPGx8NgBEtxltqSkW9a0aRTPtN+XbIXcWKh5eA5bU59DaZ
 Qd7eyThGZyjlCA4aQhNnTSNTFUKyuKep/eSxlejs1tcp82ZuxGk1EQiL7iIzTAKK48k4
 oe+w==
X-Gm-Message-State: ANhLgQ1ryeWxYO465OQBuSVZsYc2FTFiPoGeCdyXFbji2K7Oe0zbEJcA
 HVWBWchLmuYzl+pYZkyBU3IoH4V1GSPDhA==
X-Google-Smtp-Source: ADFU+vsvxEsTudZYlp5vYiZPLnCBxrD3E9RTP/SRzPMB1ubm/i9BFERXxRdVaZBH/7Nx4KwiBVwX1A==
X-Received: by 2002:a05:6000:189:: with SMTP id
 p9mr30469632wrx.391.1584975013150; 
 Mon, 23 Mar 2020 07:50:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/51] drm/mcde: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:11 +0100
Message-Id: <20200323144950.3018436-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index f28cb7a576ba..7474481503a1 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -72,6 +72,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_panel.h>
@@ -223,7 +224,6 @@ static void mcde_release(struct drm_device *drm)
 
 	drm_mode_config_cleanup(drm);
 	drm_dev_fini(drm);
-	kfree(mcde);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
@@ -330,6 +330,7 @@ static int mcde_probe(struct platform_device *pdev)
 	}
 	drm = &mcde->drm;
 	drm->dev_private = mcde;
+	drmm_add_final_kfree(drm, mcde);
 	platform_set_drvdata(pdev, drm);
 
 	/* Enable continuous updates: this is what Linux' framebuffer expects */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
