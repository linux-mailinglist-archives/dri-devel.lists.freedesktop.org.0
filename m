Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792A617266C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9409E6ECEB;
	Thu, 27 Feb 2020 18:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696A96ECE4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:51 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r7so2356294wro.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=igpRmo6gaDMBMGIx+0UKty4ytpIN+f0m76awjcPMvLA=;
 b=FO1CsynCET+atcd1NDCMfEcy8Bz9s/yEnGgFLe9XLVH9qOqKTfEOrTsBRa6VCmuMqn
 kySGboUyifMmTttGz9K5DtL/a/iHqWNgQhQnkATVo6Kh8dO/agGlDkSlovJa0J8siRL7
 Hak0g3rxv/8O7NElIhh96xYAWdHibmVSKV5jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=igpRmo6gaDMBMGIx+0UKty4ytpIN+f0m76awjcPMvLA=;
 b=sQR2Zpwad8yV0TMNQaMBYbWSfC0wGhgaUULYOuBOwNNRhwXAN3SIs6eydYUjn23FuY
 mDiL6T2Zu3qpFccCqtVTWFSaHo8/4R6AreYkN29VKohPbllyzifeJu/Y2KxMY2BdXZCb
 7hKZ4XPRVVC9jnLYK/YcWHhuGqvrTW6aGP6rMgLoqyIlHOprq6kNtZ5WJREU3Vrbi9xe
 t+atEKOsLtJeZbTIZgh9/IHLQ6mHoK7sS1i3GnqzY6NAraowsQe1KzTSFYicyMUlwBON
 aDb/3jKNIaW1suv6AU8I90Na9seVIArz8PSfKMZnSMNTE0RSa9dtx+JBUOyHIdAofG9j
 K17g==
X-Gm-Message-State: APjAAAXhQsX0jJRlWlJeltYlSMtVkcAuM/e2NVurkegCy1NwYljmAaDb
 98SKlSAqEsXzIEbtpbve8w0/hyCrCy4=
X-Google-Smtp-Source: APXvYqwGFG95Xr52Fz4Cdzm22jQyh4sZSEUAcledAMmxRie0msgpljAqTjoSmBHVlBG581se97hS8g==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr152270wru.148.1582827349869; 
 Thu, 27 Feb 2020 10:15:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:49 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/51] drm/inigenic: Use drmm_add_final_kfree
Date: Thu, 27 Feb 2020 19:14:47 +0100
Message-Id: <20200227181522.2711142-17-daniel.vetter@ffwll.ch>
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
 m.felsch@pengutronix.de, Paul Cercueil <paul@crapouillou.net>,
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
