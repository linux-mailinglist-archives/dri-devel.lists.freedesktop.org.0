Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFBD7A75CD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9671210E168;
	Wed, 20 Sep 2023 08:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792E110E168
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 08:24:44 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 447F566003AF;
 Wed, 20 Sep 2023 09:24:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695198283;
 bh=A5e7XZz1Vz5cGVbLdkx/jRxgzoIVS2ZgkuULWqKvE0Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FsZTDG4RTKeQAaMJvZSgnuAAHZHNvMI0PvMF3quOB72278UF5mqcvnTLhBRw0fDN/
 OpDihFI2OsXEwyql6hveCMhCqqyzEyGyjl1OKbMAGbQ4zpTcfPz2xXV9LzESsQMW/7
 Qw7Fkepm4uuTA/YmzQYVJn0uX5xAeAEdas5hcHipKH6eLRiUNSBMUDaPzRT3eqMhD5
 WAiJcwytHOg93mEhZbvCLMnQp/nb1BdhC6HOaF9jnH5ErC4q/7QT6pG3UAV8D0SvRF
 Ea16ix2fzDBs1m+m/5VwS6jA/eCiQPUrYKQLbbCdnLdGwJvz+v9fZESf/yzaDg3cXK
 oZNztHAHPPiwA==
Message-ID: <6cde344a-9e93-07b0-862b-aa401e6c64fb@collabora.com>
Date: Wed, 20 Sep 2023 10:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/bridge: panel: Fix device link for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Content-Language: en-US
To: Ying Liu <victor.liu@nxp.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>
References: <20230918150043.403250-1-angelogioacchino.delregno@collabora.com>
 <AM7PR04MB70466D88048831E48EBBBD0898FAA@AM7PR04MB7046.eurprd04.prod.outlook.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <AM7PR04MB70466D88048831E48EBBBD0898FAA@AM7PR04MB7046.eurprd04.prod.outlook.com>
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/09/23 03:45, Ying Liu ha scritto:
> Hi Angelo,
> 
> Thank you for the patch.
> 
> On Monday, September 18, 2023 11:01 PM, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
>> When external bridges are attached with
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR,
>> the panel bridge may also get the same flag, but in the .attach()
>> callback for the panel bridge a device link is added only when this
>> flag is not present; To make things worse, the .detach() callback
>> tries to delete the device link unconditionally and without checking
>> if it was created in the first place, crashing the kernel with a NULL
>> pointer kernel panic upon calling panel_bridge_detach().
>>
>> Fix that by moving the device_link_add() call before checking if the
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is present.
>>
>> Fixes: 199cf07ebd2b ("drm/bridge: panel: Add a device link between drm
>> device and panel device")
>> Signed-off-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/bridge/panel.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/panel.c
>> b/drivers/gpu/drm/bridge/panel.c
>> index e00d2e94c751..8c507dfd589e 100644
>> --- a/drivers/gpu/drm/bridge/panel.c
>> +++ b/drivers/gpu/drm/bridge/panel.c
>> @@ -67,14 +67,6 @@ static int panel_bridge_attach(struct drm_bridge
>> *bridge,
>>   	struct drm_device *drm_dev = bridge->dev;
>>   	int ret;
>>
>> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>> -		return 0;
>> -
>> -	if (!bridge->encoder) {
>> -		DRM_ERROR("Missing encoder\n");
>> -		return -ENODEV;
>> -	}
>> -
>>   	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
>>   					     DL_FLAG_STATELESS);
>>   	if (!panel_bridge->link) {
>> @@ -83,6 +75,14 @@ static int panel_bridge_attach(struct drm_bridge
>> *bridge,
>>   		return -EINVAL;
>>   	}
>>
>> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>> +		return 0;
>> +
>> +	if (!bridge->encoder) {
>> +		DRM_ERROR("Missing encoder\n");
> 
> Shouldn't the device link be deleted in case of error?
> 

Whoops! Yes, that's right. I'm sending a v2 right now.

Thanks!
Angelo

> Regards,
> Liu Ying
> 
>> +		return -ENODEV;
>> +	}
>> +
>>   	drm_connector_helper_add(connector,
>>   				 &panel_bridge_connector_helper_funcs);
>>
>> --
>> 2.42.0
> 


