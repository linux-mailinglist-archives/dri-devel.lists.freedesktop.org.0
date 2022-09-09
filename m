Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CE75B385D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 14:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353A610E051;
	Fri,  9 Sep 2022 12:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8274710E051
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 12:58:13 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EA0EDD;
 Fri,  9 Sep 2022 14:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662728291;
 bh=xZE/ULnaE8gHZyDMtXBvtajaMHf/HkDKqUGVh12Fz+w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wJ/oohFEKz/CiEZ/GmeHmIwxb2UYdipO8+tblKR+blponZwZfDP2XbXwQyRz8YZ2B
 s4ETAnxEnNokPoS/vHdfPGnajIThS/FkKQlly55joPfaM9XoqBYx1Ngq5oXqYENs5+
 7Rruq4W5SubQmC8JXk2S5ucp0fg6F0rvXvYrXK/Y=
Message-ID: <6c073c53-a8ed-7654-4fdc-460015a60537@ideasonboard.com>
Date: Fri, 9 Sep 2022 15:58:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: omapdrm: dss: replace ternary operator with max()
Content-Language: en-US
To: Guo Zhengkui <guozhengkui@vivo.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Benoit Parrot <bparrot@ti.com>, Cai Huoqing <cai.huoqing@linux.dev>,
 Arnd Bergmann <arnd@arndb.de>,
 "open list:DRM DRIVERS FOR TI OMAP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20220517050208.121488-1-guozhengkui@vivo.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220517050208.121488-1-guozhengkui@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: zhengkui_guo@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2022 08:02, Guo Zhengkui wrote:
> Fix the following coccicheck warning:
> 
> drivers/gpu/drm/omapdrm/dss/dispc.c:2454:21-22: WARNING opportunity for max()
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dispc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index c4de142cc85b..0ee344ebcd1c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -2451,7 +2451,7 @@ static int dispc_ovl_calc_scaling_44xx(struct dispc_device *dispc,
>   
>   	*decim_x = DIV_ROUND_UP(width, in_width_max);
>   
> -	*decim_x = *decim_x > decim_x_min ? *decim_x : decim_x_min;
> +	*decim_x = max(*decim_x, decim_x_min);
>   	if (*decim_x > *x_predecim)
>   		return -EINVAL;
>   

Thanks, applying to drm-misc.

  Tomi
