Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992B392A268
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6E110E335;
	Mon,  8 Jul 2024 12:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gG0aZ1se";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D97710E335
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720440967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fnwIY0glgh0VDkTPq9RjO7i+DRRwxZ4Z+KjAkhWAMDs=;
 b=gG0aZ1seFxXGZiCM0htX2Do97Uei66joOUlFBJl57iPSkyYO/p2IkqWmk4A4CtQ/UqUem6
 fmhNHL1SYWe1i9KfgmVBvE+RhQg1Jaz4Nbr3crKHSDotlnFbCou3o+6SZ894u4w9VOWNLO
 XHm8mCEk0QGNNU41fs1MQyNjNmaEcmc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-pqSFXGxHOhaZ_REDuUmyVw-1; Mon, 08 Jul 2024 08:16:04 -0400
X-MC-Unique: pqSFXGxHOhaZ_REDuUmyVw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4266d0183feso3194515e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720440963; x=1721045763;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fnwIY0glgh0VDkTPq9RjO7i+DRRwxZ4Z+KjAkhWAMDs=;
 b=o/14iTZkUYZh8aAf2klCeXt9vJWhuPLhb5Tl1q++eoMn1P+d82NXzatSoqjxPTqA4W
 lJa/Kb7FrfXAW414WW8zmE5E0f+8MsUBMnD0YfLF4UJbEXKAZnOgjjF30KRNxxashw+G
 vUzVN+lsm0yxhEP9j5PciJ6FOQ2XHRUdxqly0Q00A3ADDXDWMn8/wz9sYqxDO5H6OD+1
 Do25DPpGFJ7xLWUF2lqVxTWJET7MdAoGekdOd4YOLcq90mAAU9RRcXTPjNAzYoQsBca1
 w9Y90Q4GmanDRid70i0Nz7JH/NeOwTqc0rQbTtNsR714nEdsDpYX1JM3jNo29sC6bBhs
 pFzg==
X-Gm-Message-State: AOJu0YwGgooqKczKiXJjow5TSF2YPHLHq593CsaFvOBPtItIPcf6Q3e9
 ++iUpEzta6oz4tZ2PhFuew6ZtzPQoqo4Je6GdNe1VhtWy8aWUcrL0yC7thPVzLj0Gc5exg0v43i
 ui5RxYW0MvmlSdeHXX/80PeTHHlERYdpZxkLNbSFFskz9EYV8/1FJwtITdYGV1kXCfw==
X-Received: by 2002:a05:600c:18a3:b0:426:6087:198f with SMTP id
 5b1f17b1804b1-42660871ab3mr32526755e9.39.1720440962924; 
 Mon, 08 Jul 2024 05:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQLxn7jTFmy5gZiYKo5WiJ1TcrVTp6/4YzQodKz/YLngJUuhbrIGBnPeq6MOIBMUuwSzh32Q==
X-Received: by 2002:a05:600c:18a3:b0:426:6087:198f with SMTP id
 5b1f17b1804b1-42660871ab3mr32526565e9.39.1720440962608; 
 Mon, 08 Jul 2024 05:16:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2519a4sm161959605e9.35.2024.07.08.05.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:16:02 -0700 (PDT)
Message-ID: <773137ed-81ff-42e0-ac8b-7eb72a27a169@redhat.com>
Date: Mon, 8 Jul 2024 14:16:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] drm/mgag200: Use adjusted mode values for CRTCs
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sam@ravnborg.org, emil.l.velikov@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240705114900.572-1-tzimmermann@suse.de>
 <20240705114900.572-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240705114900.572-4-tzimmermann@suse.de>
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



On 05/07/2024 13:47, Thomas Zimmermann wrote:
> Use the values with the crtc_ prefix from struct drm_display_mode to
> program hardware. The DRM core adjusted these values to the requirements
> of CRTC hardware.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 09e2a5b80403..ccad5bd5960d 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -208,19 +208,19 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
>   	unsigned int vdispend, vsyncstr, vsyncend, vtotal;
>   	u8 misc, crtcext1, crtcext2, crtcext5;
>   
> -	hdispend = mode->hdisplay / 8 - 1;
> -	hsyncstr = mode->hsync_start / 8 - 1;
> -	hsyncend = mode->hsync_end / 8 - 1;
> -	htotal = mode->htotal / 8 - 1;
> +	hdispend = mode->crtc_hdisplay / 8 - 1;
> +	hsyncstr = mode->crtc_hsync_start / 8 - 1;
> +	hsyncend = mode->crtc_hsync_end / 8 - 1;
> +	htotal = mode->crtc_htotal / 8 - 1;
>   
>   	/* Work around hardware quirk */
>   	if ((htotal & 0x07) == 0x06 || (htotal & 0x07) == 0x04)
>   		htotal++;
>   
> -	vdispend = mode->vdisplay - 1;
> -	vsyncstr = mode->vsync_start - 1;
> -	vsyncend = mode->vsync_end - 1;
> -	vtotal = mode->vtotal - 2;
> +	vdispend = mode->crtc_vdisplay - 1;
> +	vsyncstr = mode->crtc_vsync_start - 1;
> +	vsyncend = mode->crtc_vsync_end - 1;
> +	vtotal = mode->crtc_vtotal - 2;
>   
>   	misc = RREG8(MGA_MISC_IN);
>   

