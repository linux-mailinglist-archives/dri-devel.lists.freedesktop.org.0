Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2691910E67
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 19:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83CC10EB80;
	Thu, 20 Jun 2024 17:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LCHf4C89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-75.smtpout.orange.fr [80.12.242.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A1610EB82
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 17:25:08 +0000 (UTC)
Received: from [192.168.1.37] ([86.243.222.230]) by smtp.orange.fr with ESMTPA
 id KLWwsKMFAqHypKLWwsGfEA; Thu, 20 Jun 2024 19:25:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1718904306;
 bh=pGtxUi0q5KWmIR/HywCcJYufwKCE48nhOS8YwL6MY4I=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=LCHf4C89oYikuXb2G6s7kd2wUa1Ma61h/Ihh5IqXeuDm50Su7uf1qYCwPAxV2z/Y7
 i51fac2YWe/dxNdwxuAedRCfan7Tr+ISOr4NzNxH0TbjKuw6hE7jQbNKhyQZZzygoR
 IRc+gw3wQAhW6Z3ecfFZyDthu/JIqh4ptrEDwzHXnBmQYUar8fzz49MDpu4I/hzyki
 CoPnP2NjaiPNYyuC+cT0/alwen8jcP8RxwWFkXtgKiGzJY5qtrc0j1QyfxSv5TEk/W
 WdWqsygVNmD6hiF04ht5/N/syBu77fQPtiynsbKLWmq64ouXGvYebcTgxEig9wbSnZ
 TnQfZMfliFJEQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 20 Jun 2024 19:25:06 +0200
X-ME-IP: 86.243.222.230
Message-ID: <50ae9a6f-309b-45ee-adf3-ced54e2cfe57@wanadoo.fr>
Date: Thu, 20 Jun 2024 19:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel-xinpeng-xpp055c272: add check for
 mipi_dsi_dcs_enter_sleep_mode
To: Chen Ni <nichen@iscas.ac.cn>, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240620074802.852544-1-nichen@iscas.ac.cn>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240620074802.852544-1-nichen@iscas.ac.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 20/06/2024 à 09:48, Chen Ni a écrit :
> Add check for the return value of mipi_dsi_dcs_enter_sleep_mode() and
> return the error if it fails in order to catch the error.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> index 22a14006765e..d7c9df673f35 100644
> --- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> +++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> @@ -139,7 +139,7 @@ static int xpp055c272_unprepare(struct drm_panel *panel)
>   	if (ret < 0)
>   		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
>   
> -	mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>   	if (ret < 0) {
>   		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
>   		return ret;

Reviewed-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

See: 
https://lore.kernel.org/all/6e3a8cb3956fe94f1259c13053fddb378e7d0d82.1619878508.git.christophe.jaillet@wanadoo.fr/

which never got any feedback.

CJ
