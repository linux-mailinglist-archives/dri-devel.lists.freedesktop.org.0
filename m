Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00A2A1D8A1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5653810E554;
	Mon, 27 Jan 2025 14:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QHX5XLTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F4E10E554
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737989099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWvancUl5TV8dVdQnBDbpHkQli6kYo7rlr68T87BPMc=;
 b=QHX5XLTl+cIDoZ025bQCZOM12XoDqC3DN7FOV1tZwjQ8mBJ5Vm76hoJjYTFLNU7wAGJ8hJ
 uMsCl92sAbNrd9UaXfJD7v23PusJayVvepL9hUzVDWz2e2UBunCEHWXaO8v3UuI0gk09sB
 w1CseEVCJPHI1IGiJ0vfw9OL/Ll3lEs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-PNzCVH0QOGalAYZwg3-xbQ-1; Mon, 27 Jan 2025 09:44:57 -0500
X-MC-Unique: PNzCVH0QOGalAYZwg3-xbQ-1
X-Mimecast-MFC-AGG-ID: PNzCVH0QOGalAYZwg3-xbQ
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38a2140a400so3459057f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737989096; x=1738593896;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HWvancUl5TV8dVdQnBDbpHkQli6kYo7rlr68T87BPMc=;
 b=RTAdE51mOiQ5xUC32zZLFzMBLTRWEFzgryZxNaHW+ezncW5SWHbI0klJDGiZEerDXY
 K8B3Kk90/gb7e0ca29abNnIGdBLf0aaj22eGoBu2N7ctobx5tBFerxexRETQB+6sBGUV
 nlNUYwR/OPUsmmXHtSEBpbf/QyfpWyU3yFHSSw8foTnHhbBF7Tm7wTHCBuNZp5STrIW/
 Daw1VyZOpZcQ2Y00AZvXjvHM8KTn94osnYJO3aa710iW9kzTiNiHMD0JhAZLb+tT8XsC
 13f/yKq1ZCbTq3BkZh2tb5OaTzq2JuXW9fVjoyIcqKV/Qz9i9jsDtNXjQoIhG7qH4hPw
 NAug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGVX5VRx9+0BeEjbawf5+1VC7t6HqdG5ahQC4maOhttfutNl9prtCnIpMZ0r/Kvtri9WdiYA/PUro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf7q+w9VUZLmwzs15KVBmTRbg41ujR/EeHHXNCuA1M/GD4rwCr
 yDKgReWHlRWeK1fpYkq3/ZcTXaPL3PTxtrN8JEXh0pAIt5/n9u8K7Oc1aDyJ4ph1Zr5ZoE0Q750
 lloX9CeHqLSlpzQVNmLmHweWiGUnvf1ih3IaZC/DPwFgs8PjY/AIT3y7H2R1I3GHOlw==
X-Gm-Gg: ASbGncshPRHucb2fLGRlrEWQ7908ZvVaS4EwCC1bBjfxL6iJLTUDPUyuY0zteOFWilF
 sH7dIvrYtkPmI5CLQzBSqCGew7qL6sITtahyGDMpKUy6helRr1NwzPkE2Xez7pmGDhC9Wz33tN/
 oYoNgSiyqsDBMQuBKGvohgSfiiPYUueFnO3F3Mrqa6a2CkAVoXAZ+oVbeh4LSGnnQPWorVQ/4QN
 HlNCT9/+e/cgtSNUcm2l2c9KEbyfONzrQ7n/WqzrpgrDDITTrqm5xQesL0XlW8HfXBURfTXHbza
 hLSigIlhM3bZbki8Pw/W3IvZ0O6q4+gH+bbOEIPDwAD2
X-Received: by 2002:a05:6000:1f88:b0:385:f7d2:7e29 with SMTP id
 ffacd0b85a97d-38bf5662876mr38937522f8f.15.1737989096403; 
 Mon, 27 Jan 2025 06:44:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUSyitQzIuvtipH9XlSVxscguT2cK0D+dRJeS7VXXhawOTeq6z+3m/xJKiwJ2hvQRmvavicw==
X-Received: by 2002:a05:6000:1f88:b0:385:f7d2:7e29 with SMTP id
 ffacd0b85a97d-38bf5662876mr38937504f8f.15.1737989096004; 
 Mon, 27 Jan 2025 06:44:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c4e49sm11434269f8f.98.2025.01.27.06.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:44:55 -0800 (PST)
Message-ID: <b2485edb-1d85-4d28-aefc-8c6347050e02@redhat.com>
Date: Mon, 27 Jan 2025 15:44:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] drm/ast: Find VBIOS mode from regular display size
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-9-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-9-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KCr1l_tCXwuw8o3pFN5NkmCkiEWbh5BSEKgOxCeF6YE_1737989096
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
> The ast driver looks up supplied display modes from an internal list of
> display modes supported by the VBIOS.
> 
> Do not use the crtc_-prefixed display values from struct drm_display_mode
> for looking up the VBIOS mode. The fields contain raw values that the
> driver programs to hardware. They are affected by display settings like
> double-scan or interlace.
> 
> Instead use the regular vdisplay and hdisplay fields for lookup. As the
> programmed values can now differ from the values used for lookup, set
> struct drm_display_mode.crtc_vdisplay and .crtc_hdisplay from the VBIOS
> mode.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 
Jocelyn
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 48b46dc3a618e..adb485711fed5 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -131,7 +131,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
>   		return false;
>   	}
>   
> -	switch (mode->crtc_hdisplay) {
> +	switch (mode->hdisplay) {
>   	case 640:
>   		vbios_mode->enh_table = &res_640x480[refresh_rate_index];
>   		break;
> @@ -145,7 +145,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
>   		vbios_mode->enh_table = &res_1152x864[refresh_rate_index];
>   		break;
>   	case 1280:
> -		if (mode->crtc_vdisplay == 800)
> +		if (mode->vdisplay == 800)
>   			vbios_mode->enh_table = &res_1280x800[refresh_rate_index];
>   		else
>   			vbios_mode->enh_table = &res_1280x1024[refresh_rate_index];
> @@ -157,7 +157,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
>   		vbios_mode->enh_table = &res_1440x900[refresh_rate_index];
>   		break;
>   	case 1600:
> -		if (mode->crtc_vdisplay == 900)
> +		if (mode->vdisplay == 900)
>   			vbios_mode->enh_table = &res_1600x900[refresh_rate_index];
>   		else
>   			vbios_mode->enh_table = &res_1600x1200[refresh_rate_index];
> @@ -166,7 +166,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
>   		vbios_mode->enh_table = &res_1680x1050[refresh_rate_index];
>   		break;
>   	case 1920:
> -		if (mode->crtc_vdisplay == 1080)
> +		if (mode->vdisplay == 1080)
>   			vbios_mode->enh_table = &res_1920x1080[refresh_rate_index];
>   		else
>   			vbios_mode->enh_table = &res_1920x1200[refresh_rate_index];
> @@ -201,6 +201,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
>   	hborder = (vbios_mode->enh_table->flags & HBorder) ? 8 : 0;
>   	vborder = (vbios_mode->enh_table->flags & VBorder) ? 8 : 0;
>   
> +	adjusted_mode->crtc_hdisplay = vbios_mode->enh_table->hde;
>   	adjusted_mode->crtc_htotal = vbios_mode->enh_table->ht;
>   	adjusted_mode->crtc_hblank_start = vbios_mode->enh_table->hde + hborder;
>   	adjusted_mode->crtc_hblank_end = vbios_mode->enh_table->ht - hborder;
> @@ -210,6 +211,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
>   					 vbios_mode->enh_table->hfp +
>   					 vbios_mode->enh_table->hsync);
>   
> +	adjusted_mode->crtc_vdisplay = vbios_mode->enh_table->vde;
>   	adjusted_mode->crtc_vtotal = vbios_mode->enh_table->vt;
>   	adjusted_mode->crtc_vblank_start = vbios_mode->enh_table->vde + vborder;
>   	adjusted_mode->crtc_vblank_end = vbios_mode->enh_table->vt - vborder;

