Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5E1A6AAA2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 17:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB0310E666;
	Thu, 20 Mar 2025 16:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NTHkmRqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCE210E3B2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 16:00:36 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E655101F;
 Thu, 20 Mar 2025 16:58:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742486331;
 bh=0rz+qtGwR8012ibx7Ol/9THyUm6cLrG8rh2vtI7MsMc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NTHkmRqUive4W7hbO15NPmv0p227neoRU/cCyQS7KfcSKPoPhggNfo6lM2xwuWIKw
 oLHNwoIfHR+JoMXLy3xDGlXX7AowtxAaNBedntnyHF0+Cfylv23hpwZ8DgRM6tJFon
 YMHOmfbQbZQv2MOpRkQBtpEOF+b7GUIUlfnW6jms=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 20 Mar 2025 17:59:59 +0200
Subject: [PATCH 04/18] phy: cdns-dphy: Store hs_clk_rate and return it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-cdns-dsi-impro-v1-4-725277c5f43b@ideasonboard.com>
References: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
In-Reply-To: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=0rz+qtGwR8012ibx7Ol/9THyUm6cLrG8rh2vtI7MsMc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn3DuXTm8DWstHYZiT7ZPCrlACEVpYsmjpJd3y0
 QBj5ORV2oaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ9w7lwAKCRD6PaqMvJYe
 9SfqEACCTF2FJTxSw7IUW/P5BnGlL122hDnWa1b6I1ygMVwlK1cebNYuFukf3/TCDcYm97s8Jry
 KjoM6eJFPmYYFU5bma3NiWXEm8T9l9Li9PNUiUiwIAm6WE3JTvq9BBHQq537/wnu7j2VaFdpdn9
 jsms8xLwSWfn4yCmuNciMZyzhmk08/+Z3vG0yg4E+prZv1MhpEiQ5OKK8aBFp5tE3rTZgtocDng
 4YUykJ5nJFStwPUNVXU1r5OaH+9Ik4DosCN9ZCTLe1YeZTWEcSaRmCAv/m6z9mFbkZ0rFlGxQ4N
 tLlfjgEn4P6NQrM0wPi0zZydp83JDQ0v4UArB1JXicQrqbevP38/awJeiil9KGxbrf5GALMufQZ
 xZ48R/Z0W4MJP3DNT2QpSL2+l1LG5Ubgg7hc7AfWyQLqVYnT+4em6vQ0TFhLCCKJhuI8izBJE7A
 HmAn4wjTDiUu2dOxyTqR4JPP/Hwey4hjbW0OY0vwuLGNBgVI4UUs/3h/OxMGhB7NpyrQtYhOUW7
 1+f2CV8f+OEytONkN/LhWcf12yTc5sj7lUf947Tv+4AXaXoTpQw8zUF0Dymd0aVJkeOqxAm5+oG
 y9Yr6wUuSZft2mH6Mrthrf9P+wDnIyzseOLPH1WwcPqCKdZY7GZapOtMeCMmdXrdSXAHrpOQt8n
 ivgFaYXPhmmkMDg==
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

