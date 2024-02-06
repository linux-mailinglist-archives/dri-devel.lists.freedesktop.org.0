Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AFF84BA28
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7859310EF39;
	Tue,  6 Feb 2024 15:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V7K5QaTF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8D510F273
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707234837;
 bh=ocHaZpvDjxc0rwWNi54f+f6bams80D+RxoX1ovTeVl4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V7K5QaTFmBBj0jF9OBR5noaRpQTZDw9Xl5i1A050PYI1Pv9NppAiV7yHeTBDp5nEN
 7LckCp+WWAF8/QJQrikGSGvJydLGMjuSlmFWBQa804UzNxojOI2zARlmeMuiejyzcf
 Gt8wNMvbT7i5xT5flazIdXjg50s6SaJe6ngZnwVVyF9vZyZ76G+lYlbBHypn5L2f3b
 E+jvFsHCXt/eiaKk8Dt+Ey6G/tsgL0FR58ISC5cJO9vie0l5n9oGkt0XMDUnBqNuS3
 gc4WgpIO2qQxYRqTR0yVI2BtKWCjnQnbgqwGiqxAMdTot8z9h/xbKNxZTN9lt+0g1d
 QsBZ3YcbvWHqQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D92CF37803EE;
 Tue,  6 Feb 2024 15:53:56 +0000 (UTC)
Message-ID: <c1e2c380-21b5-47c1-b83b-f7f2b481df21@collabora.com>
Date: Tue, 6 Feb 2024 16:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-2-angelogioacchino.delregno@collabora.com>
 <f91db779-ad94-4c18-9a06-1029da4edaab@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <f91db779-ad94-4c18-9a06-1029da4edaab@baylibre.com>
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

Il 06/02/24 15:47, Alexandre Mergnat ha scritto:
> 
> 
> On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
>> Change magic numerical masks with usage of the GENMASK() macro
>> to improve readability.
>>
>> While at it, also fix the DSI_PS_SEL mask to include all bits instead
>> of just a subset of them.
>>
>> This commit brings no functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 45 +++++++++++++++---------------
>>   1 file changed, 23 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index a2fdfc8ddb15..3b7392c03b4d 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -58,18 +58,18 @@
> 
> ...snip...
> 
>>   #define DSI_PSCTRL        0x1c
>> -#define DSI_PS_WC            0x3fff
>> -#define DSI_PS_SEL            (3 << 16)
>> +#define DSI_PS_WC            GENMASK(14, 0)
>> +#define DSI_PS_SEL            GENMASK(19, 16)
> 
> 0011 0000 0000 0000 0000 => GENMASK(17, 16)

Alexandre, the reason for that is in the commit description :-P

"While at it, also fix the DSI_PS_SEL mask to include all bits instead
of just a subset of them."

Thanks for the reviews, btw!

Cheers!
Angelo

> 
>>   #define PACKED_PS_16BIT_RGB565        (0 << 16)
>>   #define LOOSELY_PS_18BIT_RGB666        (1 << 16)
>>   #define PACKED_PS_18BIT_RGB666        (2 << 16)
>> @@ -109,26 +109,26 @@
>>   #define LD0_WAKEUP_EN            BIT(2)
> 

