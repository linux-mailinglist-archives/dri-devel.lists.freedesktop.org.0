Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5B44DC282
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD7210E0FB;
	Thu, 17 Mar 2022 09:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 452 seconds by postgrey-1.36 at gabe;
 Thu, 17 Mar 2022 09:20:55 UTC
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAF110E0FB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:20:55 +0000 (UTC)
Received: from [192.168.1.100] (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AAA133F707;
 Thu, 17 Mar 2022 10:13:20 +0100 (CET)
Message-ID: <636d90ea-327f-f61f-8d88-074c351aea2e@somainline.org>
Date: Thu, 17 Mar 2022 10:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH,v2] drm/panel: Fix return value check in nt35950_probe()
Content-Language: en-US
To: Lu Wei <luwei32@huawei.com>, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, marijn.suijten@somainline.org,
 dri-devel@lists.freedesktop.org
References: <20220317083707.237039-1-luwei32@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
In-Reply-To: <20220317083707.237039-1-luwei32@huawei.com>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 17/03/22 09:37, Lu Wei ha scritto:
> In function nt35950_probe(), mipi_dsi_device_register_full() is called
> to create a MIPI DSI device. If it fails, a pointer encoded with an error
> will be returned, so use IS_ERR() to check the return value. Besides, use
> PTR_ERR to return the actual errno.
> 
> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> Signed-off-by: Lu Wei <luwei32@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Thanks!

> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35950.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> index 288c7fa83ecc..d252e5e56228 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> @@ -579,9 +579,9 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>   		}
>   
>   		nt->dsi[1] = mipi_dsi_device_register_full(dsi_r_host, info);
> -		if (!nt->dsi[1]) {
> +		if (IS_ERR(nt->dsi[1])) {
>   			dev_err(dev, "Cannot get secondary DSI node\n");
> -			return -ENODEV;
> +			return PTR_ERR(nt->dsi[1]);
>   		}
>   		num_dsis++;
>   	}

