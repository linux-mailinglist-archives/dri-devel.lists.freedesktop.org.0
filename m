Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53577935B1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 08:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B429C10E57A;
	Wed,  6 Sep 2023 06:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D696710E574
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 06:51:39 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E93F82CC7;
 Wed,  6 Sep 2023 08:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693983011;
 bh=XUpZ1sa4som54e3a4sbbBeu8u2QabPMAMN6dfT5AT9Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BGQn5qGzaozeMIAWlDJ31LmqJE7w/8vRm57u6nZoDD2t1r23r3S/uOcGeaGozYYTS
 HmmPvoTL1CCmN4oqiONiRqreE7+chBET+5+ii0pL/7ji5c7EkBVYdZogvLubF4wcmo
 D2rZiDIevHB3V3ZmZEZELws3HbrqsMxBxbUUMYw8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 06 Sep 2023 09:50:58 +0300
Subject: [PATCH v4 11/12] drm/bridge: tc358768: Fix tc358768_ns_to_cnt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-tc358768-v4-11-31725f008a50@ideasonboard.com>
References: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
In-Reply-To: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=XUpZ1sa4som54e3a4sbbBeu8u2QabPMAMN6dfT5AT9Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk+CFrGphoZYtbzABk2wlF1m3cpxJ82q2nsnlbt
 5i/2HJ2+YGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZPghawAKCRD6PaqMvJYe
 9WZzEACNP9evo+i3NNY0kbRgECfMObxK0+VBI90Xp1PP7KT8Zg6MMA/yJaWCVkrhdl/UJ76eh4X
 aVL20gw2dxRN1QAPp2zSIwmKYd39PjguaLKWeHq4dy0k5t3/3pmflSb0bTu9Gx07wwGYw2DcHhK
 yQU8v6+0FJGMWzJ3eDaWxywF0kJcjeje+3ELw7zQnVgEBm+Nkv4crTofpq1WiNXo3gb3UvBPNAo
 Te5vhINcPMDyXHVM9x/SvpFbvg6179C7t/UPobzzMSAzV7YFqZ9TdSSVzaYR1JDYtrtOzqOJkPZ
 P/Y7iXkis9TNtbm8dXFji0ODzJ6ysdA0qlYXuSUW4OM2ZEj/Xw8cgEUw6TKTX12vj9g4gQdVZMu
 6KN2Etu9KkEBX9Xo7ZN6P48lhKwALNXXH994eoHv9npO7Yp1K7nuedhloBMX7oq68aXg7YRE4kl
 KocmuRcHlWLmmiY18kx146/fqNgWO3DeaHI5d1e95EQFF0dBnQy045wSgrWuINBCswthl3yFAhU
 YZCpSq2hTHTu7R3uVGgjzuxMgBhhuJYH8uNCzOO5x9KS+lwG2TnHqKL9b8qurqjdfSWlrfqChU3
 rYB09T+p64Gi8YmfptksPB0ngD64EB6N1G9ZCBaNZSBiaI0iuTMRb8tafAMP50exYvFPPrgvsRf
 1hUuat8VnMo/pgw==
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tc358768_ns_to_cnt() is, most likely, supposed to do a div-round-up
operation, but it misses subtracting one from the dividend.

Fix this by just using DIV_ROUND_UP().

Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 9ce8d120b50c..f41bf56b7d6b 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -630,7 +630,7 @@ static int tc358768_setup_pll(struct tc358768_priv *priv,
 
 static u32 tc358768_ns_to_cnt(u32 ns, u32 period_ps)
 {
-	return (ns * 1000 + period_ps) / period_ps;
+	return DIV_ROUND_UP(ns * 1000, period_ps);
 }
 
 static u32 tc358768_ps_to_ns(u32 ps)

-- 
2.34.1

