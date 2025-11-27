Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24BC8DA7E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8907F10E7FF;
	Thu, 27 Nov 2025 09:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fRPtLp0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED04210E7FF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764237395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6f4RhouCm1BCWb8R9Cg2w250y3psMYQvG6eBkNRoTc=;
 b=fRPtLp0sqz2OivVfvl6wOKmtXhMehlAMXGkjQnDOIlttomE69f3rb44KQ21Ew6OSobbazJ
 TxCWSIBKaBJqNLuEMmQrIF9FpHU2uEGKgI1/uykwPaFx/tRYKN9p4busc/MIWaSp7+2+tP
 B3UJNBnkXBMWcCCYXiTGQyQECcRnxLk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-cdtmLzIMNbSfh2FDz2qRSA-1; Thu, 27 Nov 2025 04:56:32 -0500
X-MC-Unique: cdtmLzIMNbSfh2FDz2qRSA-1
X-Mimecast-MFC-AGG-ID: cdtmLzIMNbSfh2FDz2qRSA_1764237392
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47910af0c8bso3680785e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 01:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764237391; x=1764842191;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O6f4RhouCm1BCWb8R9Cg2w250y3psMYQvG6eBkNRoTc=;
 b=jAMcoeLiwYEhraZeqUK0CEknNaaiEWGeEUn9tx0bR6THhZWX1P9x+Jsxe4UiSwjQbE
 A0t2ze/a7MXU41+9ouPdtbD3/VWBxPrv+KnkyVOHsboxD/XWQaX3xCp/SrQGMnlEaM0H
 FZNWp4zdapHhFgUOuJNi6Znu0i1Z/cRsUIwxtl6wvCDSrQuasnE4xW0pN1/0PTgSr8NJ
 FtuWi9unyraXtvzcntvf5AxuAHJzbUfs4+81f6mUyRT1oPPAmK4pPHdrZjEgsuNbMuSd
 lmxYvR37BiRP+9jmENFN/EVaeVWQt/sjZmvMbPAmVsdkZXBi4ncAMc77GskM4AynQ5ML
 mqeA==
X-Gm-Message-State: AOJu0YzoS+zRV1CD9EcHEjJ+bJVlrOPcIOk+fD5Iigh3ENbPaCi6RsNI
 VzIBs6z4m5KTjrovtWrSTB7p9px92pzU59ALwLF0lxuL4YWMFjeqM2491iBugvE42qVpgd0CHqV
 BCIwhmfJf8EcfPBZZ5+Y5zOqa6hXp7vBL+2ga30Qn2oPw14T9hsGSD8XwpbedoY95VXR0jc8bAD
 9PfA==
X-Gm-Gg: ASbGncuusQUgzoV/xOtnDGztpa4CFKUp8iPCvb8nLMhhN2QrPEhVK2nsYdEyXENxqhm
 WWGBPACZZHagqY37MveITStqD33sNKAgvj034y1ukzQHR+kYPx4UxJLz5bBNEKmHzPEWIiB/6St
 MdQsrOzW70I7WBn9vleIPpS7TtepeWP5Y0ROcgThqqUhpebHC2cHlvPNJfLr8hwxbUEkIsJkkze
 vZE6+VBa5BCeYGDzoPRdW5yproMwFW541TDr/bc2qCyDn/gIuvd8FVs59+Js5OsZkbM57RmSu02
 5g5MUpfwByW6QfmoCN393nr84Gu4oPN2t+c4Rl+VaHwJU22ak3ENNOLB37cDGiYDihMPy4pgDRl
 oa+yQmAcHc6M19gePZW2qprGW+FKMki3sGuJTsuzFHL8VvPjLmQ==
X-Received: by 2002:a05:600c:c48e:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-47904acef07mr99895805e9.4.1764237391098; 
 Thu, 27 Nov 2025 01:56:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKr7+/4KCsw2ttyufpzUExUK7JSCWx/7lNtUIgl3icWUBCo/PpV2/PI6K9Tp1KkO2AVuXXOQ==
X-Received: by 2002:a05:600c:c48e:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-47904acef07mr99895575e9.4.1764237390699; 
 Thu, 27 Nov 2025 01:56:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479111565a1sm22746295e9.5.2025.11.27.01.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:56:30 -0800 (PST)
Message-ID: <e8e316bb-3639-490a-b7f6-92394ba0b235@redhat.com>
Date: Thu, 27 Nov 2025 10:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/ast: Support cursor buffers objects in I/O memory
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20251126094626.41985-1-tzimmermann@suse.de>
 <20251126094626.41985-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251126094626.41985-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G82OF7sN6UXY_SbTHcpiNEO8SU7sbgVZZyiGEmeTA60_1764237392
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

On 26/11/2025 10:40, Thomas Zimmermann wrote:
> Copy the ARGB4444 cursor buffer to system memory if it is located in
> I/O memory. While this cannot happen with ast's native GEM objects, an
> imported buffer object might be on the external device's I/O memory.
> 
> If the cursor buffer is located in system memory continue to use it
> directly.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_cursor.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 24d696df8fcd..8d473ed2738c 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -191,7 +191,20 @@ static const u8 *ast_cursor_plane_get_argb4444(struct ast_cursor_plane *ast_curs
>   
>   	switch (fb->format->format) {
>   	case DRM_FORMAT_ARGB4444:
> -		argb4444 = shadow_plane_state->data[0].vaddr;
> +		if (shadow_plane_state->data[0].is_iomem) {
> +			struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> +				IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
> +			};
> +			unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +				AST_HWC_PITCH,
> +			};
> +
> +			drm_fb_memcpy(argb4444_dst, argb4444_dst_pitch,
> +				      shadow_plane_state->data, fb, clip);
> +			argb4444 = argb4444_dst[0].vaddr;
> +		} else {
> +			argb4444 = shadow_plane_state->data[0].vaddr;
> +		}
>   		break;
>   	case DRM_FORMAT_ARGB8888:
>   		{

