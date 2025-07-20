Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA7B0B5B4
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A8710E21A;
	Sun, 20 Jul 2025 12:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="IqyvQLA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A67610E21A
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:03:21 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 73FD725DF5;
 Sun, 20 Jul 2025 14:03:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HPPUv9AKyU6; Sun, 20 Jul 2025 14:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1753012999; bh=ULdfird/m3H0CCGaifQbfebWcqhBC7x7CngqCLoQy4o=;
 h=From:Subject:Date:To:Cc;
 b=IqyvQLA+wHyIT6D2O+Ig41B6VYFalqAdIk7iONKx7lBDc/naarqUh9DVPoyWRgdcE
 dIFb/eJc9G6v9W4YEhgijFYb0qtlI9PuwoVA52NLFTGdEYDNUdV9bDnMPtfNXapaCv
 ZNUUWeQCMN/I1bBWdQ5W983LfAAbWTzqpfnYkeBj/aCzXIYogWqZ7lVyzAXo55uVyE
 bvQKfGds0t5OQgTKdgfzAlnudV7KSh+tJVDJm72rTAmbrYgpnJRvHCqpdT0h00VxLQ
 DpAP6MDJbJ85PMj8jePLcfSvxYREMGygW1fugte0AZumRITg5UvcdG20lxo/DvPFwM
 ywmR0g+ERNz/A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v4 0/2] Add driver for Samsung AMS561RA01 panel with
 S6E8AA5X01 controller
Date: Sun, 20 Jul 2025 17:33:06 +0530
Message-Id: <20250720-panel-samsung-s6e8aa5x01-v4-0-7d9258fa3f4a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrafGgC/43NQQ6CMBCF4auQrq1ph7aAK+9hXAx0wCZKSYsEY
 7i7VTcao3H5v2S+ubJIwVFkm+zKAk0uOt+nUKuMNQfsO+LOpmYgQAsNOR+wpyOPeIrnvuPRUIm
 oZyE5IajKELZkkaXzIVDr5ge926c+uDj6cHl8muR9faJGwnd0klxwYWxToygkodlaF4P349qHj
 t3ZCV4o0D8oSJSydQF1WaBG9Unl/1J5oiqUqlItmUaLd2pZlhvpjXz6WAEAAA==
X-Change-ID: 20250523-panel-samsung-s6e8aa5x01-ea2496eafeda
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753012994; l=2027;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ULdfird/m3H0CCGaifQbfebWcqhBC7x7CngqCLoQy4o=;
 b=xJKYpWcV3ovB1SRGIywakEPOd/bOMibryIBH6vckS/wsZ+3k37q+c0O6O17U3xWSBI0Vt4mrW
 2MdCMWOAsSbCYFbhgbefTxYW3vejT2Y1n2kQ8fNlXjFPxpYKnuHxRVm
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

This patch series introduces a driver for Samsung AMS561RA01, which is
an AMOLED panel using the Samsung S6E8AA5X01 panel controller. This
panel is found in several (mostly Samsung) phones, it is a ~5.6 inch
720x1480 panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v4:
- tweaked commit description of [v3 1/2] to reference the hardware.
- utilized devm_drm_panel_alloc() and devm_regulator_bulk_get_const()
  (neil.armstrong)
- redid patches to mention both panel and controller (dmitry.baryshkov)
- Link to v3: https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org

Changes in v3:
- added brightness values for upto 500 nits.
- removed unused mutex object from panel code.
- Link to v2: https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v2-0-4db72b87a5a4@disroot.org

Changes in v2:
- fixed various dt_binding_check errors (conor)
- simplified panel enable sequencing (tzimmermann)
- did s/s6e8aa5x01_update_brightness/s6e8aa5x01_update_status (tzimmermann)
- added check for panel enable in s6e8aa5x01_update_status() (tzimmermann)
- used backlight_get_brightness() in appropriate places (tzimmermann)
- Link to v1: https://lore.kernel.org/r/20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Samsung AMS561RA01 panel with S6E8AA5X01 controller
      drm: panel: add support for Samsung AMS561RA01 panel with S6E8AA5X01 controller

 .../panel/samsung,s6e8aa5x01-ams561ra01.yaml       |  55 ++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../panel/panel-samsung-s6e8aa5x01-ams561ra01.c    | 981 +++++++++++++++++++++
 4 files changed, 1048 insertions(+)
---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250523-panel-samsung-s6e8aa5x01-ea2496eafeda

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

