Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDAA89CAC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E502610E051;
	Tue, 15 Apr 2025 11:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="s7G4ZxTA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172E510E051;
 Tue, 15 Apr 2025 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q4tWwxFqben3cy2D0z5jd8tz/9mgsJa2A7K/okysT4E=; b=s7G4ZxTAylkuMNBnllP3RhrGI+
 3FzSh5qgeSzhdZJw1tCRc3vS37UUvsdxcnj3T5SW8vZuskv7XsgV0+HVGYmyLAFSjupweifLykznp
 GMhKXyPGHdeSXirR0PK/hXOQGXm5ItB++IZokBbFSg8knvQLcPVN69hv8kMTThPwxYgd+TWZIT8Zm
 3N+2oQnk+fsbsGf0Ei1/YN/dNhIetI+O9j1U/EZUK3DgZKMhnndqlumhraQaPbkj+vZvBqQRIlW0u
 infZjiwpDqm2LxehQGAF7v0bho67nDX8LS8d8nWp959B+wAuDUQ+tHn2pg0IUMdr3YUFtkzss21De
 5tBxTRxA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u4eex-00Gv1J-Dt; Tue, 15 Apr 2025 13:40:59 +0200
Message-ID: <c7bb4a85-dce7-410a-a2f0-16fe7b5c0c3a@igalia.com>
Date: Tue, 15 Apr 2025 12:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm: function to get process name and pid
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415112550.297292-1-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250415112550.297292-1-sunil.khatri@amd.com>
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


On 15/04/2025 12:25, Sunil Khatri wrote:
> Add helper function which get the process information for
> the drm_file and updates the user provided character buffer
> with the information of process name and pid as a string.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>   include/drm/drm_file.h     |  1 +
>   2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index c299cd94d3f7..728a60975f5e 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>   }
>   EXPORT_SYMBOL(drm_show_fdinfo);
>   
> +/**
> + * drm_process_info - Fill info string with process name and pid
> + * @file_priv: context of interest for process name and pid
> + * @proc_info: user char ptr to write the string to
> + * @buff_size: size of the buffer passed for the string
> + *
> + * This update the user provided buffer with process
> + * name and pid information for @file_priv
> + */
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +	struct drm_device *dev = file_priv->minor->dev;
> +
> +	if (!proc_info) {
> +		drm_WARN_ON_ONCE(dev, "Invalid user buffer\n");
> +		return;
> +	}

I think this should be:

if (drm_WARN_ON_ONCE(dev, !proc_info))
	return;

> +
> +	mutex_lock(&file_priv->client_name_lock);
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +	if (task)
> +		snprintf(proc_info, buff_size, "client_name:%s proc:%s pid:%d",
> +			 file_priv->client_name ? file_priv->client_name : "Unset",
> +			 task->comm, task->pid);

Probably bad to return uninitialised string for the !task case.

Also, now that you added client name the case to move towards the helper 
which does not need a temporary buffer, like I was suggesting 
drm_file_err(drm_file *, const char *, ...), is IMO even stronger. 
Consider if nothing else DRM_CLIENT_NAME_MAX_LEN plus the length of 
other fields you will be adding (the series as is can truncate). And it 
would be a bit unsightly to require relatively huge stack buffers in the 
later patches when it can all be easily avoided.

Regards,

Tvrtko

> +
> +	rcu_read_unlock();
> +	mutex_unlock(&file_priv->client_name_lock);
> +}
> +EXPORT_SYMBOL(drm_process_info);
> +
>   /**
>    * mock_drm_getfile - Create a new struct file for the drm device
>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 94d365b22505..a972be73a615 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -507,6 +507,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>   
>   void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>   void drm_show_fdinfo(struct seq_file *m, struct file *f);
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size);
>   
>   struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>   

