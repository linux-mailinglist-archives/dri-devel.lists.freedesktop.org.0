Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763952AF2D7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 15:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C61489E0C;
	Wed, 11 Nov 2020 14:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D3689E0C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 14:00:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B976A19;
 Wed, 11 Nov 2020 15:00:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1605103213;
 bh=mKuIU8+K1pEz/DAf9qGA5X2ulnU2pOxz9ZcXmP8HD6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u96T04zATw1qPei0aXyrH2433zbXh1G9obPHYvbsb8oJMPdKIUvmSL36VIwDE1xyl
 VPpviWXc3ojSf7nYbaZOj23SUvEKeaaCjpLtrkcQLizYbR5OS4C4Bbont2A0FFfQ5I
 N7mD3h0IsIAtd7QLOpOVEDiK3qeLIgX3/nlBVjEE=
Date: Wed, 11 Nov 2020 16:00:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: Convert graph bindings to json-schema
Message-ID: <20201111140009.GD4115@pendragon.ideasonboard.com>
References: <20201102203656.220187-1-robh@kernel.org>
 <20201102203656.220187-2-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102203656.220187-2-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob and Sameer,

Thank you for the patch.

On Mon, Nov 02, 2020 at 02:36:54PM -0600, Rob Herring wrote:
> From: Sameer Pujar <spujar@nvidia.com>
> 
> Convert device tree bindings of graph to YAML format. Currently graph.txt
> doc is referenced in multiple files and all of these need to use schema
> references. For now graph.txt is updated to refer to graph.yaml.
> 
> For users of the graph binding, they should reference to the graph
> schema from either 'ports' or 'port' property:
> 
> properties:
>   ports:
>     type: object
>     $ref: graph.yaml#/properties/ports
> 
>     properties:
>       port@0:
>         description: What data this port has
> 
>       ...
> 
> Or:
> 
> properties:
>   port:
>     description: What data this port has
>     type: object
>     $ref: graph.yaml#/properties/port

Sounds like a good approach.

> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v3:
>  - Move port 'reg' to port@* and make required
>  - Make remote-endpoint required
>  - Add 'additionalProperties: true' now required
>  - Fix yamllint warnings
> 
>  Documentation/devicetree/bindings/graph.txt  | 129 +-----------
>  Documentation/devicetree/bindings/graph.yaml | 199 +++++++++++++++++++
>  2 files changed, 200 insertions(+), 128 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/graph.yaml
> 
> diff --git a/Documentation/devicetree/bindings/graph.txt b/Documentation/devicetree/bindings/graph.txt
> index 0415e2c53ba0..b7818d61cef7 100644
> --- a/Documentation/devicetree/bindings/graph.txt
> +++ b/Documentation/devicetree/bindings/graph.txt
> @@ -1,128 +1 @@
> -Common bindings for device graphs
> -
> -General concept
> ----------------
> -
> -The hierarchical organisation of the device tree is well suited to describe
> -control flow to devices, but there can be more complex connections between
> -devices that work together to form a logical compound device, following an
> -arbitrarily complex graph.
> -There already is a simple directed graph between devices tree nodes using
> -phandle properties pointing to other nodes to describe connections that
> -can not be inferred from device tree parent-child relationships. The device
> -tree graph bindings described herein abstract more complex devices that can
> -have multiple specifiable ports, each of which can be linked to one or more
> -ports of other devices.
> -
> -These common bindings do not contain any information about the direction or
> -type of the connections, they just map their existence. Specific properties
> -may be described by specialized bindings depending on the type of connection.
> -
> -To see how this binding applies to video pipelines, for example, see
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -Here the ports describe data interfaces, and the links between them are
> -the connecting data buses. A single port with multiple connections can
> -correspond to multiple devices being connected to the same physical bus.
> -
> -Organisation of ports and endpoints
> ------------------------------------
> -
> -Ports are described by child 'port' nodes contained in the device node.
> -Each port node contains an 'endpoint' subnode for each remote device port
> -connected to this port. If a single port is connected to more than one
> -remote device, an 'endpoint' child node must be provided for each link.
> -If more than one port is present in a device node or there is more than one
> -endpoint at a port, or a port node needs to be associated with a selected
> -hardware interface, a common scheme using '#address-cells', '#size-cells'
> -and 'reg' properties is used to number the nodes.
> -
> -device {
> -        ...
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> -
> -        port@0 {
> -	        #address-cells = <1>;
> -	        #size-cells = <0>;
> -		reg = <0>;
> -
> -                endpoint@0 {
> -			reg = <0>;
> -			...
> -		};
> -                endpoint@1 {
> -			reg = <1>;
> -			...
> -		};
> -        };
> -
> -        port@1 {
> -		reg = <1>;
> -
> -		endpoint { ... };
> -	};
> -};
> -
> -All 'port' nodes can be grouped under an optional 'ports' node, which
> -allows to specify #address-cells, #size-cells properties for the 'port'
> -nodes independently from any other child device nodes a device might
> -have.
> -
> -device {
> -        ...
> -        ports {
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> -
> -                port@0 {
> -                        ...
> -                        endpoint@0 { ... };
> -                        endpoint@1 { ... };
> -                };
> -
> -                port@1 { ... };
> -        };
> -};
> -
> -Links between endpoints
> ------------------------
> -
> -Each endpoint should contain a 'remote-endpoint' phandle property that points
> -to the corresponding endpoint in the port of the remote device. In turn, the
> -remote endpoint should contain a 'remote-endpoint' property. If it has one, it
> -must not point to anything other than the local endpoint. Two endpoints with
> -their 'remote-endpoint' phandles pointing at each other form a link between the
> -containing ports.
> -
> -device-1 {
> -        port {
> -                device_1_output: endpoint {
> -                        remote-endpoint = <&device_2_input>;
> -                };
> -        };
> -};
> -
> -device-2 {
> -        port {
> -                device_2_input: endpoint {
> -                        remote-endpoint = <&device_1_output>;
> -                };
> -        };
> -};
> -
> -Required properties
> --------------------
> -
> -If there is more than one 'port' or more than one 'endpoint' node or 'reg'
> -property present in the port and/or endpoint nodes then the following
> -properties are required in a relevant parent node:
> -
> - - #address-cells : number of cells required to define port/endpoint
> -                    identifier, should be 1.
> - - #size-cells    : should be zero.
> -
> -Optional endpoint properties
> -----------------------------
> -
> -- remote-endpoint: phandle to an 'endpoint' subnode of a remote device node.
> -
> +This file has moved to graph.yaml
> diff --git a/Documentation/devicetree/bindings/graph.yaml b/Documentation/devicetree/bindings/graph.yaml
> new file mode 100644
> index 000000000000..b56720c5a13e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/graph.yaml
> @@ -0,0 +1,199 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/graph.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common bindings for device graphs
> +
> +description: |
> +  The hierarchical organisation of the device tree is well suited to describe
> +  control flow to devices, but there can be more complex connections between
> +  devices that work together to form a logical compound device, following an
> +  arbitrarily complex graph.
> +  There already is a simple directed graph between devices tree nodes using
> +  phandle properties pointing to other nodes to describe connections that
> +  can not be inferred from device tree parent-child relationships. The device
> +  tree graph bindings described herein abstract more complex devices that can
> +  have multiple specifiable ports, each of which can be linked to one or more
> +  ports of other devices.
> +
> +  These common bindings do not contain any information about the direction or
> +  type of the connections, they just map their existence. Specific properties
> +  may be described by specialized bindings depending on the type of connection.
> +
> +  To see how this binding applies to video pipelines, for example, see
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +  Here the ports describe data interfaces, and the links between them are
> +  the connecting data buses. A single port with multiple connections can
> +  correspond to multiple devices being connected to the same physical bus.
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +select: false
> +
> +properties:
> +  port:
> +    type: object
> +    description:
> +      If there is more than one endpoint node or 'reg' property present in
> +      endpoint nodes then '#address-cells' and '#size-cells' properties are
> +      required.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^endpoint(@[0-9a-f]+)?$":
> +        type: object
> +        properties:
> +          reg:
> +            maxItems: 1
> +
> +          remote-endpoint:
> +            description: |
> +              phandle to an 'endpoint' subnode of a remote device node.
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +
> +        required:
> +          - remote-endpoint

As noted elsewhere, this shouldn't be required.

Should we set additionalProperties: false here ?

> +
> +  ports:
> +    type: object
> +    description: |
> +      If there is more than one port node or 'reg' property present in port
> +      nodes then '#address-cells' and '#size-cells' properties are required.
> +      In such cases all port nodes can be grouped under 'ports' independently
> +      from any other child device nodes a device might have.

Allowing multiple port nodes not grouped in a ports node has created
complexity, with very little gain. Should we forbid that going forward ?

> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^port(@[0-9a-f]+)?$":
> +        $ref: "#/properties/port"
> +        type: object
> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +
> +        required:
> +          - reg
> +
> +

Maybe a single blank line ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +    additionalProperties: false
> +
> +additionalProperties: true
> +
> +examples:
> +  # Organisation of ports and endpoints:
> +  #
> +  # Ports are described by child 'port' nodes contained in the device node.
> +  # Each port node contains an 'endpoint' subnode for each remote device port
> +  # connected to this port. If a single port is connected to more than one
> +  # remote device, an 'endpoint' child node must be provided for each link.
> +  # If more than one port is present in a device node or there is more than
> +  # one endpoint at a port, or a port node needs to be associated with a
> +  # selected hardware interface, a common scheme using '#address-cells',
> +  # '#size-cells' and 'reg' properties is used to number the nodes.
> +  - |
> +    device {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +
> +            endpoint@0 {
> +                reg = <0>;
> +                // ...
> +            };
> +            endpoint@1 {
> +                reg = <1>;
> +                // ...
> +            };
> +        };
> +
> +        port@1 {
> +            reg = <1>;
> +
> +            endpoint {
> +                // ...
> +            };
> +        };
> +    };
> +
> +  # All 'port' nodes can be grouped under an optional 'ports' node, which
> +  # allows to specify #address-cells, #size-cells properties for the 'port'
> +  # nodes independently from any other child device nodes a device might
> +  # have.
> +  - |
> +    device {
> +        // ...
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +                // ...
> +
> +                endpoint@0 {
> +                    reg = <0>;
> +                    // ...
> +                };
> +                endpoint@1 {
> +                    reg = <1>;
> +                    // ...
> +                };
> +            };
> +
> +            port@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +                // ...
> +            };
> +        };
> +    };
> +
> +  # Links between endpoints:
> +  #
> +  # Each endpoint should contain a 'remote-endpoint' phandle property that
> +  # points to the corresponding endpoint in the port of the remote device.
> +  # In turn, the remote endpoint should contain a 'remote-endpoint' property.
> +  # If it has one, it must not point to anything other than the local endpoint.
> +  # Two endpoints with their 'remote-endpoint' phandles pointing at each other
> +  # form a link between the containing ports.
> +  - |
> +    device-1 {
> +        port {
> +            device_1_output: endpoint {
> +                remote-endpoint = <&device_2_input>;
> +            };
> +        };
> +    };
> +
> +    device-2 {
> +        port {
> +            device_2_input: endpoint {
> +                remote-endpoint = <&device_1_output>;
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
