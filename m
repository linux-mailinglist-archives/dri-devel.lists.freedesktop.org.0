Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B292986E88
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B03610EAFB;
	Thu, 26 Sep 2024 08:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="L4Lq3nNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E2E10EAFA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727338246;
 bh=Kzp7dM5sOI8NYDnR9ubmHtN9lHmysL8hlTCzyQ8KLqA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L4Lq3nNiKfkxCKd8YGEqHiePZj45IwWTdMO9EoWtdNgqaxP7IInZBisXahsDFa+Fh
 tfbaznrbTGB0mq0o/qNZAh48/lzUiId/6vrLh8JQZKJTlKkjkH+M5S+JniRwut1WeE
 3rH3tC+7pL4eZyA6sM5Apuo8zSSvWRsAx8T46mK7BFA+fz+2+i92XXZsXLr8tJ3iEk
 Y1LcVMBrsGVSuZfk93srtCsBRT7AM94Z82p7VJwFvsIQzi2eoY/Q7hKQKiJ97Aa46x
 ccxGKRo4pDW03iuU/dYFzV4sl24VK7Bhedpc3Hl9VRjhdqnDisXwJsr6go1mxCcbkT
 U7ObodagCmWSQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E8AA317E107A;
 Thu, 26 Sep 2024 10:10:45 +0200 (CEST)
Message-ID: <daa103bd-d70f-460f-8ecd-88da9da0eb03@collabora.com>
Date: Thu, 26 Sep 2024 10:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] drm/bridge: it6505: fix aux command write to aux
 operaction register
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Kenneth Hung <Kenneth.hung@ite.com.tw>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Allen Chen <allen.chen@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
 <20240926074755.22176-5-Hermes.Wu@ite.com.tw>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240926074755.22176-5-Hermes.Wu@ite.com.tw>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/09/24 09:47, Hermes Wu ha scritto:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The aux control register command is 4 bits LSB only, adding a MACRO to get
> correct operaction command.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 0583abdca75f..d1f5220e04a6 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -329,6 +329,8 @@ enum aux_cmd_type {
>   	CMD_AUX_GET_KSV_LIST = 0x10,
>   };
>   
> +#define GET_AUX_CONTROL_CODE(cmd) ((cmd) & 0x0F)

Just (cmd & 0xf) as the leading zero is meaningless.

As a out-of-scope consideration, though, this driver would really benefit from
a conversion to use bitfield macros... would be a nice cleanup.

Cheers,
Angelo

> +
>   enum aux_cmd_reply {
>   	REPLY_ACK,
>   	REPLY_NACK,
> @@ -1000,7 +1002,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>   				  size);
>   
>   	/* Aux Fire */
> -	it6505_write(it6505, REG_AUX_CMD_REQ, cmd);
> +	it6505_write(it6505, REG_AUX_CMD_REQ, GET_AUX_CONTROL_CODE(cmd));
>   
>   	ret = it6505_aux_wait(it6505);
>   	if (ret < 0)


