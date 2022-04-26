Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17788510768
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0CA10E33D;
	Tue, 26 Apr 2022 18:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
 [80.12.242.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195FC10E3DB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 18:47:24 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.180.246]) by smtp.orange.fr with ESMTPA
 id jQDZnijInrYGrjQDZnIczV; Tue, 26 Apr 2022 20:47:22 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 26 Apr 2022 20:47:22 +0200
X-ME-IP: 86.243.180.246
Message-ID: <80a426b3-ece2-129c-edca-03556e1ecbb6@wanadoo.fr>
Date: Tue, 26 Apr 2022 20:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/amdkfd: Use bitmap_zalloc() when applicable
Content-Language: fr
To: Felix Kuehling <felix.kuehling@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Newsgroups: gmane.linux.kernel.janitors, gmane.comp.freedesktop.amd-gfx,
 gmane.comp.video.dri.devel, gmane.linux.kernel
References: <f12820f6c5fca9b10ac8f82b3689c50ccb6966aa.1638117878.git.christophe.jaillet@wanadoo.fr>
 <14268d5a-9a4a-2921-9961-d5d36fad47b2@amd.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <14268d5a-9a4a-2921-9961-d5d36fad47b2@amd.com>
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 26/04/2022 à 20:01, Felix Kuehling a écrit :
> Hi Christophe,
> 
> I just stumbled over this patch series while cleaning up my inbox. Sorry 
> for dropping it back in November. I'm about to apply it but I noticed 
> that patch 1 is missing a Signed-off-by. Is it OK to add that in your name?

Hi,

No problem for me if you can add it. Thanks.
But if you prefer a v2, it is also fine for me.

BTW sorry for missing the SoB tag. This definitively means that I forgot 
the checkpatch.pl step for this patch, which is bad.

CJ

> 
> Thanks,
>    Felix
> 
> 
> Am 2021-11-28 um 11:45 schrieb Christophe JAILLET:
>> 'kfd->gtt_sa_bitmap' is a bitmap. So use 'bitmap_zalloc()' to simplify
>> code, improve the semantic and avoid some open-coded arithmetic in
>> allocator arguments.
>>
>> Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
>> consistency.
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_device.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> index e1294fba0c26..c5a0ce44a295 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> @@ -1252,8 +1252,6 @@ int 
>> kgd2kfd_schedule_evict_and_restore_process(struct mm_struct *mm,
>>   static int kfd_gtt_sa_init(struct kfd_dev *kfd, unsigned int buf_size,
>>                   unsigned int chunk_size)
>>   {
>> -    unsigned int num_of_longs;
>> -
>>       if (WARN_ON(buf_size < chunk_size))
>>           return -EINVAL;
>>       if (WARN_ON(buf_size == 0))
>> @@ -1264,11 +1262,8 @@ static int kfd_gtt_sa_init(struct kfd_dev *kfd, 
>> unsigned int buf_size,
>>       kfd->gtt_sa_chunk_size = chunk_size;
>>       kfd->gtt_sa_num_of_chunks = buf_size / chunk_size;
>> -    num_of_longs = (kfd->gtt_sa_num_of_chunks + BITS_PER_LONG - 1) /
>> -        BITS_PER_LONG;
>> -
>> -    kfd->gtt_sa_bitmap = kcalloc(num_of_longs, sizeof(long), 
>> GFP_KERNEL);
>> -
>> +    kfd->gtt_sa_bitmap = bitmap_zalloc(kfd->gtt_sa_num_of_chunks,
>> +                       GFP_KERNEL);
>>       if (!kfd->gtt_sa_bitmap)
>>           return -ENOMEM;
>> @@ -1278,13 +1273,12 @@ static int kfd_gtt_sa_init(struct kfd_dev 
>> *kfd, unsigned int buf_size,
>>       mutex_init(&kfd->gtt_sa_lock);
>>       return 0;
>> -
>>   }
>>   static void kfd_gtt_sa_fini(struct kfd_dev *kfd)
>>   {
>>       mutex_destroy(&kfd->gtt_sa_lock);
>> -    kfree(kfd->gtt_sa_bitmap);
>> +    bitmap_free(kfd->gtt_sa_bitmap);
>>   }
>>   static inline uint64_t kfd_gtt_sa_calc_gpu_addr(uint64_t start_addr,
> 

