Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 087E83C6E5C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 12:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9998930B;
	Tue, 13 Jul 2021 10:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A5D6892F0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 10:23:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90C666D;
 Tue, 13 Jul 2021 03:23:36 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 898223F7D8;
 Tue, 13 Jul 2021 03:23:34 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: display: rockchip: Add compatible for
 rk3568 HDMI
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, hjc@rock-chips.com,
 heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 algea.cao@rock-chips.com, andy.yan@rock-chips.com
References: <20210707120323.401785-1-benjamin.gaignard@collabora.com>
 <20210707120323.401785-2-benjamin.gaignard@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <da42fa57-6763-b57d-fc5a-82f14ce7b8e3@arm.com>
Date: Tue, 13 Jul 2021 11:23:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707120323.401785-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-07 13:03, Benjamin Gaignard wrote:
> Define a new compatible for rk3568 HDMI.
> This version of HDMI hardware block needs two new clocks hclk_vio and hclk
> to provide phy reference clocks.

Do you know what hclk_vio is and whether it's actually necessary? I 
don't see any mention of it downstream, and based on previous experience 
I'm suspicious that it might be just the parent of hclk, and thus should 
not need to be explicitly claimed by the device or baked into it's binding.

Robin.

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 2:
> - Add the clocks needed for the phy.
> 
>   .../bindings/display/rockchip/rockchip,dw-hdmi.yaml         | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> index 75cd9c686e985..cb8643b3a8b84 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> @@ -23,6 +23,7 @@ properties:
>         - rockchip,rk3288-dw-hdmi
>         - rockchip,rk3328-dw-hdmi
>         - rockchip,rk3399-dw-hdmi
> +      - rockchip,rk3568-dw-hdmi
>   
>     reg-io-width:
>       const: 4
> @@ -51,8 +52,11 @@ properties:
>             - vpll
>         - enum:
>             - grf
> +          - hclk_vio
> +          - vpll
> +      - enum:
> +          - hclk
>             - vpll
> -      - const: vpll
>   
>     ddc-i2c-bus:
>       $ref: /schemas/types.yaml#/definitions/phandle
> 
