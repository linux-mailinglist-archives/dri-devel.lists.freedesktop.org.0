Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB094D394
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86BC10E95B;
	Fri,  9 Aug 2024 15:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PwN7z2ND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D10210E95E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 15:35:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BF92C000A;
 Fri,  9 Aug 2024 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723217749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSQ+hacy88j78to52wbL7L51YRPgyCpJ1CVB9WAt+iY=;
 b=PwN7z2NDVooO8+EOZkmmb7r2By95CHEx0lIPTHWFkZT15kwQ/Sh3ESOqF+esRpAp4r2LJn
 c8nqf5CpSU0HEBixhpsuj3U4wAltnbyxEseZkQP38gdsuiDqjBjxJFDQFqYOxq++ZvTDgf
 dY+Hl7fTwIgri5qWHvqRlXc94Sx+D6bu2/v5OYp1pjsG1qAgPmQpezT+dHLp7bvt3K/pFZ
 ChTgDzIoD3wViziS6UI5kp+hn9O09BXdHNq8PKWBEvX2Za+ZpkOJ3L+VCvX2q4rt0te/61
 pNT93dnokQIPhHNYklbNmPMtUOqEnN8bE0rokyuj4biUFajOXaVijBAnk7SADQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Aug 2024 17:34:53 +0200
Subject: [PATCH v3 5/7] i2c: i2c-core-of: follow i2c-parent phandle to
 probe devices from added nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-hotplug-drm-bridge-v3-5-b4c178380bc9@bootlin.com>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
In-Reply-To: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
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
 Saravana Kannan <saravanak@google.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.0
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

When device tree nodes are added, the I2C core tries to probe client
devices based on the classic DT structure:

  i2c@abcd0000 {
      some-client@42 { compatible = "xyz,blah"; ... };
  };

However for hotplug connectors described via device tree overlays there is
additional level of indirection, which is needed to decouple the overlay
and the base tree:

  --- base device tree ---

  i2c1: i2c@abcd0000 { compatible = "xyz,i2c-ctrl"; ... };
  i2c5: i2c@cafe0000 { compatible = "xyz,i2c-ctrl"; ... };

  connector {
      i2c-ctrl {
          i2c-parent = <&i2c1>;
          #address-cells = <1>;
          #size-cells = <0>;
      };

      i2c-sensors {
          i2c-parent = <&i2c5>;
          #address-cells = <1>;
          #size-cells = <0>;
      };
  };

  --- device tree overlay ---

  ...
  // This node will overlay on the i2c-ctrl node of the base tree
  i2c-ctrl {
      eeprom@50 { compatible = "atmel,24c64"; ... };
  };
  ...

  --- resulting device tree ---

  i2c1: i2c@abcd0000 { compatible = "xyz,i2c-ctrl"; ... };
  i2c5: i2c@cafe0000 { compatible = "xyz,i2c-ctrl"; ... };

  connector {
      i2c-ctrl {
          i2c-parent = <&i2c1>;
          #address-cells = <1>;
          #size-cells = <0>;

          eeprom@50 { ompatible = "atmel,24c64"; ... };
      };

      i2c-sensors {
          i2c-parent = <&i2c5>;
          #address-cells = <1>;
          #size-cells = <0>;
      };
  };

Here i2c-ctrl (same goes for i2c-sensors) represent the part of I2C bus
that is on the hot-pluggable add-on. On hot-plugging it will physically
connect to the I2C adapter on the base board. Let's call the 'i2c-ctrl'
node an "extension node".

In order to decouple the overlay from the base tree, the I2C adapter
(i2c@abcd0000) and the extension node (i2c-ctrl) are separate
nodes. Rightfully, only the former will probe into an I2C adapter, and it
will do that perhaps during boot, long before overlay insertion.

The extension node won't probe into an I2C adapter or any other device or
bus, so its subnodes ('eeprom@50') won't be interpreted as I2C clients by
current I2C core code. However it has an 'i2c-parent' phandle to point to
the corresponding I2C adapter node. This tells those nodes are I2C clients
of the adapter in that other node.

Extend the i2c-core-of code to look for the adapter via the 'i2c-parent'
phandle when the regular adapter lookup does not find one. This allows all
clients to be probed: both those on the base board (described in the base
device tree) and those on the add-on and described by an overlay.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Note: while this patch works for normal hotplug and unplug, it has some
weaknesses too, due to the implementation being in a OF change
notifier. Two cases come to mind:

 1. In the base device tree there must be _no_ nodes under the "extension
    node" (i2c-ctrl), or they won't be picked up as they are not
    dynamically added.

 2. In case the I2C adapter is unbound and rebound, or it probes after
    overlay insertion, it will miss the OF notifier events and so it won't
    find the devices in the extension node.

The first case is not a limiting factor: fixed I2C devices should just stay
under the good old I2C adapter node.

The second case is a limiting factor, even though not happening in "normal"
use cases. I cannot see any solution without making the adapter aware of
the "bus extensions" it has, so on its probe it can always go look for any
devices there. Taking into account the case of multiple connectors each
having an extension of the same bus, this may look as follows in device
tree:

  --- base device tree ---

  i2c1: i2c@abcd0000 {
      compatible = "xyz,i2c-ctrl"; ...
      i2c-bus-extensions = <&i2c_ctrl_conn0, &i2c_ctrl_conn1>;
  };

  connector@0 {
      i2c_ctrl_conn0: i2c-ctrl {
          i2c-parent = <&i2c1>;
          #address-cells = <1>;
          #size-cells = <0>;
      };
  };

  connector@1 {
      i2c_ctrl_conn1: i2c-ctrl {
          i2c-parent = <&i2c1>;
          #address-cells = <1>;
          #size-cells = <0>;
      };
  };

I'd love to have some feedback and opinions about the basic idea before
digging into the details of this additional step.

---

This patch first appeared in v3.
---
 drivers/i2c/i2c-core-of.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..71c559539a13 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -170,6 +170,15 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 	switch (of_reconfig_get_state_change(action, rd)) {
 	case OF_RECONFIG_CHANGE_ADD:
 		adap = of_find_i2c_adapter_by_node(rd->dn->parent);
+		if (adap == NULL) {
+			struct device_node *i2c_bus;
+
+			i2c_bus = of_parse_phandle(rd->dn->parent, "i2c-parent", 0);
+			if (i2c_bus) {
+				adap = of_find_i2c_adapter_by_node(i2c_bus);
+				of_node_put(i2c_bus);
+			}
+		}
 		if (adap == NULL)
 			return NOTIFY_OK;	/* not for us */
 

-- 
2.34.1

