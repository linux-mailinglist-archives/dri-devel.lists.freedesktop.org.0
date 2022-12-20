Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD68651E74
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CA210E0A7;
	Tue, 20 Dec 2022 10:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B01410E0A9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671530982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgFz7D2KcpsmmziULYeqUqAf4RT2lleti+aD7E+6YtE=;
 b=S3IERdWlwVv0dDriyG429bmI65DDWG6ziWbtIZKp3p1isgqp/KL9W0euIFLbbW8FCSiYaR
 /n6NCm9YvZtoWF8DT1sKTVouYM/D8qF1WQKvNiC87dJ4loAeyTHYavbk1y95S3Pj7XAKVU
 TIQMueLe88DFhfYQ9RDR2RKrepPk2q8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-148-ATQ9aAb4MTyRfpE54RHpfA-1; Tue, 20 Dec 2022 05:09:40 -0500
X-MC-Unique: ATQ9aAb4MTyRfpE54RHpfA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d6-20020adfa346000000b0024211c0f988so2085562wrb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 02:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mgFz7D2KcpsmmziULYeqUqAf4RT2lleti+aD7E+6YtE=;
 b=ISM5biq0EiB9T0Kpx0CaIZuXl85dgnud2WNDRCzhlnv3B5Til4Jf2Wzq1QwKOtYwhP
 xXXP7Bc46BZ338ZU19U719E8cLOWHdqnqE2hKN3tZCCbuDkkfH3sMkaZDEtNY/nI0De2
 rIzm/pnNz/o6ZM0t1zSPafTBpZmX2HDGjQhjAmx5wA0Yx5H3LbrOVsi+wPAJF/WK6U0T
 Z0MZL1Kigwoi0sqGxmlrIBj/rxTVzKTROZkt3i/wjcIS/w9QnWZLO0/KvSZ7+/j6rMNP
 GtBHQMc+FoxP22vmNgCQk2Voadl49bEv6GrIk/pyEm0jw9QRRYKijrhJWweCYx6CAEST
 1X5Q==
X-Gm-Message-State: ANoB5pkCX3XM32/YjivZexNztpbxs3en0LfZDL/epVNsbZvRiZVNRsrW
 g1Q6Cu5MqSvCaFLOg1VAOWCpWDYFdl/ZPVZ4BlyqGgr/RKd7SxAK9koIxSvJF6p2POser8Qf8zX
 igQlxpe+nu+jYgqva9qQOYD0Fge75
X-Received: by 2002:a1c:cc1a:0:b0:3cf:5583:8b3f with SMTP id
 h26-20020a1ccc1a000000b003cf55838b3fmr35445725wmb.20.1671530979748; 
 Tue, 20 Dec 2022 02:09:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf58osCBA63KsWz2J/XRbePm7QROHcm1znIqcEy5B/fVtJsoasI+W3zC+FemmYu4QbpLM8U86g==
X-Received: by 2002:a1c:cc1a:0:b0:3cf:5583:8b3f with SMTP id
 h26-20020a1ccc1a000000b003cf55838b3fmr35445716wmb.20.1671530979565; 
 Tue, 20 Dec 2022 02:09:39 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b003d35c845cbbsm5019792wmo.21.2022.12.20.02.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 02:09:39 -0800 (PST)
Message-ID: <2b008943-6916-5371-9bac-cb5926172d89@redhat.com>
Date: Tue, 20 Dec 2022 11:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/9] firmware/sysfb: Fix EFI/VESA format selection
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net
References: <20221213201233.9341-1-tzimmermann@suse.de>
 <20221213201233.9341-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221213201233.9341-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/13/22 21:12, Thomas Zimmermann wrote:
> Select color format for EFI/VESA firmware scanout buffer from the
> number of bits per pixel and the position of the individual color
> components. Fixes the selected format for the buffer in several odd
> cases. For example, XRGB1555 has been reported as ARGB1555 because
> of the different use of depth and transparency in VESA and Linux.
> 
> Bits-per-pixel is always the pixel's raw number of bits; including
> alpha and filler bits. It is preferred over color depth, which has a
> different meaning among various components and standards.
> 
> Also do not compare reserved bits and transparency bits to each other.
> These values have different meanings, as reserved bits include filler
> bits while transparency does not.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/sysfb_simplefb.c | 43 ++++++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 

[...]

> +	/*
> +	 * The meaning of depth and bpp for direct-color formats is
> +	 * inconsistent:
> +	 *
> +	 *  - DRM format info specifies depth as the number of color
> +	 *    bits; including alpha, but not including filler bits.
> +	 *  - Linux' EFI platform code computes lfb_depth from the
> +	 *    individual color channels, including the reserved bits.
> +	 *  - VBE 1.1 defines lfb_depth for XRGB1555 as 16, but later
> +	 *    versions use 15.
> +	 *  - On the kernel command line, 'bpp' of 32 is usually
> +	 *    XRGB8888 including the filler bits, but 15 is XRGB1555
> +	 *    not including the filler bit.
> +	 *
> +	 * It's not easily possible to fix this in struct screen_info,
> +	 * as this could break UAPI. The best solution is to compute
> +	 * bits_per_pixel here and ignore lfb_depth. In the loop below,
> +	 * ignore simplefb formats with alpha bits, as EFI and VESA
> +	 * don't specify alpha channels.
> +	 */

Thanks a lot for adding this comment. It's very insightful.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

