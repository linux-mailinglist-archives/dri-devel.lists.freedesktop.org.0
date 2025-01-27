Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F620A1D8AB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA7B10E302;
	Mon, 27 Jan 2025 14:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="isgqFQj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28CE10E55C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737989321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lC2Nbv95eiprcXZQPc1K9I3FL0ajwW95SHn2mPPxiCc=;
 b=isgqFQj/eZ4cErA+ko1dRPolu+pyW0+LXkaCD0BQlT3LOAtuYMTNyUAXkIakqLlJTuroRC
 hKnays6570Um87M+VCpkQ8OsRKW/IdBOlY0mUQxWqHYV2C2NbbnEl8tPtTyEq+nKik/DJx
 IDnuEfwBJfM99jTheXrlQx0GKHsFhEA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-SNT4Z1MWNGW5BOrzzgqziA-1; Mon, 27 Jan 2025 09:48:40 -0500
X-MC-Unique: SNT4Z1MWNGW5BOrzzgqziA-1
X-Mimecast-MFC-AGG-ID: SNT4Z1MWNGW5BOrzzgqziA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43673af80a6so32485375e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737989318; x=1738594118;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lC2Nbv95eiprcXZQPc1K9I3FL0ajwW95SHn2mPPxiCc=;
 b=vdRJMgZrmRXT1V2/eonW6OWAso005ZiDAbf0LTgMwjWLeuMMPBilk/7g5XGvu9ZGsx
 jLcnfWelIrHMqVUCK9uQPrqBiZSfmWGvbegHmDtEguYLrIfiBFv+EB37r1LlBjGEuad3
 DKnzuHPVNtX3DzXBizbYhEJvugoFZevDWKkiyLt0p+Yl3GEAmSoId8XfAMuKppe55HAI
 /8Ws7OcJCpIiIU8ZTAsENB4Z7m2szjD77Yqcxc3JgM95uvnu+1kXuMZybjrR1pvLGu+H
 aX4inf526K8AWCrrm1Xm4cC7A4jutO0a4OTqPDaS5/FQUacV6kNcV7rx4+6QIH6x22B9
 dh3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZBdTd1Ydcn/phmNLNJbb63VMehx03m90DbLddJT/EWW95YOLamqbYCQ669UaLBCisTWc+xLDSZbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0cONCLtKbFWYr/d/Ud57+fYo9UG28W7b/TTzVnPJzcvtW5dXB
 KziOsSgzwu01DMds8GLTfzBJJWmaT9DSpkvsPuEioASM+LSIBZ+luKN62iaF7Gt95f3wFjPSaGT
 Ajy1GAcIukJWyrbkU4N4Cpkpdjc7TfsfXWXBked9erqXOqdlnMjlMgHYdJLh50lzfa759ZuTjiw
 ==
X-Gm-Gg: ASbGncsPZrByy/513iM6GK3Nd5nwduXIMBP0cpz0bzBdl38ZaTRpLA6z3MvwxMPtoHz
 PBraccRjrHjEUIlA66Z/KrBhmZ7wP0m5k14FSGiCJqyDkmKVdhUBqCWNV7OdfxdH6OCiYZ1+xKR
 sFyV5/MsIvXS/Mxy5ShNycQXT0SjTIraQMvOq6AStRSUCehhu+AY6YAQHmlJhCGy2i782Pgrd3E
 at4RfvSqUf1AznCYMxNXu/WG/4mNfGOlj/7i8Jefb6E+VR3H1+PmE2D0n5MtVP23OzswbwjtQ0a
 5DtMYGT9yYSyfx8ETzJgv0QNY8eOi3AnCWU52k09aaAC
X-Received: by 2002:a05:600c:c0f:b0:42c:c28c:e477 with SMTP id
 5b1f17b1804b1-4389141c0a9mr339095585e9.23.1737989318356; 
 Mon, 27 Jan 2025 06:48:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbZ4e9GUEwBsFu5urfNbeK8ItoPAXwdnZNCgUrauggnCR6HNoCM7LHNAMJ75E0Ic/CTduI4A==
X-Received: by 2002:a05:600c:c0f:b0:42c:c28c:e477 with SMTP id
 5b1f17b1804b1-4389141c0a9mr339095395e9.23.1737989317976; 
 Mon, 27 Jan 2025 06:48:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47f269sm136419395e9.8.2025.01.27.06.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:48:37 -0800 (PST)
Message-ID: <bb3db8ec-541f-4c5c-87b6-3da919e7825c@redhat.com>
Date: Mon, 27 Jan 2025 15:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] drm/ast: Validate DRM display modes against VBIOS
 modes
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-12-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-12-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 35cmvR_5QxsM9BDLUd3R_3H1mEA2jxfyFgi3aafgi0s_1737989319
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
> Test DRM display modes against the list of modes supported by the
> VBIOS. The helper will respect the supported-modes flags in struct
> ast_device. Hence only DRM display modes supported by the VBIOS
> will be reported; without the current duplication of this information.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 62 +++-------------------------------
>   1 file changed, 5 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index e3d15d30aeeae..372abff1c8673 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -950,65 +950,13 @@ static enum drm_mode_status
>   ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
>   {
>   	struct ast_device *ast = to_ast_device(crtc->dev);
> -	enum drm_mode_status status;
> -
> -	if (ast->support_wsxga_p) {
> -		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
> -			return MODE_OK;
> -		if ((mode->hdisplay == 1280) && (mode->vdisplay == 800))
> -			return MODE_OK;
> -		if ((mode->hdisplay == 1440) && (mode->vdisplay == 900))
> -			return MODE_OK;
> -		if ((mode->hdisplay == 1360) && (mode->vdisplay == 768))
> -			return MODE_OK;
> -		if ((mode->hdisplay == 1600) && (mode->vdisplay == 900))
> -			return MODE_OK;
> -
> -		if (ast->support_fullhd) {
> -			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
> -				return MODE_OK;
> -
> -			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1200)) {
> -				if (ast->support_wuxga)
> -					return MODE_OK;
> -				else
> -					return MODE_NOMODE;
> -			}
> -		}
> -	}
> +	const struct ast_vbios_enhtable *vmode;
>   
> -	status = MODE_NOMODE;
> +	vmode = ast_vbios_find_mode(ast, mode);
> +	if (!vmode)
> +		return MODE_NOMODE;
>   
> -	switch (mode->hdisplay) {
> -	case 640:
> -		if (mode->vdisplay == 480)
> -			status = MODE_OK;
> -		break;
> -	case 800:
> -		if (mode->vdisplay == 600)
> -			status = MODE_OK;
> -		break;
> -	case 1024:
> -		if (mode->vdisplay == 768)
> -			status = MODE_OK;
> -		break;
> -	case 1152:
> -		if (mode->vdisplay == 864)
> -			status = MODE_OK;
> -		break;
> -	case 1280:
> -		if (mode->vdisplay == 1024)
> -			status = MODE_OK;
> -		break;
> -	case 1600:
> -		if (mode->vdisplay == 1200)
> -			status = MODE_OK;
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	return status;
> +	return MODE_OK;
>   }
>   
>   static void ast_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)

