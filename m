Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B021212D797
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC29F6E200;
	Tue, 31 Dec 2019 09:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A4C89875
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 09:04:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A6F8926AE6A
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v24 0/2] drm/bridge: PS8640 MIPI-to-eDP bridge
Date: Mon, 30 Dec 2019 10:04:17 +0100
Message-Id: <20191230090419.137141-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, Ulrich Hecht <uli@fpond.eu>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This is another version of the driver. Note that the driver changed
significally and is a more simply because now is using the panel_bridge
helpers. Apart from this, I addressed the comments from Maxime, Laurent
and Ezequiel.

This bridge is required to have the embedded display working on an Acer
Chromebook R13 ("Elm"). Hopefully we are a bit more close to have this
driver merged. If more changes are required, please let me know and I
will work on it.

Note: Along these around 20 revisions of this driver I was unable to
reconstruct the full changelog history, so I'm skipping this. Sorry
about that, I promise I'll maintain the changelog for future revisions.

Thanks,
 Enric

Changes in v24:
- Fix GPIO polarity as all GPIO descriptors should be handled as active high (Laurent Pinchart)
- Make static ps8640_bridge_attach (Ezequiel Garcia)
- Use a define for the number of lanes (Ezequiel Garcia)

Changes in v23:
- Merge mute/unmute functions into one (Nicolas Boichat)
- Use enum for ENABLE/DISABLE instead of bool (Ezequiel Garcia)
- Rename mute/unmute to vdo_control and fix error messages (Nicolas Boichat and Enric)
- Add space between address and address parameter 'address%02x' (Nicolas Boichat)
- Add Tested-by Hsin-Yi
- Added me as author after the refactor

Changes in v22:
- Migrate to YAML format (Maxime Ripart)
- Remove mode-sel property.
- Rename sleep-gpios to powerdown-gpios.
- Remove sysfs attributes because are not really used (Enric Balletbo)
- Use enum for address page offsets (Ezequiel Garcia)
- Remove enable tracking (Enric Balletbo)
- Use panel_bridge API (Laurent Pinchart)
- Do not use kernel-doc format for non kernel-doc formatted commands (Enric Balletbo)
- Remove verbose message for PAGE1_VSTART command (Ezequiel Garcia)
- Use time_is_after_jiffies idiom (Ezequiel Garcia)
- Remove unused macros (Ezequiel Garcia)
- Fix weird alignment in dsi->mode_flags (Laurent Pinchart)
- Use drm_of_find_panel_or_bridge helper (Laurent Pinchart)
- Remove mode-sel-gpios as is not used (Laurent Pinchart)
- Remove error messages to get gpios as the core will already report it (Enric Balletbo)
- Remove redundant message getting the regulators (Laurent Pinchart)
- Rename sleep-gpios to powerdown-gpios (Laurent Pinchart)
- Use ARRAY_SIZE(ps_bridge->page) instead of MAX_DEV when possible (Laurent Pinchart)
- Fix race with userspace accessing the sysfs attributes (Laurent Pinchart)
- Remove id_table as is only used on DR platforms (Laurent Pinchart)
- Convert to new i2c device probe() (Laurent Pinchart)
- Use i2c_smbus_read/write helpers instead of open coding it (Laurent Pinchart)
- Remove unnused global variables (Laurent Pinchart)
- Remove unnused fields in ps8640 struct (Laurent Pinchart)
- Remove commented-out headers (Laurent Pinchart)

Changes in v21:
 - Use devm_i2c_new_dummy_device and fix build issue using deprecated i2c_new_dummy
 - Fix build issue due missing drm_bridge.h
 - Do not remove in ps8640_remove device managed resources

Changes in v19:
 - fixed return value of ps8640_probe() when no panel is found

Changes in v18:
 - followed DRM API changes
 - use DEVICE_ATTR_RO()
 - remove firmware update code
 - add SPDX identifier

Changes in v17:
 - remove some unused head files.
 - add macros for ps8640 pages.
 - remove ddc_i2c client
 - add mipi_dsi_device_register_full
 - remove the manufacturer from the name and i2c_device_id

Changes in v16:
 - Disable ps8640 DSI MCS Function.
 - Rename gpios name more clearly.
 - Tune the ps8640 power on sequence.

Changes in v15:
 - Drop drm_connector_(un)register calls from parade ps8640.
   The main DRM driver mtk_drm_drv now calls
   drm_connector_register_all() after drm_dev_register() in the
   mtk_drm_bind() function. That function should iterate over all
   connectors and call drm_connector_register() for each of them.
   So, remove drm_connector_(un)register calls from parade ps8640.

Changes in v14:
 - update copyright info.
 - change bridge_to_ps8640 and connector_to_ps8640 to inline function.
 - fix some coding style.
 - use sizeof as array counter.
 - use drm_get_edid when read edid.
 - add mutex when firmware updating.

Changes in v13:
 - add const on data, ps8640_write_bytes(struct i2c_client *client, const u8 *data, u16 data_len)
 - fix PAGE2_SW_REST tyro.
 - move the buf[3] init to entrance of the function.

Changes in v12:
 - fix hw_chip_id build warning

Changes in v11:
 - Remove depends on I2C, add DRM depends
 - Reuse ps8640_write_bytes() in ps8640_write_byte()
 - Use timer check for polling like the routines in <linux/iopoll.h>
 - Fix no drm_connector_unregister/drm_connector_cleanup when ps8640_bridge_attach fail
 - Check the ps8640 hardware id in ps8640_validate_firmware
 - Remove fw_version check
 - Move ps8640_validate_firmware before ps8640_enter_bl
 - Add ddc_i2c unregister when probe fail and ps8640_remove

Jitao Shi (2):
  Documentation: bridge: Add documentation for ps8640 DT properties
  drm/bridge: Add I2C based driver for ps8640 bridge

 .../bindings/display/bridge/ps8640.yaml       | 112 ++++++
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/parade-ps8640.c        | 348 ++++++++++++++++++
 4 files changed, 472 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ps8640.yaml
 create mode 100644 drivers/gpu/drm/bridge/parade-ps8640.c

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
