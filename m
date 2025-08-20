Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18755B2DF2F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7454810E759;
	Wed, 20 Aug 2025 14:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="l7E0Qk2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055A510E759
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:25:37 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 9D1F822C2E;
 Wed, 20 Aug 2025 16:25:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Al3LunUHI8-A; Wed, 20 Aug 2025 16:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1755699935; bh=+fmM1LXL5j8cHsgbj61uU+OuNanXHVoMioQvqNc3PKg=;
 h=From:Subject:Date:To:Cc;
 b=l7E0Qk2gjtkYmmipFdjx0ZGRddyIxKaLIO/1VLQz23zTDlfWxeBjy3vLFCsKEv90i
 oMc5wGejVHfGVI44vvQTZVF877eccyjuMNwz6Ks6RpC3VJOVZEsCwiq7kNhoX+RX/E
 snP3xWdneOKjhlshqWWGM9KzOli/YnZTjmi6iOPj530IK5pyvfLOi/77wXLGTVIA0T
 FCn15LLXLOlDyyWSJ4+iNEWshNU+hm2IqF/LXOFiphHEjPp+sz4KJU/Hi0cfB1qWiQ
 epqc0XZ4RE57idOTplG4R4ixCBF4mcYflzXtyvLej71Zm7efzoqnJlcFuaq8rLchFi
 H8ZMHW/toTI1A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v5 0/2] Support for Synaptics TDDI series panels
Date: Wed, 20 Aug 2025 19:54:25 +0530
Message-Id: <20250820-panel-synaptics-tddi-v5-0-d4e3fd4987c6@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnapWgC/3XNQW7DIBCF4atErEsEwwBOVr1H1QUYSEaqjAWW1
 Sjy3YvTRRIlXv5Pmm+urMZCsbLj7spKnKlSHlrojx3rz244RU6hNQMBWmhQfHRD/OH1Mrhxor7
 yKQTiwguvkrCpk8ja6Vhiot8b+/Xd+kx1yuVy+zLLdf0HjYT34Cy54CH5ziHoZE3/GaiWnKd9L
 ie2kjM8MKA3GGiMdQacl0Gq3r4y6s5YEBuMagwqpw/aJvSArwzemU4eNhhcGewSGhOkceaZWZb
 lD4LX+d2PAQAA
X-Change-ID: 20250523-panel-synaptics-tddi-0b0b3f07f814
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755699927; l=2374;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=+fmM1LXL5j8cHsgbj61uU+OuNanXHVoMioQvqNc3PKg=;
 b=yAqXOkF8iXjx+hRTbGBLKKsSRtu9OLZ/muJBENmny9ZQrIV2uV28FK5nZTAuwJHy76g41qPsv
 V2QlAnlQowfAIMuaMqICh+wbsuxZnNQ1qqKRUBlgQ21xkeOg9Re8Kr2
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

Synaptics' Touch and Display Driver Integration (TDDI) technology [1]
employs a single chip for both touchscreen and display capabilities.
Such designs reportedly help reducing costs and power consumption.

Although the touchscreens, which are powered by Synaptics'
Register-Mapped Interface 4 (RMI4) touch protocol via I2C or SPI have
driver support in the kernel, the MIPI DSI display panels don't.

This series introduces a rudimentary driver for controlling said display
panels, which supports TD4101 and TD4300 panels.

[1] https://www.synaptics.com/technology/display-integration

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v5:
- added missing Reviewed-by tag from Krzysztof in [v3 1/2]
- Link to v4: https://lore.kernel.org/r/20250819-panel-synaptics-tddi-v4-0-448f466d16a6@disroot.org

Changes in v4:
- utilized drm_connector_helper_get_modes_fixed() (dmitry.baryshkov)
- constified backlight properties (dmitry.baryshkov)
- Link to v3: https://lore.kernel.org/r/20250720-panel-synaptics-tddi-v3-0-43a5957f4b24@disroot.org

Changes in v3:
- fixed various dt_binding_check errors (robh's bot)
- adjusted commit description of [v2 1/2] (robh)
- utilized devm_drm_panel_alloc() and devm_regulator_bulk_get_const()
- Link to v2: https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org

Changes in v2:
- fixed various dt_binding_check errors (conor)
- did s/tddi_update_brightness/tddi_update_status
- added check for panel enable in tddi_update_status()
- used backlight_get_brightness() in appropriate places
- Link to v1: https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Synaptics TDDI panel
      drm: panel: add support for Synaptics TDDI series DSI panels

 .../display/panel/synaptics,td4300-panel.yaml      |  89 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 276 +++++++++++++++++++++
 4 files changed, 377 insertions(+)
---
base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
change-id: 20250523-panel-synaptics-tddi-0b0b3f07f814

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

