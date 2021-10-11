Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F2842914F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 16:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0F66E4F4;
	Mon, 11 Oct 2021 14:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4B66E4F4;
 Mon, 11 Oct 2021 14:15:31 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r18so56808481wrg.6;
 Mon, 11 Oct 2021 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dLxsJUpDhzPmoSrF1qZa4Zl9U4s5BEcVvitiq3ldBzs=;
 b=Mn/WEBLhoPojIdasKOYB5LhCocKhVbLlACzAwBczfwTyYpXmjoT3McGcuu+JDd141P
 3AnFKTI1Sz5UOr/2c3ywRwQsUyxW767ajHj3fHlmgGHDWkqnoqBSIybMPlZRkg5VswOi
 SLsotX2bQGEMW3vODiry31+QiZ5fLEg+WhTAqnqZWkG5uX6zj8PEeLITv4miVDPE/nzo
 bonvBUEtb02b2B8DSW1B2/9P1vpJVaO5oKooPXMSU8HDTZTD3gf8d7nanzdQH5qN95SZ
 XyneiU+T2ZRXbzjl5U50wDHxfs0bT8cERLFA1mPcs+Dy6WMsXaTJMHVvWYCEKBLgLkIO
 dYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dLxsJUpDhzPmoSrF1qZa4Zl9U4s5BEcVvitiq3ldBzs=;
 b=UzgXlnZa4sUwaSOpucs0bCK0QD9eeAgm6moc4XzUtmN2Fko0Pm+LIFa75nEjwIlICc
 sy187i3ikVVEcHzQKQA/JKoH3KzB+3qChRXuBMRoplGzl4VCS9ZFNbdtiR6Cnyu8jxRy
 WI1KwiAJ+2qTiPVHb94TrW6EQNIAC1xS45A3zoowXCiWOylDnuC3cTT56rC8uoyvDUNI
 8m0iWi0y6axHHOiq0ll4sja4CUs7sTdjg6zguPgQ1cLg1Bh5mXDyGH58S9VshXI4uEZ8
 VakVbiZ9DC+/PmLWp2foEzL4Wae/u8e6JlC0hiRSqKS0tWhQxIOq8ix0Jtv74o18XAl1
 EzHQ==
X-Gm-Message-State: AOAM5327zbfil8px2wW9ChaHaIedW8EuxmMy8gNkRDUNxV8jztiigJZo
 yZFhpESSquUGcju483kMukA=
X-Google-Smtp-Source: ABdhPJy/+QpPnkBOuHDSZzntKKe7Q8Ee96pGXUq+k16RcQqTRYLhJiw/aHSwZ/axPkNutqppOhNWhQ==
X-Received: by 2002:adf:a114:: with SMTP id o20mr24380239wro.95.1633961729555; 
 Mon, 11 Oct 2021 07:15:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:fefa:f968:b0f6:6172?
 ([2a02:908:1252:fb60:fefa:f968:b0f6:6172])
 by smtp.gmail.com with ESMTPSA id z8sm8053645wrq.16.2021.10.11.07.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 07:15:28 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH] dma-resv: Fix dma_resv_get_fences and
 dma_resv_copy_fences after conversion
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Intel-gfx@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
References: <20211008095007.972693-1-tvrtko.ursulin@linux.intel.com>
 <9eca89ab-f954-8b2a-7af5-b4a63b90eed0@amd.com>
 <67f413c4-b654-c7ea-bc4f-6b42418c7486@linux.intel.com>
 <85489b72-6001-98d8-d66a-395e05cd3d01@amd.com>
 <8f93439a-739d-835d-95e9-59ffb7380a27@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a9f2661f-6f67-1cd7-e75d-c61aaaa381b4@gmail.com>
Date: Mon, 11 Oct 2021 16:15:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8f93439a-739d-835d-95e9-59ffb7380a27@linux.intel.com>
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

Am 11.10.21 um 14:32 schrieb Tvrtko Ursulin:
>
> On 08/10/2021 13:19, Christian König wrote:
>> Am 08.10.21 um 12:49 schrieb Tvrtko Ursulin:
>>>
>>> On 08/10/2021 11:21, Christian König wrote:
>>>> Am 08.10.21 um 11:50 schrieb Tvrtko Ursulin:
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> Cache the count of shared fences in the iterator to avoid 
>>>>> dereferencing
>>>>> the dma_resv_object outside the RCU protection. Otherwise iterator 
>>>>> and its
>>>>> users can observe an incosistent state which makes it impossible 
>>>>> to use
>>>>> safely.
>>>>
>>>> Ah, of course! I've been staring at the code the whole morning and 
>>>> couldn't see it.
>>>>
>>>> Going to write a testcase to cover that.
>>>>
>>>>> Such as:
>>>>>
>>>>> <6> [187.517041] [IGT] gem_sync: executing
>>>>> <7> [187.536343] i915 0000:00:02.0: 
>>>>> [drm:i915_gem_context_create_ioctl [i915]] HW context 1 created
>>>>> <7> [187.536793] i915 0000:00:02.0: 
>>>>> [drm:i915_gem_context_create_ioctl [i915]] HW context 1 created
>>>>> <6> [187.551235] [IGT] gem_sync: starting subtest basic-many-each
>>>>> <1> [188.935462] BUG: kernel NULL pointer dereference, address: 
>>>>> 0000000000000010
>>>>> <1> [188.935485] #PF: supervisor write access in kernel mode
>>>>> <1> [188.935495] #PF: error_code(0x0002) - not-present page
>>>>> <6> [188.935504] PGD 0 P4D 0
>>>>> <4> [188.935512] Oops: 0002 [#1] PREEMPT SMP NOPTI
>>>>> <4> [188.935521] CPU: 2 PID: 1467 Comm: gem_sync Not tainted 
>>>>> 5.15.0-rc4-CI-Patchwork_21264+ #1
>>>>> <4> [188.935535] Hardware name:  /NUC6CAYB, BIOS 
>>>>> AYAPLCEL.86A.0049.2018.0508.1356 05/08/2018
>>>>> <4> [188.935546] RIP: 0010:dma_resv_get_fences+0x116/0x2d0
>>>>> <4> [188.935560] Code: 10 85 c0 7f c9 be 03 00 00 00 e8 15 8b df 
>>>>> ff eb bd e8 8e c6 ff ff eb b6 41 8b 04 24 49 8b 55 00 48 89 e7 8d 
>>>>> 48 01 41 89 0c 24 <4c> 89 34 c2 e8 41 f2 ff ff 49 89 c6 48 85 c0 
>>>>> 75 8c 48 8b 44 24 10
>>>>> <4> [188.935583] RSP: 0018:ffffc900011dbcc8 EFLAGS: 00010202
>>>>> <4> [188.935593] RAX: 0000000000000000 RBX: 00000000ffffffff RCX: 
>>>>> 0000000000000001
>>>>> <4> [188.935603] RDX: 0000000000000010 RSI: ffffffff822e343c RDI: 
>>>>> ffffc900011dbcc8
>>>>> <4> [188.935613] RBP: ffffc900011dbd48 R08: ffff88812d255bb8 R09: 
>>>>> 00000000fffffffe
>>>>> <4> [188.935623] R10: 0000000000000001 R11: 0000000000000000 R12: 
>>>>> ffffc900011dbd44
>>>>> <4> [188.935633] R13: ffffc900011dbd50 R14: ffff888113d29cc0 R15: 
>>>>> 0000000000000000
>>>>> <4> [188.935643] FS:  00007f68d17e9700(0000) 
>>>>> GS:ffff888277900000(0000) knlGS:0000000000000000
>>>>> <4> [188.935655] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>> <4> [188.935665] CR2: 0000000000000010 CR3: 000000012d0a4000 CR4: 
>>>>> 00000000003506e0
>>>>> <4> [188.935676] Call Trace:
>>>>> <4> [188.935685]  i915_gem_object_wait+0x1ff/0x410 [i915]
>>>>> <4> [188.935988]  i915_gem_wait_ioctl+0xf2/0x2a0 [i915]
>>>>> <4> [188.936272]  ? i915_gem_object_wait+0x410/0x410 [i915]
>>>>> <4> [188.936533]  drm_ioctl_kernel+0xae/0x140
>>>>> <4> [188.936546]  drm_ioctl+0x201/0x3d0
>>>>> <4> [188.936555]  ? i915_gem_object_wait+0x410/0x410 [i915]
>>>>> <4> [188.936820]  ? __fget_files+0xc2/0x1c0
>>>>> <4> [188.936830]  ? __fget_files+0xda/0x1c0
>>>>> <4> [188.936839]  __x64_sys_ioctl+0x6d/0xa0
>>>>> <4> [188.936848]  do_syscall_64+0x3a/0xb0
>>>>> <4> [188.936859] entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>>
>>>>> If the shared object has changed during the RCU unlocked period
>>>>> callers will correctly handle the restart on the next iteration.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Fixes: 96601e8a4755 ("dma-buf: use new iterator in 
>>>>> dma_resv_copy_fences")
>>>>> Fixes: d3c80698c9f5 ("dma-buf: use new iterator in 
>>>>> dma_resv_get_fences v3")
>>>>> Closes: 
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fintel%2F-%2Fissues%2F4274&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cc22feea06a3f4285cdac08d98a495984%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637692870805160909%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=6oPR30sWnJe04I4GlhhvJWX3QvwKFIOMW1uOIyWZFOE%3D&amp;reserved=0 
>>>>>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>> Cc: linux-media@vger.kernel.org
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>
>>>> Maybe we should remove cursor->fences altogether, but either way 
>>>> the patch is Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>
>>>> Please push to drm-misc-next ASAP.
>>>
>>> Not sure I can or if my push permissions are limited to Intel 
>>> branches. I can try once CI gives a green light.
>>
>> If it doesn't work just ping me and I will push it.
>
> It finally passed CI but it looks like you'll need to push it:

Done.

Christian.

>
> tursulin@tursulin-mobl2:~/wc/dim/src$ dim push-branch drm-misc-next
> Enumerating objects: 15, done.
> Counting objects: 100% (15/15), done.
> Delta compression using up to 8 threads
> Compressing objects: 100% (8/8), done.
> Writing objects: 100% (8/8), 2.32 KiB | 593.00 KiB/s, done.
> Total 8 (delta 7), reused 0 (delta 0), pack-reused 0
> error: remote unpack failed: unable to create temporary object directory
> To ssh://git.freedesktop.org/git/drm/drm-misc
>  ! [remote rejected]           drm-misc-next -> drm-misc-next 
> (unpacker error)
> error: failed to push some refs to 
> 'ssh://git.freedesktop.org/git/drm/drm-misc'
>
> Regards,
>
> Tvrtko
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

