Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223204F8BD7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 03:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AC110E072;
	Fri,  8 Apr 2022 01:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAB410E072
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 01:34:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 1C6661F46B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649381642;
 bh=o8jyjimeTtzJ50BwKCRZ9f6gmB8wWl9FaBazezNCQ2M=;
 h=From:To:Cc:Subject:Date:From;
 b=YlIfXEQt3gi/6hDFEHwlPjoJ4xuHoCLzl5EtEkYNidX8kC4pfiTTIStaGad/8xtGy
 SgXMagTAp4i5u4O+q4IdIMQ6Ov7VmFvqLA7onwUwjXvFzOHqEm3VQAChufM4T64Uj1
 KyScdLzT7Tei6OfwqsNGQTbvotz4VNlm0EqULINJ8xks/zeZONcyn+I+twXdIweMHn
 RnqLBy5gnFOU5d5MzPk8q2WynBbONjKfplCrbXMqFBnzhPa/5JjQok3Sgl4k5JFxGQ
 ltW2LjNl7i28Bt3FdKwEhCcRVNW4hrB+3tzv8l8PT+Db1p63CRka8wQRRBMtknkmSr
 POvRznn/xkc4w==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH] drm/bridge: anx7625: Use irq flags from devicetree
Date: Thu,  7 Apr 2022 21:33:56 -0400
Message-Id: <20220408013356.673732-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Pi-Hsun Shih <pihsun@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Read the irq flags, like which edge to trigger on, from the devicetree
and use those when registering the irq instead of hardcoding them.
In case none was specified, fallback to falling edge trigger.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6516f9570b86..97d954b8cc12 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2588,6 +2588,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	struct anx7625_platform_data *pdata;
 	int ret = 0;
 	struct device *dev = &client->dev;
+	unsigned long irqflags;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_I2C_BLOCK)) {
@@ -2639,10 +2640,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 			goto free_hdcp_wq;
 		}
 
+		irqflags = irq_get_trigger_type(client->irq);
+		if (!irqflags)
+			irqflags = IRQF_TRIGGER_FALLING;
+
 		ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
 						NULL, anx7625_intr_hpd_isr,
-						IRQF_TRIGGER_FALLING |
-						IRQF_ONESHOT,
+						irqflags | IRQF_ONESHOT,
 						"anx7625-intp", platform);
 		if (ret) {
 			DRM_DEV_ERROR(dev, "fail to request irq\n");
-- 
2.35.1

