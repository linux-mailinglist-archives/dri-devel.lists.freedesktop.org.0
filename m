Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82397B2DCB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 10:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A93010E58B;
	Fri, 29 Sep 2023 08:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690C910E58B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695976039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RIRSfgfaj1IEzG1vYEuTWc96zlUrVlwTVTdp7hmHhWg=;
 b=UI0OcXKTQHBpke3ZDodinkbCTvoPhoOklIiKJgDd2jzOPZSqJkorOuV7iamOyg1t6iTey6
 rWwLpQeBTuHT3fO41wh2RxVjM6HRXcBXRdxUgwjPkLVMX///woWP8TgQXZ264l23B2W/NC
 oxlqxSKeWqGndSbAZV13y1j+NDgC0r4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-UE34n5fUM8idPMHMYauJSg-1; Fri, 29 Sep 2023 04:27:17 -0400
X-MC-Unique: UE34n5fUM8idPMHMYauJSg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40652e8cb57so10478175e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 01:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695976037; x=1696580837;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RIRSfgfaj1IEzG1vYEuTWc96zlUrVlwTVTdp7hmHhWg=;
 b=taIsKxCOKDQlETIn0wNAXkkNQrhZDRJh/2dyH+TWVTN0+WtMgkdUCQ3tJ7C2QxNI0X
 ehzXjinPrbCyPezB7XjAJM7eIgZ/dtaG/Ios/sQ1KT6e25kiiAw+MHDXT7KGZcjefFL4
 0xtu8OAsQPlMuw64GiJIqyctpbMUSdhskeNDwqCDggC2yyc6qmdM0s/MXE4suruVKeD9
 b/Ee2pd+wOwdSdaSPOHr87yfNfEppOkQAHVRmufTak1/pYwKLa1LunSGXE+uOwZdHLOH
 d6mxotIHkSAfWERrKxQjFC2ZeSIhIf8lDNQ8rsKYh/OQKcMKo8ezczVLj2E/wJ/KJLIS
 QYIA==
X-Gm-Message-State: AOJu0YxaZeHRsQugGbUwXlwKer527uYDUwyM8CtRhD1LjusB6t3ZgzPo
 lQwMM/IxmeXqzFZnpQz1txEHr2k2SCOVmVbQMguBJqQLpfmUe3zFC44IhFV3KYrOI9dwvF7HWXM
 K20qX/zugWA7DRDeFahriEYqzwArq
X-Received: by 2002:a7b:c409:0:b0:406:3f62:e583 with SMTP id
 k9-20020a7bc409000000b004063f62e583mr3304871wmi.40.1695976036818; 
 Fri, 29 Sep 2023 01:27:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHPtcEiq9Ml3SzEfqGgEFTDug0vQDgDvMDoMtgh0E2USXvjGkR87om55yQGnxdvd9UqMF7BQ==
X-Received: by 2002:a7b:c409:0:b0:406:3f62:e583 with SMTP id
 k9-20020a7bc409000000b004063f62e583mr3304857wmi.40.1695976036431; 
 Fri, 29 Sep 2023 01:27:16 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t20-20020a1c7714000000b00401e32b25adsm928133wmi.4.2023.09.29.01.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 01:27:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v2 1/5] drm/format-helper: Add struct drm_xfrm_buf to
 cache format conversion
In-Reply-To: <20230920142535.19321-2-tzimmermann@suse.de>
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <20230920142535.19321-2-tzimmermann@suse.de>
Date: Fri, 29 Sep 2023 10:27:15 +0200
Message-ID: <87jzs94c64.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hold temporary memory for format conversion in an instance of struct
> drm_xfrm_buf. Update internal helpers of DRM's format-conversion code
> accordingly. Drivers will later be able to keep this cache across
> display updates.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +int drmm_xfrm_buf_init(struct drm_device *dev, struct drm_xfrm_buf *buf)
> +{
> +	buf->mem = NULL;
> +	buf->size = 0;
> +	buf->preallocated = false;
> +
> +	return drmm_add_action_or_reset(dev, drm_xfrm_buf_init_release, buf);
> +}
> +EXPORT_SYMBOL(drmm_xfrm_buf_init);
> +

Can we find a better name than xfrm? I know that this is what's used in
the internal drm_format_helper.c helpers but if we are exposing this to
drivers, then I think that the naming is not self explanatory.

> +/**
> + * drm_xfrm_buf_reserve - Allocates storage in an xfrm buffer
> + * @buf: The xfrm buffer

At least in the kernel-doc we can say "The buffer used for pixel format
conversion" or something along those lines.

[...]

> +/**
> + * struct drm_xfrm_buf - Stores transformation and conversion state
> + *
> + * DRM helpers for format conversion store temporary state in
> + * struct drm_xfrm_buf. The buffer's resources can be reused

And same here. Maybe struct drm_fmt_conversion_buf ?

Other than this nit, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

