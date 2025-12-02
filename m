Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACADC9C8D4
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 19:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEDF10E185;
	Tue,  2 Dec 2025 18:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gSeTtQfD";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GMAl6Iug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D568210E185
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 18:11:55 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dLTPP4LQbz9tgG;
 Tue,  2 Dec 2025 19:11:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1764699113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EBsryGHsjEvpCjAGdhGXAoMN2k4lDIXQJdLz1QjyjZM=;
 b=gSeTtQfDLJgMJSYy5fct7Hzh+wqQW6BpijwXGW05wplV5vTU0o5q681mbtbaRf9/WX9jrC
 OSp6qEUeGJLeyjcA5wF7HtGFLAYaH2Y7Q9vSKuV2ij4CZhr8/D9xjFrQG/U/gZLkwrJ0hK
 7/FM9VWJjqNanq2SSGmmmcRQZd7gt9Vce+F5Q2ixIy52VXkfHKpCxgrWv6M9AwF+qwIjSJ
 RpWUriuOBFadMkqiMI8l+kdo8faz0FQC8bxsamVefYHp0UU4laJUxDVT1dpDU7NkfvbGaH
 I1Bs2LSSiW6S5IyS1sECcJlUGcwxxQccatLCcsaL83Gjr81uhdXCdmfkTiVQig==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1764699111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EBsryGHsjEvpCjAGdhGXAoMN2k4lDIXQJdLz1QjyjZM=;
 b=GMAl6IuguDKSNbO2XXYlmJMEeL73f5GOBTFCceS1dSDa7k2nCPSNb7xSbT42gjfg999f2G
 4oXIjONX7RbhP/RCa9FteXDx5PdIyJZDX0Dx4qy6REif8ZI7iLAXlAyt+Kq8sfPYLPYAYA
 EFaoKhtmErNC5gkGHSZ7dSm3Cv2xYOfUWZwh9B+FZW/ix5LjSI4xHAVjDwPH3ti9IpytQB
 QzWp9OelbRwQL6A/Mue/4diSXVkoCj6mGk0o4vbzBW2MjOfWA5Cc4usyUe1LBeZbGPMMV3
 9oMP2b/h2z+q740XB9Nd0V0uoMfmOWsSRATAjIid1JCbwjzSnFEmgWvamqDcHQ==
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
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
Date: Tue,  2 Dec 2025 19:11:06 +0100
Message-ID: <20251202181146.138365-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: cc4fad19151d24c1c54
X-MBO-RS-META: k5wofgypk36a1k5nz5a513dfahkf563f
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

Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
for modes which set neither DRM_MODE_FLAG_[PN].SYNC. The previous behavior
was to assume that neither flag means DRM_MODE_FLAG_N.SYNC . Restore the
previous behavior for maximum compatibility.

The change of behavior is visible below, consider Vertical mode->flags
for simplicity sake, although the same applies to Horizontal ones:

Before 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags") :

- DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
- DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
- Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW

After 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags") :

- DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
- DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
- Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= 0 <---------- This broke

The "Neither" case behavior is different, because DRM_MODE_FLAG_N[HV]SYNC is
really not equivalent !DRM_MODE_FLAG_P[HV]SYNC .

Fixes: 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
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
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Update commit message
    - Use only !P[HV]SYNC
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 9413b76d0bfce..4ef2e3c129ed7 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -492,9 +492,9 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 
 	/* Configuration for Video Parameters, input is always RGB888 */
 	vprmset0r = TXVMVPRMSET0R_BPP_24;
-	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
-	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+	if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
 		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
 
 	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
-- 
2.51.0

