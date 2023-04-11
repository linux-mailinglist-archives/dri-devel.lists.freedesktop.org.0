Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B376DE388
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 20:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1694B10E0F6;
	Tue, 11 Apr 2023 18:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr
 [80.12.242.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50B510E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 18:09:44 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id mIR2plxDOpFivmIR2p9idX; Tue, 11 Apr 2023 20:09:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
 s=t20230301; t=1681236582;
 bh=M7S+qYYKm3F1E+ZKhxHIt6xFK2OD6F3sGIISrUwFXqQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=bgdaZUdIDannUwcYDuOG2m7OtaTtOHCYjdl2FvDtWhXJRMo98O0OkPXgyoG5/7qru
 3m6wxBKJ7wcXA1vjNwb2HNODxD26r0gPI28DBUp7AqQsTQ7UsLsHN1eqEnOd1ZXVKM
 0oVcD7flwQ3loZ4xYsqejVTkA8p8mWXhAZCCh/WDEZVYhD8L2kytALajKGpjw+A4Hi
 RoR6IxsndRcpH3bmnQ/xMd/MgC95L5IUwg9VQoiFjF6Jfzsc1eezuRrskSEIhpfZli
 h/KCIZiB4FssH3Spz8mHvRAxH0IClcpCUqGxeWi0pJ37ZPTSwyqCIZwPXhnldTVDs6
 03mR4gH5lT6qg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 11 Apr 2023 20:09:42 +0200
X-ME-IP: 86.243.2.178
Message-ID: <b3c82938-7db0-2c0b-7784-c2096570c940@wanadoo.fr>
Date: Tue, 11 Apr 2023 20:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/armada: Fix a potential double free in an error
 handling path
Content-Language: fr, en-US
To: linux@armlinux.org.uk, daniel@ffwll.ch, David Airlie <airlied@gmail.com>
References: <c4f3c9207a9fce35cb6dd2cc60e755275961588a.1640536364.git.christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <c4f3c9207a9fce35cb6dd2cc60e755275961588a.1640536364.git.christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 26/12/2021 à 17:34, Christophe JAILLET a écrit :
> 'priv' is a managed resource, so there is no need to free it explicitly or
> there will be a double free().
> 
> Fixes: 90ad200b4cbc ("drm/armada: Use devm_drm_dev_alloc")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/armada/armada_drv.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 8e3e98f13db4..54168134d9b9 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -99,7 +99,6 @@ static int armada_drm_bind(struct device *dev)
>   	if (ret) {
>   		dev_err(dev, "[" DRM_NAME ":%s] can't kick out simple-fb: %d\n",
>   			__func__, ret);
> -		kfree(priv);
>   		return ret;
>   	}
>   

Hi,

polite reminder. (I've updated the mails according to the output of 
get_maintainer.pl)

The patch still LGTM and should apply cleanly.

CJ
