Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDBEA9EF4B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 13:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C582710E412;
	Mon, 28 Apr 2025 11:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dlVJpDNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083CC10E412
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 11:37:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE96F4A3CD;
 Mon, 28 Apr 2025 11:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A730EC4CEEE;
 Mon, 28 Apr 2025 11:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745840246;
 bh=gyUkxENbv630uKtE7gXJdti1lLZFSd7n0i3pDBTmb98=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=dlVJpDNdEeAgYv7gJdvWiHmZr3YOOrXJXD+75VY6CYD6s8DcMT4xYOd1NYRQX1dHT
 FWb0lCKUkPRIUbRjVZbXBQjZtUt+NqgdedsiXLQQJqvHYzyBZJ52pndTBgiUCzPUXg
 x+5yVjnAVP190gY0IViKrzpo4WwlpTrsl23ewVcrA/vOv9DqujN58bUrrni3lNFzVO
 ut6TpPsj2KLIA2agvyd1CngRupi1//F6yys6ya0mRM0V+GAcF1PUuTs7MHKqpZ3ZvE
 wfqdtK5J0sTgz9nHlYTNdrI1QETOyoUN7lvJyo3lRftRrzml/USTlgJEnMZpq0TJMJ
 t+bGvKyOpPYMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 937D4C3ABA4;
 Mon, 28 Apr 2025 11:37:26 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Mon, 28 Apr 2025 13:37:13 +0200
Subject: [PATCH v2 1/4] drm: adp: Use spin_lock_irqsave for drm device
 event_lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-drm_adp_fixes-v2-1-912e081e55d8@jannau.net>
References: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
In-Reply-To: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Baryshkov <lumag@kernel.org>, Janne Grunau <j@jannau.net>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=f9CWUT6BHio9yznivZy0rXZk6w93Ok71Ww97RIoMSA0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhgz+jBKf1WUvsgS3G96a4Dr19KNNkSLcNuwLY056+2/re
 OLwe5lWRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkkOjIytG9MuGCsvi6n+Rnj
 wSX77bdYVN7dUS1Rvrzn3bmljV5lGxj+52UX7A5N1wrZ4j3p9cWrB7dY9aV1da5pT3v6p9ZU82Y
 eAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
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
Reply-To: j@jannau.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Janne Grunau <j@jannau.net>

The lock is used in the interrupt handler so use spin_lock_irqsave to
disable interrupts and avoid deadlocks with the irq handler.

Fixes: 332122eba628 ("drm: adp: Add Apple Display Pipe driver")
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/adp/adp_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index c98c647f981d5383149647126762a5cdec8f4e4b..157298a8ff42b95275411dd4a7a0c70780fd86fd 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -310,6 +310,7 @@ static void adp_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
 	u32 frame_num = 1;
+	unsigned long flags;
 	struct adp_drv_private *adp = crtc_to_adp(crtc);
 	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state, crtc);
 	u64 new_size = ALIGN(new_state->mode.hdisplay *
@@ -330,13 +331,13 @@ static void adp_crtc_atomic_flush(struct drm_crtc *crtc,
 	}
 	writel(ADBE_FIFO_SYNC | frame_num, adp->be + ADBE_FIFO);
 	//FIXME: use adbe flush interrupt
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irqsave(&crtc->dev->event_lock, flags);
 	if (crtc->state->event) {
 		drm_crtc_vblank_get(crtc);
 		adp->event = crtc->state->event;
 	}
 	crtc->state->event = NULL;
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 }
 
 static const struct drm_crtc_funcs adp_crtc_funcs = {

-- 
2.49.0


