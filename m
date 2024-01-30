Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB07842D5F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 20:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC361134FF;
	Tue, 30 Jan 2024 19:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BA91134FF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 19:55:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A5D0B61058;
 Tue, 30 Jan 2024 19:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC8AC433C7;
 Tue, 30 Jan 2024 19:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706644502;
 bh=YV58XM8z5DcA8R7rpigVE/zuFs2tguSdvi43bLmSNt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ed+UPfyrWqTCC+Iu92Dw0Tt8bJP3lGjPpH887lcUwEYOTErYMmdRD3NAIhoh4LANU
 M2cfKqy4U5uto40nmx3EG+sJEJShTFnztA//vSzqte0NDpI5qii2b23z0TGraX7xGH
 TN9uDcWtnMMvYJuKfB+WdrogbAPN3dXTAX3WZpKACsD0YTH3Yk34sRslKL6foCpD9W
 kbmc1Z3gvcF2SPsteZFUsJayIrSnlVVfaxoYB8u60wlWv7S8x+n0aAEeiv2xG/dhA/
 Rk+AWaqqopxi9MthaMZhHKicJ8NWBQm8WzC2gKlXKQ3ekEqm5Gwvm3I9MCSiUeN6Oe
 22nG0+C2kHw9A==
Date: Tue, 30 Jan 2024 13:54:59 -0600
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 13/14] dt-bindings: gpu: mali-valhall-csf: Add support
 for Arm Mali CSF GPUs
Message-ID: <20240130195459.GA2187809-robh@kernel.org>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <20240122163047.1954733-14-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122163047.1954733-14-boris.brezillon@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Ketil Johnsen <ketil.johnsen@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Diamand <chris.diamand@foss.arm.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 05:30:44PM +0100, Boris Brezillon wrote:
> From: Liviu Dudau <liviu.dudau@arm.com>
> 
> Arm has introduced a new v10 GPU architecture that replaces the Job Manager
> interface with a new Command Stream Frontend. It adds firmware driven
> command stream queues that can be used by kernel and user space to submit
> jobs to the GPU.
> 
> Add the initial schema for the device tree that is based on support for
> RK3588 SoC. The minimum number of clocks is one for the IP, but on Rockchip
> platforms they will tend to expose the semi-independent clocks for better
> power management.
> 
> v4:
> - Fix formatting issue
> 
> v3:
> - Cleanup commit message to remove redundant text
> - Added opp-table property and re-ordered entries
> - Clarified power-domains and power-domain-names requirements for RK3588.
> - Cleaned up example
> 
> Note: power-domains and power-domain-names requirements for other platforms
> are still work in progress, hence the bindings are left incomplete here.
> 
> v2:
> - New commit
> 
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> new file mode 100644
> index 000000000000..be1f6bacc3f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/arm,mali-valhall-csf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali Valhall GPU
> +
> +maintainers:
> +  - Liviu Dudau <liviu.dudau@arm.com>
> +  - Boris Brezillon <boris.brezillon@collabora.com>
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-mali
> +          - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Job interrupt
> +      - description: MMU interrupt
> +      - description: GPU interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: job
> +      - const: mmu
> +      - const: gpu
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: coregroup
> +      - const: stacks
> +
> +  mali-supply: true
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    minItems: 1
> +    maxItems: 5
> +
> +  power-domain-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  sram-supply: true
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +  dynamic-power-coefficient:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      A u32 value that represents the running time dynamic
> +      power coefficient in units of uW/MHz/V^2. The
> +      coefficient can either be calculated from power
> +      measurements or derived by analysis.
> +
> +      The dynamic power consumption of the GPU is
> +      proportional to the square of the Voltage (V) and
> +      the clock frequency (f). The coefficient is used to
> +      calculate the dynamic power as below -
> +
> +      Pdyn = dynamic-power-coefficient * V^2 * f
> +
> +      where voltage is in V, frequency is in MHz.
> +
> +  dma-coherent: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - mali-supply
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-mali
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        power-domains:
> +          maxItems: 1
> +        power-domain-names: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +
> +    gpu: gpu@fb000000 {
> +        compatible = "rockchip,rk3588-mali", "arm,mali-valhall-csf";
> +        reg = <0xfb000000 0x200000>;
> +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH 0>;
> +        interrupt-names = "job", "mmu", "gpu";
> +        clock-names = "core", "coregroup", "stacks";
> +        clocks = <&cru CLK_GPU>, <&cru CLK_GPU_COREGROUP>,
> +                 <&cru CLK_GPU_STACKS>;
> +        power-domains = <&power RK3588_PD_GPU>;
> +        operating-points-v2 = <&gpu_opp_table>;
> +        mali-supply = <&vdd_gpu_s0>;
> +        sram-supply = <&vdd_gpu_mem_s0>;
> +    };
> +
> +    gpu_opp_table: opp-table {

Move this into the gpu node. With that,

Reviewed-by: Rob Herring <robh@kernel.org>


> +        compatible = "operating-points-v2";
> +        opp-300000000 {
> +            opp-hz = /bits/ 64 <300000000>;
> +            opp-microvolt = <675000 675000 850000>;
> +        };
> +        opp-400000000 {
> +            opp-hz = /bits/ 64 <400000000>;
> +            opp-microvolt = <675000 675000 850000>;
> +        };
> +    };
> +
> +...
> -- 
> 2.43.0
> 
