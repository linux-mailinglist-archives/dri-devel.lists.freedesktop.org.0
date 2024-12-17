Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A99F42CC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 06:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C324D10E18F;
	Tue, 17 Dec 2024 05:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T5eI+a/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14FB10E18F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 05:32:27 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 553C159D;
 Tue, 17 Dec 2024 06:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734413509;
 bh=DMH9kb64WnVAVtxcUTTPxPJIxU2uJoWDyUzVe2vOmFI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=T5eI+a/XeHqygFTSp1eTjC1h1MjoSV+okoXSXbI5obK3O2YpINnbreh6t3F0a9Nei
 rkCKxJdgFp9v0gaSMA4Ox4w1fi1p/TFsEKoEXTj97EeNB/iSaf+F0f18UK/EqAAi3J
 zH3LsmHWFSMkNeY8R7YVirvalEhpJaNy9UCsdKlU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Dec 2024 07:31:36 +0200
Subject: [PATCH v5 2/7] drm/rcar-du: Write DPTSR only if the second source
 exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-gh-dsi-v5-2-e77421093c05@ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
In-Reply-To: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ic1vAEEJzv9LWzHbe/oAaaiBIH9en2R++zJCqIckjhU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnYQzjAGyBquK3k4IKCnAtB031px74JdR4tOqxq
 AX6/rUnUkmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ2EM4wAKCRD6PaqMvJYe
 9T9wD/4wXxR0wurq9bCR2PwPA/9nJLMZ6+BKuoWaKWnzlgiXkaQdG6w6JeIClygju+QcpIHXAMv
 Q20zXbmgn0Xm2pkYhR/A9IncfleWIJGpWoJwlcrl+qfzvIDcOlIzijgz5FpK4sO2gm8LTBNmdUu
 hW8RHIr7Lq9VtchuUrFRfpDTYP0kCmsMjt49JN6inssQn9pW5CT0u41lU7XEyVdrO51yJq8lLCX
 ILGIi5yKoHh1dZCAxpdZ2QxP3zZrUlBxqxO12FcHhXdeSUi7CJiaYCEssO02vFM53qSo1WJJLR5
 he8i5scQOnW5eKStfOLCUwDGDyPbgpCYZEssCT9pgYHmcBWBpG1PCjVXktNxGT9uEhAHbYnSIrI
 URKI1WdSbtcPooTOGnC5YJ1PJVadc/gm1fEpHDosyRzr1SPDB+13zVxkVjtPzE/zaJShO1zOkNj
 NtHHVWm8voDp2Ae3b2XyspCZbiRJpdIpguAbnjrKqaseNgQuuOtkJddVagm+7SsxJnNjvnxY/mv
 8lG1+st9fg5NafqmDJ/PIurN03ReYSkaUrO/EpnwTQASV65f2LDh7PmT7GExbquLBuMq9NmDJ5l
 bIsR+wfPhXS2w3pw3efXsPvj75txCKPCyxjs93JxwO5jFIbtjLXxMad4A1jgftKDBoqunX5jAT+
 2SnMX9lL2zkkuMg==
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> # On R-Car M3-N
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

