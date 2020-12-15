Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019D12DB403
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 19:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB62C89B55;
	Tue, 15 Dec 2020 18:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138C189B7B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 18:51:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D605D593;
 Tue, 15 Dec 2020 19:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608058294;
 bh=CX19z2xhCWPnBJt/UfsNscnL+UtMH1/Faxi7jyzarwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gv0NOM/zNituv2OO8aeHLIFlpSHjwSOuyFonMWxqgNryPKEh7ifrZ9vuIJi0qs04H
 WO+lJvGsW9krNboPZkiZpnntdYJMpnwvz61OgOoPVCFJ6w564kDpt1DzlJLoZjR57A
 NZyOQG+OmyGuDMnXb8KmGRGitauOKFm/xWv88l2M=
Date: Tue, 15 Dec 2020 20:51:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH] drm: rcar-du: fix reference leak in rcar_cmm_enable
Message-ID: <X9kFryFOEfl5+S3B@pendragon.ideasonboard.com>
References: <20201127094444.121186-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127094444.121186-1-miaoqinglang@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qinglang,

Thank you for the patch.

On Fri, Nov 27, 2020 at 05:44:44PM +0800, Qinglang Miao wrote:
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to putting operation will result in a
> reference leak here.
> 
> A new function pm_runtime_resume_and_get is introduced in
> [0] to keep usage counter balanced. So We fix the reference
> leak by replacing it with new funtion.
> 
> [0] dd8088d5a896 ("PM: runtime: Add  pm_runtime_resume_and_get to deal with usage counter")
> 
> Fixes: e08e934d6c28 ("drm: rcar-du: Add support for CMM")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

And queued for v5.11.

> ---
>  drivers/gpu/drm/rcar-du/rcar_cmm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> index c578095b0..382d53f8a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> @@ -122,7 +122,7 @@ int rcar_cmm_enable(struct platform_device *pdev)
>  {
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret < 0)
>  		return ret;
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
