Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454AA84039F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 12:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF1D1128AA;
	Mon, 29 Jan 2024 11:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A311128A8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 11:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706526958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdmBCDGtM8wSDqYKx2ZDXDpktAyoxR2CO0TvUORZDug=;
 b=X9DuaAG+mAQMVfoIOaE/LKHwmAua7FCXZ/uywTDhaDOsgRGqOt5iG6W8PLcPuWuP7aejdU
 El4uuPcbqhB0UQOamQ75Obi9HfcOtsccK7rzRpX+U7E0Nzr20d4Bx7zxYw+Vu+2K1odrE9
 KOXA7tslOFiwt6t0NaVfi1Qc2619hdI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-Ey6COB-_OuKrAjcLhqYTlw-1; Mon, 29 Jan 2024 06:15:56 -0500
X-MC-Unique: Ey6COB-_OuKrAjcLhqYTlw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a2cb0d70d6cso132982366b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 03:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706526955; x=1707131755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PdmBCDGtM8wSDqYKx2ZDXDpktAyoxR2CO0TvUORZDug=;
 b=Y/OSo1FQxuhQWL57XU4jUSlC4XXAWRhn0LTQkNXoe8v2slLrZD5qCPFbDfwEtKEyz9
 hLpg3oTWgGxkirzGX7bEk1KcA1lPuGBh+S+V+gVG4/T3QrDUzyik6c7TaK5K5b10Futu
 GvK+Y6NTeTYb+VqGDCZFdMriiSxnpzFBMgKkUiAKVm4PuV1LiaaXdsPsDMoKnWUkXYaN
 NQ3TcKAVu5rDqNNEjTjaSEpC/l6be+r/cwoO8zcQscdj00usT6AmaW1BfXPRLVXXslZa
 KdZEHG1b1kzt3PaaddeenLtnjilw3san32MCdgtptlK1mrxrnTQMv+EIKScP9eoROcYq
 yEEg==
X-Gm-Message-State: AOJu0YzM+gfwg8dL40E/KJ5vBnZ4p87P1Rg52b4Ngs/fNwfCRha73sGL
 5M/V6T8q1VBkM1EH3Y7i6BjSjZDIWaaHjTMGGngTSoEXH0F4WRivOOn+/3qakvzuQVsD1hHNC35
 eGoDsLsUyj2wmnrIdGcCIGVzlwgrEVb7u2FBZH03mtMTD59dEkXHrNUPdeyLbll38UQ==
X-Received: by 2002:a17:906:a013:b0:a2b:a7e:3496 with SMTP id
 p19-20020a170906a01300b00a2b0a7e3496mr3812584ejy.28.1706526955470; 
 Mon, 29 Jan 2024 03:15:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpAHqhErhQZXiA+dg1bA0riWjrWB83FQhDQeuo1UG0xYvOnaHB3CqQACeeik/4F+TYM4aupQ==
X-Received: by 2002:a17:906:a013:b0:a2b:a7e:3496 with SMTP id
 p19-20020a170906a01300b00a2b0a7e3496mr3812571ejy.28.1706526955125; 
 Mon, 29 Jan 2024 03:15:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 qx25-20020a170906fcd900b00a311a360433sm3893770ejb.143.2024.01.29.03.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 03:15:54 -0800 (PST)
Message-ID: <e21c0853-d10a-44b5-917a-3f3c08102b87@redhat.com>
Date: Mon, 29 Jan 2024 12:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] drm/vboxvideo: fix mapping leaks
To: Philipp Stanner <pstanner@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
References: <20240123094317.15958-1-pstanner@redhat.com>
 <20240123094317.15958-11-pstanner@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240123094317.15958-11-pstanner@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: linux-pci@vger.kernel.org, stable@kernel.vger.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

On 1/23/24 10:43, Philipp Stanner wrote:
> When the PCI devres API was introduced to this driver, it was wrongly
> assumed that initializing the device with pcim_enable_device() instead
> of pci_enable_device() will make all PCI functions managed.
> 
> This is wrong and was caused by the quite confusing devres API for PCI
> in which some, but not all, functions become managed that way.
> 
> The function pci_iomap_range() is never managed.
> 
> Replace pci_iomap_range() with the actually managed function
> pcim_iomap_range().
> 
> Additionally, add a call to pcim_request_region() to ensure exclusive
> access to BAR 0.

I'm a bit worried about this last change. There might be
issues where the pcim_request_region() fails due to
e.g. a conflict with the simplefb / simpledrm code.

There is a drm_aperture_remove_conflicting_pci_framebuffers()
call done before hw_init() gets called, but still this
has been known to cause issues in the past.

Can you split out the adding of the pcim_request_region()
into a separate patch and *not* mark that separate patch
for stable ?

Regards,

Hans





> 
> CC: <stable@kernel.vger.org> # v5.10+
> Fixes: 8558de401b5f ("drm/vboxvideo: use managed pci functions")
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index 42c2d8a99509..7f686a0190e6 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -42,12 +42,11 @@ static int vbox_accel_init(struct vbox_private *vbox)
>  	/* Take a command buffer for each screen from the end of usable VRAM. */
>  	vbox->available_vram_size -= vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE;
>  
> -	vbox->vbva_buffers = pci_iomap_range(pdev, 0,
> -					     vbox->available_vram_size,
> -					     vbox->num_crtcs *
> -					     VBVA_MIN_BUFFER_SIZE);
> -	if (!vbox->vbva_buffers)
> -		return -ENOMEM;
> +	vbox->vbva_buffers = pcim_iomap_range(
> +			pdev, 0, vbox->available_vram_size,
> +			vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE);
> +	if (IS_ERR(vbox->vbva_buffers))
> +		return PTR_ERR(vbox->vbva_buffers);
>  
>  	for (i = 0; i < vbox->num_crtcs; ++i) {
>  		vbva_setup_buffer_context(&vbox->vbva_info[i],
> @@ -115,12 +114,15 @@ int vbox_hw_init(struct vbox_private *vbox)
>  
>  	DRM_INFO("VRAM %08x\n", vbox->full_vram_size);
>  
> +	ret = pcim_request_region(pdev, 0, "vboxvideo");
> +	if (ret)
> +		return ret;
> +
>  	/* Map guest-heap at end of vram */
> -	vbox->guest_heap =
> -	    pci_iomap_range(pdev, 0, GUEST_HEAP_OFFSET(vbox),
> -			    GUEST_HEAP_SIZE);
> -	if (!vbox->guest_heap)
> -		return -ENOMEM;
> +	vbox->guest_heap = pcim_iomap_range(pdev, 0,
> +			GUEST_HEAP_OFFSET(vbox), GUEST_HEAP_SIZE);
> +	if (IS_ERR(vbox->guest_heap))
> +		return PTR_ERR(vbox->guest_heap);
>  
>  	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
>  	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,

