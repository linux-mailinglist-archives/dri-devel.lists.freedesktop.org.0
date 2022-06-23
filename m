Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3486E55700F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 03:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FB410E125;
	Thu, 23 Jun 2022 01:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED89510E125
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 01:45:50 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id d14so13975742pjs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 18:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=XBccRW3f809STZYPXXYOmdRu7QvxDSYP9NM/SprVkxQ=;
 b=hLQCWBlBMI7cXx2E87+ADwS9i4fRnadmJHUVnCjL+L3Ew5SWwQ755AeopCCQWXLrwZ
 sE+R9hJmUQKThtWQSBQJw4uiHGHVi/JLX9hl/ararv01AKc/kQZ6W3wOOAPGmtSKQLwM
 jYIcZu0muVb8lsmUyAJBZVVrpp4MpfMUZuOFbgqotSVOH3M4IViviOjqa7BTeEwA0FY8
 mIBhuf3H12Ffp/NZ89ITdv0Duv8uFapXEdLawLEbXbkYGN1xzl14Wm4z/pPQNZesyB8L
 KDJu7GHEWHSQiG5qmCgGcCLdKY6Aoev2zmpDTHJjY6ODKYyZlHpW7SR0f94HNG1/Hvbk
 AVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=XBccRW3f809STZYPXXYOmdRu7QvxDSYP9NM/SprVkxQ=;
 b=6jrP+J7nZ8cCjSufimolurgnqR93B/HTqpN8LMih0YD53JV+Encw0pcB/QhpCjEGKX
 g1Cf9t5gTWfDWSwirjAhR6o8W4Co17TDEJ+s5DSgX9a4ZsROvF3bKlruEHhRUwpWfETb
 g3U7MLqLDAev1q7wAUervODf2seNY/qfL+Z6Z10fTFtKKcq+yBJnSMqKQjLiEzhFV1hW
 /R20icich81NP/aB7v2fTQkFuWW63NWoNwfe00trNrh000AYpN21wRzwmDN7UAlMqkyd
 T/8KQBwNOydFetIhgiXbBG/0E4guO8OeubLUw4Kz/dseiOkahGpAjPzYkHFVnEabYev/
 a1rw==
X-Gm-Message-State: AJIora9c6W0iioo494WzEqyNsbLenn6u2TX7RFhCFFhAUmX5HWUeRDkU
 LP050CE8DQjBSnNT04beoa4=
X-Google-Smtp-Source: AGRyM1v79HHyCnNn6RyfKdzxg4cWNNvw6QTiaNpLe4NjJnmtnDArzRRTbD21t8VWNjkFTXBN2iSwSw==
X-Received: by 2002:a17:90a:e7c8:b0:1e6:961f:999d with SMTP id
 kb8-20020a17090ae7c800b001e6961f999dmr1359069pjb.23.1655948750578; 
 Wed, 22 Jun 2022 18:45:50 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 d26-20020a63735a000000b0040cba7ef9b9sm6901613pgn.9.2022.06.22.18.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 18:45:49 -0700 (PDT)
Message-ID: <b0d778de-9be7-f1a0-9356-9daa398edf5e@gmail.com>
Date: Thu, 23 Jun 2022 09:45:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] gpu: drm: fix possible memory leak in drm_addmap_core()
Content-Language: en-US
From: Hangyu Hua <hbh25y@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
References: <20220509054441.17282-1-hbh25y@gmail.com>
 <ea67fa6b-0fcd-4b59-861f-360e74a4d70a@gmail.com>
In-Reply-To: <ea67fa6b-0fcd-4b59-861f-360e74a4d70a@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/5/23 09:57, Hangyu Hua wrote:
> On 2022/5/9 13:44, Hangyu Hua wrote:
>> map->handle need to be handled correctly when map->type is _DRM_SHM or
>> _DRM_CONSISTENT just like map->type is _DRM_REGISTERS.
>>
>> Fixes: 8d153f7107ff ("drm: update user token hashing and map handles")
>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_bufs.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
>> index fcca21e8efac..2b3f504c5f9c 100644
>> --- a/drivers/gpu/drm/drm_bufs.c
>> +++ b/drivers/gpu/drm/drm_bufs.c
>> @@ -344,6 +344,15 @@ static int drm_addmap_core(struct drm_device 
>> *dev, resource_size_t offset,
>>       if (!list) {
>>           if (map->type == _DRM_REGISTERS)
>>               iounmap(map->handle);
>> +        else if (map->type == _DRM_SHM) {
>> +            dev->sigdata.lock = dev->master->lock.hw_lock = NULL;
>> +            vfree(map->handle);
>> +        } else if (map->type == _DRM_CONSISTENT) {
>> +            dma_free_coherent(dev->dev,
>> +                      map->size,
>> +                      map->handle,
>> +                      map->offset);
>> +        }
>>           kfree(map);
>>           return -EINVAL;
>>       }
>> @@ -361,6 +370,15 @@ static int drm_addmap_core(struct drm_device 
>> *dev, resource_size_t offset,
>>       if (ret) {
>>           if (map->type == _DRM_REGISTERS)
>>               iounmap(map->handle);
>> +        else if (map->type == _DRM_SHM) {
>> +            dev->sigdata.lock = dev->master->lock.hw_lock = NULL;
>> +            vfree(map->handle);
>> +        } else if (map->type == _DRM_CONSISTENT) {
>> +            dma_free_coherent(dev->dev,
>> +                      map->size,
>> +                      map->handle,
>> +                      map->offset);
>> +        }
>>           kfree(map);
>>           kfree(list);
>>           mutex_unlock(&dev->struct_mutex);
> 
> Gentel ping.

Gentel ping.
