Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381A48C6AAB
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 18:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4696010EBAB;
	Wed, 15 May 2024 16:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3F910EBAB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 16:33:51 +0000 (UTC)
Received: from i53875b5d.versanet.de ([83.135.91.93] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1s7HZD-00078Z-Sj; Wed, 15 May 2024 18:33:23 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Chris Morgan <macromorgan@hotmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: display: vop2: Add VP clock resets
Date: Wed, 15 May 2024 18:33:22 +0200
Message-ID: <2182693.irdbgypaU6@diego>
In-Reply-To: <20240515-risk-exes-13db315da6bb@spud>
References: <20240514152328.21415-1-detlev.casanova@collabora.com>
 <20240514152328.21415-4-detlev.casanova@collabora.com>
 <20240515-risk-exes-13db315da6bb@spud>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Mittwoch, 15. Mai 2024, 18:19:29 CEST schrieb Conor Dooley:
> On Tue, May 14, 2024 at 11:19:47AM -0400, Detlev Casanova wrote:
> > Add the documentation for VOP2 video ports reset clocks.
> > One reset can be set per video port.
> > 
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> 
> Are these resets valid for all VOPs or just the one on 3588?

Not in that form.
I.e. rk3588 has 4 video-ports (0-3), while rk3568 has 3 (0-2).

So the binding should take into account that rk3568 also has the
SRST_VOP0 ... SRST_VOP2.


Also, I guess we might not want to limit ourself to stuff we use?
I.e. the new VOP-design is one block with multiple video-ports

So for rk3568 I see
#define SRST_A_VOP
#define SRST_H_VOP
#define SRST_VOP0
#define SRST_VOP1
#define SRST_VOP2

similarly rk3588 has

#define SRST_H_VOP
#define SRST_A_VOP
#define SRST_D_VOP0
#define SRST_D_VOP1
#define SRST_D_VOP2
#define SRST_D_VOP3

as generalized reset lines.





> 
> > ---
> >  .../display/rockchip/rockchip-vop2.yaml       | 27 +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> > index 2531726af306b..941fd059498d4 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> > @@ -65,6 +65,22 @@ properties:
> >        - const: dclk_vp3
> >        - const: pclk_vop
> >  
> > +  resets:
> > +    minItems: 3
> > +    items:
> > +      - description: Pixel clock reset for video port 0.
> > +      - description: Pixel clock reset for video port 1.
> > +      - description: Pixel clock reset for video port 2.
> > +      - description: Pixel clock reset for video port 3.
> > +
> > +  reset-names:
> > +    minItems: 3
> > +    items:
> > +      - const: dclk_vp0
> > +      - const: dclk_vp1
> > +      - const: dclk_vp2
> > +      - const: dclk_vp3
> > +
> >    rockchip,grf:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description:
> > @@ -128,6 +144,11 @@ allOf:
> >          clock-names:
> >            minItems: 7
> >  
> > +        resets:
> > +          minItems: 4
> > +        reset-names:
> > +          minItems: 4
> > +
> >          ports:
> >            required:
> >              - port@0
> > @@ -183,6 +204,12 @@ examples:
> >                                "dclk_vp0",
> >                                "dclk_vp1",
> >                                "dclk_vp2";
> > +                resets = <&cru SRST_VOP0>,
> > +                         <&cru SRST_VOP1>,
> > +                         <&cru SRST_VOP2>;
> > +                reset-names = "dclk_vp0",
> > +                              "dclk_vp1",
> > +                              "dclk_vp2";
> >                  power-domains = <&power RK3568_PD_VO>;
> >                  iommus = <&vop_mmu>;
> >                  vop_out: ports {
> 




