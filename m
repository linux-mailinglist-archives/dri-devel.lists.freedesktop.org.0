Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133F08D7075
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 16:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA1610E0B1;
	Sat,  1 Jun 2024 14:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ddRxgye5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6D110E071
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 14:41:16 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7e1f984312cso137225039f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717252875; x=1717857675; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YYm71HSiGPsudDN1BEH9h2sX+QmeDn3a45v9S6zBBMI=;
 b=ddRxgye5NA4/CROwrH8d7CvdLcFQ3UryRbHtTD8e9621jxg4jQauePy+jS+uObDM9F
 slgbnpUV59Uvnyp5S0E+gI4jCBz5FTzU5oXBV4zynFyXJfb4NOXBC2d+yULjGvgVKGel
 TpMRKD9SlMF1qB0YCfMSWJvq7zvXumPvQX7xRyf0mlRqM5tyAB/5wr0wa/SmwbbQ0ORD
 QXFNrDfDWUwwNcUHcZhHNx8p4VKya26KMml0eDeb1cUvmuFMrV8I8WwsTKFeJ75idNo8
 ZE0aaZaZkNCxS+gw896lm2gzWOtTCStnAwSqEAH7hhvqglPalKMcNa0xD6XZ/em+F/pG
 +6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717252875; x=1717857675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YYm71HSiGPsudDN1BEH9h2sX+QmeDn3a45v9S6zBBMI=;
 b=gB9+s3ZYzqt13AgcTg8Kjtxu33h0QIxBYVkk3BxLRxP+71TdKNCBdP+HnHftq+c69x
 C4Cz6ETJdMJ2jtxzkD1mdeemyWCCCsnosrNQYw7jDi5P0Mc9ut1ckKMzRCJInRRGfbRq
 1DUAiKwkiKtUBux50S6a5h2CFKMcJ89QuYhAnN/xxggGbSP1nl8wu0O+9mRdAI+y0DFD
 ezMiKfl6nQKFpxfh2T9lgXDv1tDbJh+W8CL3sz/CGPM2F5iKa/4XSblc8ec4CyBUVWJV
 mwSES59FDq/esXWyCLL1inv2nxOu/v3031TRogZdhDJ0jvQcUHhcYB2uVg1phTupD+Uz
 WFuw==
X-Gm-Message-State: AOJu0YzQBIlLsGYzNFwNRMPla7aDlR+dYuI/tcHkTWDwkRwNDc4o3nnk
 z7Qn7XaAClewx0wGqWlcCmmwXVqDuYKhOp/m1JO24GOA+I5WxYQWvjQQpLk1
X-Google-Smtp-Source: AGHT+IFdMB5NEE4I6L4RNnvKvgCE2fzESNYLGg4gSTkI3X2gl0A00bOETGIHdhAGVjPzSoYizwfovQ==
X-Received: by 2002:a05:6602:1507:b0:7e1:b480:4c02 with SMTP id
 ca18e2360f4ac-7eaffe8caf2mr584434439f.5.1717252874663; 
 Sat, 01 Jun 2024 07:41:14 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:e0b7:c613:ee:e8f3])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7eafe603e5bsm107424639f.52.2024.06.01.07.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 07:41:14 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marek Vasut <marex@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marco Felsch <m.felsch@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/2] drm/bridge: samsung-dsim: Set P divider based on
 min/max of fin pll
Date: Sat,  1 Jun 2024 09:41:01 -0500
Message-ID: <20240601144103.198299-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The P divider should be set based on the min and max values of
the fin pll which may vary between different platforms.
These ranges are defined per platform, but hard-coded values
were used instead which resulted in a smaller range available
on the i.MX8M[MNP] than what was possible.

As noted by Frieder, there are descripencies between the reference
manuals of the Mini, Nano and Plus, so I reached out to my NXP
rep and got the following response regarding the varing notes
in the documentation.

"Yes it is definitely wrong, the one that is part of the NOTE in
MIPI_DPHY_M_PLLPMS register table against PMS_P, PMS_M and PMS_S is
not correct. I will report this to Doc team, the one customer should
be take into account is the Table 13-40 DPHY PLL Parameters and the
Note above."

With this patch, the clock rates now match the values used in NXP's
downstream kernel.

Fixes: 846307185f0f ("drm/bridge: samsung-dsim: update PLL reference clock")
Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Marek Vasut <marex@denx.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

---
V2:  Only update the commit message to reflect why these values
     were chosen.  No code change present

V3:  No Changes

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 95fedc68b0ae..8476650c477c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -574,8 +574,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
 	u16 _m, best_m;
 	u8 _s, best_s;
 
-	p_min = DIV_ROUND_UP(fin, (12 * MHZ));
-	p_max = fin / (6 * MHZ);
+	p_min = DIV_ROUND_UP(fin, (driver_data->pll_fin_max * MHZ));
+	p_max = fin / (driver_data->pll_fin_min * MHZ);
 
 	for (_p = p_min; _p <= p_max; ++_p) {
 		for (_s = 0; _s <= 5; ++_s) {
-- 
2.43.0

