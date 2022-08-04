Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13358A1D3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 22:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0137DA31E6;
	Thu,  4 Aug 2022 20:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C332BB36
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 20:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DNqmkaKMKnISPtv5wC+vPl3xkF5czvxxy3xnKMxkjmg=;
 b=UdflbW5Y2BeCQunoX9M1KU39PvcYu5ZXLu6S0AeGpEJL5Vr5OU5LnJXlY0SXnbewb+rpI0bS0bOuZ
 lPDJ0/jmKMXD1D2OCcosdgl88jw6rXZ6X18MB0T2kWXgaN6vkPaDW23hnQUaxhPL5LHx7XtEtzqqYv
 GY+bcxNQ2EHmM+94pfs9btV86oMV7TlC47MHtDuMat3DILPPx5lqF6eYw7A+Bf3gXlQhwKS2YTUJHg
 pVGb8XAXQvpkEUT+Spzuf4/KlZKP6Fm61aaskNZNaflcWEuvf2fuGbQRcoB5D53qSzzWN4Rrpj7Wj8
 ON/Hl6oXSgLDx6Iz9oVNYs4BmlwNDvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DNqmkaKMKnISPtv5wC+vPl3xkF5czvxxy3xnKMxkjmg=;
 b=FhlagNoKxlYqS94AXWvmDBygZew6Px8xVVW7KiyIXEKkKc2Rr+aykK0e1i0QjrGv7n1JoYJCtEPYh
 6CMmoblBA==
X-HalOne-Cookie: 05eff1564df8a6e2cca183d9ceb272af988ea7f8
X-HalOne-ID: 783d4bc4-1432-11ed-a6ca-d0431ea8a283
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 783d4bc4-1432-11ed-a6ca-d0431ea8a283;
 Thu, 04 Aug 2022 20:17:31 +0000 (UTC)
Date: Thu, 4 Aug 2022 22:17:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 09/12] drm/format-helper: Rework XRGB8888-to-XRGB2101010
 conversion
Message-ID: <YuwpWgwm6P/KDz7Q@ravnborg.org>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727113312.22407-10-tzimmermann@suse.de>
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

On Wed, Jul 27, 2022 at 01:33:09PM +0200, Thomas Zimmermann wrote:
> Update XRGB8888-to-XRGB2101010 conversion to support struct iosys_map
> and convert all users. Although these are single-plane color formats,
> the new interface supports multi-plane formats for consistency with
> drm_fb_blit().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>  drivers/gpu/drm/drm_format_helper.c | 35 +++++++++++++++++------------
>  include/drm/drm_format_helper.h     |  6 ++---
>  2 files changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 155827eebe99..209f63b66c5f 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -504,26 +504,34 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
>  }
>  
>  /**
> - * drm_fb_xrgb8888_to_xrgb2101010_toio - Convert XRGB8888 to XRGB2101010 clip
> - * buffer
> - * @dst: XRGB2101010 destination buffer (iomem)
> - * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> - * @vaddr: XRGB8888 source buffer
> + * drm_fb_xrgb8888_to_xrgb2101010 - Convert XRGB8888 to XRGB2101010 clip buffer
> + * @dst: Array of XRGB2101010 destination buffers
> + * @dst_pitch: Array of numbers of bytes between two consecutive scanlines within dst
> + * @vmap: Array of XRGB8888 source buffers
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
>   *
>   * Drivers can use this function for XRGB2101010 devices that don't natively
>   * support XRGB8888.
>   */
> -void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst,
> -					 unsigned int dst_pitch, const void *vaddr,
> -					 const struct drm_framebuffer *fb,
> -					 const struct drm_rect *clip)
> +void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +				    const struct drm_rect *clip)
>  {
> -	drm_fb_xfrm_toio(dst, dst_pitch, 4, vaddr, fb, clip, false,
> -			 drm_fb_xrgb8888_to_xrgb2101010_line);
> +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +		0, 0, 0, 0
> +	};
> +
> +	if (!dst_pitch)
> +		dst_pitch = default_dst_pitch;
> +
> +	if (dst[0].is_iomem)
> +		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> +				 clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
> +	else
> +		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> +			    clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
>  }
> -EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_toio);
>  
>  static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
> @@ -628,8 +636,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  		}
>  	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
>  		if (fb_format == DRM_FORMAT_XRGB8888) {
> -			drm_fb_xrgb8888_to_xrgb2101010_toio(dst[0].vaddr_iomem, dst_pitch[0],
> -							    vmap[0].vaddr, fb, clip);
> +			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, vmap, fb, clip);
>  			return 0;
>  		}
>  	}
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 8c633dbab5d6..6807440ce29c 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -29,9 +29,9 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
>  void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
>  			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip);
> -void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst, unsigned int dst_pitch,
> -					 const void *vaddr, const struct drm_framebuffer *fb,
> -					 const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +				    const struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
>  			      const struct drm_framebuffer *fb, const struct drm_rect *clip);
>  
> -- 
> 2.37.1
