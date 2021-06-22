Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDCD3B0ADF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FA46E7F1;
	Tue, 22 Jun 2021 16:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABAB6E7F1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so2740810wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NKD9tkE/mrsEb6PthLinYJN7sw0yB82OVNKUbf7MxzU=;
 b=etezmXKOTAT91LSDN9NQlGSp+nnz3ZihR8JZMAUl0FwNY7aUqwzuRqRUMKcr2u39Kq
 BTJ3qRCRkRAVd8mpv5C/HB61Dygyxrhp7gwep2CX20cnmguckBTg/RuoS1fHGWsFzWRT
 7KBdQysj5Oayxiw8HRzapJXDR7tQyb57XGTzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NKD9tkE/mrsEb6PthLinYJN7sw0yB82OVNKUbf7MxzU=;
 b=jfwkqw+EsnrIoqO1TeaEMc40AV1tHXH3msToaRhXbkIxBMkXcNA1DMpx1sUmQBk9UZ
 FwvsFs3QcHrnJzn4XXFSL0MsaqBWRn35GE4dFrTXjCFDnGwdfWy+gEgZRswOhYaKnd+r
 I0NTsScQSCy+K8hp/HyUvmM5Z7B4KWRDiJyMFmMdFswgJ8E0zWN4tNgvtmdA7W1kFoo4
 udH9EoUiNk37cWsFe/vopSIstx0DVJHQ/VSiI663Udb0it+f54z3vZS+RTH3pPq/vxDC
 DCEL06QY2e9pn7G30iUp5NEW4kJ3o7Akk2eE2y3ZaxIYNom+TWDUtltHXmOAXfOY23Cj
 kqvw==
X-Gm-Message-State: AOAM533qOBJR7FYWBqQK6IkxhR21X2QjhkCGt6vluiQIM4U15ngRB5ZF
 Kd5Vh8g8tDN3OD1yknxOhn6mPK8C1G33NQ==
X-Google-Smtp-Source: ABdhPJzAn7H8R5b+AEBacoE9kgfVxiiODlz9p0b6WiBhcHVTxMp6l1wiSzxthZw6lJJY+TfxK25MkA==
X-Received: by 2002:a7b:ce8e:: with SMTP id q14mr5438382wmj.33.1624380929556; 
 Tue, 22 Jun 2021 09:55:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:29 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/15] drm/omap: Follow implicit fencing in prepare_fb
Date: Tue, 22 Jun 2021 18:55:07 +0200
Message-Id: <20210622165511.3169559-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomba@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I guess no one ever tried running omap together with lima or panfrost,
not even sure that's possible. Anyway for consistency, fix this.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Tomi Valkeinen <tomba@kernel.org>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 801da917507d..512af976b7e9 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
 
 #include "omap_dmm_tiler.h"
@@ -29,6 +30,8 @@ static int omap_plane_prepare_fb(struct drm_plane *plane,
 	if (!new_state->fb)
 		return 0;
 
+	drm_gem_plane_helper_prepare_fb(plane, new_state);
+
 	return omap_framebuffer_pin(new_state->fb);
 }
 
-- 
2.32.0.rc2

