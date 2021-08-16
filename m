Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD41F3ED445
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 14:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAFB89B8E;
	Mon, 16 Aug 2021 12:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1B989B8E;
 Mon, 16 Aug 2021 12:47:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r6so23467818wrt.4;
 Mon, 16 Aug 2021 05:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UciGnzheksS2qLoDLETrk/e95MzTGXeXG51AsgxNO+k=;
 b=iD22aRcEZwq4TaevFswvk4OthmpEFUC7ITUQ9Ol6vDK5/eWHqWht8L/R616ABlyCqy
 y2Uh3QDw+P1dll33nho/xbdwG67gDWgdmJcwgApWfFnItYAf5ylujvoIFcuxW5tQIiEA
 lLyCYKx9uHCodFNN6kORzWGtVA9wz1sdHOFlsun4DXKuhxFjhqQxo2Z79SAaCqUfd9fJ
 akJjAXzwQ2fyguv8v17S+mzcNWYgtFqZj/KG6hRTsmqIFPJgPEmrIPjXTbOdH9qjhtPU
 ITpT0uhjbRMpe7zhnUOAd2hxvGCb2hlRZ0RQatJaSnnleD/W6wYQFU4ZRZRdEV1f7L7f
 F97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UciGnzheksS2qLoDLETrk/e95MzTGXeXG51AsgxNO+k=;
 b=fkGOgIuVedYb00PNFQrqqb83NhWk/J9DE5u6oIS2neN29ZtODsjoI5XFMQSM1Un4P8
 jSdPKpWsfPH5UovDBDemXH71GM7eTjldgKO9ZpfoAjhU8zXl5jNEwSZSzXRJr5qPfXW+
 rOgSM1L43dk7JONFFU4EswfklS+IbTZjPiP7ua1w7oMPN9NGThYpdIMUIdEYTYRoy5ia
 eDi7OIYqCdWJlssLFBkaiybSbn+HLRkFZQ8dBfyzYxOKE98FvP4BeJpacnivCgmfu1BL
 8R1IZnPDbd0HQ2uxpOFwBlCDdlibrRtE5EexkfGBVRkuIAAzRbHBur7XXyixd4bPGepI
 PhnA==
X-Gm-Message-State: AOAM533Udb/WNt9zVBNtgxYazLOuEc92kuW2CfCdoo3aHi07PwAF9T2v
 pBw4YhvKTwyftafVjv14mls=
X-Google-Smtp-Source: ABdhPJx74mNcW0G9z1JdJLJUjdM7uql3qXMDms0ym6TmRaR/WZqCVzU/Rghb8dPZfXDv1TnTJXAy/Q==
X-Received: by 2002:adf:e9c3:: with SMTP id l3mr18612852wrn.300.1629118039512; 
 Mon, 16 Aug 2021 05:47:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f9:c3d:bbad:9698?
 ([2a02:908:1252:fb60:f9:c3d:bbad:9698])
 by smtp.gmail.com with ESMTPSA id s17sm10488566wmj.12.2021.08.16.05.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 05:47:19 -0700 (PDT)
Subject: Re: [PATCH] drm: radeon: r600_dma: Replace cpu_to_le32() by
 lower_32_bits()
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 zhaoxiao <zhaoxiao@uniontech.com>, airlied@linux.ie
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210813085434.3890-1-zhaoxiao@uniontech.com>
 <54590a79-7047-cd6f-0f54-a005bdc69769@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4b1faa87-a4d8-57e2-80d0-817c5df8f643@gmail.com>
Date: Mon, 16 Aug 2021 14:47:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <54590a79-7047-cd6f-0f54-a005bdc69769@daenzer.net>
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



Am 13.08.21 um 17:03 schrieb Michel Dänzer:
> On 2021-08-13 10:54 a.m., zhaoxiao wrote:
>> This patch fixes the following sparse errors:
>> drivers/gpu/drm/radeon/r600_dma.c:247:30: warning: incorrect type in assignment (different base types)
>> drivers/gpu/drm/radeon/r600_dma.c:247:30:    expected unsigned int volatile [usertype]
>> drivers/gpu/drm/radeon/r600_dma.c:247:30:    got restricted __le32 [usertype]
>>
>> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
>> ---
>>   drivers/gpu/drm/radeon/r600_dma.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/r600_dma.c b/drivers/gpu/drm/radeon/r600_dma.c
>> index fb65e6fb5c4f..a2d0b1edcd22 100644
>> --- a/drivers/gpu/drm/radeon/r600_dma.c
>> +++ b/drivers/gpu/drm/radeon/r600_dma.c
>> @@ -244,7 +244,7 @@ int r600_dma_ring_test(struct radeon_device *rdev,
>>   	gpu_addr = rdev->wb.gpu_addr + index;
>>   
>>   	tmp = 0xCAFEDEAD;
>> -	rdev->wb.wb[index/4] = cpu_to_le32(tmp);
>> +	rdev->wb.wb[index/4] = lower_32_bits(tmp);
>>   
>>   	r = radeon_ring_lock(rdev, ring, 4);
>>   	if (r) {
>>
> Seems better to mark rdev->wb.wb as little endian instead. It's read with le32_to_cpu (with some exceptions which look like bugs), which would result in 0xADEDFECA like this.

Yeah, that patch doesn't look correct at all and most likely breaks ring 
test on big endian systems.

Christian.
