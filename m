Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D43EDA35
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 17:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A03E6E02E;
	Mon, 16 Aug 2021 15:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8358E6E02E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 15:54:54 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 44c258c5-feaa-11eb-b37b-0050568c148b;
 Mon, 16 Aug 2021 15:54:41 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1AFB4194B40;
 Mon, 16 Aug 2021 17:54:57 +0200 (CEST)
Date: Mon, 16 Aug 2021 17:54:46 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Robert Foss <robert.foss@linaro.org>
Cc: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 xji@analogixsemi.com, pihsun@chromium.org, tzungbi@google.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] drm/bridge: anx7625: Don't store unread return value
Message-ID: <YRqKRu6UVNy8OZh1@ravnborg.org>
References: <20210816111451.1180895-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816111451.1180895-1-robert.foss@linaro.org>
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

On Mon, Aug 16, 2021 at 01:14:51PM +0200, Robert Foss wrote:
> The return value of sp_tx_rst_aux() is stored, but never read.
> This happens in the context EDID communication already failing,
> which means that this additional failure doesn't necessarily
> convey any additional inforamation.
> 
> This means that we can safely avoid storing the value.
> 
> Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 14d73fb1dd15b..3471785915c45 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -771,7 +771,7 @@ static int segments_edid_read(struct anx7625_data *ctx,
>  		ret = sp_tx_aux_rd(ctx, 0xf1);
>  
>  		if (ret) {
> -			ret = sp_tx_rst_aux(ctx);
> +			sp_tx_rst_aux(ctx);
>  			DRM_DEV_ERROR(dev, "segment read fail, reset!\n");
>  		} else {
>  			ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,

From a quick look this seems to be the wrong fix.
Replace return 0; with return ret; as the last line in this function
looks like the correct fix to me.
With a careful audit that the error handling is OK in said function.

	Sam
