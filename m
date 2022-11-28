Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37C163A8F3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 14:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DB810E1C7;
	Mon, 28 Nov 2022 13:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B7310E1CA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 13:09:25 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E05356602ACE;
 Mon, 28 Nov 2022 13:09:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669640963;
 bh=FPyZV6RIJ+6XhwGHAlNI0+xn9UwsKBELcdRphFPnF0s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=krvXfWFIVV/qMkl1uJRhGRSj9gIziOsXwnVQIxomNj4b4hZRCw2/HtJ33e5tNTtid
 yS/MpBXJeF/b0BGFy7ZtBh+gFHTkpPzWO97Vy6MIugB/EI1aMQMSt9LZfsY64iSfe2
 IlLquBVaaTPaSjquRWMAPAexahUkZnCA38FlPjWQd421ib8UI3PXEWXJ4NCPOUa3LX
 sid92kofo4ymKMS5wJw+Kllh8EU5Gi6Ma9lvc5OlVpF2lybZIyIRL3ORXUUgvEO5z9
 qPxvJSE1bKXkVrjNeb5jsgUxkyqezAUyGUcTVVw1dfR5TKLdqNJWvn9Z6IIIzsaoUp
 7a5jCo6f4E7IQ==
Message-ID: <01315373-4c02-539b-9586-d764053bd8ba@collabora.com>
Date: Mon, 28 Nov 2022 14:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] drm/mediatek: Clean dangling pointer on bind error path
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20221122143949.3493104-1-nfraprado@collabora.com>
 <a67594cf-eb7f-873f-1c11-ccb4317b6bdf@collabora.com>
 <20221125163413.jwutjr5uxey6b32o@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221125163413.jwutjr5uxey6b32o@notapiano>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 25/11/22 17:34, Nícolas F. R. A. Prado ha scritto:
> On Wed, Nov 23, 2022 at 10:15:25AM +0100, AngeloGioacchino Del Regno wrote:
>> Il 22/11/22 15:39, Nícolas F. R. A. Prado ha scritto:
>>> mtk_drm_bind() can fail, in which case drm_dev_put() is called,
>>> destroying the drm_device object. However a pointer to it was still
>>> being held in the private object, and that pointer would be passed along
>>> to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
>>> point, resulting in a panic. Clean the pointer when destroying the
>>> object in the error path to prevent this from happening.
>>>
>>> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>
>>> ---
>>>
>>> Changes in v2:
>>> - Added Fixes tag
>>>
>>>    drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> index 39a42dc8fb85..a21ff1b3258c 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> @@ -514,6 +514,7 @@ static int mtk_drm_bind(struct device *dev)
>>>    err_deinit:
>>>    	mtk_drm_kms_deinit(drm);
>>>    err_free:
>>> +	private->drm = NULL;
>>
>> Sorry for not noticing that in v1, but I've rechecked this function and, while this
>> commit does indeed actually solve the described issue, I think it's incomplete.
>>
>> A few lines before, we have a loop that sets
>>
>> 		private->all_drm_private[i]->drm = drm;
> 
> Actually that line only exists with [1] applied, but that commit hasn't been
> merged as of yet. I debated whether it would be better to send this fix as is,
> or ask Nancy Lin to add the tweaked fix you mention below to that series, but
> sending this fix as is seemed better since it can be backported to older kernel
> versions.
> 
> So assuming this commit gets merged first, Nancy should make that tweak you
> mentioned below to ensure all the pointers are zeroed out, which is why I've
> added Nancy to CC. (As a side note, given that only the mmsys with drm_master =
> true would ever call the drm suspend helper, even this patch as is is enough to
> avoid the panic even with that series applied, still we should zero out all
> pointers for good measure)
> 
> [1] https://lore.kernel.org/linux-mediatek/20221107072413.16178-6-nancy.lin@mediatek.com/
> 

Sorry about that, you're right - the proposed fix is for the commit you
linked, I got confused somehow.

This means that you get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
