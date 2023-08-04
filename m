Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7618376FEC9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D196810E6CA;
	Fri,  4 Aug 2023 10:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A057010E6D2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:44:48 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2C942B6A;
 Fri,  4 Aug 2023 12:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691145822;
 bh=V/DMo8p5jJ8+UtiQ3KTL91bfgqjlzonLkdA5+0U3ogc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QQDrQw2zsdZc2behvl1P1HZYOJm5BRjBhPLP4HW8UoUklhgQOib+VkcfdAdacF5sP
 U3lE+2lnXRBNCW5C3HGf9nNrM9GHkxT24BWlve/ulCYmuf9cHVRkGB2Ir9Bj41wJQJ
 c5nGUHluGuSnyiYk3ZgaxRX4x/lQellgHqWz0mzA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Aug 2023 13:44:14 +0300
Subject: [PATCH 09/11] drm/bridge: tc358768: Fix tc358768_ns_to_cnt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-tc358768-v1-9-1afd44b7826b@ideasonboard.com>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
In-Reply-To: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=V/DMo8p5jJ8+UtiQ3KTL91bfgqjlzonLkdA5+0U3ogc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNaTNhDk+zBX+nctIEkqq6764yQTt3//SgEa4
 LXEPMvQJ2iJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzWkwAKCRD6PaqMvJYe
 9f9cD/4vJ0wTQJ84zUrVTjnCcNpInCDTRekKAhZydWgGkY/wt7GfIkXDTZh9wN49zcFXHeTDH/a
 3qZEA+WTOpJEw6oFxy4uMC/sP5y13aCG7HMeaAccxYh+Euqc5NrSE+bcJ3JCror4+CWKtBJJHrr
 QG/Ol9aJYit3s1o5r6QQ/PaUI5j1diao0NxADE4b9fzVJiDcVbsAszjYWDs34cHxqySM3QbBNUH
 OB7f1W7dxHb25zddImzuzdq03UplxmDGTRFB65JeENBsqkR4+G0wiXJzXNBoBDUokWh/rgSo9Ew
 o2qgbELY7nGucvTh9GqKdYFnk5wU7+V5ABn4g9J1FzL/872wScuXyu4Lyb2cX9gMuOGAp9UbkbE
 BKPkfGiBm5p2Hi5VvHbaYOuWOw8laaBjoDRhRnPvftsBOgzBAip8sp3sWA3OF5eexN6FbMkOd/J
 nJlrNujDBoAIEuB13Gfdhe1ooryBOMb/Of7yEOqhCSEPfzdrHggvulrw851yqXkb8BSp0Om0MI6
 cjWo4oUwBwXa2gkOtWLRWcArQsDyJX5Gf3wEu++8kXNdqBX8abt4YH7hLB7Zqw7/DWf5P2qsTmV
 8ay6GL0DuZe4jDypl4V2bSJ0aXiHyFGdeLZ9oKZ/jKEnTE9s1WX7Og9f+6OsZm+uJS8MXLhw1ar
 VDeOYwZfH60M/dw==
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tc358768_ns_to_cnt() is, most likely, supposed to do a div-round-up
operation, but it misses subtracting one from the dividend.

Fix this by just using DIV_ROUND_UP().

Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 9411b0fb471e..dc2241c18dde 100644
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

