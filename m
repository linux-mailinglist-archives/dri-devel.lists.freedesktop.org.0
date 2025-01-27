Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A0A1D8EA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 16:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5842110E561;
	Mon, 27 Jan 2025 15:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SFLtKq4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880CB10E561
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737990026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gL4ivAEBy+rkX5TT5U6iBPpNY7Sub1rewlEGzzmdt24=;
 b=SFLtKq4K02B5ii/lHq1KxADmgjrKxsLPHfovgGLiDWIw9ekOT/E1PdBAY4cBOdMbjUHvCS
 WArsTHpGd00TtetlCzcpaV3sz/RfkhsnrwtXOpOVBJ92VeUOd0N4+czNZAz/4yGFRbNPW9
 ifk02TdR1J6Vf3JjrayY2hqSMfllL/4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-3YbF2hsYODGShL6IO6pgOA-1; Mon, 27 Jan 2025 10:00:25 -0500
X-MC-Unique: 3YbF2hsYODGShL6IO6pgOA-1
X-Mimecast-MFC-AGG-ID: 3YbF2hsYODGShL6IO6pgOA
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38c24ac3415so3727413f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 07:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737990023; x=1738594823;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gL4ivAEBy+rkX5TT5U6iBPpNY7Sub1rewlEGzzmdt24=;
 b=VN+f4nq64oIEfGwYIuQ24kETiXacZ1XkTyzGXiEG34UvMpBrvER9OuRIvZU1dNmeZa
 kFACwCqZbcIKv3spfwTiMoBAIGKwtKf3SZqnASUKA8Xl9WLZNyPxLs0JVZ6snMrLMiNa
 bU6qVPi/dgLIpjeur1Fm0X2neykBNNtRGqjy5HB9q2w5JcjZMmzVp2ohN9TFZAXSPC/t
 JqouImXmuOfnZkMRiMmZVN7fpbItXtoFFSUovMAMDlI8ZXmPl3wlcJY6JxOeC5wEwIWE
 XdOWo9z+uAr+FKCmgE8YZvXAsCG6olkFz0IAaf6tmSfQzppbJvHUq0n2LFZGUa3mU6qL
 v8uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVClZiPFEkwp8BiF53o/UQjVyqENVthdSeYa4k4om/CnpaHMuzO5WmEFRKiKH9bA9pfQ6lFRRqRuX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe0SISwNA+AwMiMEkxN+BmT1n56M27ZwO4QvK8amAZFD6bnmfo
 eNG5+cU63fnISZ/2QYX6RNu1dj2+msVwZ8ukkkD5ueFf0oOg4MGdOfd6saC+svRN3fNKyk0Tj25
 b81+PxSfPqUC/d9Y4HBixzLUdyDiSXzJUug3Zye3UAOi2QqW9XCP5bCQmVf3hBd7vRQ==
X-Gm-Gg: ASbGncsC+OaFu7E8xWm+G1AlQAHg1s6nKtq/qWgmLRL3dbdzirYomIU8YLAOaD51fnp
 WQ0TAmRf+TdQxNxvJZrWc2umYt46XMZxJG/rHYkJi5Ct+8VOxPusSkNHdodMTUzFIxWagd5ZbNY
 2SqfNTMjpD69oOJ7kYxN9h15eBmWcVxDNpIjuJ2coJRi0ardsK/AM0G43XvY1mhbm2CtjSMeVNV
 XkdmAwC6qgXVfSveJIGgWPIfJ4xE/VuRc1ep3X4RcksNLMTzeDkXJWC7LOWbeTTX4IxmOAHNiz0
 lxFO9Du4cXqHID2V4Ekiuk4/fFZOn6rOmnhXov+BNXpj
X-Received: by 2002:a05:6000:1a85:b0:38a:88f8:aac6 with SMTP id
 ffacd0b85a97d-38bf57a77c7mr42742764f8f.41.1737990022879; 
 Mon, 27 Jan 2025 07:00:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxP93OjSX/fRhkv3usut3ywBMVkcV7QWVRuOMaMwVbTnT8Cr2Ustq4X6X9mWLh3GMUaVss7A==
X-Received: by 2002:a05:6000:1a85:b0:38a:88f8:aac6 with SMTP id
 ffacd0b85a97d-38bf57a77c7mr42742729f8f.41.1737990022482; 
 Mon, 27 Jan 2025 07:00:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c4295sm11542778f8f.91.2025.01.27.07.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 07:00:22 -0800 (PST)
Message-ID: <99176bf3-9ff1-4fd5-90a0-88ba73b5fb56@redhat.com>
Date: Mon, 27 Jan 2025 16:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] drm/ast: Only look up VBIOS mode on full modesets
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-16-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-16-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IEWgkXREJzFP5u80nu-ZJ3YoWTLmAYfYxZlfhMOattc_1737990023
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

On 24/01/2025 08:57, Thomas Zimmermann wrote:
> Only look up the VBIOS mode during atomic_check if the display mode
> changes. For page flips, the previous settings still apply. Avoids the
> runtime overhead of looking up the VBIOS mode on each page flip.

Thanks, it's a nice optimization.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 52 ++++++++++++++++++----------------
>   1 file changed, 27 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 584fa37b8d6c3..f8c10329af079 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -996,32 +996,34 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>   	}
>   
>   	/*
> -	 * Find the VBIOS mode and adjust the DRM display mode accordingly.
> +	 * Find the VBIOS mode and adjust the DRM display mode accordingly
> +	 * if a full modeset is required. Otherwise keep the existing values.
>   	 */
> -
> -	vmode = ast_vbios_find_mode(ast, &crtc_state->mode);
> -	if (!vmode)
> -		return -EINVAL;
> -	ast_state->vmode = vmode;
> -
> -	if (vmode->flags & HBorder)
> -		hborder = 8;
> -	if (vmode->flags & VBorder)
> -		vborder = 8;
> -
> -	adjusted_mode->crtc_hdisplay = vmode->hde;
> -	adjusted_mode->crtc_hblank_start = vmode->hde + hborder;
> -	adjusted_mode->crtc_hblank_end = vmode->ht - hborder;
> -	adjusted_mode->crtc_hsync_start = vmode->hde + hborder + vmode->hfp;
> -	adjusted_mode->crtc_hsync_end = vmode->hde + hborder + vmode->hfp + vmode->hsync;
> -	adjusted_mode->crtc_htotal = vmode->ht;
> -
> -	adjusted_mode->crtc_vdisplay = vmode->vde;
> -	adjusted_mode->crtc_vblank_start = vmode->vde + vborder;
> -	adjusted_mode->crtc_vblank_end = vmode->vt - vborder;
> -	adjusted_mode->crtc_vsync_start = vmode->vde + vborder + vmode->vfp;
> -	adjusted_mode->crtc_vsync_end = vmode->vde + vborder + vmode->vfp + vmode->vsync;
> -	adjusted_mode->crtc_vtotal = vmode->vt;
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		vmode = ast_vbios_find_mode(ast, &crtc_state->mode);
> +		if (!vmode)
> +			return -EINVAL;
> +		ast_state->vmode = vmode;
> +
> +		if (vmode->flags & HBorder)
> +			hborder = 8;
> +		if (vmode->flags & VBorder)
> +			vborder = 8;
> +
> +		adjusted_mode->crtc_hdisplay = vmode->hde;
> +		adjusted_mode->crtc_hblank_start = vmode->hde + hborder;
> +		adjusted_mode->crtc_hblank_end = vmode->ht - hborder;
> +		adjusted_mode->crtc_hsync_start = vmode->hde + hborder + vmode->hfp;
> +		adjusted_mode->crtc_hsync_end = vmode->hde + hborder + vmode->hfp + vmode->hsync;
> +		adjusted_mode->crtc_htotal = vmode->ht;
> +
> +		adjusted_mode->crtc_vdisplay = vmode->vde;
> +		adjusted_mode->crtc_vblank_start = vmode->vde + vborder;
> +		adjusted_mode->crtc_vblank_end = vmode->vt - vborder;
> +		adjusted_mode->crtc_vsync_start = vmode->vde + vborder + vmode->vfp;
> +		adjusted_mode->crtc_vsync_end = vmode->vde + vborder + vmode->vfp + vmode->vsync;
> +		adjusted_mode->crtc_vtotal = vmode->vt;
> +	}
>   
>   	return 0;
>   }

