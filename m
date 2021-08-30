Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88F73FB844
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 16:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A65689E32;
	Mon, 30 Aug 2021 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4072C89E32
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 14:36:06 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 9529bc39-099f-11ec-b37b-0050568c148b;
 Mon, 30 Aug 2021 14:35:54 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5A59D194B38;
 Mon, 30 Aug 2021 16:36:13 +0200 (CEST)
Date: Mon, 30 Aug 2021 16:36:00 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: jyri.sarha@iki.fi, tomba@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tidss: Make use of the helper macro
 SET_RUNTIME_PM_OPS()
Message-ID: <YSzs0CzOi6p72qId@ravnborg.org>
References: <20210828085252.1724-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828085252.1724-1-caihuoqing@baidu.com>
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

Hi Cai,

On Sat, Aug 28, 2021 at 04:52:52PM +0800, Cai Huoqing wrote:
> Use the helper macro SET_RUNTIME_PM_OPS() instead of the verbose
> operators ".runtime_suspend/.runtime_resume", because the
> SET_RUNTIME_PM_OPS() is a nice helper macro that could be brought
> in to make code a little clearer, a little more concise.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/gpu/drm/tidss/tidss_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index d620f35688da..57605b80b526 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -91,9 +91,8 @@ static int __maybe_unused tidss_resume(struct device *dev)
>  #ifdef CONFIG_PM
>  
>  static const struct dev_pm_ops tidss_pm_ops = {
> -	.runtime_suspend = tidss_pm_runtime_suspend,
> -	.runtime_resume = tidss_pm_runtime_resume,
>  	SET_SYSTEM_SLEEP_PM_OPS(tidss_suspend, tidss_resume)
> +	SET_RUNTIME_PM_OPS(tidss_pm_runtime_suspend, tidss_pm_runtime_resume, NULL)
>  };
>  
>  #endif /* CONFIG_PM */

This change would make sense if you:
- dropped the ifdef CONFIG_PM as they are now included in the macros.
- used pm_ptr() in the assignment in tidss_platform_driver

If this way you killed all CONFIG_PM uses in the driver.
I would do this in one patch - as it is all simple changes.

Note: For drivers with no CONFIG_PM use I would not introduce the
macros as in this cases they hurt readability.

	Sam

