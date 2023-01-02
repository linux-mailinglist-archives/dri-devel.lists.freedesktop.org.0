Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C065B287
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 14:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6629B10E332;
	Mon,  2 Jan 2023 13:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCB610E332
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 13:11:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA3137C5;
 Mon,  2 Jan 2023 14:11:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1672665065;
 bh=OK4A1KfGEclvuJXN/ybxjJzeZRWRpirRlikGcWdNS4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DaN9FihJfEPPW9Y2altvxtwA3gvrPKHfBr0KXpFEkl9Obd+MuAqHiUvB6LkQBdHRM
 m+jWTdU9VrGaLul/vGbwrGq4HesPTxThhqT4CuQ/pYzTp/DwKP5HeQuDytY7O6Efxv
 sQGxRsebnkVVAPudtNUOZhXp455WfSG3i2jhRXzM=
Date: Mon, 2 Jan 2023 15:11:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rahul T R <r-ravikumar@ti.com>
Subject: Re: [PATCH v10 2/5] dt-bindings: display: bridge: cdns,dsi: Add
 compatible for dsi on j721e
Message-ID: <Y7LX5f7Zc52d5OLH@pendragon.ideasonboard.com>
References: <20230102100942.1828-1-r-ravikumar@ti.com>
 <20230102100942.1828-3-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230102100942.1828-3-r-ravikumar@ti.com>
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
Cc: mparab@cadence.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, a-bhatia1@ti.com, narmstrong@baylibre.com,
 airlied@linux.ie, tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, robert.foss@linaro.org,
 andrzej.hajda@intel.com, jpawar@cadence.com, lee.jones@linaro.org,
 vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rahul,

Thank you for the patch.

On Mon, Jan 02, 2023 at 03:39:39PM +0530, Rahul T R wrote:
> Add compatible to support dsi bridge on j721e
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/display/bridge/cdns,dsi.yaml     | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> index 3161c33093c1..23060324d16e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> @@ -16,9 +16,15 @@ properties:
>    compatible:
>      enum:
>        - cdns,dsi
> +      - ti,j721e-dsi
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description:
> +          Register block for controller's registers.
> +      - description:
> +          Register block for wrapper settings registers in case of TI J7 SoCs.
>  
>    clocks:
>      items:
> @@ -67,6 +73,23 @@ properties:
>  allOf:
>    - $ref: ../dsi-controller.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,j721e-dsi
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +        power-domains:
> +          maxItems: 1
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
>  required:
>    - compatible
>    - reg

-- 
Regards,

Laurent Pinchart
