Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5E1A87A5D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 10:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D9010E4DB;
	Mon, 14 Apr 2025 08:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jDO971mz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74F010E4D9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744619361;
 bh=S5wV+W43ugdWydPF1EvXFidYinbfXUappDW9VKOD42w=;
 h=From:To:Cc:Subject:Date:From;
 b=jDO971mzpq6u3qUOTN6v+rWg9OEaLwjoQlHOH1Se9sXJWhyD6ABOgzY0zPS/zKfC9
 HuEBaVvuq/YQC1WXCWt9i2FWy2gZoP9nanc3uOjWYquryFp7I0eGmulXlH/5PCNkK1
 MFTl8Jzk96CRZObwMRyj2p78m8vY17TrvDsg3G+g5YuMgaN6PhmgNEJNO7F/S8iAgu
 M93uAVnR7U/9M5k1lsp7UM3Lv6iN54eDfB3esZ1VaStwhAca9OBJO/sdasQx8Y/IdS
 Bveuz6wXtkfXcpDgzJf+IWcvf5pBZchUtHHa5eId+VxrAH/eK3SB3MtTFiVCbo3lH/
 YfZy/Xo3v5Fww==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B1EB17E0FA7;
 Mon, 14 Apr 2025 10:29:20 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, pablo.sun@mediatek.com, christophe.jaillet@wanadoo.fr
Subject: [PATCH v4 0/3] Add driver for Himax HX8279 DriverIC panels
Date: Mon, 14 Apr 2025 10:29:15 +0200
Message-ID: <20250414082918.30298-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v4:
 - Changed hx8279_set_page() and all other utilities to void (Neil)
 - Changed hx8279_{on,prepare,unprepare}() to return dsi_ctx.accum_err (Neil)
 - Switched to devm_drm_panel_alloc() as suggested (Neil)

Changes in v3:
 - Added support for setting digital gamma parameters and validity check
 - Added support for setting analog gamma parameters
 - Changed gout_{l,r} to a structure and added a description
 - Fixed DSI LPM/HS setting in prepare/unprepare callbacks
 - Remove forced panel off in probe function as that was simply
   useless
 - Renamed function hx8279_check_config to hx8279_check_params
   as that is actually checking multiple parameters and not just
   basic DDIC configuration
 - Moved the GMUX and GOA validation to their own functions to
   improve readability

Changes in v2:
 - Removed unneeded mipi_dsi_device_unregister() call for secondary
   DSI: as the driver is using devm, that's not necessary (CJ)
 - Removed superfluous if branch as pointed out by CJ

This series adds a driver for DSI panels using the Himax HX8279 and
HX8279-D DriverICs, and introduces two panels using such a configuration,
the Startek KX070FHFID078, found on some MediaTek Genio Evaluation Kits,
and the Aoly SL101PM1794FOG-v15 usually found on some I.MX8MM boards.

This panel is found on the latest hardware revisions of some MediaTek
Genio Evaluation Kits, and specifically, at least:
 - Genio 510 EVK
 - Genio 700 EVK
 - Genio 1200 EVK

This driver was tested on all of the aforementioned boards.

AngeloGioacchino Del Regno (3):
  dt-bindings: vendor-prefixes: Add Shenzhen Aoly Technology Co., Ltd.
  dt-bindings: display: panel: Add Himax HX8279/HX8279-D DDIC panels
  drm: panel: Add driver for Himax HX8279 DDIC panels

 .../bindings/display/panel/himax,hx8279.yaml  |   75 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 drivers/gpu/drm/panel/Kconfig                 |   11 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-himax-hx8279.c    | 1298 +++++++++++++++++
 5 files changed, 1387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8279.c

-- 
2.49.0

