Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61B47F283E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 10:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D6510E2BC;
	Tue, 21 Nov 2023 09:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC4A10E2BC;
 Tue, 21 Nov 2023 08:59:58 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1cf73e25b72so118545ad.0; 
 Tue, 21 Nov 2023 00:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700557198; x=1701161998; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jJ/AFKPeVxjAnYg0rcHdI79h+dhe0CVTx872xJ/48GQ=;
 b=A2EZe7OlMTrQhdUOrA/ftaSEAjJnOVV5PcgMuT23E3TORxt0fn/Zog7oIjXaY/+Zpm
 fqcocifyrc/6V/qCeLiRf+XGbyp3V03KmSrygXkYBapNG+SfbSPs5qO40k/K4iIWncbf
 FR7FwMYXoR/LxSsCujn+E2gkgH46kOWRJ+QbMdZHchEJZNJB/K8V1iNVXdeC81cv0cIo
 bCb4suu0sUO9OLd3aCtD5CE0WObd9I3hFOMPi8VKywMRb7X50UFJ33aq5x8bGIHOu07l
 NxEkM6g6JkuXvlEaPaIAHj4A2RW9a78qkYEyEsw4+HGdjBXeuWNFONFUO2qK10yw0a+U
 p/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700557198; x=1701161998;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jJ/AFKPeVxjAnYg0rcHdI79h+dhe0CVTx872xJ/48GQ=;
 b=F0zCGKZU8qsFmypMHMSm4Z3Av7q2hnl5Ddvp94U8gSuydgHbIMvFLMv/bHFStfq2tp
 5TGe+FlCmTvNyKjO814+rCpiBa2IEpjj8eNcc1+Cps9Ue9YnVS6XDX+wWutnHJztVhB2
 4ahqSFIR55siO9eIHwGcsURf3U8eBbpzaT3oXA3R55b1bX6CxBhMgjsN3JMFCE7olAUe
 d5/XMiJx+3/BIvlYxMeKEA5tvO7p8W89oa9lKzAU4/04Uinz/kX3FEqEU7r8sNSyRxx0
 L1jxaQnx3R2xUb5DOuP/GXHKx/kegwNSsDkmPBEsFYhKAstG85d5uQndzxXcmNcJsGm9
 ct9A==
X-Gm-Message-State: AOJu0YwUiyD513tNW/tbqTCBwJxXLz/6lAf4aZEZigRl81cyzLkaQiez
 TkOZQ56hGUggcZ6PtLGcH0g=
X-Google-Smtp-Source: AGHT+IHuciNeLfXvkTnSw1GZl4bJP7c7mXwIB2Y7kIFG4zpwMN7QUV1San6rTxEbjcx5PX2Gvul0Yg==
X-Received: by 2002:a17:902:eccd:b0:1cf:6a75:e989 with SMTP id
 a13-20020a170902eccd00b001cf6a75e989mr3141227plh.6.1700557198184; 
 Tue, 21 Nov 2023 00:59:58 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.209])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a17090322c400b001bbb7af4963sm7401133plg.68.2023.11.21.00.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 00:59:57 -0800 (PST)
Message-ID: <38a45214-7cd0-482a-a330-65c5be488fba@gmail.com>
Date: Tue, 21 Nov 2023 14:29:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] driver: gpu: Fixing warning directly dereferencing a
 rcu pointer
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, kherbst@redhat.com, lyude@redhat.com, 
 airlied@gmail.com, daniel@ffwll.ch
References: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
 <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
 <0754e669-8b00-461c-b6fe-79c659bf59a3@redhat.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <0754e669-8b00-461c-b6fe-79c659bf59a3@redhat.com>
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

On 11/21/23 06:50, Danilo Krummrich wrote:
> On 11/13/23 20:13, Abhinav Singh wrote:
>> This patch fixes a sparse warning with this message
>> "warning:dereference of noderef expression". In this context it means we
>> are dereferencing a __rcu tagged pointer directly.
>>
>> We should not be directly dereferencing a rcu pointer. To get a normal
>> (non __rcu tagged pointer) from a __rcu tagged pointer we are using the
>> function unrcu_pointer(...). The non __rcu tagged pointer then can be
>> dereferenced just like a normal pointer.
>>
>> I tested with qemu with this command
>> qemu-system-x86_64 \
>>     -m 2G \
>>     -smp 2 \
>>     -kernel bzImage \
>>     -append "console=ttyS0 root=/dev/sda earlyprintk=serial 
>> net.ifnames=0" \
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
> 
> Applied, thanks!
> 
> There are a few more such occurrences. [1][2] Plan to fix them as well?
> 
> [1] 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nv10_fence.c#L35
> [2] 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nv84_fence.c#L88
> 
>> ---
>> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
>>             also removed the rcu locking and unlocking function call.
>> v2 -> v3 : Changed the description of the patch to match it with the 
>> actual
>>        implementation.
>>
>>   drivers/gpu/drm/nouveau/nv04_fence.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c 
>> b/drivers/gpu/drm/nouveau/nv04_fence.c
>> index 5b71a5a5cd85..cdbc75e3d1f6 100644
>> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
>> @@ -39,7 +39,7 @@ struct nv04_fence_priv {
>>   static int
>>   nv04_fence_emit(struct nouveau_fence *fence)
>>   {
>> -    struct nvif_push *push = fence->channel->chan.push;
>> +    struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>>       int ret = PUSH_WAIT(push, 2);
>>       if (ret == 0) {
>>           PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
> 
Thanks a lot for merging this.
Yeah sure I will submit the patch for the issues soon.

Regards,
Abhinav Singh
