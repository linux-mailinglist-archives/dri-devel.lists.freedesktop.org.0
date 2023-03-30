Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BCE6D07DA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882F610EE69;
	Thu, 30 Mar 2023 14:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6957410E3D5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:16:37 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A51A66030CD;
 Thu, 30 Mar 2023 15:16:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680185796;
 bh=ux/0TN81WLnYDd2jDMimgAkbJMXx28lS+SbskQF/S3M=;
 h=From:To:Cc:Subject:Date:From;
 b=QHe1PlT1KPRiWBcbWcv3WdCSLU1ucNSBotILUNaoQ6WqRFDnLUrTCG2A2+F2CDLaJ
 g6ryx1cWECvB44J/w1LqlLX0p/gK8APKAXjLuS547x09Nn+i8jVKo319Hu7qmAxdRx
 RG6c+zQQiZBVedQ5crYBeufHLfJart3oVnU7YuuO4QWTseWl6/vXtue+gM7erUQ8y+
 mHnWax7mrOPhcrK1z2LgANBi9T+nQK2zsuSJzEmu2n+uokXip/jqaM02OPHrAspbTu
 9qJ0DpszpckB71+l41lP2Yzirb4Nx3ScvUZ4miQhHAPsZogxt09rgfZmEHZxBglU4j
 W1W45b8cHNkqQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v1 0/8] MediaTek DisplayPort: support eDP and aux-bus
Date: Thu, 30 Mar 2023 16:16:22 +0200
Message-Id: <20230330141631.190528-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

AngeloGioacchino Del Regno (8):
  drm/mediatek: dp: Cache EDID for eDP panel
  drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
  drm/mediatek: dp: Always return connected status for eDP in .detect()
  drm/mediatek: dp: Always set cable_plugged_in at resume for eDP panel
  drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
  drm/mediatek: dp: Enable event interrupt only when bridge attached
  drm/mediatek: dp: Use devm variant of drm_bridge_add()
  drm/mediatek: dp: Add support for embedded DisplayPort aux-bus

 drivers/gpu/drm/mediatek/mtk_dp.c | 172 ++++++++++++++++++------------
 1 file changed, 106 insertions(+), 66 deletions(-)

-- 
2.40.0

