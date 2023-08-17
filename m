Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3928577FAB1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 17:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B0110E4DE;
	Thu, 17 Aug 2023 15:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE0B10E4DE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 15:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id A1DF3FB03;
 Thu, 17 Aug 2023 17:26:48 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6bQjX7_ypAhh; Thu, 17 Aug 2023 17:26:47 +0200 (CEST)
Date: Thu, 17 Aug 2023 17:26:45 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: mxsfb: Exclude i.MX8MQ from power-domains
 requirement
Message-ID: <ZN48NYcefTkM4703@qwark.sigxcpu.org>
References: <20230730184120.94984-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230730184120.94984-1-david@ixit.cz>
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
Cc: Marek Vasut <marex@denx.de>, kernel@puri.sm, devicetree@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Sun, Jul 30, 2023 at 09:41:20PM +0300, David Heidelberg wrote:
> i.MX8MQ uses as secondary compatible fsl,imx6sx-lcdif, which triggers
> requirement of power-domains, thou it's not required.
> 
> Fixes: f62678a77d58 ("dt-bindings: mxsfb: Document i.MX8M/i.MX6SX/i.MX6SL power-domains property")
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/display/fsl,lcdif.yaml        | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index fc11ab5fc465..2d868276b0f9 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -129,8 +129,15 @@ allOf:
>                - fsl,imx8mp-lcdif
>                - fsl,imx93-lcdif
>      then:
> -      required:
> -        - power-domains
> +      if:
> +        properties:
> +          compatible:
> +            not:
> +              contains:
> +                const: fsl,imx8mq-lcdif
> +      then:
> +        required:
> +          - power-domains
>  
>  examples:
>    - |
> -- 
> 2.40.1
> 

Thanks a lot to Marek and Liu for confirming!

Acked-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido
