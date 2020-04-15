Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD141A94D2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB7489C55;
	Wed, 15 Apr 2020 07:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C339A6E8B7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a81so17656653wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=20t0le5X6RHJ7j1XiDolNqzntpIKdrGSGwvqPHwX8CE=;
 b=Is9Lq58RsIUkwp/y/FiZ/NVD/cE/KgOnLbCxhTbf2JVp9Pulu8oJ27EYq9IAV1uJMg
 ZNPrprNXP9LpXkgljvHAvhAQotPv2WRkKnK5jJPgDOp83n5bqVrsozedPGaP4SX9nOOg
 mrDDkKoKG4Y85i+ArKsexqwnBkf7hR8H45IQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=20t0le5X6RHJ7j1XiDolNqzntpIKdrGSGwvqPHwX8CE=;
 b=GFnNku+/7NKGKqdsIowgxkfG/p1I/RpqvxNkM1+Ve4R1SJNYDK5rjkCddZXLaVUO1x
 s6yJJWBqtqSXvIT9Z5P7AgcyeLEOlg00z3/hJNlWgXldKRLOhRnpgp9MBvIm3APINSM9
 nKeuXSj5Lu8ernsMLLuKz2gFG6uqWRzbreiXO1DWUFpjKEC6xsAJzXabKM7X7f8DGXzU
 DqnHFV0r5HqsQCJSyWoKYiCp/jXDWkmHtRmpBxU0m+nfDQCp3Rdnt5k7q2WojQdWnJo9
 eNHLEYZlatEBOgta01SHzglmnCIitiiNErZ0yI7VhxJjhOvaRZ4ji1gxjucb6+7v+FtS
 gxog==
X-Gm-Message-State: AGi0PuauYHtC8LXHvYol8lmMprXLiKFY1SdDvWUv1TWtMuc101dtQ0JK
 e5KJFaLV473nnzLVZ01MSTbYpw==
X-Google-Smtp-Source: APiQypLjg5cxdS/B9OezSLtejSop+E2sdAmKxjHyITmvX/VuJVeu8iWovxx8kvTfRZBfY6nWYcYZKw==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr3932939wmj.111.1586936488361; 
 Wed, 15 Apr 2020 00:41:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 46/59] drm/arc: Align with simple pipe helpers
Date: Wed, 15 Apr 2020 09:40:21 +0200
Message-Id: <20200415074034.175360-47-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simple pipe helpers only have an enable and disable hook, no more
mode_set_nofb. Call it from our enable hook to align with that
conversions.

Atomic helpers always call mode_set_nofb and enable together, so
there's no functional change here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 72719556debb..c7769edeefdf 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -73,10 +73,9 @@ static enum drm_mode_status arc_pgu_crtc_mode_valid(struct drm_crtc *crtc,
 	return MODE_NOCLOCK;
 }
 
-static void arc_pgu_crtc_mode_set_nofb(struct drm_crtc *crtc)
+static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 {
-	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
-	struct drm_display_mode *m = &crtc->state->adjusted_mode;
+	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -110,7 +109,7 @@ static void arc_pgu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
 
-	arc_pgu_set_pxl_fmt(crtc);
+	arc_pgu_set_pxl_fmt(&arcpgu->pipe.crtc);
 
 	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
 }
@@ -120,6 +119,8 @@ static void arc_pgu_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
 
+	arc_pgu_mode_set(arcpgu);
+
 	clk_prepare_enable(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
 		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
@@ -139,7 +140,6 @@ static void arc_pgu_crtc_atomic_disable(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
 	.mode_valid	= arc_pgu_crtc_mode_valid,
-	.mode_set_nofb	= arc_pgu_crtc_mode_set_nofb,
 	.atomic_enable	= arc_pgu_crtc_atomic_enable,
 	.atomic_disable	= arc_pgu_crtc_atomic_disable,
 };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
