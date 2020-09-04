Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B625DC09
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FD46EC1B;
	Fri,  4 Sep 2020 14:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828D06EC08
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b79so6309418wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDJeuyrd+AUwqoOu6VT/5MJu0SvohYtED5Ve7fFVICM=;
 b=GORAZSsmj4rtGcO9UKpWDyM3rghF078p9/UWtORYn573eMx879Ao85t5w0fF39E9b3
 9jV6GM/YcS2DO2PECIPO5mQO6cwFxgoTomTGOxAwdVWetuQMCdgCfmxeLicdLv75PgnQ
 QI1rUwQcX6ICRhn2ZU1+hEwqv5WiTmj4v8ADk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDJeuyrd+AUwqoOu6VT/5MJu0SvohYtED5Ve7fFVICM=;
 b=JrwebBbFvL1A7B+qogQ6OOeCndIObZa1pd6cYUqHcQ0GVntghcr3mIXxmTiSFZhyQb
 XFF3/yfJLBDx/U8eItXt5dPuxnpPbTjkzGAgEpat6ULQZEG96M8vKZ7l7DrJbZVVey5C
 ecyeON7uvODIlSW/tyFUhLFjyqqH3uvycmBhDdMmymVB/KQ9f/iRLi3eZez9abVAPx4P
 k+jm+Lsr2DQgx7wr0jLqyXy8o9S6Nt/lqEbvF/0r+4nHJVOXxe+WIL98BqnubxWq4P8E
 XHapQayDf4uFg26I5Rda6dK4R/3fwc+6IqJcYIzQC8PCnwdan7j0WyD7hrD+6EpDtWwT
 aDOA==
X-Gm-Message-State: AOAM532XYlnB+jI4dbGMgKGFpoMrVOXYpuDciTm7v7aXcweQMhGQ0fzA
 m233GNXRrPNQFpLnOQp+6hSH+uViCF89bxmg
X-Google-Smtp-Source: ABdhPJxEbITXBwKzU+ml+q1ThhDDZYB/jwa1Zrz+jalRWGL2Ih6MgCU3AJwpbLbr+bypGdhy/dV3mw==
X-Received: by 2002:a1c:9d07:: with SMTP id g7mr8442227wme.144.1599230408829; 
 Fri, 04 Sep 2020 07:40:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/24] drm/arc: Align with simple pipe helpers
Date: Fri,  4 Sep 2020 16:39:34 +0200
Message-Id: <20200904143941.110665-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simple pipe helpers only have an enable and disable hook, no more
mode_set_nofb. Call it from our enable hook to align with that
conversions.

Atomic helpers always call mode_set_nofb and enable together, so
there's no functional change here.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
