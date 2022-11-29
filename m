Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7297463C8B4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8586810E35A;
	Tue, 29 Nov 2022 19:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEBC10E35A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:44:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E5AE4E6;
 Tue, 29 Nov 2022 20:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669751075;
 bh=aHIt+6NDi7uH8L6lePtklr/vuY7T4z1pKPkbs4NNDs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E3Tb/H2SvQuscr1bRlR1L9qFPSdfBe6is3t6ZXMGKnnyH8t6xvhcNkbJapLC2dqeX
 oy5vefn2eMtvS59RLg31hp2m8CDEX/xO938Z+NFfM01iYh7OPZP4anvxwUTJfJgPYu
 +nj6V9ed1sbDmWOmduEbViEQnh9cOmZOXOfjV4lM=
Date: Tue, 29 Nov 2022 21:44:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 19/26] drm: shmobile: Remove #ifdef guards for PM
 related functions
Message-ID: <Y4ZhE4vVJC5ewhnl@pendragon.ideasonboard.com>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
 <20221129191942.138244-6-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221129191942.138244-6-paul@crapouillou.net>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Thank you for the patch.

On Tue, Nov 29, 2022 at 07:19:35PM +0000, Paul Cercueil wrote:
> Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handle
> the .suspend/.resume callbacks.
> 
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 3d511fa38913..337040fa6438 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -143,7 +143,6 @@ static const struct drm_driver shmob_drm_driver = {
>   * Power management
>   */
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int shmob_drm_pm_suspend(struct device *dev)
>  {
>  	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
> @@ -165,11 +164,9 @@ static int shmob_drm_pm_resume(struct device *dev)
>  	drm_kms_helper_poll_enable(sdev->ddev);
>  	return 0;
>  }
> -#endif
>  
> -static const struct dev_pm_ops shmob_drm_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(shmob_drm_pm_suspend, shmob_drm_pm_resume)
> -};
> +static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,
> +				shmob_drm_pm_suspend, shmob_drm_pm_resume);
>  
>  /* -----------------------------------------------------------------------------
>   * Platform driver
> @@ -292,7 +289,7 @@ static struct platform_driver shmob_drm_platform_driver = {
>  	.remove		= shmob_drm_remove,
>  	.driver		= {
>  		.name	= "shmob-drm",
> -		.pm	= &shmob_drm_pm_ops,
> +		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart
