Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D5523DB67
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 17:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3776E8D1;
	Thu,  6 Aug 2020 15:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133506E8D1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 15:42:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d190so9243596wmd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FgfXKzKXcPJ+BrybMJiWAeoBQrd4ZN3Pz/hMzpua0jo=;
 b=bTjz30iAXQq2TpVuw419whNvq6K6U/plwTHjvcMEpXDpT7JFt6yIsm85/jwPAaxtMZ
 YOXoe0W8vVhBXn+PZRoHcgmHto5vPKyNSwrrsoh41Jc4UcqeJQHXoBn4DTCqVeMpbryo
 NNSyIOJ4dCSHeiVoSEvczqqoXccPExTGNlzcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FgfXKzKXcPJ+BrybMJiWAeoBQrd4ZN3Pz/hMzpua0jo=;
 b=hj0F1p8sT1z3qXrTJmkQTz0lwKLy3XkExSTPfHX2T1pnkyqEZE529weljvFnFeQH82
 J/wFXCN20ttNoZ6fmSxtFBRrnbuqR1bm5pRewymR6dLdS+7RooUAMRo9oFAwKJBvqm7G
 TnajvaOzj4B/9dt9AlEiAvYxWYjenYX5CH1goL0bgFasjoTh6JXTcODhL2qBWEkuCXXW
 2J+4eE1075KYUnaonef0c09cBr0BZctVhNiBabEHjbTi3PGZHHKokI0eqwNtLrwjuVvZ
 352viVLHijQLDsaApjBeoBQky9NUjAKozdoXRlZFHZcFnK93nBTP9mKQXqrngtGUxD8G
 um2g==
X-Gm-Message-State: AOAM532Ij7YhIm8vP8jbl1ThwmtxJMPmjo24CmYdrNBrFYIU5KX2o9/R
 b8zQW1RDQxUMd1NXV4SLotvHLMkewhY=
X-Google-Smtp-Source: ABdhPJwRiM6RDlAw/qX9uPr8juUHiiX67YQWO7VEPdO/dmmef2y5EA3JIKMxWzeq388FKcK09Xa9SA==
X-Received: by 2002:a1c:9616:: with SMTP id y22mr8507629wmd.100.1596728553450; 
 Thu, 06 Aug 2020 08:42:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i6sm6744065wrp.92.2020.08.06.08.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 08:42:32 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vmwgfx/stdu: Use drm_mode_config_reset
Date: Thu,  6 Aug 2020 17:42:27 +0200
Message-Id: <20200806154227.2255197-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Roland Scheidegger <sroland@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When converting to atomic the state reset was done by directly calling
the functions, and before the modeset object was fully initialized.
This means the various ->dev pointers weren't set up.

After

commit 51f644b40b4b794b28b982fdd5d0dd8ee63f9272
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri Jun 12 18:00:49 2020 +0200

    drm/atomic-helper: reset vblank on crtc reset

this started to oops because now we're trying to derefence
drm_crtc->dev. Fix this up by entirely switching over to
drm_mode_config_reset, called once everything is set up.

Fixes: 51f644b40b4b ("drm/atomic-helper: reset vblank on crtc reset")
Reported-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 16b385629688..cf3aafd00837 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1738,8 +1738,6 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 	stdu->base.is_implicit = false;
 
 	/* Initialize primary plane */
-	vmw_du_plane_reset(primary);
-
 	ret = drm_universal_plane_init(dev, primary,
 				       0, &vmw_stdu_plane_funcs,
 				       vmw_primary_plane_formats,
@@ -1754,8 +1752,6 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 	drm_plane_enable_fb_damage_clips(primary);
 
 	/* Initialize cursor plane */
-	vmw_du_plane_reset(cursor);
-
 	ret = drm_universal_plane_init(dev, cursor,
 			0, &vmw_stdu_cursor_funcs,
 			vmw_cursor_plane_formats,
@@ -1769,8 +1765,6 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 
 	drm_plane_helper_add(cursor, &vmw_stdu_cursor_plane_helper_funcs);
 
-	vmw_du_connector_reset(connector);
-
 	ret = drm_connector_init(dev, connector, &vmw_stdu_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
 	if (ret) {
@@ -1798,7 +1792,6 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 		goto err_free_encoder;
 	}
 
-	vmw_du_crtc_reset(crtc);
 	ret = drm_crtc_init_with_planes(dev, crtc, &stdu->base.primary,
 					&stdu->base.cursor,
 					&vmw_stdu_crtc_funcs, NULL);
@@ -1894,6 +1887,8 @@ int vmw_kms_stdu_init_display(struct vmw_private *dev_priv)
 		}
 	}
 
+	drm_mode_config_reset(dev);
+
 	DRM_INFO("Screen Target Display device initialized\n");
 
 	return 0;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
