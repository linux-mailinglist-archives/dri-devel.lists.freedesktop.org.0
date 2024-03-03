Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4F86F6DB
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 20:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DA410E25D;
	Sun,  3 Mar 2024 19:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HdO/z/2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C0010E25D
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 19:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709494899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CrZqCaxS9s67B9eUeOozSgFserucqgwctSw84bcfIM8=;
 b=HdO/z/2a9eUDxuDiDB0q+vxFKA8PLc4Pvj/Mq2pnmptQiX1+iFWSrd9+iEySK/tU7p69od
 38oTVgrIHkoeARBnSgDyrB1kXgwXwx/oHjo4WoW9tnuh4ffBIyq8Z5u7C/Irtd62Sxfu8J
 eGgvLtMQlJtDo9xNmiiW0xQenUinLVA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-UVACN8-xNnqdr209Dbo4AA-1; Sun, 03 Mar 2024 14:41:36 -0500
X-MC-Unique: UVACN8-xNnqdr209Dbo4AA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a44508b6b22so201899566b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Mar 2024 11:41:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709494895; x=1710099695;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CrZqCaxS9s67B9eUeOozSgFserucqgwctSw84bcfIM8=;
 b=RBdUVn0R9gUeKEtafA1F275geWnipEGXyNNSf6iuIdi+Ws/VgMgEGmD0EZwhvTTbot
 LXGwXrgUY0aha3cdGpaa1W/x8vzgvfaxIvRNP/m/jLMLDmhcNVqcIiKboHU3D4GC+CDz
 nQ0Da8EaZnX3lN/YkdQAB1y4Xe2Z8srTkG8e3nGCNppfWn75sExPQvBGIb2tVyJivgHr
 gRlbjTY0XCu+gS92AeQnsYbUbKlxVl7JBAw06LIjtuQ+GMI6EYKfWp3wvoEKUVPDGyzH
 7Ew4vcgKIC4KwkBWV6zcACO/UJAvOzin8t1fBItnqZgSLp0u/uSFziR56+M3fT9M+ZyG
 EJYw==
X-Gm-Message-State: AOJu0YxFO7/nC2aVzSfpR5+uNYHyTZFBlQUZYr6Y7ZLBdCb7waQ0aX/v
 EEIHF9NhGIofJaoqUPWGSuIaqXfBDbahtN90wQ0j4oseX/vxGWpvzDWR+UgRMtd54Kxk1CYlFq6
 NXshiHM0YRuX045l+C9SQjt640Q5aotZoC4b/bWhVZP5m4m4jIwjvzTCF7628cs3ZDQ==
X-Received: by 2002:a17:906:bc48:b0:a44:958:c3a4 with SMTP id
 s8-20020a170906bc4800b00a440958c3a4mr4451503ejv.32.1709494895280; 
 Sun, 03 Mar 2024 11:41:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu1jxPV7cPS+/fsucBMIlB97ZiWQ90zg1WuMlonpMMThfwE6bnawsbVY/blo0sj3F2RYlgDg==
X-Received: by 2002:a17:906:bc48:b0:a44:958:c3a4 with SMTP id
 s8-20020a170906bc4800b00a440958c3a4mr4451489ejv.32.1709494894956; 
 Sun, 03 Mar 2024 11:41:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 tk2-20020a170907c28200b00a43ab3e38d6sm3933441ejc.114.2024.03.03.11.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 11:41:34 -0800 (PST)
Message-ID: <0f6180b5-92ef-4fb5-8df9-734ec4105c68@redhat.com>
Date: Sun, 3 Mar 2024 20:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] drm/vboxvideo: fix mapping leaks
To: Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, stable@kernel.vger.org
References: <20240301112959.21947-1-pstanner@redhat.com>
 <20240301112959.21947-11-pstanner@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240301112959.21947-11-pstanner@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/1/24 12:29, Philipp Stanner wrote:
> When the PCI devres API was introduced to this driver, it was wrongly
> assumed that initializing the device with pcim_enable_device() instead
> of pci_enable_device() will make all PCI functions managed.
> 
> This is wrong and was caused by the quite confusing PCI devres API in
> which some, but not all, functions become managed that way.
> 
> The function pci_iomap_range() is never managed.
> 
> Replace pci_iomap_range() with the actually managed function
> pcim_iomap_range().
> 
> CC: <stable@kernel.vger.org> # v5.10+
> Fixes: 8558de401b5f ("drm/vboxvideo: use managed pci functions")
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Since this depends on the pcim_iomap_range() function which is new
in this series and since the vboxvideo code does not see a lot
of changes I think that it would be best for this patch to be
merged through the PCI tree together with the rest of the series.

Regards,

Hans


> ---
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index 42c2d8a99509..d4ade9325401 100644
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
> @@ -116,11 +115,10 @@ int vbox_hw_init(struct vbox_private *vbox)
>  	DRM_INFO("VRAM %08x\n", vbox->full_vram_size);
>  
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

