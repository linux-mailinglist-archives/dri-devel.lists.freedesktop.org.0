Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0C411355
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 13:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE036E4AE;
	Mon, 20 Sep 2021 11:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6856E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:06:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 713FD1F42BA9
Date: Mon, 20 Sep 2021 07:06:34 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm/panfrost: simplify getting .driver_data
Message-ID: <YUhrOueF2hb8o+IA@maud>
References: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
 <20210920090522.23784-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920090522.23784-6-wsa+renesas@sang-engineering.com>
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

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

> index bd9b7be63b0f..fd4309209088 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -400,8 +400,7 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>  #ifdef CONFIG_PM
>  int panfrost_device_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
>  	panfrost_device_reset(pfdev);
>  	panfrost_devfreq_resume(pfdev);
> @@ -411,8 +410,7 @@ int panfrost_device_resume(struct device *dev)
>  
>  int panfrost_device_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
>  	if (!panfrost_job_is_idle(pfdev))
>  		return -EBUSY;
> -- 
> 2.30.2
> 
