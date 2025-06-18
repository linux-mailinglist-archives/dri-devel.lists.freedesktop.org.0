Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E763DADE795
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FB610E7E4;
	Wed, 18 Jun 2025 09:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YVsmBqoP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6497510E7DB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:59:38 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79BFA156F;
 Wed, 18 Jun 2025 11:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750240764;
 bh=SdsFxcP7kgRnccaBenP8n2NR26UZV0KXLNKJ22UARi0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YVsmBqoPGA3QhrXuNpkcqjwiWH1rnIWZUoKC8Bq73lg8IGWPM0mFkcD++pPczLSWn
 /b2gLDhLOu11yEnLLSDZOG9+IfLudpAxLjZZOJ5CK6ypaXwh8eAJOwF2X034s6J5rW
 oEhqmdZSPa812uHI43L0P9xJ1AQWPzqu7+395cts=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:07 +0300
Subject: [PATCH v4 04/17] phy: cdns-dphy: Store hs_clk_rate and return it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-4-862c841dbe02@ideasonboard.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SdsFxcP7kgRnccaBenP8n2NR26UZV0KXLNKJ22UARi0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo39r9sodyAJ2tcO/X69aOfndhCXQftZPghxE
 Hmwz/4yT/qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN/QAKCRD6PaqMvJYe
 9XrCD/9a3slbZN2powiZp5L/w9sEKj/2HZcjA2+hVNNc0EKvkmPweq7VVf7hKsLSBbcRDcK08q5
 Dkqb6QRx93vi+9qkPSTFHveZmMWswfJkFN4lWSyNS+h1UeuNpFovZBQL2EozuDYEmFRsdTg/eqI
 dIM/Xegbc6M5kcENYqQSGQrEfzamkDdsOYp59hUqgHe6TXzi4jgMvtpWk9q8y1fMBDLm/jnKFXa
 H54kvMYKjH1zyBQF6oOJBrBsdBky3HgqXzzfSi7FW7FJNOItnDHZ368viXhNr4x/Vp5cI6BQY4z
 1m1wFcdkIAk/6uZRynKGX+ncUJ+2829f1yrZrgREcwm+j3gfOkInMwCi7qj9TwIJFMRCDmqJyh7
 KfRiEGSIMxg3QwAuw17/tFryeqH3htPTFQ9nDzuLVt9VznH0J6X4DvFqvLYU6QSTrOe0QWdMk3r
 PO7IbEP3KbO2k4D+zo/jeLjMD5tE/cWyhgrCyv049NQ/NKf+RT0uRY9s+o8FTta2aYOIg1LOhMi
 N2crEp63tVBSlSH9zpvzutnzelhKSWyKWem4d5v9RlwUBe88/CItMxDys823sJsD7GzaeX9njl9
 /MO/X30FJaPvbeFLBqnRTsXDpudHRjrdrvEGOhnJpn1y+F7oRXWzvLJLnRw1TYvsrrRSTefliyN
 a6aSda0/qL5KuJQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

The DPHY driver does not return the actual hs_clk_rate, so the DSI
driver has no idea what clock was actually achieved. Set the realized
hs_clk_rate to the opts struct, so that the DSI driver gets it back.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/phy/cadence/cdns-dphy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index ed87a3970f83..f79ec4fab409 100644
--- a/drivers/phy/cadence/cdns-dphy.c
+++ b/drivers/phy/cadence/cdns-dphy.c
@@ -79,6 +79,7 @@ struct cdns_dphy_cfg {
 	u8 pll_ipdiv;
 	u8 pll_opdiv;
 	u16 pll_fbdiv;
+	u32 hs_clk_rate;
 	unsigned int nlanes;
 };
 
@@ -154,6 +155,9 @@ static int cdns_dsi_get_dphy_pll_cfg(struct cdns_dphy *dphy,
 					  cfg->pll_ipdiv,
 					  pll_ref_hz);
 
+	cfg->hs_clk_rate = div_u64((u64)pll_ref_hz * cfg->pll_fbdiv,
+				   2 * cfg->pll_opdiv * cfg->pll_ipdiv);
+
 	return 0;
 }
 
@@ -297,6 +301,7 @@ static int cdns_dphy_config_from_opts(struct phy *phy,
 	if (ret)
 		return ret;
 
+	opts->hs_clk_rate = cfg->hs_clk_rate;
 	opts->wakeup = cdns_dphy_get_wakeup_time_ns(dphy) / 1000;
 
 	return 0;

-- 
2.43.0

