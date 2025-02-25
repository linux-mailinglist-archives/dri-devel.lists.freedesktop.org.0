Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3842AA44549
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E8110E736;
	Tue, 25 Feb 2025 16:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aayJ+tLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B8B10E736
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:02:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 21FF65C7228;
 Tue, 25 Feb 2025 16:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263E1C4CEDD;
 Tue, 25 Feb 2025 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740499371;
 bh=NKncxX/f4OhZjM586JgqScppgEm06MohF+FhDmQBvJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aayJ+tLxA6sG7cTVHHP4hUNez7LShHiaUnSSJzHetMr0TTsIqSW1PvC+ZUJ9IylE7
 XlWq5aGz/7ZLsFiIKCGQ+pWmDERxvEmBdfgcQNT73hLMRjK/aWv1nxDQ9Be+WUtb/9
 IxLLTAq02Rm+/M6N3AyMn3uwkw/UY1hMjCSoMBjMSIaePE/L+Qt01+v17wK+HsdLta
 yuvJmFvmc3hkC+asYqMSqPc7TAUKOm/snWXAHGGLreTeuo2+hfnTYI6e9APTZJVd+T
 8oKTWtP4n5A+GLUUHGhO38M0u90xZ/OY0/wrimn3qWuhSur6TavIPSH36oLHQA9CbG
 WLKmVFAGQ+l4A==
Date: Tue, 25 Feb 2025 10:02:48 -0600
From: Rob Herring <robh@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
Message-ID: <20250225160248.GA2563229-robh@kernel.org>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net>
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

On Tue, Feb 25, 2025 at 08:55:47AM +0100, Tomeu Vizoso wrote:
> Add the bindings for the Neural Processing Unit IP from Rockchip.
> 
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a9f4aa7c1901362a3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Neural Processing Unit IP from Rockchip
> +
> +maintainers:
> +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +
> +description:
> +  Rockchip IP for accelerating inference of neural networks, based on NVIDIA's
> +  open source NVDLA IP.
> +
> +properties:
> +  $nodename:
> +    pattern: '^npu-core@[a-f0-9]+$'
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-rknn-core-top
> +          - const: rockchip,rknn-core-top

Drop the fallbacks unless you have some evidence that the IP is the 
same across a lot of SoCs. If you don't, then 
rockchip,rk3588-rknn-core-top can be the fallback whenever there are 
more compatible SoCs.

Or if there's version/feature registers that otherwise make it 
discoverable, then a common compatible is fine.

> +      - items:
> +          - enum:
> +              - rockchip,rk3588-rknn-core
> +          - const: rockchip,rknn-core

I don't understand the difference between core and core-top. That needs 
to be explained in the top-level description.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: npu
> +      - const: pclk
> +    minItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  npu-supply: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: srst_a
> +      - const: srst_h
> +
> +  sram-supply: true

Group supply properties together

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - iommus
> +  - npu-supply
> +  - power-domains
> +  - resets
> +  - reset-names
> +  - sram-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rknn-core-top
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +
> +        clock-names:
> +          minItems: 4
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rknn-core
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    bus {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      rknn_core_top: npu-core@fdab0000 {

npu@...

> +        compatible = "rockchip,rk3588-rknn-core-top", "rockchip,rknn-core-top";
> +        reg = <0x0 0xfdab0000 0x0 0x9000>;
> +        assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
> +        assigned-clock-rates = <200000000>;
> +        clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
> +                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
> +        clock-names = "aclk", "hclk", "npu", "pclk";
> +        interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> +        iommus = <&rknn_mmu_top>;
> +        npu-supply = <&vdd_npu_s0>;
> +        power-domains = <&power RK3588_PD_NPUTOP>;
> +        resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
> +        reset-names = "srst_a", "srst_h";
> +        sram-supply = <&vdd_npu_mem_s0>;
> +      };
> +
> +      rknn_core_1: npu-core@fdac0000 {
> +        compatible = "rockchip,rk3588-rknn-core", "rockchip,rknn-core";
> +        reg = <0x0 0xfdac0000 0x0 0x9000>;
> +        clocks = <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
> +        clock-names = "aclk", "hclk";
> +        interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
> +        iommus = <&rknn_mmu_1>;
> +        npu-supply = <&vdd_npu_s0>;
> +        power-domains = <&power RK3588_PD_NPU1>;
> +        resets = <&cru SRST_A_RKNN1>, <&cru SRST_H_RKNN1>;
> +        reset-names = "srst_a", "srst_h";
> +        sram-supply = <&vdd_npu_mem_s0>;
> +      };
> +    };
> +...
> 
> -- 
> 2.48.1
> 
