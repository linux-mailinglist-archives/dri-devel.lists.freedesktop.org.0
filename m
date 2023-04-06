Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F276D8CDA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 03:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDF310E337;
	Thu,  6 Apr 2023 01:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF9210EACB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 01:40:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp
 [118.241.147.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E49AE905;
 Thu,  6 Apr 2023 03:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680745225;
 bh=3gqmu4KgxgYFuJy5DilzdfPDlIkPg8yygx/h/5xSCu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DQr3ojnssfSQ8mE18DBh0lp66rrAFfpo0cDHvOAXYN0qPOHyi4XWJZHt3v7Wf4nDx
 TvxcyCgUh89NxDA5D/BmPG3GXuSddCK9rnWW5xubAtvzJBDM/O6BDZfmfSKmixgWzj
 UlER7+GWwJxVhWmQImI6iiQr/ohFpOrEm9qrQzDE=
Date: Thu, 6 Apr 2023 04:40:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: Add no-hpd property
Message-ID: <20230406014032.GN9915@pendragon.ideasonboard.com>
References: <20230405142440.191939-1-j-choudhary@ti.com>
 <20230405142440.191939-2-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230405142440.191939-2-j-choudhary@ti.com>
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, r-ravikumar@ti.com, rfoss@kernel.org, a-bhatia1@ti.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, sjakhade@cadence.com,
 devicetree@vger.kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 jani.nikula@intel.com, robh+dt@kernel.org, neil.armstrong@linaro.org,
 yamonkar@cadence.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jayesh,

Thank you for the patch.

On Wed, Apr 05, 2023 at 07:54:39PM +0530, Jayesh Choudhary wrote:
> From: Rahul T R <r-ravikumar@ti.com>
> 
> The mhdp bridge can work without its HPD pin hooked up to the connector,
> but the current bridge driver throws an error when hpd line is not
> connected to the connector. For such cases, we need an indication for
> no-hpd, using which we can bypass the hpd detection and instead use the
> auxiliary channels connected to the DP connector to confirm the
> connection.
> So add no-hpd property to the bindings, to disable hpd when not
> connected or unusable.
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../devicetree/bindings/display/bridge/cdns,mhdp8546.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index c2b369456e4e..3a6c6d837593 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -57,6 +57,12 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  cdns,no-hpd:
> +    type: boolean
> +    description:
> +      Set if the HPD line on the bridge isn't hooked up to anything or is
> +      otherwise unusable.

I'm fine with the non connected part, but concerned with "otherwise
unusable". It's very vague and could thus be abused. Do you have
particular use cases in mind for this ? If so, restricting this to those
use cases, or at least giving examples, would help.

> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  

-- 
Regards,

Laurent Pinchart
