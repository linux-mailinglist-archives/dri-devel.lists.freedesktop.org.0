Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31203D2112
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78526E867;
	Thu, 22 Jul 2021 09:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AC96E867;
 Thu, 22 Jul 2021 09:39:04 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id y3so3813040plp.4;
 Thu, 22 Jul 2021 02:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0h4qpRAXzA+tnQjutcsuPxSxuNasTcVoW8708jhFVjU=;
 b=rpol+XhdU0C0ekAoMgnU4wLTVJDEj6jD2h74KZ3hFtQMU7oxxiwF4ciMc4XACOrw5f
 jPgtlNgiSeYACyiMjvM4igj/zvh+AbOdrIIUy5KVZPEqFyb0mupcV3ZWUQkhhZepXua0
 CLEjlEruZPdBUy9ifDGXq5WYGyGnCkhgjt7ydyLSilywLMVzuDT842/LeVo+QKdCFBAt
 /VhRE0rYkcynBc9rcZ47JQB2iQnPVOoddQGMtiH9h5PPj9LXW+goL1AyZsfkAsmWaIFo
 vqvC6wvA0z6xkozkcNk15MN8vz4FA0P2YhHPVRWE2cuA1nuPguWC+w88paanlVT/d7mL
 OBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0h4qpRAXzA+tnQjutcsuPxSxuNasTcVoW8708jhFVjU=;
 b=IG4FN4w/QWBwx2Rplgwlr/wyGd4xI9dioHbVc+f53IFL+/ez/mhGJ0MrVe4QA72dH7
 hm4UvgrhXH86uHybcIIRBzRzJYHb2PkWK4Hbcfv5f7PT5jAyIh9TgevHUnWROEIJvlqj
 Twpjl3HFBg53qcOgJvvnq+Wduf1W8vMuPW7CGXxA7AQkgu2r7042fLsvuuOCO+ObUNQ3
 Ah69/zUvNxmu9/m/bb4TfVgAXmrQDWz5zCcCW5xW9XDW0yaNjfqmxr9HpldpVHUFTy4a
 R3ox2599eWLjYZagCeJNVQeROacrGujOVT5RKjpow6sejwWNGrl/nySzg+1SuyipRQGK
 FydA==
X-Gm-Message-State: AOAM530QLVhEyuthDr/o3E1oWnSDA8BZAjrhdiOWOokVTF0GdBiQZzfX
 QlzH7i8r66oA4s27Uxfv5/I=
X-Google-Smtp-Source: ABdhPJzWMA4lTKqhtS4n39p6cTdiDhvtBW4QGb/joh4jqBS567nJkQfUgQpqXeXK6EUyHkYTidyESg==
X-Received: by 2002:a63:4242:: with SMTP id p63mr40418090pga.185.1626946744421; 
 Thu, 22 Jul 2021 02:39:04 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 202sm30219004pfx.75.2021.07.22.02.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 02:39:03 -0700 (PDT)
Subject: Re: [PATCH v8 0/5] drm: address potential UAF bugs with drm_master
 ptrs
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
 <YPcU3wJK7kC5b7kv@phenom.ffwll.local>
 <50c5582b-c674-4ef8-585f-7a3d78a49f85@gmail.com>
 <CAKMK7uGvb3O9Ypd73xZf6bdMcXJyGJw4C7GXGprkZLpN9Gx7qQ@mail.gmail.com>
 <52c4207a-6830-01c9-a28c-635c68de3e14@gmail.com>
 <CAKMK7uF4Y+WbiXWyvn1em4=xZAFvBusRhxYg9ue5TE003tovbA@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <d551e389-77e5-94d4-7234-c421d99d8bf9@gmail.com>
Date: Thu, 22 Jul 2021 17:38:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF4Y+WbiXWyvn1em4=xZAFvBusRhxYg9ue5TE003tovbA@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/7/21 9:23 pm, Daniel Vetter wrote:
> On Wed, Jul 21, 2021 at 2:44 PM Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
>> On 21/7/21 6:29 pm, Daniel Vetter wrote:
>>> On Wed, Jul 21, 2021 at 6:12 AM Desmond Cheong Zhi Xi
>>> <desmondcheongzx@gmail.com> wrote:
>>>> On 21/7/21 2:24 am, Daniel Vetter wrote:
>>>>> On Mon, Jul 12, 2021 at 12:35:03PM +0800, Desmond Cheong Zhi Xi wrote:
>>>>>> Hi,
>>>>>>
>>>>>> In the previous thread on this series we decided to remove a patch that was violating a lockdep requirement in drm_lease. In addition to this change, I took a closer look at the CI logs for the Basic Acceptance Tests and noticed that another regression was introduced. The new patch 2 is a response to this.
>>>>>>
>>>>>> Overall, this series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
>>>>>> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
>>>>>>
>>>>>> The series is broken up into five patches:
>>>>>>
>>>>>> 1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.
>>>>>>
>>>>>> 2. Move a call to drm_is_current_master() out from the RCU read-side critical section in drm_clients_info().
>>>>>>
>>>>>> 3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.
>>>>>>
>>>>>> 4. Serialize drm_file.master by introducing a new spinlock that's held whenever the value of drm_file.master changes.
>>>>>>
>>>>>> 5. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.
>>>>>>
>>>>>> v7 -> v8:
>>>>>> - Remove the patch that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find. This patch violated an existing lockdep requirement as reported by the intel-gfx CI.
>>>>>> - Added a new patch that moves a call to drm_is_current_master out from the RCU critical section in drm_clients_info. This was reported by the intel-gfx CI.
>>>>>>
>>>>>> v6 -> v7:
>>>>>> - Modify code alignment as suggested by the intel-gfx CI.
>>>>>> - Add a new patch to the series that adds a new lock to serialize drm_file.master, in response to the lockdep splat by the intel-gfx CI.
>>>>>> - Update drm_file_get_master to use the new drm_file.master_lock instead of drm_device.master_mutex, in response to the lockdep splat by the intel-gfx CI.
>>>>>>
>>>>>> v5 -> v6:
>>>>>> - Add a new patch to the series that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.
>>>>>> - Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.
>>>>>> - Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.
>>>>>> - Modify comparisons to NULL into "!master", as suggested by the intel-gfx CI.
>>>>>>
>>>>>> v4 -> v5:
>>>>>> - Add a new patch to the series that moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.
>>>>>> - Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.
>>>>>>
>>>>>> v3 -> v4:
>>>>>> - Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/
>>>>>> - Inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.
>>>>>> - Modify kerneldoc formatting for drm_file.master, as suggested by Daniel Vetter.
>>>>>> - Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.
>>>>>>
>>>>>> v2 -> v3:
>>>>>> - Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.
>>>>>> - Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.
>>>>>>
>>>>>> v1 -> v2:
>>>>>> - Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.
>>>>>
>>>>> Apologies for the delay, I missed your series. Maybe just ping next time
>>>>> around there's silence.
>>>>>
>>>>> Looks all great, merged to drm-misc-next. Given how complex this was I'm
>>>>> vary of just pushing this to -fixes without some solid testing.
>>>>>
>>>>
>>>> Hi Daniel,
>>>>
>>>> Thanks for merging, more testing definitely sounds good to me.
>>>>
>>>>> One thing I noticed is that drm_is_current_master could just use the
>>>>> spinlock, since it's only doing a read access. Care to type up that patch?
>>>>>
>>>>
>>>> I thought about this too, but I'm not sure if that's the best solution.
>>>>
>>>> drm_is_current_master calls drm_lease_owner which then walks up the tree
>>>> of master lessors. The spinlock protects the master of the current drm
>>>> file, but subsequent lessors aren't protected without holding the
>>>> device's master mutex.
>>>
>>> But this isn't a fpriv->master pointer, but a master->lessor pointer.
>>> Which should never ever be able to change (we'd have tons of uaf bugs
>>> around drm_lease_owner otherwise). So I don't think there's anything
>>> that dev->master_lock protects here that fpriv->master_lookup_lock
>>> doesn't protect already?
>>>
>>> Or am I missing something?
>>>   > The comment in the struct drm_master says it's protected by
>>> mode_config.idr_mutex, but that only applies to the idrs and lists I
>>> think.
>>>
>>
>> Ah you're right, I also completely forgot that lessees hold a reference
>> to their lessor so nothing will be freed as long as the spinlock is
>> held. I'll prepare that patch then, thanks for pointing it out.
> 
> btw since we now looked at all this in detail, can you perhaps do a
> patch to update the kerneldoc for all the lease fields in struct
> drm_master? I think moving them to the inline style and then adding
> comments for each field how locking/lifetime rules work would be
> really good. Since right now it's all fresh from for us.
> -Daniel
> 

Sure thing. Just sent out the suggested changes in the same series, 
along with a relevant fix for drm/vmwgfx that I just noticed.

>>>>> Also, do you plan to look into that idea we've discussed to flush pending
>>>>> access when we revoke a master or a lease? I think that would be really
>>>>> nice improvement here.
>>>>> -Daniel
>>>>>
>>>>
>>>> Yup, now that the potential UAFs are addressed (hopefully), I'll take a
>>>> closer look and propose a patch for this.
>>>
>>> Thanks a lot.
>>> -Daniel
>>>
>>>>
>>>> Best wishes,
>>>> Desmond
>>>>
>>>>>>
>>>>>> Desmond Cheong Zhi Xi (5):
>>>>>>      drm: avoid circular locks in drm_mode_getconnector
>>>>>>      drm: avoid blocking in drm_clients_info's rcu section
>>>>>>      drm: add a locked version of drm_is_current_master
>>>>>>      drm: serialize drm_file.master with a new spinlock
>>>>>>      drm: protect drm_master pointers in drm_lease.c
>>>>>>
>>>>>>     drivers/gpu/drm/drm_auth.c      | 93 ++++++++++++++++++++++++---------
>>>>>>     drivers/gpu/drm/drm_connector.c |  5 +-
>>>>>>     drivers/gpu/drm/drm_debugfs.c   |  3 +-
>>>>>>     drivers/gpu/drm/drm_file.c      |  1 +
>>>>>>     drivers/gpu/drm/drm_lease.c     | 81 +++++++++++++++++++++-------
>>>>>>     include/drm/drm_auth.h          |  1 +
>>>>>>     include/drm/drm_file.h          | 18 +++++--
>>>>>>     7 files changed, 152 insertions(+), 50 deletions(-)
>>>>>>
>>>>>> --
>>>>>> 2.25.1
>>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 
> 

