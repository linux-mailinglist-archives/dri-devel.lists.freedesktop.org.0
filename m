Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C409F0E42
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 15:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0020D10E43C;
	Fri, 13 Dec 2024 14:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ag8Arc1p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECCB10E43C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:03:20 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B848DA98;
 Fri, 13 Dec 2024 15:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734098565;
 bh=DMH9kb64WnVAVtxcUTTPxPJIxU2uJoWDyUzVe2vOmFI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ag8Arc1pFKN30PWkrzX+IlYvjku0c2AyhB8dCtZiIU6Ftsa4r/4+1WXVPFOcE59Ry
 RGxPdef+j9vpwy/cGBQID+Ji0L1nOLni+g4CAjPLsp1NYVwWFwGPjCTypvjfYlBhaE
 2T9//HjJqsMGuqePv8DNwKHNQpw/2h/co63YL4Vs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 13 Dec 2024 16:02:58 +0200
Subject: [PATCH v4 2/7] drm/rcar-du: Write DPTSR only if the second source
 exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-rcar-gh-dsi-v4-2-f8e41425207b@ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
In-Reply-To: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnXD6g+uCaGXeD3HQSWg6+b2hXl45qtMbcLQ3hR
 bpjtYagp/WJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1w+oAAKCRD6PaqMvJYe
 9cIKD/9WA2btSlpmORr/DIwmTGaCGpjc5dayuUbBHZzNKFufCjEzN6k3DsHbZikaXb0d45qT8ff
 FDfX8eL7RSsih0AwoBmeCYqLlRW4oegCJ4spZ7ou1sDBfPAyf9nrlNFXiZuo4zOTbA17jz8JvFb
 uYdfJaTdKwFuuMoLlOZ+ZGnimsDNyu+wV1g3VObPF5t0Gn7Bq9R87XDQof6KQCtuO447QaF9zzU
 s8gXz8BDH3SDDK09DRLjzuUpJ9Vl+rUsTlkKFP3oyM5MGONl+NV5ujx/IGQ2BVkWS6QhjbTBz6Y
 JFDUTWXBoRkvurU1Qkh3JWHOrMtNDydPnUvc9Zrq/dHcNxcDH/U7J4j3wWH1rLFse6+EhmiFTmv
 ykNFB0UyPcVe3jIPNkyu5UY3MYXuCvip9tJasYoEO+viwbjlU3AmZiyEKZZz1Uae5M10GX8dgbV
 c2DvJ1BE/56nzxTgEJfg+fncyUcClbk/IlBhqJgEixWW/78bFsTnwjv0cCpKggoPyxBggVSx6ut
 baZTD4/mU0ysVx2yLF88Q7+gczC82GPc0KY6wBK8Jsy3n8xCnnTEhdAtOaPZSzUNIvwVCcwC+AK
 Q324Mlf/os76A9W0O4xSbH3aKKesahgNkz6dzGREzaV7qDCzOSMdEAzmhqLAyWyXGISQVCmj3d/
 5xsHtjCSyB2tahw==
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

