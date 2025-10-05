Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FEBBB9394
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 05:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F403310E25E;
	Sun,  5 Oct 2025 03:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sBDJtRwL";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HXSTwMFC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019B610E25E
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 03:04:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cfS155KR2z9tqw;
 Sun,  5 Oct 2025 05:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ieUzL0ZqwGPJSNXtvGau32160fqSBwmeagMbv4mIMzU=;
 b=sBDJtRwLoNyjVDqMreJicjDo/ef40UvuAzSYo8z1uzXXd81WCi6JBMv5CQiN/Kz5FZ14ke
 4lwpw4J/Y98uNSxDP7zfX4MYudmQA1gD0bGMDPb8zQvQapHxbdK0aTM9ajdkM6iPAKljGV
 mcQ9JIj7UVfM54i+UxMDftvPrCsWZ+WZneGt9qgO31IBiFZXkPBcdgXIKz/1fnm/bZGUq8
 PwO6viVM0nC4+07++/LdZGHAK72GRcwfnVYGKIpSXExmWYZEfBKn0Ai+P/E8Al0/WaDE7g
 vSynWvkywvxe8YO8r65xT7FUcCOhzNfk13Relwodx4PoDqoOI2zr5Ui909kK+Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ieUzL0ZqwGPJSNXtvGau32160fqSBwmeagMbv4mIMzU=;
 b=HXSTwMFCMXhdneJSfHNHW6YZWRNMkjgpKjSqOiUmmWRW7Q7RfuUls1DULxP9rvUQ3Vx/jX
 a7k5lSKgL31WqUxFC4LLNlb1oP9oItV9+47SSJAsLja591TZbk3kHVPwMjfNJGxOjEcX5s
 0edHX9e+yhERjG9aAILK3/eVDJAgmjH8g6EUOR3Hl2GyI+PYHVUG6ghQxRPnfqwPqfYyD3
 kGCdQc0kYcS6VO60k6CTRs34daPFQsY0Hd9swxLwWNT4sAt614jFzwCyHCIFohNT3Vofsk
 88RMDtRaBD0HbtRrYPTE3nlVFGg8j8bf5oder6Q3TWz/tKH+iDCP3sWllVIlOg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 01/11] drm/rcar-du: dsi: Fix missing parameter in
 RXSETR_...EN macros
Date: Sun,  5 Oct 2025 05:02:48 +0200
Message-ID: <20251005030355.202242-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: eydu4sawuqiyj3t94ycaureig7zkc3uw
X-MBO-RS-ID: e7f1be54aff2eba6419
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

The RXSETR_CRCEN(n) and RXSETR_ECCEN(n) macros both take parameter (n),
add the missing macro parameter. Neither of those macros is used by the
driver, so for now the bug is harmless.

Fixes: 685e8dae19df ("drm/rcar-du: dsi: Implement DSI command support")
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
V2: Add RB from Laurent
V3: No change
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 76521276e2af8..dd871e17dcf53 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -50,8 +50,8 @@
 #define TXCMPPD3R			0x16c
 
 #define RXSETR				0x200
-#define RXSETR_CRCEN			(((n) & 0xf) << 24)
-#define RXSETR_ECCEN			(((n) & 0xf) << 16)
+#define RXSETR_CRCEN(n)			(((n) & 0xf) << 24)
+#define RXSETR_ECCEN(n)			(((n) & 0xf) << 16)
 #define RXPSETR				0x210
 #define RXPSETR_LPPDACC			(1 << 0)
 #define RXPSR				0x220
-- 
2.51.0

