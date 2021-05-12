Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C376237B665
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 08:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92D86EB52;
	Wed, 12 May 2021 06:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313F66EB52;
 Wed, 12 May 2021 06:57:33 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fg5BZ1t2Lz16Q7L;
 Wed, 12 May 2021 14:54:46 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Wed, 12 May 2021
 14:57:24 +0800
Subject: Re: [Nouveau] [PATCH v2 1/2] drm/nouveau: Fix ida leak
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
References: <20210511082841.4181-1-thunder.leizhen@huawei.com>
 <20210511082841.4181-2-thunder.leizhen@huawei.com>
 <20210512063952.5kwdrq2yzbmgmn4x@Normandy.localdomain>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <0800f5b6-ff18-94eb-a4a0-113800a9b14d@huawei.com>
Date: Wed, 12 May 2021 14:57:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210512063952.5kwdrq2yzbmgmn4x@Normandy.localdomain>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
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



On 2021/5/12 14:39, Pierre Moreau wrote:
> Why remove the const modifier on `nb`?

A non-pointer local variable, I don't think it's necessary to
add const modifier to make the syntax too complicated.

> 
> On 2021-05-11 — 16:28, Zhen Lei wrote:
>> When the 'nb' value allocated from 'bl_ida' is greater than or equal to
>> 100, it will not be released. In fact, we can simplify operations by
>> limiting the range of idas that can be applied for.
>>
>> By the way, delete the const modifier of the local variable 'nb'.
>>
>> Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> index 72f35a2babcb20e..d1c998e645fb4b6 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> @@ -51,8 +51,9 @@ static bool
>>  nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
>>  			   struct nouveau_backlight *bl)
>>  {
>> -	const int nb = ida_simple_get(&bl_ida, 0, 0, GFP_KERNEL);
>> -	if (nb < 0 || nb >= 100)
>> +	int nb = ida_simple_get(&bl_ida, 0, 100, GFP_KERNEL);
>> +
>> +	if (nb < 0)
>>  		return false;
>>  	if (nb > 0)
>>  		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
>> -- 
>> 2.26.0.106.g9fadedd
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> 
> .
> 

