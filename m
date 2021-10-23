Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED3438245
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 09:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AFC6E5BB;
	Sat, 23 Oct 2021 07:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544D36E5BB
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 07:49:05 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id b451e108-33d5-11ec-9c3f-0050568c148b;
 Sat, 23 Oct 2021 07:49:08 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id DAC4F194B21;
 Sat, 23 Oct 2021 09:49:01 +0200 (CEST)
Date: Sat, 23 Oct 2021 09:49:00 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, javierm@redhat.com, kernel@amanoeldawod.com,
 dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch, aros@gmx.com,
 joshua@stroblindustries.com, arnd@arndb.de,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 1/9] drm/format-helper: Export drm_fb_clip_offset()
Message-ID: <YXO+bGIW9sn9Rcfw@ravnborg.org>
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022132829.7697-2-tzimmermann@suse.de>
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

Hi Thomas,

On Fri, Oct 22, 2021 at 03:28:21PM +0200, Thomas Zimmermann wrote:
> Provide a function that computes the offset into a blit destination
> buffer. This will allow to move destination-buffer clipping into the
> format-helper callers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 10 ++++++++--
>  include/drm/drm_format_helper.h     |  4 ++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 69fde60e36b3..28e9d0d89270 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -17,12 +17,18 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_rect.h>
>  
> -static unsigned int clip_offset(struct drm_rect *clip,
> -				unsigned int pitch, unsigned int cpp)
> +static unsigned int clip_offset(const struct drm_rect *clip, unsigned int pitch, unsigned int cpp)
>  {
>  	return clip->y1 * pitch + clip->x1 * cpp;
>  }
>  
> +unsigned long drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
> +				 const struct drm_rect *clip)
> +{
> +	return clip_offset(clip, pitch, format->cpp[0]);
> +}
> +EXPORT_SYMBOL(drm_fb_clip_offset);

Exported functions are expected to have kernel-doc documentation.
Just copy more or less from the changelog I think.

Anywhere else (I looked in struct drm_framebuffer) we only need unsigned
int for offsets and width/length - so I cannot see why we do an unsigned
int => unsigned long conversion here.

	Sam

> +
>  /**
>   * drm_fb_memcpy - Copy clip buffer
>   * @dst: Destination buffer
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index e86925cf07b9..90b9bd9ecb83 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -6,9 +6,13 @@
>  #ifndef __LINUX_DRM_FORMAT_HELPER_H
>  #define __LINUX_DRM_FORMAT_HELPER_H
>  
> +struct drm_format_info;
>  struct drm_framebuffer;
>  struct drm_rect;
>  
> +unsigned long drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
> +				 const struct drm_rect *clip);
> +
>  void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *fb,
>  		   struct drm_rect *clip);
>  void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch, void *vaddr,
> -- 
> 2.33.0
