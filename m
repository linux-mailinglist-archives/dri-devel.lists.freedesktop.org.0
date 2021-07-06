Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C33BD889
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 16:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EA36E4DE;
	Tue,  6 Jul 2021 14:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F156E4DE;
 Tue,  6 Jul 2021 14:40:21 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id m15so7416610plx.7;
 Tue, 06 Jul 2021 07:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IQPIWc/c0+2ShSq50h2b41ngXFIaNGiDTzVj8B68k/o=;
 b=n6hufDiisg4uE/JhCcce91LhJk01wes6cD3y5wl+LeNuAYqHWsOp2cQs9LgXeQ/M6C
 CDYeeNnJoexnVFy4yMm5BwRz60noSkrlQeAtKHSRMurAnh0E5IaQJVGuUb8VrKM655GK
 01ZEDy3xyzH2gqXhUs/70EcqL2qnMtg0QX6GxmH0CiDdEU0TapnDignRZtkTJYnfh8x6
 skmlPQ4PTkHL2HsT7C6wFpthTtcaO3EisW/ndR8tKQNbPzR69kDfHV3Ig1oFYRvGsYTG
 1jufiZ//GL2uDOvb5KnOFbhkPFtyL1I7MDoWFrxkuywJ/HKl40j8FVEG/EI7fhLPs9Fp
 gauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IQPIWc/c0+2ShSq50h2b41ngXFIaNGiDTzVj8B68k/o=;
 b=DWnDc8uQLooMc8SB335mthdOWW3aXigQam2WaduYGmAUF5hemuO+2/fgVpp/akVckr
 SV/HwXzofMkVb+RWomq8KpaJMDkVhifWuoubSe4ua5CpuU27lE0LRwW94dqB2WCStsIA
 RzyhJ2V9cw9wzT8jONjviI8h27VbZY2U51nqQDGk10RHgfS/5ehnKRGEUXpw42LPFmYT
 /O8dqvAK2rOUyfgiEwfR3vWqrjih2T23j2wWGox6JYpjX9hkq6fwamjdwRDkXuuNtgkz
 kvzGxKnYVM980qloo2UVk8M53uhyKI8CPkhsdxW8cMoeHBOxx1xX+DVOjkKyeyvGxVa6
 DAWw==
X-Gm-Message-State: AOAM532ZkpjM6Mz/MXQ/pR8PirD15fU1L/pfv3qtH4zT4NM+ELW3/46g
 TwUzD6EPY1plumHQyduFlPE=
X-Google-Smtp-Source: ABdhPJwB8Ir+4nG1Revw6uT2qeUxdtVYg+s5W5mbFN4xEET6hrXNgCcX3mi97mZ736XXWN62uUCqhg==
X-Received: by 2002:a17:902:c38c:b029:128:fd55:f54b with SMTP id
 g12-20020a170902c38cb0290128fd55f54bmr17124695plg.24.1625582421281; 
 Tue, 06 Jul 2021 07:40:21 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id g38sm19058912pgg.63.2021.07.06.07.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 07:40:20 -0700 (PDT)
Subject: Re: [PATCH v7 0/5] drm: address potential UAF bugs with drm_master
 ptrs
To: Daniel Vetter <daniel@ffwll.ch>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 sumit.semwal@linaro.org, christian.koenig@amd.com
References: <20210701165358.19053-1-desmondcheongzx@gmail.com>
 <YN9kAFcfGoB13x7f@phenom.ffwll.local>
 <ae76290d-26e9-a011-dcdd-b5d48c80912e@gmail.com>
 <YOMYgytOSPM+D6eZ@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <59101934-8e71-a23c-b4c2-b69b0e0fe5bc@gmail.com>
Date: Tue, 6 Jul 2021 22:40:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOMYgytOSPM+D6eZ@phenom.ffwll.local>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/7/21 10:34 pm, Daniel Vetter wrote:
> On Mon, Jul 05, 2021 at 10:15:45AM +0800, Desmond Cheong Zhi Xi wrote:
>> On 3/7/21 3:07 am, Daniel Vetter wrote:
>>> On Fri, Jul 02, 2021 at 12:53:53AM +0800, Desmond Cheong Zhi Xi wrote:
>>>> This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
>>>> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
>>>>
>>>> The series is broken up into five patches:
>>>>
>>>> 1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.
>>>>
>>>> 2. Move a call to _drm_lease_held() out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find().
>>>>
>>>> 3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.
>>>>
>>>> 4. Serialize drm_file.master by introducing a new lock that's held whenever the value of drm_file.master changes.
>>>>
>>>> 5. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.
>>>>
>>>> Changes in v6 -> v7:
>>>> - Patch 2:
>>>> Modify code alignment as suggested by the intel-gfx CI.
>>>>
>>>> Update commit message based on the changes to patch 5.
>>>>
>>>> - Patch 4:
>>>> Add patch 4 to the series. This patch adds a new lock to serialize drm_file.master, in response to the lockdep splat by the intel-gfx CI.
>>>>
>>>> - Patch 5:
>>>> Move kerneldoc comment about protecting drm_file.master with drm_device.master_mutex into patch 4.
>>>>
>>>> Update drm_file_get_master to use the new drm_file.master_lock instead of drm_device.master_mutex, in response to the lockdep splat by the intel-gfx CI.
>>>
>>> So there's another one now because master->leases is protected by the
>>> mode_config.idr_mutex, and that's a bit awkward to untangle.
>>>
>>> Also I'm really surprised that there was now lockdep through the atomic
>>> code anywhere. The reason seems to be that somehow CI reboot first before
>>> it managed to run any of the kms_atomic tests, and we can only hit this
>>> when we go through the atomic kms ioctl, the legacy kms ioctl don't have
>>> that specific issue.
>>>
>>> Anyway I think this approach doesn't look too workable, and we need
>>> something new.
>>>
>>> But first things first: Are you still on board working on this? You
>>> started with a simple patch to fix a UAF bug, now we're deep into
>>> reworking tricky locking ... If you feel like you want out I'm totally
>>> fine with that.
>>>
>>
>> Hi Daniel,
>>
>> Thanks for asking, but I'm committed to seeing this through :) In fact, I
>> really appreciate all your guidance and patience as the simple patch evolved
>> into the current state of things.
> 
> Cool, it's definitely been fun trying to figure out a good solution for
> this tricky problem here :-)
> 
>>> Anyway, I think we need to split drm_device->master_mutex up into two
>>> parts:
>>>
>>> - One part that protects the actual access/changes, which I think for
>>>     simplicity we'll just leave as the current lock. That lock is a very
>>>     inner lock, since for the drm_lease.c stuff it has to nest within
>>>     mode_config.idr_mutex even.
>>>
>>> - Now the issue with checking master status/leases/whatever as an
>>>     innermost lock is that you can race, it's a classic time of check vs
>>>     time of use race: By the time we actually use the thing we validate
>>>     we'er allowed to use, we might now have access anymore. There's two
>>>     reasons for that:
>>>
>>>     * DROPMASTER ioctl could remove the master rights, which removes access
>>>       rights also for all leases
>>>
>>>     * REVOKE_LEASE ioctl can do the same but only for a specific lease
>>>
>>>     This is the thing we're trying to protect against in fbcon code, but
>>>     that's very spotty protection because all the ioctls by other users
>>>     aren't actually protected against this.
>>>
>>>     So I think for this we need some kind of big reader lock.
>>>
>>> Now for the implementation, there's a few things:
>>>
>>> - I think best option for this big reader lock would be to just use srcu.
>>>     We only need to flush out all current readers when we drop master or
>>>     revoke a lease, so synchronize_srcu is perfectly good enough for this
>>>     purpose.
>>>
>>> - The fbdev code would switch over to srcu in
>>>     drm_master_internal_acquire() and drm_master_internal_release(). Ofc
>>>     within drm_master_internal_acquire we'd still need to check master
>>>     status with the normal master_mutex.
>>>
>>> - While we revamp all this we should fix the ioctl checks in drm_ioctl.c.
>>>     Just noticed that drm_ioctl_permit() could and should be unexported,
>>>     last user was removed.
>>>
>>>     Within drm_ioctl_kernel we'd then replace the check for
>>>     drm_is_current_master with the drm_master_internal_acquire/release.
>>>
>>> - This alone does nothing, we still need to make sure that dropmaster and
>>>     revoke_lease ioctl flush out all other access before they return to
>>>     userspace. We can't just call synchronize_srcu because due to the ioctl
>>>     code in drm_ioctl_kernel we're in that sruc section, we'd need to add a
>>>     DRM_MASTER_FLUSH ioctl flag which we'd check only when DRM_MASTER is
>>>     set, and use to call synchronize_srcu. Maybe wrap that in a
>>>     drm_master_flush or so, or perhaps a drm_master_internal_release_flush.
>>>
>>> - Also maybe we should drop the _internal_ from that name. Feels a bit
>>>     wrong when we're also going to use this in the ioctl handler.
>>>
>>> Thoughts? Totally silly and overkill?
>>>
>>> Cheers, Daniel
>>>
>>>
>>
>> Just some thoughts on the previous approach before we move on to something
>> new. Regarding the lockdep warning for mode_config.idr_mutex, I think that's
>> resolvable now by simply removing patch 2, which is no longer really
>> necessary with the introduction of a new mutex at the bottom of the lock
>> hierarchy in patch 4.
> 
> Oh I missed that, this is essentially part-way to what I'm describing
> above.
> 
>> I was hesitant to create a new mutex (especially since this means that
>> drm_file.master is now protected by either of two mutexes), but it's
>> probably the smallest fix in terms of code churn. Is that approach no good?
> 
> That's the other approach I considered. It solves the use-after-free
> issue, but while I was musing all the different issues here I realized
> that we might as well use the opportunity to plug a few functional races
> around drm_device ownership rules.
> 

Ah, right, that sounds like a good thing to do. I suspect that I might 
have misunderstood what we're trying to achieve, so to clarify:

Is the issue that DROPMASTER ioctl/REVOKE_LEASE ioctl may be called 
concurrently with other ioctls, so we have to ensure that these other 
ioctl cmds are not running with outdated permissions (by ensuring 
they've been flushed out) once dropmaster/revoke_lease successfully 
return to the user?

If that's the case, then something that confuses me is why we'd want to 
use the srcu read lock in drm_master_internal_acquire. The function 
returns true only if dev->master is not set. Wouldn't this mean that 
between a successful call to drm_master_internal_acquire/release, 
there's no master that would be affected by DROPMASTER/REVOKE_LEASE?

I'm also confused as to how drm_master_internal_acquire/release can 
replace the check for drm_is_current_master.

> I do think it works. One thing I'd change is make it a spinlock - that
> wayy it's very clear that it's a tiny inner lock that's really only meant
> to protect the ->master pointer.
> >> Otherwise, on a high level, I think using an srcu mechanism makes a 
lot of
>> sense to me to address the issue of data items being reclaimed while some
>> readers still have references to them.
>>
>> The implementation details seem sound to me too, but I'll need to code it up
>> a bit before I can comment further.
> 
> So maybe this is complete overkill, but what about three locks :-)
> 
> - innermost spinlock, just to protect against use-after-free until we
>    successfully got a reference. Essentially this is the lookup lock -
>    maybe we could call it master_lookup_lock for clarity?
> 
> - mutex like we have right now to make sure master state is consistent
>    when someone races set/dropmaster in userspace. This would be the only
>    write lock we have.
> 
> - new srcu to make sure that after a dropmaster/revoke-lease all previous
>    users calls are flushed out with synchronize_srcu(). Essentially this
>    wouldn't be a lock, but more a barrier. So maybe should call it
>    master_barrier_srcu or so? fbdev emulation in drm_client would use this,
>    and also drm_ioctl code to plug the race I've spotted.
> 
> So maybe refresh your series with just the pieces you think we need for
> the master lookup spinlock, and we try to land that first?
> 

But besides the clarification above, this plan and the change to a 
spinlock sound good, I'll update the series accordingly.

> I do agree this should work against the use-after-free.
> 
> Cheers, Daniel
> 
>>
>> Best wishes,
>> Desmond
>>
>>>> Changes in v5 -> v6:
>>>> - Patch 2:
>>>> Add patch 2 to the series. This patch moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.
>>>>
>>>> - Patch 5:
>>>> Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.
>>>>
>>>> Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.
>>>>
>>>> Modify comparison to NULL into "!master", as suggested by the intel-gfx CI.
>>>>
>>>> Changes in v4 -> v5:
>>>> - Patch 1:
>>>> Add patch 1 to the series. The changes in patch 1 do not apply to stable because they apply to new changes in the drm-misc-next branch. This patch moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.
>>>>
>>>> Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.
>>>>
>>>> - Patch 3:
>>>> Move changes to drm_connector.c into patch 1.
>>>>
>>>> Changes in v3 -> v4:
>>>> - Patch 3:
>>>> Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/
>>>>
>>>> Additionally, inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.
>>>>
>>>> - Patch 5:
>>>> Modify kerneldoc formatting.
>>>>
>>>> Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.
>>>>
>>>> Changes in v2 -> v3:
>>>> - Patch 3:
>>>> Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.
>>>>
>>>> - Patch 5:
>>>> Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.
>>>>
>>>> Changes in v1 -> v2:
>>>> - Patch 5:
>>>> Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.
>>>>
>>>> Desmond Cheong Zhi Xi (5):
>>>>     drm: avoid circular locks in drm_mode_getconnector
>>>>     drm: separate locks in __drm_mode_object_find
>>>>     drm: add a locked version of drm_is_current_master
>>>>     drm: serialize drm_file.master with a master lock
>>>>     drm: protect drm_master pointers in drm_lease.c
>>>>
>>>>    drivers/gpu/drm/drm_auth.c        | 86 +++++++++++++++++++++++--------
>>>>    drivers/gpu/drm/drm_connector.c   |  5 +-
>>>>    drivers/gpu/drm/drm_file.c        |  1 +
>>>>    drivers/gpu/drm/drm_lease.c       | 81 ++++++++++++++++++++++-------
>>>>    drivers/gpu/drm/drm_mode_object.c | 10 ++--
>>>>    include/drm/drm_auth.h            |  1 +
>>>>    include/drm/drm_file.h            | 18 +++++--
>>>>    7 files changed, 153 insertions(+), 49 deletions(-)
>>>>
>>>> -- 
>>>> 2.25.1
>>>>
>>>
>>
> 

