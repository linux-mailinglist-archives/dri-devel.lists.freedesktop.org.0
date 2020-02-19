Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761716419C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B916EB55;
	Wed, 19 Feb 2020 10:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3156EB3D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s10so5853025wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+dqca7vVfAJpVEb4Y1b3H/4RHc4MTBTRHhaWTEoXRoM=;
 b=MTRwJUc9oBJEYpqMzGgfiwV5O2jkxPp0D9tp1M0PHZhjhlGeevzByc1ND3H7maZERt
 q05wHvX/6Ei+xUaJ0ULwrWSZg+nrQyiGGa2lxQ8qY6LyzfyXFA1maaSkYBNj2WsaAd39
 C1Ora9V30DtaEcaERLjc5TEenOL2iZYR4WKOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dqca7vVfAJpVEb4Y1b3H/4RHc4MTBTRHhaWTEoXRoM=;
 b=CqD0C3Wolzv0G/Hdn/8SlujdXo0U7LZkPVK3IYMMxVuddi8bIc4M5l43FOyXSQl8gf
 hV72HTxs7n1QQN6WnI9FkQybqPQA3umA0XUZW99CI/LhNgq1+MNhmoGXkrjrIr/7uEuO
 4Ku9uVWYOsz9/fCIlpqqtK0olK8QalyXEN0Ih7Hvxok4qnCjnVZF2cq86po3+gjDRKKv
 3UxeKH/nbVZKlQWGTLpLzfsbCejaeXXmBjUf3bTLK18aOjfH2AUuyxR64p2o2fXyzNGd
 bImDH5PkFvtcHnYLsSR8hQnEwDez7+0L6ordqwrMKomQesKMrvURCKX5uy0N5mZu+wmE
 3Qeg==
X-Gm-Message-State: APjAAAX5jp8l/zi62vwRd5gRGzaMT1SDHh1CkoWo0wYySUWi0XaebOX5
 cWSMB77xBBem1gVDnJCdmGW70nGw6GA=
X-Google-Smtp-Source: APXvYqwFDZ0gulBcRp8XRyU91sZFGlpFg0extAyO3RSFqYIWTncbNA4Du0b4L8waJYcva5uU3PdFjw==
X-Received: by 2002:a05:600c:149:: with SMTP id
 w9mr8630551wmm.132.1582107711745; 
 Wed, 19 Feb 2020 02:21:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:51 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/52] drm/inigenic: Use drmm_add_final_kfree
Date: Wed, 19 Feb 2020 11:20:47 +0100
Message-Id: <20200219102122.1607365-18-daniel.vetter@ffwll.ch>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 6d47ef7b148c..12b14aed05cd 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -23,6 +23,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_irq.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_plane.h>
@@ -490,11 +491,8 @@ static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
 
 static void ingenic_drm_release(struct drm_device *drm)
 {
-	struct ingenic_drm *priv = drm_device_get_priv(drm);
-
 	drm_mode_config_cleanup(drm);
 	drm_dev_fini(drm);
-	kfree(priv);
 }
 
 static int ingenic_drm_enable_vblank(struct drm_crtc *crtc)
@@ -639,6 +637,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		kfree(priv);
 		return ret;
 	}
+	drmm_add_final_kfree(drm, priv);
 
 	drm_mode_config_init(drm);
 	drm->mode_config.min_width = 0;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
