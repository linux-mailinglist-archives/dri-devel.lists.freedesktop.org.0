Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CACAB4D2EB2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B1710E679;
	Wed,  9 Mar 2022 12:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E41E410E65B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:07:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AAD71688;
 Wed,  9 Mar 2022 04:07:06 -0800 (PST)
Received: from [10.57.41.254] (unknown [10.57.41.254])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A75E3FA4D;
 Wed,  9 Mar 2022 04:07:04 -0800 (PST)
Message-ID: <7aa79c15-a758-1e9d-2e53-6dd03d4611b7@arm.com>
Date: Wed, 9 Mar 2022 12:06:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v7 11/24] dt-bindings: display: rockchip: dw-hdmi: Add
 additional clock
Content-Language: en-GB
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-12-s.hauer@pengutronix.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220225075150.2729401-12-s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-25 07:51, Sascha Hauer wrote:
> The rk3568 HDMI has an additional clock that needs to be enabled for the
> HDMI controller to work. The purpose of that clock is not clear. It is
> named "hclk" in the downstream driver, so use the same name.

Further to the clarification of the underlying purpose on the other 
thread, I suggest we call the new clock "niu" and describe it as 
something like "Additional clock required to ungate the bus interface on 
certain SoCs".

Cheers,
Robin.

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> Notes:
>      Changes since v4:
>      - Add Robs Ack
> 
>   .../bindings/display/rockchip/rockchip,dw-hdmi.yaml        | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> index 38ebb69830287..67a76f51637a7 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> @@ -44,12 +44,13 @@ properties:
>       items:
>         - {}
>         - {}
> -      # The next three clocks are all optional, but shall be specified in this
> +      # The next four clocks are all optional, but shall be specified in this
>         # order when present.
>         - description: The HDMI CEC controller main clock
>         - description: Power for GRF IO
>         - description: External clock for some HDMI PHY (old clock name, deprecated)
>         - description: External clock for some HDMI PHY (new name)
> +      - description: hclk
>   
>     clock-names:
>       minItems: 2
> @@ -61,13 +62,17 @@ properties:
>             - grf
>             - vpll
>             - ref
> +          - hclk
>         - enum:
>             - grf
>             - vpll
>             - ref
> +          - hclk
>         - enum:
>             - vpll
>             - ref
> +          - hclk
> +      - const: hclk
>   
>     ddc-i2c-bus:
>       $ref: /schemas/types.yaml#/definitions/phandle
