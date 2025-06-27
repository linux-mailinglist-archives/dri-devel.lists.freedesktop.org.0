Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEDBAEBFEB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 21:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1657B10E9F1;
	Fri, 27 Jun 2025 19:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nN3ouILS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F9210E9F1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 19:31:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2453D43588;
 Fri, 27 Jun 2025 19:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB42C4CEE3;
 Fri, 27 Jun 2025 19:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751052693;
 bh=h3H+2X3zy5G2DWyjGN7MD6PlrTT6aVPN39antbwjtXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nN3ouILSe4a9vGGNfo+5TMSucLczYwzFlj0Xw8+noUZYsSXS58hDkYj5wLr/AsJmv
 f2xckTe28ssA0LRbcPUSoPc9FCYDN7XWMSWf2J3D9AoXly+yf9XXKmFD4PJK/V1rnE
 EpkLsCywXZrZ+Rx7Sknjw/qxNtqSI/utppKZfPHGYHjlp7yfQE/0XiPkYq4BIN9QaN
 UYTqsAQ7RjrGEwTwq2VLOMnu+eyCrN7TQpUmrVr26HP/Le/rwivsO8ODXMcfQj7F16
 JUsws8azftM49yeQHO0uUDFHAt+a0VaQTWOODPxAq0HglJoQtI10BpHA8I003cQPMi
 fH2wjGwU3DJHw==
Date: Fri, 27 Jun 2025 14:31:32 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
 Jared Kangas <jkangas@redhat.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 1/2] dt-bindings: reserved-memory: Introduce
 carved-out memory region binding
Message-ID: <20250627193132.GB4032621-robh@kernel.org>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
 <20250617-dma-buf-ecc-heap-v5-1-0abdc5863a4f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-dma-buf-ecc-heap-v5-1-0abdc5863a4f@kernel.org>
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

On Tue, Jun 17, 2025 at 02:25:40PM +0200, Maxime Ripard wrote:
> Some parts of the memory can be dedicated to specific purposes and
> exposed as a dedicated memory allocator.
> 
> This is especially useful if that particular region has a particular
> properties the rest of the memory doesn't have. For example, some
> platforms have their entire RAM covered by ECC but for a small area
> meant to be used by applications that don't need ECC, and its associated
> overhead.
> 
> Let's introduce a binding to describe such a region and allow the OS to
> create a dedicated memory allocator for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../bindings/reserved-memory/carved-out.yaml       | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9ab5d1ebd9ebd9111b7c064fabe1c45e752da83b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/carved-out.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Carved-out Memory Region
> +
> +description: |

Don't need '|'.

> +  Specifies that the reserved memory region has been carved out of the
> +  main memory allocator, and is intended to be used by the OS as a
> +  dedicated memory allocator.

Other than the commit msg, it is completely lost that this is for 
ECC-less memory.

This description applies to CMA area as well. So what's the difference?

> +
> +maintainers:
> +  - Maxime Ripard <mripard@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: carved-out

Isn't everything in reserved-memory a carve out for some purpose. I'm 
not sure if I'd add 'no ECC' or more along the lines of how this is 
used. The latter might be useful on platforms which can't disable ECC or 
don't have ECC at all.

> +
> +  reg:
> +    description: region of memory that is carved out.

Can be multiple regions? If not, need 'maxItems: 1'.


> +
> +allOf:
> +  - $ref: reserved-memory.yaml
> +  - not:
> +      required:
> +        - reusable
> +  - not:
> +      required:
> +        - no-map
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        memory@12340000 {
> +            compatible = "carved-out";
> +            reg = <0x12340000 0x00800000>;
> +        };
> +    };
> 
> -- 
> 2.49.0
> 
