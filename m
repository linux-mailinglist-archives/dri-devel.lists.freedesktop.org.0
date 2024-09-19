Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F81E97CA83
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 15:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01A210E70C;
	Thu, 19 Sep 2024 13:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="HlSaHcvJ";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="CirY8fIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F8B10E702
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 13:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1726753978;
 bh=LM3bEgyCD5y65PbOZxGGwJT
 6mgQqPyVEMbvg3K1YI/g=; b=HlSaHcvJ7b8vNA3Kn1gh5guMw/CTQkzaq05xUC9QTgLtMb71DT
 jLThFNGZKBYKqTHNuvb6ZU+14v6w7f3j1wzOqj8muJL0+xgYrfnJh4S5bm5Io8kiEn4jETUfDfr
 Z5uB8VNYWBJQZQAi4rVvKJ36Dv0e65tKRNMDRuvKPwONRjelmyrt5x6NZ95Dl7TCRexSONiBtBj
 MbadndoGDkW3XPWg2UyVCi4OKz2PxXPrnleZDxtyUQ3KR8QYAkiw7SiFVUKwBV15NOMntNiprtc
 BAACfz8CxPyOmxekN42SrAfavCik8GwP3MJsxlJqttE5dfIGaYFBu2nIid1QGHmqfFw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1726753978; bh=LM3bEgyCD5y65PbOZxGGwJT
 6mgQqPyVEMbvg3K1YI/g=; b=CirY8fIFaqAAirMyE1RSI0B1Srx1TM1SeTbtujxFOUgCWd+1bk
 IOhOgDvr0oTYmmvW4CO1bPI9G0olUHgJomAg==;
Message-ID: <4e73aa28-c6b3-45e1-bf30-e17de5da7853@damsy.net>
Date: Thu, 19 Sep 2024 15:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm: add DRM_SET_NAME ioctl
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
 <0a5ca0c1-712e-481f-b7c2-02c76885fcb8@igalia.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <0a5ca0c1-712e-481f-b7c2-02c76885fcb8@igalia.com>
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



Le 16/09/2024 à 16:35, Tvrtko Ursulin a écrit :
> 
> On 16/09/2024 14:32, Pierre-Eric Pelloux-Prayer wrote:
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
>>   drivers/gpu/drm/drm_debugfs.c | 12 ++++++----
>>   drivers/gpu/drm/drm_file.c    |  5 +++++
>>   drivers/gpu/drm/drm_ioctl.c   | 42 +++++++++++++++++++++++++++++++++++
>>   include/drm/drm_file.h        |  9 ++++++++
>>   include/uapi/drm/drm.h        | 14 ++++++++++++
>>   5 files changed, 78 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 6b239a24f1df..b7492225ae88 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -78,12 +78,13 @@ static int drm_clients_info(struct seq_file *m, void *data)
>>       kuid_t uid;
>>       seq_printf(m,
>> -           "%20s %5s %3s master a %5s %10s\n",
>> +           "%20s %5s %3s master a %5s %10s %20s\n",
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
>> +               priv->name ? priv->name : "");
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
>> index 51f39912866f..b7d7bede0ab3 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -540,6 +540,46 @@ int drm_version(struct drm_device *dev, void *data,
>>       return err;
>>   }
>> +static int drm_set_name(struct drm_device *dev, void *data,
>> +            struct drm_file *file_priv)
>> +{
>> +    struct drm_set_name *name = data;
>> +    void *user_ptr;
> 
> __user as kernel test robot reminds us.

Fixed in v3.

> 
>> +    char *new_name;
>> +    size_t i, len;
>> +
>> +    if (name->name_len >= NAME_MAX)
>> +        return -EINVAL;
> 
> Maybe it is a bit unsubstantiated, but I am leaning towards a feeling of lets define own smaller 
> limit, like dma-buf does. If 32 is deemed too restrictive make it larger but 255 feels unnecessary. 
> But I don't feel to strongly about this so if people insist we need the names this long then so be it.

v3 has "#define DRM_NAME_MAX_LEN       64".

> 
>> +
>> +    user_ptr = u64_to_user_ptr(name->name);
>> +
>> +    new_name = memdup_user_nul(user_ptr, name->name_len);
>> +
> 
> Nit: I'd zap this blank line since it is breaking a logical group.

Done in v3.

> 
>> +    if (IS_ERR(new_name))
>> +        return PTR_ERR(new_name);
>> +
>> +    /* Filter out control char / spaces / new lines etc in the name
>> +     * since it's going to be used in dmesg or fdinfo's output.
>> +     */
> 
> Nit: Preferred kernel style for multi-line comments is:
> 
> /*
>   * Comment
>   */
> 
> Unless amdgpu preferes to stick with the above. I think I've seen both used so don't know.

Done in v3.

> 
>> +    len = strlen(new_name);
> 
> Made me think if it is worth cross-checking against name->name_len and reject on mismatch? Probably 
> yes.

Added to v3.

> 
>> +    for (i = 0; i < len; i++) {
>> +        if (!isgraph(new_name[i]))
>> +            new_name[i] = '-';
>> +    }
> 
> For completeness, alternative is to -EINVAL it. I have no strong opinions either way.

For now I've kept the filtering approach and added a comment about it in include/uapi/drm/drm.h.

> 
>> +
>> +    mutex_lock(&file_priv->name_lock);
>> +    kfree(file_priv->name);
>> +    if (len > 0) {
>> +        file_priv->name = new_name;
>> +    } else {
>> +        kfree(new_name);
>> +        file_priv->name = NULL;
> 
> FWIW you could not bother allocating new_file in this case.

I've kept the code as-is, I kind of prefer it done the way it is.

Thanks for your review,
Pierre-Eric

> 
> Regards,
> 
> Tvrtko
> 
>> +    }
>> +    mutex_unlock(&file_priv->name_lock);
>> +
>> +    return 0;
>> +}
>> +
>>   static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>>   {
>>       /* ROOT_ONLY is only for CAP_SYS_ADMIN */
>> @@ -610,6 +650,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
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
>> index 16122819edfe..fc62bb21f79e 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -1024,6 +1024,12 @@ struct drm_crtc_queue_sequence {
>>       __u64 user_data;    /* user data passed to event */
>>   };
>> +struct drm_set_name {
>> +    __u64 name_len;
>> +    __u64 name;
>> +};
>> +
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> @@ -1288,6 +1294,14 @@ extern "C" {
>>    */
>>   #define DRM_IOCTL_MODE_CLOSEFB        DRM_IOWR(0xD0, struct drm_mode_closefb)
>> +/**
>> + * DRM_IOCTL_SET_NAME - Attach a name to a drm_file
>> + *
>> + * This ioctl is similar to DMA_BUF_SET_NAME - it allows for easier tracking
>> + * and debugging.
>> + */
>> +#define DRM_IOCTL_SET_NAME        DRM_IOWR(0xD1, struct drm_set_name)
>> +
>>   /*
>>    * Device specific ioctls should only be in their respective headers
>>    * The device specific ioctl range is from 0x40 to 0x9f.
