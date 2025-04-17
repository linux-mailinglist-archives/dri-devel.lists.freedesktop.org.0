Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C890DA91E26
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97C910EB0B;
	Thu, 17 Apr 2025 13:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mM3ZQ6Hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CFE10EB0B;
 Thu, 17 Apr 2025 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UQ72JsZmaluGA3m34iIA50VvNwqgLbRlJkS6I7b5Li4=; b=mM3ZQ6HioJItQelcR2Fejzz2pa
 BzbnU9Y9RoM8TS8tTAyM28aG39DsFKwRkvkri41ZZHIEQiDc/U9EfZy6KOYsbm6bX+9m2wYHwHqV1
 dV3W+R9GiGcJyhxvp5nJFfaDHjxrgDgirCzTjsahQzG9FZYuVyOjlTDAJds0yJrpmSPR2JFJuNoRI
 xuFtVEzAyi+a6CT+Wq+67K/DrRygPHRdDnVPvlvk6QvgHLSV+IkoSjvdjoUwMrD1g0gojzXLJ6uRX
 F5nTRJY516Tmr6Br5cMATAgeO7ENNlKGhEJVaHMg8jxRN5LuzN830qdNDdCAY0KuigS9P3j9vtD9K
 jU/BNzmA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5POI-000pE4-MK; Thu, 17 Apr 2025 15:34:54 +0200
Message-ID: <ea409b34-6bb8-421c-b768-cfc71f40ff43@igalia.com>
Date: Thu, 17 Apr 2025 14:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 1/5] drm: add drm_file_err function to add process info
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417123155.4002358-1-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250417123155.4002358-1-sunil.khatri@amd.com>
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


On 17/04/2025 13:31, Sunil Khatri wrote:
> Add a drm helper function which append the process information for

appends

> the drm_file over drm_err formated output.

formatted

> v5: change to macro from function (Christian Koenig)
>      add helper functions for lock/unlock (Christian Koenig)
> 
> v6: remove __maybe_unused and make function inline (Jani Nikula)
>      remove drm_print.h
> 
> v7: Use va_format and %pV to concatenate fmt and vargs (Jani Nikula)
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>   include/drm/drm_file.h     |  3 +++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index c299cd94d3f7..7e64d84d4e2d 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>   }
>   EXPORT_SYMBOL(drm_show_fdinfo);
>   
> +/**
> + * drm_file_err - Fill info string with process name and pid

Update to something like:

drm_file_err - Log error message associated with a drm_file client

> + * @file_priv: context of interest for process name and pid
> + * @fmt: prinf() like format string

printf

> + *
> + * This update the user provided buffer with process
> + * name and pid information for @file_priv

Also stale but it may be okay to drop altogether since short description 
feels enough for a logging helper.

> + */
> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +	struct drm_device *dev = file_priv->minor->dev;
> +	va_list args;
> +	struct va_format vaf;

You could tidy the declaration block a bit, usually ordering from longer 
to narrower lines for readability but up to you.

> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	mutex_lock(&file_priv->client_name_lock);
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +
> +	drm_err(dev, "comm: %s pid: %d client: %s %pV", task ? task->comm : "",
> +		task ? task->pid : 0, file_priv->client_name ?: "Unset", &vaf);
> +

Hm is task->pid the tid or tgid? Could be the same thing due getting 
PIDTYPE_GID.. PID namespaces are always endlessly confusing to me since 
I don't work in that area often enough.

And I have some bikeshedding ideas for the format, like maybe 
consolidating with naming used in drm_clients_info() and adding some 
separator between the client data and the log message that follows. Like:

"Client %s[%d] (%s): %pV",
task ? task->comm : "<unknown>",
pid_nr(pid),
file_priv->client_name ?: "<unset>",
...

And even if I am a bit unsure about the "<unknown>", I think it doesn't 
harm to be consistent. It is fine as is though, so you decide if you 
want to change anything or not.

If you could please double check task->pid is indeed definitely TGID:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> +	va_end(args);
> +	rcu_read_unlock();
> +	mutex_unlock(&file_priv->client_name_lock);
> +}
> +EXPORT_SYMBOL(drm_file_err);
> +
>   /**
>    * mock_drm_getfile - Create a new struct file for the drm device
>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 94d365b22505..5c3b2aa3e69d 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -446,6 +446,9 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>   	return file_priv->minor->type == DRM_MINOR_ACCEL;
>   }
>   
> +__printf(2, 3)
> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...);
> +
>   void drm_file_update_pid(struct drm_file *);
>   
>   struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);

