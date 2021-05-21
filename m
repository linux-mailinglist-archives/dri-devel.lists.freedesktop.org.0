Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DC38C2C4
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B18D6F5F0;
	Fri, 21 May 2021 09:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CA06F5F3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:10:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n2so20380800wrm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0IxvNRVc+LGpbIknPl0xr2O/3EskS2QMDeH1i0DmrHg=;
 b=TFG+qYZM36tp1Y/rPsLcqCX35IGcRuULCaf4SuBpf7SF+mUQOJHckBPVHobgQu3QWu
 iIdU9qw35ykJ+Dx0+jShTZ8H9Qh9THlhVYh2PM4RLp/cy7AVjAmZ9TzzVJMUmE/wseLz
 NADCU4MEnJ+Me5eJXbg+K1mWs9q1wU707kCEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0IxvNRVc+LGpbIknPl0xr2O/3EskS2QMDeH1i0DmrHg=;
 b=ZwMIqknjONbDx38O1QzcRGkkXhJYQDcylwyjfxOP5qI3t3B7w6y6jgI0PMdZuLpvX7
 eoSe+3yXr0BbMP3S/n1xsNZuqGQ80uV4GPld7Y6sfOqOcL4F9j9IG0rzKlPa9hK2Zaul
 wrC6nrWSOOwhauVyD6KPGpzPTDwZcL8AtrkVRa1z2jyLQbP4I8DGlmcni2fGz5D9TSwO
 TaWNdf9WIgYJXkTCDcX3S0U3BiuQ1EOTZEcfbLta9ivW/PQeNvBgoRy4Q7d5rh3m3eZV
 yj3fe2XO9WT4V5zNN1PPRcakjDG+tKrlohuyWRxnJo99S9l/okzLEEH3RDeAwMJG0vbD
 tLhw==
X-Gm-Message-State: AOAM5315nbOowZUuGjFI+mp8sCIIs4FKlHHMXeadq4WFtcCY7uf5HyJn
 Z/pct2bc38oUJeVTAYs3yFJfp9akKX6SRg==
X-Google-Smtp-Source: ABdhPJzdQGX8rWJt8LL9kvgecYf0bczlH0pl2E9kzO2PKjKxz8605nGW/DM30edgaYMala5YruUtZg==
X-Received: by 2002:adf:dc88:: with SMTP id r8mr8284458wrj.277.1621588213324; 
 Fri, 21 May 2021 02:10:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm13589457wmq.45.2021.05.21.02.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 02:10:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/11] drm/omap: Follow implicit fencing in prepare_fb
Date: Fri, 21 May 2021 11:09:57 +0200
Message-Id: <20210521090959.1663703-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomba@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I guess no one ever tried running omap together with lima or panfrost,
not even sure that's possible. Anyway for consistency, fix this.

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
2.31.0

