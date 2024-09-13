Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E38977FCC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 14:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A278F10ED10;
	Fri, 13 Sep 2024 12:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="P3Rq8MxE";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="vFlp/LtF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACC610ED10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 12:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1726229839;
 bh=ZaXv5PcSi3Q1RITLgJRi/a0
 2oOUMv+eZ5SZxjlb/K24=; b=P3Rq8MxE+eO7sApOH4Mmc5XYKOXlD1ZFXsAtwZpESav4U4ZdBB
 +6MnIIHN/qJmSBCIWmE0tFP82ULSmGBiCZd8Jcug/07txXy2wpz3Qh2iTUnpeOFVD5zyvWUjnLW
 nkjW2fvcPYBOaGDqtVyI1szsypXN2/Rw5c1YGrAFlOTbPJprLtpedmdnZPOICWVMlP8O5jKU8YZ
 xQNQ3nlojiV6Cau8sausgUCyQQsLiXw9V6vR/ZMqJJfWRxhNWbS6BS+XfaUByiaTsqfC03iRmUc
 Ruun+BH7g6t/kZdyKQRrEdXAFo3SpEDa88xxWhf7fiZoCGdMxWvRTowI1DhSTqBcFVQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1726229839; bh=ZaXv5PcSi3Q1RITLgJRi/a0
 2oOUMv+eZ5SZxjlb/K24=; b=vFlp/LtF1r9o2yWC324UzX0bP7sqVt9mudyefJFilfNY8y1znb
 mCyE/blyeuEBfXlClk3iqvmXvlMwB9ENU8CA==;
Message-ID: <b9162c5d-b856-4450-91df-b3b8c25896e0@damsy.net>
Date: Fri, 13 Sep 2024 14:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: add DRM_SET_NAME ioctl
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
 <83219d37-74c4-4a3e-bdca-59d81040dea3@igalia.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <83219d37-74c4-4a3e-bdca-59d81040dea3@igalia.com>
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

Hi Tvrtko,

Le 12/09/2024 à 10:13, Tvrtko Ursulin a écrit :
> 
> On 11/09/2024 15:58, Pierre-Eric Pelloux-Prayer wrote:
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
> 
> Idea seems useful to me. Various classes of comments/questions below:
> 
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c | 12 ++++++++----
>>   drivers/gpu/drm/drm_file.c    |  5 +++++
>>   drivers/gpu/drm/drm_ioctl.c   | 28 ++++++++++++++++++++++++++++
>>   include/drm/drm_file.h        |  9 +++++++++
>>   include/uapi/drm/drm.h        | 14 ++++++++++++++
>>   5 files changed, 64 insertions(+), 4 deletions(-)
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
> 
> FWIW it is possible you could get away without the need for a lock on the read side if you make the 
> pointer RCU managed and stick a synchronize_rcu before kfree in the ioctl update path.
> 
> Not because this lock would be a contentended one per se, but mostly to avoid complications such as 
> amdgpu_debugfs_gem_info_show() where 3/3 has it broken - cannot take the mutex in rcu locked 
> section. Just something to consider in case it would end up simpler code.

I don't mind using RCU or a mutex. Christian suggested a mutex, so I used that, but I'm happy to 
switch if the RCU approach is preferred.


> 
>>       }
>>       mutex_unlock(&dev->filelist_mutex);
>>       return 0;
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 01fde94fe2a9..558151c3912e 100644
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
>> +    kvfree(file->name);
> 
> I think kfree is correct here.
> 

OK, I'll update in v2.

>> +
>>       kfree(file);
>>   }
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index 51f39912866f..ba2f2120e99b 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -540,6 +540,32 @@ int drm_version(struct drm_device *dev, void *data,
>>       return err;
>>   }
>> +static int drm_set_name(struct drm_device *dev, void *data,
>> +            struct drm_file *file_priv)
>> +{
>> +    struct drm_set_name *name = data;
>> +    void *user_ptr;
>> +    char *new_name;
>> +
>> +    if (name->name_len >= NAME_MAX)
>> +        return -EINVAL;
> 
> Any special reason to use the filesystem NAME_MAX?

Not really - feel free to suggest something else.

> 
>> +
>> +    user_ptr = u64_to_user_ptr(name->name);
>> +
>> +    new_name = memdup_user_nul(user_ptr, name->name_len);
>> +
>> +    if (IS_ERR(new_name))
>> +        return PTR_ERR(new_name);
>> +
>> +    mutex_lock(&file_priv->name_lock);
>> +    if (file_priv->name)
>> +        kvfree(file_priv->name);
>> +    file_priv->name = new_name;
>> +    mutex_unlock(&file_priv->name_lock);
> 
> One question is whether allowing name changes is interesting or it should be one shot?

dma_buf_set_name allows to override the name, so I re-used the same logic.

> 
> Second issue is to avoid any Little Bobby Tables situations and somewhat validate the input. At 
> least when kernel dumps in in debugfs and fdinfo, we probably don't want to allow userspace to be 
> too creative. Like output newlines or some other special characters.

You mean checking "isgraph(c)" for each char? Or even stricter "isalnum(c) || c == '_' || c == '-'"?

Thanks,
Pierre-Eric


> 
> Regards,
> 
> Tvrtko
> 
>> +
>> +    return 0;
>> +}
>> +
>>   static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>>   {
>>       /* ROOT_ONLY is only for CAP_SYS_ADMIN */
>> @@ -610,6 +636,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
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
