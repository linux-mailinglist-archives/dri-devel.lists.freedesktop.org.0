Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF12726CC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 16:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297236E35D;
	Mon, 21 Sep 2020 14:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F2C6E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 14:17:27 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kKMd5-0000fA-4c; Mon, 21 Sep 2020 16:17:19 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kKMcu-0001GY-Vp; Mon, 21 Sep 2020 16:17:08 +0200
Message-ID: <339d90457a08694b24df09afa62cfa0dd185f76b.camel@pengutronix.de>
Subject: Re: [PATCH -next] drm/panfrost: simplify the return expression of
 cz_ih_hw_init()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Qinglang Miao <miaoqinglang@huawei.com>, Rob Herring <robh@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price
 <steven.price@arm.com>, Alyssa Rosenzweig
 <alyssa.rosenzweig@collabora.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Mon, 21 Sep 2020 16:17:08 +0200
In-Reply-To: <20200921131019.91558-1-miaoqinglang@huawei.com>
References: <20200921131019.91558-1-miaoqinglang@huawei.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-09-21 at 21:10 +0800, Qinglang Miao wrote:
> Simplify the return expression.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index e68967338..ea8d31863 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -18,19 +18,13 @@
>  
>  static int panfrost_reset_init(struct panfrost_device *pfdev)
>  {
> -	int err;
> -
>  	pfdev->rstc = devm_reset_control_array_get(pfdev->dev, false, true);
>  	if (IS_ERR(pfdev->rstc)) {
>  		dev_err(pfdev->dev, "get reset failed %ld\n", PTR_ERR(pfdev->rstc));
>  		return PTR_ERR(pfdev->rstc);
>  	}
>  
> -	err = reset_control_deassert(pfdev->rstc);
> -	if (err)
> -		return err;
> -
> -	return 0;
> +	return reset_control_deassert(pfdev->rstc);
>  }
>  
>  static void panfrost_reset_fini(struct panfrost_device *pfdev)

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
