Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C1FB4290C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 20:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1968810E1F4;
	Wed,  3 Sep 2025 18:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WplZt4+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0A510E0D3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 18:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756925496;
 bh=W2yIZ1r7+6qnWApJGxqlyhaa17wQLXOaVNluzcmFVhE=;
 h=From:Subject:Date:To:Cc:From;
 b=WplZt4+NdVhr6ry32gY6C8TZaOlkCqq6nL4/e3+L7VqxmBwViO7tweg/69LCu9OOS
 1ae1uSmiIae+j5GtQWNWwE6IFUtbEBpV0KYgoHPJ6pWY4MILoDyM8YlFsV4vwy1Zrn
 i2qGtutH52IZe9PBTDC0OYDNt3OjJUDERy/68Ir+rc9vrLOc1y8Jd9UhYlBW/y++2x
 9ed33NPS4FCFpx8a+Rsgr8cincngotXD6u7bpT2R2E6J2JTw8eYdTK4w88cAHjqTms
 ZKzlmtVLctGbsWbpOXdVxYBrmpSfqF96JiwjmDM3/xM0ToF9HGito1+vyuLmaSxOPO
 Y2s08niMaO5Qg==
Received: from localhost (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id CE98D17E0199;
 Wed,  3 Sep 2025 20:51:35 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Date: Wed, 03 Sep 2025 21:50:58 +0300
Message-Id: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKOuGgC/23NTQrCMBAF4KuUrI2kk4SmrryHuMivDbaNJBKU0
 rubFkSxLmbxHrxvJpRs9DahQzWhaLNPPowlsF2FdCfHi8XelIyAACcNoTheKRcCd2bwWFtdTgr
 HgRrHBCqrW7TOP1bxdC658+ke4nN9kOulfVtsY+UaEwzKCGNFQ4g2Rx36XqoQ5V6HAS1ehi+jJ
 lsDiuFKxZSlTOn6n0E/hgC+NWgxWk6BOQXAW/g15nl+AS6G7G06AQAA
X-Change-ID: 20250703-rk3588-hdmi-cec-cea8f523df48
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>, 
 Derek Foreman <derek.foreman@collabora.com>, 
 Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
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

The first patch in the series implements the CEC capability of the
Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
This is based on the downstream code, but rewritten on top of the CEC
helpers added recently to the DRM HDMI connector framework.

The second patch is needed for RK3576 in order to fixup the timer base
setup according to the actual reference clock rate, which differs
slightly from RK3588.

The following three patches setup platform data with the new information
expected by the HDMI QP transmitter library, while improving the error
handling in the probe path.

Please note the CEC helpers were affected by a resource deallocation
issue which could crash the kernel and freeze the system under certain
test conditions.  This has been already fixed in v6.17-rc1 via commit
19920ab98e17 ("drm/display: hdmi-cec-helper: Fix adapter
unregistration").

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v4:
- Fixed the bisect-related issues reported by Daniel by implementing
  the following operations in dw_hdmi_qp_bind():
  * Disable CEC support when the related IRQ is not available
  * Set ref_clk_rate to vendor default in case it was not provided by
    the platform driver
  * In both scenarios, also print a warning message to highlight the
    need for fixing the platform driver
- Simplified dw_hdmi_qp_cec_init() a bit
  * Removed the now obsolete cec->irq validation test
  * Removed the superfluous error checking and logging around
    devm_request_threaded_irq() call (it already handles all that)
- Collected R-b tags from Daniel
- Rebased series onto next-20250903
- Link to v3: https://lore.kernel.org/r/20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com

Changes in v3:
- Fixup PATCH 1 according to the recent upstream commit 02bb63d1a593
  ("drm/bridge: Make dp/hdmi_audio_* callback keep the same paramter
  order with get_modes") which changed the signature of ->hdmi_cec_init()
  callback of struct drm_bridge_funcs; while at it, also update the
  copyright section
- Updated cover letter to indicate that the CEC helpers fix is already
  available since v6.17-rc1
- Rebased series onto next-20250825
- Link to v2: https://lore.kernel.org/r/20250710-rk3588-hdmi-cec-v2-0-f5884be34bc1@collabora.com

Changes in v2:
- Collected R-b tag from Dmitry
- Restructured the generic bridge patches to not depend on the
  platform-specific changes and updated cover letter accordingly (Heiko)
- Replaced the loop searching for "ref" clock with clk_get() (Maxime)
- Added new patch "drm/rockchip: dw_hdmi_qp: Improve error handling with
  dev_err_probe()"
- Link to v1: https://lore.kernel.org/r/20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com

---
Cristian Ciocaltea (6):
      drm/bridge: dw-hdmi-qp: Add CEC support
      drm/bridge: dw-hdmi-qp: Fixup timer base setup
      drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()
      drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
      drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
      arm64: defconfig: Enable DW HDMI QP CEC support

 arch/arm64/configs/defconfig                   |   1 +
 drivers/gpu/drm/bridge/synopsys/Kconfig        |   8 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 224 ++++++++++++++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h   |  14 ++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  77 +++++----
 include/drm/bridge/dw_hdmi_qp.h                |   2 +
 6 files changed, 284 insertions(+), 42 deletions(-)
---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250703-rk3588-hdmi-cec-cea8f523df48

