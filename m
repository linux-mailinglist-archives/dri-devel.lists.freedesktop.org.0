Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FD3B3944C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 08:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661F010E397;
	Thu, 28 Aug 2025 06:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="NXsN2ifY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9655F10E92D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 04:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=sBxzpMj4gtCGPy2USEQt4AlBG9MoUUY80bEM/tcQSeU=;
 b=NXsN2ifYe3bBEovmuJpAIaunoAQ3dBFaatwmuiuWM1ogyPkgg1nbFjCr
 vbEAdOHgxcJW3NWtRa2xsTeFnYQGJoGh8EbAoc2hrzWr22sKvDsCCDYsg
 Kg+UCsflemxKYdToaE3moRygWKfub59q+dSalxx7rXiGEiBRlKGG2Nx0b
 b+Dgc+XJq3H9sWMUAkBz+jaOnEb4FXfxGtsJ38K2ToK2Bn8agJi+5QqAm
 2P05rDOy8JFVTCxIHdpeSg+AdvBnqdZmOQw+JfLyx9BkqD5glltJpceeI
 y+PjbaoQksOmhafNOC5HmTVlEUCQQ0Wu9mGk+ITiQ4eK9lmgHWK4OrDpk A==;
X-CSE-ConnectionGUID: 4Kbe1zDfTIyv5PT/lgWhMw==
X-CSE-MsgGUID: ixMMyBRzSrCTfHFkp2INGw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 28 Aug 2025 12:02:12 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 57S428ct028000;
 Thu, 28 Aug 2025 12:02:08 +0800 (+08)
 (envelope-from Pet.Weng@ite.com.tw)
Received: from [127.0.1.1] (192.168.72.40) by CSBMAIL1.internal.ite.com.tw
 (192.168.65.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 12:02:07 +0800
From: Pet Weng <pet.weng@ite.com.tw>
Subject: [PATCH v2 0/3] Add ITE IT61620 MIPI DSI to HDMI bridge driver
Date: Thu, 28 Aug 2025 12:01:17 +0800
Message-ID: <20250828-it61620-0714-v2-0-586f5934d5f8@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3Ur2gC/3XMQQ7CIBCF4as0s5aGQaTWlfcwXbR0sLOwGCBV0
 3B3kb3JbL5J3r9DpMAU4dLsEGjjyH4tUIcG7DKudxI8F4OS6iQ71IKTQaOkqBgnXc6Sc6qHMnk
 GcvyuudtQvHBMPnxqfcPf909oQyHFsTOIRs9y6s9XTtRa/2jTC4ac8xdcbzSXqQAAAA==
X-Change-ID: 20250714-it61620-0714-ab4ab4ceff29
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth
 Hung <kenneth.Hung@ite.com.tw>, Pet Weng <pet.weng@ite.com.tw>, Pin-yen Lin
 <treapking@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756353731; l=1955;
 i=pet.weng@ite.com.tw; s=20250702; h=from:subject:message-id;
 bh=ZiCpOPIDp8CIyXPezc/kfJZESu91544+TFydq1LGiDk=;
 b=f8vNAqg7ftRLxlQWMj81RlR0KSSrfPViSmxa8L2ZyCceuf8gW9/p0DP58RdW+vzhu5Lnu00a9
 miEBMZvzpCQDAYTfMN6Q9XFfGBSgzvjS6BpYSWpZhzOwYDf9MZvwNcU
X-Developer-Key: i=pet.weng@ite.com.tw; a=ed25519;
 pk=wd08uBtTLb93x2ixbKVNsxiZPdMh1Ov4z5klodh2bqo=
X-Originating-IP: [192.168.72.40]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 323AFBC42FEAB12407C38FBEDEF9EF64357E22719BEC9D6B83D36B23E47712F52002:8
X-MAIL: mse.ite.com.tw 57S428ct028000
X-Mailman-Approved-At: Thu, 28 Aug 2025 06:55:09 +0000
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

This patch series adds support for the ITE IT61620 MIPI DSI to HDMI 
bridge chip.

The IT61620 is an I2C-controlled bridge that receives MIPI DSI input 
and outputs HDMI signals. A single-port MIPI DSI input is converted to 
an HDMI 1.4 output. This series introduces:
- A device tree binding YAML file describing the hardware
- A new DRM bridge driver implementing the basic functionality
- A MAINTAINERS entry for the driver

Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
---
Changes in v2:
- Call the sha1() library function instead of using the crypto_shash
  "sha1" in patch 2.
- Rewrite it61620_hdmi_ddc_wait() with readx_poll_timeout() in patch 2.	[Pin-yen]
- Rewrite it61620_hdmi_hdcp_wait_ksv_list() with readx_poll_timeout() in
  patch 2.
- Replace interrupts-extended with interrupts in patch 1.		[Rob]
- Replace dsi-lanes with the standard property data-lanes from the graph
  binding.								[Rob]
- Replace "#/$defs/port-base" with "#/properties/port" in patch 1.	[Rob]
- Drop unused labels and "hdmi" for the node name.			[Rob]
- Drop status in patch 1.						[Rob]
- Link to v1: https://lore.kernel.org/r/20250714-it61620-0714-v1-0-3761164d0b98@ite.com.tw

---
Pet Weng (3):
      dt-binding: display: Add ITE IT61620 MIPI DSI to HDMI bridge
      drm/bridge: Add ITE IT61620 MIPI DSI to HDMI bridge driver
      MAINTAINERS: Add entry for ITE IT61620 MIPI to HDMI bridge driver

 .../bindings/display/bridge/ite,it61620.yaml       |  143 +
 MAINTAINERS                                        |    8 +
 drivers/gpu/drm/bridge/Kconfig                     |   19 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ite-it61620.c               | 2944 ++++++++++++++++++++
 5 files changed, 3115 insertions(+)
---
base-commit: 2862348dd4f8d9271ad4fd195fa9b81546db95f3
change-id: 20250714-it61620-0714-ab4ab4ceff29

Best regards,
-- 
Pet Weng <pet.weng@ite.com.tw>

