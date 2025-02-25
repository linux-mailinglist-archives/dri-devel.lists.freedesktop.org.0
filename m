Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD98A43B88
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D5B10E60C;
	Tue, 25 Feb 2025 10:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.dudau.co.uk (dliviu.plus.com [80.229.23.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0D010E616
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:28:05 +0000 (UTC)
Received: from mail.dudau.co.uk (bart.dudau.co.uk [192.168.14.2])
 by smtp.dudau.co.uk (Postfix) with SMTP id 89AEF41E2245;
 Tue, 25 Feb 2025 10:28:02 +0000 (GMT)
Received: by mail.dudau.co.uk (sSMTP sendmail emulation);
 Tue, 25 Feb 2025 10:28:02 +0000
Date: Tue, 25 Feb 2025 10:28:02 +0000
From: Liviu Dudau <liviu@dudau.co.uk>
To: oushixiong1025@163.com
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] drm/arm/komeda: Add a condition check before removing
 sysfs attribute
Message-ID: <Z72bMsXmoQv1UVv0@bart.dudau.co.uk>
References: <20250220085358.232883-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220085358.232883-1-oushixiong1025@163.com>
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

Hello,

Replying from my personal email as the corporate system seems to have blackholed your emails
while I was on holiday.

Can you tell me more why you think that if sysfs_create_group() fails we should not call
sysfs_remove_group()? After all, we don't know how far sysfs_create_group() has progressed before
it encountered an error, so we still need to do some cleanup.

Best regards,
Liviu

On Thu, Feb 20, 2025 at 04:53:58PM +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> [WHY] If the call to sysfs_create_group() fails, there is
>       no need to call function sysfs_remove_group().
> 
> [HOW] Add a condition check before removing sysfs attribute.
> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 7 ++++++-
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.h | 2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index 5ba62e637a61..7d646f978640 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -259,6 +259,8 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
>  		goto err_cleanup;
>  	}
>  
> +	mdev->sysfs_attr_enabled = true;
> +
>  	mdev->err_verbosity = KOMEDA_DEV_PRINT_ERR_EVENTS;
>  
>  	komeda_debugfs_init(mdev);
> @@ -278,7 +280,10 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
>  	const struct komeda_dev_funcs *funcs = mdev->funcs;
>  	int i;
>  
> -	sysfs_remove_group(&dev->kobj, &komeda_sysfs_attr_group);
> +	if (mdev->sysfs_attr_enabled) {
> +		sysfs_remove_group(&dev->kobj, &komeda_sysfs_attr_group);
> +		mdev->sysfs_attr_enabled = false;
> +	}
>  
>  	debugfs_remove_recursive(mdev->debugfs_root);
>  
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> index 5b536f0cb548..af087540325c 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> @@ -216,6 +216,8 @@ struct komeda_dev {
>  #define KOMEDA_DEV_PRINT_DUMP_STATE_ON_EVENT BIT(8)
>  	/* Disable rate limiting of event prints (normally one per commit) */
>  #define KOMEDA_DEV_PRINT_DISABLE_RATELIMIT BIT(12)
> +
> +	bool sysfs_attr_enabled;
>  };
>  
>  static inline bool
> -- 
> 2.17.1
> 

-- 
Everyone who uses computers frequently has had, from time to time,
a mad desire to attack the precocious abacus with an axe.
       	   	      	     	  -- John D. Clark, Ignition!
