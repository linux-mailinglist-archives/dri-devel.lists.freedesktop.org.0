Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836B9751C82
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF11310E63C;
	Thu, 13 Jul 2023 09:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2417D10E638
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:02:01 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AE9EF6607044;
 Thu, 13 Jul 2023 10:01:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689238918;
 bh=WhbAVEXdX9GjpwripqW58AET2QNGyCRlQO6iZTf/vYg=;
 h=From:To:Cc:Subject:Date:From;
 b=W1CQgZsa8/plt03OKILwzeBjXUJyqQZiC0tVJFNz30jh9WM6erb9MArAxdFS9uSPC
 tSqi2VBODVNMqrIGPxEJ7JmXEaliUw2ILJgepHaGJ+fRQR5RViv6dUHUJnP2YYy9yo
 Vy3wHEWZas9hLYpDsc23e++0h0jQW37ZTKT0xuUU/NO/w3ysc+GwYLoS0330dNJwHw
 k4S3jA5KLZSZkCeNSRoPl3FVCAV/fe5/7+YSHx2t9btwg9ePvWEsfhDisqUhdHXwUv
 9zNVFljiMnG/kqmNHDr5PSO0lm8SOHcLEpHbDP/bGcpTYT8XA7TPuAcy56swlFVeLa
 BtA2g66LTbX2A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v5 00/10] MediaTek DisplayPort: support eDP and aux-bus
Date: Thu, 13 Jul 2023 11:01:42 +0200
Message-Id: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v5:
 - Added .wait_hpd_asserted() callback for aux-bus
 - Avoid enabling and registering HPD interrupt + handlers for
   eDP case only (keeps HPD interrupts enabled for full DP case)
 - Support not always-on eDP panels (boot with regulator off,
   suspend with regulator off) for power saving in PM suspend.

Changes in v4:
 - Set data lanes to idle to prevent stalls if bootloader didn't
   properly close the eDP port
 - Now using the .done_probing() callback for AUX bus to prevent
   probe deferral loops in case the panel-edp driver is a module
   as previously seen with another bridge driver (ANX7625) on
   some other SoCs (MT8192 and others)
 - Rebased over next-20230706
 - Dropped Chen-Yu's T-b tag on last patch as some logic changed
   (before, I wasn't using the .done_probing() callback).

Changes in v3:
 - Added DPTX AUX block initialization before trying to communicate
   to stop relying on the bootloader keeping it initialized before
   booting Linux.
 - Fixed commit description for patch [09/09] and removed commented
   out code (that slipped from dev phase.. sorry!).

This series adds "real" support for eDP in the mtk-dp DisplayPort driver.

Explaining the "real":
Before this change, the DisplayPort driver did support eDP to some
extent, but it was treating it entirely like a regular DP interface
which is partially fine, after all, embedded DisplayPort *is* actually
DisplayPort, but there might be some differences to account for... and
this is for both small performance improvements and, more importantly,
for correct functionality in some systems.

Functionality first:

One of the common differences found in various boards implementing eDP
and machines using an eDP panel is that many times the HPD line is not
connected. This *must* be accounted for: at startup, this specific IP
will raise a HPD interrupt (which should maybe be ignored... as it does
not appear to be a "real" event...) that will make the eDP panel to be
detected and to actually work but, after a suspend-resume cycle, there
will be no HPD interrupt (as there's no HPD line in my case!) producing
a functionality issue - specifically, the DP Link Training fails because
the panel doesn't get powered up, then it stays black and won't work
until rebooting the machine (or removing and reinserting the module I
think, but I haven't tried that).

Now for.. both:
eDP panels are *e*DP because they are *not* removable (in the sense that
you can't unplug the cable without disassembling the machine, in which
case, the machine shall be powered down..!): this (correct) assumption
makes us able to solve some issues and to also gain a little performance
during PM operations.

What was done here is:
 - Caching the EDID if the panel is eDP: we're always going to read the
   same data everytime, so we can just cache that (as it's small enough)
   shortening PM resume times for the eDP driver instance;
 - Always return connector_status_connected if it's eDP: non-removable
   means connector_status_disconnected can't happen during runtime...
   this also saves us some time and even power, as we won't have to
   perform yet another power cycle of the HW;
 - Added aux-bus support!
   This makes us able to rely on panel autodetection from the EDID,
   avoiding to add more and more panel timings to panel-edp and, even
   better, allowing to use one panel node in devicetrees for multiple
   variants of the same machine since, at that point, it's not important
   to "preventively know" what panel we have (eh, it's autodetected...!).

This was tested on a MT8195 Cherry Tomato Chromebook (panel-edp on aux-bus)


P.S.: For your own testing commodity, here's a reference devicetree:

pp3300_disp_x: regulator-pp3300-disp-x {
	compatible = "regulator-fixed";
	regulator-name = "pp3300_disp_x";
	regulator-min-microvolt = <3300000>;
	regulator-max-microvolt = <3300000>;
	enable-active-high;
	gpio = <&pio 55 GPIO_ACTIVE_HIGH>;
	pinctrl-names = "default";
	pinctrl-0 = <&panel_fixed_pins>;
};

&edp_tx {
	status = "okay";

	pinctrl-names = "default";
	pinctrl-0 = <&edptx_pins_default>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			reg = <0>;
			edp_in: endpoint {
				remote-endpoint = <&dp_intf0_out>;
			};
		};

		port@1 {
			reg = <1>;
			edp_out: endpoint {
				data-lanes = <0 1 2 3>;
				remote-endpoint = <&panel_in>;
			};
		};
	};

	aux-bus {
		panel: panel {
			compatible = "edp-panel";
			power-supply = <&pp3300_disp_x>;
			backlight = <&backlight_lcd0>;
			port {
				panel_in: endpoint {
					remote-endpoint = <&edp_out>;
				};
			};
		};
	};
};

AngeloGioacchino Del Regno (10):
  drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
  drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
  drm/mediatek: dp: Use devm variant of drm_bridge_add()
  drm/mediatek: dp: Move AUX_P0 setting to
    mtk_dp_initialize_aux_settings()
  drm/mediatek: dp: Enable event interrupt only when bridge attached
  drm/mediatek: dp: Avoid mutex locks if audio is not supported/enabled
  drm/mediatek: dp: Move PHY registration to new function
  drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
  drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus
  drm/mediatek: dp: Don't register HPD interrupt handler for eDP case

 drivers/gpu/drm/mediatek/Kconfig  |   1 +
 drivers/gpu/drm/mediatek/mtk_dp.c | 335 ++++++++++++++++++++----------
 2 files changed, 224 insertions(+), 112 deletions(-)

-- 
2.40.1

