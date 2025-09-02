Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362F1B3FAA3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4088C10E629;
	Tue,  2 Sep 2025 09:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D2QH6YhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F73310E62A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C5CAE60207;
 Tue,  2 Sep 2025 09:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0FDC4CEED;
 Tue,  2 Sep 2025 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805763;
 bh=ib72f7X+GiEiFcjy7r5QiSktmk8kg6DlyrSykY83WcE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=D2QH6YhSVJtfPx/HcPIcPT5AD0vkwPufkFroqxTTTZnhNzYwLYeLMg8qPp7N7F0u0
 D5rCZj3IHxo4R0e7wzDo7SEi/VyRycj8GNAoVujaHoEEj4gR6vDHGhnumPoHnQU2Wo
 e8oCZ68pEzVI2IjcXPHSKIKSNkTfqNkkWcDmA+14sY6wPCO8P3C4tAhX/RXzEzxVUb
 5jMwEMD6qf6Ooq78vlt9oRzBEmSInWij22F333Ty+FMhaunAYx0nJR+hCE6ubzzJdO
 edISpTJUizq2Kw2ZXDJBhXxNJASw007Y+ql8RPxTwSlo4BstwKEQS2OiFTRhGalolE
 XhQ/xGipaYNpw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:13 +0200
Subject: [PATCH v2 14/37] drm/atmel-hlcdc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-14-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ib72f7X+GiEiFcjy7r5QiSktmk8kg6DlyrSykY83WcE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgU2cRW8azl4ol6HLcbN4mq9tuMrQ8kbPw3NXka5J
 F1ivy3YMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZiqMbYMOnVbi8uwQRmprBt
 Voononbd/5NWIbnLVazJalrn7QlzJX0VEtvCWgU6TXT41TJ+Vycy1srdjlj5NbCMMyEokUflddc
 bs3ddzS/tC+42WCV5rd+poi0m2Ms0uTbrqIDkx5QKAenDAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The atmel-hlcdc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Manikandan Muralidharan <manikandan.m@microchip.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 4a7ba0918eca19eca3fd8febd1db1b2d3a8a6e14..59be5f64c058e2be398f207ad436f922135a5ad0 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -712,11 +712,11 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	int i;
 
 	if (!hstate->base.crtc || WARN_ON(!fb))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, s->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, s->crtc);
 	mode = &crtc_state->adjusted_mode;
 
 	ret = drm_atomic_helper_check_plane_state(s, crtc_state,
 						  (1 << 16) / 2048,
 						  INT_MAX, true, true);

-- 
2.50.1

