Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F450C175BB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A38210E6AF;
	Tue, 28 Oct 2025 23:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="B+hmNbGc";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xRycNojP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D7410E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 23:30:28 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cx677329Qz9sdH;
 Wed, 29 Oct 2025 00:30:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMaIpUecocOjsLfAR0nfEZI2kBRTw7IkDkldInn0pFE=;
 b=B+hmNbGcAHZv3JAbxpp58lqueaj4a6F5Jz3XaDd2WBfCXd0NNJexCcoOtj4Xpj4wrBZ/js
 OppPZu2EBTlnaLX5192YD8V/mPtUhZ3mx3c7J2aVBxVz+YUMkpN2CJ7RCqkVKDP/rGQqUQ
 YiB3hEa7yjsFKN2hxl2zDNc7md7dqJyDiSCSZap9q9qMaYaYXyI1SP9eIw1pUfz/oK0c1m
 IVA5ixJHT2lWp/+S9a9VrtEAxRMCykHINToiUpE2L6e0eUHRsFb3GM7dsA4+vEGH6BdqgV
 KykRruTcedsEWfm8wC3A560olDv0/WgwUqGat1HJnZSQCJMWRHWtazwzJL6mVA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMaIpUecocOjsLfAR0nfEZI2kBRTw7IkDkldInn0pFE=;
 b=xRycNojPGskVdGjBaR4HJVndQk1C/Z1akrydf/9LWwUpxVITOip/1YXdzpDw4UkzXTf4mX
 GaiZ5Cz5iSfFt+jLG7V/p4U7oQ1MotCglpXxIAZst8hYJxN/Ysfq400XzxkhZyAKnPAdIs
 m8d0WjAK301bjDfx5VRhdrQkfhbTSBQzi4VgHagkWdRpA9fiY4EfVKIHC//+si86+X5tne
 Riv+8BMc8lqY2LTALPWK2K7XxbwLiddq7IEJb7tTSJRJE8EcpiYyJgubDc1zEor+fx5Hmc
 eLKa+1K4kjj4fK6yfoxM3+K8mEGMdzGGADAQeFnOVJ5J6vUf0D3QkPsXPCSNlA==
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
Subject: [PATCH v4 06/11] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
Date: Wed, 29 Oct 2025 00:28:16 +0100
Message-ID: <20251028232959.109936-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: dtagfiqoyz1j57cq3opz3q75ibqfaudf
X-MBO-RS-ID: 15b3d90dfba7dde2a20
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

Introduce CLOCKSET1_CLKINSEL_MASK macro and remove bitshift from
values to make this bitfield usable with FIELD_PREP(). There are
no users of this bitfield, hence no updates to the DSI driver.

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
V3: No change
V4: Add RB from Tomi
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 2db3dda030dbe..44220c7112315 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -269,9 +269,10 @@
 #define CLOCKSET1			0x101c
 #define CLOCKSET1_LOCK_PHY		(1 << 17)
 #define CLOCKSET1_CLKSEL		(1 << 8)
-#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
-#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
-#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
+#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
+#define CLOCKSET1_CLKINSEL_EXTAL	FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 0)
+#define CLOCKSET1_CLKINSEL_DIG		FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 1)
+#define CLOCKSET1_CLKINSEL_DU		FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 2)
 #define CLOCKSET1_SHADOW_CLEAR		(1 << 1)
 #define CLOCKSET1_UPDATEPLL		(1 << 0)
 
-- 
2.51.0

