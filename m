Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CED58A1CE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 22:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9C612B874;
	Thu,  4 Aug 2022 20:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F276512B57A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 20:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=LVncPQXIZVvjSfd4GM0AAxotgY9J9oMnM/NO6XDb2GY=;
 b=H696l484/nQn59x89uR1DGFRId9zm1G9ToGQvVlcWBJbPRVoDYOudr9b+3OEoq9tUXVfnoaSKc8Ie
 vIinjs9ySCuJobittjlf9lTHuRGN8qnKIn1nTmkus7RhhYnUEmBBZ30RcDYOC9xEEkV2Zk2RXRll11
 oc43PH1BA4JvP8hLb+HyI8VrdZbBIIaI1ZS8bDtQaext+h2e7vF1PrDEQqPgEFiEcrj83oB29RENFt
 uJTyMNwMfsnSwgUdS/MuBYpHTQBPb3JTPjwKYrCBNxkpOLZbJjbCVDwD8O4901pHMsbrt2PmCrlpow
 S227EK0+/WGADAz6+3FWn6qpEWBhc/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=LVncPQXIZVvjSfd4GM0AAxotgY9J9oMnM/NO6XDb2GY=;
 b=/1067wmZlwYm2a+CpkHk59xt5O93iYIO4qG9XslvEGMlf8a4jGjr51FzUKQsuCW7T9VOM1onWK2YL
 F4AP1XjDQ==
X-HalOne-Cookie: b1085953002d688f6251e9593a9590aff04e2dbf
X-HalOne-ID: 533de0be-1432-11ed-a91b-d0431ea8a290
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 533de0be-1432-11ed-a91b-d0431ea8a290;
 Thu, 04 Aug 2022 20:16:29 +0000 (UTC)
Date: Thu, 4 Aug 2022 22:16:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 08/12] drm/format-helper: Rework RGB888-to-XRGB8888
 conversion
Message-ID: <YuwpHAK0kx1FltlK@ravnborg.org>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727113312.22407-9-tzimmermann@suse.de>
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

On Wed, Jul 27, 2022 at 01:33:08PM +0200, Thomas Zimmermann wrote:
> Update RGB888-to-XRGB8888 conversion to support struct iosys_map
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
> index 5ef06f696657..155827eebe99 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -465,12 +465,24 @@ static void drm_fb_rgb888_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigne
>  	}
>  }
>  
> -static void drm_fb_rgb888_to_xrgb8888_toio(void __iomem *dst, unsigned int dst_pitch,
> -					   const void *vaddr, const struct drm_framebuffer *fb,
> -					   const struct drm_rect *clip)
> +static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				      const struct iosys_map *vmap,
> +				      const struct drm_framebuffer *fb,
> +				      const struct drm_rect *clip)
>  {
> -	drm_fb_xfrm_toio(dst, dst_pitch, 4, vaddr, fb, clip, false,
> -			 drm_fb_rgb888_to_xrgb8888_line);
> +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +		0, 0, 0, 0
> +	};
> +
> +	if (!dst_pitch)
> +		dst_pitch = default_dst_pitch;
> +
> +	if (dst[0].is_iomem)
> +		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> +				 clip, false, drm_fb_rgb888_to_xrgb8888_line);
> +	else
> +		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> +			    clip, false, drm_fb_rgb888_to_xrgb8888_line);
>  }
>  
>  static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
> @@ -608,8 +620,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  		}
>  	} else if (dst_format == DRM_FORMAT_XRGB8888) {
>  		if (fb_format == DRM_FORMAT_RGB888) {
> -			drm_fb_rgb888_to_xrgb8888_toio(dst[0].vaddr_iomem, dst_pitch[0],
> -						       vmap[0].vaddr, fb, clip);
> +			drm_fb_rgb888_to_xrgb8888(dst, dst_pitch, vmap, fb, clip);
>  			return 0;
>  		} else if (fb_format == DRM_FORMAT_RGB565) {
>  			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, vmap, fb, clip);
> -- 
> 2.37.1
