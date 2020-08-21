Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFBC24D7B7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 16:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D196EADC;
	Fri, 21 Aug 2020 14:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CA46EADC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 14:53:58 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 17DAB5C0103;
 Fri, 21 Aug 2020 16:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1598021637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWqdY2lvxfq65gGGv4mB38boJwAXuNffHkbspWayYC8=;
 b=sZqB5TMLvvpdwJ0SN6w9cpy9l+3MXqiNGCTLgf8jAGIXhFGnUho+OmfA7aAnMqIBCNEv5E
 j5dVBjGGAvZNP+M5r5EQmY7piZEiUKA5zyl44AF+N7WuH0DUYPMsMym4/GEsaeyKtYLa1U
 6m3EBY/N2VTdO6Bueewd/tBCzi0224o=
MIME-Version: 1.0
Date: Fri, 21 Aug 2020 16:53:56 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/8] dt-bindings: display: mxsfb: Add and fix compatible
 strings
In-Reply-To: <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <c9e8e63c2ac1e1ecfd8e664e2605b81f@agner.ch>
X-Sender: stefan@agner.ch
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
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-13 03:29, Laurent Pinchart wrote:
> Additional compatible strings have been added in DT source for the
> i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
> Most of the upstream DT sources use the fsl,imx28-lcdif compatible
> string, which mostly predates the realization that the LCDIF in the
> i.MX6 and newer SoCs have extra features compared to the i.MX28.

Agreed, we should add fsl,imx6sx-lcdif for those devices.

But shouldn't we also keep fsl,imx28-lcdif? From what I can tell, the
devices can be driven by a driver only supporting fsl,imx28-lcdif
semantics, right?

--
Stefan

> 
> Update the bindings to add the missing compatible strings, with the
> correct fallback values. This fails to validate some of the upstream DT
> sources. Instead of adding the incorrect compatible fallback to the
> binding, the sources should be updated separately.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/mxsfb.yaml     | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml
> b/Documentation/devicetree/bindings/display/mxsfb.yaml
> index 202381ec5bb7..ec6533b1d4a3 100644
> --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> @@ -15,11 +15,19 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx23-lcdif
> -      - fsl,imx28-lcdif
> -      - fsl,imx6sx-lcdif
> -      - fsl,imx8mq-lcdif
> +    oneOf:
> +      - enum:
> +          - fsl,imx23-lcdif
> +          - fsl,imx28-lcdif
> +          - fsl,imx6sx-lcdif
> +      - items:
> +        - enum:
> +          - fsl,imx6sl-lcdif
> +          - fsl,imx6sll-lcdif
> +          - fsl,imx6ul-lcdif
> +          - fsl,imx7d-lcdif
> +          - fsl,imx8mq-lcdif
> +        - const: fsl,imx6sx-lcdif
>  
>    reg:
>      maxItems: 1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
