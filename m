Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A19518F759
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761396E1BE;
	Mon, 23 Mar 2020 14:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B286E157
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m3so15132473wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QB7nWriSd/RsDO5y6HocdPS6ke6M+vxoqpaoPFGhYhw=;
 b=EvReFOtMBX7wXy5LlXLwGV3Op0+4769pW9pnEFu6+LJa19Bbe5Gn1IFg3DOG6goqng
 etcEpT61Pb/24DGcWxqnzD+Mv/u0ekt/ltzjANdG8RAUr95D/pWzToheB0WwWNUdP15g
 +yURXe4wISadnkzc7jwyo2Zo32Hca3qEhiyLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QB7nWriSd/RsDO5y6HocdPS6ke6M+vxoqpaoPFGhYhw=;
 b=b/l8oA5o0GO2qjH1t66k5J0q82vf8hF9EPe/PiqXb9qEA4mZhBjYTvkYatIyyef3FO
 yA4D1AviN62+dn51/zRsCdEZl6jsvMrLtao64xEnyc73rjPnQvk3Xgqhewergy0SUx0E
 i8fp+i6TYR4+y+VD19HmsoYXZAGjd8qfyagLtphbLbmLTjIDGcL2/Q0J+8o085UterH6
 Sp2f5D9kNQsfd+cCIheuO+3rKcEBhFVMS8lWk6MpvgoekAeKDxIa1U0HeL0En1JvouEn
 T0wL6H8litDRBMKIkoqFWAhet1XaUdl75T+oUOVOfjiUoA9DBaZCYAsEZFVclaWtYWcs
 WkUw==
X-Gm-Message-State: ANhLgQ0oyXBQGvmU6qoN5wCfzbKTZyG4T+gcWi5InfNL2jokigt5cky0
 EQxQfDFvfjNHnG0sSReoP9XTxw6lbasF6A==
X-Google-Smtp-Source: ADFU+vtdl5PtJlf2vzHK0jUy//CDFQx9t0y+DwEeKpIrpSpgQHpz5bhLaxp0zos3mJtJ9cOwL42tMQ==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr27854414wmc.32.1584975018667; 
 Mon, 23 Mar 2020 07:50:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/51] drm/ingenic: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:15 +0100
Message-Id: <20200323144950.3018436-17-daniel.vetter@ffwll.ch>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 9dfe7cb530e1..e2c832eb4e9a 100644
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
