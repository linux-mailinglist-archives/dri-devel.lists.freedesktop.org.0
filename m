Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07D42DB810
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 02:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDBD89BB3;
	Wed, 16 Dec 2020 01:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B1689BB3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 01:00:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9BFF593;
 Wed, 16 Dec 2020 02:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608080449;
 bh=BpD9yvELgRke6zwYTRe95qIDDUllDO2mddkQNltqIFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cvD7unDSyM1jk1L5ajG6/pZI9zdnvCOT3LK04R+RxQ2AK/i9ha9DAK+WIIjZSMoL4
 0jIZTcqXu1zqcKBqn6FvHc99TGW8Qo4j17V0CIu5hmF59Wk8ud8Uqa00+HxdLf3NsU
 hObcRYVPc6dYtI45S9nRRdm+hQTvlHE03oUavo0A=
Date: Wed, 16 Dec 2020 03:00:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wang Xiaojun <wangxiaojun11@huawei.com>
Subject: Re: [PATCH] drm: rcar-du: Fix the return check of of_parse_phandle
 and of_find_device_by_node
Message-ID: <X9lcOpl2IN/EVL9+@pendragon.ideasonboard.com>
References: <20201111031452.3659714-1-wangxiaojun11@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111031452.3659714-1-wangxiaojun11@huawei.com>
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
Cc: airlied@linux.ie, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wang,

Thank you for the patch.

On Wed, Nov 11, 2020 at 11:14:52AM +0800, Wang Xiaojun wrote:
> of_parse_phandle and of_find_device_by_node may return NULL
> which cannot be checked by IS_ERR.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and queued in my tree for v5.12.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 72dda446355f..fcfddf7ad3f3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -700,10 +700,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
>  		int ret;
>  
>  		cmm = of_parse_phandle(np, "renesas,cmms", i);
> -		if (IS_ERR(cmm)) {
> +		if (!cmm) {
>  			dev_err(rcdu->dev,
>  				"Failed to parse 'renesas,cmms' property\n");
> -			return PTR_ERR(cmm);
> +			return -ENODEV;
>  		}
>  
>  		if (!of_device_is_available(cmm)) {
> @@ -713,10 +713,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
>  		}
>  
>  		pdev = of_find_device_by_node(cmm);
> -		if (IS_ERR(pdev)) {
> +		if (!pdev) {
>  			dev_err(rcdu->dev, "No device found for CMM%u\n", i);
>  			of_node_put(cmm);
> -			return PTR_ERR(pdev);
> +			return -ENODEV;
>  		}
>  
>  		of_node_put(cmm);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
