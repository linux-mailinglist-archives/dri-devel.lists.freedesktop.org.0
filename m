Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D47A2A3538
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 21:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57736E323;
	Mon,  2 Nov 2020 20:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79A76E2ED
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 20:36:59 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id i18so9170973ots.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 12:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E/f8b/7igunu+rdknGPrkDKABiJMLsPgsX/ibrfgyuE=;
 b=p6kx7CF410kSinf3zKt3iuilv9xD2GFCrBmiBn4M3GPkXqwLTHbixbWiL+nuLucHLw
 B8+m4qmcaxE6Q6gNSYDLqwa14EYOD3hD7MmazFdu8OOHyqK19Q3gzBKdPi8K+ZoCzl8C
 dpNamjhKl+MBOkcXgHkM3jVHO52E25XSnYeppYCYyFVqR3ALZ/3yJsS8p1NB+7wYjLOz
 CcxWQjt79rkvKKhrv241bKypQuWGnJH6jZbN+PEfpG0Jv4Bvj5l2F6aJbHRjEJ/KVY/k
 tNFSlj1nwVO5vnuknDB3toR3B6V1gm7PB/bPAe8c8jRVafjupm8LOJhCU4yh84ubhh0n
 qOJQ==
X-Gm-Message-State: AOAM531yjqI1+cmvutRIBaaHMfWa3F91SAH6jA9yRzjshjCpgfGkrGSz
 mJDH5h1lrKjjHZ1YEYUZFg==
X-Google-Smtp-Source: ABdhPJyf/s8o41om4q5HEutHixRV/SLqdRJbExtNHML1Yger7QCH8tsfRI6Lo7DxdnBJe4ivuO4ROw==
X-Received: by 2002:a9d:6847:: with SMTP id c7mr12821073oto.134.1604349418876; 
 Mon, 02 Nov 2020 12:36:58 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z8sm3839151otm.45.2020.11.02.12.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 12:36:58 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 1/3] dt-bindings: Convert graph bindings to json-schema
Date: Mon,  2 Nov 2020 14:36:54 -0600
Message-Id: <20201102203656.220187-2-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102203656.220187-1-robh@kernel.org>
References: <20201102203656.220187-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sameer Pujar <spujar@nvidia.com>

Convert device tree bindings of graph to YAML format. Currently graph.txt
doc is referenced in multiple files and all of these need to use schema
references. For now graph.txt is updated to refer to graph.yaml.

For users of the graph binding, they should reference to the graph
schema from either 'ports' or 'port' property:

properties:
  ports:
    type: object
    $ref: graph.yaml#/properties/ports

    properties:
      port@0:
        description: What data this port has

      ...

Or:

properties:
  port:
    description: What data this port has
    type: object
    $ref: graph.yaml#/properties/port

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v3:
 - Move port 'reg' to port@* and make required
 - Make remote-endpoint required
 - Add 'additionalProperties: true' now required
 - Fix yamllint warnings

 Documentation/devicetree/bindings/graph.txt  | 129 +-----------
 Documentation/devicetree/bindings/graph.yaml | 199 +++++++++++++++++++
 2 files changed, 200 insertions(+), 128 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/graph.yaml

diff --git a/Documentation/devicetree/bindings/graph.txt b/Documentation/devicetree/bindings/graph.txt
index 0415e2c53ba0..b7818d61cef7 100644
--- a/Documentation/devicetree/bindings/graph.txt
+++ b/Documentation/devicetree/bindings/graph.txt
@@ -1,128 +1 @@
-Common bindings for device graphs
-
-General concept
----------------
-
-The hierarchical organisation of the device tree is well suited to describe
-control flow to devices, but there can be more complex connections between
-devices that work together to form a logical compound device, following an
-arbitrarily complex graph.
-There already is a simple directed graph between devices tree nodes using
-phandle properties pointing to other nodes to describe connections that
-can not be inferred from device tree parent-child relationships. The device
-tree graph bindings described herein abstract more complex devices that can
-have multiple specifiable ports, each of which can be linked to one or more
-ports of other devices.
-
-These common bindings do not contain any information about the direction or
-type of the connections, they just map their existence. Specific properties
-may be described by specialized bindings depending on the type of connection.
-
-To see how this binding applies to video pipelines, for example, see
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-Here the ports describe data interfaces, and the links between them are
-the connecting data buses. A single port with multiple connections can
-correspond to multiple devices being connected to the same physical bus.
-
-Organisation of ports and endpoints
------------------------------------
-
-Ports are described by child 'port' nodes contained in the device node.
-Each port node contains an 'endpoint' subnode for each remote device port
-connected to this port. If a single port is connected to more than one
-remote device, an 'endpoint' child node must be provided for each link.
-If more than one port is present in a device node or there is more than one
-endpoint at a port, or a port node needs to be associated with a selected
-hardware interface, a common scheme using '#address-cells', '#size-cells'
-and 'reg' properties is used to number the nodes.
-
-device {
-        ...
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        port@0 {
-	        #address-cells = <1>;
-	        #size-cells = <0>;
-		reg = <0>;
-
-                endpoint@0 {
-			reg = <0>;
-			...
-		};
-                endpoint@1 {
-			reg = <1>;
-			...
-		};
-        };
-
-        port@1 {
-		reg = <1>;
-
-		endpoint { ... };
-	};
-};
-
-All 'port' nodes can be grouped under an optional 'ports' node, which
-allows to specify #address-cells, #size-cells properties for the 'port'
-nodes independently from any other child device nodes a device might
-have.
-
-device {
-        ...
-        ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-                port@0 {
-                        ...
-                        endpoint@0 { ... };
-                        endpoint@1 { ... };
-                };
-
-                port@1 { ... };
-        };
-};
-
-Links between endpoints
------------------------
-
-Each endpoint should contain a 'remote-endpoint' phandle property that points
-to the corresponding endpoint in the port of the remote device. In turn, the
-remote endpoint should contain a 'remote-endpoint' property. If it has one, it
-must not point to anything other than the local endpoint. Two endpoints with
-their 'remote-endpoint' phandles pointing at each other form a link between the
-containing ports.
-
-device-1 {
-        port {
-                device_1_output: endpoint {
-                        remote-endpoint = <&device_2_input>;
-                };
-        };
-};
-
-device-2 {
-        port {
-                device_2_input: endpoint {
-                        remote-endpoint = <&device_1_output>;
-                };
-        };
-};
-
-Required properties
--------------------
-
-If there is more than one 'port' or more than one 'endpoint' node or 'reg'
-property present in the port and/or endpoint nodes then the following
-properties are required in a relevant parent node:
-
- - #address-cells : number of cells required to define port/endpoint
-                    identifier, should be 1.
- - #size-cells    : should be zero.
-
-Optional endpoint properties
-----------------------------
-
-- remote-endpoint: phandle to an 'endpoint' subnode of a remote device node.
-
+This file has moved to graph.yaml
diff --git a/Documentation/devicetree/bindings/graph.yaml b/Documentation/devicetree/bindings/graph.yaml
new file mode 100644
index 000000000000..b56720c5a13e
--- /dev/null
+++ b/Documentation/devicetree/bindings/graph.yaml
@@ -0,0 +1,199 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/graph.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common bindings for device graphs
+
+description: |
+  The hierarchical organisation of the device tree is well suited to describe
+  control flow to devices, but there can be more complex connections between
+  devices that work together to form a logical compound device, following an
+  arbitrarily complex graph.
+  There already is a simple directed graph between devices tree nodes using
+  phandle properties pointing to other nodes to describe connections that
+  can not be inferred from device tree parent-child relationships. The device
+  tree graph bindings described herein abstract more complex devices that can
+  have multiple specifiable ports, each of which can be linked to one or more
+  ports of other devices.
+
+  These common bindings do not contain any information about the direction or
+  type of the connections, they just map their existence. Specific properties
+  may be described by specialized bindings depending on the type of connection.
+
+  To see how this binding applies to video pipelines, for example, see
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+  Here the ports describe data interfaces, and the links between them are
+  the connecting data buses. A single port with multiple connections can
+  correspond to multiple devices being connected to the same physical bus.
+
+maintainers:
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+select: false
+
+properties:
+  port:
+    type: object
+    description:
+      If there is more than one endpoint node or 'reg' property present in
+      endpoint nodes then '#address-cells' and '#size-cells' properties are
+      required.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^endpoint(@[0-9a-f]+)?$":
+        type: object
+        properties:
+          reg:
+            maxItems: 1
+
+          remote-endpoint:
+            description: |
+              phandle to an 'endpoint' subnode of a remote device node.
+            $ref: /schemas/types.yaml#/definitions/phandle
+
+        required:
+          - remote-endpoint
+
+  ports:
+    type: object
+    description: |
+      If there is more than one port node or 'reg' property present in port
+      nodes then '#address-cells' and '#size-cells' properties are required.
+      In such cases all port nodes can be grouped under 'ports' independently
+      from any other child device nodes a device might have.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^port(@[0-9a-f]+)?$":
+        $ref: "#/properties/port"
+        type: object
+
+        properties:
+          reg:
+            maxItems: 1
+
+        required:
+          - reg
+
+
+    additionalProperties: false
+
+additionalProperties: true
+
+examples:
+  # Organisation of ports and endpoints:
+  #
+  # Ports are described by child 'port' nodes contained in the device node.
+  # Each port node contains an 'endpoint' subnode for each remote device port
+  # connected to this port. If a single port is connected to more than one
+  # remote device, an 'endpoint' child node must be provided for each link.
+  # If more than one port is present in a device node or there is more than
+  # one endpoint at a port, or a port node needs to be associated with a
+  # selected hardware interface, a common scheme using '#address-cells',
+  # '#size-cells' and 'reg' properties is used to number the nodes.
+  - |
+    device {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+
+            endpoint@0 {
+                reg = <0>;
+                // ...
+            };
+            endpoint@1 {
+                reg = <1>;
+                // ...
+            };
+        };
+
+        port@1 {
+            reg = <1>;
+
+            endpoint {
+                // ...
+            };
+        };
+    };
+
+  # All 'port' nodes can be grouped under an optional 'ports' node, which
+  # allows to specify #address-cells, #size-cells properties for the 'port'
+  # nodes independently from any other child device nodes a device might
+  # have.
+  - |
+    device {
+        // ...
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+                // ...
+
+                endpoint@0 {
+                    reg = <0>;
+                    // ...
+                };
+                endpoint@1 {
+                    reg = <1>;
+                    // ...
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+                // ...
+            };
+        };
+    };
+
+  # Links between endpoints:
+  #
+  # Each endpoint should contain a 'remote-endpoint' phandle property that
+  # points to the corresponding endpoint in the port of the remote device.
+  # In turn, the remote endpoint should contain a 'remote-endpoint' property.
+  # If it has one, it must not point to anything other than the local endpoint.
+  # Two endpoints with their 'remote-endpoint' phandles pointing at each other
+  # form a link between the containing ports.
+  - |
+    device-1 {
+        port {
+            device_1_output: endpoint {
+                remote-endpoint = <&device_2_input>;
+            };
+        };
+    };
+
+    device-2 {
+        port {
+            device_2_input: endpoint {
+                remote-endpoint = <&device_1_output>;
+            };
+        };
+    };
+
+...
--
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
