Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA72E4388A0
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 13:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F4D6E10D;
	Sun, 24 Oct 2021 11:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1D56E108
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 11:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4UjwHqhlZinB2vUUN1dbRV9mgrL0gkzMPLMVhpVUDqI=; b=OyDlWLdV8slnS+VFpMcCWmTn+k
 iHAjSeNYvIc1ugrRhWGds1Bu/vn0DNurwMr0j6anwvr/XkkooSz7lQl7pIAdhRv150fSfKowt1B2P
 OzZOwZ1FCQJBCR6TTiZLZvVCRbRVj7IX9oBbXZ55/AqoC6M+XOYsFYTnm+iInUSqa+LYxUntCEd24
 bWpw/itsxfzp1MkOqZUwQXDWZMLyNKuuRjwnpBsXC++cCYfLKHITOoQpD31na7p0gjG5W/H22CgS0
 k8pGHlfwNM6ppqn2hwNXDpKPBMZsWsaaioATZHqW0/WIXv2gJvkiD9DEbLXPtmcCSOe1Di5NyeDMT
 +d0BT+Xw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52392
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mebjY-0007RS-4M; Sun, 24 Oct 2021 13:32:12 +0200
Subject: Re: [PATCH 4/9] drm/format-helper: Rework format-helper conversion
 functions
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-5-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <34b8daf3-b6b4-02fb-9e10-ef11c0848572@tronnes.org>
Date: Sun, 24 Oct 2021 13:32:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022132829.7697-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 22.10.2021 15.28, skrev Thomas Zimmermann:
> Move destination-buffer clipping from all format-helper conversion
> functions into callers. Support destination-buffer pitch. Only
> distinguish between system and I/O memory, but use same logic
> everywhere.
> 
> Simply harmonize the interface and semantics of the existing code.
> Not all conversion helpers support all combinations of parameters.
> We have to add additional features when we need them.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

>  /**
>   * drm_fb_xrgb8888_to_gray8 - Convert XRGB8888 to grayscale
>   * @dst: 8-bit grayscale destination buffer
> + * @dst_pitch: Number of bytes between two consecutive scanlines within dst
>   * @vaddr: XRGB8888 source buffer
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
> @@ -415,16 +417,21 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_dstclip);
>   *
>   * ITU BT.601 is used for the RGB -> luma (brightness) conversion.
>   */
> -void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
> -			       struct drm_rect *clip)
> +void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
> +			      const struct drm_framebuffer *fb, const struct drm_rect *clip)
>  {
>  	unsigned int len = (clip->x2 - clip->x1) * sizeof(u32);
>  	unsigned int x, y;
>  	void *buf;
> -	u32 *src;
> +	u8 *dst8;
> +	u32 *src32;
>  
>  	if (WARN_ON(fb->format->format != DRM_FORMAT_XRGB8888))
>  		return;
> +
> +	if (!dst_pitch)

len is source length (should really have been named src_len) which
results in a kernel crash:

> +		dst_pitch = len;

This works:

		dst_pitch = drm_rect_width(clip);

With that fixed:

Tested-by: Noralf Trønnes <noralf@tronnes.org>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

> +
>  	/*
>  	 * The cma memory is write-combined so reads are uncached.
>  	 * Speed up by fetching one line at a time.
> @@ -433,20 +440,22 @@ void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
>  	if (!buf)
>  		return;
>  
> +	vaddr += clip_offset(clip, fb->pitches[0], sizeof(u32));
>  	for (y = clip->y1; y < clip->y2; y++) {
> -		src = vaddr + (y * fb->pitches[0]);
> -		src += clip->x1;
> -		memcpy(buf, src, len);
> -		src = buf;
> +		dst8 = dst;
> +		src32 = memcpy(buf, vaddr, len);
>  		for (x = clip->x1; x < clip->x2; x++) {
> -			u8 r = (*src & 0x00ff0000) >> 16;
> -			u8 g = (*src & 0x0000ff00) >> 8;
> -			u8 b =  *src & 0x000000ff;
> +			u8 r = (*src32 & 0x00ff0000) >> 16;
> +			u8 g = (*src32 & 0x0000ff00) >> 8;
> +			u8 b =  *src32 & 0x000000ff;
>  
>  			/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
> -			*dst++ = (3 * r + 6 * g + b) / 10;
> -			src++;
> +			*dst8++ = (3 * r + 6 * g + b) / 10;
> +			src32++;
>  		}
> +
> +		vaddr += fb->pitches[0];
> +		dst += dst_pitch;
>  	}
>  
>  	kfree(buf);
