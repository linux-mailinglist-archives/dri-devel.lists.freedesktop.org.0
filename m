Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE314AD44C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 10:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E516D10E1AB;
	Tue,  8 Feb 2022 09:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208710E1AB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 09:04:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5ED6B1F4474E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644311042;
 bh=9sgJPXTqfK75Hu2kDZUDOsgZGJfuQ/MhsF+51PqY9d8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cxeCpY9JpTWim2lNGoN3hul0SMhHdA/NQydI8he7rdyfhWY7N9QUuad1cg8/AY4EW
 E55D03ZuSDgOfbQo4tRF+hDHOQ2ew1uqD3KM63YuMNQjiS/tdWjLKKh5/1VY6lipsm
 qEdIcTrFzLViuTltNWGVYE8IksuFoKoGdyXIw0n6DgNseDxH9jb+vFIbW3bvH6kAK4
 gWmHxHi/8YMCppgoaUyjEncsnx7jK9hhehV6oZp0HyEw37HccDD37SONlwwcufc+KW
 O4YMvTxxPVG/z2Sxymn98QaaU75LOL234XZt1qXP0oqe2GItnewSEEqfgAVwFpELgh
 lmXub2km4nYnQ==
Message-ID: <bf486a23-4322-328e-abdc-962a66792f23@collabora.com>
Date: Tue, 8 Feb 2022 10:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
Content-Language: en-US
To: CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org
References: <20220131085520.287105-1-angelogioacchino.delregno@collabora.com>
 <20755168cc2be0d1bb5e40907cfe27cea25a9363.camel@mediatek.com>
 <b886b9a8a3368127be7357e8921e18358987033d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b886b9a8a3368127be7357e8921e18358987033d.camel@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>, andrzej.hajda@intel.com,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 08/02/22 09:32, CK Hu ha scritto:
> Hi, Angelo:
> 
> On Tue, 2022-02-08 at 16:20 +0800, CK Hu wrote:
>> Hi, Angelo:
>>
>> On Mon, 2022-01-31 at 09:55 +0100, AngeloGioacchino Del Regno wrote:
>>> DRM bridge drivers are now attaching their DSI device at probe
>>> time,
>>> which requires us to register our DSI host in order to let the
>>> bridge
>>> to probe: this recently started producing an endless -EPROBE_DEFER
>>> loop on some machines that are using external bridges, like the
>>> parade-ps8640, found on the ACER Chromebook R13.
>>>
>>> Now that the DSI hosts/devices probe sequence is documented, we can
>>> do adjustments to the mtk_dsi driver as to both fix now and make
>>> sure
>>> to avoid this situation in the future: for this, following what is
>>> documented in drm_bridge.c, move the mtk_dsi component_add() to the
>>> mtk_dsi_ops.attach callback and delete it in the detach callback;
>>> keeping in mind that we are registering a drm_bridge for our DSI,
>>> which is only used/attached if the DSI Host is bound, it wouldn't
>>> make sense to keep adding our bridge at probe time (as it would
>>> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
>>> that one to the dsi host attach function (and remove it in detach).
>>>
>>> Cc: <stable@vger.kernel.org> # 5.15.x
>>> Signed-off-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
>>>
>>> ---
>>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++----------
>>> ----
>>>   1 file changed, 84 insertions(+), 83 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> index 5d90d2eb0019..bced4c7d668e 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> @@ -786,18 +786,101 @@ void mtk_dsi_ddp_stop(struct device *dev)
>>>   	mtk_dsi_poweroff(dsi);
>>>   }
>>>   
>>>
>>
>> [snip]
>>
>>> +
>>>   static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>>>   			       struct mipi_dsi_device *device)
>>>   {
>>>   	struct mtk_dsi *dsi = host_to_dsi(host);
>>> +	struct device *dev = host->dev;
>>> +	int ret;
>>>   
>>>   	dsi->lanes = device->lanes;
>>>   	dsi->format = device->format;
>>>   	dsi->mode_flags = device->mode_flags;
>>> +	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0,
>>> 0);
>>
>> The original would process panel. Why do you remove the panel part?
>> It's better that someone has a platform of DSI->Panel to test this
>> patch.
> 
> Sorry, devm_drm_of_get_bridge() has processed the panel part, so for
> this patch,
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

No worries! Thanks for the review/approval.

Regards,
Angelo

>>
>> Regards,
>> CK
>>
