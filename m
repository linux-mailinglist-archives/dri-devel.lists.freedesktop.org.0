Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE861688AA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05396F53F;
	Fri, 21 Feb 2020 21:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1A96F523
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t3so3518287wru.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+dqca7vVfAJpVEb4Y1b3H/4RHc4MTBTRHhaWTEoXRoM=;
 b=baswKR15NPEbuQVOd7W5TUH7mPdhbViJgNC/xb8YRpe9+wn3taI6TeEXjdLQ8c38Cp
 csb57a+1plsslZ8AjEvN2Oc8XuXjlyk8SGY0/66J0jlz0SHbUA73nvdt5Dx1OPB6rpM0
 ba4GvbeW275BwZnfuemjuOOjy2iczL1FekRbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dqca7vVfAJpVEb4Y1b3H/4RHc4MTBTRHhaWTEoXRoM=;
 b=m328+mckEmV8hbkh5UXxcACCKLLPzLqEwq5syxGcEF7wrx78921onLlMT9Kk4Yam10
 qaSmc0pPwAqtAVYl9FkLjUp16rTmQByRZXKT8s8H7LA7lAuxD5p6R6lE1jJKCYNZAZ0Z
 RP7ikcIPgaSLheVUnFENifmNtv3Lh91BYOBhq0XC8bHcVgZ1U3MCvKdScsRVzuGX+kQu
 wzyXlfZA3XHLmV2Ramca20c22xTJ/dZgcPv1H0SNcdX+/dGDXkGl0AAvz75okC5e/A15
 E+/DrQILYNs0UqlvYP8PtSYXJj79NDa/HVLlc2E1dbGHT2D5vCukgnD33aUnMWDv+/60
 D8wg==
X-Gm-Message-State: APjAAAW09WKu6jMyO4Qb3oIR7iw76Dm2vh1s9G8v9KgwnZ8WwP37q0r2
 8FGXsHhHpEjCH56Eh9+vM1NKOhcwEuc=
X-Google-Smtp-Source: APXvYqwOOzZKqu2NBONONN3L10Q0nkW32+sa7SVkV2+66ySR6XD9ldup53fhITJ0RnzpLySPSSthzg==
X-Received: by 2002:adf:ecc6:: with SMTP id s6mr51696350wro.345.1582319029815; 
 Fri, 21 Feb 2020 13:03:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:49 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/51] drm/inigenic: Use drmm_add_final_kfree
Date: Fri, 21 Feb 2020 22:02:44 +0100
Message-Id: <20200221210319.2245170-17-daniel.vetter@ffwll.ch>
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
