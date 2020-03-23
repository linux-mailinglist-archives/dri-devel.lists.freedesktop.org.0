Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E515018F75A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1139A6E185;
	Mon, 23 Mar 2020 14:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710E26E157
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m17so8458760wrw.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RpBwJRU6QP8E4fA7oXBnbZ0R6iwlfd2Oj+Tujq20OWQ=;
 b=TwqTg/7Q0oQgHilrtFjCZKm9QjHrAz9GLoAMmoSzcpE7+su605PJQFjM9SmZEeHA0I
 EoaKb/tBlP4lkkRH0YuMHz5jK64SHGfQZCfLG4iOfVDSYvkIv27RnWzGvgkbkezhUgFN
 OPqKEuioQ3xLmZ04ihws5ydp8Yh4yGygGAOyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RpBwJRU6QP8E4fA7oXBnbZ0R6iwlfd2Oj+Tujq20OWQ=;
 b=FJKtNzAl4NcSuX7BSXeetSu6ka/wkHUVgjsk1m01qaZtSHWCMCuV2W9H4joFKy7uPN
 niRZGEf4TwqVj6yJA/mctmTIXo77SFGFwrLC/nd7kmqjq4CvKoWOE6Vi14viCKVjP2Tf
 OYR8ZSyI444RhekfITlQJfyS2LXdK5R5E+jmtWlNCRJJEHyhsxHVrEV+Zsunh9liYGBr
 3YZzxjj1wBFz0+WsYyppnKiXEC08fOYd2hjXl7Vn7MVylcxvNdFM20B2l+daCmyF8wyg
 iqYAmFrYUT59RbfdBGnPFp08jjzVN7M435xsPKlyyHimRhB6ayq44IdpKaZHH8NZLJLZ
 rekw==
X-Gm-Message-State: ANhLgQ0Gh9uF1tJCnbEkuqbC3dWI+TJ/YOxUow6lhPCn2tGCNN2ky6Lq
 l36lp6NYofZ3kOSsgg/aOGl07paVvgA3DQ==
X-Google-Smtp-Source: ADFU+vsLPXJgPUr3JUO+m1Ia1/iH4z4tr0EACEWi8dIu1/kNvXqjA3mlmxX1XKJGoiczZLRV4hJLIA==
X-Received: by 2002:a5d:540c:: with SMTP id g12mr25688626wrv.178.1584975011884; 
 Mon, 23 Mar 2020 07:50:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/51] drm/tidss: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:10 +0100
Message-Id: <20200323144950.3018436-12-daniel.vetter@ffwll.ch>
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

Acked-by: Jyri Sarha <jsarha@ti.com>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
