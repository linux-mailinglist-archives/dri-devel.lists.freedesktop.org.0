Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B2176704
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8386E882;
	Mon,  2 Mar 2020 22:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AD66E87F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:26:57 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 6so825741wmi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8Wt4RcjEThpU/mKoBI0075q/dm2GH9LI640F/mu9pU=;
 b=MxeDnZCZWjiX/GVAd5gmeAp3qQI8doBUUcINAenajCX7TmHNsRkiCGYABLtxfBIpRa
 IZ6O3emS0huPr7gHZ1IBzaephRYwkGE+AG69sBCQFV+n0BgwCNGkUkRDWPHSRudE6TH4
 LYAHXoVI5R8FHZvtteutuFGMLki9blKlBX0O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8Wt4RcjEThpU/mKoBI0075q/dm2GH9LI640F/mu9pU=;
 b=YySUibZVi0g2TgSP5HX4JtMGuYOzWKjoQiYK3wWwomNIqnwMO0eHz20+5fEAKGQdKe
 tx8MeQeF1b6ug6n20tiasjczSbIq3i2nPP4ZnR2XSHWDF6/W5xsKg76d+XzTB5P5bx7i
 w9hAx+l8sKPWjIndFEuluOn6hirNDb4Pqu7IJat8Eh/GaRj76zKzJ3T2Vbqbbw3gAemE
 NDqZwvPWgB+t5TP3+JQ6qASp2ZhtTo7bB8l00SZ1zS7/5NkQyFMakzezI5WoO8Rxgf4Q
 gTJHoEpCV9jynLDZvLRq35xj4+4rrVQIX9Mx6PhFanytW5HEXrjaiEVn/Iia5aKsVVgz
 aHXA==
X-Gm-Message-State: ANhLgQ1Ejg0f6WU0hrMbSvUeFPVjYMdVoG7OUNrg7R2eMp7t0e8CoMMH
 WzpiqG31M+ELjQ/Q6/OhEZ9kdAHipG4=
X-Google-Smtp-Source: ADFU+vtAG5Vf01Mf9J+GTr5/lgiKpoK00Xka/bzAbxvn5a2BiNjuUVCWdMEzQcYXDFjASk7axwqqLw==
X-Received: by 2002:a1c:7c06:: with SMTP id x6mr517370wmc.71.1583188016081;
 Mon, 02 Mar 2020 14:26:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:26:55 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/51] drm/mcde: Use drmm_add_final_kfree
Date: Mon,  2 Mar 2020 23:25:52 +0100
Message-Id: <20200302222631.3861340-13-daniel.vetter@ffwll.ch>
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
