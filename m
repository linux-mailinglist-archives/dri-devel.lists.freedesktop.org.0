Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A02937614
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 11:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4852810EB8D;
	Fri, 19 Jul 2024 09:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A504NrIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87A910EB8D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721382491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrXqc6+BI9y9N/9R3c5HOJPDPGVypzLRzTKRBdzUEf4=;
 b=A504NrIF0NL2DaPgQS7g3/hrfSWjvTOJ33eUUAIJCv6AINc7k/7jcfG942N2YXGpYuiXOr
 c616RjOgfc7UFuSXgiQ5diLm8eKgBGfKTqy4a120NlOEwIy1Sg/a2ZecDh1jBJv7Gs34s4
 Ns9mIUEdK71URkODCvPM3+KbkxWdb1M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-a2WRkzgVNICY9ot8tLl1ag-1; Fri, 19 Jul 2024 05:48:10 -0400
X-MC-Unique: a2WRkzgVNICY9ot8tLl1ag-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-36873a449dfso310105f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 02:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721382489; x=1721987289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wrXqc6+BI9y9N/9R3c5HOJPDPGVypzLRzTKRBdzUEf4=;
 b=N7xvo04tnE8Jb447CEPqx4yqxgeaD6S+zgBtdaHSIrsKR/o/hPHYuQ8v4bTa84MDN8
 HnksPiUoKglXV7x/9vdPJQbr5V+IbbOV5WrQifbCc8qPDwZ4Ni8bYuUjkfplwNvCpeYB
 64+7yavsxrjzSkegyLJYTcsBYll30tPWjqPYBWr+FEvx5P2EiAKoEHxen0VcjDp8Jv2k
 7/Oa6opShsRyJKoJXM5Mo6EO1Wtz9wwJ/TALaigAzDvVA+uWL5cWlPAKRpRwBvo9io3v
 tACqiwljeflS8sy5tTEWRPxov8GGuEOqQm8LwRJVdA0QkH3BzwcR5D2wbHd/nzZFOz68
 NU9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVQ5Y5TTUKvyNg+TIvEqT07Yo4kd2hnJXojmSJyIHgD6qA1h7LKTfnWFOjXLfQqbujzQ2A3aBkwa+L92TEtkRUcPU0vbSP6E2OHPSWTqCX
X-Gm-Message-State: AOJu0Yzn+/DYnwbPWQuQS+HGFPUHsfVaqRd3HPK+TY7LLSqUhXulU31n
 D5GlMLTGr+yFbDAMvjSx3rH/l5A8JkYkzKAayELhYuAYaLzAxruyfziN3ACWeKU9ayOet25XfGV
 24Zyb2hLjgvFROptlIYB3z+v3UKBQ+XzqX1JTQz0JG4gw9TuEHwFyaV8sK/Xxk2QtoQ==
X-Received: by 2002:adf:e650:0:b0:368:3562:7c76 with SMTP id
 ffacd0b85a97d-368742a29e8mr1315312f8f.3.1721382489198; 
 Fri, 19 Jul 2024 02:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK22G63JIRPE2xIFnYosHW2rA1aTs4UvzPTnx79Ujjp4yRSq10kKEZSH+bF2E+A1zNhnULEQ==
X-Received: by 2002:adf:e650:0:b0:368:3562:7c76 with SMTP id
 ffacd0b85a97d-368742a29e8mr1315291f8f.3.1721382488767; 
 Fri, 19 Jul 2024 02:48:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787cee03sm1119215f8f.76.2024.07.19.02.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 02:48:08 -0700 (PDT)
Message-ID: <031ac173-412c-4d14-ad07-52e438f86790@redhat.com>
Date: Fri, 19 Jul 2024 11:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/panic: Remove build time dependency with
 FRAMEBUFFER_CONSOLE
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20240717090102.968152-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240717090102.968152-1-jfalempe@redhat.com>
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



On 17/07/2024 10:48, Jocelyn Falempe wrote:
> When proposing to enable DRM_PANIC on Fedora, some users raised concern about the need to disable VT_CONSOLE.
> So this is my new attempt to avoid fbcon/vt_console to overwrite the panic screen.
> This time it doesn't involve any locking, so it should be safe.
> I added a skip_panic option in struct fb_info, and check if this option and the panic_cpu are set in fb_is_inactive(), to prevent any framebuffer operation.
> Also skip_panic is only true if the drm driver supports drm_panic, so you will still get the VT panic info on drivers that don't have drm_panic support yet.
> 

Thanks all,

I've just pushed them to drm-misc-next, with the required changes.
(splitting patch 2 in 2, and moving function prototype to 
drm_crtc_internal.h).

Best regards,

-- 

Jocelyn


> Jocelyn Falempe (3):
>    drm/panic: Add drm_panic_is_enabled()
>    fbcon: Add an option to disable fbcon in panic.
>    drm/panic: Remove build time dependency with FRAMEBUFFER_CONSOLE
> 
>   drivers/gpu/drm/Kconfig          |  2 +-
>   drivers/gpu/drm/drm_fb_helper.c  |  2 ++
>   drivers/gpu/drm/drm_panic.c      | 20 ++++++++++++++++++++
>   drivers/video/fbdev/core/fbcon.c |  7 ++++++-
>   include/drm/drm_panic.h          |  2 ++
>   include/linux/fb.h               |  1 +
>   6 files changed, 32 insertions(+), 2 deletions(-)
> 
> 
> base-commit: a237f217bad50c381773da5b00442710d1449098

