Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9402DBB939C
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 05:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D738A10E262;
	Sun,  5 Oct 2025 03:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ekIZwRW3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nE0O1RZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BD110E261
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 03:04:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cfS1C5vbjz9vRF;
 Sun,  5 Oct 2025 05:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iR6e/Gy9+5YXYLTCcLf4dQLvQYdCvAYqqU5EbxqJyaI=;
 b=ekIZwRW3vcx1q1KIKH0La3SZS08n/rPt2jqDcUDrVUvYKMjGoCCI1shjpq+kbnxVzpD43n
 +qXZZ3s7igBHi/kcWk6A9Xqh40FJXQupWCrndqQ2lzGzJYFt75jgGs27UdhXK4LgLWeLE3
 kO6SaBGRZ8HARMVIiO//ZB87tf63QGA23l+lIzpk8B/IXfhJTkBkq/w+4NypJss6U7gg7J
 GSmedL3RV2JoI7kiEMPZn24XJVMDAiJQeyx95qOGSkpsibP4nw/7ISJbBTNU7YyKkf3Sk8
 ++5KvzRIIS4+/4Lu6akTAH/oMOoaOnkYrHzAzWe2syfszWPrW+5tnRY5gJiTMQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iR6e/Gy9+5YXYLTCcLf4dQLvQYdCvAYqqU5EbxqJyaI=;
 b=nE0O1RZ7mjfvU3icb+BTZqXlNusVOsAjPb3E1B7/MrS137pWTZFkO2Eo7uG2g+4Djp1m9x
 ayI3RyG+rn1nM+rXhbCXCdzso7z/eNWw7ZeS0OjxFYJdIa2blWgKoPJ45p5paLecAKvA6o
 i4NWoMsoqvnk42ZznkJbTh+h3Kh/Ak8XIOd7a+9d0K2ez1fbTlToYDWVuBwlYYoHRLLSAr
 4hQmxYNquiJ4OFxWRNHJ2xTZHJjU1JkBv7E4DMzstl3JcwV7MO8ewCRE9etvygNxgVbdKr
 4UuuKYHY0bFgwKctn6HmX2nKwJMgKQGExzSnM/pBub4SbUBYzmm9rN0SaGKYdw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 03/11] drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
Date: Sun,  5 Oct 2025 05:02:50 +0200
Message-ID: <20251005030355.202242-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 48ce8a9f4538b47f0d3
X-MBO-RS-META: x5a961fxbf4yb6tqrhcagoaqxuruwjqt
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

The register PHTR bitfield TESTDOUT is not a single bit, but a
bitfield. Add a MASK macro and a _TEST bitfield value, which is
used by the driver to poll for completion. No functional change.

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
V3: New patch
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 4 ++--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 5c73a513f678e..c24721a1eddf2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -316,8 +316,8 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
 		WRITE_PHTW(0x01020100, 0x00000180);
 
 		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
-					status & PHTR_TEST, 2000, 10000, false,
-					dsi, PHTR);
+					status & PHTR_TESTDOUT_TEST,
+					2000, 10000, false, dsi, PHTR);
 		if (ret < 0) {
 			dev_err(dsi->dev, "failed to test PHTR\n");
 			return ret;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index b8a719a13c006..90e8e3de3e580 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -293,7 +293,8 @@
 #define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
 
 #define PHTR				0x1038
-#define PHTR_TEST			(1 << 16)
+#define PHTW_TESTDOUT			(0xff << 16)
+#define PHTR_TESTDOUT_TEST		(1 << 16)
 
 #define PHTC				0x103c
 #define PHTC_TESTCLR			(1 << 0)
-- 
2.51.0

