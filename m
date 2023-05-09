Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B876FC165
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 10:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A88610E34B;
	Tue,  9 May 2023 08:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6653410E34B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 08:11:18 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74DDC4DB;
 Tue,  9 May 2023 10:11:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683619869;
 bh=K7VuCipIjOQQKqd7bO1H5Jg8lw49SSYLp20/SnxJZU4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AhGHZkRyPUsCvwyV2C5g+WoHrSfSI/UxrWAvQSyIal3R/vdx147OFasnqtCUcZ9Kn
 fr0OAxIahWyn4AsTqoZbE5gsBOa0j7PCN/cu2zjDh5HnTqr6+d9rLzLN50L5im+s9T
 B5muboyN+/8raiOOS8VgMCLyGit2HqlLWpo2wbAc=
Message-ID: <9362d0db-f922-99c3-7fbd-1813fcdb49dd@ideasonboard.com>
Date: Tue, 9 May 2023 11:11:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 46/53] drm/tidss: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-47-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230507162616.1368908-47-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/05/2023 19:26, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/gpu/drm/tidss/tidss_drv.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 2dac8727d2f4..13177d58c8f9 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -197,7 +197,7 @@ static int tidss_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int tidss_remove(struct platform_device *pdev)
> +static void tidss_remove(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct tidss_device *tidss = platform_get_drvdata(pdev);
> @@ -221,8 +221,6 @@ static int tidss_remove(struct platform_device *pdev)
>   	dispc_remove(tidss);
>   
>   	dev_dbg(dev, "%s done\n", __func__);
> -
> -	return 0;
>   }
>   
>   static void tidss_shutdown(struct platform_device *pdev)
> @@ -241,7 +239,7 @@ MODULE_DEVICE_TABLE(of, tidss_of_table);
>   
>   static struct platform_driver tidss_platform_driver = {
>   	.probe		= tidss_probe,
> -	.remove		= tidss_remove,
> +	.remove_new	= tidss_remove,
>   	.shutdown	= tidss_shutdown,
>   	.driver		= {
>   		.name	= "tidss",

