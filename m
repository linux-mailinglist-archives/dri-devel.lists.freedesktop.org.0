Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B7367195E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 11:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8F610E708;
	Wed, 18 Jan 2023 10:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AFA10E540
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 13:52:17 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6323410C;
 Tue, 17 Jan 2023 14:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673963535;
 bh=9zJMA+T0kpeqlThAXlVjsVpNsaP+x+3i5UuNerWj0QE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fra4FbYR8Z+i/rXDTefhCcOYvEUfLfOiIWvx8SYJwsOtgVoQTc8hLGGMl3ZE0IMlM
 l9r9dba8UjK92pMy6WZzt8gwgP6a3StgrSruu1r/hk4OAYdaM3IodPhvrUV7bR9os8
 G7n5zq4tW1jbnsKBMoBTPRuGKUtuYqYSpxttmuWg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/6] drm: rcar-du: Fix setting a reserved bit in DPLLCR
Date: Tue, 17 Jan 2023 15:51:53 +0200
Message-Id: <20230117135154.387208-6-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Jan 2023 10:42:12 +0000
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On H3 ES1 two bits in DPLLCR are used to select the DU input dot clock
source. These are bits 20 and 21 for DU2, and bits 22 and 23 for DU1. On
non-ES1, only the higher bits are used (bits 21 and 23), and the lower
bits are reserved and should be set to 0 (or not set at all).

The current code always sets the lower bits, even on non-ES1.

For both DU1 and DU2, on all SoC versions, when writing zeroes to those
bits the input clock is DCLKIN, and thus there's no difference between
ES1 and non-ES1.

For DU1, writing 0b10 to the bits (or only writing the higher bit)
results in using PLL0 as the input clock, so in this case there's also
no difference between ES1 and non-ES1.

However, for DU2, writing 0b10 to the bits results in using PLL0 as the
input clock on ES1, whereas on non-ES1 it results in using PLL1. On ES1
you need to write 0b11 to select PLL1.

The current code always writes 0b11 to PLCS0 field to select PLL1 on all
SoC versions, which works but causes an illegal (in the sense of not
allowed by the documentation) write to a reserved bit field.

To remove the illegal bit write on PLSC0 we need to handle the input dot
clock selection differently for ES1 and non-ES1.

Add a new quirk, RCAR_DU_QUIRK_H3_ES1_PLL, for this, and a new
rcar_du_device_info entry for the ES1 SoC. Using these, we can always
set the bit 21 on PLSC0 when choosing the PLL as the source clock, and
additionally set the bit 20 when on ES1.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 12 ++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  3 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h |  3 ++-
 4 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index f2d3266509cc..8d660a6141bf 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -245,12 +245,20 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		       | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
 		       | DPLLCR_STBY;
 
-		if (rcrtc->index == 1)
+		if (rcrtc->index == 1) {
 			dpllcr |= DPLLCR_PLCS1
 			       |  DPLLCR_INCS_DOTCLKIN1;
-		else
+		} else {
 			dpllcr |= DPLLCR_PLCS0
 			       |  DPLLCR_INCS_DOTCLKIN0;
+			/*
+			 * On H3 ES1.x, in addition to setting bit 21 (PLCS0),
+			 * also bit 20 has to be set to select PLL1 as the
+			 * clock source.
+			 */
+			if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PLL)
+				dpllcr |= DPLLCR_PLCS0_H3ES1X_PLL1_SEL;
+		}
 
 		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index ba2e069fc0f7..d689f2510081 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -394,7 +394,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_es1_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
-	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY,
+	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY
+		| RCAR_DU_QUIRK_H3_ES1_PLL,
 	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index df87ccab146f..acc3673fefe1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -35,6 +35,7 @@ struct rcar_du_device;
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
 #define RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY BIT(1)	/* H3 ES1 has pclk stability issue */
+#define RCAR_DU_QUIRK_H3_ES1_PLL	BIT(2)	/* H3 ES1 PLL setup differs from non-ES1 */
 
 enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD0,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index c1bcb0e8b5b4..94d913f66c8f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -288,7 +288,8 @@
  * isn't implemented by other SoC in the Gen3 family it can safely be set
  * unconditionally.
  */
-#define DPLLCR_PLCS0		(3 << 20)
+#define DPLLCR_PLCS0		(1 << 21)
+#define DPLLCR_PLCS0_H3ES1X_PLL1_SEL	(1 << 20)
 #define DPLLCR_CLKE		(1 << 18)
 #define DPLLCR_FDPLL(n)		((n) << 12)
 #define DPLLCR_N(n)		((n) << 5)
-- 
2.34.1

