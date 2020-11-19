Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8052B9117
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 12:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3360B6E507;
	Thu, 19 Nov 2020 11:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD596E507
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605785762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/5IspfU90zIX991JUVFkVj/C2unpdmkwilticvObC0=;
 b=Y/5OBY/+ctuANOC9KhuExWHwshRbdx4Ks3ya9W1rGoTsWTGUj6G2BGkxk5Hwm6vNIu2H06
 knY0PKzmzPpRI+g629baleQb0ZrKX6h+ONFaRApjsy3QqlaXz//8kKbxxMxmWoSP5rVKYG
 0XgVj6sSk3TPMUEdOhuAN7GS54yPXkM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-ALi7BrmfPnukC0UQGek_cw-1; Thu, 19 Nov 2020 06:35:59 -0500
X-MC-Unique: ALi7BrmfPnukC0UQGek_cw-1
Received: by mail-ed1-f70.google.com with SMTP id f20so2179131edx.23
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 03:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k/5IspfU90zIX991JUVFkVj/C2unpdmkwilticvObC0=;
 b=QPzNZnIvAEGgODtd9jf/vZWUhU9o8SSGCEuV6QDFA3FwWXUQFdJ/4F+F/60iH+rqkC
 v6SLYDU5h5sQ9P59ESKKvJ8AJpvYHzLPeNf3oUdsmKK1wwGunRoBfmLFZl3vLBALR8SP
 kpHRRrsewxvuqxDucHBFnLoAAM8rGBMhYoLN2Qtets55uMEabmg503oXxKEtpUxIdUbS
 JbHQ94xSOmUbf2yjFphyedN459fUTnObwwBFnWK0P/7HsLHj4zqKlcCVjFAbBM5mDUMZ
 yUO0bwZprOqfyF0Pdw9apjCutd7N1mO8DRqpom4vCZ3gonLwp1iCVx2MwTv1CZle9MSm
 223g==
X-Gm-Message-State: AOAM533lDVhgdaYM4rVYJYyFbwFo5x8xbsuBI9qgHBemBRCXOJVF4o8/
 5QgBlmWuHCbILYll8nmvS8ZPCW+EVacNbffgVAgWr+e/OqmIFSc0HBkBzWlZetJBnT6Vopv6CX9
 qIEGi4yLXDfwbPuZhwMqN/TSdSL1k
X-Received: by 2002:a50:fe14:: with SMTP id f20mr28750511edt.61.1605785758292; 
 Thu, 19 Nov 2020 03:35:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5ufRPbUWhN6nwg0jOBe+Zm79jEvMGr/jMkv0amNW3UhNcw+wQBb51H7S/UGhkMwMxdVK/rQ==
X-Received: by 2002:a50:fe14:: with SMTP id f20mr28750498edt.61.1605785758097; 
 Thu, 19 Nov 2020 03:35:58 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
 by smtp.gmail.com with ESMTPSA id z2sm14968092edr.47.2020.11.19.03.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 03:35:57 -0800 (PST)
Subject: Re: [PATCH] drm/vboxvideo: Unmap iomem on probe-failure and remove
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
References: <20201027135153.324873-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <f6b034c3-ef86-7214-f65e-af93b78bd456@redhat.com>
Date: Thu, 19 Nov 2020 12:35:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201027135153.324873-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/27/20 2:51 PM, Hans de Goede wrote:
> Add missing pci_iounmap() calls to properly unmap the memory on
> probe-failure and remove.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

For some reason the spam-filter used by Red Hat's email system has eaten
Daniel Vetter's reply to this, so let me copy and paste that from patchwork:

Daniel Vetter wrote:

> I think switching over to devm would be really nice. And for pci all
> you need to do is use pcim_enable_device and delete all the cleanup
> code, and it's all done. Hand rolling device cleanup code really isn't
> a great idea and way too error-prone. Plus you're using lots of devm_
> already.

Good point, so I just checked and the vboxvideo code is already
using pcim_enable_device() so it looks like this is a false-positive
from the lkp@intel.com bot, and Dan Carpenter missed that pcim_enable_device()
makes all subsequent pci-resource acquiring calls behave like devm calls,
when he forwarded the report to me.

Tl;DR: there is no bug / leak and this patch can be dropped.

Is there a place where I can report a bug against the lkp@intel.com bot
for this false-positive ?

Regards,

Hans




> ---
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index d68d9bad7674..2eeb1d3be54a 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -71,6 +71,8 @@ static void vbox_accel_fini(struct vbox_private *vbox)
>  
>  	for (i = 0; i < vbox->num_crtcs; ++i)
>  		vbva_disable(&vbox->vbva_info[i], vbox->guest_pool, i);
> +
> +	pci_iounmap(vbox->ddev.pdev, vbox->vbva_buffers);
>  }
>  
>  /* Do we support the 4.3 plus mode hint reporting interface? */
> @@ -124,19 +126,19 @@ int vbox_hw_init(struct vbox_private *vbox)
>  	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
>  						"vboxvideo-accel");
>  	if (!vbox->guest_pool)
> -		return -ENOMEM;
> +		goto out_unmap_guest_heap;
>  
>  	ret = gen_pool_add_virt(vbox->guest_pool,
>  				(unsigned long)vbox->guest_heap,
>  				GUEST_HEAP_OFFSET(vbox),
>  				GUEST_HEAP_USABLE_SIZE, -1);
>  	if (ret)
> -		return ret;
> +		goto out_unmap_guest_heap;
>  
>  	ret = hgsmi_test_query_conf(vbox->guest_pool);
>  	if (ret) {
>  		DRM_ERROR("vboxvideo: hgsmi_test_query_conf failed\n");
> -		return ret;
> +		goto out_unmap_guest_heap;
>  	}
>  
>  	/* Reduce available VRAM size to reflect the guest heap. */
> @@ -148,23 +150,30 @@ int vbox_hw_init(struct vbox_private *vbox)
>  
>  	if (!have_hgsmi_mode_hints(vbox)) {
>  		ret = -ENOTSUPP;
> -		return ret;
> +		goto out_unmap_guest_heap;
>  	}
>  
>  	vbox->last_mode_hints = devm_kcalloc(vbox->ddev.dev, vbox->num_crtcs,
>  					     sizeof(struct vbva_modehint),
>  					     GFP_KERNEL);
> -	if (!vbox->last_mode_hints)
> -		return -ENOMEM;
> +	if (!vbox->last_mode_hints) {
> +		ret = -ENOMEM;
> +		goto out_unmap_guest_heap;
> +	}
>  
>  	ret = vbox_accel_init(vbox);
>  	if (ret)
> -		return ret;
> +		goto out_unmap_guest_heap;
>  
>  	return 0;
> +
> +out_unmap_guest_heap:
> +	pci_iounmap(vbox->ddev.pdev, vbox->guest_pool);
> +	return ret;
>  }
>  
>  void vbox_hw_fini(struct vbox_private *vbox)
>  {
>  	vbox_accel_fini(vbox);
> +	pci_iounmap(vbox->ddev.pdev, vbox->guest_pool);
>  }
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
