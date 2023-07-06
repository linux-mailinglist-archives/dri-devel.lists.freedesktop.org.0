Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C4749E12
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 15:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0948310E3FF;
	Thu,  6 Jul 2023 13:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 127DC10E05A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 13:43:44 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx7+sPxaZkRvgAAA--.2849S3;
 Thu, 06 Jul 2023 21:43:43 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax3c4OxaZkq_ceAA--.27112S3; 
 Thu, 06 Jul 2023 21:43:42 +0800 (CST)
Message-ID: <7869d9d7-1763-58d8-119f-08befff9615e@loongson.cn>
Date: Thu, 6 Jul 2023 21:43:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/mediatek: Fix potential memory leak if vmap() fail
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230626185801.684451-1-suijingfeng@loongson.cn>
 <be63fd1b-7659-75b8-e037-38528e8a8276@collabora.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <be63fd1b-7659-75b8-e037-38528e8a8276@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax3c4OxaZkq_ceAA--.27112S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww1rCFWxZF1kWrykWFWDWrX_yoW8Xr4fpF
 4ktay5ArWjkr4FqF1Iy3WqvFy5A3WFga1DGr1Iqa1qvr1DAF10qFyUZ34jgrW2vr4Ikw47
 tw1DXr9xur1qyFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4AhLUUUUU
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
Cc: linux-arm-kernel@lists.infradead.org, loongson-kernel@lists.loongnix.cn,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/6 20:47, AngeloGioacchino Del Regno wrote:
> Il 26/06/23 20:58, Sui Jingfeng ha scritto:
>> Also return -ENOMEM if such a failure happens, the implement should take
>> responsibility for the error handling.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>
> This commit needs a Fixes tag. Please add the relevant one and resend.
>
Done at [1],


Thanks for point this out, I got it.

[1] https://patchwork.freedesktop.org/patch/545843/?series=119885&rev=2


> Thanks,
> Angelo
>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c 
>> b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> index a25b28d3ee90..9f364df52478 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> @@ -247,7 +247,11 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object 
>> *obj, struct iosys_map *map)
>>         mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
>>                      pgprot_writecombine(PAGE_KERNEL));
>> -
>> +    if (!mtk_gem->kvaddr) {
>> +        kfree(sgt);
>> +        kfree(mtk_gem->pages);
>> +        return -ENOMEM;
>> +    }
>>   out:
>>       kfree(sgt);
>>       iosys_map_set_vaddr(map, mtk_gem->kvaddr);
>
>

