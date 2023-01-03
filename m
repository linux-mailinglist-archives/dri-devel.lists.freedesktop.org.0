Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C520065C11B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 14:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756E510E1F2;
	Tue,  3 Jan 2023 13:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B70C10E1F2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 13:48:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C01EF152B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 05:49:39 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D9F6B3F587
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 05:48:57 -0800 (PST)
Date: Tue, 3 Jan 2023 13:48:54 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 3/9] drm/arm/hdlcd: use new debugfs device-centered
 functions
Message-ID: <Y7QyRlrZ2hwnZ+aU@e110455-lin.cambridge.arm.com>
References: <20221226155029.244355-1-mcanal@igalia.com>
 <20221226155029.244355-4-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226155029.244355-4-mcanal@igalia.com>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>, Tomi Valkeinen <tomba@kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, noralf@tronnes.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 26, 2022 at 12:50:23PM -0300, Maíra Canal wrote:
> Replace the use of drm_debugfs_create_files() with the new
> drm_debugfs_add_files() function, which center the debugfs files
> management on the drm_device instead of drm_minor. Moreover, remove the
> debugfs_init hook and add the debugfs files directly on hdlcd_drm_bind(),
> before drm_dev_register().
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 7043d1c9ed8f..e3507dd6f82a 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -195,8 +195,8 @@ static int hdlcd_setup_mode_config(struct drm_device *drm)
>  #ifdef CONFIG_DEBUG_FS
>  static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
>  {
> -	struct drm_info_node *node = (struct drm_info_node *)m->private;
> -	struct drm_device *drm = node->minor->dev;
> +	struct drm_debugfs_entry *entry = m->private;
> +	struct drm_device *drm = entry->dev;
>  	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
>  
>  	seq_printf(m, "underrun : %d\n", atomic_read(&hdlcd->buffer_underrun_count));
> @@ -208,8 +208,8 @@ static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
>  
>  static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
>  {
> -	struct drm_info_node *node = (struct drm_info_node *)m->private;
> -	struct drm_device *drm = node->minor->dev;
> +	struct drm_debugfs_entry *entry = m->private;
> +	struct drm_device *drm = entry->dev;
>  	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
>  	unsigned long clkrate = clk_get_rate(hdlcd->clk);
>  	unsigned long mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
> @@ -219,17 +219,10 @@ static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
>  	return 0;
>  }
>  
> -static struct drm_info_list hdlcd_debugfs_list[] = {
> +static struct drm_debugfs_info hdlcd_debugfs_list[] = {
>  	{ "interrupt_count", hdlcd_show_underrun_count, 0 },
>  	{ "clocks", hdlcd_show_pxlclock, 0 },
>  };
> -
> -static void hdlcd_debugfs_init(struct drm_minor *minor)
> -{
> -	drm_debugfs_create_files(hdlcd_debugfs_list,
> -				 ARRAY_SIZE(hdlcd_debugfs_list),
> -				 minor->debugfs_root, minor);
> -}
>  #endif
>  
>  DEFINE_DRM_GEM_DMA_FOPS(fops);
> @@ -237,9 +230,6 @@ DEFINE_DRM_GEM_DMA_FOPS(fops);
>  static const struct drm_driver hdlcd_driver = {
>  	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	DRM_GEM_DMA_DRIVER_OPS,
> -#ifdef CONFIG_DEBUG_FS
> -	.debugfs_init = hdlcd_debugfs_init,
> -#endif
>  	.fops = &fops,
>  	.name = "hdlcd",
>  	.desc = "ARM HDLCD Controller DRM",
> @@ -303,6 +293,10 @@ static int hdlcd_drm_bind(struct device *dev)
>  	drm_mode_config_reset(drm);
>  	drm_kms_helper_poll_init(drm);
>  
> +#ifdef CONFIG_DEBUG_FS
> +	drm_debugfs_add_files(drm, hdlcd_debugfs_list, ARRAY_SIZE(hdlcd_debugfs_list));
> +#endif
> +
>  	ret = drm_dev_register(drm, 0);
>  	if (ret)
>  		goto err_register;
> -- 
> 2.38.1
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
