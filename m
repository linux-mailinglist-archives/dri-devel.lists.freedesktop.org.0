Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A14AE3A05
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 11:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2FF10E29B;
	Mon, 23 Jun 2025 09:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="TvthYNQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242E010E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 09:28:11 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45310223677so29553525e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 02:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1750670889; x=1751275689;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OO/idZQSS5cQFxp8gfwUuiwtWMk5ElukOWUF6vn1f0M=;
 b=TvthYNQU37192MjfL3UrAtMTYfFZVatXafB2wEsR47PoWpA4WEz5ujtkFiUvlOF7OC
 lYyvre70Xtu4rcIuig9uC0c51tUvHfgWTv+H1sAE6zKJgT+vDibiFQB8hJ9WHvVrCari
 Wv9yeiCO1jc4TKMWNpwtOhVUn6JgMHuAMCzFtwGh9N5SJoMuxk2URWyzEySdM1DbFowf
 yDIezy63jByrBmxun8D/xXn8Mkm2AB5kYf/4oSK3s2qoQjfTBPN/SjYQ+5HuLSTFwiN7
 2cKuCBzhWbiV3PHXN0+VZFTD/PCQnpdU4ZVMu8i1FjcCiMZaIqiwsMFqRQJfAXKTKxd3
 wB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750670889; x=1751275689;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OO/idZQSS5cQFxp8gfwUuiwtWMk5ElukOWUF6vn1f0M=;
 b=JUITqZFer3QH6yWlXJ1/W+VVm6JkFyKs2rVYaddc3HFcak7V1GfqE6feJgfafKIgST
 91Xh8gbJXXBEnrWKffDaiyV0VDcpbO7GkA8my4ZxVowZjXw+XcGfYPcQA503s7o6aUb1
 AFB4JavZn7kcVWQLWTAGlSfnEKSpAVJCL+bAkcmZyBkMC+ob2gZSIPv/hqZcico/MNaU
 nWFd2LXaKv+7ON14gqe78wLVycxJMG2Rddz35kIjTzEyFYFEn98ZfduwuY9fXgMwY/8m
 VuHPPR5UwMMW+960M+ZarFHkm3sEwE9XbDb5Vk0I1mqE5RJPy+/vUMqmMVEKTMMDGZSI
 wxDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQsHXpnPI2IQaFzcW2h0WIPYEAt0e1kLVX7uGmjIQtrragIIiF/h/qwt1PNwKGfvNQRnvPywT/Mfk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO77B7CK9jA4nDDra5p+6lrN6pblAQU52L1xcXBMesl65CzPDA
 T422uz6YcsUfFWHJsx2/trJlpLUSQoszUmlHhQLGi3QfBVWLid0uxirdCuG+IQv3lvU=
X-Gm-Gg: ASbGncs/oMIXLlk954VTV1254gTsu1aGlqTjHdS9RbKYoH8ocTJtQwkefx9fAzdUNEW
 x7SEv2znCGJ0LRjQIFlkI5FoZYnUzrQk1MQtZqwIsnquSX5rTzp1Qg13CAnAQRr8m528yx8DCA4
 ozdg7BZ1rkpDFiZkmaTeQkGQPHxcWVvZkExpKkp1EwgVt6KNaJMbjBbH2eqQay9wl0CwaYvfF9m
 Zuam9ygtB/W+hN2Kgd9G+Y1LuT4eu1GlO6rMI0dlRLDPU8KpAxQ8bJ8B7hZtuR8H8monNk7S5bf
 Jch/uzcdFZtcs63ynVueciU0Jh+/xSYLScwa5UVW20hikmWShyHLnwqtk1luYJCEsvfLBXxRrsf
 UXkb7WDmztS8=
X-Google-Smtp-Source: AGHT+IF1e17PymZsogQru2VIH1zKILybdvwE2KT6iLXFL7wEy6C6BpmVNAbvrRZr+vgDkS0RbHsFlg==
X-Received: by 2002:a05:600c:4512:b0:453:5c30:a1d0 with SMTP id
 5b1f17b1804b1-4536e0da765mr50193325e9.21.1750670888914; 
 Mon, 23 Jun 2025 02:28:08 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535ead202asm137905985e9.27.2025.06.23.02.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 02:28:08 -0700 (PDT)
Message-ID: <d1372124-616b-4bc7-8a5c-50c524bc3e5d@ursulin.net>
Date: Mon, 23 Jun 2025 10:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm: add debugfs support on per client-id basis
To: Sunil Khatri <sunil.khatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 phasta@kernel.org, dakr@kernel.org
References: <20250618134747.3893138-1-sunil.khatri@amd.com>
 <20250618134747.3893138-2-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250618134747.3893138-2-sunil.khatri@amd.com>
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



On 18/06/2025 14:47, Sunil Khatri wrote:
> add support to add a directory for each client-id
> with root at the dri level. Since the clients are
> unique and not just related to one single drm device,
> so it makes more sense to add all the client based
> nodes with root as dri.
> 
> Also create a symlink back to the parent drm device
> from each client.

TBH I can see an use case for both clients at DRI level and clients 
under DRM devices. I guess you have an use case for global and per 
device can be added later if it becomes needed.

> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/drm_debugfs.c | 32 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_file.c    | 10 ++++++++++
>   include/drm/drm_debugfs.h     | 12 ++++++++++++
>   include/drm/drm_file.h        |  7 +++++++
>   4 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 5a33ec299c04..875276d5fb9f 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -298,6 +298,38 @@ void drm_debugfs_remove_dir(void)
>   	debugfs_remove(drm_debugfs_root);
>   }
>   
> +int drm_debugfs_clients_add(struct drm_file *file)
> +{
> +	struct drm_device *dev;
> +	char *client_dir, *symlink;
> +
> +	dev = file->minor->dev;

FWIW, as dev is only used once and string locals are not overlapping, 
you could reduce to a single local variable like char *name and re-use 
it. Up to you.

> +
> +	client_dir = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
> +	if (!client_dir)
> +		return -ENOMEM;

It is a bit more work, but I think a clients/ directory with numerical 
client id subdirs would be nicer.

> +
> +	/* Create a debugfs directory for the client in root on drm debugfs */
> +	file->debugfs_client = debugfs_create_dir(client_dir, drm_debugfs_root);
> +	kfree(client_dir);
> +
> +	symlink = kasprintf(GFP_KERNEL, "../%s", dev->unique);
> +	if (!symlink)
> +		return -ENOMEM;

Worth removing the partial construction?

> +
> +	/* Create a link from client_id to the drm device this client id belongs to */
> +	debugfs_create_symlink("device", file->debugfs_client, symlink);

This can also fail.

> +	kfree(symlink);
> +
> +	return 0;
> +}
> +
> +void drm_debugfs_clients_remove(struct drm_file *file)
> +{
> +	debugfs_remove_recursive(file->debugfs_client);
> +	file->debugfs_client = NULL;
> +}
> +
>   /**
>    * drm_debugfs_dev_init - create debugfs directory for the device
>    * @dev: the device which we want to create the directory for
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 06ba6dcbf5ae..8502c5a630b1 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -39,12 +39,14 @@
>   #include <linux/poll.h>
>   #include <linux/slab.h>
>   #include <linux/vga_switcheroo.h>
> +#include <linux/debugfs.h>
>   
>   #include <drm/drm_client_event.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_gem.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_debugfs.h>
>   
>   #include "drm_crtc_internal.h"
>   #include "drm_internal.h"
> @@ -143,6 +145,13 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   	rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>   	file->minor = minor;
>   
> +	ret = drm_debugfs_clients_add(file);

Slightly tricky part is that as soon as this runs userspace can enter 
debugfs. If in the future any debufs clients file is added which can 
dereference any of the drm_file fields not yet initialized it has the 
potential to explode and/or be exploited.

Hence I think to be safe the usual pattern of exposing drm_file to 
userspace at the end, only _after_ drm_file has been *fully* initialized.

Slightly annoying part with that might be undoing dev->driver->open() 
but maybe it is not that bad.

> +	if (ret) {
> +		put_pid(rcu_access_pointer(file->pid));
> +		kfree(file);
> +		return ERR_PTR(ret);

Onion unwind already exists in the function so could have used it. (Add 
a new label and here simply "goto out_put_pid".) But as above we discuss 
tweaking the order lets see how that goes first.

> +	}
> +
>   	/* for compatibility root is always authenticated */
>   	file->authenticated = capable(CAP_SYS_ADMIN);
>   
> @@ -236,6 +245,7 @@ void drm_file_free(struct drm_file *file)
>   		     atomic_read(&dev->open_count));
>   
>   	drm_events_release(file);
> +	drm_debugfs_clients_remove(file);
>   
>   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>   		drm_fb_release(file);
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index cf06cee4343f..4bd6cc1d0900 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>   
>   int drm_debugfs_gpuva_info(struct seq_file *m,
>   			   struct drm_gpuvm *gpuvm);
> +
> +int drm_debugfs_clients_add(struct drm_file *file);
> +void drm_debugfs_clients_remove(struct drm_file *file);
>   #else
>   static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>   					    int count, struct dentry *root,
> @@ -181,6 +184,15 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
>   {
>   	return 0;
>   }
> +
> +int drm_debugfs_clients_add(struct drm_file *file)
> +{
> +	return 0;
> +}
> +
> +void drm_debugfs_clients_remove(struct drm_file *file)
> +{
> +}

Static inline for the two above.

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

Is it worth idefing this out if !CONFIG_DEBUG_FS?

Regards,

Tvrtko

>   };
>   
>   /**

