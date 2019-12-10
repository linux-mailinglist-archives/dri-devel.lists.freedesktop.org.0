Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A511A6D3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A844D6EAB0;
	Wed, 11 Dec 2019 09:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CFE6E8EE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 14:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1575988920; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2+/kJ0+3S6x9LjI8UpyG3lhPkfNRouukRngxphw6fA=;
 b=FqxUtGPlPhVyfxXRhspVU088fqYWSigP64Qr2ND4lLwMz1U+uIxKXVqP0lhckig7AlrPiY
 lK0eVE6d4MioOwLVXreMip2guNn8tV2DaPYmzTdWM1s6wSWzdK14EdqBg7meB6tdwtftkV
 bx3WYaFB19Qv8lCJMbn2GzxWcZcGBZY=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/6] gpu/drm: ingenic: Use the plane's src_[x,
 y] to configure DMA length
Date: Tue, 10 Dec 2019 15:41:39 +0100
Message-Id: <20191210144142.33143-3-paul@crapouillou.net>
In-Reply-To: <20191210144142.33143-1-paul@crapouillou.net>
References: <20191210144142.33143-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of obtaining the width/height of the framebuffer from the CRTC
state, obtain it from the current plane state.

v2: No change

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index f156f245fdec..8713f09df448 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -375,8 +375,8 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 
 	if (state && state->fb) {
 		addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
-		width = state->crtc->state->adjusted_mode.hdisplay;
-		height = state->crtc->state->adjusted_mode.vdisplay;
+		width = state->src_w >> 16;
+		height = state->src_h >> 16;
 		cpp = state->fb->format->cpp[plane->index];
 
 		priv->dma_hwdesc->addr = addr;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
