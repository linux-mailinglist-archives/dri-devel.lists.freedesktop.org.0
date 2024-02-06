Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8675E84B676
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 14:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97AE112BE0;
	Tue,  6 Feb 2024 13:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="uTLTAeHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA2D112BE0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707226391;
 bh=asAnDTiyM1UKV/D+XtNg7Nhipxdgbn3XGtYPO+ktEXI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uTLTAeHtl3d9sbWZdziFbMQI4TMPPaLAqduivgce2jor2JK9pYMUvq4RIA1d7dvhk
 7QHfCzBhxix3WVY2AyJRdQXNNKYWB9P/UEjWu97Rw1ghtSSSfxq6NVt1RhtDEAPc8i
 F+vJVScyM57NQlfp6SRN+p/h/InqidrUigBc35bnTgzqjnt2Y0k7RLJBW5YrqWug9r
 4ZFih9HoJu2MabP/exTV3pVhqg5ApjD+jesYqlflKC0uZp/7uZqTXgmAwbxwpYRmhK
 IXgOsVYXovG/YwEaSAfHZEuccNgvDyOLaGE95svEzhQwm5/bJsTSYq3njqcOt+TBub
 LCaFr2L01uO1Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C4CFB3782072;
 Tue,  6 Feb 2024 13:33:10 +0000 (UTC)
Message-ID: <072f049a-021f-4f39-81ff-d3cba1e6c47c@collabora.com>
Date: Tue, 6 Feb 2024 14:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/mediatek: Dynamically allocate CMDQ and use
 helper functions
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
 <20230623094931.117918-2-angelogioacchino.delregno@collabora.com>
 <bd19faf644fa80f8fa77ed0841a724aa3ca871f5.camel@mediatek.com>
 <0acd286d-d4f4-97b2-c296-b2860a00def6@collabora.com>
 <e8e60556e53ccf319358cbef203bc84c418a352b.camel@mediatek.com>
 <d29d342b-37f4-8d7b-ed7d-c441cc928393@collabora.com>
 <7175ec117988657c2fb7bf6d50b67d60038e3a54.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <7175ec117988657c2fb7bf6d50b67d60038e3a54.camel@mediatek.com>
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

Il 03/08/23 10:37, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2023-08-03 at 10:25 +0200, AngeloGioacchino Del Regno wrote:
>> Il 03/08/23 08:28, CK Hu (胡俊光) ha scritto:
>>> Hi, Angelo:
>>>
>>> On Wed, 2023-08-02 at 12:41 +0200, AngeloGioacchino Del Regno
>>> wrote:
>>>> Il 02/08/23 08:24, CK Hu (胡俊光) ha scritto:
>>>>> Hi, Angelo:
>>>>>
>>>>> On Fri, 2023-06-23 at 11:49 +0200, AngeloGioacchino Del Regno
>>>>> wrote:
>>>>>>     	
>>>>>> External email : Please do not click links or open
>>>>>> attachments
>>>>>> until
>>>>>> you have verified the sender or the content.
>>>>>>     Instead of stack allocating the cmdq_client and
>>>>>> cmdq_handle
>>>>>> structures
>>>>>> switch them to pointers, allowing us to migrate this driver
>>>>>> to
>>>>>> use
>>>>>> the
>>>>>> common functions provided by mtk-cmdq-helper.
>>>>>> In order to do this, it was also necessary to add a `priv`
>>>>>> pointer to
>>>>>> struct cmdq_client, as that's used to pass (in this case) a
>>>>>> mtk_crtc
>>>>>> handle to the ddp_cmdq_cb() mailbox RX callback function.
>>>>>>
>>>>>> Signed-off-by: AngeloGioacchino Del Regno <
>>>>>> angelogioacchino.delregno@collabora.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 107 +++++++-----
>>>>>> ---
>>>>>> -------
>>>>>> --
>>>>>>     include/linux/soc/mediatek/mtk-cmdq.h   |   1 +
>>>>>>     2 files changed, 32 insertions(+), 76 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>>>>> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>>>>> index 0df62b076f49..b63289ab6787 100644
>>>>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>>>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>>>>> @@ -50,8 +50,8 @@ struct mtk_drm_crtc {
>>>>>>     	bool				pending_async_planes;
>>>>>>     
>>>>>>     #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>>>>>> -	struct cmdq_client		cmdq_client;
>>>>>> -	struct cmdq_pkt			cmdq_handle;
>>>>>> +	struct cmdq_client		*cmdq_client;
>>>>>> +	struct cmdq_pkt			*cmdq_handle;
>>>>>>     	u32				cmdq_event;
>>>>>>     	u32				cmdq_vblank_cnt;
>>>>>>     	wait_queue_head_t		cb_blocking_queue;
>>>>>> @@ -108,47 +108,6 @@ static void
>>>>>> mtk_drm_finish_page_flip(struct
>>>>>> mtk_drm_crtc *mtk_crtc)
>>>>>>     	}
>>>>>>     }
>>>>>>     
>>>>>> -#if IS_REACHABLE(CONFIG_MTK_CMDQ)
>>>>>> -static int mtk_drm_cmdq_pkt_create(struct cmdq_client
>>>>>> *client,
>>>>>> struct cmdq_pkt *pkt,
>>>>>> -				   size_t size)
>>>>>> -{
>>>>>> -	struct device *dev;
>>>>>> -	dma_addr_t dma_addr;
>>>>>> -
>>>>>> -	pkt->va_base = kzalloc(size, GFP_KERNEL);
>>>>>> -	if (!pkt->va_base) {
>>>>>> -		kfree(pkt);
>>>>>> -		return -ENOMEM;
>>>>>> -	}
>>>>>> -	pkt->buf_size = size;
>>>>>> -	pkt->cl = (void *)client;
>>>>>
>>>>> I have a plan to remove cl in struct cmdq_pkt. But this
>>>>> modification
>>>>> would make this plan more difficult. So I would pending this
>>>>> patch
>>>>> until cl is removed from struct cmdq_pkt.
>>>>>
>>>>
>>>> I think that this ifdef cleanup is more urgent than the removal
>>>> of
>>>> `cl` from
>>>> struct cmdq_pkt, as those ifdefs shouldn't have reached upstream
>>>> in
>>>> the first
>>>> place, don't you agree?
>>>
>>> I think removing ifdefs and using helper function are different
>>> things.
>>> You could remove ifdefs and keep mtk_drm_cmdq_pkt_create().
>>>
>>
>> I chose to do it like that because this function would otherwise be a
>> 100% duplicate of the related cmdq helper :-)
> 
> Removing cl would change the interface of cmdq_pkt_create(). And this
> is related to different maintainer's tree. So it would be a long time
> to process. For you, only removing ifdes is urgent, so use
> cmdq_pkt_create() is not urgent. So let's keep
> mtk_drm_cmdq_pkt_create() and you could remove ifdefs.
> 

Hello CK,

my CMDQ cleanup has been stuck on your intention to remove `cl` from the CMDQ
helpers for ** six months ** now.

Are you performing that removal, or can we just get this cleanup finally done?

Regards,
Angelo


