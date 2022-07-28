Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C06583CF7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 13:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5A8112649;
	Thu, 28 Jul 2022 11:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6D812BB59
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 11:16:55 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F2E456D;
 Thu, 28 Jul 2022 13:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1659007013;
 bh=ZXDDTP7gbp5CtebP+uzx922dTPzjkRRWm+m1wpG6948=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wXqMzzh/jxJP3crL8z8bZF3/7Mt1a2VsDJSyJRaNncQKV25vb0+TR+47op7CjPi3r
 8He1mhylIfOxSYNuliSsjziSX0OjvipzoiXlRZOBuhTwUfkJNZRwME3cXVyykMfJbS
 52ZU75GgIi56Iqd6M9u/g6HWOogvFxtDAevK52EU=
Message-ID: <cac1e7f0-de7a-f8a6-59a9-65e626c92e93@ideasonboard.com>
Date: Thu, 28 Jul 2022 14:16:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/8] dt-bindings: display: ti,am65x-dss: Add port
 properties for DSS
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-2-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220719080845.22122-2-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/07/2022 11:08, Aradhya Bhatia wrote:
> Add "ti,oldi-mode" property to indicate the tidss driver the OLDI output
> mode. The 2 OLDI TXes on am625-dss allow a 3 different types of panel
> connections with the board.
> 
> 1. Single Link / Single Mode on OLDI TX 0 OR 1.
> 2. Single Link / Duplicate Mode on OLDI TX 0 and 1.
> 3. Dual Link / Single Mode on OLDI TX 0 and 1.
> 
> Add "ti,rgb565-to-888" property to override 16bit output from a videoport
> for a bridge that only accepts 24bit RGB888 DPI input.
> 
> On some boards the HDMI bridge takes a 24bit DPI input, but only 16 data
> pins are actually enabled from the SoC.  This new property forces the
> output to be RGB565 on a specific video port if the bridge requests a
> 24bit RGB color space.
> 
> This assumes that the video port is connected like so:
> 
> SoC : Bridge
> R0 ->   R3
> R1 ->   R4
> R2 ->   R5
> R3 ->   R6
> R4 ->   R7
> G0 ->   G2
> G1 ->   G3
> G2 ->   G4
> G3 ->   G5
> G4 ->   G6
> G5 ->   G7
> B0 ->   B3
> B1 ->   B4
> B2 ->   B5
> B3 ->   B6
> B4 ->   B7
> 
> On the bridge side R0->R2, G0->G1, B0->B2 would be tied to ground.
> The bridge sees 24bits of data,  but the lsb's are always zero.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   .../bindings/display/ti/ti,am65x-dss.yaml     | 25 +++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 6bbce921479d..11d9b3821409 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -80,15 +80,35 @@ properties:
>   
>       properties:
>         port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>           description:
>             The DSS OLDI output port node form video port 1
>   
> +        properties:
> +          ti,oldi-mode:
> +            description: TI specific property to indicate the mode the OLDI TXes
> +              and the display panel are connected in.
> +              0 -> OLDI TXes OFF (driver default for am625-dss)
> +              1 -> Single link, Single Mode (OLDI0) (driver default for am65x-dss)
> +              2 -> Single link, Single Mode (OLDI1)
> +              3 -> Single link, Duplicate Mode
> +              4 -> Dual link (Only Single Mode)
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3, 4]
> +
>         port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>           description:
>             The DSS DPI output port node from video port 2
>   
> +        properties:
> +          ti,rgb565-to-888:
> +            description:
> +              property to override DPI output to 16bit for 24bit bridge
> +            type: boolean

So you have a board with 16 DSS pins connected, going to a bridge/panel 
that only supports 24 bit input. I don't think there's anything TI 
specific here, sounds like a common situation.

"rgb565-to-888" sounds like there's some kind of conversion happening, 
but all this does is set the videoport width to 16 bits.

I'm not sure if there's a better solution but in the OMAP DSS we have 
"data-lines" property for an endpoint, which tells the driver the width 
of the bus.

  Tomi
