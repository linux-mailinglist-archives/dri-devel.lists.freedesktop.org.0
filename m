Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD85BB93AC
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 05:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B02110E263;
	Sun,  5 Oct 2025 03:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="g2EQqQZN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PIn7AHXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C2F10E28F
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 03:04:39 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cfS1L16Tmz9v69;
 Sun,  5 Oct 2025 05:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/6HP2LMj8JCAqJOVED8UCY8qVCk/4Lg+7VAMfO1+zY=;
 b=g2EQqQZNha4pPK84mzxTIdoaHij5J7JMwX22Jnw6a/Lzei5N78jcSv+4Gux1N3ph17+9Mt
 drZJ2EnhcgExgXIFuH8TORYDbf1CVMB6pykVqfin9Fq+ABFkiCcyovH4AXYWKmj6S0M1G5
 xuLcJWUzutMkdV3y/MjcnvfLCl0e6sy8Z9hAl4iMinulvCVIurrVSwipXqTj+tJDbGwIbj
 WaJ9rTblliRbgts1HVf6bmlercfz32l29rd16pc7RmBVp7Qd2JI0/kjk4LUG1Couxho7r7
 J1HT/y6o9LGh9dwPvfoCT2dPe5F5n1p1vRe+B3NtPcTJ8zIceqPbtb6RbPFWFQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/6HP2LMj8JCAqJOVED8UCY8qVCk/4Lg+7VAMfO1+zY=;
 b=PIn7AHXgtMVJWkZAWbuh7bJxq+I4TifFZ/JflkkCp7hZXzSJn2A0o9iCVSrLDFnrO3sRRH
 k1QEP/FsUKiMtCr1jkXwt2pa0H5SVW886fxB6Q90vrPh46zZhfkibvFUJxHHaTQbRoObNV
 K5XJdHMYomHpJy068b7+74XzfMqaEgCRD44+oijbOe7I6aBjx/cVPW9DUfFoEHdYkWZu/7
 bQ/w4YVf/deQ8LFn///Q19+fjQkEpTLywc3fBPyupsEHage44HDs46R6yFPc66ilRSWuOf
 dChK/k3WTzAm8bPKkScNYHwm6RosegVJ0mv28hrrpz1/riwepJT6KrMnOtMr+g==
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
Subject: [PATCH v3 06/11] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
Date: Sun,  5 Oct 2025 05:02:53 +0200
Message-ID: <20251005030355.202242-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bf64a829cd71ee82fb0
X-MBO-RS-META: cib8fk77dg7sxabpiqn9nsgyfx911its
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
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 468f84cd1325e..7f74d597f4542 100644
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

