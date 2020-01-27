Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732B214A24F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 11:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACD46EAF4;
	Mon, 27 Jan 2020 10:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0B36EAF5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 10:56:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RAtrIj121310;
 Mon, 27 Jan 2020 04:55:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580122553;
 bh=TrRlOwLc/tdMiEvgIjVuZLGeEAB4WdRX1AogQQheS8A=;
 h=From:To:CC:Subject:Date;
 b=YKz8X54PMvkl6NmNNnRwgUQQDfm1ZzIkhsYMMrNLt9BF4gpk1qOlRqt6wdD1PUE5d
 9yjhK0dQk396EzPq8jcf1uO+0DafyjiJyERCpK97Frx8ZqCj4GlNwl+vRYUQaLoYyB
 P9xHMywnXERuBISBNp/K2MxDMsvyZe2/jm95Zxx0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RAtrX6044123
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Jan 2020 04:55:53 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 04:55:51 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 04:55:51 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RAtmOY079625;
 Mon, 27 Jan 2020 04:55:48 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>
Subject: [PATCH v3 0/2] drm/bridge: Support for Toshiba tc358768 RGB to DSI
 bridge
Date: Mon, 27 Jan 2020 12:56:32 +0200
Message-ID: <20200127105634.7638-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Changes since v2:
- Implement pre_enable and post_disbale callbacks and move code from enable and
  disable callbacks.
- hw_enable/disable is removed from tc358768_dsi_host_transfer()
- Defines for DSI_CONFW accesses
- breakout from the loops  (the check for it) is moved one level up in
  tc358768_calc_pll()

Changes since v1:
DT bindings document:
- Removed MaxItems for the regulators
- additionalProperties: false added to port@1

Driver:
- Year is now 2020
- Includes shorted
- The three letter members of the private struct documented 0 they are named as
  in the datasheet
- Error handling for the IO functions is following what sil-sii8620.c does
- regmap regcache is disabled along with refcache_sync() and volatile callback
  for regmap
- The hw enable and disable functions got separated
- Taken the suggested simplifactions from Andrzej for tc358768_calc_pll() and
  tc358768_dsi_host_transfer()
- The driver no longer stores the drm_display_mode, it relies on
  priv->bridge.encoder->crtc->state->adjusted_mode where it needs it
- tc358768_calc_pll() can be used for verification only to not modify the state
- refcounting added for hw enable state as a dsi transfer was shutting down the
  bridge when it was already enabled.

Tested on top of drm-next + LED backlight patches + DT patches on dra7-evm with
osd101t2045 (panel-simple) and osd101t2587 panel drivers.

Cover letter from v1:
TC358768 is a parallel RGB to MIPI DSI bridge.

The initial driver supports MIPI_DSI_MODE_VIDEO, MIPI_DSI_FMT_RGB888 and
only write is implemented for mipi_dsi_host_ops.transfer due to lack of hardware
where other modes can be tested.

Regards,
Peter
---
Peter Ujfalusi (2):
  dt-bindings: display: bridge: Add documentation for Toshiba tc358768
  drm/bridge: Add tc358768 driver

 .../display/bridge/toshiba,tc358768.yaml      |  158 +++
 drivers/gpu/drm/bridge/Kconfig                |   10 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/tc358768.c             | 1040 +++++++++++++++++
 4 files changed, 1209 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
 create mode 100644 drivers/gpu/drm/bridge/tc358768.c

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
