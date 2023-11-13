Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6947B7EA1B3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCE810E175;
	Mon, 13 Nov 2023 17:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031C210E176
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699895414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G65WustLE2dEQVp8ysLE58NJMc/t5tEbPzYhJeMqn9s=;
 b=L/FzBVG06ycohrn4j0LKWW4XMsJ1h0J1EQ+XJPp5Cy0PsJyElWw6YL3sp4JGslYb5AREYM
 qYfistzC1i8H1GX7zqb1E+1CEUpZboSHpytSpoq/zOjcHBcrcfS8Y+t76SXt0Ib4m2rUO3
 fnYZEcM0mzypRxYMakn6QEBL+Jna+9E=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-ut5a8ctANu-FQuTpBxs2Fg-1; Mon, 13 Nov 2023 12:10:10 -0500
X-MC-Unique: ut5a8ctANu-FQuTpBxs2Fg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c506abc320so36862531fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699895409; x=1700500209;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G65WustLE2dEQVp8ysLE58NJMc/t5tEbPzYhJeMqn9s=;
 b=G/HI0g0hqBcuUCSOhyXPg96SVbNZ4nRL11Br/l0iIGpbl+5URz3j3q04We2E9iUwSb
 4dCoJo4ok1H3JRf+NqH1HObKGkwCxuD/HAFwaNiVPE47bW1MDEIND+AB5Z/1uH0HyzXY
 vpnVhB9JRswQIR/B5O6t3f6h2k7Gc/C1xJtOU73vHS4m9Wgai1GE8/irDdISZ/261RUQ
 tmaSlZZpxqS6fUaWvxIeEeOVGEr7evGD6Sm/w/J8UYRSDdDU2/lwaB2Oe7Pj0C1tMMoP
 o5iK5/xE6Gq/nGOSzfFVjiHrvpvxUxartpmDiB+5bSl5RwtonOoEWg/uBzxzRYFkJNKO
 kS1Q==
X-Gm-Message-State: AOJu0YyjGG8zhKgFTjhtvt/D0R/OuH3NTeyh1Njk6AL3tZByA/blzm4p
 yDeIJqRjon/ziDRBMhjGXd/Or2BIUL5BDbOaoV485iS92/DOEsfZ9Wec+JKX02C/Cd7FSSYw+4D
 xAQAWFosbDt6PHjXnxfMYDO/bgzM9
X-Received: by 2002:a05:6512:4014:b0:500:7a21:3e78 with SMTP id
 br20-20020a056512401400b005007a213e78mr6100254lfb.55.1699895409169; 
 Mon, 13 Nov 2023 09:10:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/xPxDvcc33kOc3ZeaYYvr9EKONgzFQPtiIPoNDj3O2aUw5WCUYtxdrDIZshZQrDyJOu4hpw==
X-Received: by 2002:a05:6512:4014:b0:500:7a21:3e78 with SMTP id
 br20-20020a056512401400b005007a213e78mr6100236lfb.55.1699895408838; 
 Mon, 13 Nov 2023 09:10:08 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a0565120b8100b004fdde1db756sm1029983lfv.26.2023.11.13.09.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 09:10:08 -0800 (PST)
Message-ID: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
Date: Mon, 13 Nov 2023 18:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver: gpu: Fixing warning directly dereferencing a rcu
 pointer
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Singh <singhabhinav9051571833@gmail.com>, kherbst@redhat.com,
 lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20231113081040.2947143-1-singhabhinav9051571833@gmail.com>
 <f229d1ed-b71e-434a-acca-06ee81826260@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f229d1ed-b71e-434a-acca-06ee81826260@linux.intel.com>
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
Cc: nouveau@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/13/23 09:24, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2023-11-13 kl. 09:10, skrev Abhinav Singh:
>> This patch fixes a sparse warning with this message
>> "warning:dereference of noderef expression". In this context it means we
>> are dereferencing a __rcu tagged pointer directly.
>>
>> We should not be directly dereferencing a rcu pointer, rather we should
>> be using rcu helper function rcu_dereferece() inside rcu read critical
>> section to get a normal pointer which can be dereferenced.
>>
>> I tested with qemu with this command
>> qemu-system-x86_64 \
>>     -m 2G \
>>     -smp 2 \
>>     -kernel bzImage \
>>     -append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
>>     -drive file=bullseye.img,format=raw \
>>     -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
>>     -net nic,model=e1000 \
>>     -enable-kvm \
>>     -nographic \
>>     -pidfile vm.pid \
>>     2>&1 | tee vm.log
>> with lockdep enabled.
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>>   drivers/gpu/drm/nouveau/nv04_fence.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
>> index 5b71a5a5cd85..e62bad1ac720 100644
>> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
>> @@ -39,7 +39,9 @@ struct nv04_fence_priv {
>>   static int
>>   nv04_fence_emit(struct nouveau_fence *fence)
>>   {
>> -    struct nvif_push *push = fence->channel->chan.push;
>> +    rcu_read_lock();
>> +    struct nvif_push *push = rcu_dereference(fence->channel)->chan.push;
>> +    rcu_read_unlock();
>>       int ret = PUSH_WAIT(push, 2);
>>       if (ret == 0) {
>>           PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
> 
> I'm not an expert in nouveau fence channel lifetime, but I'm pretty sure this should probably be a rcu_dereference_protected, since a fence likely can't lose its channel before its command to signal is submitted.

Yes, before nouveau_fence_emit() did not add this fence to the fence context's
pending list ->channel doesn't need any protection. We can probably just use
unrcu_pointer(), as in [1].

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nouveau_fence.c#L210

> 
> But in case it's not, I would at least advise to check for fence->channel lifetime before submitting a patch like this. At least the original code warned about it not being 100% correct.
> 
> Cheers,
> 
> ~Maarten
> 

