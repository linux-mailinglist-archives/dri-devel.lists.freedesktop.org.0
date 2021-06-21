Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32B3AF6CD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 22:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F260E6E418;
	Mon, 21 Jun 2021 20:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC776E418
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 20:22:37 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DAB45E17;
 Mon, 21 Jun 2021 22:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624306956;
 bh=hoHXJsDyx+SePE1e60iZdLBlPmyisyQHZh5+HZYcFKs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RYt8eilAJjEV5NT4WDTUTiDku3Tjw3JKHd8vp1u+5oJILI1/t4Dc59SUSA2OiAd8S
 saqyQ2IRmR06WFOV5GUSnD+nzs78xEDylAImJYdKaL5UTWcLGJX1IXIcB5iDb/BW3n
 5f9z7LN4Bdcc5xS4gPJJkI7whiny5c3wJct04nns=
Subject: Re: [PATCH 2/2] drm: rcar-du: Shutdown the display on remove
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20210323005616.20110-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210323005616.20110-2-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <2532ebed-040c-00be-cd5f-85cb775bc102@ideasonboard.com>
Date: Mon, 21 Jun 2021 21:22:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323005616.20110-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 23/03/2021 00:56, Laurent Pinchart wrote:
> When the device is unbound from the driver (the DU being a platform
> device, this occurs either when removing the DU module, or when
> unbinding the device manually through sysfs), the display may be active.
> Make sure it gets shut down.

I bet this may be particularly true if there's a console on it.


> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 2a06ec1cbefb..9f1a3aad4dd7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -553,6 +553,7 @@ static int rcar_du_remove(struct platform_device *pdev)
>  	struct drm_device *ddev = &rcdu->ddev;
>  
>  	drm_dev_unregister(ddev);
> +	drm_atomic_helper_shutdown(ddev);
>  
>  	drm_kms_helper_poll_fini(ddev);

There's a real mix of other drivers either calling
drm_kms_helper_poll_fini() before drm_atomic_helper_shutdown() or after,
so I'll assume that the sequencing here isn't terribly important (I hope).

So,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
