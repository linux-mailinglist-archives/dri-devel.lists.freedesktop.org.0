Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C116417C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD6E6EB44;
	Wed, 19 Feb 2020 10:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7446EB3C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p17so6155836wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rDCI55LpkQVPZOIqCzPLQ0VOfp5jqvjH+bv30JO/fY=;
 b=XjHgkhWwm/lK2zY39T5CPs6TmKyDh5hZJKsmz5itThtS/3V7xL3JtX19p6cErEXCdv
 LOeMoFbS9udC8fLoElOxVNWZPPJySXGS3/iEBT8nQCAxcD1hbliGlKM03svQWkIGtDIr
 nO+qvvKJh8q/DnEJ00HUahrJ85vNigGVaNzMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9rDCI55LpkQVPZOIqCzPLQ0VOfp5jqvjH+bv30JO/fY=;
 b=TEm1LatozClXiQCWCapVl5OpWsxLrUMcLuL3TWaGEzMPMAFE2TloXgHcGAwDSvBvvv
 HYMV4vrIliiqTWMZ8QnZJ3q23z7hCZePRpp2uSGTEHPyT2Y4IG2IQFDheXwEconvfrIO
 2EIJLn+s2/vaJq5sXGJRvodleYyGZE9cqOA3R1xpcnaRO9HKsqKvBQW0fI/SYYvsQFxa
 VleVPCQ5X5vY5P7E5cpbvvpMR2iX3AeX6+t8yxsxUiy9LNhSwnC/hmcTGcOvNTmENnRs
 m36LyMuJhq/u9+Y+f18CTUhxObHzOW7ICz9VNG04u+Gn5WDqoG8BTiiCygHCQTTgyQFZ
 hbpg==
X-Gm-Message-State: APjAAAXPy5wX0+R+snbwwx3gdpJ98h72CplkBZtIIwSt6jFcpPITAOMQ
 OpinkX4asG7fYCoDNb9z0j1cmnOmQ3Q=
X-Google-Smtp-Source: APXvYqxpNyvXLddyuy5x9ynL43sFhJCRvFZOfXFuyQVLWSHKgUg9WHcedL25SS1gpeq2pwtxKX3+nw==
X-Received: by 2002:a1c:3b09:: with SMTP id i9mr9030259wma.31.1582107706424;
 Wed, 19 Feb 2020 02:21:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:45 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/52] drm/mcde: Use drmm_add_final_kfree
Date: Wed, 19 Feb 2020 11:20:43 +0100
Message-Id: <20200219102122.1607365-14-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

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
