Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C01C175E5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4589B10E6B9;
	Tue, 28 Oct 2025 23:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="IzLGcl2M";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hKnahk9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723B410E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 23:30:26 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cx67524Ydz9tfy;
 Wed, 29 Oct 2025 00:30:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvmhS12yV0tYbka+oyxO7DVm7E88kXnreRFXISkd+F4=;
 b=IzLGcl2Mk58ws6D3Btsx55udpoKFjPwlKDrld927cn5i1aT8YmyDZ0/Y3+nqxXS2xtT11D
 AFwcOC2jLXrUNgl0wHaWyhmlIwxaCGKpfWsc6ZBsdzjWfTpQykc39F+UWDUzBny6kN6BHP
 Ia6Vy+c/LMK19xbQt0JkSZJWpsgzkJKh8c88x6Feh+ka7OzzA0QtmfC1cFfi0NfPwx2glc
 MmVf9Ul1edxq1W9PL/atzHODskyrhbJdbfFhcpf5Q4hEOdmK+ZlOL+cF0Qkt8OtzVZK0T4
 CQgr7T4aFXaHAxAbTro44aZozsCmNDTSJNlTFk+i7sNMoDG/oKBdWXpZPvZLvg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvmhS12yV0tYbka+oyxO7DVm7E88kXnreRFXISkd+F4=;
 b=hKnahk9OCWZ3oNAIoyaoRQNGhBsFf/8fzAFMkKxYkAXioFlskXUwzgeMrfYj6+ztEKt9oK
 hlVLv7c2UU1mIdk06fZLCTEak12FNWg3mQvTcEGbbD1TLDMF0h5CMft4zW/PRAf6Z5vzyH
 jaRxZ9QHB3nfsc4W2nKdIK9voRdkTRF+xTtyCtqk/ZT76nP/7+xwHXaR949GVVu39Va/53
 Dkb1z2yMdy4AHy/CyMcGUvJATNAfyKChl2HgTfehYPQOtMoPf1ATDBWl3Cin71xh6GByke
 irJ7EWr6lNF+8rHh1zBmj6CXvjwbtPDocSJ5PekXwxLdsvCrQdLt1IAzffedWQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 05/11] drm/rcar-du: dsi: Clean up VCLKSET register macros
Date: Wed, 29 Oct 2025 00:28:15 +0100
Message-ID: <20251028232959.109936-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 43dx7urdeokneh9zdbogban7hm59ueuz
X-MBO-RS-ID: bb25bd0de68b17c2c6e
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

Introduce VCLKSET_BPP_MASK macro and use FIELD_PREP() to generate
appropriate bitfield from mask and value without bitshift. Remove
VCLKSET_COLOR_RGB which is never used, replace it with code comment.

Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
consisten with the current style. Conversion to BIT() and GENMASK()
macros is done at the very end of this series in the last two patches.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: No functional change expected, this is a preparatory patch which
partly removes macros which evaluate to zeroes from rcar_mipi_dsi_regs.h .
The other patches in this series proceed with that job, piece by piece,
to make it all reviewable.
---
V2: Move FIELD_PREP() back into rcar_mipi_dsi_regs.h
V3: Include linux/bitfield.h which contains the FIELD_PREP() macro
V4: Add RB from Tomi
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      |  4 +++-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 12 ++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index e13249e0134b4..f6427476feb72 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2020 Renesas Electronics Corporation
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -624,6 +625,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	vclkset = VCLKSET_CKEN;
 	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
 
+	/* Output is always RGB, never YCbCr */
 	if (dsi_format == 24)
 		vclkset |= VCLKSET_BPP_24;
 	else if (dsi_format == 18)
@@ -635,7 +637,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 		return -EINVAL;
 	}
 
-	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_LANE(dsi->lanes - 1);
+	vclkset |= VCLKSET_LANE(dsi->lanes - 1);
 
 	switch (dsi->info->model) {
 	case RCAR_DSI_V3U:
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 62341416ac6e9..2db3dda030dbe 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -246,14 +246,14 @@
 
 #define VCLKSET				0x100c
 #define VCLKSET_CKEN			(1 << 16)
-#define VCLKSET_COLOR_RGB		(0 << 8)
-#define VCLKSET_COLOR_YCC		(1 << 8)
+#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */
 #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
 #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
-#define VCLKSET_BPP_16			(0 << 2)
-#define VCLKSET_BPP_18			(1 << 2)
-#define VCLKSET_BPP_18L			(2 << 2)
-#define VCLKSET_BPP_24			(3 << 2)
+#define VCLKSET_BPP_MASK		(3 << 2)
+#define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
+#define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
+#define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
+#define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)
 #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
 
 #define VCLKEN				0x1010
-- 
2.51.0

