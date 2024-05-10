Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D298C1EB3
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 09:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DD510E598;
	Fri, 10 May 2024 07:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ny/LnQkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7964910E598
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 07:11:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 479D51C0006;
 Fri, 10 May 2024 07:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715325091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R4voW38Mn+jd1qnO+yPgXEUvHvJH5MLaq0CFqnknbok=;
 b=Ny/LnQkY+BUeLIm3cIniyrsBef8HM8jha8+D2RD69jGfs2tIMAalpYucZhU+SxYUeUnHZO
 Jc+crc7WTlLoLBoJjqbAwNLcU60d/m2zWczgsFFT7h8gqOuA/YSS2qC/sofm1/aLHujXsO
 r8P27Df1AJKO7aJxbn5dUCRsRqSmJGRNbdDrQ1gn1qA3ilhH0huFCK1k2Tx/WQSnbgqfVL
 cugv2ML125rE+mJ8WeAD4xwk/vC+Hv/RBOUW+B/l0Sj3sKqjGaZstgeXyjpsiq0LXuwvfE
 H7sDoTuZ1DKAP8PdRqGfwFvrxIjslnT0WF07Wh4WwPpX/M0Xmue+7AopfWQnOQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/5] Add support for GE SUNH hot-pluggable connector
 (was: "drm: add support for hot-pluggable bridges")
Date: Fri, 10 May 2024 09:10:36 +0200
Message-Id: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzIPWYC/22NQQ6CMBREr0L+2pq20iKsvIdhYekHfgKUtJVoS
 O9uJS5dvsnMmx0CesIATbGDx40CuSWDPBXQjY9lQEY2M0guS34RNRtdXKfnwKyfmfFkc0Noc9W
 oqx5rCXm4euzpdUjvbeaRQnT+fXxs4pv+dFL/022CcVYaJYxCUymrbsa5ONFy7twMbUrpA/sQ7
 Bu2AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello,

this series aims at supporting a Linux device with a connector to
physically add and remove an add-on to/from the main device to augment its
features at runtime, using device tree overlays.

This is the v2 of "drm: add support for hot-pluggable bridges" [0] which
was however more limited in scope, covering only the DRM aspects. This new
series also takes a different approach to the DRM bridge instantiation.

[0] https://lore.kernel.org/all/20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com/

Use case
========

This series targets a professional product (GE SUNH) that is composed of a
"main" part running on battery, with the main SoC and able to work
autonomously with limited features, and an optional "add-on" that enables
more features by adding more hardware peripherals, some of which are on
non-discoverable busses such as I2C and MIPI DSI.

The add-on can be connected and disconnected at runtime at any moment by
the end user, and add-on features need to be enabled and disabled
automatically at runtime.

The add-on has status pins that are connected to GPIOs on the main board,
allowing the CPU to detect add-on insertion and removal. It also has a
reset GPIO allowign to reset all peripherals on the add-on at once.

The features provided by the add-on include a display and a battery charger
to recharge the battery of the main part. The display on the add-on has an
LVDS input but the connector between the base and the add-on has a MIPI DSI
bus, so a DSI-to-LVDS bridge is present on the add-on.

Different add-on models can be connected to the main part, and for this a
model ID is stored in the add-on itself so the software running on the CPU
on the main part knows which non-discoverable hardware to probe.

Overall approach
================

Device tree overlays appear as the most natural solution to support the
addition and removal of devices from a running system.

Several features are missing from the mainline Linux kernel in order to
support this use case:

 1. runtime (un)loading of device tree overlays is not supported
 2. if enabled, overlay (un)loading exposes several bugs
 3. the DRM subsystem assumes video bridges are non-removable

This series targets items 1 and 3. Item 2 is being handled separately (see
"Device tree overlay issues" below).

Device tree representation and connector driver
===============================================

The device tree description we propose involves 3 main parts.

1: the main (fixed) device tree

The main device tree describes the connector itself along with the status
and reset GPIOs. It also provides a 'ports' node to describe how the two
sides of the MIPI DSI bus connect to each other. So now, differently from
v1, there is no standalone representation of the DRM bridge because it is
not really a hardware component. Here is how the connector is represented
in the fixed part of the device tree:

    / {
        #include <dt-bindings/gpio/gpio.h>

        addon_connector: addon-connector {
            compatible = "ge,sunh-addon-connector";
            reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
            plugged-gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
            powergood-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;

            ports {
                #address-cells = <1>;
                #size-cells = <0>;

                port@0 {
                    reg = <0>;

                    hotplug_conn_dsi_in: endpoint {
                        remote-endpoint = <&previous_bridge_out>;
                    };
                };

                port@1 {
                    reg = <1>;

                    hotplug_conn_dsi_out: endpoint {
                        // remote-endpoint to be added by overlay
                    };
                };
            };
        };
    };

The connector has a specific compatible string, and this series adds a
driver supporting it. This driver uses the deivce tree overlay loading and
unloading facilities already implemented by the kernel but not currently
exposed. The driver detects the connection status from the GPIOs and reacts
to a connection event by loading a first overlay (the "base" overlay).

2: the "base" overlay

The "base" overlay describes the common components that are required to
read the model ID. These are identical for all add-on models, thus only one
"base" overlay is needed:

    &i2c1 {
        #address-cells = <1>;
        #size-cells = <0>;

        eeprom@50 {
            compatible = "atmel,24c64";
            reg = <0x50>;

            nvmem-layout {
                compatible = "fixed-layout";
                #address-cells = <1>;
                #size-cells = <1>;

                addon_model_id: addon-model-id@400 {
                    reg = <0x400 0x1>;
                };
            };
        };
    };

    &addon_connector {
        nvmem-cells = <&addon_model_id>;
        nvmem-cell-names = "id";
    };

Here "i2c1" is an I2C bus whose adapter is on the main part (possibly with
some clients) but whose lines extend through the connector to the add-on
where the EEPROM is (possibly with more clients). The EEPROM holds the
model ID of each add-on, using always the same I2C address and memory
offset.

The '&addon_connector' section provides the "glue" to describe how the
NVMEM cell can be accessed via the connector. This allows the connector
driver to read the model ID.

3: the "add-on-specific" overlay

Based on the model ID, the connector driver loads the second overlay, which
describes all the add-on hardware not yet described by the base
overlay. This overlay is model-specific.

    &hotplug_conn_dsi_out {
        remote-endpoint = <&addon_bridge_in>;
    };

    &i2c1 {
        #address-cells = <1>;
        #size-cells = <0>;

        dsi-lvds-bridge@42 {
            compatible = "some-video-bridge";
            reg = <0x42>;

            ports {
                #address-cells = <1>;
                #size-cells = <0>;

                port@0 {
                    reg = <0>;

                    addon_bridge_in: endpoint {
                        remote-endpoint = <&hotplug_conn_dsi_out>;
                        data-lanes = <1 2 3 4>;
                    };
                };

                port@1 {
                    reg = <1>;

                    addon_bridge_out: endpoint {
                        remote-endpoint = <&panel_in>;
                    };
                };
            };
        };
    };

    &{/}
    {
    panel {
        ports {
            #address-cells = <1>;
            #size-cells = <0>;

            port@0{
                reg = <0>;

                panel_in: endpoint {
                    remote-endpoint = <&addon_bridge_out>;
                };
            };
        };
    };

The '&hotplug_conn_dsi_out' section fills the port@1 section that was
initially missing, in order to point to the continuation of the MIPI DSI
line. The rest of this overlay just completes the video pipeline. In the
'&i2c1' section, another I2C client is added to a bus, just as done for the
EEPROM.

After these steps, the add-on is fully described and working on the
system. When the status GPIOs report a disconnection, the overlays are
unloaded in reverse order.

DRM hotplug bridge driver
=========================

DRM natively supports pipelines whose display can be removed, but all the
components preceding it (all the display controller and any bridges) are
assumed to be fixed and cannot be plugged, removed or modified at runtime.

This series adds support for DRM pipelines having a removable part after
the encoder, thus also allowing bridges to be removed and reconnected at
runtime, possibly with different components.

This picture summarizes the  DRM structure implemented by this series:

 .------------------------.
 |   DISPLAY CONTROLLER   |
 | .---------.   .------. |
 | | ENCODER |<--| CRTC | |
 | '---------'   '------' |
 '------|-----------------'
        |
        |DSI            HOTPLUG
        V              CONNECTOR
   .---------.        .--.    .-.        .---------.         .-------.
   | 0 to N  |        | _|   _| |        | 1 to N  |         |       |
   | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANEL |
   |         |        |  |    | |        |         |         |       |
   '---------'        '--'    '-'        '---------'         '-------'

 [--- fixed components --]  [----------- removable add-on -----------]

Fixed components include:

 * all components up to the DRM encoder, usually part of the SoC
 * optionally some bridges, in the SoC and/or as external chips

Components on the removable add-on include:

 * one or more bridges
 * a fixed connector (not one natively supporting hotplug such as HDMI)
 * the panel

The video bus is MIPI DSI in the example and in the implementation provided
by this series, but the implementation is meant to allow generalization to
other video busses without native hotplug support, such as parallel video
and LVDS.

Note that the term "connector" in this context has nothing to do with the
"DRM connector" abstraction already present in the DRM subsystem (struct
drm_connector).

In order to support the above use case while being reasonably generic and
self-contained, the implementation is based on the introduction of the
"hotplug-bridge". The hotplug-bridge implementation is as transparent as
possible. In a nutshell, it decouples the preceding and the following
components: the upstream components will believe that the pipeline is
always there, whil the downstream components will undergo a normal
probe/remove process on insertion/removal as if the entire DRM pipeline
were being added/removed. This means all the other DRM components can be
implemented normally, without having to even be aware of hot-plugging.

The hotplug-bridge it is based on a few self-contained additions to
drm_bridge and drm_encoder, which are provided as individual patches in
this series, and does not require any modifications to other bridges.
However the implementation has some tricky aspects that make it more
complex than in an ideal design. See the patch adding the driver for the
details.

Outstanding bugs and issues
===========================

Unsurprisingly, enabling device tree overlay loading/unloading at runtime
is exposing a number of issues. While testing this work and another,
unrelated work also using overlay insertion/removal [1] we ancountered
several and we are working on solving them one by one. Here is a list of
the issues for which we have sent some patches:

 1. ERROR: remove_proc_entry: removing non-empty directory 'irq/233', leaking at least 'gpiomon'
    - https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@bootlin.com/
 2. leds: gpio: Add devlink between the leds-gpio device and the gpio used
    - https://lore.kernel.org/all/20240220133950.138452-1-herve.codina@bootlin.com/
 3. kobject: 'gpiochip8' ((____ptrval____)): is not initialized, yet kobject_get() is being called.
    - https://lore.kernel.org/all/CAGETcx_YjRzA0joyESsgk=XJKBqqFD7YZeSwKu1a1deo-EyeKw@mail.gmail.com/

Overlay removal is also known for memory leaks of some properties (the
"deadprops" list). This is being examined for a proper solution.

An issue related to devlink appeared since commit 782bfd03c3ae ("of:
property: Improve finding the supplier of a remote-endpoint property"),
merged in v6.8-rc5, as reported in:

 https://lore.kernel.org/all/20240223171849.10f9901d@booty

This is on my todo list as well. The current workaround is reverting
782bfd03c3ae.

Finally, a known issue is related to NVMEM. The connector driver uses NVMEM
notifiers to be notified of cell addition. This works reliably assuming the
cell to be available when the notification fucntion is called, but this
does not happen. Two alternative patches have been sent that would fix
this:

 - https://lore.kernel.org/all/20240130160021.70ddef92@xps-13/
 - https://lore.kernel.org/all/20231229-nvmem-cell-add-notification-v1-1-8d8b426be9f9@bootlin.com/

There was no activity recently about this. Continuing this work in on my
todo list.

[1] https://lore.kernel.org/all/20240430083730.134918-1-herve.codina@bootlin.com

That's all
==========

Thanks for you patience in reading this!

Luca

Changes in v2:
- Added bindings and driver for ge,sunh-addon-connector
- Removed bindings for the hotplug-video-connector, this is now represented
  in DT as part of the ge,sunh-addon-connector
- Various monior improvements to the DRM hotplug-bridge driver
- Link to v1: https://lore.kernel.org/r/20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com

Co-developed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (4):
      dt-bindings: connector: add GE SUNH hotplug addon connector
      drm/encoder: add drm_encoder_cleanup_from()
      drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges
      misc: add ge-addon-connector driver

Paul Kocialkowski (1):
      drm/bridge: add bridge notifier to be notified of bridge addition and removal

 .../connector/ge,sunh-addon-connector.yaml         | 197 +++++++
 MAINTAINERS                                        |  11 +
 drivers/gpu/drm/bridge/Kconfig                     |  15 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/hotplug-bridge.c            | 577 +++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c                       |  35 ++
 drivers/gpu/drm/drm_encoder.c                      |  21 +
 drivers/misc/Kconfig                               |  15 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/ge-sunh-connector.c                   | 464 +++++++++++++++++
 include/drm/drm_bridge.h                           |  19 +
 include/drm/drm_encoder.h                          |   1 +
 12 files changed, 1357 insertions(+)
---
base-commit: 5e3810587f43a24d2c568b7e08fcff7ce05d71a9
change-id: 20240319-hotplug-drm-bridge-16b86e67fe92

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

