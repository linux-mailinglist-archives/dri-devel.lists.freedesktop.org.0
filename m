Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8EE3F12C7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 07:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049236E874;
	Thu, 19 Aug 2021 05:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160678952F;
 Thu, 19 Aug 2021 05:31:58 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso3944473pjy.5; 
 Wed, 18 Aug 2021 22:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CFAh2ohJN76u6Eruh33dHQq9ass8KChMC1IajJFgPH8=;
 b=HYJgzpgvWaAw7btZx7v+sX1ebqDpXWCM6m12POBpIsuzItZ06SvUkJuPbKSrk3FuUc
 oamxPO8fPNZoUWWvVhUe6rkiV+DYt4vrGo9UKMbe/DJzyAfx8pVYL9oT7wzEDEaT/S91
 MmLakU9Uc62a1+VqiSNx91xei08VB93GtjMoJBPhYeX1dBjzDD3H5aGUw6MbhZ1YAJMp
 edbzJMAQUCan7g7Pb4YcfY8ahN+yNPwK2RvCSSwdgqkVqiEWtb0r94XSsLROR+zdX6oL
 +zvE2OvSSn57qPUP3aFejiG5nF2zHujYVVjjWPVvVKzuYc/oIodXR+Uo9xiPffPqY+S6
 3eMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CFAh2ohJN76u6Eruh33dHQq9ass8KChMC1IajJFgPH8=;
 b=rKHbPvqCYU5LZS7oU6ocX9SzMHERkAEIDaSWdD9K5m0E6ay0veXsA9CNYHu0eJQTeu
 fDJ9QHFLEeK5LAWedrDkpwope+eomCsEOEDLEIfyBtdlP0JYt/cW6+xH6RznYVYhFdDO
 5Q94dEytefP75EnyF0oPnDfwenuVM60x4nrpvttJRSmRF7GbUIWuGwklTaGsjn1qGaFg
 SmRgjmBXo4jFkmtFZULriDx6fV4NAXpwlbaDFYk7zibAtVBbEjw/k8Ycyjr7MHaSHS6h
 PNoheuyyz7WMcXhUlzCVtR6UYlJIkvwDjYVjJ1C0AywAuokwdRJzu4xWf6h7H5RezdZB
 gubA==
X-Gm-Message-State: AOAM531hkHJhnDLyanzTKOmrHi8T6flUWG0DgYRFP0CKFV3eF+5sNVXD
 K32WzCUWbvOIaAp3up5d0ng=
X-Google-Smtp-Source: ABdhPJzHWe7IqBDZJBR5DhOXYwVbuf1qus5KD/vagYpAW2JTmvesSwzD7dXboeZyB3QuDoSce3EDfQ==
X-Received: by 2002:a17:90a:9f91:: with SMTP id
 o17mr12909893pjp.29.1629351117654; 
 Wed, 18 Aug 2021 22:31:57 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id s26sm1873118pgv.46.2021.08.18.22.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 22:31:57 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 4/9] drm: fix potential null ptr
 dereferences in drm_{auth, ioctl}
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@linux.ie>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>,
 walter-zh.wu@mediatek.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-5-desmondcheongzx@gmail.com>
 <YRzcuiQrLFsWowas@phenom.ffwll.local>
 <53a63ac8-f2de-91f7-4e0f-20b0f3f61d52@gmail.com>
 <CAKMK7uG+nqnkNd56WPhze3V=e1ioL0PTLQxveBofQT3gNPB9HA@mail.gmail.com>
Message-ID: <18df91cb-3948-f4f4-d548-8d23107540ae@gmail.com>
Date: Thu, 19 Aug 2021 13:31:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG+nqnkNd56WPhze3V=e1ioL0PTLQxveBofQT3gNPB9HA@mail.gmail.com>
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

On 19/8/21 12:33 am, Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 5:37 PM Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
>>
>> On 18/8/21 6:11 pm, Daniel Vetter wrote:
>>> On Wed, Aug 18, 2021 at 03:38:19PM +0800, Desmond Cheong Zhi Xi wrote:
>>>> There are three areas where we dereference struct drm_master without
>>>> checking if the pointer is non-NULL.
>>>>
>>>> 1. drm_getmagic is called from the ioctl_handler. Since
>>>> DRM_IOCTL_GET_MAGIC has no ioctl flags, drm_getmagic is run without
>>>> any check that drm_file.master has been set.
>>>>
>>>> 2. Similarly, drm_getunique is called from the ioctl_handler, but
>>>> DRM_IOCTL_GET_UNIQUE has no ioctl flags. So there is no guarantee that
>>>> drm_file.master has been set.
>>>
>>> I think the above two are impossible, due to the refcounting rules for
>>> struct file.
>>>
>>
>> Right, will drop those two parts from the patch.
>>
>>>> 3. drm_master_release can also be called without having a
>>>> drm_file.master set. Here is one error path:
>>>>     drm_open():
>>>>       drm_open_helper():
>>>>         drm_master_open():
>>>>           drm_new_set_master(); <--- returns -ENOMEM,
>>>>                                      drm_file.master not set
>>>>         drm_file_free():
>>>>           drm_master_release(); <--- NULL ptr dereference
>>>>                                      (file_priv->master->magic_map)
>>>>
>>>> Fix these by checking if the master pointers are NULL before use.
>>>>
>>>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_auth.c  | 16 ++++++++++++++--
>>>>    drivers/gpu/drm/drm_ioctl.c |  5 +++++
>>>>    2 files changed, 19 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>>>> index f9267b21556e..b7230604496b 100644
>>>> --- a/drivers/gpu/drm/drm_auth.c
>>>> +++ b/drivers/gpu/drm/drm_auth.c
>>>> @@ -95,11 +95,18 @@ EXPORT_SYMBOL(drm_is_current_master);
>>>>    int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>>>>    {
>>>>       struct drm_auth *auth = data;
>>>> +    struct drm_master *master;
>>>>       int ret = 0;
>>>>
>>>>       mutex_lock(&dev->master_mutex);
>>>> +    master = file_priv->master;
>>>> +    if (!master) {
>>>> +            mutex_unlock(&dev->master_mutex);
>>>> +            return -EINVAL;
>>>> +    }
>>>> +
>>>>       if (!file_priv->magic) {
>>>> -            ret = idr_alloc(&file_priv->master->magic_map, file_priv,
>>>> +            ret = idr_alloc(&master->magic_map, file_priv,
>>>>                               1, 0, GFP_KERNEL);
>>>>               if (ret >= 0)
>>>>                       file_priv->magic = ret;
>>>> @@ -355,8 +362,12 @@ void drm_master_release(struct drm_file *file_priv)
>>>>
>>>>       mutex_lock(&dev->master_mutex);
>>>>       master = file_priv->master;
>>>> +
>>>> +    if (!master)
>>>> +            goto unlock;
>>>
>>> This is a bit convoluted, since we're in the single-threaded release path
>>> we don't need any locking for file_priv related things. Therefore we can
>>> pull the master check out and just directly return.
>>>
>>> But since it's a bit surprising maybe a comment that this can happen when
>>> drm_master_open in drm_open_helper fails?
>>>
>>
>> Sounds good. This can actually also happen in the failure path of
>> mock_drm_getfile if anon_inode_getfile fails. I'll leave a short note
>> about both of them.
>>
>>> Another option, and maybe cleaner, would be to move the drm_master_release
>>> from drm_file_free into drm_close_helper. That would be fully symmetrical
>>> and should also fix the bug here?
>>> -Daniel
>>>
>> Hmmm maybe the first option to move the check out of the lock might be
>> better. If I'm not wrong, we would otherwise also need to move
>> drm_master_release into drm_client_close.
> 
> Do we have to?
> 
> If I haven't missed anything, the drm_client stuff only calls
> drm_file_alloc and doesn't set up a master. So this should work?
> -Daniel
> 

Ahhhh ok yes, I understand what's going on better now. I think you're 
right, moving drm_master_release into drm_close_helper should fix all 
the places it can go wrong.

>>
>>>
>>>> +
>>>>       if (file_priv->magic)
>>>> -            idr_remove(&file_priv->master->magic_map, file_priv->magic);
>>>> +            idr_remove(&master->magic_map, file_priv->magic);
>>>>
>>>>       if (!drm_is_current_master_locked(file_priv))
>>>>               goto out;
>>>> @@ -379,6 +390,7 @@ void drm_master_release(struct drm_file *file_priv)
>>>>               drm_master_put(&file_priv->master);
>>>>               spin_unlock(&dev->master_lookup_lock);
>>>>       }
>>>> +unlock:
>>>>       mutex_unlock(&dev->master_mutex);
>>>>    }
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>>>> index 26f3a9ede8fe..4d029d3061d9 100644
>>>> --- a/drivers/gpu/drm/drm_ioctl.c
>>>> +++ b/drivers/gpu/drm/drm_ioctl.c
>>>> @@ -121,6 +121,11 @@ int drm_getunique(struct drm_device *dev, void *data,
>>>>
>>>>       mutex_lock(&dev->master_mutex);
>>>>       master = file_priv->master;
>>>> +    if (!master) {
>>>> +            mutex_unlock(&dev->master_mutex);
>>>> +            return -EINVAL;
>>>> +    }
>>>> +
>>>>       if (u->unique_len >= master->unique_len) {
>>>>               if (copy_to_user(u->unique, master->unique, master->unique_len)) {
>>>>                       mutex_unlock(&dev->master_mutex);
>>>> --
>>>> 2.25.1
>>>>
>>>
>>
> 
> 

