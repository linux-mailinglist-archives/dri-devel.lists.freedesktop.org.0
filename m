Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF932451E3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 23:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2307F6E186;
	Sat, 15 Aug 2020 21:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F0F6E17F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 21:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D21A2FB06;
 Sat, 15 Aug 2020 23:28:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqhX1GbzLJgS; Sat, 15 Aug 2020 23:28:38 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 8EE4B4576F; Sat, 15 Aug 2020 23:28:38 +0200 (CEST)
Date: Sat, 15 Aug 2020 23:28:38 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/8] dt-bindings: display: mxsfb: Add a bus-width
 endpoint property
Message-ID: <20200815212838.GC134339@bogon.m.sigxcpu.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
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
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,
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
Shouldn't that be bus-width ?
 -- Guido

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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
