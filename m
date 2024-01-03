Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E67822E61
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 14:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD2D10E325;
	Wed,  3 Jan 2024 13:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A7310E2A6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 13:31:58 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B1BC13AC;
 Wed,  3 Jan 2024 14:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1704288657;
 bh=iMFg46C9AVK+gqtNslZ2al4rP2jrirD8l6lsmVVtiyk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Bx3sEDe1ZUi988Lh97lIJyub8NL9Km5Rk62w+TLK3NOy3nqvj2iGdyzvZ7uoq3Mfg
 wAWiQ8pca3QDlxttaZabiuiu5cuexa8w/PPu0Lbun3ODKz8jtArTh321vykOCdfHmD
 2SnXxuPyxDgh+Kqfgm7TftNwkHOmGyejgyNbX8MU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 03 Jan 2024 15:31:07 +0200
Subject: [PATCH 1/2] drm/bridge: sii902x: Fix probing race issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240103-si902x-fixes-v1-1-b9fd3e448411@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4397;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=iMFg46C9AVK+gqtNslZ2al4rP2jrirD8l6lsmVVtiyk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBllWHJ48014vEMwPWbraxNYKyeSnFgAcEdghFPm
 cFM3olcS4uJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZZVhyQAKCRD6PaqMvJYe
 9Y3qD/0Zvilv3i8x82Qg+42RLBewo/CU/NSBWfwXkwtyIaXR+7gDxHg2RNtTiT8XaXQm3ZKw7Ry
 EBo+kfQZUzf2tNeyrt+zZxkqSgKBNLt12aiVC2c6N70mspTJYwFCsCzpVwyaHao3PJSRW36B2DR
 CEoHVt0T6pcbQ739umy7OxzMtwCZoGGpgfgj360MHmsfgJ7yitRLEhw3kPm+SI96mTK0Ga1GI52
 4SBR4XKzg7lhqnvORBj6GY0nKJ068p8tqKqfbOPkTLVpSY51Xq2tU0EsufRpPm7u3ONVTDrt6/0
 cxgtNf0HCOXlBcHvgnImUFxYjk8h9Gw+Ing/zNNyPLxFuMkxYdaHuSuYNW4B/RuW6XBM6ks2om2
 DCVG9F5i8DvQCQshxRTY0zugyPROgCSwGLNQkJb5chFYlDGKXp7m4V8+cI7KFQnmjRCxofXbddd
 oDLspl3GUElVQaoNUF1ao/4faJBACMINBqwIATOVz/azpmUAy0lgqSiEBneDN3nxe3PRfB0R5QD
 NbASLd920v4buPKhMh9Bh2hwISPijaRkDYcjxKOyVI6OhAgHULE0uy5aguGNCkyW2sFHzB36uni
 pN/fG2G3TKuq9iq1zu8y1mZylLNA/E1D7Kz1MlwR8CTkiaw0e4I6ICUalAIwMcJpy4Wn1sY7rxv
 Idxcg4ks24HPrpA==
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

A null pointer dereference crash has been observed rarely on TI
platforms using sii9022 bridge:

[   53.271356]  sii902x_get_edid+0x34/0x70 [sii902x]
[   53.276066]  sii902x_bridge_get_edid+0x14/0x20 [sii902x]
[   53.281381]  drm_bridge_get_edid+0x20/0x34 [drm]
[   53.286305]  drm_bridge_connector_get_modes+0x8c/0xcc [drm_kms_helper]
[   53.292955]  drm_helper_probe_single_connector_modes+0x190/0x538 [drm_kms_helper]
[   53.300510]  drm_client_modeset_probe+0x1f0/0xbd4 [drm]
[   53.305958]  __drm_fb_helper_initial_config_and_unlock+0x50/0x510 [drm_kms_helper]
[   53.313611]  drm_fb_helper_initial_config+0x48/0x58 [drm_kms_helper]
[   53.320039]  drm_fbdev_dma_client_hotplug+0x84/0xd4 [drm_dma_helper]
[   53.326401]  drm_client_register+0x5c/0xa0 [drm]
[   53.331216]  drm_fbdev_dma_setup+0xc8/0x13c [drm_dma_helper]
[   53.336881]  tidss_probe+0x128/0x264 [tidss]
[   53.341174]  platform_probe+0x68/0xc4
[   53.344841]  really_probe+0x188/0x3c4
[   53.348501]  __driver_probe_device+0x7c/0x16c
[   53.352854]  driver_probe_device+0x3c/0x10c
[   53.357033]  __device_attach_driver+0xbc/0x158
[   53.361472]  bus_for_each_drv+0x88/0xe8
[   53.365303]  __device_attach+0xa0/0x1b4
[   53.369135]  device_initial_probe+0x14/0x20
[   53.373314]  bus_probe_device+0xb0/0xb4
[   53.377145]  deferred_probe_work_func+0xcc/0x124
[   53.381757]  process_one_work+0x1f0/0x518
[   53.385770]  worker_thread+0x1e8/0x3dc
[   53.389519]  kthread+0x11c/0x120
[   53.392750]  ret_from_fork+0x10/0x20

The issue here is as follows:

- tidss probes, but is deferred as sii902x is still missing.
- sii902x starts probing and enters sii902x_init().
- sii902x calls drm_bridge_add(). Now the sii902x bridge is ready from
  DRM's perspective.
- sii902x calls sii902x_audio_codec_init() and
  platform_device_register_data()
- The registration of the audio platform device causes probing of the
  deferred devices.
- tidss probes, which eventually causes sii902x_bridge_get_edid() to be
  called.
- sii902x_bridge_get_edid() tries to use the i2c to read the edid.
  However, the sii902x driver has not set up the i2c part yet, leading
  to the crash.

Fix this by moving the drm_bridge_add() to the end of the
sii902x_init(), which is also at the very end of sii902x_probe().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 21d808405fe4 ("drm/bridge/sii902x: Fix EDID readback")
---
 drivers/gpu/drm/bridge/sii902x.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 2bdc5b439beb..69da73e414a9 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1080,16 +1080,6 @@ static int sii902x_init(struct sii902x *sii902x)
 			return ret;
 	}
 
-	sii902x->bridge.funcs = &sii902x_bridge_funcs;
-	sii902x->bridge.of_node = dev->of_node;
-	sii902x->bridge.timings = &default_sii902x_timings;
-	sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
-
-	if (sii902x->i2c->irq > 0)
-		sii902x->bridge.ops |= DRM_BRIDGE_OP_HPD;
-
-	drm_bridge_add(&sii902x->bridge);
-
 	sii902x_audio_codec_init(sii902x, dev);
 
 	i2c_set_clientdata(sii902x->i2c, sii902x);
@@ -1102,7 +1092,21 @@ static int sii902x_init(struct sii902x *sii902x)
 		return -ENOMEM;
 
 	sii902x->i2cmux->priv = sii902x;
-	return i2c_mux_add_adapter(sii902x->i2cmux, 0, 0, 0);
+	ret = i2c_mux_add_adapter(sii902x->i2cmux, 0, 0, 0);
+	if (ret)
+		return ret;
+
+	sii902x->bridge.funcs = &sii902x_bridge_funcs;
+	sii902x->bridge.of_node = dev->of_node;
+	sii902x->bridge.timings = &default_sii902x_timings;
+	sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+
+	if (sii902x->i2c->irq > 0)
+		sii902x->bridge.ops |= DRM_BRIDGE_OP_HPD;
+
+	drm_bridge_add(&sii902x->bridge);
+
+	return 0;
 }
 
 static int sii902x_probe(struct i2c_client *client)
@@ -1170,12 +1174,11 @@ static int sii902x_probe(struct i2c_client *client)
 }
 
 static void sii902x_remove(struct i2c_client *client)
-
 {
 	struct sii902x *sii902x = i2c_get_clientdata(client);
 
-	i2c_mux_del_adapters(sii902x->i2cmux);
 	drm_bridge_remove(&sii902x->bridge);
+	i2c_mux_del_adapters(sii902x->i2cmux);
 }
 
 static const struct of_device_id sii902x_dt_ids[] = {

-- 
2.34.1

