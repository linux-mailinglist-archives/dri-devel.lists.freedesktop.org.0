Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76B7395A28
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 14:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CF38945B;
	Mon, 31 May 2021 12:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3579F8945B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 12:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 7A7103F71A;
 Mon, 31 May 2021 14:10:01 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="M0KF649V";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9wo6bk9VmlS; Mon, 31 May 2021 14:10:00 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 316A93F6BE;
 Mon, 31 May 2021 14:09:59 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BC3F83600E5;
 Mon, 31 May 2021 14:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622462999; bh=Y5BqkkCrLzjckxB/iPLYEH1anqsml90Pb+tjhUY5K18=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=M0KF649VDfgiPSQrTvWZdZLONzcU4S3xZgdhMmrUejzlxL6ST1bYgdLp+Mn3d9k6/
 1HoBSO2YANuz5R1ra6Igsk6i//TurmwBBg/QQ9NrEPhbbLrJNLYUtRKZva/0H6+qZz
 BYonG82VhE+cXtE30RgGV5QZAs6RPAQ49Td1uprg=
Subject: Re: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Yu, Lang" <Lang.Yu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20210527013051.4302-1-Lang.Yu@amd.com>
 <DM6PR12MB4250B79297F587313D7645EBFB3F9@DM6PR12MB4250.namprd12.prod.outlook.com>
 <14d7f047-cf6d-c84a-14ff-3f1d833a770b@shipmail.org>
 <883bd629-e3ad-07a2-8952-994f42cb02be@gmail.com>
 <86054733-9b7d-de96-4ab2-21dca85f1e6e@shipmail.org>
 <888c52a5-ec10-0dee-c462-93cef8510e9f@amd.com>
 <6c4c8c57-7cc7-7e24-1d19-b91a312d44a0@shipmail.org>
 <cd081dda-7430-d891-6b02-8aedda7b67be@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <7d545d70-8212-3fbe-e803-5198af69f5c2@shipmail.org>
Date: Mon, 31 May 2021 14:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <cd081dda-7430-d891-6b02-8aedda7b67be@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 5/31/21 2:02 PM, Christian König wrote:
> Am 31.05.21 um 13:19 schrieb Thomas Hellström (Intel):
>>
>> On 5/31/21 12:56 PM, Christian König wrote:
>>> Am 31.05.21 um 12:46 schrieb Thomas Hellström (Intel):
>>>>
>>>> On 5/31/21 12:32 PM, Christian König wrote:
>>>>> Am 31.05.21 um 11:52 schrieb Thomas Hellström (Intel):
>>>>>> Hi, Lang,
>>>>>>
>>>>>> On 5/31/21 10:19 AM, Yu, Lang wrote:
>>>>>>> [Public]
>>>>>>>
>>>>>>>> Hi,
>>>>>>>> On 5/27/21 3:30 AM, Lang Yu wrote:
>>>>>>>>> Make TTM_PL_FLAG_* start from zero and add
>>>>>>>>> TTM_PL_FLAG_TEMPORARY flag for temporary
>>>>>>>>> GTT allocation use.
>>>>>>>> GTT is a driver private acronym, right? And it doesn't look like
>>>>>>>> TTM_PL_FLAG_TEMPORARY will be used in core TTM, so should we 
>>>>>>>> instead set
>>>>>>>> aside a mask in the PL flag for driver-private use?
>>>>>>> Hi Thomas,
>>>>>>>
>>>>>>> Thanks for your comments and advice, GTT means Graphics 
>>>>>>> Translation Table here, seems
>>>>>>> a general acronym. TTM_PL_FLAG_TEMPORARY may also be used by 
>>>>>>> other drives.
>>>>>>> I have made other patches for this. Please help review.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Lang
>>>>>>>
>>>>>> My point was really that the flag naming and documentation should 
>>>>>> reflect what core ttm is doing with that flag. If there is no 
>>>>>> specific core TTM usage, IMO we should move it to a driver 
>>>>>> specific flag to avoid future confusion. In particular a writer 
>>>>>> of a generic TTM resource manager should be able to know without 
>>>>>> looking at an old commit message what the placement flag is 
>>>>>> intended for.
>>>>>>
>>>>>> So here we add a flag where core TTM forces a bo move on validate 
>>>>>> and that's it. And that appears to be how it's used when an 
>>>>>> amdgpu bo is evicted to GTT, (btw should it be accounted in this 
>>>>>> situation?)
>>>>>>
>>>>>> The other use is to force the amdgpu driver to temporarily accept 
>>>>>> it into GTT when there is a lack of space, and IMHO that's a 
>>>>>> driver specific use and we should allocate a mask for driver 
>>>>>> specific flags for that.
>>>>>>
>>>>>> So shouldn't this be two flags, really?
>>>>>
>>>>> Well one flag makes sense for the use case at hand that drivers 
>>>>> want to signal to TTM that an allocation is only temporary and not 
>>>>> considered valid.
>>>>>
>>>>> That we then use this flag to implement temporary GTT allocations 
>>>>> to avoid problems during eviction is just extending that use case.
>>>>>
>>>> OK, but it looked like there were actually two use-cases. One for 
>>>> possibly long-term VRAM evictions to GTT, the other for the 
>>>> temporary use-case where the hop resource allocations sometimes 
>>>> failed. Or did I misunderstand the code?
>>>
>>> Ok sounds like we need more documentation here. That's really one 
>>> use case.
>>>
>>> Key point is we need temporary allocation during multihop which 
>>> should be handled differently to normal allocations.
>>
>> Yes, that part is clear from the patches. The part that I can't fit 
>> into that pattern is why the evict flags when evicting from visible 
>> VRAM to GTT or ordinary VRAM is marked with TTM_PL_FLAG_TEMPORARY. 
>> Wouldn't those remain evicted in that placement until re-validated to 
>> visible VRAM at an unknown future time?
>
> Not necessarily.
>
> The situation we ran into was the following:
> 1. OOM on VRAM, we try to evict.
>
> 2. GTT space is used up as well, ok evict directly to SYSTEM.
>
> 3. For VRAM->SYSTEM eviction we use a temporary bounce buffer.
>
> 4. Waiting for the bounce buffer to become idle is interrupted by a 
> signal so BO is still backed by bounce buffer.
>
> 5. Next CS, BO is validated with VRAM|GTT. TTM sees that it is in GTT 
> and doesn't move the buffer.
>
> 6. CS goes into nirvana because bounce buffers are not meant to be 
> used for CS (we can ignore alignment and accounting for them).
>
Yes, makes sense to me.

/Thomas


