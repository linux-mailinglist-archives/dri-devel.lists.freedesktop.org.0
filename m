Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57E79ECCAB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 14:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ED310EB2D;
	Wed, 11 Dec 2024 12:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pw6/B1pi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DBD10EB38
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 12:59:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8746C83D;
 Wed, 11 Dec 2024 13:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733921959;
 bh=9vwQ4DTXUQXSYuiFSuO8qJgz9ksaOqF3dLukB/AVSGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pw6/B1pigVl9UzRrAM00Ngki8vn4ZwCcifeQhyI1zN7yc6c+epaLp/4sOFBVdQ5/p
 i00g9RUf2XLbBvUtQHWwHflqmAnkq1REab8IgOPL64krLJHd86czRbqNl2JyHrockm
 uToREKoBgRGMaEsnQ0Zt7m5W5XrL1D7AW+LICakY=
Date: Wed, 11 Dec 2024 14:59:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Karol Przybylski <karprzy7@gmail.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, michal.simek@amd.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: zynqmp_dp: Fix integer overflow in
 zynqmp_dp_rate_get()
Message-ID: <20241211125936.GA23711@pendragon.ideasonboard.com>
References: <20241211122026.797511-1-karprzy7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211122026.797511-1-karprzy7@gmail.com>
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

Hi Karol,

Thank you for the patch.

On Wed, Dec 11, 2024 at 01:20:26PM +0100, Karol Przybylski wrote:
> This patch fixes a potential integer overflow in the zynqmp_dp_rate_get() function.
> 
> The issue comes up when the expression drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit arithmetic.

Please wrap your commit message text to 82 columns.

> 
> Now the constant is casted to compatible u64 type.
> 
> Resolves CID 1636340 and CID 1635811
> 

Does this need a Fixes: tag ? How about 'Cc: stable@vger.kernel.org' to
get it backported to stable kernels ?

> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 25c5dc61e..55e92344b 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
>  	struct zynqmp_dp *dp = data;
>  
>  	mutex_lock(&dp->lock);
> -	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
> +	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * (u64)10000;

You can also make the integer a 64-bit constant with

	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;

>  	mutex_unlock(&dp->lock);
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
