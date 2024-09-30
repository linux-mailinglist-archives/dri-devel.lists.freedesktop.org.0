Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0529989D6D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 10:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF7C10E3CD;
	Mon, 30 Sep 2024 08:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a+jwIjbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFE010E3CD;
 Mon, 30 Sep 2024 08:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ksW1PaBLtCGSwLe9j0gLvai8oxFCvyaUi2E0QliHXBg=; b=a+jwIjbg4SAd3qP6VqRSAFC5ig
 AweUmlZ3eOBsbalYQFll2j3ZHqETDVZ+T4AAefYXt3cMIYoZa8Wn5TzHVxmOjn3woz+9lRhuovwUL
 QGYsJI5kayYqke2amJ/D28c7GBgDH4tbQdbtZ84+hcCgvqAai7lzJMCI2jnGQWkpr6wiDfU5JQbGd
 fKrJiVptLE6lavV9C1BJaXxEgVSkjIH+Ydo66G3zW0VyriBgKl4IdpBZpsesMKnabuVAzWKdNBoyi
 ORWASJNFMP0v3W6UWaVjbQZPrsGYgpwf8tpJzLXRfDEh60Q+NX0lA0sxP17lL0E3VgWXKEg812k0B
 qUesBylQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1svCDJ-002lzL-Q0; Mon, 30 Sep 2024 10:57:05 +0200
Message-ID: <a169226b-c171-4a6d-88f6-d59214cb7b5d@igalia.com>
Date: Mon, 30 Sep 2024 09:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] drm: add DRM_SET_CLIENT_NAME ioctl
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dmitry.osipenko@collabora.com
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
 <20240927084848.263718-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240927084848.263718-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 27/09/2024 09:48, Pierre-Eric Pelloux-Prayer wrote:
> Giving the opportunity to userspace to associate a free-form
> name with a drm_file struct is helpful for tracking and debugging.
> 
> This is similar to the existing DMA_BUF_SET_NAME ioctl.
> 
> Access to client_name is protected by a mutex, and the 'clients' debugfs
> file has been updated to print it.
> 
> Userspace MR to use this ioctl:
>     https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428
> 
> If the string passed by userspace contains chars that would mess up output
> when it's going to be printed (in dmesg, fdinfo, etc), -EINVAL is returned.
> 
> A 0-length string is a valid use, and clears the existing name.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/drm_debugfs.c | 14 ++++++---
>   drivers/gpu/drm/drm_file.c    |  5 ++++
>   drivers/gpu/drm/drm_ioctl.c   | 55 +++++++++++++++++++++++++++++++++++
>   include/drm/drm_file.h        |  9 ++++++
>   include/uapi/drm/drm.h        | 17 +++++++++++
>   5 files changed, 96 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b239a24f1df..5c99322a4c6f 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -78,12 +78,14 @@ static int drm_clients_info(struct seq_file *m, void *data)
>   	kuid_t uid;
>   
>   	seq_printf(m,
> -		   "%20s %5s %3s master a %5s %10s\n",
> +		   "%20s %5s %3s master a %5s %10s %*s\n",
>   		   "command",
>   		   "tgid",
>   		   "dev",
>   		   "uid",
> -		   "magic");
> +		   "magic",
> +		   DRM_CLIENT_NAME_MAX_LEN,
> +		   "name");
>   
>   	/* dev->filelist is sorted youngest first, but we want to present
>   	 * oldest first (i.e. kernel, servers, clients), so walk backwardss.
> @@ -94,19 +96,23 @@ static int drm_clients_info(struct seq_file *m, void *data)
>   		struct task_struct *task;
>   		struct pid *pid;
>   
> +		mutex_lock(&priv->client_name_lock);
>   		rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>   		pid = rcu_dereference(priv->pid);
>   		task = pid_task(pid, PIDTYPE_TGID);
>   		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
> -		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
> +		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s\n",
>   			   task ? task->comm : "<unknown>",
>   			   pid_vnr(pid),
>   			   priv->minor->index,
>   			   is_current_master ? 'y' : 'n',
>   			   priv->authenticated ? 'y' : 'n',
>   			   from_kuid_munged(seq_user_ns(m), uid),
> -			   priv->magic);
> +			   priv->magic,
> +			   DRM_CLIENT_NAME_MAX_LEN,
> +			   priv->client_name ? priv->client_name : "<unset>");
>   		rcu_read_unlock();
> +		mutex_unlock(&priv->client_name_lock);
>   	}
>   	mutex_unlock(&dev->filelist_mutex);
>   	return 0;
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 01fde94fe2a9..64f5e15304e7 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -158,6 +158,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   
>   	spin_lock_init(&file->master_lookup_lock);
>   	mutex_init(&file->event_read_lock);
> +	mutex_init(&file->client_name_lock);
>   
>   	if (drm_core_check_feature(dev, DRIVER_GEM))
>   		drm_gem_open(dev, file);
> @@ -259,6 +260,10 @@ void drm_file_free(struct drm_file *file)
>   	WARN_ON(!list_empty(&file->event_list));
>   
>   	put_pid(rcu_access_pointer(file->pid));
> +
> +	mutex_destroy(&file->client_name_lock);
> +	kfree(file->client_name);
> +
>   	kfree(file);
>   }
>   
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 51f39912866f..df8d59bd5241 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -540,6 +540,59 @@ int drm_version(struct drm_device *dev, void *data,
>   	return err;
>   }
>   
> +/*
> + * Check if the passed string contains control char or spaces or
> + * anything that would mess up a formatted output.
> + */
> +static int drm_validate_value_string(const char *value, size_t len)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++) {
> +		if (value[i] <= 32 || value[i] >= 127)

Would !isascii() || isgraph() work for what you have in mind here, 
considering the comment from the cover letter about the extended ASCII?

> +			return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int drm_set_client_name(struct drm_device *dev, void *data,
> +			       struct drm_file *file_priv)
> +{
> +	struct drm_set_client_name *name = data;
> +	void __user *user_ptr;
> +	char *new_name;
> +	size_t len;
> +
> +	if (name->name_len > DRM_CLIENT_NAME_MAX_LEN)
> +		return -EINVAL;
> +
> +	user_ptr = u64_to_user_ptr(name->name);
> +
> +	new_name = memdup_user_nul(user_ptr, name->name_len);
> +	if (IS_ERR(new_name))
> +		return PTR_ERR(new_name);
> +
> +	len = strlen(new_name);
> +
> +	if (len != name->name_len ||
> +	    drm_validate_value_string(new_name, len) < 0) {
> +		kfree(new_name);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&file_priv->client_name_lock);
> +	kfree(file_priv->client_name);
> +	if (len > 0) {
> +		file_priv->client_name = new_name;
> +	} else {
> +		kfree(new_name);
> +		file_priv->client_name = NULL;
> +	}
> +	mutex_unlock(&file_priv->client_name_lock);

FWIW I still find it hard to look at needlessly allocating a string when 
userspace has passed name->name_len == 0.

I would have done it something like this:

{
	struct drm_set_client_name *name = data;
	size_t len = name->len;
	char *new_name;

	if (len > DRM_CLIENT_NAME_MAX_LEN) {
		return -EINVAL;
	} else if (len) {
		new_name = memdup_user_nul(u64_to_user_ptr(name->name), len);
		if (IS_ERR(new_name))
			return PTR_ERR(new_name);

		if (strlen(new_name) != len ||
		    drm_validate_value_string(new_name, len) < 0) {
			kfree(new_name);
			return -EINVAL;
		}
	} else {
		new_name = NULL;
	}

	mutex_lock(&file_priv->client_name_lock);
	kfree(file_priv->client_name);
	file_priv->client_name = new_name;
	mutex_unlock(&file_priv->client_name_lock);

But whatever, you can keep the r-b regardless.

Regards,

Tvrtko

> +
> +	return 0;
> +}
> +
>   static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>   {
>   	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
> @@ -610,6 +663,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>   	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD, drm_prime_handle_to_fd_ioctl, DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, drm_prime_fd_to_handle_ioctl, DRM_RENDER_ALLOW),
>   
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_CLIENT_NAME, drm_set_client_name, DRM_RENDER_ALLOW),
> +
>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES, drm_mode_getplane_res, 0),
>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_mode_getcrtc, 0),
>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_mode_setcrtc, DRM_MASTER),
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 8c0030c77308..d4f1c115ea0f 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -388,6 +388,15 @@ struct drm_file {
>   	 * Per-file buffer caches used by the PRIME buffer sharing code.
>   	 */
>   	struct drm_prime_file_private prime;
> +
> +	/**
> +	 * @client_name:
> +	 *
> +	 * Userspace-provided name; useful for accounting and debugging.
> +	 */
> +	const char *client_name;
> +	/** @name_lock: Protects @client_name. */
> +	struct mutex client_name_lock;
>   };
>   
>   /**
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 16122819edfe..7fba37b94401 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1024,6 +1024,13 @@ struct drm_crtc_queue_sequence {
>   	__u64 user_data;	/* user data passed to event */
>   };
>   
> +#define DRM_CLIENT_NAME_MAX_LEN		64
> +struct drm_set_client_name {
> +	__u64 name_len;
> +	__u64 name;
> +};
> +
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> @@ -1288,6 +1295,16 @@ extern "C" {
>    */
>   #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
>   
> +/**
> + * DRM_IOCTL_SET_CLIENT_NAME - Attach a name to a drm_file
> + *
> + * Having a name allows for easier tracking and debugging.
> + * The length of the name (without null ending char) must be
> + * <= DRM_CLIENT_NAME_MAX_LEN.
> + * The call will fail if the name contains whitespaces or non-printable chars.
> + */
> +#define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
> +
>   /*
>    * Device specific ioctls should only be in their respective headers
>    * The device specific ioctl range is from 0x40 to 0x9f.
