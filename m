Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F373AF6CB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 22:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEF26E417;
	Mon, 21 Jun 2021 20:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4E56E417
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 20:21:13 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAA585E67;
 Mon, 21 Jun 2021 22:14:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624306495;
 bh=YGMEO/GmrcMrPvuBt+ffHKvD8M5RzPW/WtZ6dLRN26s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=b7ztlEEk+WzsQhFZXoVf6emY9IR7Yojnm+LLy4ymk838eSD1+ATyHAIkOKT9umA48
 snn33cba1EIPQ3U3C4oWjuP0TaYHJ65jhsN0Ea38cyaJ0s0ya2tl5LKpB3xivElj8Y
 p+7sAehDux8Om1/9iuCoFtdovyuvaT5ds6yCQ18g=
Subject: Re: [PATCH 1/2] drm: rcar-du: Don't put reference to drm_device in
 rcar_du_remove()
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20210323005616.20110-1-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <674bd412-038f-010e-7177-16ba2de78896@ideasonboard.com>
Date: Mon, 21 Jun 2021 21:14:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323005616.20110-1-laurent.pinchart+renesas@ideasonboard.com>
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
> The reference to the drm_device that was acquired by
> devm_drm_dev_alloc() is released automatically by the devres
> infrastructure. It must not be released manually, as that causes a
> reference underflow..
> 

Ouch. We need some tests on module load and unload somewhere...

I'm getting closer with infrastructure ...


> Fixes: ea6aae151887 ("drm: rcar-du: Embed drm_device in rcar_du_device")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 43de3d8686e8..2a06ec1cbefb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -556,8 +556,6 @@ static int rcar_du_remove(struct platform_device *pdev)
>  
>  	drm_kms_helper_poll_fini(ddev);
>  
> -	drm_dev_put(ddev);
> -
>  	return 0;
>  }
>  
> 
