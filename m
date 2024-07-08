Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A192A26E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02DC10E312;
	Mon,  8 Jul 2024 12:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CJmH1VWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6EC10E312
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720440998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3uSGrzD+iLHwauDlWHmJPGDcxQgLXP+/0lGc0HwVvM=;
 b=CJmH1VWhW6kxXApXnm50VDAj1iyrQQx25BU9KNhQqqowFkf9/xSt6mzKxudWxn0cOiwD85
 HoLW0xxBrpcvvKpeaUeL7mo0XnFwkzc8DMYPkVxb2Bj/exT9yGxMcKysxSXt4avW5uQqVQ
 T6Tc+efYMpSYaaix6mOx4x9WsoLmd7o=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-Dhdw6lAXMeywpPpC7AUNxQ-1; Mon, 08 Jul 2024 08:16:37 -0400
X-MC-Unique: Dhdw6lAXMeywpPpC7AUNxQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-52e9cc6a99eso4182869e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720440996; x=1721045796;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K3uSGrzD+iLHwauDlWHmJPGDcxQgLXP+/0lGc0HwVvM=;
 b=Qc49cJ43863nvhWSs6q9hr8rDRnh11V6dct2Tr6wXwOhM8zD+Tv1e7dR9f0mbWv9SK
 MceZzbL/G6nqEZ4Y9me5/a90JztUX3kyXYzGQ5TETSPOzmh9khRBVEiVWgVyXSOgXh4+
 FGlYngiQHTrCcUPnOXWrK0t0zVrXcSNt0SHGasd2KRfqrNl2ZpYyq7JFWZLnipKYT+WP
 7c4+bIDocAWwjGlX7Ro2SloR9d9M/NDRpD0/+JpaFt6TiokenAroTb/ZGVJvk+4ABTnM
 qaXQ8IR8s8x6NuDziYGiXrUXfC4X1sJuJjHJZVgKiY8FBES36fXJeWnv0UX7kl30u0+6
 MPFg==
X-Gm-Message-State: AOJu0Yz9gax+eu3llSGektiFE0/XoOT/hWZCWbbi9kED4DcsYq/L8n5l
 xLFfoZyVS7DEwx5VE8BX6aftfokIwPhGGHZx88n2ylfR1Wb6eFCtEfHtWemAnHI8vU7WY052DTP
 sFaXDca1vW/hAfaD0bBkTFYTobZgmbuOq99vYs3OMW8dqyq8qdlPvTR0Wde733cselw==
X-Received: by 2002:a19:8c05:0:b0:52e:7f16:96b6 with SMTP id
 2adb3069b0e04-52ea063fb08mr7958628e87.37.1720440995945; 
 Mon, 08 Jul 2024 05:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPzJs7vV7lr/KNb16IUMJPQTlPpp84Fco0fnqG0Ii52Gcx/4JJGlpvttfjW9OdUfoBFQeFWw==
X-Received: by 2002:a19:8c05:0:b0:52e:7f16:96b6 with SMTP id
 2adb3069b0e04-52ea063fb08mr7958607e87.37.1720440995549; 
 Mon, 08 Jul 2024 05:16:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679dfae9easm10599933f8f.87.2024.07.08.05.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:16:35 -0700 (PDT)
Message-ID: <76b8344f-697d-41d5-8f56-c559fa7e3394@redhat.com>
Date: Mon, 8 Jul 2024 14:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/mgag200: Add dedicated variables for blanking
 fields
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sam@ravnborg.org, emil.l.velikov@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240705114900.572-1-tzimmermann@suse.de>
 <20240705114900.572-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240705114900.572-5-tzimmermann@suse.de>
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
> Represent fields for horizontal and vertical blanking with <hblkstr>,
> <hblkend>, <vblkstr> and <vblkend>. Aligns the code with the Matrox
> programming manuals.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 29 ++++++++++++++------------
>   1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index ccad5bd5960d..1cd28e7bea32 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -204,23 +204,26 @@ void mgag200_init_registers(struct mga_device *mdev)
>   void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode)
>   {
>   	const struct mgag200_device_info *info = mdev->info;
> -	unsigned int hdispend, hsyncstr, hsyncend, htotal;
> -	unsigned int vdispend, vsyncstr, vsyncend, vtotal;
> +	unsigned int hdispend, hsyncstr, hsyncend, htotal, hblkstr, hblkend;
> +	unsigned int vdispend, vsyncstr, vsyncend, vtotal, vblkstr, vblkend;
>   	u8 misc, crtcext1, crtcext2, crtcext5;
>   
>   	hdispend = mode->crtc_hdisplay / 8 - 1;
>   	hsyncstr = mode->crtc_hsync_start / 8 - 1;
>   	hsyncend = mode->crtc_hsync_end / 8 - 1;
>   	htotal = mode->crtc_htotal / 8 - 1;
> -
>   	/* Work around hardware quirk */
>   	if ((htotal & 0x07) == 0x06 || (htotal & 0x07) == 0x04)
>   		htotal++;
> +	hblkstr = mode->crtc_hblank_start / 8 - 1;
> +	hblkend = htotal;
>   
>   	vdispend = mode->crtc_vdisplay - 1;
>   	vsyncstr = mode->crtc_vsync_start - 1;
>   	vsyncend = mode->crtc_vsync_end - 1;
>   	vtotal = mode->crtc_vtotal - 2;
> +	vblkstr = mode->crtc_vblank_start;
> +	vblkend = vtotal + 1;
>   
>   	misc = RREG8(MGA_MISC_IN);
>   
> @@ -235,43 +238,43 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
>   		misc &= ~MGAREG_MISC_VSYNCPOL;
>   
>   	crtcext1 = (((htotal - 4) & 0x100) >> 8) |
> -		    ((hdispend & 0x100) >> 7) |
> +		    ((hblkstr & 0x100) >> 7) |
>   		    ((hsyncstr & 0x100) >> 6) |
> -		     (htotal & 0x40);
> +		     (hblkend & 0x40);
>   	if (info->has_vidrst)
>   		crtcext1 |= MGAREG_CRTCEXT1_VRSTEN |
>   			    MGAREG_CRTCEXT1_HRSTEN;
>   
>   	crtcext2 = ((vtotal & 0xc00) >> 10) |
>   		   ((vdispend & 0x400) >> 8) |
> -		   ((vdispend & 0xc00) >> 7) |
> +		   ((vblkstr & 0xc00) >> 7) |
>   		   ((vsyncstr & 0xc00) >> 5) |
>   		   ((vdispend & 0x400) >> 3);
>   	crtcext5 = 0x00;
>   
>   	WREG_CRT(0x00, htotal - 4);
>   	WREG_CRT(0x01, hdispend);
> -	WREG_CRT(0x02, hdispend);
> -	WREG_CRT(0x03, (htotal & 0x1f) | 0x80);
> +	WREG_CRT(0x02, hblkstr);
> +	WREG_CRT(0x03, (hblkend & 0x1f) | 0x80);
>   	WREG_CRT(0x04, hsyncstr);
> -	WREG_CRT(0x05, ((htotal & 0x20) << 2) | (hsyncend & 0x1f));
> +	WREG_CRT(0x05, ((hblkend & 0x20) << 2) | (hsyncend & 0x1f));
>   	WREG_CRT(0x06, vtotal & 0xff);
>   	WREG_CRT(0x07, ((vtotal & 0x100) >> 8) |
>   		       ((vdispend & 0x100) >> 7) |
>   		       ((vsyncstr & 0x100) >> 6) |
> -		       ((vdispend & 0x100) >> 5) |
> +		       ((vblkstr & 0x100) >> 5) |
>   		       ((vdispend & 0x100) >> 4) | /* linecomp */
>   		       ((vtotal & 0x200) >> 4) |
>   		       ((vdispend & 0x200) >> 3) |
>   		       ((vsyncstr & 0x200) >> 2));
> -	WREG_CRT(0x09, ((vdispend & 0x200) >> 4) |
> +	WREG_CRT(0x09, ((vblkstr & 0x200) >> 4) |
>   		       ((vdispend & 0x200) >> 3));
>   	WREG_CRT(0x10, vsyncstr & 0xff);
>   	WREG_CRT(0x11, (vsyncend & 0x0f) | 0x20);
>   	WREG_CRT(0x12, vdispend & 0xff);
>   	WREG_CRT(0x14, 0);
> -	WREG_CRT(0x15, vdispend & 0xff);
> -	WREG_CRT(0x16, (vtotal + 1) & 0xff);
> +	WREG_CRT(0x15, vblkstr & 0xff);
> +	WREG_CRT(0x16, vblkend & 0xff);
>   	WREG_CRT(0x17, 0xc3);
>   	WREG_CRT(0x18, vdispend & 0xff);
>   

