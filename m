Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5208C58F3
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 17:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4E910E2F5;
	Tue, 14 May 2024 15:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="wmYNiU8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98D310E2F5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 15:40:58 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715701255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GqWA4dxsny1RyIST0+ZaXedMLewwlAUbRrK+aI3zxqY=;
 b=wmYNiU8i7Glte1xtOP0HceYbc1gq6ZpxEuUEq+EkWRMSxetyWLm5RE8SBYA8zwP2aiLjEh
 IIsu7f/4vNWzV4a3mXxeYFGav06juT/I4051bQEoeSWK5Rfj6s3IkKNY0kuk5S1WCPHVMt
 okLhUv9DoeJNCovwTEm38fTXUa/dHpA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the drm_bridge
 structure
Date: Tue, 14 May 2024 23:40:43 +0800
Message-ID: <20240514154045.309925-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Because a lot of implementations has already added it into their drived
class, promote it into drm_bridge core may benifits a lot. drm bridge is
a driver, it should know the underlying hardware entity.

Sui Jingfeng (2):
  drm/bridge: Support finding bridge with struct device
  drm/bridge: Switch to use drm_bridge_add_with_dev()

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |  3 +-
 .../drm/bridge/analogix/analogix-anx6345.c    |  4 +-
 .../drm/bridge/analogix/analogix-anx78xx.c    |  4 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  3 +-
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  3 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  3 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c      |  5 +--
 drivers/gpu/drm/bridge/chrontel-ch7033.c      |  3 +-
 drivers/gpu/drm/bridge/cros-ec-anx7688.c      |  4 +-
 drivers/gpu/drm/bridge/display-connector.c    |  3 +-
 drivers/gpu/drm/bridge/fsl-ldb.c              |  3 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c  |  3 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   |  3 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  |  3 +-
 drivers/gpu/drm/bridge/ite-it6505.c           |  3 +-
 drivers/gpu/drm/bridge/ite-it66121.c          |  3 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c      |  3 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c       |  3 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c       |  3 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c    |  3 +-
 drivers/gpu/drm/bridge/lvds-codec.c           |  3 +-
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  3 +-
 drivers/gpu/drm/bridge/microchip-lvds.c       |  3 +-
 drivers/gpu/drm/bridge/nwl-dsi.c              |  3 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c          |  3 +-
 drivers/gpu/drm/bridge/panel.c                |  3 +-
 drivers/gpu/drm/bridge/parade-ps8622.c        |  3 +-
 drivers/gpu/drm/bridge/parade-ps8640.c        |  1 -
 drivers/gpu/drm/bridge/samsung-dsim.c         |  3 +-
 drivers/gpu/drm/bridge/sii902x.c              |  3 +-
 drivers/gpu/drm/bridge/sii9234.c              |  3 +-
 drivers/gpu/drm/bridge/sil-sii8620.c          |  3 +-
 drivers/gpu/drm/bridge/simple-bridge.c        |  3 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  3 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  3 +-
 drivers/gpu/drm/bridge/tc358762.c             |  3 +-
 drivers/gpu/drm/bridge/tc358764.c             |  3 +-
 drivers/gpu/drm/bridge/tc358767.c             |  3 +-
 drivers/gpu/drm/bridge/tc358768.c             |  3 +-
 drivers/gpu/drm/bridge/tc358775.c             |  3 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c         |  3 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c          |  3 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         |  3 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  3 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            |  3 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c         |  3 +-
 drivers/gpu/drm/drm_bridge.c                  | 39 +++++++++++++++++++
 drivers/gpu/drm/i2c/tda998x_drv.c             |  5 +--
 include/drm/drm_bridge.h                      |  5 +++
 49 files changed, 91 insertions(+), 99 deletions(-)

-- 
2.43.0

