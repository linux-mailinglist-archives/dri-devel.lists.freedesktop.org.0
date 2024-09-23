Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435197F01D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 20:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C7510E447;
	Mon, 23 Sep 2024 18:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WbJ7qRlx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985A310E447;
 Mon, 23 Sep 2024 18:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727114947; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kAKux5fgllw45BOzlVULkfs2QJa/V+gQ5/jg9sF93AsAlTNkbGAJeHqcKMa2jK2Wtq23q4tw8eiSszFAUVZpSHz/+OAG9tq7NUIG2Hk1C2x6Mvec/7HP3yHpbgYWl1BMGHGJbOosbHQTzK46LOhtEDtytX1Q3Kj2WeRbyoXo9pw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727114947;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=EdqQTQvs/DgboR8BhAv/2/yJgVWleI3c8OJ/BDgwMRg=; 
 b=BHt4rb8nO3SvQEWz9+B7DJ5Ergt2oMc8XLXgnD+rkxE7T61gt+kKwdtVvNG67++hl7ISEatNGhF+FP4vktcMXoSHooYLtH2xN0XBRXR5YUnr38YpV5LcDJyZFBchraim7CPRu9mcSkoHsWmU1JVQhgJQpdd8ieBqcgmrtcOs1aQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727114947; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=EdqQTQvs/DgboR8BhAv/2/yJgVWleI3c8OJ/BDgwMRg=;
 b=WbJ7qRlxRHkRnCP2mLYHdmv4mP/HPO1ggQMH2NMOE3I7fnmLG3YHrxQKxCulYm2k
 0NhiNLgE1hDegeL8vUFbDpXoOUvWZb0w7rTQydhLgDmIH1q8IzbGUQFysPgvcLJKvOg
 QOqgFaS1vVeRkJ+Rgur/GfAuJDVASvwHrVq5G3A4=
Received: by mx.zohomail.com with SMTPS id 1727114946260891.2232292317875;
 Mon, 23 Sep 2024 11:09:06 -0700 (PDT)
Message-ID: <b1544f77-17c3-40ca-a0a5-c061d6528435@collabora.com>
Date: Mon, 23 Sep 2024 21:09:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm: add DRM_SET_NAME ioctl
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-2-pierre-eric.pelloux-prayer@amd.com>
 <75f56ed0-206a-4e81-9972-38c29a3e20be@collabora.com>
 <d27cdff0-0432-4813-9948-752f6145bef7@damsy.net>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <d27cdff0-0432-4813-9948-752f6145bef7@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 9/23/24 19:29, Pierre-Eric Pelloux-Prayer wrote:
...
>>> @@ -78,12 +78,13 @@ static int drm_clients_info(struct seq_file *m,
>>> void *data)
>>>       kuid_t uid;
>>>         seq_printf(m,
>>> -           "%20s %5s %3s master a %5s %10s\n",
>>> +           "%20s %5s %3s master a %5s %10s %20s\n",
>>>              "command",
>>>              "tgid",
>>>              "dev",
>>>              "uid",
>>> -           "magic");
>>> +           "magic",
>>> +           "name");
>>>         /* dev->filelist is sorted youngest first, but we want to
>>> present
>>>        * oldest first (i.e. kernel, servers, clients), so walk
>>> backwardss.
>>> @@ -94,19 +95,22 @@ static int drm_clients_info(struct seq_file *m,
>>> void *data)
>>>           struct task_struct *task;
>>>           struct pid *pid;
>>>   +        mutex_lock(&priv->name_lock);
>>>           rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>>>           pid = rcu_dereference(priv->pid);
>>>           task = pid_task(pid, PIDTYPE_TGID);
>>>           uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>>> -        seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>>> +        seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %20s\n",
>>>                  task ? task->comm : "<unknown>",
>>>                  pid_vnr(pid),
>>>                  priv->minor->index,
>>>                  is_current_master ? 'y' : 'n',
>>>                  priv->authenticated ? 'y' : 'n',
>>>                  from_kuid_munged(seq_user_ns(m), uid),
>>> -               priv->magic);
>>> +               priv->magic,
>>> +               priv->name ?: "");
>>
>> There should be a default name similar to task->comm, like "<undefined>"
>> when not set. Perhaps also set name to task->comm by default.
> 
> Honestly I don't see much value in printing "<undefined>" or any other
> default value (+ task->comm is already printed above).

For a machine-parsed string in userspace there should be a value,
otherwise it won't be parseable if you'll add another parameter after
the name, AFAICT.

...
>>>   +static int drm_set_name(struct drm_device *dev, void *data,
>>> +            struct drm_file *file_priv)
>>> +{
>>> +    struct drm_set_name *name = data;
>>> +    void __user *user_ptr;
>>> +    char *new_name;
>>> +    size_t i, len;
>>> +
>>> +    if (name->name_len > DRM_NAME_MAX_LEN)
>>> +        return -EINVAL;
>>> +
>>> +    user_ptr = u64_to_user_ptr(name->name);
>>> +
>>> +    new_name = memdup_user_nul(user_ptr, name->name_len);
>>> +    if (IS_ERR(new_name))
>>> +        return PTR_ERR(new_name);
>>> +
>>> +    len = strlen(new_name);
>>
>> strnlen
> 
> memdup_user_nul returns a NUL-terminated string so I don't see much need
> for using strnlen.

Indeed

...
>>>   static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>>>   {
>>>       /* ROOT_ONLY is only for CAP_SYS_ADMIN */
>>> @@ -610,6 +656,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>>>       DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD,
>>> drm_prime_handle_to_fd_ioctl, DRM_RENDER_ALLOW),
>>>       DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE,
>>> drm_prime_fd_to_handle_ioctl, DRM_RENDER_ALLOW),
>>>   +    DRM_IOCTL_DEF(DRM_IOCTL_SET_NAME, drm_set_name,
>>> DRM_RENDER_ALLOW),
>>> +
>>>       DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES,
>>> drm_mode_getplane_res, 0),
>>>       DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_mode_getcrtc, 0),
>>>       DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_mode_setcrtc,
>>> DRM_MASTER),
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 8c0030c77308..df26eee8f79c 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -388,6 +388,15 @@ struct drm_file {
>>>        * Per-file buffer caches used by the PRIME buffer sharing code.
>>>        */
>>>       struct drm_prime_file_private prime;
>>> +
>>> +    /**
>>> +     * @name:
>>> +     *
>>> +     * Userspace-provided name; useful for accounting and debugging.
>>> +     */
>>> +    const char *name;
>>
>> I'd make the "name" string static, i.e. char name[DRM_NAME_MAX_LEN + 1].
>> That will prevent pointer deref troubles and no additional MM code
>> bloating will be needed.
>>
> 
> Sure, I can do that if others prefer this way too.

Note that in the other email I suggested to use strndup_user(), that
will remove the name-length limitation, but then the name var will
remain to be a string pointer. To me best option would be to replicate
how dma_buf_set_name works.

>>> +    /** @name_lock: Protects @name. */
>>> +    struct mutex name_lock;
>>
>> And then this lock isn't strictly needed anymore and can be removed if
>> "name" string is static.
> 
> The locking also prevents concurrent modification.

Right, locking still will be needed

>>>   };
>>>     /**
>>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>>> index 16122819edfe..f5e92e4f909b 100644
>>> --- a/include/uapi/drm/drm.h
>>> +++ b/include/uapi/drm/drm.h
>>> @@ -1024,6 +1024,13 @@ struct drm_crtc_queue_sequence {
>>>       __u64 user_data;    /* user data passed to event */
>>>   };
>>>   +#define DRM_NAME_MAX_LEN    64
>>
>> What about 63, to align data size to 64 bytes including the NULL byte.
> 
> Same as "const char *name;" vs "char name[...]": I don't mind updating
> the code as long as there's a consensus.
> 
>>
>>> +struct drm_set_name {
>>
>> drm_set_name sounds very generic, IMO. Maybe drm_context_set_name?
> 
> drm_client_set_name?
> (since other places use client, like drm_clients_info())

drm_client_set_name sounds good

-- 
Best regards,
Dmitry

