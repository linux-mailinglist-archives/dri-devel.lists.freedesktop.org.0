Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80044822E62
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 14:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D01810E2E1;
	Wed,  3 Jan 2024 13:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5982110E092
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 13:31:59 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7913914F6;
 Wed,  3 Jan 2024 14:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1704288658;
 bh=tdC8bo9g+1sFJ0nC0ngx+zuHwSTUYxmobSiNzCTaMVo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=wSlOEX/LzYYscEfbHhA1W/PU3UdDgHQWWeYx5jkFc71ogNKQy5lL3XGqel87t/NOz
 b50Q19fUPaqEyYE4v2iCF4xC2jsPHbTqjU/SD55IBN6GpubtIJeMU5vqp84iCE+Tf5
 8TvixVHfAfc8sxiRpmf8X3HFKNxLeiIvWuVO3WjU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 03 Jan 2024 15:31:08 +0200
Subject: [PATCH 2/2] drm/bridge: sii902x: Fix audio codec unregistration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240103-si902x-fixes-v1-2-b9fd3e448411@ideasonboard.com>
References: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
In-Reply-To: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Boris Brezillon <bbrezillon@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>, 
 Jyri Sarha <jsarha@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2154;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tdC8bo9g+1sFJ0nC0ngx+zuHwSTUYxmobSiNzCTaMVo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBllWHKOC4wTXnmAbo3MUHJVBBZhARrnKv7ECdh8
 lJsQCszaXGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZZVhygAKCRD6PaqMvJYe
 9c8rD/9poCeDq9dmyisgmo/h6ZmGa+hb9lRPgl+EykH/gUnxZ9mAh8jVoo462kCyV3I+HdsTdH7
 PyswhkMgTQxjCskQrwLUtptMiyg2M2HZOa3vb9QEMAsExkag4U98a+H+gWTDlEgwZU6ixcYg2j9
 aqWmMImH9oad1ZVTD6erOljbclWya4zC6yZGwv2gKaj4gU+QbhL5VNk15Afk2Ai01qdyCLJeI0U
 Lig5bPHAU5r7lKx+XyIbvzTbl+42EYDLO50i1YqHbmJDmc/ds6AGodgses4s8eI1ly/D4Cdjz8O
 MSWb7Y8stSytR8U8ZeTZTW9KDF+XwtnJmyY545BhFo7n7qbeZa2kzvU8AAILE8deOxjDYlalxrX
 9CbPzuzb3V2QcJPoQbOJe0SnSsvqadSfC5JCwzo7uToxq5JXclwCKcLHkH7r3oGcF2bEPbvPDe+
 BivyZYIZheXR/u5JvDw6sK4QEckrUSSoPTcDCNL+OeP+scm9cZ9kumyMYPhRq+TQMc0vjWNYSfJ
 cdS1BQOn/Z2GiE1VbHwEMH+vx9aUGuIvSS3nBEx1S41gQy2p299GAn1P9l4aSqK69pUiy0Cz42C
 DF6Mb4UZRwUzq4oNDoJlUvncx2pVNUjYifyHoDSx4RCFuGwVfS5Dz4bHcSVVLi4AacxBblCVc6b
 +XrbF4Zx3liPBXg==
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
Cc: Nishanth Menon <nm@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver never unregisters the audio codec platform device, which can
lead to a crash on module reloading, nor does it handle the return value
from sii902x_audio_codec_init().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
Cc: Jyri Sarha <jsarha@ti.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 69da73e414a9..4560ae9cbce1 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1080,7 +1080,9 @@ static int sii902x_init(struct sii902x *sii902x)
 			return ret;
 	}
 
-	sii902x_audio_codec_init(sii902x, dev);
+	ret = sii902x_audio_codec_init(sii902x, dev);
+	if (ret)
+		return ret;
 
 	i2c_set_clientdata(sii902x->i2c, sii902x);
 
@@ -1088,13 +1090,15 @@ static int sii902x_init(struct sii902x *sii902x)
 					1, 0, I2C_MUX_GATE,
 					sii902x_i2c_bypass_select,
 					sii902x_i2c_bypass_deselect);
-	if (!sii902x->i2cmux)
-		return -ENOMEM;
+	if (!sii902x->i2cmux) {
+		ret = -ENOMEM;
+		goto err_unreg_audio;
+	}
 
 	sii902x->i2cmux->priv = sii902x;
 	ret = i2c_mux_add_adapter(sii902x->i2cmux, 0, 0, 0);
 	if (ret)
-		return ret;
+		goto err_unreg_audio;
 
 	sii902x->bridge.funcs = &sii902x_bridge_funcs;
 	sii902x->bridge.of_node = dev->of_node;
@@ -1107,6 +1111,12 @@ static int sii902x_init(struct sii902x *sii902x)
 	drm_bridge_add(&sii902x->bridge);
 
 	return 0;
+
+err_unreg_audio:
+	if (!PTR_ERR_OR_ZERO(sii902x->audio.pdev))
+		platform_device_unregister(sii902x->audio.pdev);
+
+	return ret;
 }
 
 static int sii902x_probe(struct i2c_client *client)
@@ -1179,6 +1189,9 @@ static void sii902x_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&sii902x->bridge);
 	i2c_mux_del_adapters(sii902x->i2cmux);
+
+	if (!PTR_ERR_OR_ZERO(sii902x->audio.pdev))
+		platform_device_unregister(sii902x->audio.pdev);
 }
 
 static const struct of_device_id sii902x_dt_ids[] = {

-- 
2.34.1

