Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F30C661F70
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 08:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1F510E068;
	Mon,  9 Jan 2023 07:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAC810E068
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 07:49:53 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.227.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 435653EE24;
 Mon,  9 Jan 2023 08:49:49 +0100 (CET)
Date: Mon, 9 Jan 2023 08:49:47 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Message-ID: <20230109074947.5vnfrn6shzpm6iqi@SoMainline.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-09 07:01:49, Dmitry Baryshkov wrote:
> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>  - MSM8996 has additional "iommu" clock, define it separately
>  - Add new properties used on some of platforms:
>    - interconnects, interconnect-names
>    - iommus
>    - power-domains
>    - operating-points-v2, opp-table
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
>  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
>  2 files changed, 138 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> deleted file mode 100644
> index 65d03c58dee6..000000000000
> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
> +++ /dev/null
> @@ -1,132 +0,0 @@
> -Qualcomm adreno/snapdragon MDP5 display controller
> -
> -Description:
> -
> -This is the bindings documentation for the MDP5 display
> -controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
> -
> -MDP5:
> -Required properties:
> -- compatible:
> -  * "qcom,mdp5" - MDP5
> -- reg: Physical base address and length of the controller's registers.
> -- reg-names: The names of register regions. The following regions are required:
> -  * "mdp_phys"
> -- interrupts: Interrupt line from MDP5 to MDSS interrupt controller.
> -- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
> -- clock-names: the following clocks are required.
> --   * "bus"
> --   * "iface"
> --   * "core"
> --   * "vsync"
> -- ports: contains the list of output ports from MDP. These connect to interfaces
> -  that are external to the MDP hardware, such as HDMI, DSI, EDP etc (LVDS is a
> -  special case since it is a part of the MDP block itself).
> -
> -  Each output port contains an endpoint that describes how it is connected to an
> -  external interface. These are described by the standard properties documented
> -  here:
> -	Documentation/devicetree/bindings/graph.txt
> -	Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -  The availability of output ports can vary across SoC revisions:
> -
> -  For MSM8974 and APQ8084:
> -	 Port 0 -> MDP_INTF0 (eDP)
> -	 Port 1 -> MDP_INTF1 (DSI1)
> -	 Port 2 -> MDP_INTF2 (DSI2)
> -	 Port 3 -> MDP_INTF3 (HDMI)
> -
> -  For MSM8916:
> -	 Port 0 -> MDP_INTF1 (DSI1)
> -
> -  For MSM8994 and MSM8996:
> -	 Port 0 -> MDP_INTF1 (DSI1)
> -	 Port 1 -> MDP_INTF2 (DSI2)
> -	 Port 2 -> MDP_INTF3 (HDMI)
> -
> -Optional properties:
> -- clock-names: the following clocks are optional:
> -  * "lut"
> -  * "tbu"
> -  * "tbu_rt"
> -
> -Example:
> -
> -/ {
> -	...
> -
> -	mdss: mdss@1a00000 {
> -		compatible = "qcom,mdss";
> -		reg = <0x1a00000 0x1000>,
> -		      <0x1ac8000 0x3000>;
> -		reg-names = "mdss_phys", "vbif_phys";
> -
> -		power-domains = <&gcc MDSS_GDSC>;
> -
> -		clocks = <&gcc GCC_MDSS_AHB_CLK>,
> -			 <&gcc GCC_MDSS_AXI_CLK>,
> -			 <&gcc GCC_MDSS_VSYNC_CLK>;
> -		clock-names = "iface",
> -			      "bus",
> -			      "vsync"
> -
> -		interrupts = <0 72 0>;
> -
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -
> -		mdp: mdp@1a01000 {
> -			compatible = "qcom,mdp5";
> -			reg = <0x1a01000 0x90000>;
> -			reg-names = "mdp_phys";
> -
> -			interrupt-parent = <&mdss>;
> -			interrupts = <0 0>;
> -
> -			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> -				 <&gcc GCC_MDSS_AXI_CLK>,
> -				 <&gcc GCC_MDSS_MDP_CLK>,
> -				 <&gcc GCC_MDSS_VSYNC_CLK>;
> -			clock-names = "iface",
> -				      "bus",
> -				      "core",
> -				      "vsync";
> -
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -					mdp5_intf1_out: endpoint {
> -						remote-endpoint = <&dsi0_in>;
> -					};
> -				};
> -			};
> -		};
> -
> -		dsi0: dsi@1a98000 {
> -			...
> -			ports {
> -				...
> -				port@0 {
> -					reg = <0>;
> -					dsi0_in: endpoint {
> -						remote-endpoint = <&mdp5_intf1_out>;
> -					};
> -				};
> -				...
> -			};
> -			...
> -		};
> -
> -		dsi_phy0: dsi-phy@1a98300 {
> -			...
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> new file mode 100644
> index 000000000000..cbcbe8b47e9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,mdp5.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Adreno/Snapdragon Mobile Display controller (MDP5)
> +
> +description: >
> +  MDP5 display controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994
> +  and MSM8996.
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: qcom,mdp5
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    items:
> +      - const: mdp_phys
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 4
> +    maxItems: 7
> +
> +  clock-names:
> +    oneOf:
> +      - minItems: 4
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: core
> +          - const: vsync
> +          - const: lut
> +          - const: tbu
> +          - const: tbu_rt
> +        #MSM8996 has additional iommu clock
> +      - items:
> +          - const: iface
> +          - const: bus
> +          - const: core
> +          - const: iommu
> +          - const: vsync
> +
> +  interconnects:
> +    minItems: 1
> +    items:
> +      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
> +      - description: Interconnect path from mdp1 port to the data bus
> +      - description: Interconnect path from rotator port to the data bus
> +
> +  interconnect-names:
> +    minItems: 1
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +      - const: rotator-mem
> +
> +  iommus:
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0

As Krzysztof has said many times, these documents describe the hardware,
not the DT format.  Drop the "phandle" part.

> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |

Should multiline descriptions be treated as a oneline string with `>`?

> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc. MDP5 devices support up to 4 ports::

How do these double colons render?  Is this intentional?

- Marijn

> +      one or two DSI ports, HDMI and eDP.
> +
> +    patternProperties:
> +      "^port@[0-3]+$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +    # at least one port is required
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    display-controller@1a01000 {
> +        compatible = "qcom,mdp5";
> +        reg = <0x1a01000 0x90000>;
> +        reg-names = "mdp_phys";
> +
> +        interrupt-parent = <&mdss>;
> +        interrupts = <0>;
> +
> +        clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +                 <&gcc GCC_MDSS_AXI_CLK>,
> +                 <&gcc GCC_MDSS_MDP_CLK>,
> +                 <&gcc GCC_MDSS_VSYNC_CLK>;
> +        clock-names = "iface",
> +                      "bus",
> +                      "core",
> +                      "vsync";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                endpoint {
> +                    remote-endpoint = <&dsi0_in>;
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.39.0
> 
