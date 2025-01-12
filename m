Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDAA0A7F8
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 10:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCF810E301;
	Sun, 12 Jan 2025 09:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P8KOck9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FA910E301
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 09:27:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2720EA40424;
 Sun, 12 Jan 2025 09:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDABFC4CEDF;
 Sun, 12 Jan 2025 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736674041;
 bh=S6+HEIIa0TC4zQcS76msgthENjx+/il9nhKI8WUIGnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P8KOck9q7pVtgoxZwSX0Ry4lFmGJrIj2j3Kx4bWyBvNfbfxVO7P1Bys2jmtmkxR+o
 lhpmVKVMSLIV5nH4EieAa+E4gOgfS5EI8juagsOISl4qKNKirtZUztlyfjv3nGGevy
 6IzkucMxB/RXAIuaxgt4pAo/mLNCMrrVpDL3ApdToSC86iPfrakKAbopJeCr2eEKCP
 SWYSw5Vt4TPR91g4EiahnMJCInNVU/qeg0K89dYJDtASqIXg2lC5W6A0bU4dEyxNzW
 9IdXuw8tp0MVPazCpeCvmbCxucFGqTYPyo/Gj8g+l+VVNYFAbPFQt4dQhG12HkANmr
 rxG1oNrzzIJ/A==
Date: Sun, 12 Jan 2025 10:27:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v11 10/11] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <i5mp7wrogfc7w3fbmvqgqxsbgcx4xnfnjik4rpd35amdwgppan@fistrhikrrmd>
References: <20250111112614.432247-1-andyshrk@163.com>
 <20250111112614.432247-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250111112614.432247-11-andyshrk@163.com>
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

On Sat, Jan 11, 2025 at 07:26:08PM +0800, Andy Yan wrote:
>    # See compatible-specific constraints below.
>    clocks:
> @@ -120,43 +133,98 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-vop
> +            enum:
> +              - rockchip,rk3566-vop
> +              - rockchip,rk3568-vop
>      then:
>        properties:
>          clocks:
> -          minItems: 7
> +          minItems: 5

That's wrong, why maxItems became minItems? How is this related to rk3576?

> +
>          clock-names:
> -          minItems: 7
> +          minItems: 5

You are doing here way too much. You need to split reorganizing, so we
will see what comes new.

And of course you need to explain why you are changing EXISTING binding
(I am not talking about shuffling around - you change the binding).


> +
> +        interrupts:
> +          maxItems: 1
> +
> +        interrupt-names: false
>  
>          ports:
>            required:
>              - port@0
>              - port@1
>              - port@2
> -            - port@3
> +
> +        rockchip,vo1-grf: false
> +        rockchip,vop-grf: false
> +        rockchip,pmu: false
>  
>        required:
>          - rockchip,grf
> -        - rockchip,vo1-grf
> -        - rockchip,vop-grf
> -        - rockchip,pmu
>  
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-vop
> +    then:
>        properties:
> +        clocks:
> +          minItems: 5


Why minItems? Nothing in this patch makes sense for me. Neither changing
existing binding nor new binding for rk3576.

> +
> +        clock-names:
> +          minItems: 5
> +
> +        interrupts:
> +          minItems: 4
> +
> +        interrupt-names:
> +          minItems: 4
> +
> +        ports:
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
>          rockchip,vo1-grf: false
>          rockchip,vop-grf: false
> -        rockchip,pmu: false
>  
> +      required:
> +        - rockchip,grf
> +        - rockchip,pmu
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-vop
> +    then:
> +      properties:
>          clocks:
> -          maxItems: 5
> +          minItems: 7

And again weird change to the binding.

Best regards,
Krzysztof

