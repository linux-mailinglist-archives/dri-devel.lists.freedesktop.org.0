Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FBA58A1CA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 22:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD10BA69C5;
	Thu,  4 Aug 2022 20:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF8FA694C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 20:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=XQ+kkmE4Ic07chp0AfJlC9OlFc9+61+pKDSgSKBxebA=;
 b=TCfgUXEUFJ19oq7/funrOIu+L7gd0wRcTbgHqf94s6fkDRsfnewHHvJoJhxjDiQodMJYBQdv3C3Gs
 eOAs2tRs9ZBZW8lL4wuITmNLY2/GMUe7h+njBD7+VFraadwdCqckGxWKKF8JX/j2nokaCxNTLUmgyw
 SjRJ75B2AsoPK6GmyuaZHyvQTdQyvl52QNJlWgP1RYBFT1MtjNftSXfjnWPYZCczDLbBUqSqqK5I5T
 vz9FIjJPJaFoqerWaV24w9wznrXWNpmHXudIDI057U+ZQFrn52zUgWKSgQygYt7ZlZ14n9hZnw1uIO
 DMSR9j4pcXUhJuHsrThRjLK7OpPG9Zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=XQ+kkmE4Ic07chp0AfJlC9OlFc9+61+pKDSgSKBxebA=;
 b=VhXfE8BpE6rR/ibzr7tFyWrYtPx5VN1SNhRdc2dXgDRyRcO2Mjs/ydHMboQMt6ffH6Vw+fgb/XTG0
 o3QMju0Cg==
X-HalOne-Cookie: 9aca289c7c13756da8167dac35c4f69f9101c708
X-HalOne-ID: 28663d94-1432-11ed-be81-d0431ea8bb03
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 28663d94-1432-11ed-be81-d0431ea8bb03;
 Thu, 04 Aug 2022 20:15:18 +0000 (UTC)
Date: Thu, 4 Aug 2022 22:15:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 07/12] drm/format-helper: Rework RGB565-to-XRGB8888
 conversion
Message-ID: <Yuwo1J6UPEDBirQC@ravnborg.org>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727113312.22407-8-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, jose.exposito89@gmail.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 27, 2022 at 01:33:07PM +0200, Thomas Zimmermann wrote:
> Update RGB565-to-XRGB8888 conversion to support struct iosys_map
> and convert all users. Although these are single-plane color formats,
> the new interface supports multi-plane formats for consistency with
> drm_fb_blit().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 4edab44336d8..5ef06f696657 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -430,12 +430,24 @@ static void drm_fb_rgb565_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigne
>  	}
>  }
>  
> -static void drm_fb_rgb565_to_xrgb8888_toio(void __iomem *dst, unsigned int dst_pitch,
> -					   const void *vaddr, const struct drm_framebuffer *fb,
> -					   const struct drm_rect *clip)
> +static void drm_fb_rgb565_to_xrgb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				      const struct iosys_map *vmap,
> +				      const struct drm_framebuffer *fb,
> +				      const struct drm_rect *clip)
>  {
> -	drm_fb_xfrm_toio(dst, dst_pitch, 4, vaddr, fb, clip, false,
> -			 drm_fb_rgb565_to_xrgb8888_line);
> +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +		0, 0, 0, 0
> +	};
> +
> +	if (!dst_pitch)
> +		dst_pitch = default_dst_pitch;
> +
> +	if (dst[0].is_iomem)
> +		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> +				 clip, false, drm_fb_rgb565_to_xrgb8888_line);
> +	else
> +		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> +			    clip, false, drm_fb_rgb565_to_xrgb8888_line);
>  }
>  
>  static void drm_fb_rgb888_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> @@ -600,8 +612,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  						       vmap[0].vaddr, fb, clip);
>  			return 0;
>  		} else if (fb_format == DRM_FORMAT_RGB565) {
> -			drm_fb_rgb565_to_xrgb8888_toio(dst[0].vaddr_iomem, dst_pitch[0],
> -						       vmap[0].vaddr, fb, clip);
> +			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, vmap, fb, clip);
>  			return 0;
>  		}
>  	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
> -- 
> 2.37.1
