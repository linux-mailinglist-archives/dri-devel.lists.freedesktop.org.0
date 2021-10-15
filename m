Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B224D42FD1A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 22:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CCC6E3DF;
	Fri, 15 Oct 2021 20:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90446E3DF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 20:49:55 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 781e2585-2df9-11ec-ac3c-0050568cd888;
 Fri, 15 Oct 2021 20:50:02 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5FC45194B3E;
 Fri, 15 Oct 2021 22:50:01 +0200 (CEST)
Date: Fri, 15 Oct 2021 22:49:51 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Qing Wang <wangqing@vivo.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: replace snprintf in show functions with
 sysfs_emit
Message-ID: <YWnpb0rggwPh4vh3@ravnborg.org>
References: <1634095680-4377-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634095680-4377-1-git-send-email-wangqing@vivo.com>
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

Hi Qing,
On Tue, Oct 12, 2021 at 08:28:00PM -0700, Qing Wang wrote:
> coccicheck complains about the use of snprintf() in sysfs show functions.
> 
> Fix the coccicheck warning:
> WARNING: use scnprintf or sprintf.
> 
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> Signed-off-by: Qing Wang <wangqing@vivo.com>

Thanks, applied to drm-misc-next.

As fbdev is in maintenance only I was about to skip them.
But the changes was trivial so I took them anyway.

	Sam

> ---
>  drivers/video/fbdev/core/fbsysfs.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
> index 65dae05..2689294 100644
> --- a/drivers/video/fbdev/core/fbsysfs.c
> +++ b/drivers/video/fbdev/core/fbsysfs.c
> @@ -230,7 +230,7 @@ static ssize_t show_bpp(struct device *device, struct device_attribute *attr,
>  			char *buf)
>  {
>  	struct fb_info *fb_info = dev_get_drvdata(device);
> -	return snprintf(buf, PAGE_SIZE, "%d\n", fb_info->var.bits_per_pixel);
> +	return sysfs_emit(buf, "%d\n", fb_info->var.bits_per_pixel);
>  }
>  
>  static ssize_t store_rotate(struct device *device,
> @@ -257,7 +257,7 @@ static ssize_t show_rotate(struct device *device,
>  {
>  	struct fb_info *fb_info = dev_get_drvdata(device);
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n", fb_info->var.rotate);
> +	return sysfs_emit(buf, "%d\n", fb_info->var.rotate);
>  }
>  
>  static ssize_t store_virtual(struct device *device,
> @@ -285,7 +285,7 @@ static ssize_t show_virtual(struct device *device,
>  			    struct device_attribute *attr, char *buf)
>  {
>  	struct fb_info *fb_info = dev_get_drvdata(device);
> -	return snprintf(buf, PAGE_SIZE, "%d,%d\n", fb_info->var.xres_virtual,
> +	return sysfs_emit(buf, "%d,%d\n", fb_info->var.xres_virtual,
>  			fb_info->var.yres_virtual);
>  }
>  
> @@ -293,7 +293,7 @@ static ssize_t show_stride(struct device *device,
>  			   struct device_attribute *attr, char *buf)
>  {
>  	struct fb_info *fb_info = dev_get_drvdata(device);
> -	return snprintf(buf, PAGE_SIZE, "%d\n", fb_info->fix.line_length);
> +	return sysfs_emit(buf, "%d\n", fb_info->fix.line_length);
>  }
>  
>  static ssize_t store_blank(struct device *device,
> @@ -381,7 +381,7 @@ static ssize_t show_pan(struct device *device,
>  			struct device_attribute *attr, char *buf)
>  {
>  	struct fb_info *fb_info = dev_get_drvdata(device);
> -	return snprintf(buf, PAGE_SIZE, "%d,%d\n", fb_info->var.xoffset,
> +	return sysfs_emit(buf, "%d,%d\n", fb_info->var.xoffset,
>  			fb_info->var.yoffset);
>  }
>  
> @@ -390,7 +390,7 @@ static ssize_t show_name(struct device *device,
>  {
>  	struct fb_info *fb_info = dev_get_drvdata(device);
>  
> -	return snprintf(buf, PAGE_SIZE, "%s\n", fb_info->fix.id);
> +	return sysfs_emit(buf, "%s\n", fb_info->fix.id);
>  }
>  
>  static ssize_t store_fbstate(struct device *device,
> @@ -418,7 +418,7 @@ static ssize_t show_fbstate(struct device *device,
>  			    struct device_attribute *attr, char *buf)
>  {
>  	struct fb_info *fb_info = dev_get_drvdata(device);
> -	return snprintf(buf, PAGE_SIZE, "%d\n", fb_info->state);
> +	return sysfs_emit(buf, "%d\n", fb_info->state);
>  }
>  
>  #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> -- 
> 2.7.4
