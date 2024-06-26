Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A469183C9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD4D10E8DB;
	Wed, 26 Jun 2024 14:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VRpt5OwN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BE310E8D5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719411651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dkiH8oB1Lq06BrQXA4EiojnJ36I3m0baKMRCHVxUGM=;
 b=VRpt5OwNQNPjnmwI0ulJFEFZCDvleV5WnCpHZRwWjPaYM76OFi1U/7NPeHdd37Q04AQKDQ
 Vou9KB89WbGfItjXEvUbQA37FiHUu5+4hZrYiSl8oHs9hiN2GYksC7K7OCRCL1LS7YoPnC
 jLWT1svPHPSqwx37CqdW1CAhcqgToW8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-l-vOR4NZO_Gdwn_PeawYUg-1; Wed, 26 Jun 2024 10:20:50 -0400
X-MC-Unique: l-vOR4NZO_Gdwn_PeawYUg-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ec6276b28bso26264381fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719411649; x=1720016449;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/dkiH8oB1Lq06BrQXA4EiojnJ36I3m0baKMRCHVxUGM=;
 b=GLpWlJ6q2hFJ0KKZeW2o8D8kZEf/l3DLYeb4qoGq+oBJqLQRrQZbh8gDCB73hVy58j
 3oCSE566B0jSVCxNuAVsK4jGzf+NSqMc7UYghwNt2LXdOmQ1YQ0M/tV/Bi0gZdYJoAAq
 WwT+CXLDWG+w+IZlxyT3wrjbxU0tWY/2MALSL0G5puPFMmFUVSQYU72HnAUxfVSrru9k
 ag4ywLftJa/uAx+4ISE6O/S9iUq1FQb3BT9xDFLJkUrbi3F9EbcEhd/zVtlfBMPwyaHe
 Y3t9r4PiwWk/N7pvLnlyqIb4yxPT1ynD23KhkQc7r5GHGkRpSv1w8K/tSl9oD6YcaPXm
 wVZg==
X-Gm-Message-State: AOJu0YxGbM3rhdor89KKzx+IN1ejA3hLKn9iZZldiIjaCSr9X2RqqHPU
 t8+hWKFjSgYaLmEqai1GqRPv9HxzqMW6wi2XyhH6CSYU1IbqEpywm8BwKHKkUPQw1I1WU+gpe7X
 UhQ9QJqo9LWHyUKblb/OfcFlwBisOv3dIjxBz9w+0NP4DPeeqwqHTWDx7JxqrKlauDw==
X-Received: by 2002:a2e:8297:0:b0:2ec:174b:75bb with SMTP id
 38308e7fff4ca-2ec5b38ad36mr60758631fa.28.1719411648861; 
 Wed, 26 Jun 2024 07:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbJrtCfsDdRjevLVF2jDTZKd/+U7FelbsHUMDDFMFSBrVQopsqeDt+kK0Oh5JvZq3Uufc/4g==
X-Received: by 2002:a2e:8297:0:b0:2ec:174b:75bb with SMTP id
 38308e7fff4ca-2ec5b38ad36mr60758471fa.28.1719411648462; 
 Wed, 26 Jun 2024 07:20:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8285f5csm26987465e9.25.2024.06.26.07.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 07:20:48 -0700 (PDT)
Message-ID: <70f5f582-f20d-4102-a6e6-7d5927edbb56@redhat.com>
Date: Wed, 26 Jun 2024 16:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panic: Restrict graphical logo handling to
 built-in
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <cover.1719391132.git.geert+renesas@glider.be>
 <4009fca99a7c05f617cc9899c6d0a5748415595d.1719391132.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4009fca99a7c05f617cc9899c6d0a5748415595d.1719391132.git.geert+renesas@glider.be>
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



On 26/06/2024 10:41, Geert Uytterhoeven wrote:
> When CONFIG_DRM_PANIC=y, but CONFIG_DRM=m:
> 
>      ld: drivers/gpu/drm/drm_panic.o: in function `drm_panic_setup_logo':
>      drivers/gpu/drm/drm_panic.c:99: multiple definition of `init_module'; drivers/gpu/drm/drm_drv.o:drivers/gpu/drm/drm_drv.c:1079: first defined here
> 
> Fix this by restricting the graphical logo handling and its
> device_initcall() to the built-in case.  Logos are freed during late
> kernel initialization, so they are no longer available at module load
> time anyway.

Thanks a lot for this fix.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: 294bbd1f2697ff28 ("drm/panic: Add support for drawing a monochrome graphical logo")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406261341.GYsbLpN1-lkp@intel.com/
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/gpu/drm/drm_panic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 67f78b5a76b61e3d..948aed00595eb6dd 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -91,7 +91,7 @@ static const struct drm_panic_line logo_ascii[] = {
>   	PANIC_LINE(" \\___)=(___/"),
>   };
>   
> -#ifdef CONFIG_LOGO
> +#if defined(CONFIG_LOGO) && !defined(MODULE)
>   static const struct linux_logo *logo_mono;
>   
>   static int drm_panic_setup_logo(void)

