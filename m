Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D18A89A91
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF9E10E6FA;
	Tue, 15 Apr 2025 10:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GMbi1qM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A65D10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 10:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744713809;
 bh=JTbGQICa8xjjyZckqVWL1hyomY9vACuZkduAQZsMY/8=;
 h=From:To:Cc:Subject:Date:From;
 b=GMbi1qM9PggzXGN6lJIXOYQz6EvZfi+wat8/GZI39h+Us+O7KYSoDaQhK6A2b6BNk
 J97Ed6ADrS+CcOoJOj1TjTQQEJ84OHqTN5QxIgqKwVrHjK85KIoAmfR2W7FOZS+Xbu
 3o7Duzq1haRdcfjoyFGdeXZCxYpQBE7sU4XJBMD4iPxoF+d+E+8+mm8cskJV/gtLRa
 KiO8YKOShfPL18wI7t2mvmupiubmfQEJ1YwL1rRvpgP/osqJnqzpB5ezmcUNh4Mx1n
 TQ2L2Y9tny3aV5F3VGXtS3rXlTJv5hq4IjvVKa2XP6Ck10nXfkSGO54OMhlZhjLxem
 JLdI7DIBVQb2w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8292717E0B2D;
 Tue, 15 Apr 2025 12:43:27 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
Subject: [PATCH v9 00/23] Add support for MT8195/88 HDMIv2 and DDCv2
Date: Tue, 15 Apr 2025 12:42:58 +0200
Message-ID: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
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

Changes in v9:
 - Reordered patch from krzk as first as requested by CK

Changes in v8:
 - Dropped DPI patches as those have been applied in the previous merge window
 - Changed description in mediatek,mt8195-hdmi.yaml as requested by CK
 - Refactored function mtk_hdmi_v2_hw_gcp_avmute() to include contents
   of, and delete, mtk_hdmi_v2_hw_reset_av_mute_regs() as requested by CK
 - Expanded comment before enablement of HDCP reauthentication interrupt
   to explain that the HW uses this internally as requested by CK
 - Added comment in mtk_hdmi_v2_hpd_pord_status() explaining why there
   are three states for cable detection as requested by CK
 - Moved extra interrupts clearing from ISR to probe function and added
   comments explaining the reason why those are being cleaned at probe
   time, as requested by CK.
 - Added support (and tested on MT8395/8195 and MT8390/8188) for output
   in both YUV422 and YUV444 colorspaces other than RGB; please note that
   RGB is still the default, and that the request for using any of the
   YUV output formats depends on previous component(s) of the display
   pipeline declaring support for those; should none of them declare any
   support for YUV formats, only RGB will be available (no errors, the
   additional ones will be simply ignored).

Changes in v7:
 - Split more patches as requested by CK
 - Changed the order of the interlaced variable addition as requested
 - Cleanups in DDCv2 as requested by CK
 - Removed comment from
   drm/mediatek: mtk_hdmi: Move output init to mtk_hdmi_register_audio_driver()
   as that was forgotten from reintroduction of print in v5
 - Some more small nitpicks as pointed out by CK here and there

Changes in v6:
 - Split the TVD clock enable/disable calls in a different commit
 - Changed `is_internal_hdmi` to two different variables, one for
   DPI input clock from HDMI, and one for AFIFO 1T1P output and
   conversion (mtk_dpi)
   - Clarified why MT8195/88 HDMI-reserved DPI1 is different
 - Moved `input_2p_en` bit to platform data to cleanup DPI vs DPINTF
   - 1T2P enable bit is different between DPI and DPINTF, but usage
     is actually the same
 - Cleaned up headers inclusion in mtk_hdmi_v2.c, mtk_hdmi_ddc_v2.c
   - Removed some unused headers, added missing bitfield.h header
 - Split some prints cleanup commits as requested by CK
 - Split the introduction of mtk_hdmi_conf as requested by CK
 - Split commit to make CEC optional as requested by CK
 - Reintroduced forgotten no_capture_mute in codec_pdata (mtk_hdmi_common)
 - Reintroduced error print for audio clocks enablement failure (mtk_hdmi)
 - Added cleanup syscon_regmap_lookup_by_phandle commit from Krzysztof K

Changes in v5:
 - Rebased over next-20250113
 - Resolved merge issues with next-20250113
 - Added bitfield.h inclusion in mtk_dpi in commit [02/33] to resolve
   build issue from 0day CI
 - Removed .atomic_check callback from mtk_hdmi_v2 as it is now part
   of drm_bridge_connector as pointed out by Dmitry B
 - Removed call to pm_runtime_disable() as the driver uses devm
 - Tested again :-)

Changes in v4:
 - DDCv2 binding erroneously dropped in v3 is included again (oops!)
 - Added reference to dai-common.yaml in HDMIv2 binding
 - Dropped pinctrl entries from HDMIv2 binding
 - Fixed required list in HDMIv2 binding and changed node name to
   'hdmi' instead of 'hdmi-tx'
 - Fixed issue in mtk_hdmi derived from wrong commit splitting action
   from version 3
 - Exported necessary symbols and added namespaces for those
 - Fixed module build for both HDMIv1 and HDMIv2
 - Other cleanups

Changes in v3:
 - Added hpd_enable() and hpd_disable() callbacks as suggested by Dmitry B
 - Removed audio mute call in bridge_enable() as suggested by CK
 - Reworked commonization commits for mtk_hdmi/mtk_hdmi_common and split
   out debugfs/abist implementation as suggested by CK
 - Removed .mode_valid() callback as it is now provided by the bridge
   API in drm_bridge_connector_helper_funcs
 - A bit of cleanups here and there
 - Tested again on HW especially for new hpd_enable/disable callbacks.

Changes in v2:
 - Merged series "Add support for MT8195/8188 and Pattern Generator"
   and "drm/mediatek: Add support for HDMIv2 and DDCv2 IPs" in one
   as they are directly related, as requested by CK Hu
 - More commonization: moved some audio functions to mtk_hdmi_common
 - Fixed a bug in DDCv2 driver to allow sending a message with len=1
 - Renamed some functions in HDMIv2 to consistently use the prefix
   mtk_hdmi_v2_ across the driver
 - Added .mode_valid() callback to HDMIv2
 - Added .atomic_check() callback to HDMIv2
 - Reordered drm_bridge_funcs in HDMIv2 driver
 - Rewritten .edid_read() callback in HDMIv2 to move checking audio
   availability to bridge_pre_enable() stage, and to stop using the
   drm_edid_read_ddc() in favor of drm_edid_read()
 - Added support for API provided HDMI Helpers
 - Added .tmds_char_rate_valid() callback to HDMIv2 for HDMI helpers
 - Added .hdmi_{read,write}_infoframe() callback to HDMIv2 for helpers
 - Added support for Vendor infoframes in HDMIv2
 - Added missing audio-dai-cells to HDMIv2 binding to fix check error
 - Added more information to the HDMIv2 binding for clocks and PHY
 - Added some comments to the HDMIv2 code to clarify why the controller
   is preconfigured in bridge_pre_enable() instead of bridge_enable()
 - Added a mention of the differences in HPD between v1 and v2 to the
   commit introducing the v2 driver (v2 is not using CEC for HPD)
 - ...and tested again on HW! :-)


This series adds support for the HDMI-TX v2 Encoder and DDCv2, and for
the direct connection DPI as found in MT8195, MT8188 and their variants.

Tested on Genio 700 EVK:
 - ABIST ON: ok, pattern generated internally from HDMI is shown on
   HDMI screen at the correct resolution;
 - ABIST OFF + DPI Pattern Generator ON: ok, pattern coming from DPI is
   shown on HDMI screen at the correct resolution;
 - Can negotiate up to 4k60

and on MT8395 Radxa NIO 12L:
 - ABIST ON: ok, pattern generated internally from HDMI is shown on
   HDMI screen at the correct resolution;
 - ABIST OFF + DPI Pattern Generator ON: ok, pattern coming from DPI is
   shown on HDMI screen at the correct resolution;
 - Dual screen usecase validated (DSI + HDMI 3840x2160p 60Hz)
 - Can negotiate up to 4k60

Please note that this submission does *not* include support for HDCP
nor for CECv2, as I want this to be upstream before implementing
additional features which are not strictly required for simple
HDMI output.

Bonus in this series is the addition of support for the Pattern Generator
found in the DPI HW: since I needed this for debugging during development,
I had to code in the actual support bits and it looked like a waste of
time to just remove it.
I instead decided to clean it up and upstream it, as this will anyway come
handy for multiple things, of which the most important (imo) are:
 - Adding support for new SoCs in the future will be less time consuming
   as this driver already has the pattern generator in;
 - CI Testing might be able to make use of this to validate that the
   data that comes out is not garbled (so, to help testing display
   support in an automated manner).

Guillaume Ranquet (1):
  drm/mediatek: hdmi: Use regmap instead of iomem for main registers

Krzysztof Kozlowski (1):
  drm/mediatek/hdmi: Use syscon_regmap_lookup_by_phandle_args

 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    |   41 +
 .../mediatek/mediatek,mt8195-hdmi.yaml        |  151 ++
 drivers/gpu/drm/mediatek/Kconfig              |   18 +-
 drivers/gpu/drm/mediatek/Makefile             |   11 +-
 drivers/gpu/drm/mediatek/mtk_cec.c            |    7 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  757 +------
 drivers/gpu/drm/mediatek/mtk_hdmi.c.orig      | 1769 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi.h           |   14 -
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c    |  434 ++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h    |  198 ++
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c       |    2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c    |  385 ++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h   |  263 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c        | 1519 ++++++++++++++
 14 files changed, 4884 insertions(+), 685 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.c.orig
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

-- 
2.49.0

