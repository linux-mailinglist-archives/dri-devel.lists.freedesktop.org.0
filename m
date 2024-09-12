Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA4997641B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2326110EAF1;
	Thu, 12 Sep 2024 08:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DWHgnmZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D60D10EAF1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 08:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lh+Zbnxf5I/gmwqpNpNR9mN6MvU4Az8Op4SmeBD4xlw=; b=DWHgnmZDX8ipdqblfJnbC7G2Lg
 zIzZfiTqg+cq0NkvbHuAGYySgLKqHl6Y2p4eMP8SFtolGsDKC3239h4cPFBI6o5q/n6ZDJYv5X7uW
 CB3DbPGA0WfQzbWdVcBAJwXeP3gAizr7+amDwQhz18o9sQzXHKTPZ+me07vBOjhdW2UDGfq9QKx3T
 SVXfx2uOo7s7yiQdR0/r8nCoQyHpqErz34Iqg6JgKqwA8e3Ftwtd688gVLgX6Di98rgtVojKVm6lU
 ZQs9UEHlcvW1Z5JQHW6JDGFidDUa8p10vPVpccdMG+uYtYySfe85wrhmgbqfRCgRiEXSqf+8lx419
 Mv2zxI4Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1soexW-00CmZD-FW; Thu, 12 Sep 2024 10:13:46 +0200
Message-ID: <83219d37-74c4-4a3e-bdca-59d81040dea3@igalia.com>
Date: Thu, 12 Sep 2024 09:13:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: add DRM_SET_NAME ioctl
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
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


On 11/09/2024 15:58, Pierre-Eric Pelloux-Prayer wrote:
> Giving the opportunity to userspace to associate a free-form
> name with a drm_file struct is helpful for tracking and debugging.
> 
> This is similar to the existing DMA_BUF_SET_NAME ioctl.
> 
> Access to name is protected by a mutex, and the 'clients' debugfs
> file has been updated to print it.
> 
> Userspace MR to use this ioctl:
>     https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428

Idea seems useful to me. Various classes of comments/questions below:

> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/drm_debugfs.c | 12 ++++++++----
>   drivers/gpu/drm/drm_file.c    |  5 +++++
>   drivers/gpu/drm/drm_ioctl.c   | 28 ++++++++++++++++++++++++++++
>   include/drm/drm_file.h        |  9 +++++++++
>   include/uapi/drm/drm.h        | 14 ++++++++++++++
>   5 files changed, 64 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b239a24f1df..b7492225ae88 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -78,12 +78,13 @@ static int drm_clients_info(struct seq_file *m, void *data)
>   	kuid_t uid;
>   
>   	seq_printf(m,
> -		   "%20s %5s %3s master a %5s %10s\n",
> +		   "%20s %5s %3s master a %5s %10s %20s\n",
>   		   "command",
>   		   "tgid",
>   		   "dev",
>   		   "uid",
> -		   "magic");
> +		   "magic",
> +		   "name");
>   
>   	/* dev->filelist is sorted youngest first, but we want to present
>   	 * oldest first (i.e. kernel, servers, clients), so walk backwardss.
> @@ -94,19 +95,22 @@ static int drm_clients_info(struct seq_file *m, void *data)
>   		struct task_struct *task;
>   		struct pid *pid;
>   
> +		mutex_lock(&priv->name_lock);
>   		rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>   		pid = rcu_dereference(priv->pid);
>   		task = pid_task(pid, PIDTYPE_TGID);
>   		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
> -		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
> +		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %20s\n",
>   			   task ? task->comm : "<unknown>",
>   			   pid_vnr(pid),
>   			   priv->minor->index,
>   			   is_current_master ? 'y' : 'n',
>   			   priv->authenticated ? 'y' : 'n',
>   			   from_kuid_munged(seq_user_ns(m), uid),
> -			   priv->magic);
> +			   priv->magic,
> +			   priv->name ? priv->name : "");
>   		rcu_read_unlock();
> +		mutex_unlock(&priv->name_lock);

FWIW it is possible you could get away without the need for a lock on 
the read side if you make the pointer RCU managed and stick a 
synchronize_rcu before kfree in the ioctl update path.

Not because this lock would be a contentended one per se, but mostly to 
avoid complications such as amdgpu_debugfs_gem_info_show() where 3/3 has 
it broken - cannot take the mutex in rcu locked section. Just something 
to consider in case it would end up simpler code.

>   	}
>   	mutex_unlock(&dev->filelist_mutex);
>   	return 0;
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 01fde94fe2a9..558151c3912e 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -158,6 +158,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   
>   	spin_lock_init(&file->master_lookup_lock);
>   	mutex_init(&file->event_read_lock);
> +	mutex_init(&file->name_lock);
>   
>   	if (drm_core_check_feature(dev, DRIVER_GEM))
>   		drm_gem_open(dev, file);
> @@ -259,6 +260,10 @@ void drm_file_free(struct drm_file *file)
>   	WARN_ON(!list_empty(&file->event_list));
>   
>   	put_pid(rcu_access_pointer(file->pid));
> +
> +	mutex_destroy(&file->name_lock);
> +	kvfree(file->name);

I think kfree is correct here.

> +
>   	kfree(file);
>   }
>   
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 51f39912866f..ba2f2120e99b 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -540,6 +540,32 @@ int drm_version(struct drm_device *dev, void *data,
>   	return err;
>   }
>   
> +static int drm_set_name(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv)
> +{
> +	struct drm_set_name *name = data;
> +	void *user_ptr;
> +	char *new_name;
> +
> +	if (name->name_len >= NAME_MAX)
> +		return -EINVAL;

Any special reason to use the filesystem NAME_MAX?

> +
> +	user_ptr = u64_to_user_ptr(name->name);
> +
> +	new_name = memdup_user_nul(user_ptr, name->name_len);
> +
> +	if (IS_ERR(new_name))
> +		return PTR_ERR(new_name);
> +
> +	mutex_lock(&file_priv->name_lock);
> +	if (file_priv->name)
> +		kvfree(file_priv->name);
> +	file_priv->name = new_name;
> +	mutex_unlock(&file_priv->name_lock);

One question is whether allowing name changes is interesting or it 
should be one shot?

Second issue is to avoid any Little Bobby Tables situations and somewhat 
validate the input. At least when kernel dumps in in debugfs and fdinfo, 
we probably don't want to allow userspace to be too creative. Like 
output newlines or some other special characters.

Regards,

Tvrtko

> +
> +	return 0;
> +}
> +
>   static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>   {
>   	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
> @@ -610,6 +636,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>   	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD, drm_prime_handle_to_fd_ioctl, DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, drm_prime_fd_to_handle_ioctl, DRM_RENDER_ALLOW),
>   
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_NAME, drm_set_name, DRM_RENDER_ALLOW),
> +
>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES, drm_mode_getplane_res, 0),
>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_mode_getcrtc, 0),
>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_mode_setcrtc, DRM_MASTER),
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 8c0030c77308..df26eee8f79c 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -388,6 +388,15 @@ struct drm_file {
>   	 * Per-file buffer caches used by the PRIME buffer sharing code.
>   	 */
>   	struct drm_prime_file_private prime;
> +
> +	/**
> +	 * @name:
> +	 *
> +	 * Userspace-provided name; useful for accounting and debugging.
> +	 */
> +	const char *name;
> +	/** @name_lock: Protects @name. */
> +	struct mutex name_lock;
>   };
>   
>   /**
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 16122819edfe..fc62bb21f79e 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1024,6 +1024,12 @@ struct drm_crtc_queue_sequence {
>   	__u64 user_data;	/* user data passed to event */
>   };
>   
> +struct drm_set_name {
> +	__u64 name_len;
> +	__u64 name;
> +};
> +
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> @@ -1288,6 +1294,14 @@ extern "C" {
>    */
>   #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
>   
> +/**
> + * DRM_IOCTL_SET_NAME - Attach a name to a drm_file
> + *
> + * This ioctl is similar to DMA_BUF_SET_NAME - it allows for easier tracking
> + * and debugging.
> + */
> +#define DRM_IOCTL_SET_NAME		DRM_IOWR(0xD1, struct drm_set_name)
> +
>   /*
>    * Device specific ioctls should only be in their respective headers
>    * The device specific ioctl range is from 0x40 to 0x9f.
