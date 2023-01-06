Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7966075D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 20:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE17510E8C4;
	Fri,  6 Jan 2023 19:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D2A10E8BF;
 Fri,  6 Jan 2023 19:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xQYicUI5pilH9ibbuYVlz1AZN0BhraOQ2YsarXqDJU8=; b=FY6FdOtVxuzQomSUgvgXrBER38
 tVnwyB+w8spNhzmJkHbISwM0BSprhp0qbDqQmnvtlWezwGQ42mOHXyTlcfiPpHmN4ei1RnPL8DtcK
 RpCK+Hc21CfWY9EBYD7o6d6f+JG//dIF/gdLGCkrG2ta1TJyKCIuLU5+qFVhuH3wGVqsuxQYSg4zI
 zVcpk4R1TijWv1CbOkEp5E/hFF5pb3QOkPBDgUNufe8+6/HxmxA5//uS/bkA9IcJDD/1jqK3NcFb6
 VafpRrWAdJuK9mdYsgMyqOLMn1JaOA/77sHxwGt8SYwwUg+LbuF+BRQw58V5O7DU+0WtnVxLL/uwc
 qqyFa7+g==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pDsiQ-0018zB-T0; Fri, 06 Jan 2023 20:49:23 +0100
Message-ID: <24309184-0260-ce92-5a28-4c0d99c611d2@igalia.com>
Date: Fri, 6 Jan 2023 16:49:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/9] drm/arm/hdlcd: use new debugfs device-centered
 functions
Content-Language: en-US
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221226155029.244355-1-mcanal@igalia.com>
 <20221226155029.244355-4-mcanal@igalia.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221226155029.244355-4-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>,
 Liviu Dudau <liviu.dudau@arm.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 etnaviv@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Melissa Wen <mwen@igalia.com>, noralf@tronnes.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/26/22 12:50, Maíra Canal wrote:
> Replace the use of drm_debugfs_create_files() with the new
> drm_debugfs_add_files() function, which center the debugfs files
> management on the drm_device instead of drm_minor. Moreover, remove the
> debugfs_init hook and add the debugfs files directly on hdlcd_drm_bind(),
> before drm_dev_register().
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Applied to drm/drm-misc (drm-misc-next).

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/arm/hdlcd_drv.c | 24 +++++++++---------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 7043d1c9ed8f..e3507dd6f82a 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -195,8 +195,8 @@ static int hdlcd_setup_mode_config(struct drm_device *drm)
>   #ifdef CONFIG_DEBUG_FS
>   static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *)m->private;
> -	struct drm_device *drm = node->minor->dev;
> +	struct drm_debugfs_entry *entry = m->private;
> +	struct drm_device *drm = entry->dev;
>   	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
>   
>   	seq_printf(m, "underrun : %d\n", atomic_read(&hdlcd->buffer_underrun_count));
> @@ -208,8 +208,8 @@ static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
>   
>   static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *)m->private;
> -	struct drm_device *drm = node->minor->dev;
> +	struct drm_debugfs_entry *entry = m->private;
> +	struct drm_device *drm = entry->dev;
>   	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
>   	unsigned long clkrate = clk_get_rate(hdlcd->clk);
>   	unsigned long mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
> @@ -219,17 +219,10 @@ static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
>   	return 0;
>   }
>   
> -static struct drm_info_list hdlcd_debugfs_list[] = {
> +static struct drm_debugfs_info hdlcd_debugfs_list[] = {
>   	{ "interrupt_count", hdlcd_show_underrun_count, 0 },
>   	{ "clocks", hdlcd_show_pxlclock, 0 },
>   };
> -
> -static void hdlcd_debugfs_init(struct drm_minor *minor)
> -{
> -	drm_debugfs_create_files(hdlcd_debugfs_list,
> -				 ARRAY_SIZE(hdlcd_debugfs_list),
> -				 minor->debugfs_root, minor);
> -}
>   #endif
>   
>   DEFINE_DRM_GEM_DMA_FOPS(fops);
> @@ -237,9 +230,6 @@ DEFINE_DRM_GEM_DMA_FOPS(fops);
>   static const struct drm_driver hdlcd_driver = {
>   	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>   	DRM_GEM_DMA_DRIVER_OPS,
> -#ifdef CONFIG_DEBUG_FS
> -	.debugfs_init = hdlcd_debugfs_init,
> -#endif
>   	.fops = &fops,
>   	.name = "hdlcd",
>   	.desc = "ARM HDLCD Controller DRM",
> @@ -303,6 +293,10 @@ static int hdlcd_drm_bind(struct device *dev)
>   	drm_mode_config_reset(drm);
>   	drm_kms_helper_poll_init(drm);
>   
> +#ifdef CONFIG_DEBUG_FS
> +	drm_debugfs_add_files(drm, hdlcd_debugfs_list, ARRAY_SIZE(hdlcd_debugfs_list));
> +#endif
> +
>   	ret = drm_dev_register(drm, 0);
>   	if (ret)
>   		goto err_register;
