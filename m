Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D272E986E8B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3B310EAFE;
	Thu, 26 Sep 2024 08:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IH/OFrly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4542410EAFE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727338249;
 bh=lxbGnKzNxAlEHkVmGibriHagBg2+KYdrG5h4MLCOzUQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IH/OFrly7KyNJM3izl402DU+OkutbiZ9hhj4w0KGD8xoILvUAudbQLfzOi2mBbOkd
 DDEgeh5pybfqoUqOsP93zJL0mYtVAR/Hg8lE7q0ExuNaOTyu0AKxiKGeAQktFGAYp4
 AdHhpkd0SLG0EdK4FuLVAoMC0O4Sd79pBYqpxUjAEXi0Z6dLD45jVzjHpNMdy0JPxV
 R6/VZ23aa5e8CB8sSf2UZfTa2u9/KM61KWkW8+OgRVtv1UClCvEF+lA6Ow8UCZyuqD
 bi6cLf9+qk73KKYEhB/bj0hNVCdP00FJhR2kjvpbhg8OvSRRiBWuXjilOXp9Ubm5JG
 E79ZM+zSMHeGQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 51FE517E1091;
 Thu, 26 Sep 2024 10:10:49 +0200 (CEST)
Message-ID: <16833ec2-d6bf-4d7f-9385-1430277fc047@collabora.com>
Date: Thu, 26 Sep 2024 10:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] drm/bridge: it6505: fix aux operation for edid
 read
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
 <20240926074755.22176-3-Hermes.Wu@ite.com.tw>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240926074755.22176-3-Hermes.Wu@ite.com.tw>
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
> The EDID read operation can reach the maximum size of the AUX FIFO buffer.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 28a8043229d3..b451d3c2ac1d 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1078,8 +1078,11 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>   	int i, ret_size, ret = 0, request_size;

int fifo_max_sz = (cmd == CMD_AUX_I2C_EDID_READ) ?
		  AUX_FIFO_MAX_SIZE : 4;

which later becomes

int fifo_max_sz = (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) ?
		  AUX_FIFO_MAX_SIZE : 4;

otherwise you can do it "the long way"...

if (cmd == .....)
	fifo_max_sz = AUX_FIFO_MAX_SIZE;
else
	fifo_max_sz = 4;

The point is, cmd won't change during iterations, so it's useless to put that if
branch inside of that loop below.

>   
>   	mutex_lock(&it6505->aux_lock);
> -	for (i = 0; i < size; i += 4) {
> -		request_size = min((int)size - i, 4);

		request_size = min_t(int, (int)size - i, fifo_max_sz);

P.S.: Also, I'd consider changing this to a do-while instead...

Cheers,
Angelo

> +	for (i = 0; i < size; ) {
> +		if (cmd == CMD_AUX_I2C_EDID_READ)
> +			request_size = min_t(int, (int)size - i, AUX_FIFO_MAX_SIZE);
> +		else
> +			request_size = min_t(int, (int)size - i, 4);
>   		ret_size = it6505_aux_operation(it6505, cmd, address + i,
>   						buffer + i, request_size,
>   						reply);
> @@ -1088,6 +1091,7 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>   			goto aux_op_err;
>   		}
>   
> +		i += request_size;
>   		ret += ret_size;
>   	}
>   



