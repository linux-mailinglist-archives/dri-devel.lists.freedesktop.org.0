Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E75D3D0787
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 06:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1A56E48F;
	Wed, 21 Jul 2021 04:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B4D6E48F;
 Wed, 21 Jul 2021 04:12:56 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id k20so692362pgg.7;
 Tue, 20 Jul 2021 21:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OweqAn0jjaaJ1nkpX09td2gsbVc7s9T7jQnGd97x/HU=;
 b=mQyzJWewVy53W2a4rYsw86+Kbq0Q0kylQKJAOe7JEYV/dim81wNt2bu3ZQ0+zlUkS3
 MeU7ue/ZtdwJVzG6bnbqwiWsNjmJgEcfYFFKfw5jGGlEl+iX2ruwyHc2BkO3xCAimcHF
 /U9fVrT4Kz+PrDrwmnganUCbjMV1NanHaBCC1xoXaVhShhNUowSzcadnREfXuTLGzm2I
 NHZEQgMmG0ul72tnmp4tvPteGAELhYf7Wz7QoUQpgkTQKxuMyZimaMSfbGOBfho0+oGT
 m43kOBcBE0njffTKaQrV/5ksIx4GEAc6M7xMHqBJnnd9Dkg9XaJu8dYkwFvde8l00IRa
 GEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OweqAn0jjaaJ1nkpX09td2gsbVc7s9T7jQnGd97x/HU=;
 b=kYhuL2mngWIDTMftXKIZjTYuDZjPDs58/5gchTI/opuu4FFQBFt2ddo5VYSS4ahEY9
 2m1VHw2TsR3hwts244CMKGV9b/dLs2BbgqBmmui4B2hQawAgmnENYnpsL4+RrzgdEYFR
 JAC+PRaIm1LMa5iaoer/yZsnWy4aS5FJiwrZXN49QHXh8P9qXrNwGhR7xV/AVPU+QPBd
 x9TlsTQlkSiFzhbljrrDElI7RZ+u+gKiZy3SNg075uryE3sS2nF56jYFPyknjZIMfUOB
 7UOzyHxcBqMT5OJs8U/a6TDGYXPMx24NAx/f2nAaPzUQTwqmSApTb3o4l00ZB7dlq1ua
 1kLg==
X-Gm-Message-State: AOAM530JiSNgf5+A64gTVYUJCdsZIVxSMfDVfykVLiHhgRWzUh/Q4dK2
 pK6tweUCaGL2WSbKysTU1iU=
X-Google-Smtp-Source: ABdhPJyiOMiOqi1c4EcFJnIcFX2VG125433D3Ouk72IpcFYjdlK34CJ4U4WYIZV4r3+SBCUmD0adUw==
X-Received: by 2002:a63:44a:: with SMTP id 71mr5536716pge.259.1626840775662;
 Tue, 20 Jul 2021 21:12:55 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id x7sm9124061pfn.70.2021.07.20.21.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 21:12:55 -0700 (PDT)
Subject: Re: [PATCH v8 0/5] drm: address potential UAF bugs with drm_master
 ptrs
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
 <YPcU3wJK7kC5b7kv@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <50c5582b-c674-4ef8-585f-7a3d78a49f85@gmail.com>
Date: Wed, 21 Jul 2021 12:12:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPcU3wJK7kC5b7kv@phenom.ffwll.local>
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/7/21 2:24 am, Daniel Vetter wrote:
> On Mon, Jul 12, 2021 at 12:35:03PM +0800, Desmond Cheong Zhi Xi wrote:
>> Hi,
>>
>> In the previous thread on this series we decided to remove a patch that was violating a lockdep requirement in drm_lease. In addition to this change, I took a closer look at the CI logs for the Basic Acceptance Tests and noticed that another regression was introduced. The new patch 2 is a response to this.
>>
>> Overall, this series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
>> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
>>
>> The series is broken up into five patches:
>>
>> 1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.
>>
>> 2. Move a call to drm_is_current_master() out from the RCU read-side critical section in drm_clients_info().
>>
>> 3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.
>>
>> 4. Serialize drm_file.master by introducing a new spinlock that's held whenever the value of drm_file.master changes.
>>
>> 5. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.
>>
>> v7 -> v8:
>> - Remove the patch that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find. This patch violated an existing lockdep requirement as reported by the intel-gfx CI.
>> - Added a new patch that moves a call to drm_is_current_master out from the RCU critical section in drm_clients_info. This was reported by the intel-gfx CI.
>>
>> v6 -> v7:
>> - Modify code alignment as suggested by the intel-gfx CI.
>> - Add a new patch to the series that adds a new lock to serialize drm_file.master, in response to the lockdep splat by the intel-gfx CI.
>> - Update drm_file_get_master to use the new drm_file.master_lock instead of drm_device.master_mutex, in response to the lockdep splat by the intel-gfx CI.
>>
>> v5 -> v6:
>> - Add a new patch to the series that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.
>> - Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.
>> - Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.
>> - Modify comparisons to NULL into "!master", as suggested by the intel-gfx CI.
>>
>> v4 -> v5:
>> - Add a new patch to the series that moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.
>> - Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.
>>
>> v3 -> v4:
>> - Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/
>> - Inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.
>> - Modify kerneldoc formatting for drm_file.master, as suggested by Daniel Vetter.
>> - Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.
>>
>> v2 -> v3:
>> - Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.
>> - Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.
>>
>> v1 -> v2:
>> - Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.
> 
> Apologies for the delay, I missed your series. Maybe just ping next time
> around there's silence.
> 
> Looks all great, merged to drm-misc-next. Given how complex this was I'm
> vary of just pushing this to -fixes without some solid testing.
> 

Hi Daniel,

Thanks for merging, more testing definitely sounds good to me.

> One thing I noticed is that drm_is_current_master could just use the
> spinlock, since it's only doing a read access. Care to type up that patch?
> 

I thought about this too, but I'm not sure if that's the best solution.

drm_is_current_master calls drm_lease_owner which then walks up the tree 
of master lessors. The spinlock protects the master of the current drm 
file, but subsequent lessors aren't protected without holding the 
device's master mutex.

> Also, do you plan to look into that idea we've discussed to flush pending
> access when we revoke a master or a lease? I think that would be really
> nice improvement here.
> -Daniel
> 

Yup, now that the potential UAFs are addressed (hopefully), I'll take a 
closer look and propose a patch for this.

Best wishes,
Desmond

>>
>> Desmond Cheong Zhi Xi (5):
>>    drm: avoid circular locks in drm_mode_getconnector
>>    drm: avoid blocking in drm_clients_info's rcu section
>>    drm: add a locked version of drm_is_current_master
>>    drm: serialize drm_file.master with a new spinlock
>>    drm: protect drm_master pointers in drm_lease.c
>>
>>   drivers/gpu/drm/drm_auth.c      | 93 ++++++++++++++++++++++++---------
>>   drivers/gpu/drm/drm_connector.c |  5 +-
>>   drivers/gpu/drm/drm_debugfs.c   |  3 +-
>>   drivers/gpu/drm/drm_file.c      |  1 +
>>   drivers/gpu/drm/drm_lease.c     | 81 +++++++++++++++++++++-------
>>   include/drm/drm_auth.h          |  1 +
>>   include/drm/drm_file.h          | 18 +++++--
>>   7 files changed, 152 insertions(+), 50 deletions(-)
>>
>> -- 
>> 2.25.1
>>
> 

