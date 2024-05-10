Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A96C8C2BD0
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765DE10E141;
	Fri, 10 May 2024 21:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UipB6XU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EB010E141
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:24:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D94561F5E;
 Fri, 10 May 2024 21:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EFBC113CC;
 Fri, 10 May 2024 21:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715376284;
 bh=5B4GSsJHihG1nPIgeAO/Snq6kp/3onLar7cELMkgbKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UipB6XU2vVDZU5TwTzhz3hbL7NbEhWMTIJ2o9YYdqIw6TTmEylpgttHOY3gXZ6mxP
 0AmlHKQK7nNxq8kijxSI049zDP0vrooGTOHPNoma8EZs7dtKwL0T/Lmt/pC5s+cz3V
 UqsZBhc9+qOGZx/qn1ID/a4IKSXJYMUzHErL9V7RjlwK6/XjRlAzOk0BSr926r3Vep
 NDqWyL6uwRIHHDzia2ZScS+++SiDHssaLdeNc1meer6+un4XzTVdqcadjKZAeRBTb/
 +I4t0G0Jzj4RA18wfLiYWdrzZRfkpY3agGLN9SIsmDn6sqTdf/FjGFDBSGkvR9T6kD
 RkwH0W8rf5Qbg==
Date: Fri, 10 May 2024 16:24:42 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl,
 krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com
Subject: Re: [PATCH v3 09/10] media: dt-bindings: Add Intel Displayport RX IP
Message-ID: <20240510212442.GA758313-robh@kernel.org>
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-10-panikiel@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507155413.266057-10-panikiel@google.com>
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

On Tue, May 07, 2024 at 03:54:12PM +0000, Paweł Anikiel wrote:
> Add dt binding for the Intel Displayport receiver FPGA IP.
> It is a part of the DisplayPort Intel FPGA IP Core, and supports
> DisplayPort 1.4, HBR3 video capture and Multi-Stream Transport.
> 
> The user guide can be found here:
> https://www.intel.com/programmable/technical-pdfs/683273.pdf
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  .../devicetree/bindings/media/intel,dprx.yaml | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> new file mode 100644
> index 000000000000..01bed858f746
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel DisplayPort RX IP
> +
> +maintainers:
> +  - Paweł Anikiel <panikiel@google.com>
> +
> +description: |
> +  The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> +  Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> +  capture and Multi-Stream Transport.
> +
> +  The IP features a large number of configuration parameters, found at:
> +  https://www.intel.com/content/www/us/en/docs/programmable/683273/23-3-20-0-1/sink-parameters.html
> +
> +  The following parameters have to be enabled:
> +    - Support DisplayPort sink
> +    - Enable GPU control
> +  The following parameters have to be set in the devicetree:
> +    - RX maximum link rate (using link-frequencies)
> +    - Maximum lane count (using data-lanes)
> +    - Support MST (using multi-stream-support)
> +    - Max stream count (inferred from the number of ports)
> +
> +properties:
> +  compatible:
> +    const: intel,dprx-20.0.1
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: MST virtual channel 0 or SST main link
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +
> +            properties:
> +              link-frequencies: true
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              multi-stream-support: true
> +
> +            required:
> +              - data-lanes
> +              - link-frequencies
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MST virtual channel 0 or SST main link

How can port@0 also be "MST virtual channel 0 or SST main link"?

> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MST virtual channel 1
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MST virtual channel 2
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MST virtual channel 3
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dp-receiver@c0062000 {
> +        compatible = "intel,dprx-20.0.1";
> +        reg = <0xc0062000 0x800>;
> +        interrupt-parent = <&dprx_mst_irq>;
> +        interrupts = <0 IRQ_TYPE_EDGE_RISING>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dprx_mst_in: endpoint {
> +                    remote-endpoint = <&dp_input_mst_0>;
> +                    data-lanes = <0 1 2 3>;
> +                    link-frequencies = /bits/ 64 <1620000000 2700000000
> +                                                  5400000000 8100000000>;
> +                    multi-stream-support;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dprx_mst_0: endpoint {
> +                    remote-endpoint = <&video_mst0_0>;
> +                };
> +            };
> +
> +            port@2 {
> +                reg = <2>;
> +                dprx_mst_1: endpoint {
> +                    remote-endpoint = <&video_mst1_0>;
> +                };
> +            };
> +
> +            port@3 {
> +                reg = <3>;
> +                dprx_mst_2: endpoint {
> +                    remote-endpoint = <&video_mst2_0>;
> +                };
> +            };
> +
> +            port@4 {
> +                reg = <4>;
> +                dprx_mst_3: endpoint {
> +                    remote-endpoint = <&video_mst3_0>;
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    dp-receiver@c0064000 {
> +        compatible = "intel,dprx-20.0.1";
> +        reg = <0xc0064000 0x800>;
> +        interrupt-parent = <&dprx_sst_irq>;
> +        interrupts = <0 IRQ_TYPE_EDGE_RISING>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dprx_sst_in: endpoint {
> +                    remote-endpoint = <&dp_input_sst_0>;
> +                    data-lanes = <0 1 2 3>;
> +                    link-frequencies = /bits/ 64 <1620000000 2700000000
> +                                                  5400000000 8100000000>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dprx_sst_0: endpoint {
> +                    remote-endpoint = <&video_sst_0>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.45.0.rc1.225.g2a3ae87e7f-goog
> 
