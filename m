Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34C168894
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8816F51A;
	Fri, 21 Feb 2020 21:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AD36F51A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n10so3557506wrm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hx/cPuNXkvvRSURKUkq3f2ByH3GR1vkT+hlQK0aAurQ=;
 b=lgWtJTnY1oKpLYBl4tBjbdfPunguSjv/O93nX20eSIKjR1gk8icMghiTJgqkRPbkaY
 TzNJFlvNeo+xw39S1tq9bYg+Q7+5YdUpKsP2pjW9TUN0Qrfmv0COm//mml1bByxgsMFb
 hIit5kAj7OZfGRHwmz9LBbT3ac0zyRRuzH+vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hx/cPuNXkvvRSURKUkq3f2ByH3GR1vkT+hlQK0aAurQ=;
 b=bPHVKnTlDr4QKUMaRiL/CnlHN2bZC1MbkzWl/nm9S4PoJF8MDqBT/4XbQKmp6ECsSa
 vKrKO/sFZVsffuRmyoBLv35jHpjMcEtRryFy5xkJ82T9qgCdtArhjZypi87ZckC2B+n+
 QqAUi3ac2ygYRTiIfVnq61aw3MzKdLSJFDtYWggQnSZCasTz82omfrl/z7F9r9iFd8Rr
 fnYVeZ4ciqspq+oY2faQJJLXGdo5YIsJrhalvEDk4buczmMn//GYgbxxPEFuv2YxTbe+
 EZHur7mdrY0bCOIumoxlcHVVpKLJeECgu7So0gt1LTvG7YRkbRTvLscgxKX61X3jCKI7
 BisA==
X-Gm-Message-State: APjAAAWhzOMUmnvrHv0OQtD5kdHOEBYE+0h7+UsgxRm/Rd3/el0UTqTc
 TYTcGOWyXDOeq5WCC6paUt14VC8vj8w=
X-Google-Smtp-Source: APXvYqyPXqD5RTkDrVwIScLYtEkbJmUxrGSVo6I5yNWlVi4Ye5BD+6+9dj2p1FtB4aQXqUOxNorNIA==
X-Received: by 2002:adf:f310:: with SMTP id i16mr51953875wro.326.1582319022469; 
 Fri, 21 Feb 2020 13:03:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:41 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/51] drm/tidss: Use drmm_add_final_kfree
Date: Fri, 21 Feb 2020 22:02:39 +0100
Message-Id: <20200221210319.2245170-12-daniel.vetter@ffwll.ch>
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
