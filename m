Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92FE8FE6CD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 14:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA0410E936;
	Thu,  6 Jun 2024 12:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BFD3C10E936
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 12:48:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B99339
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 05:49:12 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B0ECD3F64C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 05:48:47 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:48:41 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: pengfuyuan <pengfuyuan@kylinos.cn>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] arm/komeda: Remove all CONFIG_DEBUG_FS conditional
 compilations
Message-ID: <ZmGwKbsPfasPTOqx@e110455-lin.cambridge.arm.com>
References: <20240606120842.1377267-1-pengfuyuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240606120842.1377267-1-pengfuyuan@kylinos.cn>
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

On Thu, Jun 06, 2024 at 08:08:42PM +0800, pengfuyuan wrote:
> Since the debugfs functions have no-op stubs for CONFIG_DEBUG_FS=n,
> the compiler will optimize the rest away since they are no longer referenced.
> 
> The benefit of removing the conditional compilation is that the build
> is actually tested for both CONFIG_DEBUG_FS configuration values.
> Assuming most developers have it enabled, CONFIG_DEBUG_FS=n is not tested
> much and may fail the build due to the conditional compilation.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the cleanup!

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index 14ee79becacb..5ba62e637a61 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -12,10 +12,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/dma-mapping.h>
> -#ifdef CONFIG_DEBUG_FS
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
> -#endif
>  
>  #include <drm/drm_print.h>
>  
> @@ -43,7 +41,6 @@ static int komeda_register_show(struct seq_file *sf, void *x)
>  
>  DEFINE_SHOW_ATTRIBUTE(komeda_register);
>  
> -#ifdef CONFIG_DEBUG_FS
>  static void komeda_debugfs_init(struct komeda_dev *mdev)
>  {
>  	if (!debugfs_initialized())
> @@ -55,7 +52,6 @@ static void komeda_debugfs_init(struct komeda_dev *mdev)
>  	debugfs_create_x16("err_verbosity", 0664, mdev->debugfs_root,
>  			   &mdev->err_verbosity);
>  }
> -#endif
>  
>  static ssize_t
>  core_id_show(struct device *dev, struct device_attribute *attr, char *buf)
> @@ -265,9 +261,7 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
>  
>  	mdev->err_verbosity = KOMEDA_DEV_PRINT_ERR_EVENTS;
>  
> -#ifdef CONFIG_DEBUG_FS
>  	komeda_debugfs_init(mdev);
> -#endif
>  
>  	return mdev;
>  
> @@ -286,9 +280,7 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
>  
>  	sysfs_remove_group(&dev->kobj, &komeda_sysfs_attr_group);
>  
> -#ifdef CONFIG_DEBUG_FS
>  	debugfs_remove_recursive(mdev->debugfs_root);
> -#endif
>  
>  	if (mdev->aclk)
>  		clk_prepare_enable(mdev->aclk);
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
