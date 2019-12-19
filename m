Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D0B126DEB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 20:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524C6E3CB;
	Thu, 19 Dec 2019 19:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B359E6E3CB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 19:25:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FF64FDF;
 Thu, 19 Dec 2019 20:25:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576783544;
 bh=f2XaZ7DmifiWGXP5rLpw6uIZtODCd5IqeK6xNp8OEyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RVBtFiVpcNpO+pUrJBIZxBl2gm/ve0uLpHcehc//MmQbv/JCi1Bbj5FBalXaAUcbv
 ASsBLqd7o60O9gEetGUV6yRAwOGyJHNULLNjvrYQtKUjSX9qlfr66xBtf+CHPhz2Mc
 2+N8zvlVHE85G0RIrqCYBq7jQ4pKy4rLGO4+paOU=
Date: Thu, 19 Dec 2019 21:25:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 34/51] drm/omap: venc: Register a drm_bridge
Message-ID: <20191219192532.GH4885@pendragon.ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
 <20191219104522.9379-35-laurent.pinchart@ideasonboard.com>
 <c7372ffc-d6f6-8696-6eab-9cfe16d75005@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c7372ffc-d6f6-8696-6eab-9cfe16d75005@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Thu, Dec 19, 2019 at 01:41:47PM +0200, Tomi Valkeinen wrote:
> On 19/12/2019 12:45, Laurent Pinchart wrote:
> > In order to integrate with a chain of drm_bridge, the internal VENC
> > encoder has to expose the mode valid, fixup and set, the enable and
> > disable and the get modes operations through the drm_bridge API.
> > Register a bridge at initialisation time to do so.
> > 
> > Most of those operations are removed from the omap_dss_device as they
> > are now called through the drm_bridge API by the DRM atomic helpers. The
> > only exception is the .get_modes() operation that is still invoked
> > through the omap_dss_device-based pipeline.
> > 
> > For the time being make the next bridge in the chain optional as the
> > VENC output is still based on omap_dss_device. The create_connector
> > argument to the bridge attach function is also ignored for the same
> > reason. This will be changed later when removing the related
> > omapdrm-specific display drivers.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > ---
> 
> Something with venc is different than without your series.
> 
> I have beagleboard xm, with both DVI and s-video connected. With and without your series, kmsprint shows:
> 
> Connector 0 (45) DVI-D-1 (connected)
>   Encoder 0 (44) TMDS
>     Crtc 0 (47) 1920x1200 154.000 1920/48/32/80 1200/3/6/26 60 (59.95)
>       Plane 0 (32) fb-id: 51 (crtcs: 0 1) 0,0 1920x1200 -> 0,0 1920x1200 (RX12 AR12 RG16 XR24 RG24 AR24 RA24 RX24)
>         FB 51 1920x1200
> Connector 1 (48) S-Video-1 (unknown)
>   Encoder 1 (46) TMDS
> 
> Without your series:
> 
> # ./kmstest -c s-video
> Connector 1/@48: S-Video-1
>   Crtc 1/@49: 720x574i@50.00 13.500 720/12/64/68/- 574/5/5/41/- 50 (50.00) 0x1a 0x48
>   Plane 0/@32: 0,0-720x574
>     Fb 53 720x574-XR24
> press enter to exit
> 
> and I have a picture on the display.
> 
> With your series:
> 
> # ./kmstest -c s-video
> terminate called after throwing an instance of 'std::invalid_argument'
>   what():  no modes available

:-S Do you plan to bisect this, or should I give it a go ?

> To be honest, I'm not quite sure how an unknown-connection output
> should work (maybe kmstest doesn't handle it right), but the behavior
> is different.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
