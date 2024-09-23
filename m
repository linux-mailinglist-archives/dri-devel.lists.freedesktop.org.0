Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C012A97E9E9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 12:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5DC10E052;
	Mon, 23 Sep 2024 10:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="EL+aJu/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AC410E052;
 Mon, 23 Sep 2024 10:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727087321; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kSeY/uVy9Q/NOy7AZzavsILMyGym1pYpAkopE3w2QFnGlVHgGYtuY3WMiwh14Bs6X/ZXZ4BuZUaiasdQhh8MYadl7leKaxfOckYERi8N9CCeGZIpx2kbk9MF7d2AQWUjavoWdixNIelYp7/F3QbP6F14s+IuKENoyQdnvTgQJ14=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727087321;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=0i8ek6TcMcQLviPJoeE7vqTentqVaHqTN7BCLGGSOJo=; 
 b=XtWEB6DSzGIWfBQl2a6T1B2vEy4V/TEQeaFH9QhHjAxGbIxkrOhZNWx0C2URBbL6UGKqNQ0QcQpH+oqVbdfe509x6LQWu2kaI1jMM1aUsw2VJ6mcncSUwNabR0qY03r9hQJHawN90ztJP6ZPybBlZb8wBR7gl/NeAUHaE6IR2mw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727087321; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=0i8ek6TcMcQLviPJoeE7vqTentqVaHqTN7BCLGGSOJo=;
 b=EL+aJu/qmibgtCr6wwqsF0JjaoOjCknlF2/KoNYIXhDoUGHfGA5TVADLuI1FeEHt
 oVRwOia4vJo5hQgz/duhfP2gxZT3e/ywz94jqRuTFNShz0omxB+RhPOugIyRI6lF71i
 zaWdJRLDIQ3TeV9/MxSqPwUo1MECjoyWo9Hip1aE=
Received: by mx.zohomail.com with SMTPS id 1727087319068279.53647209704593;
 Mon, 23 Sep 2024 03:28:39 -0700 (PDT)
Message-ID: <75f56ed0-206a-4e81-9972-38c29a3e20be@collabora.com>
Date: Mon, 23 Sep 2024 13:28:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm: add DRM_SET_NAME ioctl
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240920090920.1342694-2-pierre-eric.pelloux-prayer@amd.com>
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

On 9/20/24 12:06, Pierre-Eric Pelloux-Prayer wrote:
> Giving the opportunity to userspace to associate a free-form
> name with a drm_file struct is helpful for tracking and debugging.
> 
> This is similar to the existing DMA_BUF_SET_NAME ioctl.
> 
> Access to name is protected by a mutex, and the 'clients' debugfs
> file has been updated to print it.
> 
> Userspace MR to use this ioctl:
>    https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428
> 
> The string passed by userspace is filtered a bit, to avoid messing
> output when it's going to be printed (in dmesg, fdinfo, etc):
>   * all chars failing isgraph() are replaced by '-'
>   * if a 0-length string is passed the name is cleared
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 12 ++++++---
>  drivers/gpu/drm/drm_file.c    |  5 ++++
>  drivers/gpu/drm/drm_ioctl.c   | 48 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_file.h        |  9 +++++++
>  include/uapi/drm/drm.h        | 17 +++++++++++++
>  5 files changed, 87 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b239a24f1df..482e71160544 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -78,12 +78,13 @@ static int drm_clients_info(struct seq_file *m, void *data)
>  	kuid_t uid;
>  
>  	seq_printf(m,
> -		   "%20s %5s %3s master a %5s %10s\n",
> +		   "%20s %5s %3s master a %5s %10s %20s\n",
>  		   "command",
>  		   "tgid",
>  		   "dev",
>  		   "uid",
> -		   "magic");
> +		   "magic",
> +		   "name");
>  
>  	/* dev->filelist is sorted youngest first, but we want to present
>  	 * oldest first (i.e. kernel, servers, clients), so walk backwardss.
> @@ -94,19 +95,22 @@ static int drm_clients_info(struct seq_file *m, void *data)
>  		struct task_struct *task;
>  		struct pid *pid;
>  
> +		mutex_lock(&priv->name_lock);
>  		rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>  		pid = rcu_dereference(priv->pid);
>  		task = pid_task(pid, PIDTYPE_TGID);
>  		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
> -		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
> +		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %20s\n",
>  			   task ? task->comm : "<unknown>",
>  			   pid_vnr(pid),
>  			   priv->minor->index,
>  			   is_current_master ? 'y' : 'n',
>  			   priv->authenticated ? 'y' : 'n',
>  			   from_kuid_munged(seq_user_ns(m), uid),
> -			   priv->magic);
> +			   priv->magic,
> +			   priv->name ?: "");

There should be a default name similar to task->comm, like "<undefined>"
when not set. Perhaps also set name to task->comm by default.

>  		rcu_read_unlock();
> +		mutex_unlock(&priv->name_lock);
>  	}
>  	mutex_unlock(&dev->filelist_mutex);
>  	return 0;
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 01fde94fe2a9..e9dd0e90a1f9 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -158,6 +158,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  
>  	spin_lock_init(&file->master_lookup_lock);
>  	mutex_init(&file->event_read_lock);
> +	mutex_init(&file->name_lock);
>  
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_open(dev, file);
> @@ -259,6 +260,10 @@ void drm_file_free(struct drm_file *file)
>  	WARN_ON(!list_empty(&file->event_list));
>  
>  	put_pid(rcu_access_pointer(file->pid));
> +
> +	mutex_destroy(&file->name_lock);
> +	kfree(file->name);
> +
>  	kfree(file);
>  }
>  
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 51f39912866f..46dadbd1bb35 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -540,6 +540,52 @@ int drm_version(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> +static int drm_set_name(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv)
> +{
> +	struct drm_set_name *name = data;
> +	void __user *user_ptr;
> +	char *new_name;
> +	size_t i, len;
> +
> +	if (name->name_len > DRM_NAME_MAX_LEN)
> +		return -EINVAL;
> +
> +	user_ptr = u64_to_user_ptr(name->name);
> +
> +	new_name = memdup_user_nul(user_ptr, name->name_len);
> +	if (IS_ERR(new_name))
> +		return PTR_ERR(new_name);
> +
> +	len = strlen(new_name);

strnlen

> +	if (len != name->name_len) {
> +		kfree(new_name);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Filter out control char / spaces / new lines etc in the name
> +	 * since it's going to be used in dmesg or fdinfo's output.
> +	 */
> +	for (i = 0; i < len; i++) {
> +		if (!isgraph(new_name[i]))
> +			new_name[i] = '-';
> +	}
> +
> +	mutex_lock(&file_priv->name_lock);
> +	kfree(file_priv->name);
> +	if (len > 0) {
> +		file_priv->name = new_name;
> +	} else {
> +		kfree(new_name);
> +		file_priv->name = NULL;
> +	}
> +	mutex_unlock(&file_priv->name_lock);
> +
> +	return 0;
> +}
> +
>  static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>  {
>  	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
> @@ -610,6 +656,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD, drm_prime_handle_to_fd_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, drm_prime_fd_to_handle_ioctl, DRM_RENDER_ALLOW),
>  
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_NAME, drm_set_name, DRM_RENDER_ALLOW),
> +
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES, drm_mode_getplane_res, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_mode_getcrtc, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_mode_setcrtc, DRM_MASTER),
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 8c0030c77308..df26eee8f79c 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -388,6 +388,15 @@ struct drm_file {
>  	 * Per-file buffer caches used by the PRIME buffer sharing code.
>  	 */
>  	struct drm_prime_file_private prime;
> +
> +	/**
> +	 * @name:
> +	 *
> +	 * Userspace-provided name; useful for accounting and debugging.
> +	 */
> +	const char *name;

I'd make the "name" string static, i.e. char name[DRM_NAME_MAX_LEN + 1].
That will prevent pointer deref troubles and no additional MM code
bloating will be needed.

> +	/** @name_lock: Protects @name. */
> +	struct mutex name_lock;

And then this lock isn't strictly needed anymore and can be removed if
"name" string is static.

>  };
>  
>  /**
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 16122819edfe..f5e92e4f909b 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1024,6 +1024,13 @@ struct drm_crtc_queue_sequence {
>  	__u64 user_data;	/* user data passed to event */
>  };
>  
> +#define DRM_NAME_MAX_LEN	64

What about 63, to align data size to 64 bytes including the NULL byte.

> +struct drm_set_name {

drm_set_name sounds very generic, IMO. Maybe drm_context_set_name?

> +	__u64 name_len;
> +	__u64 name;
> +};
> +
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> @@ -1288,6 +1295,16 @@ extern "C" {
>   */
>  #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
>  
> +/**
> + * DRM_IOCTL_SET_NAME - Attach a name to a drm_file
> + *
> + * This ioctl is similar to DMA_BUF_SET_NAME - it allows for easier tracking
> + * and debugging.

Don't refer to DMA_BUF_SET_NAME, explain what DRM_IOCTL_SET_NAME
actually do. Tell that it sets the DRM context name and that chars are
filtered.

-- 
Best regards,
Dmitry

