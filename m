Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D46CA8B1B3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B38A10E854;
	Wed, 16 Apr 2025 07:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VuVgYL3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF7710E850;
 Wed, 16 Apr 2025 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dMRiJm2KJYp44dVClTZBKYCG1IgyRQDRM15b0tYnjm0=; b=VuVgYL3TARMvPPSOvnBzgYTq/x
 dLTkXVF0Bv1Vb/dDxUfYRS56Pea0/mrAhQlwb8ALtiVOyj4rlYc2un8V1fk7peFRD64zNUodCco05
 Sfzw52vyaUhy4F3w98n2igQxkl1LKAQQCz0xd2qPWvlIzTBOCjzRpivGvNKUt6CUI6Qf+9X9JNFhH
 U8TLRHCS1+XEi7SHstxfOIp7SgKP1eW+aILkZVlzK/roT04b0fDCGCqdJfr8yuCZ6Covw5zi5ZV0A
 t/MiExysEoAW9PBDhEeaD4Lrfu/2BS4TCQhb45CeQzNE/iVFVZOpUkOyQ7O+fTNFphLmt9J4bXp+W
 Du6F2uGg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u4wrn-00HGaN-3H; Wed, 16 Apr 2025 09:07:27 +0200
Message-ID: <830a2b61-8965-4193-98de-d462a641737f@igalia.com>
Date: Wed, 16 Apr 2025 08:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: add function drm_file_err to print proc
 information too
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415184318.2465197-1-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250415184318.2465197-1-sunil.khatri@amd.com>
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


On 15/04/2025 19:43, Sunil Khatri wrote:
> Add a drm helper function which get the process information for
> the drm_file and append the process information using the existing
> drm_err.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   include/drm/drm_file.h | 40 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 94d365b22505..e329299a2b2c 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -37,6 +37,7 @@
>   #include <uapi/drm/drm.h>
>   
>   #include <drm/drm_prime.h>
> +#include <drm/drm_print.h>
>   
>   struct dma_fence;
>   struct drm_file;
> @@ -446,6 +447,45 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>   	return file_priv->minor->type == DRM_MINOR_ACCEL;
>   }
>   
> +/**
> + * drm_file_err - Fill info string with process name and pid
> + * @file_priv: context of interest for process name and pid
> + * @fmt: prinf() like format string
> + *
> + * This update the user provided buffer with process
> + * name and pid information for @file_priv
> + */
> +__printf(2, 3)
> +static inline void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +	struct drm_device *dev = file_priv->minor->dev;
> +	char new_fmt[256];
> +	char final_fmt[512];
> +	va_list args;
> +
> +	mutex_lock(&file_priv->client_name_lock);
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +
> +	if (drm_WARN_ON_ONCE(dev, !task))
> +		return;
> +
> +	snprintf(new_fmt, sizeof(new_fmt), "proc:%s pid:%d client_name:%s %s",
> +		task->comm, task->pid, file_priv->client_name ?: "Unset", fmt);
> +
> +	va_start(args, fmt);
> +	vsnprintf(final_fmt, sizeof(final_fmt), new_fmt, args);
> +
> +	drm_err(dev, "%s", final_fmt);
> +	va_end(args);
> +
> +	rcu_read_unlock();
> +	mutex_unlock(&file_priv->client_name_lock);
> +}
> +

I was hoping something primitive could be enough. With no temporary 
stack space required. Primitive on the level of (but simplified for 
illustration purpose):

#define some_err(_file, _fmt, ...) \
	drm_err(dev, "client-%s: " _fmt, (_this)->client_name, ##__VA_ARGS__)

Am I missing something or that would work?

Regards,

Tvrtko

>   void drm_file_update_pid(struct drm_file *);
>   
>   struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);

