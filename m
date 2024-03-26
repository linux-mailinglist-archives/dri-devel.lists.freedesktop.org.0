Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3887888C920
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 17:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD2810EC60;
	Tue, 26 Mar 2024 16:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="m/feA1h6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307A810EC3E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 16:28:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 832C320004;
 Tue, 26 Mar 2024 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711470512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xlblc9nKs5cxuxQTku/6ATbXs+TrOn5Ut+DcLT64R+s=;
 b=m/feA1h61gysv2BalnJm+7cfDtEidqrgOppFJ86H3cHGnFauo4pXi2jymOyJR1MKsERM2c
 aQKIFjRJa1WPYyRK6CeJlSJBEK+MXeftUKBLCWcVqK7X5jI6gXCtJ0y43t24UQX183LXQL
 wC8zEigRdAlOkTB2gu0A1ff8RX12/GfuMARMGUXyfRnpV4IYXTaXqFGB+e+5HYUCtHSAEd
 2Q5JPc1A1oO6IFaFbBcsn/tMdWirgL4KVcvo8zbA4i/DaJKL/1bVif6iMo42B50zVzdMVU
 d8FqwB/x1Wizas350LQs31W0dCy6HfnTEXOTcv8yArIzX/or6ldQOb9LDexZKw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/4] drm: add support for hot-pluggable bridges
Date: Tue, 26 Mar 2024 17:28:10 +0100
Message-Id: <20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJr3AmYC/x2MWwqAIBAArxL7nZAW9rhK9JG51UJprBWBdPekz
 4GZiRCQCQN0WQTGmwJ5l0DmGUzr6BYUZBODKlRVlLIVqz+P7VqE5V0YJpsMqU2jUdcztgpSeDD
 O9PzTfnjfDybDxPNkAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
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

DRM natively supports pipelines whose display can be removed, but all the
components preceding it (all the display controller and any bridges) are
assumed to be fixed and cannot be plugged, removed or modified at runtime.

This series adds support for DRM pipelines having a removable part after
the encoder, thus also allowing bridges to be removed and reconnected at
runtime, possibly with different components.

In the overall ongoing work, this is going to be handled via device tree
overlay insertion and removal. For many kernel driver frameworks, adding
and removing devices via device tree overlays works already (albeit with
some issues related to overlays in general), but this does not happen for
DRM, so this serias aims at filling this gap.

This series only covers the DRM aspects and not the overlay ones. See
"Development roadmap" below for more details.

Use case
--------

The use case we are working on is to support professional products that
have a portable "main" part running on battery, with the main SoC and able
to work autonomously with limited features, and that can be connected to an
"add-on" part that is not portable and adds more features.

The add-on can be connected and disconnected at runtime at any moment by
the end user, and add-on features need to be enabled and disabled
automatically at runtime. The features provided by the add-on include a
display and a battery charger to recharge the battery of the main part. The
display on the add-on has an LVDS input but the connector between the base
and the add-on has a MIPI DSI bus, so a DSI-to-LVDS bridge is present on
the add-on.

Targeted abstraction level
--------------------------

This series aims at supporting both the use case described above and any
similar use cases, e.g. using different video busses, up to a given level
of generalization.

This picture summarizes the DRM aspects of such devices:

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

Overall this looks like a fairly standard embedded device, except for the
hot-pluggable connector allowing to remove a bridge and all the following
components at runtime and without prior notice for the kernel.

The video bus is MIPI DSI in the example and in the implementation provided
by this series, but the implementation is meant to allow can be
generalizedwgeneralization to other video busses without native hotplug
support, such as parallel video and LVDS.

The "hotplug connector" in picture is the mechanical connector that can be
physically removed at runtime. All the video bus signals (DSI in the
example) get connected or disconnected via that connector.

Note that the term "connector" in this context has nothing to do with the
"DRM connector" abstraction already present in the DRM subsystem (struct
drm_connector). The existing "DRM connector" has been designed to support
hotplug on a bus that physically supports both hotplug _and_ monitor
identification (e.g. HDMI), and later also used to model the connection to
a non-removable panel that is commonly found on embedded systems and
supports neither hotplug nor panel identification. For this reason, the
"DRM connector" is always physically located after all the bridges.

The "hotplug connector" here described is physically hot-pluggable but does
not support model identification, being meant for buses that do not support
identification because they do not support hot-plugging natively.

This is why at least 1 bridge is assumed to be present in the removable
add-on: if there were no such bridge, the "hotplug connector" would be
immediately followed by the "DRM connector" and the panel. In such a
situation, hot-plugging could be implemented by the "DRM connector" in a
much more straightforward way. So this work is mostly useful when there is
at least one bridge on the removable add-on.

The removable components form a unique assembly whose components can not be
separated individually: at any given moment the add-on is either connected
or disconencted -- it is never considered partially connected.

After an add-on has been removed, an add-on of a different model can be
connected, e.g. providing a different panel needing different timings. The
technique to identify the model that gets connected is outside of the scope
of this patch series, as described in "Development roadmap" below.

Implementation
--------------

In order to support the above use case while being reasonably generic and
avoid unnecessary changes to the common DRM code, the implementation is
based on the introduction of the "hotplug-bridge", a new bridge driver that
represents the "hotplug connector" and should be positioned in the DRM
pipeline exactly where the "hotplug connector" is.

In this position the hotplug-bridge decouples the preceding and the
following components so that each of them can be implemented normally,
without having to even be aware of hot-plugging. The implementation is as
transparent as possible in order to minimize the need of any changes to the
design of other components: it is based on a few self-contained additions
to drm_bridge and drm_encoder, and does not require any modification to
other bridges. However the implementation has some tricky aspects that make
it more complex than in an ideal design. See the last patch in the series
for the details.

Patch overview:

 * patch 1 adds device tree bindings for the "hotplug video connector"
 * patches 2 and 3 add some prerequisite new features to the DRM code
 * patch 4 adds the hotplug-bridge itself

Development roadmap
-------------------

This series is a part of a larger work to support embedded devices having a
hot-pluggable add-on. The overall work includes:

 1. a mechanism to detect add-on insertion/removal, read the model ID and
    load a corresponding device tree overlay
 2. fixes to existing bugs that get exposed when loading/unloading device
    tree overlays at runtime
 3. allowing the tail of a DRM pipeline to be hot-pluggable [this series]

All of the above are under development at Bootlin, and patches for item 2
are already under discussion on the relevant mailing-lists.

Item 1 is a prerequisite for production usage of the hotplug-bridge, but
even though it is working well enough in internal testing, it is not yet
ready for sending patches for review. This patch series covering item 3 is
being sent anyway in order to start discussion with the kernel community as
early as possible, expecially the DRM community as this work is changing
some of the assumptions behind the DRM architecture.

Testing
-------

This series cannot be tested in public until the mechanism for add-on
insertion and removal will be sent. It can however be tested by other
means, even with a hardware that has no removable parts, "pretending" that
one or more bridges can be removed:

 * remove and re-insert the driver module for the DRM bridge after the
   hotplug-bridge
 * unbind/bind the DRM bridge after the hotplug-bridge from its driver

Thanks for you patience in reading this!

Luca

Co-developed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (3):
      dt-bindings: display: bridge: add the Hot-plug MIPI DSI connector
      drm/encoder: add drm_encoder_cleanup_from()
      drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges

Paul Kocialkowski (1):
      drm/bridge: add bridge notifier to be notified of bridge addition and removal

 .../bridge/hotplug-video-connector-dsi.yaml        |  87 ++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/bridge/Kconfig                     |  15 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/hotplug-bridge.c            | 561 +++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c                       |  35 ++
 drivers/gpu/drm/drm_encoder.c                      |  21 +
 include/drm/drm_bridge.h                           |  19 +
 include/drm/drm_encoder.h                          |   1 +
 9 files changed, 746 insertions(+)
---
base-commit: 30b26f75c864d1da39fe5e8628f1cbc3702a9add
change-id: 20240319-hotplug-drm-bridge-16b86e67fe92

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

