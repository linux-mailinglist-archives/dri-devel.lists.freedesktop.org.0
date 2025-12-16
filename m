Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4949CC0ADF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 04:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2A510E5D8;
	Tue, 16 Dec 2025 03:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="EAd5/kwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 726 seconds by postgrey-1.36 at gabe;
 Tue, 16 Dec 2025 03:07:31 UTC
Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw
 [219.87.157.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A975610E540
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 03:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=+4CVBm+PszGoOX7VfF69f6Df9VCygUzfAd3E1fSsIeg=;
 b=EAd5/kwhp5HAJOvaRQL/Zay3oOItQKozToxLpoZ7pZde12OoAk3mXyDp
 qoATX27c1Vmhqfsas3vjKCvjM8l9YVn09W6ZhUOb6t8YcNAYcZdWWFQT+
 RUgbWYKx5jXJozcl3kaMwuuBAZeT2dY5H1sz0UtIHi1orHi44zJXC6E8T
 lrjJ60quINpJJi96KjsNL1YXEONVPHV1HlhLBRVIq8kZ9LGQ54RxbFyCl
 gJHancjLHhjsVNNOXfnTftwjhfl4va9G4YzsW/FZcWDR/ukG8rmWjjoO/
 BHL9JV4bgiCRtGcS0zNn9D6zoezcieMTFEajLjoAFtFkKGOnwbOotek+G w==;
X-CSE-ConnectionGUID: 1Sj9+7zaTeW5knCufhlqPg==
X-CSE-MsgGUID: kDaWEnz9TWa+axjJGX+YIQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 16 Dec 2025 10:52:18 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 5BG2qBnL088263;
 Tue, 16 Dec 2025 10:52:11 +0800 (+08)
 (envelope-from Pet.Weng@ite.com.tw)
Received: from [127.0.1.1] (192.168.72.40) by CSBMAIL1.internal.ite.com.tw
 (192.168.65.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Dec
 2025 10:52:08 +0800
From: Pet Weng <pet.weng@ite.com.tw>
Subject: [PATCH v4 0/3] Add ITE IT61620 MIPI DSI to HDMI bridge driver
Date: Tue, 16 Dec 2025 10:51:48 +0800
Message-ID: <20251216-it61620-0714-v4-0-9d2fea7847ae@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETJQGkC/3XMTQ7CIBCG4asY1tLA8FNw5T2Mi7aAZWFrgKCm6
 d2lXWisMZnNO8nzTSja4G1Eh92Egs0++nEowfc71PXNcLHYm9IICAhSU459klQCwWs0LS/XWed
 Ao0JuwTr/WOdO59K9j2kMz3U90+X7ZyhTTDCrJaWSG9JqdfTJVt14rdIdLUsZPlqB2mgoWijph
 GbcCPer2VtTQvRGs0UbqcAQUJzTLz3P8wtw5jC4JQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765853533; l=5342;
 i=pet.weng@ite.com.tw; s=20250702; h=from:subject:message-id;
 bh=cPLiQUZGOiYLQ6runMqMVZmNnXgX1CP40+7JM4E1xBk=;
 b=AcNBgT5I9jwzp83dN8wdp667FDxDnByzsS656kfb3wMeKLJFIe0OwIk9jYYFJrbiLH8S2BV0W
 rpxh9yDM2PmDJKOfR2ixdAtOOCa4yb42Wuc7lP1U3FcGBpf0tN4CrQR
X-Developer-Key: i=pet.weng@ite.com.tw; a=ed25519;
 pk=wd08uBtTLb93x2ixbKVNsxiZPdMh1Ov4z5klodh2bqo=
X-Originating-IP: [192.168.72.40]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 52A0D941658400F7E06E2C89AFF6751E4BBD30400E095300F9A9D666B1EEFCF82002:8
X-MAIL: mse.ite.com.tw 5BG2qBnL088263
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
Changes in v4:
- In patch 1								[Krzysztof]
 1. Remove redundant "description" fields from interrupts and regulators
 2. Drop pinctrl-names and pinctrl-0; driver does not require them
 3. Remove port/endpoint properties already covered by video interfaces schema
 4. Fix example indentation to 4 spaces for readability
- In patch 2								[Jani]
 1. Use connector->display_info from DRM helper instead of parsing EDID manually
- In patch 2								[Dmitry]
 1. Remove redundant powered check in reg access
 2. Use TMDS character rate instead of pixel clock for N/CTS
 3. Use consistent lowercase naming for tmds.
 4. Use test_bit() instead of custom bit-test helper
 5. Use tmds_char_rate_valid instead of custom mode_valid
 6. Use custom EDID read instead of DDC bus for segment handling
 7. Drop redundant atomic feature check
 8. Pass flags directly to drm_bridge_attach()
 9. Check DRM_BRIDGE_ATTACH_NO_CONNECTOR flag before drm_bridge_attach()
 10. Short-circuit HPD update if connector status unchanged
 11. Remove unnecessary NULL check for connector state
 12. Rename cached_edid to edid since it's no longer cached
 13. Remove redundant sample rate checks; rely on hdmi-codec validation
 14. Remove unsupported 18-bit audio sample size; rely on hdmi-codec
 15. Remove unnecessary fmt switch; rely on hdmi-codec defaults
 16. Check and propagate errors from it61620_audio_update_hw_params instead of
     ignoring them
- In patch 3								[Krzysztof]
 1. Remove unnecessary T: field pointing to git; subsystem already defines it
- Link to v3: https://lore.kernel.org/r/20251009-it61620-0714-v3-0-5d682d028441@ite.com.tw

Changes in v3:
- Wrapped description lines to comply with 80-character line length limit
  in patch 1.								[Rob]
- Renamed node from "it61620@58" to "bridge@58" in patch 1.		[Rob]
- Add port@2 for I2S audio input in patch 1.				[Dmitry]
- Updated the Kconfig dependency from CRYPTO and CRYPTO_HASH to 
  CRYPTO_LIB_SHA1 in patch 2.						[Eric]
- In patch 2								[Dmitry]
 1. Audio and InfoFrame
   - Rename audfmt to i2s_input_format for clarity.
   - Remove unused infoframe[HDMI_INFOFRAME_SIZE(AUDIO)].
 2. Platform data and structure
   - Drop platform data usage; migrate members into struct it61620
 3. Code organization
   - Reorder functions to avoid the need for forward declarations.
   - Add static inline to small helper functions
     (e.g. bridge_to_it61620()).
 4. HDCP handling
   - Make HDCP enable/disable conditional on conn_state->content_protection.
   - Report authentication result using drm_hdcp_update_content_protection().
 5. Error handling
   - Replace manual error path with dev_err_probe().
 6. Power management
   - Inline suspend/resume callbacks.
   - Use DEFINE_RUNTIME_DEV_PM_OPS() instead of explicit struct definition.
 7. Bridge callbacks
   - Drop empty bridge_detach().
   - Inline it61620_bridge_mode_valid().
 8. EDID handling
   - Remove unnecessary cached EDID duplication.
 9. Mode set and pixel clock
   - Move mode handling to atomic_enable().
   - Keep only pixelclock for future N/CTS audio calculations.
 10. Logging
    - Replace noisy drm_err() calls with drm_dbg().
 11. InfoFrame support
    - Add support for SPD and Vendor InfoFrames.
- Link to v2: https://lore.kernel.org/r/20250828-it61620-0714-v2-0-586f5934d5f8@ite.com.tw

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

 .../bindings/display/bridge/ite,it61620.yaml       |  140 +
 MAINTAINERS                                        |    7 +
 drivers/gpu/drm/bridge/Kconfig                     |   18 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ite-it61620.c               | 2787 ++++++++++++++++++++
 5 files changed, 2953 insertions(+)
---
base-commit: 34bd4deba1e55e93c74977dee31783ebdf68d8ba
change-id: 20250714-it61620-0714-ab4ab4ceff29

Best regards,
-- 
Pet Weng <pet.weng@ite.com.tw>

