Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC742E18A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2ED78940E;
	Thu, 14 Oct 2021 18:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74438940E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:44:14 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id b9e48503-2d1e-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 18:44:13 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CAD29194B13;
 Thu, 14 Oct 2021 20:44:20 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:44:11 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: dri-devel@lists.freedesktop.org, edmund.j.dea@intel.com
Subject: Re: [PATCH v3 6/7] drm/kmb: Enable ADV bridge after modeset
Message-ID: <YWh6e9z3DfDYvuH7@ravnborg.org>
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
 <20211013233632.471892-6-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013233632.471892-6-anitha.chrisanthus@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha,

On Wed, Oct 13, 2021 at 04:36:31PM -0700, Anitha Chrisanthus wrote:
> On KMB, ADV bridge must be programmed and powered on prior to
> MIPI DSI HW initialization.
> 
> Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

> ---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
> index a0669b842ff5..7ab6b7b44cbc 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -1341,6 +1341,7 @@ static void connect_lcd_to_mipi(struct kmb_dsi *kmb_dsi)
>  		return;
>  	}
>  
> +	drm_bridge_chain_enable(adv_bridge);

Do not use drm_bridge_chain_enable(). If you really need to do this hack
use the atomic variant. The one you use here is about to be deleted.

That said - I expect this to be a workaround for some design issue.
One bridge driver should not need to power on another bridge, the
infrastructure should take care.
I know we did not make kmb_dsi a proper bridge, but this may be the time
to do it so we avoid such a workaround and the driver will then be able
to use the bridge infrastructure as it is supposed to do.

	Sam

>  	/* DISABLE MIPI->CIF CONNECTION */
>  	regmap_write(msscam, MSS_MIPI_CIF_CFG, 0);
>  
> -- 
> 2.25.1
