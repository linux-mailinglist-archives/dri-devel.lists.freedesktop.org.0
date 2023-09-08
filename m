Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9965798FF5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB79610E93C;
	Fri,  8 Sep 2023 19:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACC510E93C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 19:36:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE32AB821E3;
 Fri,  8 Sep 2023 19:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE63DC116AC;
 Fri,  8 Sep 2023 19:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201764;
 bh=QPi7U8LFYJTn90nKMCS6rP5mjt7sQN4sOXteL2xyPXs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O1uHufAtlkVT1FFKadlGCpohELQlG0cNvfJJcW6R8rx0Dor/lTTDj3soF6zV8SsUZ
 k/Mv/gKxO9OVvf1gusudCKX62ugE5EMFfYA/eK94IF3A3SNuRRt0KVSQdNhmZ5HYbC
 Pvu7EkmgUi47FWZo/8+zY5bifLocbKdLjLjrMfoPxe1Jk0wgVS6eil1kMQ3gxAhrAt
 hzf0KTvf+5HSZCxGMyLXRMBTrKnbUPFqpRkR9UkpjQsqCL2CCqOaFua4hVMpFJy/nk
 o1aKJ/15ynmymdvgfDaxQiP52Qx8X0qByFmH53svGJVpFsP953plBO8Z/2WEXyPNJV
 m4isdac9l8+gg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 10/13] drm/exynos: fix a possible null-pointer
 dereference due to data race in exynos_drm_crtc_atomic_disable()
Date: Fri,  8 Sep 2023 15:35:26 -0400
Message-Id: <20230908193530.3463647-10-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193530.3463647-1-sashal@kernel.org>
References: <20230908193530.3463647-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.131
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
Cc: Sasha Levin <sashal@kernel.org>, linux-samsung-soc@vger.kernel.org,
 BassCheck <bass@buaa.edu.cn>, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Tuo Li <islituo@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tuo Li <islituo@gmail.com>

[ Upstream commit 2e63972a2de14482d0eae1a03a73e379f1c3f44c ]

The variable crtc->state->event is often protected by the lock
crtc->dev->event_lock when is accessed. However, it is accessed as a
condition of an if statement in exynos_drm_crtc_atomic_disable() without
holding the lock:

  if (crtc->state->event && !crtc->state->active)

However, if crtc->state->event is changed to NULL by another thread right
after the conditions of the if statement is checked to be true, a
null-pointer dereference can occur in drm_crtc_send_vblank_event():

  e->pipe = pipe;

To fix this possible null-pointer dereference caused by data race, the
spin lock coverage is extended to protect the if statement as well as the
function call to drm_crtc_send_vblank_event().

Reported-by: BassCheck <bass@buaa.edu.cn>
Link: https://sites.google.com/view/basscheck/home
Signed-off-by: Tuo Li <islituo@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Added relevant link.
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 4153f302de7c4..d19e796c20613 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -39,13 +39,12 @@ static void exynos_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (exynos_crtc->ops->atomic_disable)
 		exynos_crtc->ops->atomic_disable(exynos_crtc);
 
+	spin_lock_irq(&crtc->dev->event_lock);
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-
 		crtc->state->event = NULL;
 	}
+	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
 static int exynos_crtc_atomic_check(struct drm_crtc *crtc,
-- 
2.40.1

