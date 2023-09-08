Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF379900D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F4D10E940;
	Fri,  8 Sep 2023 19:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1C110E940
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 19:36:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C85EB821E6;
 Fri,  8 Sep 2023 19:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7DDC4163C;
 Fri,  8 Sep 2023 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201812;
 bh=SKtZBkIgwSXQzOLWVJokvcy5wPpU5mthvIS28XtE/xM=;
 h=From:To:Cc:Subject:Date:From;
 b=kIA9ZX0NCgdXM1uGRZE2RX9zlpVibn2dnVseF4IQ5qMqJrvs6TwqLJPcAXoSIK++V
 cgRy5frNykdjhmMHa7WHiIvAx5S14jekUsxMwxVRAnqYhleqhAxXznX+Z/kPyEMuIV
 Bjlfp55s7ZGi46B4QM2quETCC1izu2gW/hu4DgKGT9XFI+SIUKtipDFRhdUmiKdr2x
 mKxGw3uxJuaahZrfEDauD36CEJxKX9B23kvH9OBXlmGnVfN2kZJ/1QeqQOgGdqBS+L
 pnT1yTf0VDUjbulEQrWYzmuy3vNxdVkZcwGQ7pKGW6cQtqc/AiyKzBL5rf6v2khu9S
 FBbbaRV92L4Ng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 1/3] drm/exynos: fix a possible null-pointer
 dereference due to data race in exynos_drm_crtc_atomic_disable()
Date: Fri,  8 Sep 2023 15:36:46 -0400
Message-Id: <20230908193648.3464004-1-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.294
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
index 2696289ecc78f..b3e23ace5869c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -43,13 +43,12 @@ static void exynos_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (exynos_crtc->ops->disable)
 		exynos_crtc->ops->disable(exynos_crtc);
 
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

