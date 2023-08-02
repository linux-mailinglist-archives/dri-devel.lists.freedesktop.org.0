Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02F276CB1D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 12:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2249710E08D;
	Wed,  2 Aug 2023 10:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8EA10E08D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 10:41:05 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 76C7A66018CF;
 Wed,  2 Aug 2023 11:41:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690972863;
 bh=TrhwwG3QrrMmg/W1ATIbTGu9eOuiVphNZE4suN3mq0s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MI2ZWz0/dRBbh6O+gTO95tHTji6IthyxgaWUF03Cau2KNopLADiedZ+hedjPNu2p4
 l1ar6/CMwRdRrPr5cCrDmQZPfMP7j30poLK1RzLoW+QGBT9zCi0wCQx4seyXCaGB9h
 ifAV6es/KuEVQHTV9taxu0cSGfEvIoFQ+foDRYfdZXz8GX0foUAfqWgxUDlDyWI8pK
 mnVHXEk6L4mdD5GK9f7ZQ2Szuzax+cwNtOgrMqgUhEUrBS7f6vFnNmaF0L1PuJhER1
 oTApsY0tbDJADzDy35NQOzadUhOPUk32GwDB+1/28KuWIF3RRHBC/vOrvPmGX//AXt
 2tnvcFzzq0kFg==
Message-ID: <0acd286d-d4f4-97b2-c296-b2860a00def6@collabora.com>
Date: Wed, 2 Aug 2023 12:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] drm/mediatek: Dynamically allocate CMDQ and use
 helper functions
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
References: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
 <20230623094931.117918-2-angelogioacchino.delregno@collabora.com>
 <bd19faf644fa80f8fa77ed0841a724aa3ca871f5.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <bd19faf644fa80f8fa77ed0841a724aa3ca871f5.camel@mediatek.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 02/08/23 08:24, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Fri, 2023-06-23 at 11:49 +0200, AngeloGioacchino Del Regno wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   Instead of stack allocating the cmdq_client and cmdq_handle
>> structures
>> switch them to pointers, allowing us to migrate this driver to use
>> the
>> common functions provided by mtk-cmdq-helper.
>> In order to do this, it was also necessary to add a `priv` pointer to
>> struct cmdq_client, as that's used to pass (in this case) a mtk_crtc
>> handle to the ddp_cmdq_cb() mailbox RX callback function.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 107 +++++++---------------
>> --
>>   include/linux/soc/mediatek/mtk-cmdq.h   |   1 +
>>   2 files changed, 32 insertions(+), 76 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> index 0df62b076f49..b63289ab6787 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> @@ -50,8 +50,8 @@ struct mtk_drm_crtc {
>>   	bool				pending_async_planes;
>>   
>>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>> -	struct cmdq_client		cmdq_client;
>> -	struct cmdq_pkt			cmdq_handle;
>> +	struct cmdq_client		*cmdq_client;
>> +	struct cmdq_pkt			*cmdq_handle;
>>   	u32				cmdq_event;
>>   	u32				cmdq_vblank_cnt;
>>   	wait_queue_head_t		cb_blocking_queue;
>> @@ -108,47 +108,6 @@ static void mtk_drm_finish_page_flip(struct
>> mtk_drm_crtc *mtk_crtc)
>>   	}
>>   }
>>   
>> -#if IS_REACHABLE(CONFIG_MTK_CMDQ)
>> -static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client,
>> struct cmdq_pkt *pkt,
>> -				   size_t size)
>> -{
>> -	struct device *dev;
>> -	dma_addr_t dma_addr;
>> -
>> -	pkt->va_base = kzalloc(size, GFP_KERNEL);
>> -	if (!pkt->va_base) {
>> -		kfree(pkt);
>> -		return -ENOMEM;
>> -	}
>> -	pkt->buf_size = size;
>> -	pkt->cl = (void *)client;
> 
> I have a plan to remove cl in struct cmdq_pkt. But this modification
> would make this plan more difficult. So I would pending this patch
> until cl is removed from struct cmdq_pkt.
> 

I think that this ifdef cleanup is more urgent than the removal of `cl` from
struct cmdq_pkt, as those ifdefs shouldn't have reached upstream in the first
place, don't you agree?

Regards,
Angelo

