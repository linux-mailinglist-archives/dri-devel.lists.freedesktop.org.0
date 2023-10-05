Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 387907B9CAF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 13:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8236E10E1D9;
	Thu,  5 Oct 2023 11:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1245910E3D9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 11:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RSpICeh/MevNGsT6iGlo6bGVDCLO2hZUzmIcDYgyWbQ=; b=QaOO/R1daUHp6CFPPGCT45ax3F
 qQqmQ8dLeIr2CqfDxYGUsciVvYZWWiXlttDAyY0ScyCiA4I6xDcZOBBN5J2INKUob6mvEoUTr9MCG
 fP0VNgrRyL9qcF17OMoxqtF4QghwzvyNvVLDslvgLQEze51R/4EMs+br5VrAWWCenBQ/sWzMfdCSS
 Dff4g3hBBmuZPzxADVLxkVo/h0Rt1dVR5ZiG3ITMBQYmLKBJrW1Ji34G0Thx0mlybtZVdMbT3TBCN
 aAtTyV/1nsjfnT12JQyzoagiO/tUq5+LobSv0ITZVwATf1f6N4hBsvOH5gfJHthmEpy7gW8pB0w1C
 Kh+J22eA==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=33556)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qoMFA-005kbe-6B;
 Thu, 05 Oct 2023 13:10:12 +0200
Message-ID: <a079e75b-291a-4faf-7c56-19aa784df34c@tronnes.org>
Date: Thu, 5 Oct 2023 13:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 3/7] drm/format-helper: Pass format-conversion state to
 helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jfalempe@redhat.com, jose.exposito89@gmail.com, arthurgrillo@riseup.net,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20231005090520.16511-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: noralf@tronnes.org, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Lechner <david@lechnology.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/5/23 11:04, Thomas Zimmermann wrote:
> Pass an instance of struct drm_format_conv_state to DRM's format
> conversion helpers. Update all callers.
> 
> Most drivers can use the format-conversion state from their shadow-
> plane state. The shadow plane's destroy function releases the
> allocated buffer. Drivers will later be able to allocate a buffer
> of appropriate size in their plane's atomic_check code.
> 
> The gud driver uses a separate thread for committing updates. For
> now, the update worker contains its own format-conversion state.
> 
> Images in the format-helper tests are small. The tests preallocate
> a static page for the temporary buffer. Unloading the module releases
> the memory.
> 
> v3:
> 	* store buffer in shadow-plane state (Javier, Maxime)
> 	* replace ARRAY_SIZE() with sizeof() (Jani)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: David Lechner <david@lechnology.com>
> ---

> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 37c499ae4fe4f..b9b3dadf7b5f8 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c

> @@ -328,6 +324,7 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
>   * @cached: Source buffer is mapped cached (eg. not write-combined)
> + * @xfrm: Transform and conversion state

Here and throughout the patch: xfrm does not match the argument name.

>   *
>   * This function copies parts of a framebuffer to display memory and swaps per-pixel
>   * bytes during the process. Destination and framebuffer formats must match. The
> @@ -342,7 +339,8 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
>   */
>  void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>  		 const struct iosys_map *src, const struct drm_framebuffer *fb,
> -		 const struct drm_rect *clip, bool cached)
> +		 const struct drm_rect *clip, bool cached,
> +		 struct drm_format_conv_state *state)
>  {
>  	const struct drm_format_info *format = fb->format;
>  	u8 cpp = DIV_ROUND_UP(drm_format_info_bpp(format, 0), 8);


> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 73dd4f4289c20..826fb20dbbf0d 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c

> @@ -830,13 +831,14 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
>  				struct drm_plane_state *old_state)
>  {
>  	struct drm_plane_state *state = pipe->plane.state;
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
>  	struct drm_rect rect;
>  
>  	if (!pipe->crtc.state->active)
>  		return;
>  
>  	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
> -		repaper_fb_dirty(state->fb);
> +		repaper_fb_dirty(state->fb, &shadow_plane_state->fmtcnv_state);

This won't work since repaper doesn't use the shadow plane helper.

Noralf.

>  }
>  
>  static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
