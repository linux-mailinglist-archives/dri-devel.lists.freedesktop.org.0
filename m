Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F554133FA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 15:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78866E97A;
	Tue, 21 Sep 2021 13:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410586E982
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 13:22:24 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F40AC40265
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632230542;
 bh=F3KI5mCrhMB76BGjiS/WLY6vnjlNE8ox5HEGVVIIPrY=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=OXASH/5aZJ9EOmCPjpxb0mkUWI5JIN2C0s2pwWU1J46HWRyIxYbnwCIAXXcLJWv5X
 +uA0DISkmotm5cdqRXfQRYHOzvIRj+H1nRIKeyqgjK7kil54ahGW/zLf4dpls15ofd
 TuLuUaDZPrU6//XS9hlz4Vgo2zvnHs/X+NcIBm88iuBPP+FyaNlvV14yoGnMxip8La
 9tfKjkyy5+RGQtr5EHuKqKacs5kRi6NEY8drB/rXXwtuJWo+N6XiKUsUYWyU9ONISB
 Vtb2eWt1Axx1F0Sy0atYztGmNUOqx1KsKZJXEtVMARY6r/bfgPEOujWCzEUMzQhhe6
 omImJW39TLyxA==
Received: by mail-pg1-f199.google.com with SMTP id
 d5-20020a63ed05000000b002688d3aff8aso18119643pgi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 06:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F3KI5mCrhMB76BGjiS/WLY6vnjlNE8ox5HEGVVIIPrY=;
 b=ldO8lLgSbXwNfaXP5493Vk1SKlg0oPtxLISUUh/yKYoTBMkiB5fcYV2oWTguRK+DET
 w4KaPpPEoM3g38rUV96qhwi0gtiF7w8ifEBNPk0AWdwPAbfy6co/uqYgqb/mMY3XvRtO
 Yx2xPMxNupgiqw6DKtqbhat/cpUkWSjxcrVHe5DPvHJsCVRkMRPt8iCcdztADE7qQ290
 lOEe37WXx7Y7U/tGWbfjHWMkAtoOat5vtUGTSZ+dFQUc8DIjiscv7WA4puKtbJf0nhm3
 phyF1MqWcvlyJazci75u8If8/i0uH0RVaAQXfi313cesepiUCnXFN2RlU/95wEc4V9R7
 /CSg==
X-Gm-Message-State: AOAM533Vs7SKAGus/aHTy+seO3XtpXdIHxz8RtE95D8jHPQ0llJnZ3xw
 5OM5GdyEQ+8uu7BsQ1bjuHkkoDur5KcUsuNK1nvVZHrh6ixGcTwWw6XZMX3QQv3iZ22PGVE7TUF
 JKq1d9zzMXuLiP1y+AtAosnm3tC20A4lhNcAVv8Yz0/XaGg==
X-Received: by 2002:a62:5fc7:0:b0:438:9e3a:b8c0 with SMTP id
 t190-20020a625fc7000000b004389e3ab8c0mr30550080pfb.74.1632230540444; 
 Tue, 21 Sep 2021 06:22:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv2HJcq8NUDNBKSl0UFDV3ItaulvvPIta5Lh/0oz4qsCaZbbRsg9Acbc3EA9efc2z9IGcpdA==
X-Received: by 2002:a62:5fc7:0:b0:438:9e3a:b8c0 with SMTP id
 t190-20020a625fc7000000b004389e3ab8c0mr30550053pfb.74.1632230540077; 
 Tue, 21 Sep 2021 06:22:20 -0700 (PDT)
Received: from [192.168.1.124] ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id q2sm2796666pjo.27.2021.09.21.06.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 06:22:19 -0700 (PDT)
Subject: Re: [PATCH] drm/nouveau/ga102: Free resources on error in
 ga102_chan_new()
To: Karol Herbst <kherbst@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20210920181647.22156-1-tim.gardner@canonical.com>
 <CACO55ts0kJaHr0QTzqy5r9Gq4vbV=8bMokuVHSCAqMVEOKAgDw@mail.gmail.com>
From: Tim Gardner <tim.gardner@canonical.com>
Message-ID: <9b778fe8-be29-f8aa-a40f-b640e9d31cc6@canonical.com>
Date: Tue, 21 Sep 2021 07:22:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACO55ts0kJaHr0QTzqy5r9Gq4vbV=8bMokuVHSCAqMVEOKAgDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 9/20/21 8:07 PM, Karol Herbst wrote:
> On Mon, Sep 20, 2021 at 8:17 PM Tim Gardner <tim.gardner@canonical.com> wrote:
>>
>> Coverity complains of a resource leak in ga102_chan_new():
>>
>> CID 119637 (#7 of 7): Resource leak (RESOURCE_LEAK)
>> 13. leaked_storage: Variable chan going out of scope leaks the storage it points to.
>> 190                return ret;
>>
>> Fix this by freeing 'chan' in the error path.
>>
> 
> yeah, this is actually a false positive. I ran your patch through
> kasan and got a use-after-free as we deallocate the passed in pointer
> after calling the function pointer to the new function. One might
> argue that the programming style isn't the best and we should be
> explicit about freeing memory though.
> 

So the caller of this constructor has to look at the error return code 
and decide whether the value stored in *pobject can be freed ? I guess 
if the caller initializes the value at *pobject to be NULL then it can 
kfree() regardless.

>> Cc: Ben Skeggs <bskeggs@redhat.com>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Karol Herbst <kherbst@redhat.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: nouveau@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
>> ---
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/ga102.c  | 20 ++++++++++++-------
>>   1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
>> index f897bef13acf..4dbdfb53e65f 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
>> @@ -175,19 +175,21 @@ ga102_chan_new(struct nvkm_device *device,
>>                  }
>>          }
>>
>> -       if (!chan->ctrl.runl)
>> -               return -ENODEV;
>> +       if (!chan->ctrl.runl) {
>> +               ret = -ENODEV;
>> +               goto free_chan;
>> +       }
>>
>>          chan->ctrl.chan = nvkm_rd32(device, chan->ctrl.runl + 0x004) & 0xfffffff0;
>>          args->token = nvkm_rd32(device, chan->ctrl.runl + 0x008) & 0xffff0000;
>>
>>          ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->mthd);
>>          if (ret)
>> -               return ret;
>> +               goto free_chan;
>>
>>          ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->inst);
>>          if (ret)
>> -               return ret;
>> +               goto free_chan;
>>
>>          nvkm_kmap(chan->inst);
>>          nvkm_wo32(chan->inst, 0x010, 0x0000face);
>> @@ -209,11 +211,11 @@ ga102_chan_new(struct nvkm_device *device,
>>
>>          ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->user);
>>          if (ret)
>> -               return ret;
>> +               goto free_chan;
>>
>>          ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->runl);
>>          if (ret)
>> -               return ret;
>> +               goto free_chan;
>>
>>          nvkm_kmap(chan->runl);
>>          nvkm_wo32(chan->runl, 0x00, 0x80030001);
>> @@ -228,10 +230,14 @@ ga102_chan_new(struct nvkm_device *device,
>>
>>          ret = nvkm_vmm_join(vmm, chan->inst);
>>          if (ret)
>> -               return ret;
>> +               goto free_chan;
>>
>>          chan->vmm = nvkm_vmm_ref(vmm);
>>          return 0;
>> +
>> +free_chan:
>> +       kfree(chan);
>> +       return ret;
>>   }
>>
>>   static const struct nvkm_device_oclass
>> --
>> 2.33.0
>>
> 

-- 
-----------
Tim Gardner
Canonical, Inc
