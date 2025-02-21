Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8052AA3EFA9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 10:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B3B10EA3F;
	Fri, 21 Feb 2025 09:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m8zPwa7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D3810E178
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 09:11:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 087A961182;
 Fri, 21 Feb 2025 09:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D00C4CED6;
 Fri, 21 Feb 2025 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740129100;
 bh=OnhM+IngcbfTGE1ogRH7mwjuGlDyBD9XjnvZeiestVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m8zPwa7Xb55i7LAqI58OdJeShKNREpdDkpI1YATQdlyc5nCRDRdZN0I5YrBle66XN
 VNc/7jANzsn07jLN8/IM74GX4QngHJx5RAPjeNrgQBfyauJJM3auB53GrOsjcjGU+j
 gUYKsk63YZzIgkoX94R7rd52iMjRZTwSouG21VOjmPRw6F/kF+XRRAsHVDBNomPBzl
 cfpQL3tJoumzj8Ic3A2bdn2V6dPqyr1bGqxDjKnu/2oKTTjjVdGbSEqaDSbF0p7hjO
 ZC0JywTcJXnsDpdoNESpXVffOFF/HAmfvEXSFEqtUyz9bqsCSbqHCoD9fguLgLa29Z
 DxZCFi5Naz+7Q==
Date: Fri, 21 Feb 2025 10:11:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 09/21] dt-bindings: clock: thead: Add GPU clkgen reset
 property
Message-ID: <20250221-imaginary-ebony-macaque-aace8d@krzk-bin>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639@eucas1p2.samsung.com>
 <20250219140239.1378758-10-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-10-m.wilczynski@samsung.com>
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

On Wed, Feb 19, 2025 at 03:02:27PM +0100, Michal Wilczynski wrote:
> Add a mandatory reset property for the TH1520 VO clock controller that
> handles the GPU clocks. This reset line controls the GPU CLKGEN reset,
> which is required for proper GPU clock operation.
> 
> The reset property is only required for the "thead,th1520-clk-vo"
> compatible, as it specifically handles the GPU-related clocks.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/clock/thead,th1520-clk-ap.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> index 9d058c00ab3d..6ea8202718d0 100644
> --- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> @@ -40,6 +40,12 @@ properties:
>              (integer PLL) typically running at 792 MHz (FOUTPOSTDIV), with
>              a maximum FOUTVCO of 2376 MHz.
>  
> +  resets:
> +    maxItems: 1
> +    description:
> +      Required for "thead,th1520-clk-vo". This reset line controls the

You just added the compatible in other patch, so are you saying you
added knowingly incomplete code?

No, this must be squashed.

> +      GPU CLKGEN reset which is required for proper GPU clock operation.
> +
>    "#clock-cells":
>      const: 1
>      description:
> @@ -51,6 +57,16 @@ required:
>    - clocks
>    - "#clock-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-clk-vo
> +    then:
> +      required:
> +        - resets

else:
? What's there? Also reset or no?

Best regards,
Krzysztof

