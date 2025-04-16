Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E6DA8B589
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E00010E8B2;
	Wed, 16 Apr 2025 09:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RKWwpE4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AA110E8B2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744796180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sged5tAyl8kCLtoBMdfM15On67zV+o35GLQbuU7lJQk=;
 b=RKWwpE4BYovDPwmrheUgPbUcrhVP9weBdiS1d9afvFP5PdfIPLmv3ANhvpSFclaMLxRKjP
 Zy5DeIyzgiZ7nFzbYRJVpW7zy9De3VpkvY/8UawDYpeTYf9cfZnSY2T0bRdzn+dhTcbxp2
 J6NDd5hcp8/vpsghmxrUMV9FDwDkl7w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-lLsdobkGPTy7iLybJB0fng-1; Wed, 16 Apr 2025 05:36:18 -0400
X-MC-Unique: lLsdobkGPTy7iLybJB0fng-1
X-Mimecast-MFC-AGG-ID: lLsdobkGPTy7iLybJB0fng_1744796178
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43efa869b19so45116165e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744796177; x=1745400977;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sged5tAyl8kCLtoBMdfM15On67zV+o35GLQbuU7lJQk=;
 b=YJ7qnf/Cd4/YRyM0D67U4DIm6xtsX1UH3kB5ZHsjHAzBc73lGHokNEhztU6k2GTdAQ
 akj4rur0YrI1TGzCE+DsgPBDTH2zJ53l0YCmsuWJqr+cQl4uP1LMF9hXLzUX9u+mWUhK
 Xxz/m6ogCuzNUfrpGvSRFpxTVm4N6Sf1UtzOMfJeSW7pJMc1BSWfYT8gFPUW38+S9L++
 TjbTQJmRqAaJmYF+HoTsY9tCCmSvYjeTqHvZ1aFpXIOSAnOsOujr19+/gS8258F97tSd
 y/AU69oaTSmkLZoJD3eGxKTaU3JPNuo+wrVwsCOmouNkeb0PGbqUG6vI8OJeeinG+tGA
 D3Bw==
X-Gm-Message-State: AOJu0YwRJPZL2ggtOUkZYIlmY5wpV8DYEoLhJxmu5+s3T0g/wQWd1Hi6
 pxCIzo46UabtSGcjcyWev/2fBIRgGK+6TUzCKCJRBuMLI4nkrRyadhhk8FN8j6LWWkBkg4GJRKu
 c5SdNSnqFDDnB3wVtRxS1R1NX9DCrotH0+tzdqypotRFuUiEBEZCWCiUvGP8qMwKlLQ==
X-Gm-Gg: ASbGncvcvZAFAzTMFOgayXfNbKLIngRJ5ZUOarcqcZRrTqZlrjOd77bzOVp5R9zI1SU
 wdY5AkcOcxsyb+gDJyMC8Qi8aWoAyVIHjvzn77PFnNHfwlklcG9yTp9WRb4+yfaaXCezkLIhuGk
 NgX0WmueXR28MqIm7FOrokrgPQw1R+2xmG/h3u+vREDUgngjhDglblHiHwCK7Pj83XyLMRu9yoU
 Isb45SawG43FqwtM5XFTJT+PNjjEqavi6GD4gE1FOY8BL3V//X1to2LL7ke9tAazJOS5aWmD9SN
 bOBUCQWuzXCI8FDRoh8BRaBI9gt643HcfKAhPsDlgqWceAyNobo=
X-Received: by 2002:a05:600c:4688:b0:43c:fa52:7d2d with SMTP id
 5b1f17b1804b1-4405d69b7acmr8320975e9.20.1744796177370; 
 Wed, 16 Apr 2025 02:36:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHxus+/zkcBTc5r/1IQaSd+xYWcRd0zPCTMc+e/kR8bd+9MgjmqmAf5ZHQJjwZjgaCDL4+9w==
X-Received: by 2002:a05:600c:4688:b0:43c:fa52:7d2d with SMTP id
 5b1f17b1804b1-4405d69b7acmr8320655e9.20.1744796176740; 
 Wed, 16 Apr 2025 02:36:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4d105bsm15618345e9.11.2025.04.16.02.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 02:36:15 -0700 (PDT)
Message-ID: <f32eff25-125c-4384-a395-a459ee165429@redhat.com>
Date: Wed, 16 Apr 2025 11:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Fix value in <VBLKSTR> register
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 wakko@animx.eu.org
Cc: dri-devel@lists.freedesktop.org, =?UTF-8?B?0KHQtdGA0LPQtdC5?=
 <afmerlord@gmail.com>, stable@vger.kernel.org
References: <20250416083847.51764-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250416083847.51764-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ytLF8Fv8_TmRPD1xreO8qf_NXZ8aeA6YdChnP1C_-b8_1744796178
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 16/04/2025 10:38, Thomas Zimmermann wrote:
> Fix an off-by-one error when setting the vblanking start in
> <VBLKSTR>. Commit d6460bd52c27 ("drm/mgag200: Add dedicated
> variables for blanking fields") switched the value from
> crtc_vdisplay to crtc_vblank_start, which DRM helpers copy
> from the former. The commit missed to subtract one though.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reported-by: Wakko Warner <wakko@animx.eu.org>
> Closes: https://lore.kernel.org/dri-devel/CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com/
> Reported-by: Сергей <afmerlord@gmail.com>
> Closes: https://lore.kernel.org/all/5b193b75-40b1-4342-a16a-ae9fc62f245a@gmail.com/
> Closes: https://bbs.archlinux.org/viewtopic.php?id=303819
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d6460bd52c27 ("drm/mgag200: Add dedicated variables for blanking fields")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.12+
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index fb71658c3117..6067d08aeee3 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -223,7 +223,7 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
>   	vsyncstr = mode->crtc_vsync_start - 1;
>   	vsyncend = mode->crtc_vsync_end - 1;
>   	vtotal = mode->crtc_vtotal - 2;
> -	vblkstr = mode->crtc_vblank_start;
> +	vblkstr = mode->crtc_vblank_start - 1;
>   	vblkend = vtotal + 1;
>   
>   	linecomp = vdispend;

