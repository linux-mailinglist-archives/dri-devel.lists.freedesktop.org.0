Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4291688A7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2A86F53C;
	Fri, 21 Feb 2020 21:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18CC6F522
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so3505191wrl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8Wt4RcjEThpU/mKoBI0075q/dm2GH9LI640F/mu9pU=;
 b=k7+Q6uvozTDTXITJBuMioz/RkVEgaB9rJbSJr8LCE19qrTjhQdWxX6CaWFPW6RBeQ/
 xEGPmrLrQTD8mJcDa4OZuTxHlKkcwZOcku6pO7eHkgdqdqUwtr6Yit4+WTXK7Xbt9ZPb
 sDXc9zh8tmVaxCuTz9FhqLxmCrQH0V3ucpPmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8Wt4RcjEThpU/mKoBI0075q/dm2GH9LI640F/mu9pU=;
 b=sjFwQD33UPjiI2+Df7v3K37HiXyI/WTQJSb7pz3z/fEQvRPX5uDhaY4QegIcqJv+qP
 lvIOiWlR2FIkeRWGLU0CzKWdzGz+xDtaWe3PdT3oa6I17OLe7vrvPQpxGooeGYpGbIIR
 ktvTQSsim25AZxfaAFW8D6bY/zcbKrlnLbty68bDIZszgZSglSLKr8KJxRS9kSRfsG4v
 liJ6jeiPoDPJJTlPriRdOG4hLyXtP0jrT2utLfPzJTy4uvSpe+JQwFKxEIKrm6d3O6Wv
 u4EqkYoawbLjE+YtH5oRSxeNs1se+0cVSrL8i59ZyQ0McCMIS1rP3Eex72nOdm1SZ/SV
 MYXg==
X-Gm-Message-State: APjAAAVm39oZAB9ZpUQBjb5HSUgJKkt9dl09U98dCDngZaSBbcD1RcKQ
 /gLJdO6Y5qA3tcO/J5eTxV51EIaRgQY=
X-Google-Smtp-Source: APXvYqzUcJqO1FmwumlLCWC5josxu17WAcaRls+ls9foy30+skzw6TXDgfCLwZ61lMq5ZwiUskR5Xw==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr48090809wrv.333.1582319024088; 
 Fri, 21 Feb 2020 13:03:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:43 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/51] drm/mcde: Use drmm_add_final_kfree
Date: Fri, 21 Feb 2020 22:02:40 +0100
Message-Id: <20200221210319.2245170-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
