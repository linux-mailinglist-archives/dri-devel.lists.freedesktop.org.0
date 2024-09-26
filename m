Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F3986E86
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAC910EAF8;
	Thu, 26 Sep 2024 08:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LV89bLfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFED10EAF8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727338243;
 bh=mpknqu/aGncqnYkzTF0IhaQtCxsVeZdJz3an7zMjF3U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LV89bLfjwWA/vqb26BLMqbU8r1neW7dHo0j2RhNssvsPtYklWJAFsZ7kP9aOO5Tzh
 lcOVxQM8+s70FDF5o91f6OpACrxcMEOffdbJNQ9iwz5GSno+wPov884EQ3CFeDLssw
 nid3qZWp2QTd8gV23TLxKSMwPra8SSsW9ARnX5tOzzeqT3JV9RRJ2hK6FrJ76+VGBO
 dwUMlCm9RPfjwnTartynuheFkkUcWeKlX8yPhYf6gZhQbrouTKhFSfaCGGJGURPIQe
 o7iLhjoIMMXmTQG77GhDEQxGdQTTkMfwNkxXRAxWpMn9MrWO2kErd4dqAZakCYQ50f
 BWnoK0MJq9ZMw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6415717E1048;
 Thu, 26 Sep 2024 10:10:42 +0200 (CEST)
Message-ID: <5d3e7f6f-1980-4afb-9559-ad23d5779393@collabora.com>
Date: Thu, 26 Sep 2024 10:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] drm/bridge: it6505: fix HDCP KSV list did not
 read correctly.
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
References: <20240926075018.22328-1-Hermes.Wu@ite.com.tw>
 <20240926075018.22328-4-Hermes.Wu@ite.com.tw>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240926075018.22328-4-Hermes.Wu@ite.com.tw>
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

Il 26/09/24 09:50, Hermes Wu ha scritto:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When running the HDCP CTS test on UNIGRAF DPR-100.
> KSV list must be read from DPCD with 5 byte boundary.
> 
> The original aux operation using AUX_NATIVE_READ can not read back the
> KSV list correctly.
> Change to CMD_AUX_GET_KSV_LIST operaction.
> 
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 46 +++++++++++++++++++++--------
>   1 file changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 82986f28f653..143d58ed1b0e 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1188,6 +1188,35 @@ static int it6505_get_edid_block(void *data, u8 *buf, unsigned int block,
>   	return 0;
>   }
>   
> +static int it6505_get_ksvlist(struct it6505 *it6505, u8 *buf, size_t len)
> +{
> +	int i, request_size, ret;
> +	struct device *dev = it6505->dev;
> +	enum aux_cmd_reply reply;

struct device *dev = it6505->dev;
enum aux_cmd_reply reply;
int request_size, ret;
int i = 0;

> +
> +	for (i = 0; i < len; ) {

do {

> +		request_size = min_t(int, (int)len - i, 15);
> +
> +		ret = it6505_aux_do_transfer(it6505, CMD_AUX_GET_KSV_LIST,
> +					     DP_AUX_HDCP_KSV_FIFO,
> +					     buf + i, request_size, &reply);
> +
> +		DRM_DEV_DEBUG_DRIVER(dev, "request_size = %d, ret =%d", request_size, ret);
> +		if (ret < 0)
> +			return ret;
> +
> +		i += request_size;
> +	}

} while (i < len);

> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "ksv read cnt = %d down_stream_cnt=%d ", i, i / 5);
> +
> +	for (i = 0 ; i < len; i += 5)

Add braces to this loop, otherwise if DRM_DEV_DEBUG_DRIVER() suddenly becomes
empty (because of some configuration option in the future, etc) you'll get build
breakages.

> +		DRM_DEV_DEBUG_DRIVER(dev, "ksv[%d] = %02X%02X%02X%02X%02X",
> +				     i / 5, buf[i], buf[i + 1], buf[i + 2], buf[i + 3], buf[i + 4]);
> +
> +	return len;
> +}
> +
>   static void it6505_variable_config(struct it6505 *it6505)
>   {
>   	it6505->link_rate_bw_code = HBR;
> @@ -1969,7 +1998,7 @@ static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
>   {
>   	struct device *dev = it6505->dev;
>   	u8 binfo[2];
> -	int down_stream_count, i, err, msg_count = 0;
> +	int down_stream_count, err, msg_count = 0;
>   
>   	err = it6505_get_dpcd(it6505, DP_AUX_HDCP_BINFO, binfo,
>   			      ARRAY_SIZE(binfo));
> @@ -1994,18 +2023,11 @@ static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
>   			down_stream_count);
>   		return 0;
>   	}
> +	err =  it6505_get_ksvlist(it6505, sha1_input, down_stream_count * 5);
> +	if (err < 0)
> +		return err;
>   
> -	for (i = 0; i < down_stream_count; i++) {
> -		err = it6505_get_dpcd(it6505, DP_AUX_HDCP_KSV_FIFO +
> -				      (i % 3) * DRM_HDCP_KSV_LEN,
> -				      sha1_input + msg_count,
> -				      DRM_HDCP_KSV_LEN);
> -
> -		if (err < 0)
> -			return err;
> -
> -		msg_count += 5;
> -	}
> +	msg_count += down_stream_count * 5;
>   
>   	it6505->hdcp_down_stream_count = down_stream_count;
>   	sha1_input[msg_count++] = binfo[0];


