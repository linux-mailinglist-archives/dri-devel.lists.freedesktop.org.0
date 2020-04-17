Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063041ADE4B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 15:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D9A6EBE2;
	Fri, 17 Apr 2020 13:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317466EBE2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:29:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2E4C97D;
 Fri, 17 Apr 2020 15:29:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587130154;
 bh=A5tYWvya+wRvc9UmmGTGVWtr8Z7NO2TYBubILGp2Slg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oaQRiaZdQvgUA0sGmySDGkkfrBcrG8b24LXqCKsPBso9YByPLvKyJcbiaXze0QS07
 t7G04arMCpqNYsdqqTXd1EIqziy1Ngu3z+Q4FPh1X05TjXA2TispZOuZky+TifdJkF
 6BDPlUUh8d8d8rJQKoVfQm86zUn+JpVSWiONof2E=
Date: Fri, 17 Apr 2020 16:29:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/omap: change default signal polarities and drives
Message-ID: <20200417132902.GA11473@pendragon.ideasonboard.com>
References: <20200417114151.25843-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417114151.25843-1-tomi.valkeinen@ti.com>
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
Cc: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Fri, Apr 17, 2020 at 02:41:51PM +0300, Tomi Valkeinen wrote:
> If the given videomode does not specify DISPLAY_FLAG_* for the specific
> signal property, the driver used a default value. These defaults were
> never thought through, as the expectation was that all the DISPLAY_FLAGS
> are always set explicitly.
> 
> With DRM bridge and panel drivers this is not the case, and while that
> issue should be resolved in the future, it's still good to have sane
> signal defaults.
> 
> This patch changes the defaults to what the hardware has as reset
> defaults. Also, based on my experience, I think they make sense and are
> more likely correct than the defaults without this patch.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dispc.c | 33 ++++++-----------------------
>  1 file changed, 6 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index dbb90f2d2ccd..6639ee9b05d3 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -3137,33 +3137,12 @@ static void _dispc_mgr_set_lcd_timings(struct dispc_device *dispc,
>  	dispc_write_reg(dispc, DISPC_TIMING_H(channel), timing_h);
>  	dispc_write_reg(dispc, DISPC_TIMING_V(channel), timing_v);
>  
> -	if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH)
> -		vs = false;
> -	else
> -		vs = true;
> -
> -	if (vm->flags & DISPLAY_FLAGS_HSYNC_HIGH)
> -		hs = false;
> -	else
> -		hs = true;
> -
> -	if (vm->flags & DISPLAY_FLAGS_DE_HIGH)
> -		de = false;
> -	else
> -		de = true;
> -
> -	if (vm->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
> -		ipc = false;
> -	else
> -		ipc = true;
> -
> -	/* always use the 'rf' setting */
> -	onoff = true;
> -
> -	if (vm->flags & DISPLAY_FLAGS_SYNC_POSEDGE)
> -		rf = true;
> -	else
> -		rf = false;
> +	vs = !!(vm->flags & DISPLAY_FLAGS_VSYNC_LOW);
> +	hs = !!(vm->flags & DISPLAY_FLAGS_HSYNC_LOW);
> +	de = !!(vm->flags & DISPLAY_FLAGS_DE_LOW);
> +	ipc = !!(vm->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE);
> +	onoff = true; /* always use the 'rf' setting */
> +	rf = !!(vm->flags & DISPLAY_FLAGS_SYNC_POSEDGE);

Would it make sense to WARN() if flags are not set, to catch offenders
and fix them ? Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	l = FLD_VAL(onoff, 17, 17) |
>  		FLD_VAL(rf, 16, 16) |

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
