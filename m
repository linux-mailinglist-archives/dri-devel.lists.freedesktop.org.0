Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9A8720648
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 17:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CDC10E18D;
	Fri,  2 Jun 2023 15:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085110E22A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 15:35:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp
 [126.156.168.104])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3045844;
 Fri,  2 Jun 2023 17:35:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685720104;
 bh=uB3WP31ffH7A09eCveznwqPXwuQ+cxBuRjaB5eMZBZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=frY4gMuzuEy76b+mEaxaEns1gKsRTzYS7Xh3hZQmEH/kxfkfUfSjiQ6nfkWTIqHfN
 iFHH9dw1cwdvbtawixXyVRP/rfOlpHnNEC7g8TkWyIGM1rm5d7cR2RsYef4WZs1CEV
 pfuo4b3yxz8Q7wuXl2GyXlSW2aA7GKam433F3Ar8=
Date: Fri, 2 Jun 2023 18:35:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Johannes Zink <j.zink@pengutronix.de>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: simple: support non-default
 data-mapping
Message-ID: <20230602153525.GB3343@pendragon.ideasonboard.com>
References: <20230523-simplepanel_support_nondefault_datamapping-v2-0-87196f0d0b64@pengutronix.de>
 <20230523-simplepanel_support_nondefault_datamapping-v2-2-87196f0d0b64@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v2-2-87196f0d0b64@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <error27@gmail.com>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 patchwork-jzi@pengutronix.de, kernel@pengutronix.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johannes,

Thank you for the patch.

On Tue, May 23, 2023 at 10:19:42AM +0200, Johannes Zink wrote:
> Some Displays support more than just a single default lvds data mapping,

s/lvds/LVDS/

> which can be used to run displays on only 3 LVDS lanes in the jeida-18
> data-mapping mode.
> 
> Add an optional data-mapping property to allow overriding the default
> data mapping. As it does not generally apply to any display and bus: use

s/bus:/bus,/

> it selectively on the innolux,g101ice-l01, which supports changing the
> data mapping via a strapping pin.
> 
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
> ---
> 
> Changes:
> 
> v1 -> v2: - worked in Rob's review findings (thanks for reviewing my
>             work): use extracted common property instead of duplicating
> 	    the property
> 	  - refined commit message
> 	  - add an example dts for automated checking
> ---
>  .../bindings/display/panel/panel-simple.yaml       | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index ec50dd268314..698301c8c920 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -21,9 +21,9 @@ description: |
>  
>  allOf:
>    - $ref: panel-common.yaml#
> +  - $ref: ../lvds-data-mapping.yaml#
>  
>  properties:
> -
>    compatible:
>      enum:
>      # compatible must be listed in alphabetical order, ordered by compatible.
> @@ -353,6 +353,17 @@ properties:
>    power-supply: true
>    no-hpd: true
>    hpd-gpios: true
> +  data-mapping: true

As the property is optional, don't you need a default value ?

> +
> +if:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          const: innolux,g101ice-l01
> +then:
> +  properties:
> +    data-mapping: false
>  
>  additionalProperties: false
>  
> @@ -372,3 +383,16 @@ examples:
>          };
>        };
>      };
> +  - |
> +    panel_lvds: panel-lvds {
> +      compatible = "innolux,g101ice-l01";
> +      power-supply = <&vcc_lcd_reg>;
> +
> +      data-mapping = "jeida-24";
> +
> +      port {
> +        panel_in_lvds: endpoint {
> +          remote-endpoint = <&ltdc_out_lvds>;
> +        };
> +      };
> +    };
> 

-- 
Regards,

Laurent Pinchart
