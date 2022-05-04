Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F8F519F01
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 14:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20CF10EB58;
	Wed,  4 May 2022 12:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E561A10EB58
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651666263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYoNq491qyKrtJAnHmrzEyNeTcrzjNjoXUyTdbRLeNs=;
 b=T/LDOgxUW+XnKFqt+hA7y751uXNEq7HZinVNvNRSgxamWqVQeqrQCQQzKtPCGRGcKeG2On
 tU2S1E6WU4wMtohObAcuuF5DzLfpjNXnCtdmwRWvVtGje8Qe31PX/tZI5liFCyxEMWhieI
 2yOxOZ/rzZHk/9FpzOgY99f9XbLeQY8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-50KnkLMcMs2moQjt52pAsg-1; Wed, 04 May 2022 08:11:03 -0400
X-MC-Unique: 50KnkLMcMs2moQjt52pAsg-1
Received: by mail-wr1-f71.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so302140wrh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 05:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tYoNq491qyKrtJAnHmrzEyNeTcrzjNjoXUyTdbRLeNs=;
 b=SZP7vx1YxxkYy3u4zaUK+d8rGksjBS+cJmLRrXL6IM/kDV4qMqP7eSeSzd1W9dgVVa
 K6mSewnmHawSjRCncNYBIxQab8nZmRg0ffwGkhvWM7vz2yRFlTFTMee/UflHRyCZ0idm
 R1wQYHar7cNYtjYyshX20XM5HQYH50XxowrBerqESyNBuwyTD9NRgoROAZxBoCUiWZ6A
 fsSZK8em5MDKDmvgrRcw+4BxGTJgqEBuK/5YXOTCrIYtn6fEECy0h6KiHRPEtTaF1wgW
 4KlcUEDh2LBDNA0F6ZYXFF8Vg9lMTw3JkxGtQLbd9RIQZa/5aXZQr7g2pV8wFPVU0Esr
 dZOQ==
X-Gm-Message-State: AOAM530jRascplY+QGsdusXN3iC0grkmdsItWi6NpXhVSiIRSq0doGGq
 qtOyKegIL7+uG/pPgKVvuU1/4g8LBwF46uBzKbroLmKSvJwEHBUmX33JQaOFZ9wXMF3Zf+lCmXs
 anOQ8YSnS3uRpIDEWxra5FhH2oK3z
X-Received: by 2002:a5d:6582:0:b0:20a:d8f6:b1e8 with SMTP id
 q2-20020a5d6582000000b0020ad8f6b1e8mr16203097wru.431.1651666261342; 
 Wed, 04 May 2022 05:11:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylorffbcPhhjrbAHY47fyPh6/Mep0l/fAR6N+S1PXhsUGNHRPMb5C+y754BvjmvcPdlUkRvA==
X-Received: by 2002:a5d:6582:0:b0:20a:d8f6:b1e8 with SMTP id
 q2-20020a5d6582000000b0020ad8f6b1e8mr16203083wru.431.1651666261154; 
 Wed, 04 May 2022 05:11:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:a765:79fb:b5ef:c480?
 ([2a01:e0a:d5:a000:a765:79fb:b5ef:c480])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a7bc3c8000000b0038eba413181sm3723295wmj.1.2022.05.04.05.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 05:11:00 -0700 (PDT)
Message-ID: <8ee3b331-862f-db81-780d-53d1db59bd9e@redhat.com>
Date: Wed, 4 May 2022 14:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] mgag200: remove mgag200_probe_vram()
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-5-jfalempe@redhat.com>
 <2229491c-cdfc-3409-3250-32c2878460e7@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <2229491c-cdfc-3409-3250-32c2878460e7@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05/2022 12:16, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.04.22 um 18:41 schrieb Jocelyn Falempe:
>> This function writes some pattern to video memory, to check for conflict.
>> In case of conflicts, it returns a random memory capacity (offset of the
>> conflict).
>> Using devm_arch_io_reserve_memtype_wc() should garantee that no other
>> driver is using this memory region.
>> In case of real memory conflicts, as it is video memory, the user will
>> notice it easily. So there is no need for this function.
> 
> I don't think we can remove this function. It doesn't test for 
> concurrent access, but for non-existing video memory. Apparently, some 
> systems have larger PCI apertures than actual video memory.
Ok, I tough writing to non-existing memory would raise an exception/Bus 
error. If it's silently ignored by hardware, this is probably the only 
way to make sure the memory is there.

let's drop this patch in v2 ;)

> 
> Best regards
> Thomas
> 
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_mm.c | 50 ++++------------------------
>>   1 file changed, 7 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mm.c
>> index fa996d46feed..68299b560a98 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mm.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
>> @@ -32,48 +32,6 @@
>>   #include "mgag200_drv.h"
>> -static size_t mgag200_probe_vram(struct mga_device *mdev, void 
>> __iomem *mem,
>> -                 size_t size)
>> -{
>> -    int offset;
>> -    int orig;
>> -    int test1, test2;
>> -    int orig1, orig2;
>> -    size_t vram_size;
>> -
>> -    /* Probe */
>> -    orig = ioread16(mem);
>> -    iowrite16(0, mem);
>> -
>> -    vram_size = size;
>> -
>> -    if ((mdev->type == G200_EW3) && (vram_size >= 0x1000000))
>> -        vram_size = vram_size - 0x400000;
>> -
>> -    for (offset = 0x100000; offset < vram_size; offset += 0x4000) {
>> -        orig1 = ioread8(mem + offset);
>> -        orig2 = ioread8(mem + offset + 0x100);
>> -
>> -        iowrite16(0xaa55, mem + offset);
>> -        iowrite16(0xaa55, mem + offset + 0x100);
>> -
>> -        test1 = ioread16(mem + offset);
>> -        test2 = ioread16(mem);
>> -
>> -        iowrite16(orig1, mem + offset);
>> -        iowrite16(orig2, mem + offset + 0x100);
>> -
>> -        if (test1 != 0xaa55)
>> -            break;
>> -
>> -        if (test2)
>> -            break;
>> -    }
>> -
>> -    iowrite16(orig, mem);
>> -
>> -    return offset - 65536;
>> -}
>>   int mgag200_mm_init(struct mga_device *mdev)
>>   {
>> @@ -81,6 +39,7 @@ int mgag200_mm_init(struct mga_device *mdev)
>>       struct pci_dev *pdev = to_pci_dev(dev->dev);
>>       u8 misc;
>>       resource_size_t start, len;
>> +    size_t vram_size;
>>       WREG_ECRT(0x04, 0x00);
>> @@ -106,7 +65,12 @@ int mgag200_mm_init(struct mga_device *mdev)
>>       if (!mdev->vram)
>>           return -ENOMEM;
>> -    mdev->mc.vram_size = mgag200_probe_vram(mdev, mdev->vram, len);
>> +    vram_size = len;
>> +    /* G200_EW3 has only 12MB of memory */
>> +    if ((mdev->type == G200_EW3) && (vram_size >= 0x1000000))
>> +        vram_size -= 0x400000;
>> +
>> +    mdev->mc.vram_size = vram_size;
>>       mdev->mc.vram_base = start;
>>       mdev->mc.vram_window = len;
> 

