Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC5B3770D6
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 11:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A906E86F;
	Sat,  8 May 2021 09:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983FB6E86F;
 Sat,  8 May 2021 09:18:24 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FchVB5wbPzQkJl;
 Sat,  8 May 2021 17:14:58 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Sat, 8 May 2021
 17:18:14 +0800
Subject: Re: [PATCH 1/1] drm/nouveau: fix error return code in
 nouveau_backlight_init()
To: Dan Carpenter <dan.carpenter@oracle.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210508034810.2374-1-thunder.leizhen@huawei.com>
 <20210508073400.nnmwwyoxqqiwv36w@pmoreau.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <0b94bd89-c8a0-f1e8-057f-2f639464fadd@huawei.com>
Date: Sat, 8 May 2021 17:18:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210508073400.nnmwwyoxqqiwv36w@pmoreau.org>
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



On 2021/5/8 15:34, Pierre Moreau wrote:
> Hello Zhen,
> 
> There was a similar patch sent in last month, though which does not seem to
> have been merged yet; see
> https://lists.freedesktop.org/archives/nouveau/2021-April/038451.html.
> 
> Whether `ret` should be `-ENOSPC` or `-ENOMEM` is hard to say as
> `nouveau_get_backlight_name()` could fail due to either.
> 
> I will propose an alternative fix which modifies `nouveau_get_backlight_name()`
> to return an int so the actual error code can be propagated back instead of
> guessed, as well as fix an ida ID leak which I just spotted.

It's a good idea.

> 
> Best,
> Pierre
> 
> On 2021-05-08 — 11:48, Zhen Lei wrote:
>> Fix to return a negative error code from the error handling case instead
>> of 0, as done elsewhere in this function.
>>
>> Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> index 72f35a2babcb..097ca344a086 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> @@ -273,6 +273,7 @@ nouveau_backlight_init(struct drm_connector *connector)
>>  		return -ENOMEM;
>>  
>>  	if (!nouveau_get_backlight_name(backlight_name, bl)) {
>> +		ret = -ENOSPC;
>>  		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
>>  		goto fail_alloc;
>>  	}
>> -- 
>> 2.25.1
>>
>>
> 
> .
> 

