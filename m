Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27645C41E7E
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3C610E0A2;
	Fri,  7 Nov 2025 23:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="k3zgUdcj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="txLJF6+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E416110E0A2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 23:04:27 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d3F4V1sJPz9tky;
 Sat,  8 Nov 2025 00:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762556666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KOA+hwUJRwzGvUxdumSct2dsv0UMU4LHAXdtncVDhPY=;
 b=k3zgUdcjTWMufyhpZdoohbSuZZXkg2ba4gDJIKdoVlk+2tvioFukLLbqgM2+VHccTRKDSQ
 z7LkFT15ZeZ34mAhOM8wbNkj6xwy88FAXvPmKeEsl48YEW3lha8t6xc7V3DbHyjr7nCT9p
 0TpWURIDfInM1LzsB6+sf3UIR7vo4q5lrs7JTuytvNxWFrOa/h/CvSpBRWtc4vGIHBmfSN
 3oAfjFpQIcU0FTvdOnj21T6A92aqbRUdWEo4YZvqRS4kI9hiaY1DNYEIr+He/ZMTVs67Le
 bk1sEm09DCSVIc8+0EYw1fUYX/8kyWKJDuIununGA+z14YxQQat6Kttl0XNgYg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=txLJF6+K;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762556664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KOA+hwUJRwzGvUxdumSct2dsv0UMU4LHAXdtncVDhPY=;
 b=txLJF6+K7WeSnsTLyO1Bnh/teX0M9Be8jRJ91wOv7t09SOyBGl/sTWhw8YWYfgu1+b/tIY
 6jQE2o+jmYHb5QFwDmrqHXiH09Xru/VuncngabvOxgPRlZ4EXdIizeCe4w0Z0YNfssqYBQ
 cLas0AQeX43GWvW/rNAH4WQ9x2XI8LJ5IGihWLS7iCjLstpIQd8UZfEXBG0ar6vetEDnN4
 Z7kFLYzYEWLocr3z0IJkFeGsrFuGu1VP37ICjmNXchXNEXzqBCnY1m93FChG+Um8Li0dFX
 8TcD9niFTRmqHiQ5W1E9ob9Na8qNyCVmSswyEjTiGKPTVEFWOE8sRWPDT1UAgg==
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
Subject: [PATCH] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
Date: Sat,  8 Nov 2025 00:04:10 +0100
Message-ID: <20251107230419.471866-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2e5fe89e8ece91143de
X-MBO-RS-META: 7qbcnczhz7r1s9zthm5qjinkkzpqtb6s
X-Rspamd-Queue-Id: 4d3F4V1sJPz9tky
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
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 9413b76d0bfce..98bd7f40adbea 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -492,9 +492,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 
 	/* Configuration for Video Parameters, input is always RGB888 */
 	vprmset0r = TXVMVPRMSET0R_BPP_24;
-	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
+	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
-	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+	if ((mode->flags & DRM_MODE_FLAG_NHSYNC) ||
+	    !(mode->flags & DRM_MODE_FLAG_PHSYNC))
 		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
 
 	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
-- 
2.51.0

