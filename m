Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FE892A263
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4C910E318;
	Mon,  8 Jul 2024 12:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GCus3jE0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F9610E312
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720440941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OfU4Qg8RRfmtdI3BBuHvyeAeqabXfPHSOVyaRz6EWOI=;
 b=GCus3jE0E2Orfv9sXBSzwzmSV4CDeqC0BOjlXrPR+NFpOT9KNBE0XnadZqkaNuJgLNV7m/
 sxm+Vu+wvCiErKJ5DQgySJ8+147GgnSZUdYX3SMf6OAq65nugKeT0ki97HQiNL18pxBSEP
 BkBjJuCYS//0z+Ggg0RBVw4bA+tpvMQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-3C69OFVLOs-7VgP6MgtwkA-1; Mon, 08 Jul 2024 08:15:40 -0400
X-MC-Unique: 3C69OFVLOs-7VgP6MgtwkA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3678fd1edf8so2468572f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720440939; x=1721045739;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OfU4Qg8RRfmtdI3BBuHvyeAeqabXfPHSOVyaRz6EWOI=;
 b=L2iAk3KdoV9wqR1tf0IzJohUjbqcNLexyvmhvjD1gvvQUY/o2tt46Y3I2autc8zjpd
 ogHDX2wjoiDU5ByiuZKt/JsPDSD8CxbfHJykr06OFHfKNRYcqqkaPoG59r1aZQROLjPS
 FVH6sLX7P0fVcS/FG1Csgs78Hx2Kj0K7ti5uHIluIZ6JoWWsYLlfrEq3fGiSfMNovsZs
 B8P9YT57ywXyaannFS6zqsv29txYK/MAIU+l48LGCM87EPCYN9Wiwso/0OnnLwueJyeT
 3zpBRPv3gjC6NeSOsgHg4jRyvPCX2vLpC7jhd5kknKYQJCSPAk4T9M6XCiR0ppmbFTHh
 nPBg==
X-Gm-Message-State: AOJu0YzhyXOzk+IuLIQuGCw7bS8ILO3qs677BE2/6Tt1ujoVxHkgMl4i
 +P6IznAzA7rzAWAMWJqKhlDnY9mxsTi6BQa2X4LvYHdTrqL/+fc/oDedTWxHoJf6xZXU6ydDVo7
 De1ANHgOhNMKmKkACeODRMH+HISykR2ug8//dvtmddFtU3MyUFgBDxYgKsgTItFjs3w==
X-Received: by 2002:adf:fe49:0:b0:363:d234:c790 with SMTP id
 ffacd0b85a97d-3679f76fddemr10500514f8f.29.1720440939315; 
 Mon, 08 Jul 2024 05:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAbFRzq5rs7sZyWdHABhFSLouE06jyXdr00Ov4QZXoyvsXY4nQXqckSHqRu20kNcXC0zEZ8g==
X-Received: by 2002:adf:fe49:0:b0:363:d234:c790 with SMTP id
 ffacd0b85a97d-3679f76fddemr10500488f8f.29.1720440938930; 
 Mon, 08 Jul 2024 05:15:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2ca5casm165027115e9.32.2024.07.08.05.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:15:38 -0700 (PDT)
Message-ID: <9d021a65-30d7-488d-ab50-86abd6dbd056@redhat.com>
Date: Mon, 8 Jul 2024 14:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] drm/mgag200: Align register field names with
 documentation
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sam@ravnborg.org, emil.l.velikov@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240705114900.572-1-tzimmermann@suse.de>
 <20240705114900.572-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240705114900.572-3-tzimmermann@suse.de>
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
> In mgag200_set_mode_regs(), align variable names with the field names
> given in the Matrox programming manuals. Makes the code and docs grep-
> able.

I confirm it's better when the code matches the documentation.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 56 +++++++++++++-------------
>   1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 4ceaa33e8d42..09e2a5b80403 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -204,12 +204,12 @@ void mgag200_init_registers(struct mga_device *mdev)
>   void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode)
>   {
>   	const struct mgag200_device_info *info = mdev->info;
> -	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
> -	unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
> +	unsigned int hdispend, hsyncstr, hsyncend, htotal;
> +	unsigned int vdispend, vsyncstr, vsyncend, vtotal;
>   	u8 misc, crtcext1, crtcext2, crtcext5;
>   
> -	hdisplay = mode->hdisplay / 8 - 1;
> -	hsyncstart = mode->hsync_start / 8 - 1;
> +	hdispend = mode->hdisplay / 8 - 1;
> +	hsyncstr = mode->hsync_start / 8 - 1;
>   	hsyncend = mode->hsync_end / 8 - 1;
>   	htotal = mode->htotal / 8 - 1;
>   
> @@ -217,8 +217,8 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
>   	if ((htotal & 0x07) == 0x06 || (htotal & 0x07) == 0x04)
>   		htotal++;
>   
> -	vdisplay = mode->vdisplay - 1;
> -	vsyncstart = mode->vsync_start - 1;
> +	vdispend = mode->vdisplay - 1;
> +	vsyncstr = mode->vsync_start - 1;
>   	vsyncend = mode->vsync_end - 1;
>   	vtotal = mode->vtotal - 2;
>   
> @@ -235,45 +235,45 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
>   		misc &= ~MGAREG_MISC_VSYNCPOL;
>   
>   	crtcext1 = (((htotal - 4) & 0x100) >> 8) |
> -		   ((hdisplay & 0x100) >> 7) |
> -		   ((hsyncstart & 0x100) >> 6) |
> -		    (htotal & 0x40);
> +		    ((hdispend & 0x100) >> 7) |
> +		    ((hsyncstr & 0x100) >> 6) |
> +		     (htotal & 0x40);
>   	if (info->has_vidrst)
>   		crtcext1 |= MGAREG_CRTCEXT1_VRSTEN |
>   			    MGAREG_CRTCEXT1_HRSTEN;
>   
>   	crtcext2 = ((vtotal & 0xc00) >> 10) |
> -		   ((vdisplay & 0x400) >> 8) |
> -		   ((vdisplay & 0xc00) >> 7) |
> -		   ((vsyncstart & 0xc00) >> 5) |
> -		   ((vdisplay & 0x400) >> 3);
> +		   ((vdispend & 0x400) >> 8) |
> +		   ((vdispend & 0xc00) >> 7) |
> +		   ((vsyncstr & 0xc00) >> 5) |
> +		   ((vdispend & 0x400) >> 3);
>   	crtcext5 = 0x00;
>   
>   	WREG_CRT(0x00, htotal - 4);
> -	WREG_CRT(0x01, hdisplay);
> -	WREG_CRT(0x02, hdisplay);
> +	WREG_CRT(0x01, hdispend);
> +	WREG_CRT(0x02, hdispend);
>   	WREG_CRT(0x03, (htotal & 0x1f) | 0x80);
> -	WREG_CRT(0x04, hsyncstart);
> +	WREG_CRT(0x04, hsyncstr);
>   	WREG_CRT(0x05, ((htotal & 0x20) << 2) | (hsyncend & 0x1f));
>   	WREG_CRT(0x06, vtotal & 0xff);
>   	WREG_CRT(0x07, ((vtotal & 0x100) >> 8) |
> -		       ((vdisplay & 0x100) >> 7) |
> -		       ((vsyncstart & 0x100) >> 6) |
> -		       ((vdisplay & 0x100) >> 5) |
> -		       ((vdisplay & 0x100) >> 4) | /* linecomp */
> +		       ((vdispend & 0x100) >> 7) |
> +		       ((vsyncstr & 0x100) >> 6) |
> +		       ((vdispend & 0x100) >> 5) |
> +		       ((vdispend & 0x100) >> 4) | /* linecomp */
>   		       ((vtotal & 0x200) >> 4) |
> -		       ((vdisplay & 0x200) >> 3) |
> -		       ((vsyncstart & 0x200) >> 2));
> -	WREG_CRT(0x09, ((vdisplay & 0x200) >> 4) |
> -		       ((vdisplay & 0x200) >> 3));
> -	WREG_CRT(0x10, vsyncstart & 0xff);
> +		       ((vdispend & 0x200) >> 3) |
> +		       ((vsyncstr & 0x200) >> 2));
> +	WREG_CRT(0x09, ((vdispend & 0x200) >> 4) |
> +		       ((vdispend & 0x200) >> 3));
> +	WREG_CRT(0x10, vsyncstr & 0xff);
>   	WREG_CRT(0x11, (vsyncend & 0x0f) | 0x20);
> -	WREG_CRT(0x12, vdisplay & 0xff);
> +	WREG_CRT(0x12, vdispend & 0xff);
>   	WREG_CRT(0x14, 0);
> -	WREG_CRT(0x15, vdisplay & 0xff);
> +	WREG_CRT(0x15, vdispend & 0xff);
>   	WREG_CRT(0x16, (vtotal + 1) & 0xff);
>   	WREG_CRT(0x17, 0xc3);
> -	WREG_CRT(0x18, vdisplay & 0xff);
> +	WREG_CRT(0x18, vdispend & 0xff);
>   
>   	WREG_ECRT(0x01, crtcext1);
>   	WREG_ECRT(0x02, crtcext2);

