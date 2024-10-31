Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197119B725C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 03:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0915510E824;
	Thu, 31 Oct 2024 02:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1976910E824;
 Thu, 31 Oct 2024 02:04:10 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Xf6gS4DJpz1T9Qn;
 Thu, 31 Oct 2024 10:01:56 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
 by mail.maildlp.com (Postfix) with ESMTPS id 3D7CE1402E1;
 Thu, 31 Oct 2024 10:04:08 +0800 (CST)
Received: from [10.67.110.237] (10.67.110.237) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 31 Oct 2024 10:04:07 +0800
Subject: Re: [PATCH] drm/nouveau/gr/gf100: Fix missing unlock in
 gf100_gr_chan_new()
To: Lyude Paul <lyude@redhat.com>, <kherbst@redhat.com>
CC: <dakr@redhat.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <colin.i.king@gmail.com>, <rdunlap@infradead.org>, <bskeggs@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241026173844.2392679-1-lihuafei1@huawei.com>
 <10f8d1c07a3bf49d643a06ae0b6c11bd4c9dd880.camel@redhat.com>
From: Li Huafei <lihuafei1@huawei.com>
Message-ID: <67c66881-231f-1a35-caab-0a6327365e58@huawei.com>
Date: Thu, 31 Oct 2024 10:04:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <10f8d1c07a3bf49d643a06ae0b6c11bd4c9dd880.camel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.237]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500004.china.huawei.com (7.202.181.242)
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



On 2024/10/30 2:42, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Will push upstream in a moment
>
Thank you for reviewing.

Thanks,
Huafei
> On Sun, 2024-10-27 at 01:38 +0800, Li Huafei wrote:
>> When the call to gf100_grctx_generate() fails, unlock gr->fecs.mutex
>> before returning the error.
>>
>> Fixes smatch warning:
>>
>> drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:480 gf100_gr_chan_new() warn: inconsistent returns '&gr->fecs.mutex'.
>>
>> Fixes: ca081fff6ecc ("drm/nouveau/gr/gf100-: generate golden context during first object alloc")
>> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
>> ---
>>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
>> index 060c74a80eb1..3ea447f6a45b 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
>> @@ -443,6 +443,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>>  		ret = gf100_grctx_generate(gr, chan, fifoch->inst);
>>  		if (ret) {
>>  			nvkm_error(&base->engine.subdev, "failed to construct context\n");
>> +			mutex_unlock(&gr->fecs.mutex);
>>  			return ret;
>>  		}
>>  	}
> 
