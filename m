Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADB3901CFA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 10:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AC410E363;
	Mon, 10 Jun 2024 08:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RrKGzo7Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B37410E363
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718008337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSRcH/8de8I+xRtp7H6QKboIq4H1BR83RocjPY6icfE=;
 b=RrKGzo7QciwVDC+hXcsroVcKDHF8wZDjayiedqd3DvdejgddAywofDEz6JQEDixlgBnl+m
 vvnpETG52MMYm+HFohBQvy6OnUi9+tlSb/ZnyHsSRjmdp0IbGYQhXl56vinVnptblvF5Ke
 /YDMbxwFjvqutgBcmYabwsSPxxFiDeA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-PlU7QPPqOsuUraFC4o4xZw-1; Mon, 10 Jun 2024 04:32:15 -0400
X-MC-Unique: PlU7QPPqOsuUraFC4o4xZw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a6e8aa42033so119008366b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 01:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718008334; x=1718613134;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hSRcH/8de8I+xRtp7H6QKboIq4H1BR83RocjPY6icfE=;
 b=WgtRDzkg+7/u+5mjYw2YYmz9kKauZHAPTDL3U4psyoAiqtcdn1JUmsRxpWrIBtviO7
 iU7FxJMn3CWYCpvt9bk6Y+FVMzXhn9fWmpVzdjcrQcOUerPpqJVoocm1z54OXXFu8xfo
 0Il4oESWoazqiEimeay/VQGmdccz4plSELzjBypQ0hhhG64BL/7yldQVGdjyCHSyoxGJ
 wdZBOB+pIPSKouaJrGZKHFUizOMT7mAzgRTAwAXBt34vLn3gGTnK1ripGRvUpaoykC3w
 5+h1RZcG/AAvIPT5MsvI8J/uuX4FsAVrcZ/OVgDsABCu3Bg0niZ+M4bT+D+5KoY02Rjm
 CPVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3PhF/bRkRDy1w6BkXycOop9QXEz2ATUP/twuEq1+m+HJ5b0BO10sTjp6KOoUx4gB0wW2OSGgpjlL27dgf0rH662OxDk8MriSahHyShCI6
X-Gm-Message-State: AOJu0Yx8WDYpvCICCZodEfr3b8c4NYMey7yNp4tdn3YXZhXUCdKxoWr2
 isWFPI21mu/OGrRZ53tEUZHwIUXkGAxFlwvJxVyWGc5wxGh1SjknIGkLttfORhM3gIcbE8oP/y7
 BC1AaT2rsboQuhzMRxthHAgvuENMWQr3eC4YhAFJTzwqFyMQxVdh2XEIBtjaTRRYm9w==
X-Received: by 2002:a17:906:6b01:b0:a6f:117c:60c1 with SMTP id
 a640c23a62f3a-a6f117c6798mr232882766b.55.1718008334488; 
 Mon, 10 Jun 2024 01:32:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNdowhmu00ckKngsHHAEOjW9e2OU6ATnmpJMzLrmBT1lN3+KYrPR1LaT6Wx0JstaTndpl+FQ==
X-Received: by 2002:a17:906:6b01:b0:a6f:117c:60c1 with SMTP id
 a640c23a62f3a-a6f117c6798mr232880166b.55.1718008334104; 
 Mon, 10 Jun 2024 01:32:14 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c8df2c332sm55431a12.61.2024.06.10.01.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 01:32:13 -0700 (PDT)
Message-ID: <b5de3aaf-24e4-4bb1-b34a-f9f45efc0eac@redhat.com>
Date: Mon, 10 Jun 2024 10:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240609-md-drivers-gpu-drm-tiny-v1-1-6905fe4ada50@quicinc.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240609-md-drivers-gpu-drm-tiny-v1-1-6905fe4ada50@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/9/24 7:20 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bochs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/cirrus.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/gm12u320.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/gpu/drm/tiny/bochs.c    | 1 +
>  drivers/gpu/drm/tiny/cirrus.c   | 1 +
>  drivers/gpu/drm/tiny/gm12u320.c | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index c23c9f0cf49c..d15f4d3baeab 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -736,4 +736,5 @@ drm_module_pci_driver_if_modeset(bochs_pci_driver, bochs_modeset);
>  
>  MODULE_DEVICE_TABLE(pci, bochs_pci_tbl);
>  MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
> +MODULE_DESCRIPTION("DRM Support for bochs dispi vga interface (qemu stdvga)");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index 4e3a152f897a..89484f7084bd 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -760,4 +760,5 @@ static struct pci_driver cirrus_pci_driver = {
>  drm_module_pci_driver(cirrus_pci_driver)
>  
>  MODULE_DEVICE_TABLE(pci, pciidlist);
> +MODULE_DESCRIPTION("Cirrus driver for QEMU emulated device");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 0187539ff5ea..07c6640022c2 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -755,4 +755,5 @@ static struct usb_driver gm12u320_usb_driver = {
>  
>  module_usb_driver(gm12u320_usb_driver);
>  MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
> +MODULE_DESCRIPTION("GM12U320 driver for USB projectors");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
> change-id: 20240609-md-drivers-gpu-drm-tiny-a3370189f560
> 

