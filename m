Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81693245672
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 09:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA626E0F4;
	Sun, 16 Aug 2020 07:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327986E0F4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 07:25:26 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 55E65804D0;
 Sun, 16 Aug 2020 09:25:22 +0200 (CEST)
Date: Sun, 16 Aug 2020 09:25:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/8] dt-bindings: display: mxsfb: Add a bus-width
 endpoint property
Message-ID: <20200816072520.GD1201814@ravnborg.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=e5mUnYsNAAAA:8
 a=PxDKDgk4fiNqbnpnUVEA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

On Thu, Aug 13, 2020 at 04:29:05AM +0300, Laurent Pinchart wrote:
> When the PCB routes the display data signals in an unconventional way,
> the output bus width may differ from the bus width of the connected
> panel or encoder. For instance, when a 18-bit RGB panel has its R[5:0],
> G[5:0] and B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10]
> and LCD_DATA[23:18], the output bus width is 24 instead of 18 when the
> signals are routed to LCD_DATA[5:0], LCD_DATA[11:6] and LCD_DATA[17:12].
> 
> Add a bus-width property to describe this data routing.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Some general comments.
We have the bus format - for example MEDIA_BUS_FMT_RGB666_1X18.
I was under the impression that the bus format defined the wiring used,
so for example the bus format would tell if on used 18 bits as above.
So with the bus format available the bus-width is not needed.

Today this detail is not expressed in DT but comes based on the
compatible for the panel - so what this patch does is to add the bus
format information to DT.

But then to do so would we not need to have something so we can specify
all relevant MEDIA_BUS_FMT's? bus-width will not cut it.

Also the bus-width property (and data-shift property you accidentally
reference) are both described in media/video-interfaces.txt.
If we need bus-witdh - is it possible to re-use video-interfaces?
It may need a conversion to yaml to get full validation, but a lot
of .yaml files refer to the text file today so conversion can come later.

	Sam


> ---
>  Documentation/devicetree/bindings/display/mxsfb.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> index ec6533b1d4a3..d15bb8edc29f 100644
> --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> @@ -58,6 +58,18 @@ properties:
>          type: object
>  
>          properties:
> +          data-shift:
> +            enum: [16, 18, 24]
> +            description: |
> +              The output bus width. This value overrides the configuration
> +              derived from the connected device (encoder or panel). It should
> +              only be specified when PCB routing of the data signals require a
> +              different bus width on the LCDIF and the connected device. For
> +              instance, when a 18-bit RGB panel has its R[5:0], G[5:0] and
> +              B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10] and
> +              LCD_DATA[23:18] instead of LCD_DATA[5:0], LCD_DATA[11:6] and
> +              LCD_DATA[17:12], bus-width should be set to 24.
> +
>            remote-endpoint:
>              $ref: /schemas/types.yaml#/definitions/phandle
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
