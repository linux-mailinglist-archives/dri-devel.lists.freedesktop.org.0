Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1A69FA31
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA2D10E2C4;
	Wed, 22 Feb 2023 17:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C79710EA7A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RNmnqtVCqYGaOUN1jb1UshkoE8aYBEA0ZPlow5YU0CE=;
 b=PExM6vYSOCqpAqxfUx9jQgMQKrYdqudmlneha8pOrCWJH2qAWOkV2WYwmhb7DNdDyVsQBIJvlaZN1
 HEUATxULQoX+6glsIP2+Zau1sT6wxi5BrJOmK740WX3k3bEo1XiQYExoGPtATVIkRm3c2llZ4w4cjQ
 ro5B6ULgmEBifOkrss1LlUVB7zd2+wS//8jk4XF2HNoM/ULCT/qilMrK/OQkmHLdC7FRjppSycdBae
 KOAfs/txLkazAJ3rhaXeS+d+Ld9vUC4d8BXPmBOVzcZI5RY0eHQwzUE+qF1/mgNh2ff0MAVOJLkmVW
 IenrK7elp5cX4nplRgEJYrP0VOGn5LQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RNmnqtVCqYGaOUN1jb1UshkoE8aYBEA0ZPlow5YU0CE=;
 b=Xa5nQiPbcWwm1Ue8g3Vc9g3JvcbAFoqNoJ5CwYd+3W/Q2BcdlTlm8fasEg+aMNqtaOZgFdxsFJbgD
 jueZ/8zBw==
X-HalOne-ID: 6bd646bd-b2d6-11ed-8e82-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 6bd646bd-b2d6-11ed-8e82-7703b0afff57;
 Wed, 22 Feb 2023 17:29:13 +0000 (UTC)
Date: Wed, 22 Feb 2023 18:29:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: Start the info graphics with HS/VS
 change
Message-ID: <Y/ZQ6D8+Yu76Xgy4@ravnborg.org>
References: <20230221200407.16531-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221200407.16531-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Tue, Feb 21, 2023 at 09:04:07PM +0100, Marek Vasut wrote:
> The VS signal change is synchronized to HS signal change, start the
> info graphics with that event, instead of having that event occur in
> the middle of it.
> 
> Scope trace of DPI bus with HS/VS active HIGH looks as follows:
>          ________________...__
> VS...___/__         __        \______...
> HS...___/  \_______/  \__...__/  \___...
>         ^                        ^
> 	|                        |
>         |    Used to start here -'
> 	|
> 	'--- Start info graphics here
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

I recall being annoyed about this before.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  .../bindings/display/panel/panel-timing.yaml  | 46 +++++++++----------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> index 0d317e61edd8f..aea69b84ca5d8 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> @@ -17,29 +17,29 @@ description: |
>  
>    The parameters are defined as seen in the following illustration.
>  
> -  +----------+-------------------------------------+----------+-------+
> -  |          |        ^                            |          |       |
> -  |          |        |vback_porch                 |          |       |
> -  |          |        v                            |          |       |
> -  +----------#######################################----------+-------+
> -  |          #        ^                            #          |       |
> -  |          #        |                            #          |       |
> -  |  hback   #        |                            #  hfront  | hsync |
> -  |   porch  #        |       hactive              #  porch   |  len  |
> -  |<-------->#<-------+--------------------------->#<-------->|<----->|
> -  |          #        |                            #          |       |
> -  |          #        |vactive                     #          |       |
> -  |          #        |                            #          |       |
> -  |          #        v                            #          |       |
> -  +----------#######################################----------+-------+
> -  |          |        ^                            |          |       |
> -  |          |        |vfront_porch                |          |       |
> -  |          |        v                            |          |       |
> -  +----------+-------------------------------------+----------+-------+
> -  |          |        ^                            |          |       |
> -  |          |        |vsync_len                   |          |       |
> -  |          |        v                            |          |       |
> -  +----------+-------------------------------------+----------+-------+
> +  +-------+----------+-------------------------------------+----------+
> +  |       |          |        ^                            |          |
> +  |       |          |        |vsync_len                   |          |
> +  |       |          |        v                            |          |
> +  +-------+----------+-------------------------------------+----------+
> +  |       |          |        ^                            |          |
> +  |       |          |        |vback_porch                 |          |
> +  |       |          |        v                            |          |
> +  +-------+----------#######################################----------+
> +  |       |          #        ^                            #          |
> +  |       |          #        |                            #          |
> +  | hsync |  hback   #        |                            #  hfront  |
> +  |  len  |   porch  #        |       hactive              #  porch   |
> +  |<----->|<-------->#<-------+--------------------------->#<-------->|
> +  |       |          #        |                            #          |
> +  |       |          #        |vactive                     #          |
> +  |       |          #        |                            #          |
> +  |       |          #        v                            #          |
> +  +-------+----------#######################################----------+
> +  |       |          |        ^                            |          |
> +  |       |          |        |vfront_porch                |          |
> +  |       |          |        v                            |          |
> +  +-------+----------+-------------------------------------+----------+
>  
>  
>    The following is the panel timings shown with time on the x-axis.
> -- 
> 2.39.1
