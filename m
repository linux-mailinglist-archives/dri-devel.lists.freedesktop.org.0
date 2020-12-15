Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6212DAC59
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 12:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FFC6E30D;
	Tue, 15 Dec 2020 11:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C0B6E30D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 11:50:33 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 135803A1A3D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 11:39:02 +0000 (UTC)
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it
 [93.34.118.233]) (Authenticated sender: jacopo@jmondi.org)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2020D200005;
 Tue, 15 Dec 2020 11:38:34 +0000 (UTC)
Date: Tue, 15 Dec 2020 12:38:45 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH] drm: rcar-du: fix reference leak in rcar_cmm_enable
Message-ID: <20201215113845.zy4keqwnk3kgw2z2@uno.localdomain>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Qinglang,

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

I -think- you can break this line. Anyway, maintainers can fix when
applying if they feel to.

>
> Fixes: e08e934d6c28 ("drm: rcar-du: Add support for CMM")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Seems fair!
Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

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
> --
> 2.23.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
