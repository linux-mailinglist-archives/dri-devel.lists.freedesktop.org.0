Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2259FAB5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 15:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C79F10E66F;
	Wed, 24 Aug 2022 13:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932F710E19E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 13:00:53 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 458924A8;
 Wed, 24 Aug 2022 15:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661346051;
 bh=TZTLKT1X06XXta7ywfGo9pLibQ9+6k6tgSFdKbj6Mcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gzegaz1a7UNVoNlGsaDh89PahgognU+VxfcXeO6pvEY+ozuCrfYYrnWseCYzLkOH8
 3Oi4gQNUcCMDbY/h6P76CP3c7GYsf3LicAyNBRdzTEq/2lu48i1KZLNd+b2st5XtEV
 1Q5jy/ssBkxb+HzvNjR1Tze625hzIiRwuKpwCVmA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 1/4] drm/bridge: ti-sn65dsi86: check AUX errors better
Date: Wed, 24 Aug 2022 16:00:31 +0300
Message-Id: <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

The driver does not check AUX_IRQ_STATUS_NAT_I2C_FAIL bit at all when
sending AUX transfers, which leads to the driver not returning an error.

Add the check.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 90bbabde1595..ba84215c1511 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -582,6 +582,11 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 		goto exit;
 	}
 
+	if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
+		ret = -EIO;
+		goto exit;
+	}
+
 	if (val & AUX_IRQ_STATUS_AUX_SHORT) {
 		ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
 		if (ret)
-- 
2.34.1

