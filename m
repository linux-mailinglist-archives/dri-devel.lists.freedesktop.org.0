Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C93F0A5E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37B96E83F;
	Wed, 18 Aug 2021 17:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247416E83F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 17:40:11 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4f7111fd-004b-11ec-aa7e-0050568cd888;
 Wed, 18 Aug 2021 17:39:59 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E263B194B06;
 Wed, 18 Aug 2021 19:40:20 +0200 (CEST)
Date: Wed, 18 Aug 2021 19:40:08 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Robert Foss <robert.foss@linaro.org>
Cc: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 xji@analogixsemi.com, pihsun@chromium.org, tzungbi@google.com,
 hsinyi@chromium.org, drinkcat@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: Propagate errors from
 sp_tx_edid_read()
Message-ID: <YR1F+I4/JbBAgpwZ@ravnborg.org>
References: <20210818171318.1848272-1-robert.foss@linaro.org>
 <20210818171318.1848272-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818171318.1848272-2-robert.foss@linaro.org>
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

Hi Robert,

On Wed, Aug 18, 2021 at 07:13:18PM +0200, Robert Foss wrote:
> During the sp_tx_edid_read() call the return value of sp_tx_edid_read()
> is ignored, which could cause potential errors to go unhandled.
> 
> All errors which are returned by sp_tx_edid_read() are handled in
> anx7625_get_edid().
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index ea414cd349b5c..abc8db77bfd36 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -845,8 +845,11 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
>  				if (g_edid_break == 1)
>  					break;
>  
> -				segments_edid_read(ctx, count / 2,
> -						   pblock_buf, offset);
> +				ret = segments_edid_read(ctx, count / 2,
> +							 pblock_buf, offset);
> +				if (ret < 0)
> +					return ret;
> +

This could be just "if (ret)".
Same goes for the next case.

With or without this simplification:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I assume you will apply the patches.

	Sam

>  				memcpy(&pedid_blocks_buf[edid_pos],
>  				       pblock_buf,
>  				       MAX_DPCD_BUFFER_SIZE);
> @@ -863,8 +866,11 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
>  				if (g_edid_break == 1)
>  					break;
>  
> -				segments_edid_read(ctx, count / 2,
> -						   pblock_buf, offset);
> +				ret = segments_edid_read(ctx, count / 2,
> +							 pblock_buf, offset);
> +				if (ret < 0)
> +					return ret;
> +
>  				memcpy(&pedid_blocks_buf[edid_pos],
>  				       pblock_buf,
>  				       MAX_DPCD_BUFFER_SIZE);
> -- 
> 2.30.2
