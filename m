Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066C55498A5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 18:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0C810F2A8;
	Mon, 13 Jun 2022 16:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D1B10F29B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:37:12 +0000 (UTC)
Received: from notapiano.myfiosgateway.com
 (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D02B66015CE;
 Mon, 13 Jun 2022 17:37:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655138231;
 bh=EU5dXJaxST5yUrirK7LNhLQYTDy3gjAdYEoad2iWgjY=;
 h=From:To:Cc:Subject:Date:From;
 b=CcyxbA6+H2CHZ79FccQzbDfT0w5dk+YkS66AasdDCPAvv8TFB9WPHC7NfKZFDi0Af
 Vv/tku+hO0aNkbqwRybcjgYPhWKBFVe/vFwWIt2TA8xi1++q5t/IFv8+N0WQb2YAg7
 QEURcJqXLQVG4oaOczNg9uOO0uIhDOoN+PeMzQF04o8TZrXhO+Gi+xpoL8pkOnJK7K
 +m50Ww23uZIWODl8ReM8VPEcG0tW4KT7cLNa7N9tIjPSBIwtXMssplzkqXEfEgR+GR
 31nZPaZVj4ZZqqX4pQzah0dkMdqw9+HI5IFf+V7nR1P6gZp94VcBD4AX2fxTSC9T+F
 mDNW0HZDIGjSA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] drm/bridge: anx7625: Zero error variable when panel bridge
 not present
Date: Mon, 13 Jun 2022 12:37:05 -0400
Message-Id: <20220613163705.1531721-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While parsing the DT, the anx7625 driver checks for the presence of a
panel bridge on endpoint 1. If it is missing, pdata->panel_bridge stores
the error pointer and the function returns successfully without first
cleaning that variable. This is an issue since other functions later
check for the presence of a panel bridge by testing the trueness of that
variable.

In order to ensure proper behavior, zero out pdata->panel_bridge before
returning when no panel bridge is found.

Fixes: 9e82ea0fb1df ("drm/bridge: anx7625: switch to devm_drm_of_get_bridge")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 53a5da6c49dd..3aed4de16690 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1657,8 +1657,10 @@ static int anx7625_parse_dt(struct device *dev,
 
 	pdata->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
 	if (IS_ERR(pdata->panel_bridge)) {
-		if (PTR_ERR(pdata->panel_bridge) == -ENODEV)
+		if (PTR_ERR(pdata->panel_bridge) == -ENODEV) {
+			pdata->panel_bridge = NULL;
 			return 0;
+		}
 
 		return PTR_ERR(pdata->panel_bridge);
 	}
-- 
2.36.1

