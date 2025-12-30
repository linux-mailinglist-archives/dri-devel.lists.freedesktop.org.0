Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E2ECE88CA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 03:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBD610E779;
	Tue, 30 Dec 2025 02:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="orP6bLqM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165EC10E779
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 02:27:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C2C7C401AC;
 Tue, 30 Dec 2025 02:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D511C19424;
 Tue, 30 Dec 2025 02:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767061662;
 bh=YZhKdnIWvyphz/ZPlkVHSeDMS3reT0HQs3XijtNSUbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=orP6bLqMPVxgtgILLbmuDvRxHNqtBuhm/cUil4j745FS4ziqIrNSHH3lLOVJYGjyD
 T8lIybONj5MbF8QXpXvBSUrsK2Wc0dXvpH2vifhyv4c+9x/IMmF7q9YQd7tVLOqJxy
 GDw9iBV49nPyfSW6BHPYNiho89X6QA0JynU59ZQyit5RrpwJ+6snjpIL2I0RT9QXH0
 AKp1zXP+9w3KsRXgAu/6Bs7wYm7zdmfBdZSomulClvRBG9Rgw8/NeijECrYRV6YPUh
 oWyyJSNFlm5qEYVa4L2zZ9LqNAtQ5yV4AYVPIQfHOVMbsVxvKwuSN/Y9Pz9aQIe13L
 YWC96vCZo902w==
Date: Mon, 29 Dec 2025 20:27:41 -0600
From: Rob Herring <robh@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
 conor+dt@kernel.org, devarsht@ti.com, praneeth@ti.com, bb@ti.com,
 vigneshr@ti.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: ti, am65x-dss: Add AM62L DSS support
Message-ID: <20251230022741.GA3217586-robh@kernel.org>
References: <20251224133150.2266524-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224133150.2266524-1-s-jain1@ti.com>
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

On Wed, Dec 24, 2025 at 07:01:50PM +0530, Swamil Jain wrote:
> Update the AM65x DSS bindings to support AM62L which has a single video
> port. Add conditional constraints for AM62L.
> 
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 95 +++++++++++++++----
>  1 file changed, 76 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 38fcee91211e..ce39690df4e5 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -36,34 +36,50 @@ properties:
>    reg:
>      description:
>        Addresses to each DSS memory region described in the SoC's TRM.
> -    items:
> -      - description: common DSS register area
> -      - description: VIDL1 light video plane
> -      - description: VID video plane
> -      - description: OVR1 overlay manager for vp1
> -      - description: OVR2 overlay manager for vp2
> -      - description: VP1 video port 1
> -      - description: VP2 video port 2
> -      - description: common1 DSS register area
> +    oneOf:
> +      - items:
> +          - description: common DSS register area
> +          - description: VIDL1 light video plane
> +          - description: VID video plane
> +          - description: OVR1 overlay manager for vp1
> +          - description: OVR2 overlay manager for vp2
> +          - description: VP1 video port 1
> +          - description: VP2 video port 2
> +          - description: common1 DSS register area
> +      - items:
> +          - description: common DSS register area
> +          - description: VIDL1 light video plane
> +          - description: OVR1 overlay manager for vp1
> +          - description: VP1 video port 1
> +          - description: common1 DSS register area
>  
>    reg-names:
> -    items:
> -      - const: common
> -      - const: vidl1
> -      - const: vid
> -      - const: ovr1
> -      - const: ovr2
> -      - const: vp1
> -      - const: vp2
> -      - const: common1
> +    oneOf:
> +      - items:
> +          - const: common
> +          - const: vidl1
> +          - const: vid
> +          - const: ovr1
> +          - const: ovr2
> +          - const: vp1
> +          - const: vp2
> +          - const: common1
> +      - items:
> +          - const: common
> +          - const: vidl1
> +          - const: ovr1
> +          - const: vp1
> +          - const: common1
>  
>    clocks:
> +    minItems: 2
>      items:
>        - description: fck DSS functional clock
>        - description: vp1 Video Port 1 pixel clock
>        - description: vp2 Video Port 2 pixel clock
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: fck
>        - const: vp1
> @@ -84,7 +100,8 @@ properties:
>      maxItems: 1
>      description: phandle to the associated power domain
>  
> -  dma-coherent: true
> +  dma-coherent:
> +    type: boolean
>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -195,6 +212,46 @@ allOf:
>              port@0:
>                properties:
>                  endpoint@1: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,am62l-dss
> +    then:
> +      properties:
> +        clock-names:
> +          maxItems: 2
> +        clocks:
> +          maxItems: 2
> +        reg:
> +          maxItems: 5

           reg-names:
             minItems: 8
       else:
         properties:
           reg:
             minItems: 8
           reg-names:
             minItems: 8

clocks needs similar constraints...

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,am62l-dss
> +    then:
> +      properties:
> +        reg-names:
> +          items:
> +            - const: common
> +            - const: vidl1
> +            - const: ovr1
> +            - const: vp1
> +            - const: common1
> +    else:
> +      properties:
> +        reg-names:
> +          items:
> +            - const: common
> +            - const: vidl1
> +            - const: vid
> +            - const: ovr1
> +            - const: ovr2
> +            - const: vp1
> +            - const: vp2
> +            - const: common1

Why are you defining the names twice?

Rob

