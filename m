Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BDBC828F1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 22:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F8A10E26A;
	Mon, 24 Nov 2025 21:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="PuALX11f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D3A10E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 21:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764020557; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hrEISD7cxN6XLjAc56w3d8ViPXeTufbLrTbVX2fMshUpyeBmmoQAUEVCpGej4vTynyrpGGmQedYXRNipFf+fGTWQ4e+fI2zFKCIDEkRMMXYRhjlhovgcjAbz8UZ//ITLiQdW0aT18puN5QD98e0/OPvMi/Ar8hH9obAhaCW8cvM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764020557;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8J6Dof0h5/uG+j1MC8a2dfCq0ykhpgwziCT/NjU5Nj8=; 
 b=nM1CDxzyVa2yCdwnBbeiNdP3Pd4V5iOrV/05VcRKZlW3puvE5egaGh0K4e1FuGFkcpYt4ZTCcQC/KflBCKet/MzMf90QW1UpLNaJf589LfkniIkoODFQbiH924ZlHOuP+CSInZOLneUAqSyEzcomRjJ3UylmrhU4BcasZrbdPgU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764020557; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=8J6Dof0h5/uG+j1MC8a2dfCq0ykhpgwziCT/NjU5Nj8=;
 b=PuALX11fKUBy8tNaiCl/4eeKFI31MHOOqLS3GEhOjZowJ9vaqsRau/diJ0YXgE5y
 xqMaVkr/WHAtx7PcmdHx0d5o0Bg6oDKgKlqcyZGhs0qvYKjuAfnmJh6LtJ5lHiZNlQW
 yPuibxZktuMDNVe9NrTxxGHqqlq6KVY/Z5crsI+s=
Received: by mx.zohomail.com with SMTPS id 176402055543586.26926620320785;
 Mon, 24 Nov 2025 13:42:35 -0800 (PST)
Message-ID: <8ed798a4-add1-49a8-ae80-349ef063784c@collabora.com>
Date: Tue, 25 Nov 2025 00:42:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-4-dongwon.kim@intel.com>
 <90f9c416-05d6-45f4-8205-027fc36e88e0@collabora.com>
 <55556365-4c6e-450c-89aa-9c49ede53b00@collabora.com>
 <PH0PR11MB5112533F30F495410F5E71AEFACDA@PH0PR11MB5112.namprd11.prod.outlook.com>
 <66183a1b-c724-41fe-ae90-4d73e5f2aa67@collabora.com>
 <PH0PR11MB51122A5436CF812363F1C614FAD4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <9df778af-76bf-439b-a66e-a4e9b809176a@collabora.com>
 <fc91634e-c6df-4486-bd91-bc3af62b2bbf@collabora.com>
 <PH0PR11MB511207F35B6FE86AA64ED739FAD5A@PH0PR11MB5112.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <PH0PR11MB511207F35B6FE86AA64ED739FAD5A@PH0PR11MB5112.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 11/22/25 00:19, Kim, Dongwon wrote:
> Hi Dmitry,
> 
>> -----Original Message-----
>> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Sent: Friday, November 21, 2025 1:04 PM
>> To: Kim, Dongwon <dongwon.kim@intel.com>; dri-devel@lists.freedesktop.org
>> Cc: airlied@redhat.com; kraxel@redhat.com; nirmoyd@nvidia.com
>> Subject: Re: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects after
>> hibernation
>>
>> On 11/21/25 21:12, Dmitry Osipenko wrote:
>>> Hi,
>>>
>>> On 11/20/25 04:41, Kim, Dongwon wrote:
>>>> Hi Dmitry,
>>>>
>>>>> -----Original Message-----
>>>>> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>> Sent: Friday, November 14, 2025 5:16 AM
>>>>> To: Kim, Dongwon <dongwon.kim@intel.com>; dri-
>>>>> devel@lists.freedesktop.org
>>>>> Cc: airlied@redhat.com; kraxel@redhat.com; nirmoyd@nvidia.com
>>>>> Subject: Re: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore
>>>>> objects after hibernation
>>>>>
>>>>> On 11/13/25 23:47, Kim, Dongwon wrote:
>>>>>>> One option could be to explicitly destroy all stored objs upon
>>>>>>> hibernation, that way the restoring will always work.
>>>>>> Yes, we can do it to avoid that corner case. Or maybe we can just
>>>>>> let it just
>>>>> run.
>>>>>> In this case, virtio_gpu_object_restore_all won't fail as shmem
>>>>>> init will still work but QEMU will justsend back errored replies as
>>>>>> all of those resources for BOs are still there in QEMU side but I
>>>>>> think it won't break anything. Do you see any issues in doing this
>>>>>> that I might be missing?? My assumption here is that the QEMU
>>>>>> hasn't done any of
>>>>> virtio-gpu resets here as hibernation failed.
>>>>>
>>>>> Correct, QEMU will emit a ton of "resource already exists" errors on
>>>>> aborted hibernation. There should be no errors neither from guest, nor
>> from host.
>>>>> Note that QEMU is not the only VMM using VirtIO-GPU.
>>>>>
>>>>> Two options here:
>>>>>
>>>>> 1. Destroy stored host resources upon hibernation 2. Extend
>>>>> hibernation core [1] with addition of PM_HIBERNATION_UNPREPARE event
>>>>> that will be invoked when hibernation fails, while
>>>>> PM_POST_HIBERNATION will be invoked only after a successful
>>>>> hibernation
>>>>>
>>>>> You may start with implementing the first option right away and
>>>>> later implement the second.
>>>>
>>>> I am testing the first method - send unref message to QEMU so that
>>>> connected resources can be all removed from QEMU. But I found out
>>>> there is cb that clean up the object once this unref is processed and
>>>> response is received. It means that we can't just remove the
>>>> resource/bo only in QEMU side. There is a way to do this though. We
>>>> can simply add one more fuction in virtgpu_vq.c that handles unref but with
>> cb = NULL. Is this what you want to try or do you have any better ideas?
>>> The cb certainly shall not be invoked. You only need to send the
>>> "DETACH" cmd to host. This should be akin to what I did in my older
>>> patches adding memory shmem shrinker support to virtio-gpu, please see
>>> [1] for inspiration.
>>>
>>> [1]
>>> https://lore.kernel.org/dri-devel/20231029230205.93277-26-dmitry.osipe
>>> nko@collabora.com/
>>
>> Actually, in your case it will be the "UNREF" cmd, not "DETACH". But the idea
>> in the same, you need to destroy resource only on host on suspend.
> 
> Yes, this is the point. Current unref command always comes with a callback that 
> cleans up virtio-gpu bo on the guest side. One way to avoid is to introduce another
> special version of unref that doesn't register any callback or.. I am wondering if
> we just make virtio-gpu driver ignores that callback in this specific situation (pre
> hibernation??). Either way looks like a dirty hack to me though. What do you think?

Add a new variant of virtio_gpu_cmd_unref_resource() that doesn't use
callback and then unref a bulk of BOs in one go.

-- 
Best regards,
Dmitry
