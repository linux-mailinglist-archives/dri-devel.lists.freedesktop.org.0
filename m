Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639D4651488
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 21:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8648210E300;
	Mon, 19 Dec 2022 20:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F20410E300
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 20:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1671483475; bh=bw+vFRLJBicCKi0DqfuluaeEELUl9w4wTv5BbELJNVo=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=Vamg3pcHHRA67f/XQKn4q8lelLdbktd460/YtB+jGXl1tlPQkoILh5htTjp1OZN6W
 pRHVJeT5YUdvbd10iwCKQXv9PdtZcJq5Cgr9YX4j3WeD4OrTY7CYfuDKjoYFcPaWem
 SSyRDMBqvm6TyFbqhB1nw0PA0yKGsauT4EiwPYGY=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Mon, 19 Dec 2022 21:57:55 +0100 (CET)
X-EA-Auth: HgtstMzqwGvJ7bvMYq0xwJE9XB5XV5qIuTWCKk8WVU7zqEEK1Nv0tC8U9otVZ3nJ8LxadVs0F0TdAkWBMOECchgPeQN0HxoT
Date: Tue, 20 Dec 2022 02:27:50 +0530
From: Deepak R Varma <drv@mailo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: sor: Remove redundant error logging
Message-ID: <Y6DQTkTMhEefCkBL@qemulion>
References: <Y5a4z0TZSqUPfRkr@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5a4z0TZSqUPfRkr@qemulion>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>, drv@mailo.com,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 10:44:55AM +0530, Deepak R Varma wrote:

Hello,
May I please request a review and feedback on this patch proposal?

Also, I was able to build the changes for ARM arch verified using modinfo
tegr-drm.ko command.


Thank you,
./drv


> A call to platform_get_irq() already prints an error on failure within
> its own implementation. So printing another error based on its return
> value in the caller is redundant and should be removed. The clean up
> also makes if condition block braces unnecessary. Remove that as well.
>
> Issue identified using platform_get_irq.cocci coccicheck script.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Please note: I was not able to build this driver since I did not find the
> DRM_TEGRA option in menu config. All dependencies listed in the KConfig are
> enabled, however, I was still not able to find the DRM_TEGRA module in the
> Graphics-Drivers list. Since the proposed change is known, minor and obvious, I
> am sending in this patch without build testing.
>
> Any advise on how to enable the DRM_TEGRA module in menuconfig selection list
> will be helpful. Thank you.
>
>
>  drivers/gpu/drm/tegra/sor.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 8af632740673..ceaebd33408d 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3799,10 +3799,8 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  	}
>
>  	err = platform_get_irq(pdev, 0);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to get IRQ: %d\n", err);
> +	if (err < 0)
>  		goto remove;
> -	}
>
>  	sor->irq = err;
>
> --
> 2.34.1
>


