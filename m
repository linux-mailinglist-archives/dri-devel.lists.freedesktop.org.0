Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0CB8C719A
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 08:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F72F10E209;
	Thu, 16 May 2024 06:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="UazI2bwS";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LMfjlKy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5619610E209
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1715840711; x=1747376711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ivJGdfB0We0kranfdHPe4hL+Enb5dv3W/8BGkP2mIFc=;
 b=UazI2bwSISXDsfFjRQpdzOrvR5h0BhG7JoQ2G3WkyE8xgsC+sQPLK1mi
 nf6JQ0ny9rRT9ExEq6zkiqiMbd3DOOW2ndMkfDupcsa+sFhBtW6xFCHKi
 CWwiBW+vMRlqJfkgzFOEENHNwOwUv6Blc3cb+RagfbrfPmeC9XVDIOR5y
 CotXvpZfR6KSUyZlGdNtrn2He30GXNsovv5ri4LXbmqXMEPCqornkCdi4
 P3303+Re+H9OkApJ3upluBKUcduq29KcjWmD368emYUPMFYMf96iYDDQZ
 zx+Fc90CzMxMCP5SoVzSgV3TvazC24+Ugbff456f6vnuGa8nU3Senv1be g==;
X-CSE-ConnectionGUID: UYcMj9TdRsyGzPZ36lEgJw==
X-CSE-MsgGUID: EpIeAuzbQmSeikKVQIY9Mg==
X-IronPort-AV: E=Sophos;i="6.08,163,1712613600"; d="scan'208";a="36926962"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 16 May 2024 08:25:10 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63ED5172EAE; Thu, 16 May 2024 08:25:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1715840706; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ivJGdfB0We0kranfdHPe4hL+Enb5dv3W/8BGkP2mIFc=;
 b=LMfjlKy4qv5svpwRzxRrtrslK3KvpTcDdd+RkdxGMQYqFUgIS6rjkzTgWkMDsb0D3jA0W+
 MiRXFTh5uTxsemyAVlgRdEl7E+LHC5NkvTGlkEFrJP0Th0YD8xFY/PJoHoG/03U/S7O6aJ
 pE3sSRsKH+4X/J+MJdsGWwjY2I95OC1sr18eJuMaGk1Nqg8lhSjnMMGxgWjN6uxscXQYBo
 tdRcff9++0bdYKlyjypnR1NFUIJ1QZZqE6hVZJ7YCSLPsI3/vLDUJAuQ5xPhfrLT7IzT4Y
 alrmiVsDKFvO/p7V1FBtC81Zw6SvmZv0gYSlQ6IUpsiZylXOe4QgGUt+JZ8GjA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/bridge: tc358767: Only print GPIO debug output if
 they actually occur
Date: Thu, 16 May 2024 08:24:54 +0200
Message-Id: <20240516062455.106266-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516062455.106266-1-alexander.stein@ew.tq-group.com>
References: <20240516062455.106266-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Currently the output the following output is printed upon each interrupt:
 tc358767 1-000f: GPIO0:
This spams the kernel log while debugging an IRQ storm from the bridge.
Only print the debug output if the GPIO hotplug event actually happened.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index de62a7e2eafec..8874713bdd4a4 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2146,11 +2146,11 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 		bool h = val & INT_GPIO_H(tc->hpd_pin);
 		bool lc = val & INT_GPIO_LC(tc->hpd_pin);
 
-		dev_dbg(tc->dev, "GPIO%d: %s %s\n", tc->hpd_pin,
-			h ? "H" : "", lc ? "LC" : "");
-
-		if (h || lc)
+		if (h || lc) {
+			dev_dbg(tc->dev, "GPIO%d: %s %s\n", tc->hpd_pin,
+				h ? "H" : "", lc ? "LC" : "");
 			drm_kms_helper_hotplug_event(tc->bridge.dev);
+		}
 	}
 
 	regmap_write(tc->regmap, INTSTS_G, val);
-- 
2.34.1

