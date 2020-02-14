Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2515DC38
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BABB6E824;
	Fri, 14 Feb 2020 15:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58796E824
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 15:53:24 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFDE12467E;
 Fri, 14 Feb 2020 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695604;
 bh=lO0caDtha1NplqJQjeZaJidxhiU6dcZ2jyMKnQl68Lg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1UXjbLrq1jiG4oOnASO+0R2xECGpHcVo+xdLHetQB/+yScXT8kJg9/S4uAd9F1BrB
 Jy4jr6CLYp4ZXyZLuvK+I427fk6Eaxc/N0wyPmfhcpwh13UwtYtCtH4F487fBVgOuS
 utxLwDuwe7wBKcn/Ps16bchPn4UVUoRwXCAJz5TQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 208/542] gpu/drm: ingenic: Avoid null pointer
 deference in plane atomic update
Date: Fri, 14 Feb 2020 10:43:20 -0500
Message-Id: <20200214154854.6746-208-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Paul Cercueil <paul@crapouillou.net>, Sasha Levin <sashal@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Cercueil <paul@crapouillou.net>

[ Upstream commit 354b051c5dcbeb35bbfd5d54161364fc7a75a58a ]

It is possible that there is no drm_framebuffer associated with a given
plane state.

v2: Handle drm_plane->state which can be NULL too

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Link: https://patchwork.freedesktop.org/patch/msgid/20191210144142.33143-2-paul@crapouillou.net
# *** extracted tags ***
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index ec32e1c673350..43a015f33e975 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -372,14 +372,18 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct ingenic_drm *priv = drm_plane_get_priv(plane);
 	struct drm_plane_state *state = plane->state;
 	unsigned int width, height, cpp;
+	dma_addr_t addr;
 
-	width = state->crtc->state->adjusted_mode.hdisplay;
-	height = state->crtc->state->adjusted_mode.vdisplay;
-	cpp = state->fb->format->cpp[plane->index];
+	if (state && state->fb) {
+		addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
+		width = state->crtc->state->adjusted_mode.hdisplay;
+		height = state->crtc->state->adjusted_mode.vdisplay;
+		cpp = state->fb->format->cpp[plane->index];
 
-	priv->dma_hwdesc->addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
-	priv->dma_hwdesc->cmd = width * height * cpp / 4;
-	priv->dma_hwdesc->cmd |= JZ_LCD_CMD_EOF_IRQ;
+		priv->dma_hwdesc->addr = addr;
+		priv->dma_hwdesc->cmd = width * height * cpp / 4;
+		priv->dma_hwdesc->cmd |= JZ_LCD_CMD_EOF_IRQ;
+	}
 }
 
 static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
