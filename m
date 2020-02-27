Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C7C172671
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593956ECEA;
	Thu, 27 Feb 2020 18:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E41F6ECE3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e8so4639375wrm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8Wt4RcjEThpU/mKoBI0075q/dm2GH9LI640F/mu9pU=;
 b=W0j8wS0JJA6nXjXtaUk/91nZcAoPOWA9nGkkO7qq9LLIywJGWsH0tq9Fu5ibzte1nx
 gypL2Lz8Zgn4YoHTn7wnzx81XnCkVFq+5smfuYsyvguLfksTKGcDzt7qNon7b2Kjv6b3
 wxDhloL+nWLKNyHoGTqOIb9v1psDLTFAG/bKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8Wt4RcjEThpU/mKoBI0075q/dm2GH9LI640F/mu9pU=;
 b=lDyROrRtgHKDF/tlipytwmtOUKH4HPCVhnLbbKuB2B+8FzJIclY6ay+36F09e2OJq6
 DpcGK5QCSzXj50h9arTImHAxYhhQoMpp/R6k1wQlYov3g4DiMhBQ9CEbHN4rlEltqcZE
 nsRPiVu/SAgDWXmL84OmCnLKWKLzFw4VkKnjbQISPN9y9YtwNIbX0vcAXIrrTIUDHAEI
 OD6JWGi+CTKuTaqFfZLiPprXhJPPNj19EuZtC+7BtW+qob5zhbyxY2SV1U7mTrkS/dvt
 RPINu/EElb80C7qf/66F29m57+j/SQq3SnD2vbqaef4mlzbx1mcEJW1gwXzL0l8ECpWp
 F7Nw==
X-Gm-Message-State: APjAAAWKgqbpVJi9mdWhgH24nCeKSxVj+9PT87W6nOWKANVJbPwqgTbf
 +uODA8tCNPVH3GSi+Fp4i44LineP3Bg=
X-Google-Smtp-Source: APXvYqzC+2dAR6C6FfQDADToM677mXLwRCaM+Z0pYrA0n4iz6JuCT9pINcLyIWlK4GCQRT/CCEAl9w==
X-Received: by 2002:adf:db84:: with SMTP id u4mr96522wri.317.1582827344724;
 Thu, 27 Feb 2020 10:15:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:44 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/51] drm/mcde: Use drmm_add_final_kfree
Date: Thu, 27 Feb 2020 19:14:43 +0100
Message-Id: <20200227181522.2711142-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
 m.felsch@pengutronix.de, Daniel Vetter <daniel.vetter@intel.com>
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
