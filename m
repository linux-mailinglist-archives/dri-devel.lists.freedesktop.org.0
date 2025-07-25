Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5F2B118BD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 08:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D9B10E078;
	Fri, 25 Jul 2025 06:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0EB10E078
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 06:59:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD53A5C5F5A;
 Fri, 25 Jul 2025 06:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7BCC4CEE7;
 Fri, 25 Jul 2025 06:59:23 +0000 (UTC)
Date: Fri, 25 Jul 2025 08:59:22 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v8 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Message-ID: <20250725-gainful-saluki-of-mathematics-3c0dd0@kuoka>
References: <20250724-apr_14_for_sending-v8-0-0714bef83c59@samsung.com>
 <CGME20250724141911eucas1p17071ea620f183faff7ca00cad25cf824@eucas1p1.samsung.com>
 <20250724-apr_14_for_sending-v8-2-0714bef83c59@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250724-apr_14_for_sending-v8-2-0714bef83c59@samsung.com>
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

On Thu, Jul 24, 2025 at 04:18:59PM +0200, Michal Wilczynski wrote:
> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
> specific GPU compatible string.
> 
> The thead,th1520-gpu compatible, along with its full chain
> img,img-bxm-4-64, and img,img-rogue, is added to the
> list of recognized GPU types.
> 
> While the BXM-4-64 GPU IP is designed with two distinct power domains,
> the TH1520 SoC integrates it with only a single, unified power gate that
> is controllable by the kernel.
> 
> To model this reality correctly while keeping the binding accurate for
> other devices, add conditional constraints to the `allOf` section:
>  - An if block for thead,th1520-gpu enforces a maximum of one
>    power domain and disallows the power-domain-names property.

Why?

This solves nothing, because you did not change the meaning of power
domain entry.

>  - A separate if block applies to other B-series GPUs
>    img,img-bxm-4-64 and img,img-bxs-4-64. A not clause within this
>    block excludes the thead,th1520-gpu compatible, ensuring this rule
>    requires a minimum of two power domains only for non TH1520 B-series
>    GPU's.
> 
> This makes the binding strict and correct for both the specific TH1520
> implementation and for other SoCs that use the B-series Rogue GPUs.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 32 +++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..2c5c278b730145a983d1ddfa4014b3c5046bcd52 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -21,6 +21,11 @@ properties:
>            # work with newer dts.
>            - const: img,img-axe
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - thead,th1520-gpu
> +          - const: img,img-bxm-4-64
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,j721s2-gpu
> @@ -84,11 +89,29 @@ allOf:
>          compatible:
>            contains:
>              const: img,img-rogue
> +      not:

Previous patch was completely different!

You cannot keep tags when you completely rewrite the patch. Drop all
reviews and all acks.

Above code is confusing and not correct, you just stuffed multiple if
causes.

Best regards,
Krzysztof

