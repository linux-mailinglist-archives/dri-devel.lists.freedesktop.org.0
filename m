Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D365B76CA38
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 12:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A49710E1EB;
	Wed,  2 Aug 2023 10:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 557 seconds by postgrey-1.36 at gabe;
 Wed, 02 Aug 2023 10:00:40 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF5310E1EB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 10:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id A27B5FB03;
 Wed,  2 Aug 2023 11:51:20 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ut6geAuGSTlo; Wed,  2 Aug 2023 11:51:19 +0200 (CEST)
Date: Wed, 2 Aug 2023 11:51:17 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: mxsfb: Exclude i.MX8MQ from power-domains
 requirement
Message-ID: <ZMonFSqutQRqs61n@qwark.sigxcpu.org>
References: <20230730184120.94984-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@puri.sm
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

We currently enable the mipi power domain for the mipi dphy and nwl
bridge only but not for LCDIF itself assuming it's not needed (as there's
other outputs LCDIF can drive). I *think* this is correct but maybe
Marek or Liu can confirm?

Cheers,
 -- Guido

>  
>  examples:
>    - |
> -- 
> 2.40.1
> 
