Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B509E6A28
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DEE10F04E;
	Fri,  6 Dec 2024 09:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P/wC+9xs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627CF10F04C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:33:23 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A66FBB2B;
 Fri,  6 Dec 2024 10:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733477573;
 bh=ew3Muv7MPQxqUGbM+KoQnCxBlFs7GGorAf6A+5Mac4g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=P/wC+9xsgr9Fyi4jwZfuFlhGQtuAzK9Yh12mW3YFj50GGwNHbvA5pqgR4Qd5ajIKv
 pSf9VoqoVAKUSGC7LgwtpDH6wFuKfTp5+kAVHN/IdrPz280Y57D2rAntLBOFV85g8/
 D74Pii0SyeMMQboWCszguT4I2Zk/4cvPJx5sxWD0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 11:32:35 +0200
Subject: [PATCH v3 02/10] drm/rcar-du: Write DPTSR only if the second
 source exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-rcar-gh-dsi-v3-2-d74c2166fa15@ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1836;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=WgJUjyHVjpUZhqroUVXkYdZsN54pZDvBuc2FAqHU/bw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUsTZv+lZt+VI6OjQT11qyLdJQuLRoD9mE8aB8
 mMuGoSQQ0eJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1LE2QAKCRD6PaqMvJYe
 9fXSD/9f0Yu01vQPEZbGCiuzab8N0z2dogT/6nBDhwJAES4+i4dJFYxOworNw2WnibQg5uN+tKz
 kvxJIpOWap7b+7myvlxDsxAn4gthYQ0d8rlGDwy9R9OVQTVHjxD7KGMV3O0oKVpZAY78CJ7xKO3
 A5bc6bccKdjEVNxnGZWLoKz/zWLo6XSJBxp0eKvPgQGBCJ6t8PgGxs71sXjGMzfUsaWyRnjViom
 l2wlnWiHF5O+Nh4yiR7DqknrlnsRjfR+sdwJjr+Q7QYbMOLgQSZiPaOry5FsDOunpDvxcDA+pk0
 oveoe2CEEp23uJ/6GdYeqidSbKwfS7JYCkfQlayevhSZxs15kl++M6R23HEuYm6xeXxC2WDkIMH
 YXHARQLivF8daMPgqH+vlpLXjGoikPGUc1InV5AR2kl/bMrq+ekoYvifPg1IEKKFKEwI3lLrNMq
 yw7HdaZnX1bYr4mhHjGGScXQnjDS6ASsn9xYD0TvkvlCPWRGC2haEG/YEV2e7O9YWgxkWlwtuE8
 uKaMGsh2C/KNtl7h2p+osnYybrdW5qAwsJLYZeW6Y4hkF4BqKnmva0P3zQWB1AlUN3bP6BQaKTp
 9HoS8m6NQmA55hICx62WAMRw1yA/FSAiJ4Wzh7gcSKamVKIyYJCB5HoK+QqKEDhTlrpOCZz58y6
 yr/hWBws6zkXuaw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Currently the driver always writes DPTSR when setting up the hardware.
However, writing the register is only meaningful when the second source
for a plane is used, and the register is not even documented for SoCs
that do not have the second source.

So move the write behind a condition.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
index 2ccd2581f544..1ec806c8e013 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
@@ -185,11 +185,21 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
 	rcar_du_group_write(rgrp, DORCR, dorcr);
 
-	/* Apply planes to CRTCs association. */
-	mutex_lock(&rgrp->lock);
-	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
-			    rgrp->dptsr_planes);
-	mutex_unlock(&rgrp->lock);
+	/*
+	 * DPTSR is used to select the source for the planes of a group. The
+	 * first source is chosen by writing 0 to the respective bits, and this
+	 * is always the default value of the register. In other words, writing
+	 * DPTSR is only needed if the SoC supports choosing the second source.
+	 *
+	 * The SoCs documentations seems to confirm this, as the DPTSR register
+	 * is not documented if only the first source exists on that SoC.
+	 */
+	if (rgrp->channels_mask & BIT(1)) {
+		mutex_lock(&rgrp->lock);
+		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
+				    rgrp->dptsr_planes);
+		mutex_unlock(&rgrp->lock);
+	}
 }
 
 /*

-- 
2.43.0

