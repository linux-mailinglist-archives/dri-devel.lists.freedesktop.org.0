Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4815FFBA5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 20:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8269C10E35B;
	Sat, 15 Oct 2022 18:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622A810E35B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 18:28:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF4FB480;
 Sat, 15 Oct 2022 20:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665858509;
 bh=DG8PAbn5t9CS/s216yD46tH3E1t5E7pFPMUouWzS9lk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WFb6t8g5ctr85iLoXBcLRRGBZg5EQ+jk1m7b/q1URNisFSD8V/LHmUiE9PxST++ZS
 Mxk+hInELQ024/FGGBm+6aov2R949RTZwj+n6YbBklst6gngb/P++Y8hfQBMhm+QjA
 1H5ZtQQB5bhOCxyHz9X1kAX3dXqiUFuVWXegMRx0=
Date: Sat, 15 Oct 2022 21:28:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: allen.chen@ite.com.tw
Subject: Re: [PATCH v4 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Message-ID: <Y0r7tplRZbtiX+U6@pendragon.ideasonboard.com>
References: <20221013105116.180380-1-allen.chen@ite.com.tw>
 <20221013105116.180380-2-allen.chen@ite.com.tw>
 <Y0fxCVUtlkB4XHIq@pendragon.ideasonboard.com>
 <20221013192016.GA95717-robh@kernel.org>
 <e24a52c109444452a9027d53a21d6ef0@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e24a52c109444452a9027d53a21d6ef0@ite.com.tw>
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
Cc: Kenneth.Hung@ite.com.tw, krzysztof.kozlowski+dt@linaro.org,
 Jau-Chih.Tseng@ite.com.tw, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 treapking@chromium.org, Hermes.Wu@ite.com.tw, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, devicetree@vger.kernel.org, jonas@kwiboo.se
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Oct 14, 2022 at 03:28:31AM +0000, allen.chen@ite.com.tw wrote:
> On Friday, October 14, 2022 3:20 AM, Rob Herring wrote:
> > On Thu, Oct 13, 2022 at 02:05:45PM +0300, Laurent Pinchart wrote:
> > > On Thu, Oct 13, 2022 at 06:51:13PM +0800, allen wrote:
> > > > From: allen chen <allen.chen@ite.com.tw>
> > > > 
> > > > Add properties to restrict dp output data-lanes and clock.
> > > > 
> > > > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > > > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> > > > ---
> > > >  .../bindings/display/bridge/ite,it6505.yaml   | 43 +++++++++++++++++++
> > > >  1 file changed, 43 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > > > index 833d11b2303a7..f2c3d1d10359e 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > > > @@ -52,10 +52,51 @@ properties:
> > > >      maxItems: 1
> > > >      description: extcon specifier for the Power Delivery
> > > >  
> > > > +  data-lanes:
> > > > +    oneOf:
> > > > +      - minItems: 1
> > > > +        maxItems: 1
> > > > +        uniqueItems: true
> > > > +        items:
> > > > +          enum:
> > > > +            - 0
> > > > +            - 1
> > > > +        description: For one lane operation.
> > > > +
> > > > +      - minItems: 2
> > > > +        maxItems: 2
> > > > +        uniqueItems: true
> > > > +        items:
> > > > +          enum:
> > > > +            - 0
> > > > +            - 1
> > > > +        description: For two lanes operation.
> > > > +
> > > > +      - minItems: 4
> > > > +        maxItems: 4
> > > > +        uniqueItems: true
> > > > +        items:
> > > > +          enum:
> > > > +            - 0
> > > > +            - 1
> > > > +            - 2
> > > > +            - 3
> > > > +        description: For four lanes operation.
> > > 
> > > The data lanes should be in the output endpoint. If there's no output 
> > > port, one should be added.
> 
> ==> In this dt-binding, our output point is "extcon" so doesn't have output endpoint.
> I don't know how to add the endpoint.
> If need to add the endpoint to this dt-binding, what is your recommend about adding the endpoint?

You will also need to add a port to the USB-C connector. Then endpoints
can be added to connect the two.

> By the way, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> said
> we could put "data-lanes" here.

If I read him correctly, Krzysztof said we have a standard property for
the data lanes (and that's true, we do), but I don't think he implied it
could be put outside of the endpoint (Krzysztof, please correct me if
I'm wrong).

> > > > +
> > > >    port:
> > > >      $ref: /schemas/graph.yaml#/properties/port
> > 
> > To fix the error, this must be:
> > 
> > $ref: /schemas/graph.yaml#/$defs/port-base
> > unevaluatedProperties: false
> > 
> > > >      description: A port node pointing to DPI host port node
> > > >  
> > > > +    properties:
> > > > +      endpoint:
> > > > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > > +
> > > > +        properties:
> > > > +          link-frequencies:
> > > > +            minItems: 1
> > > > +            maxItems: 1
> > > > +            description: Allowed max link frequencies in Hz.
> > > > +
> > > >  required:
> > > >    - compatible
> > > >    - ovdd-supply
> > > > @@ -84,10 +125,12 @@ examples:
> > > >              pwr18-supply = <&it6505_pp18_reg>;
> > > >              reset-gpios = <&pio 179 1>;
> > > >              extcon = <&usbc_extcon>;
> > > > +            data-lanes = <0 1>;
> > > >  
> > > >              port {
> > > >                  it6505_in: endpoint {
> > > >                      remote-endpoint = <&dpi_out>;
> > > > +                    link-frequencies = /bits/ 64 <150000000>;
> > > >                  };
> > > >              };
> > > >          };

-- 
Regards,

Laurent Pinchart
