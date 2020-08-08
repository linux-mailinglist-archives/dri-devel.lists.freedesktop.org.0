Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C3123F8FC
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 23:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8626E277;
	Sat,  8 Aug 2020 21:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C426E277
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 21:13:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi
 [85.76.78.184])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92B2AF9;
 Sat,  8 Aug 2020 23:13:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596921219;
 bh=rtS6tS3nmrZ2AAjnJbktvLuwGb3JE1Bru8oeDg8DkDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NL2MjYY6cydNHOnjQ3wufTITscClL0972hLsySCWwOibCWKCN688Uw4V3/Fbm2suL
 W9K5hSXQP1N+476ZYm7l669wpGinOL66oDPrQi+t44XlEiJkRABi64nwAu30io5yBK
 4FlXBL5PUt15aEtA3ql4FPp941fPuSr382DhpS+I=
Date: Sun, 9 Aug 2020 00:13:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 6/7] ARM: dts: r8a7742: Add LVDS support
Message-ID: <20200808211323.GR6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar,

Thank you for the patch.

On Fri, Aug 07, 2020 at 06:49:53PM +0100, Lad Prabhakar wrote:
> Add LVDS encoder node to r8a7742 SoC DT.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r8a7742.dtsi | 54 ++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
> index a979a4b3de61..a7e66220d63a 100644
> --- a/arch/arm/boot/dts/r8a7742.dtsi
> +++ b/arch/arm/boot/dts/r8a7742.dtsi
> @@ -1534,11 +1534,65 @@
>  				port@1 {
>  					reg = <1>;
>  					du_out_lvds0: endpoint {
> +						remote-endpoint = <&lvds0_in>;
>  					};
>  				};
>  				port@2 {
>  					reg = <2>;
>  					du_out_lvds1: endpoint {
> +						remote-endpoint = <&lvds1_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds0: lvds@feb90000 {
> +			compatible = "renesas,r8a7742-lvds";
> +			reg = <0 0xfeb90000 0 0x1c>;

Isn't 0x14 enough for the size ? 0x1c won't hurt though. Same comment
below.

With or without this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			clocks = <&cpg CPG_MOD 726>;
> +			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
> +			resets = <&cpg 726>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds0_in: endpoint {
> +						remote-endpoint = <&du_out_lvds0>;
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					lvds0_out: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds1: lvds@feb94000 {
> +			compatible = "renesas,r8a7742-lvds";
> +			reg = <0 0xfeb94000 0 0x1c>;
> +			clocks = <&cpg CPG_MOD 725>;
> +			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
> +			resets = <&cpg 725>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds1_in: endpoint {
> +						remote-endpoint = <&du_out_lvds1>;
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					lvds1_out: endpoint {
>  					};
>  				};
>  			};

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
