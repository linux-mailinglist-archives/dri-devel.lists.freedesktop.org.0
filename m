Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB0AB0B64B
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 15:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B333B10E00F;
	Sun, 20 Jul 2025 13:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB22F10E00F
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 13:56:00 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 2E5941C025E;
 Sun, 20 Jul 2025 15:55:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NO_RECEIVED,NO_RELAYS
 autolearn=ham autolearn_force=no version=4.0.1
Date: Sun, 20 Jul 2025 15:55:51 +0200
From: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kevin Tang <kevin.tang@unisoc.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: display: sprd: adapt for UMS9230
 support
Message-ID: <aHz1Z94swDewvriQ@abscue.de>
References: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
 <20250719-ums9230-drm-v1-1-e4344a05eb3d@abscue.de>
 <9966b9e4-399b-4446-81e4-15daf9acbff7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9966b9e4-399b-4446-81e4-15daf9acbff7@kernel.org>
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

On Sun, Jul 20, 2025 at 02:26:19PM +0200, Krzysztof Kozlowski wrote:
> On 19/07/2025 14:09, Otto Pflüger wrote:
> > diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
> > index 4ebea60b8c5ba5f177854e3a8d89e93e7304e18b..6fedb6e508b247eb71da17ced589b8ed09085592 100644
> > --- a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
> > +++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
> > @@ -16,7 +16,12 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    const: sprd,sharkl3-dpu
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - sprd,ums9230-dpu
> > +          - const: sprd,sharkl3-dpu
> > +      - const: sprd,sharkl3-dpu
> >  
> >    reg:
> >      maxItems: 1
> > @@ -25,12 +30,15 @@ properties:
> >      maxItems: 1
> >  
> >    clocks:
> > -    minItems: 2
> > +    minItems: 1
> 
> This is wrong. You miss maxItems. I will fix existing bindings.

Will fix this, thanks.

> 
> >  
> >    clock-names:
> > -    items:
> > -      - const: clk_src_128m
> > -      - const: clk_src_384m
> > +    oneOf:
> > +      - items:
> > +        - const: clk_src_128m
> > +        - const: clk_src_384m
> > +      - items:
> > +        - const: enable
> >  
> >    power-domains:
> >      maxItems: 1
> > diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
> > index bc5594d18643010b91376c92a8f235a522d7dc3d..8438d2da0a4277db03e30b13cb270684c0c360cb 100644
> > --- a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
> > +++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
> > @@ -11,7 +11,9 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    const: sprd,sharkl3-dsi-host
> > +    enum:
> > +      - sprd,sharkl3-dsi-host
> > +      - sprd,ums9230-dsi-host
> >  
> >    reg:
> >      maxItems: 1
> > @@ -23,8 +25,11 @@ properties:
> >      minItems: 1
> >  
> >    clock-names:
> > -    items:
> > -      - const: clk_src_96m
> > +    oneOf:
> > +      - items:
> > +          - const: clk_src_96m
> > +      - items:
> > +          - const: enable
> 
> Why this is completely different clock? How same class device could have
> completely different clock INPUT?

The clocks should be the same on sharkl3 (sc9863a) and ums9230, but
the existing bindings don't really make sense here or are incomplete.
AFAIK there is no SoC in which this display controller is directly
connected to the PLL as shown in the example. The DSI controller is
connected to a clock gate. The DPU actually does have two clocks, both
of which are clock muxes that allow selecting different frequencies and
one of which is behind a clock gate. I can add the second clock for the
DPU if needed.

Since nothing seems to be using these bindings at the moment, would it
be okay to drop the old clock names that refer to specific frequencies?

> 
> >  
> >    power-domains:
> >      maxItems: 1
> > 
> 
> 
> Best regards,
> Krzysztof
