Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB59955E51
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 19:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF7B10E05D;
	Sun, 18 Aug 2024 17:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YrPiZ03X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE23010E05D
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 17:42:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B195A8A9;
 Sun, 18 Aug 2024 19:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724002863;
 bh=9Kn5iCNdVlSdiKkudNGb31nJGyOtMWHeXPAxfDeHWpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YrPiZ03XueusGurJmwrCX6GwerHd+bw6fcDrXLNqSHJLVpE4g8QaAF0+HZ0s6YNEh
 yaXXHf5ILfhKJxy+yfHrUorRbiDyGRaDE0QCDB5ubl94x5UIjuoupBNsQHtYrwWeBj
 9GQ8Dn3x1AyZCwb8NCesR4LaNyfu+DzRvOdP5ZYU=
Date: Sun, 18 Aug 2024 20:41:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: renesas,du: narrow interrupts
 and resets per variants
Message-ID: <20240818174137.GC29465@pendragon.ideasonboard.com>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
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

Hi Krzysztof,

Thank you for the patch.

On Sun, Aug 18, 2024 at 07:30:02PM +0200, Krzysztof Kozlowski wrote:
> Each variable-length property like interrupts or resets must have fixed
> constraints on number of items for given variant in binding.  The
> clauses in "if:then:" block should define both limits: upper and lower.

I thought that, when only one of minItems or maxItems was specified, the
other automatically defaulted to the same value. I'm pretty sure I
recall Rob asking me to drop one of the two in some bindings. Has the
rule changes ? Is it documented somewhere ?

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/renesas,du.yaml          | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index c5b9e6812bce..147842b6465a 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -173,6 +173,7 @@ allOf:
>              - pattern: '^dclkin\.[01]$'
>  
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>  
>          resets:
> @@ -228,6 +229,7 @@ allOf:
>              - pattern: '^dclkin\.[01]$'
>  
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>  
>          resets:
> @@ -281,6 +283,7 @@ allOf:
>              - pattern: '^dclkin\.[01]$'
>  
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>  
>          resets:
> @@ -335,6 +338,7 @@ allOf:
>              - pattern: '^dclkin\.[01]$'
>  
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>  
>          resets:
> @@ -396,6 +400,7 @@ allOf:
>              - pattern: '^dclkin\.[012]$'
>  
>          interrupts:
> +          minItems: 3
>            maxItems: 3
>  
>          resets:
> @@ -460,9 +465,11 @@ allOf:
>              - pattern: '^dclkin\.[0123]$'
>  
>          interrupts:
> +          minItems: 4
>            maxItems: 4
>  
>          resets:
> +          minItems: 2
>            maxItems: 2
>  
>          reset-names:
> @@ -489,9 +496,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 4
> +          maxItems: 4
>  
>          renesas,vsps:
>            minItems: 4
> +          maxItems: 4
>  
>        required:
>          - clock-names
> @@ -531,9 +540,11 @@ allOf:
>              - pattern: '^dclkin\.[012]$'
>  
>          interrupts:
> +          minItems: 3
>            maxItems: 3
>  
>          resets:
> +          minItems: 2
>            maxItems: 2
>  
>          reset-names:
> @@ -558,9 +569,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 3
> +          maxItems: 3
>  
>          renesas,vsps:
>            minItems: 3
> +          maxItems: 3
>  
>        required:
>          - clock-names
> @@ -600,9 +613,11 @@ allOf:
>              - pattern: '^dclkin\.[013]$'
>  
>          interrupts:
> +          minItems: 3
>            maxItems: 3
>  
>          resets:
> +          minItems: 2
>            maxItems: 2
>  
>          reset-names:
> @@ -627,9 +642,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 3
> +          maxItems: 3
>  
>          renesas,vsps:
>            minItems: 3
> +          maxItems: 3
>  
>        required:
>          - clock-names
> @@ -684,6 +701,7 @@ allOf:
>  
>          renesas,vsps:
>            minItems: 1
> +          maxItems: 1
>  
>        required:
>          - clock-names
> @@ -719,6 +737,7 @@ allOf:
>              - pattern: '^dclkin\.[01]$'
>  
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>  
>          resets:
> @@ -746,9 +765,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 2
> +          maxItems: 2
>  
>          renesas,vsps:
>            minItems: 2
> +          maxItems: 2
>  
>        required:
>          - clock-names
> @@ -799,6 +820,7 @@ allOf:
>  
>          renesas,vsps:
>            minItems: 2
> +          maxItems: 2
>  
>        required:
>          - clock-names

-- 
Regards,

Laurent Pinchart
