Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A45984060
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C804510E6A9;
	Tue, 24 Sep 2024 08:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="PIxlJ6Ss";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="h0OdpMFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EE110E68B;
 Tue, 24 Sep 2024 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1727166162;
 bh=c8mxu2J7XQbwZH/zuCa7+Bp
 zRE/zjDQa3rgD7ejoNl0=; b=PIxlJ6Ssz2Yaft0PNytSRnvYF1Prwvaf1Tkf9GDHME+S9xPwin
 uwQSj8zawLvcRwL/OPNuvAPoUHfc7lG9vXYM9/dmMbm7KGjxFVU8HcBLm8PbrNVADApsalN3VrM
 36uKkzfHNDodf5THkG5lHZprLoi9TGY5M5ilVc7xAfX7SJ8AAJMhYpzG+3Ics51vUDkn9s/3hNS
 ot5V5S6syKHN598zGBJstpWjgfzkdfl4fuOnT5fMMWED/hbLONgdsQ5p/V+4Ekj7v7XcDBPsMGd
 QZVA1IpLP+m7i7pQ9wNSUCEvgpD4FNcQloN3LkqmbOtx1JBktDVIutfTa+Ld+LVUMyg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1727166162; bh=c8mxu2J7XQbwZH/zuCa7+Bp
 zRE/zjDQa3rgD7ejoNl0=; b=h0OdpMFtrtwbeG0KHW67R4CM/SUrSktE1UDDikOb15YoaSkb1+
 80PA3m9kLHcLfV90b3PZFU6bB1IdQCinRdCQ==;
Message-ID: <f1eb34cd-353c-4d70-975d-e2f691f73a8e@damsy.net>
Date: Tue, 24 Sep 2024 10:22:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm: add DRM_SET_NAME ioctl
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-2-pierre-eric.pelloux-prayer@amd.com>
 <7e33063e-7b5c-464a-a572-9a7817a9b9b3@igalia.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <7e33063e-7b5c-464a-a572-9a7817a9b9b3@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 23/09/2024 à 12:06, Tvrtko Ursulin a écrit :
> 
> On 20/09/2024 10:06, Pierre-Eric Pelloux-Prayer wrote:
>> Giving the opportunity to userspace to associate a free-form
>> name with a drm_file struct is helpful for tracking and debugging.
>>
>> This is similar to the existing DMA_BUF_SET_NAME ioctl.
>>
>> Access to name is protected by a mutex, and the 'clients' debugfs
>> file has been updated to print it.
>>
>> Userspace MR to use this ioctl:
>>     https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428
>>
>> The string passed by userspace is filtered a bit, to avoid messing
>> output when it's going to be printed (in dmesg, fdinfo, etc):
>>    * all chars failing isgraph() are replaced by '-'
>>    * if a 0-length string is passed the name is cleared
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c | 12 ++++++---
>>   drivers/gpu/drm/drm_file.c    |  5 ++++
>>   drivers/gpu/drm/drm_ioctl.c   | 48 +++++++++++++++++++++++++++++++++++
>>   include/drm/drm_file.h        |  9 +++++++
>>   include/uapi/drm/drm.h        | 17 +++++++++++++
>>   5 files changed, 87 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 6b239a24f1df..482e71160544 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -78,12 +78,13 @@ static int drm_clients_info(struct seq_file *m, void *data)
>>       kuid_t uid;
>>       seq_printf(m,
>> -           "%20s %5s %3s master a %5s %10s\n",
>> +           "%20s %5s %3s master a %5s %10s %20s\n",
> 
> Allow full DRM_NAME_MAX_LEN? Not sure, feels not very consequential either way.

I'll switch to:

         seq_printf(m,
                    "%20s %5s %3s master a %5s %10s %*s\n",
                    "command",
                    "tgid",
                    "dev",
                    "uid",
                    "magic",
                    DRM_CLIENT_NAME_MAX_LEN,
                    "name");

And:

                 seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s\n",
                            task ? task->comm : "<unknown>",
                            pid_vnr(pid),
                            priv->minor->index,
                            is_current_master ? 'y' : 'n',
                            priv->authenticated ? 'y' : 'n',
                            from_kuid_munged(seq_user_ns(m), uid),
                            priv->magic,
                            DRM_CLIENT_NAME_MAX_LEN,
                            priv->client_name ? priv->client_name : "<unset>");


> 
>>              "command",
>>              "tgid",
>>              "dev",
>>              "uid",
>> -           "magic");
>> +           "magic",
>> +           "name");
>>       /* dev->filelist is sorted youngest first, but we want to present
>>        * oldest first (i.e. kernel, servers, clients), so walk backwardss.
>> @@ -94,19 +95,22 @@ static int drm_clients_info(struct seq_file *m, void *data)
>>           struct task_struct *task;
>>           struct pid *pid;
>> +        mutex_lock(&priv->name_lock);
>>           rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>>           pid = rcu_dereference(priv->pid);
>>           task = pid_task(pid, PIDTYPE_TGID);
>>           uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>> -        seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>> +        seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %20s\n",
>>                  task ? task->comm : "<unknown>",
>>                  pid_vnr(pid),
>>                  priv->minor->index,
>>                  is_current_master ? 'y' : 'n',
>>                  priv->authenticated ? 'y' : 'n',
>>                  from_kuid_munged(seq_user_ns(m), uid),
>> -               priv->magic);
>> +               priv->magic,
>> +               priv->name ?: "");
>>           rcu_read_unlock();
>> +        mutex_unlock(&priv->name_lock);
>>       }
>>       mutex_unlock(&dev->filelist_mutex);
>>       return 0;
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 01fde94fe2a9..e9dd0e90a1f9 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -158,6 +158,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>       spin_lock_init(&file->master_lookup_lock);
>>       mutex_init(&file->event_read_lock);
>> +    mutex_init(&file->name_lock);
>>       if (drm_core_check_feature(dev, DRIVER_GEM))
>>           drm_gem_open(dev, file);
>> @@ -259,6 +260,10 @@ void drm_file_free(struct drm_file *file)
>>       WARN_ON(!list_empty(&file->event_list));
>>       put_pid(rcu_access_pointer(file->pid));
>> +
>> +    mutex_destroy(&file->name_lock);
>> +    kfree(file->name);
>> +
>>       kfree(file);
>>   }
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index 51f39912866f..46dadbd1bb35 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -540,6 +540,52 @@ int drm_version(struct drm_device *dev, void *data,
>>       return err;
>>   }
>> +static int drm_set_name(struct drm_device *dev, void *data,
>> +            struct drm_file *file_priv)
>> +{
>> +    struct drm_set_name *name = data;
>> +    void __user *user_ptr;
>> +    char *new_name;
>> +    size_t i, len;
>> +
>> +    if (name->name_len > DRM_NAME_MAX_LEN)
>> +        return -EINVAL;
>> +
>> +    user_ptr = u64_to_user_ptr(name->name);
>> +
>> +    new_name = memdup_user_nul(user_ptr, name->name_len);
>> +    if (IS_ERR(new_name))
>> +        return PTR_ERR(new_name);
>> +
>> +    len = strlen(new_name);
>> +
>> +    if (len != name->name_len) {
>> +        kfree(new_name);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * Filter out control char / spaces / new lines etc in the name
>> +     * since it's going to be used in dmesg or fdinfo's output.
>> +     */
>> +    for (i = 0; i < len; i++) {
>> +        if (!isgraph(new_name[i]))
>> +            new_name[i] = '-';
>> +    }
>> +
>> +    mutex_lock(&file_priv->name_lock);
>> +    kfree(file_priv->name);
>> +    if (len > 0) {
>> +        file_priv->name = new_name;
>> +    } else {
>> +        kfree(new_name);
>> +        file_priv->name = NULL;
>> +    }
>> +    mutex_unlock(&file_priv->name_lock);
>> +
>> +    return 0;
>> +}
>> +
>>   static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>>   {
>>       /* ROOT_ONLY is only for CAP_SYS_ADMIN */
>> @@ -610,6 +656,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>>       DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD, drm_prime_handle_to_fd_ioctl, DRM_RENDER_ALLOW),
>>       DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, drm_prime_fd_to_handle_ioctl, DRM_RENDER_ALLOW),
>> +    DRM_IOCTL_DEF(DRM_IOCTL_SET_NAME, drm_set_name, DRM_RENDER_ALLOW),
>> +
>>       DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES, drm_mode_getplane_res, 0),
>>       DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_mode_getcrtc, 0),
>>       DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_mode_setcrtc, DRM_MASTER),
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 8c0030c77308..df26eee8f79c 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -388,6 +388,15 @@ struct drm_file {
>>        * Per-file buffer caches used by the PRIME buffer sharing code.
>>        */
>>       struct drm_prime_file_private prime;
>> +
>> +    /**
>> +     * @name:
>> +     *
>> +     * Userspace-provided name; useful for accounting and debugging.
>> +     */
>> +    const char *name;
>> +    /** @name_lock: Protects @name. */
>> +    struct mutex name_lock;
>>   };
>>   /**
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index 16122819edfe..f5e92e4f909b 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -1024,6 +1024,13 @@ struct drm_crtc_queue_sequence {
>>       __u64 user_data;    /* user data passed to event */
>>   };
>> +#define DRM_NAME_MAX_LEN    64
>> +struct drm_set_name {
>> +    __u64 name_len;
>> +    __u64 name;
>> +};
>> +
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> @@ -1288,6 +1295,16 @@ extern "C" {
>>    */
>>   #define DRM_IOCTL_MODE_CLOSEFB        DRM_IOWR(0xD0, struct drm_mode_closefb)
>> +/**
>> + * DRM_IOCTL_SET_NAME - Attach a name to a drm_file
>> + *
>> + * This ioctl is similar to DMA_BUF_SET_NAME - it allows for easier tracking
>> + * and debugging.
>> + * The length of the name must <= DRM_NAME_MAX_LEN. All characters that are
>> + * non-printable or whitespaces will be replaced by -.
>> + */
>> +#define DRM_IOCTL_SET_NAME        DRM_IOWR(0xD1, struct drm_set_name)
>> +
> 
> A comment, nice! :) Overal looks good to me.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> I do however wish for more opinions (before merging) on whether strings with invalid characters 
> should perhaps instead be rejected. I don't currently have a solid argument either way.
> 
> Perhaps the only argument against silent transformation is if someone sets some wild string, then 
> greps for it somewhere, which would be a false negative without the understanding of what kind of 
> remapping kernel does. It is weak but it is uapi so worth discussing every crazy possibility I think.
> 
> On the other hand it would create another annoying source of EINVAL. :shrug:

No strong feelings either, but I agree that gathering more opinions before merging would be useful.

> 
> Also, how are with with testing the DRM core features? Add something for the uapi in 
> IGT/tests/drm_client_name, or some such?

Something like using the ioctl and then reading back the name using /sys/kernel/debug/dri/0/clients?
I can do that if it's required / useful.

Thanks,
Pierre-Eric

> 
> Regards,
> 
> Tvrtko
> 
>>   /*
>>    * Device specific ioctls should only be in their respective headers
>>    * The device specific ioctl range is from 0x40 to 0x9f.
