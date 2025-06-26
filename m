Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61CAE9EF8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 15:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9300F10E2C7;
	Thu, 26 Jun 2025 13:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="2JZGKAks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE5510E293
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 13:37:07 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so778995f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 06:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1750945026; x=1751549826;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d2sLzPKwbpmkczcvXfamUHi9bhFGgY/84fM9jNnHCZw=;
 b=2JZGKAksnEkEDfaqPv3MLnuD8UkyrytklriY6pJQveYzbithms5298uFEOtGg2rYEC
 9GUtdbU59AbQ5R2kV/MvCXiLD/vyR+ZvSCmN0vHXJSpdDRSx31CUiJuV3l+/37bGH7E7
 w2jNVvQJpKkrKGBR237aSsljP8goq1sQPKyAdQaZlsIe4ddVtb/kZsrIzCU8sHE79D8E
 wVsX0gLovBAbdDfGjBrJHx2jI4v3y2zhPZp4dO3j7IyARUP03oulFH0zZivfXbhowWeQ
 kqcel9PBIgzKUp3MWTBX28ULYSqVRrSTTx68AIhjFChr4HEgPp4xlO+O25vqyO12scbE
 /ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750945026; x=1751549826;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d2sLzPKwbpmkczcvXfamUHi9bhFGgY/84fM9jNnHCZw=;
 b=ZeedtCfhJ7jHFz/A53uW6zvt8kqaSBLpR4i43bU9wRRUxLil/8zTfhbFH6zbh/o5nO
 3wV6Oz3yNwQ71YXw8kO3r4g3Zfp1T6bPyp8xYY0hLAzp/2xLOc4Tj4JukggheM8cD5Iv
 ixDvFEs+3maQ17r6e7E2XAcdk2O4K7uoFd3rlvu807s95QquNNkXUCGjW5Hrk2WciGOL
 5uWPIbuLHY/VPnC4g5oBuyt69FPTWJrcGnajDTtfgPwjliJEk/pF22PoXF3Fwvr3C7tC
 CJr6YTEl69HkqDm87SSlL36Bm+3+UXqSbiodYJnUafkfab2SQsdh85RG8Hp7T5qGtLgL
 W1dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5RB9KTpMN0L75sikp2U7ffortSDYFadxxHdcrFRk6P2EI/MIjjtbnz5jJdWmuaHkGPukWWSQA8oM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyycHMRLYEviYL0z0zaoVOc15BLv8TKN5wPCRjY2DsdrDELEV4a
 EokF50UEORLeFg8MsIzMaU4M184JVnadDNXLTyd85yhh1pMhRSmAszK1eDOgjXmlZ8I=
X-Gm-Gg: ASbGnct+ArV8GxHaRtFuxkfZFiF5Wu55RaThz8kTwew/ualrCBFGaP0+PkpvTWETjRl
 4L99c1o/EMIbps4jii2q8bvLg918Zv6V8/bdRs0kFlK6BvLYcXvbaZiFPuB/kX39bpQYWGtBQ7F
 6SCV3lDoDnNZal5ps8i4LNGq9/2jVoaS8OZuuuuO8sbrkgsQmU8/0/7TPWDkf2CPX1aqGUpXUPj
 T7xiFJqmTrkr450rr5SoVTnl9Rwb2O2pL0cSLZn+IFZRM+8e57LkGvdyQr/oNjsrN7T21Vwp4bv
 GCeC+IL7viImt9gcozEM/VRe70AUA5ApLQwrj6g5teRP0Ks3gTlUiksFMY2V+DhNecxuYqnHWNp
 G
X-Google-Smtp-Source: AGHT+IGGYY51G4S6r1637X8qDM7tUvTdIqdZoe0WJkLWBSHEtnFelxZQzgFM0uPViOGptRpfZaEPdA==
X-Received: by 2002:a05:6000:258a:b0:3a3:66cb:d530 with SMTP id
 ffacd0b85a97d-3a6ed5fd86emr6204178f8f.23.1750945025286; 
 Thu, 26 Jun 2025 06:37:05 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e8051677sm7481794f8f.15.2025.06.26.06.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 06:37:04 -0700 (PDT)
Message-ID: <2a24fbf3-2ebe-498d-83f0-5edb45c9dab4@ursulin.net>
Date: Thu, 26 Jun 2025 14:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm: add debugfs support on per client-id basis
To: Sunil Khatri <sunil.khatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
 <20250624113454.2322935-3-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250624113454.2322935-3-sunil.khatri@amd.com>
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


On 24/06/2025 12:34, Sunil Khatri wrote:
> add support to add a directory for each client-id
> with root at the dri level. Since the clients are
> unique and not just related to one single drm device,
> so it makes more sense to add all the client based
> nodes with root as dri.
> 
> Also create a symlink back to the parent drm device
> from each client.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/drm_debugfs.c | 26 ++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_file.c    |  6 ++++++
>   include/drm/drm_debugfs.h     | 11 +++++++++++
>   include/drm/drm_file.h        |  7 +++++++
>   4 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index a227903c29c4..ebdf60665b86 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -309,6 +309,32 @@ void drm_debugfs_remove_accel_root(void)
>   	debugfs_remove(accel_debugfs_root);
>   }
>   
> +void drm_debugfs_clients_add(struct drm_file *file)
> +{
> +	char *client;
> +
> +	client = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
> +	if (!client)
> +		return;
> +
> +	/* Create a debugfs directory for the client in root on drm debugfs */
> +	file->debugfs_client = debugfs_create_dir(client, drm_debugfs_root);
> +	kfree(client);
> +
> +	client = kasprintf(GFP_KERNEL, "../%s", file->minor->dev->unique);
> +	if (!client)
> +		return;
> +
> +	/* Create a link from client_id to the drm device this client id belongs to */
> +	debugfs_create_symlink("device", file->debugfs_client, client);
> +	kfree(client);
> +}
> +
> +void drm_debugfs_clients_remove(struct drm_file *file)
> +{
> +	debugfs_remove_recursive(file->debugfs_client);
> +	file->debugfs_client = NULL;
> +}
>   
>   /**
>    * drm_debugfs_dev_init - create debugfs directory for the device
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 06ba6dcbf5ae..17b803ab119e 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -45,6 +45,7 @@
>   #include <drm/drm_file.h>
>   #include <drm/drm_gem.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_debugfs.h>
>   
>   #include "drm_crtc_internal.h"
>   #include "drm_internal.h"
> @@ -167,6 +168,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   
>   	drm_prime_init_file_private(&file->prime);
>   
> +	drm_debugfs_clients_add(file);
> +
>   	if (dev->driver->open) {
>   		ret = dev->driver->open(dev, file);
>   		if (ret < 0)
> @@ -181,6 +184,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   		drm_syncobj_release(file);
>   	if (drm_core_check_feature(dev, DRIVER_GEM))
>   		drm_gem_release(dev, file);
> +
> +	drm_debugfs_clients_remove(file);
>   	put_pid(rcu_access_pointer(file->pid));
>   	kfree(file);
>   
> @@ -236,6 +241,7 @@ void drm_file_free(struct drm_file *file)
>   		     atomic_read(&dev->open_count));
>   
>   	drm_events_release(file);
> +	drm_debugfs_clients_remove(file);
>   
>   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>   		drm_fb_release(file);
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index cf06cee4343f..2b3767ad8f5d 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>   
>   int drm_debugfs_gpuva_info(struct seq_file *m,
>   			   struct drm_gpuvm *gpuvm);
> +
> +void drm_debugfs_clients_add(struct drm_file *file);
> +void drm_debugfs_clients_remove(struct drm_file *file);
>   #else
>   static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>   					    int count, struct dentry *root,
> @@ -181,6 +184,14 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
>   {
>   	return 0;
>   }
> +
> +static void drm_debugfs_clients_add(struct drm_file *file)
> +{
> +}
> +
> +static void drm_debugfs_clients_remove(struct drm_file *file)
> +{
> +}

You forgot static inline for these two.

Regards,

Tvrtko

>   #endif
>   
>   #endif /* _DRM_DEBUGFS_H_ */
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 5c3b2aa3e69d..eab7546aad79 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -400,6 +400,13 @@ struct drm_file {
>   	 * @client_name_lock: Protects @client_name.
>   	 */
>   	struct mutex client_name_lock;
> +
> +	/**
> +	 * @debugfs_client:
> +	 *
> +	 * debugfs directory for each client under a drm node.
> +	 */
> +	struct dentry *debugfs_client;
>   };
>   
>   /**

