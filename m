Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D946B97E2D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 02:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C2710E676;
	Wed, 24 Sep 2025 00:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Ohdo7pd6";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZJhHTOeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F5210E67E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 00:30:40 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cWd6k4jw9z9tCh;
 Wed, 24 Sep 2025 02:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758673838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KyswbkBmb0yEMFf/4z6dAe9yUwauwF6vMhdUoBUPfbM=;
 b=Ohdo7pd6k+kljbTo10wBx2ZqzywtXKUPXIjbzr5q8BM/1WncUnZVwM8VIc27+Ga+aS3+Oa
 DdaW3DZo/9uiBdKuCTXAr8jsw8+a9YD+akWMCLImSX0yxZUaQSID816pIKUjNR7ZCBZ0IJ
 BgFobVNZDBfzEhz+YbE9JZU2DFjWjfy7+9mlCVd7S0jWTdgemT5hAx2bP94fbWOtvwhbsT
 nJ1hclThyXi7ttW/M5VKsnrlxL8+f6wkMhNaoOj0SEovCVP/QwV71wUPvKaxnXKn01K5nF
 RXBBRtnR5JiQLVYRqahOVPkaIG+TrXs7LKwG9/iVC9BtL94ctoQxATL/zeh6mw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758673836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KyswbkBmb0yEMFf/4z6dAe9yUwauwF6vMhdUoBUPfbM=;
 b=ZJhHTOeZB9ZoVxxN3f+04IBcKTA5NVzvPYBawwN7wRRbhzMOzTPmXqeptAPBrlFMOBnehA
 OstY1LbwbqyVDPaSQ0vXO8u+mfPg729XX0ClTsgv7fdVzcQ8tTP80tMc9hzIuuht3CKE2W
 h1C0mFXqVWtUtjpFx5XiY65kEZOpV7w2MB/zTUsAqhpXpeLC8CbdQvQZPrCMgtDjCIdFfF
 i+zQ9nYQBrKzUm83arfcCxqmqTj4otXoCfu34h2z669gmDNMDHjsmLp0EHDxIfUdTBupFG
 IGm6EKIfyewauUrho9dclGwdoRtRqrD+bHNg6kaA/MFBueDX0vc1GirZIaOWPA==
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
Subject: [PATCH v2 06/10] drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
Date: Wed, 24 Sep 2025 02:28:23 +0200
Message-ID: <20250924003003.91039-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1eqsm63cjp7n67gdbarnrdotqa64ir9k
X-MBO-RS-ID: 1601bec5652aaa3bbcd
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

Introduce TXVMPSPHSETR_DT_MASK macro and use FIELD_PREP() to generate
appropriate bitfield from mask and value without bitshift.

Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
consisten with the current style. Conversion to BIT() and GENMASK()
macros is done at the very end of this series in the last two patches.

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
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 850f8e214a964..7c828f46cbb76 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -168,11 +168,12 @@
 #define TXVMSCR_STR			(1 << 16)
 
 #define TXVMPSPHSETR			0x1c0
-#define TXVMPSPHSETR_DT_RGB16		(0x0e << 16)
-#define TXVMPSPHSETR_DT_RGB18		(0x1e << 16)
-#define TXVMPSPHSETR_DT_RGB18_LS	(0x2e << 16)
-#define TXVMPSPHSETR_DT_RGB24		(0x3e << 16)
-#define TXVMPSPHSETR_DT_YCBCR16		(0x2c << 16)
+#define TXVMPSPHSETR_DT_MASK		(0x3f << 16)
+#define TXVMPSPHSETR_DT_RGB16		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x0e)
+#define TXVMPSPHSETR_DT_RGB18		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x1e)
+#define TXVMPSPHSETR_DT_RGB18_LS	FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x2e)
+#define TXVMPSPHSETR_DT_RGB24		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x3e)
+#define TXVMPSPHSETR_DT_YCBCR16		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x2c)
 
 #define TXVMVPRMSET0R			0x1d0
 #define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
-- 
2.51.0

