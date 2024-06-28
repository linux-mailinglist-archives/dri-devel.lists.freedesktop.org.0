Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67AC91BBF6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABC510E167;
	Fri, 28 Jun 2024 09:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DdGPoWln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B9C10EBFE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719568448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzXwXVEnBl2rcG/ISKy3ebkI8UScl+1qkIknZych/C0=;
 b=DdGPoWln5QV8kyB7b41E2vkKmtpXiFOlDyr+plgtbpwWp0qMGBv3HSD0pEbrqeDslzXBkm
 c1BFf5zPLnbmiQOL+83GVsJUXsnja7hP8+OS29m1P7SBk2gBBJTI1iXdyvZHe0iBXuXc2w
 o5aM2Hu72gZmqE9V6EX1Mj9tvCeZfgI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178--DbB21itNWikDPBU7ct_0g-1; Fri, 28 Jun 2024 05:54:06 -0400
X-MC-Unique: -DbB21itNWikDPBU7ct_0g-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-364b75a8194so343130f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719568445; x=1720173245;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzXwXVEnBl2rcG/ISKy3ebkI8UScl+1qkIknZych/C0=;
 b=oQYkx0PPiXzt2qGADkZFTT4jkHAqK2TwLD0BRjqwipJjiq3JSOOWXbwFFyv2OtZK2L
 soFDDoE6D3OxN2cCHDFI7fO6CaM2nHbVc46jFAn+kjm+NRaX2w69ZqoPJcgBfTFMAr9D
 EbAZGV1HnWdJAwi/DQrRwJ3JerhGKVTMnUKQ5SmZC38br6/0jEAupzkh4pxNjPh1w731
 I4DV6+IlafQqtd2fQj940efd4YVhnUculr2hd0bb+fehv7WG2stEsae9URIq/SqWh88G
 gbLoS2B2fSSWk7FXvj0F5y0MKRzJRTIjh1iUcGxlbXdTFMo2gpWsEjZ8q9SEKU+2BfYT
 QaJg==
X-Gm-Message-State: AOJu0YydyF1PE4twVWWP6+W3Z+NqpIAf6l7wF8wTw4nVINbGPTSVeHnH
 OGXSG05Xl6QMjgTejZgv/qMthkfB82JavyIXRj3abBa63lZovudGnKZCzDPyqp8Qw03Wb0KJgLr
 QZxX1G6fROebajV611Q5SpKSVdG2LPywB85OISC8eUg1F7+QFvwGKYsMRe3A8LUiM8LBw7ieX/N
 FR
X-Received: by 2002:a05:6000:154d:b0:360:89a3:5293 with SMTP id
 ffacd0b85a97d-366e93b18f9mr13465794f8f.0.1719568445232; 
 Fri, 28 Jun 2024 02:54:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdQ6NSYgMk4Er4/5y8xRtv5H0t07NFkZFNjNwAzSJKjnEm/yYC9K9tKIEBeQlh9+I2neIIyw==
X-Received: by 2002:a05:6000:154d:b0:360:89a3:5293 with SMTP id
 ffacd0b85a97d-366e93b18f9mr13465781f8f.0.1719568444837; 
 Fri, 28 Jun 2024 02:54:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0d90casm1725261f8f.32.2024.06.28.02.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:54:04 -0700 (PDT)
Message-ID: <c999656a-bf16-4cbc-bc35-8af8302aad66@redhat.com>
Date: Fri, 28 Jun 2024 11:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/ast: Handle primary-plane format setup in
 atomic_update
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20240627153638.8765-1-tzimmermann@suse.de>
 <20240627153638.8765-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240627153638.8765-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 27/06/2024 17:27, Thomas Zimmermann wrote:
> Several color registers are programmed in the DPMS code of the CRTC's
> atomic_enable helper. This code will not be executed if the color format
> changes without a full mode switch. The same code already exists in the
> atomic_update helper of the primary plane. There, the code will not run
> if only the display mode changes.

This last sentence is unclear to me.

> 
> The color format is a property of the primary plane, so consolidate all
> code in the plane's atomic_update.

With the comment clarified,

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index e8312b3472ed..6a81d657175d 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -649,12 +649,12 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>   	struct drm_framebuffer *old_fb = old_plane_state->fb;
>   	struct ast_plane *ast_plane = to_ast_plane(plane);
> +	struct drm_crtc *crtc = plane_state->crtc;
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>   	struct drm_rect damage;
>   	struct drm_atomic_helper_damage_iter iter;
>   
> -	if (!old_fb || (fb->format != old_fb->format)) {
> -		struct drm_crtc *crtc = plane_state->crtc;
> -		struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	if (!old_fb || (fb->format != old_fb->format) || crtc_state->mode_changed) {
>   		struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
>   		struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
>   
> @@ -1025,7 +1025,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>   	u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
>   	struct ast_crtc_state *ast_state;
>   	const struct drm_format_info *format;
> -	struct ast_vbios_mode_info *vbios_mode_info;
>   
>   	/* TODO: Maybe control display signal generation with
>   	 *       Sync Enable (bit CR17.7).
> @@ -1039,10 +1038,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>   		format = ast_state->format;
>   
>   		if (format) {
> -			vbios_mode_info = &ast_state->vbios_mode_info;
> -
> -			ast_set_color_reg(ast, format);
> -			ast_set_vbios_color_reg(ast, format, vbios_mode_info);
>   			if (crtc->state->gamma_lut)
>   				ast_crtc_set_gamma(ast, format, crtc->state->gamma_lut->data);
>   			else

