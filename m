Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12DE8C442F
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942C210E835;
	Mon, 13 May 2024 15:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ZRmDzwba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDAC10E835
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 15:31:22 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715614279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=k3tjxn3hGY8chOLjVh9vgYTCDBGT+jNofxaqe3MH5eQ=;
 b=ZRmDzwba0JQB7k8VCryqFvCdY5BoaUNiiKnjxAg6mzUz+0tZAiAsPe7OB5HgR+ZSUk4CpZ
 F3qLiy5rGzO5TxUbfWV/9t8OmU2OOlAHMx8b37w8sa/UntnSUAVtJ5Z7Jbh3I7DWmilj2u
 xddyis1gkWeTjmE1+IeRnS+i4eWxyyA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v2 00/12] Remove redundant checks on existence of
 'bridge->encoder'
Date: Mon, 13 May 2024 23:30:57 +0800
Message-ID: <20240513153109.46786-1-sui.jingfeng@linux.dev>
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

The checks on the existence of bridge->encoder in the implementation of
drm_bridge_funcs::attach() is not necessary, as it has already been checked
in the drm_bridge_attach() function call by previous bridge or KMS driver.
The drm_bridge_attach() will quit with a negative error code returned if
it fails for some reasons, hence, it is guaranteed that the .encoder member
of the drm_bridge instance is not NULL when various bridge attach functions
are called.

V1 -> V2:
	* Gather all similar patches to form a series (Laurent)
	* Fix various spell error (Laurent)
	* Correct commit message for bridges of i.MX (Ying)

Sui Jingfeng (12):
  drm/bridge: simple-bridge: Remove a redundant check on existence of
    bridge->encoder
  drm/bridge: tfp410: Remove a redundant check on existence of
    bridge->encoder
  drm/bridge: nxp-ptn3460: Remove a redundant check on existence of
    bridge->encoder
  drm/bridge: panel: Remove a redundant check on existence of
    bridge->encoder
  drm/bridge: it6505: Remove a redundant check on existence of
    bridge->encoder
  drm/bridge: adv7511: Remove a redundant check on existence of
    bridge->encoder
  drm/bridge: cdns-mhdp8546: Remove a redundant check on existence of
    bridge->encoder
  drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Remove a redundant check
    on existence of bridge->encoder
  drm/bridge: synopsys: dw-mipi-dsi: Remove a redundant check on
    existence of bridge->encoder
  drm/bridge: lt9611uxc: Remove a redundant check on existence of
    bridge->encoder
  drm/bridge: imx: Remove redundant checks on existence of
    bridge->encoder
  drm/bridge: analogix: Remove redundant checks on existence of
    bridge->encoder

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c           |  5 -----
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c     |  5 -----
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c     |  5 -----
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c     |  5 -----
 drivers/gpu/drm/bridge/analogix/anx7625.c              | 10 ----------
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  5 -----
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c            |  5 -----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |  5 -----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c        |  5 -----
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c           |  5 -----
 drivers/gpu/drm/bridge/ite-it6505.c                    |  5 -----
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c             |  5 -----
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  5 -----
 drivers/gpu/drm/bridge/nxp-ptn3460.c                   |  5 -----
 drivers/gpu/drm/bridge/panel.c                         |  5 -----
 drivers/gpu/drm/bridge/simple-bridge.c                 |  5 -----
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c          |  5 -----
 drivers/gpu/drm/bridge/ti-tfp410.c                     |  5 -----
 18 files changed, 95 deletions(-)

-- 
2.43.0

