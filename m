Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B7314520
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 01:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95AB6E1BD;
	Tue,  9 Feb 2021 00:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E753E6E1BD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 00:55:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EE87583;
 Tue,  9 Feb 2021 01:55:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1612832144;
 bh=546XL7xvfL+LHfS20TPPogFKXmYg6uzn09ILuWcX4WQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k4O6FiQMMKQ6cBYRJ5jRsDWoUYRiw+BOA6T8Uw7QvLZoRVVGeAXooKnmfJ2MBsS4p
 irVBm61yDhYnP9U+A7vtglGHhvoRLJnnMPbzdwFdaBp1QWw90DG7pabLEKztc/MiNx
 ldEbqEpdlm54OOSjSMHBAWxwDvDcVFhwRzqq4WH4=
Date: Tue, 9 Feb 2021 02:55:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mykyta Poturai <ddone@aruko.org>
Subject: Re: [PATCH 2/2] dt-bindings: display: Add "disable-hpd" binding
Message-ID: <YCHdd1msOsodLn+v@pendragon.ideasonboard.com>
References: <20210131095701.965147-1-ddone@aruko.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210131095701.965147-1-ddone@aruko.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mykyta,

Thank you for the patch.

On Sun, Jan 31, 2021 at 11:57:01AM +0200, Mykyta Poturai wrote:
> Add the "disable-hpd" binding, used to disable hotplug detected
> functionality in the driver. When it's enabled the driver assumes that
> the connector is always connected and disables the hotplug detect
> related IRQ.
> 
> Signed-off-by: Mykyta Poturai <ddone@aruko.org>
> ---
>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> index 3f6072651182..b2b899f46b86 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> @@ -39,6 +39,7 @@ Optional properties:
>  
>  - power-domains: Shall reference the power domain that contains the DWC HDMI,
>    if any.
> +- disable-hpd: Disables the hotplug detect feature

A similar property has been added to the ti,sn65dsi86 bindings in commit
1dbc979172af ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd").
A property with the same name exists in panel-common.yaml. Could we
standardize on that name ?

The description should also explain the hardware architecture, not the
driver behaviour. This is what the ti,sn65dsi86 binding documents:

  no-hpd:
    type: boolean
    description:
      Set if the HPD line on the bridge isn't hooked up to anything or is
      otherwise unusable.

You could use the same description, assuming this is the use case you
want to support. Could you perhaps describe your problem in a bit more
details ? Do you have a system with an HDMI panel that is always
connected, with the HPD signal of the dw-hdmi not connected ?

>  Example:

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
