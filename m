Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BCB7A940B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 14:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB0A10E5DF;
	Thu, 21 Sep 2023 12:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F8010E5DF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695298158; x=1726834158;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oay5k/k4FowXctAo6RDPN3Ut0nEsXm0SCNAvWbRxE3Q=;
 b=nK2V4SZpVhdnHZRBDUFtb6hcA22NuG9+jEvXtgvXOn+fPL6zlZSqcnno
 zlSJ/9k/0N4yozbLx6cL4LYhv4zC/FQHJeoJzG1cVdAud/Y55m6+FP/19
 JWCHNl9Ym9562HlkJHdIavxyGTGumoRoxKKVMrKU0RtwhT/QKTMNMUxAj
 xMlUL5BcOFYMG57WIboc0KI3t3Y9JNkHs2X8QMK3iFz18k6/qMXLR/cBx
 y4YVUyFtR2bfftuHUb2RfmXmb94BYApP2NG/bd5TEUnadoev+DaE/pqcA
 xKqpTWUxCEymEKpxYwCJ+9/g0dQK4X7Rq7sFqRL3LchCbHQWna1W3jWoL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360747606"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="360747606"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 05:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077875040"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="1077875040"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 05:09:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/bridge: Add 200ms delay to wait FW HPD status stable
In-Reply-To: <20230921091435.3524869-1-xji@analogixsemi.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230921091435.3524869-1-xji@analogixsemi.com>
Date: Thu, 21 Sep 2023 15:09:10 +0300
Message-ID: <87leczpw2h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Sep 2023, Xin Ji <xji@analogixsemi.com> wrote:
> For the none-interrupt design(sink device is panel, polling HPD
> status when chip power on), anx7625 FW has more than 200ms HPD
> de-bounce time in FW, for the safety to get HPD status, driver
> better to wait 200ms before HPD detection after OS resume back.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 51abe42c639e..833d6d50a03d 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1464,6 +1464,9 @@ static int _anx7625_hpd_polling(struct anx7625_data *ctx,
>  	if (ctx->pdata.intp_irq)
>  		return 0;
>  
> +	/* Delay 200ms for FW HPD de-bounce */
> +	usleep_range(200000, 201000);

If you need to sleep for 200 ms, maybe use msleep instead?

BR,
Jani.

> +
>  	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
>  				 ctx, val,
>  				 ((val & HPD_STATUS) || (val < 0)),

-- 
Jani Nikula, Intel
