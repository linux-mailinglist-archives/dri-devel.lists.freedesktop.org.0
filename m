Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B65BAC3C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4796610EC18;
	Fri, 16 Sep 2022 11:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4660B10EC18
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663327328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZStFFZ+iI6FXYbByTwSalDf1O2JmtSMbYAUVSsU2G0=;
 b=FQHyTAlQesxTg66gKAs8pNPjCblInH9m5U0Z7zJDgqautU+ihe5UXNJ4m442qefTSEDYSZ
 v4zBvrIupvE4c07vBTbfgjhLAhKRzk4YdisOLODg/TWsnU9OMbDdtN9Z3zMtdvoA7HRBcM
 COH5pJ/DmABcrCA1bc8/kqe9UF+ZGGM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-V7nx0CobOoG98buW70HkVQ-1; Fri, 16 Sep 2022 07:22:07 -0400
X-MC-Unique: V7nx0CobOoG98buW70HkVQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 i132-20020a1c3b8a000000b003b339a8556eso1424539wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 04:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FZStFFZ+iI6FXYbByTwSalDf1O2JmtSMbYAUVSsU2G0=;
 b=VclCNj04sdBADIsYQ4io87NKtnYa22zHmrvuH5naVo9h3NugrQd5RD5PtYiU8pxXYA
 S2dZxOHowkNeGE0Daeos9pJktZ1omgPuiROJEkVC87pdu6V6Cb2RjbosfiWWzSTZkHWA
 2hX+LD+P9IxL5ZcFy550NnkPyupW+raU3eJuenfKqrnL/5I8MiSDV9vkV9fX5UwB/buY
 DRQoXjhJKhkIE9NM/ebCAtHFLS+imnuNoAsjHXlT8L5SIg8zkOP0rNZHGHdWnT+qsD4r
 yRg4ZfigmT22yyFbu2MXdomkjsKqySnYrPj/BljEKRs3LkL6tGRf5lM51N0tm3p3XBmE
 YeMQ==
X-Gm-Message-State: ACrzQf0vAcSoMjJbb+dCT7bVensKtUUhh4pBukuuuy0yf06SU0w2wWQM
 +cTz5yliJmeGw3zBXYCHDRf55TY29P+ikHRDFDk61a9EuS88CCXrFRuZhpqidvoCtf2EViNB2Zq
 UVJuRm0bzR6QLq+j2WsdKufF9dREc
X-Received: by 2002:a05:600c:2142:b0:3b4:9289:9d4e with SMTP id
 v2-20020a05600c214200b003b492899d4emr3014139wml.197.1663327326551; 
 Fri, 16 Sep 2022 04:22:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50/Fus1+u1OkFAc1JDfNO6cvMZsMd9NEZGcHTTB2Bq15UChaJpRUR0BIpVpBusOvuQyI2Tvg==
X-Received: by 2002:a05:600c:2142:b0:3b4:9289:9d4e with SMTP id
 v2-20020a05600c214200b003b492899d4emr3014107wml.197.1663327326256; 
 Fri, 16 Sep 2022 04:22:06 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u5-20020a5d4345000000b002287d99b455sm4645486wrr.15.2022.09.16.04.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 04:22:05 -0700 (PDT)
Message-ID: <7080a54e-9e0d-93f4-ecba-150d3af03226@redhat.com>
Date: Fri, 16 Sep 2022 13:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/4] drm/plane: Allocate planes with
 drm_universal_plane_alloc()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220909105947.6487-3-tzimmermann@suse.de>
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/9/22 12:59, Thomas Zimmermann wrote:
> Provide drm_univeral_plane_alloc(), which allocated an initializes a
> plane. Code for non-atomic drivers uses this pattern. Convert it to
> the new function. The modeset helpers contain a quirk for handling their
> color formats differently. Set the flag outside plane allocation.
> 
> The new function is already deprecated to some extend. Drivers should
> rather use drmm_univeral_plane_alloc() or drm_universal_plane_init().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

>  
> +__printf(10, 11)
> +void *__drm_universal_plane_alloc(struct drm_device *dev,
> +				  size_t size, size_t offset,
> +				  uint32_t possible_crtcs,
> +				  const struct drm_plane_funcs *funcs,
> +				  const uint32_t *formats,
> +				  unsigned int format_count,
> +				  const uint64_t *format_modifiers,
> +				  enum drm_plane_type plane_type,
> +				  const char *name, ...);
> +
> +/**
> + * drm_universal_plane_alloc - Allocate and initialize an universal plane object

Should functions kernel-doc definitions use parenthesis or not? I see in
https://elixir.bootlin.com/linux/latest/source/Documentation/doc-guide/kernel-doc.rst#L59
that the example has it but notice that there is not consistency in DRM
about this.

> + * @dev: DRM device
> + * @type: the type of the struct which contains struct &drm_plane
> + * @member: the name of the &drm_plane within @type
> + * @possible_crtcs: bitmask of possible CRTCs
> + * @funcs: callbacks for the new plane
> + * @formats: array of supported formats (DRM_FORMAT\_\*)
> + * @format_count: number of elements in @formats
> + * @format_modifiers: array of struct drm_format modifiers terminated by
> + *                    DRM_FORMAT_MOD_INVALID
> + * @plane_type: type of plane (overlay, primary, cursor)
> + * @name: printf style format string for the plane name, or NULL for default name
> + *
> + * Allocates and initializes a plane object of type @type. The caller
> + * is responsible for releasing the allocated memory with kfree().
> + *

I thought that all the drmm_*_alloc() managed interfaces should use the
drmm_k{z,m}alloc() helpers, so that the memory is automatically freed
on the last drm_dev_put() call ?

Other than those two nits, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

