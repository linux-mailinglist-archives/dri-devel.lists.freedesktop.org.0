Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B930624FFB0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 16:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F756E261;
	Mon, 24 Aug 2020 14:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E89D6E261
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 14:19:26 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 0115A5C3C43;
 Mon, 24 Aug 2020 16:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1598278764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJ4IdJs7vNZOHX+v4Asmyv1svNA8lWS2xHxhNIw5NQw=;
 b=klG4oPX8z1HBdwMgPDp2O8SGPWF8a47XixIANUD22HRjeOAsU7wv/v/Qcxu3LA4IgK9Dmo
 hIiYXrhQDT2hyK8J2tF45euT5alXOcQdQE7WwhHOKJgXs/LCcrJP7ZbQhOwQvYZrcCxlrJ
 eahw5B5opFddIJvJn/8qXWVpnHUmn9Q=
MIME-Version: 1.0
Date: Mon, 24 Aug 2020 16:19:23 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/8] dt-bindings: display: mxsfb: Add and fix compatible
 strings
In-Reply-To: <20200823232603.GO6002@pendragon.ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
 <c9e8e63c2ac1e1ecfd8e664e2605b81f@agner.ch>
 <20200823232603.GO6002@pendragon.ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <58ad6bef353ee25e5c548c0d950f7e46@agner.ch>
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

On 2020-08-24 01:26, Laurent Pinchart wrote:
> Hi Stefan,
> 
> On Fri, Aug 21, 2020 at 04:53:56PM +0200, Stefan Agner wrote:
>> On 2020-08-13 03:29, Laurent Pinchart wrote:
>> > Additional compatible strings have been added in DT source for the
>> > i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
>> > Most of the upstream DT sources use the fsl,imx28-lcdif compatible
>> > string, which mostly predates the realization that the LCDIF in the
>> > i.MX6 and newer SoCs have extra features compared to the i.MX28.
>>
>> Agreed, we should add fsl,imx6sx-lcdif for those devices.
>>
>> But shouldn't we also keep fsl,imx28-lcdif? From what I can tell, the
>> devices can be driven by a driver only supporting fsl,imx28-lcdif
>> semantics, right?
> 
> Isn't it kept by this patch ?
> 
>> > Update the bindings to add the missing compatible strings, with the
>> > correct fallback values. This fails to validate some of the upstream DT
>> > sources. Instead of adding the incorrect compatible fallback to the
>> > binding, the sources should be updated separately.
>> >
>> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > ---
>> >  .../devicetree/bindings/display/mxsfb.yaml     | 18 +++++++++++++-----
>> >  1 file changed, 13 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml
>> > b/Documentation/devicetree/bindings/display/mxsfb.yaml
>> > index 202381ec5bb7..ec6533b1d4a3 100644
>> > --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
>> > +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
>> > @@ -15,11 +15,19 @@ description: |
>> >
>> >  properties:
>> >    compatible:
>> > -    enum:
>> > -      - fsl,imx23-lcdif
>> > -      - fsl,imx28-lcdif
>> > -      - fsl,imx6sx-lcdif
>> > -      - fsl,imx8mq-lcdif
>> > +    oneOf:
>> > +      - enum:
>> > +          - fsl,imx23-lcdif
>> > +          - fsl,imx28-lcdif
> 
> Here -----------------^
> 
> The binding now support any of "fsl,imx23-lcdif", "fsl,imx28-lcdif" or
> "fsl,imx6sx-lcdif" alone, or "fsl,imx6sx-lcdif" with another
> device-specific compatible string. The driver supports the three base
> compatible strings, for V3, V4 and V6 of the IP core.

The binding yes, but I mean the device descriptions in the device tree.

Since the device can be driven by a older kernel which only knows about
the fsl,imx28-lcdif compatible string, we could keep that compatible.
From what I can tell, we can add both safely, e.g.

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif"

From how I read the description this now replaces "fsl,imx28-lcdif" with
"fsl,imx6sx-lcdif" for the devices supporting the additional features,
e.g.:

--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -769,7 +769,7 @@ epdc: epdc@20f4000 {
             };
 
             lcdif: lcdif@20f8000 {
-                compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+                compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
                 reg = <0x020f8000 0x4000>;
                 interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
                 clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,

--
Stefan

> 
>> > +          - fsl,imx6sx-lcdif
>> > +      - items:
>> > +        - enum:
>> > +          - fsl,imx6sl-lcdif
>> > +          - fsl,imx6sll-lcdif
>> > +          - fsl,imx6ul-lcdif
>> > +          - fsl,imx7d-lcdif
>> > +          - fsl,imx8mq-lcdif
>> > +        - const: fsl,imx6sx-lcdif
>> >
>> >    reg:
>> >      maxItems: 1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
